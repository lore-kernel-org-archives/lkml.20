Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685475218A0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905809; cv=none; b=adcv0Q2G5+2Xo2eQ1XbnCpQybm8p203twsZlCiltqsZE6YZobM5VsfjqZhMgyn5RZOE89kXM3Yec9LceGKcPsYYR6hAN9Cj7nTmx+guXCA3FpVRs2lk7LXgourDX5fHs0oUvtDwLNIkOpVjx90M+Sh0tLKAoSZ9hKO8KYTZROBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905809; c=relaxed/simple;
	bh=Z1LZvg/hjG1enoDhnh6KCuNuinYD0+8oBX6Vpty8ZLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSY7KMgMlntJjeEkzgeak9ARQqc5P7/xTs2eG/qyrb2bOYzkO/FgWbP46awrAOYZ61lH/N9KkY/ksC7nXeq63y9EUchrkGERUc1i7dbbNtXij12d9aUN00e9afklZ+pTXM48S/T0KhtBz0iCghjDXNwX7wtnrSQcGbw0mtVY+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtXcTl3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtXcTl3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9F01F000FF;
	Tue, 13 Oct 2026 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905808;
	bh=dvGvoF3jF00OPQndsebVTsb5JUa89YbbVTVQ3f9+rSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VtXcTl3W31cuzIoBd8khnJwWOcDXy/POHn4FNUW7deRXgOwWdlW3GIV/IUlKz1ZSX
	 uMgdAmCwptp15P+lDev9wGO5VygNEVQNsse7UIFcvlPUi6qbYvLEMikpUpF8sWFqYQ
	 h/KNdRh8M0Q+Z1reY1/Z/jAFsn/PVkqfG6ee/m4TeGwQxkMD4z7LT/SQzGQfBy+/OK
	 ZpaK4FKCzSiJ9AMGUJ5vrrXmHoWIiQ2Jdf/hTdbm2f+7mZb30jkDde5EP7c6osFu+a
	 6jlbJa7fvCY8aVT8q7AUtTUef+TI/u/q3K8Awmh9ItkHrnvhU1sIKSbxNo1a2uFUhj
	 cVx5o2BzTYL3A==
Date: Tue, 13 Oct 2026 09:36:46 -0600
From: Keith Busch <kbusch@kernel.org>
To: Krishna Iyer <kiyer@crusoe.ai>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com, hare@suse.de, saravanand@crusoe.ai,
	sjpark@crusoe.ai, Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH v5 1/2] nvme-multipath: fix path state evaluation for
 failfast and ANA
Message-ID: <as5QDrAp7srZgWwk@kbusch-mbp>
References: <20261008141407.22992-1-kiyer@crusoe.ai>
 <20261008141407.22992-2-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008141407.22992-2-kiyer@crusoe.ai>

On Thu, Oct 08, 2026 at 07:14:06AM -0700, Krishna Iyer wrote:
> nvme_available_path() has two problems that keep I/O queued when it
> should be failed:
> 
> 1. When fast_io_fail_tmo expires, NVME_CTRL_FAILFAST_EXPIRED is set and
>    the path is skipped, but the function still falls through to
>    nvme_mpath_queue_if_no_path(). If delayed_removal_secs is configured
>    the I/O is requeued indefinitely, defeating fast_io_fail_tmo. Only
>    fall through to queue_if_no_path when there really are no paths;
>    if a path exists but its failfast timer has expired, fail instead.
> 
> 2. A LIVE controller counts as a usable path regardless of the namespace
>    ANA state. A path whose ANA state is inaccessible or persistent-loss
>    cannot serve I/O, so it should not count as available. ANA change is
>    transient and bounded by ANATT, so keep queueing while it resolves.
> 
> Also kick the requeue work from nvme_update_ns_ana_state() when a path
> does not transition to live, so parked I/O is re-evaluated when an ANA
> transition leaves the namespace inaccessible.
> 
> Move nvme_state_is_live() above nvme_available_path() so it can be used
> there.

Thanks, applied to nvme-7.4.
