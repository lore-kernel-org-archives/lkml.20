Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28BF472F7D;
	Tue, 13 Oct 2026 04:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865483; cv=none; b=DvaQUfsU3/5qzWixUEHclIvIXfqre6ZWwrX9pxBWMbDZRY1GO2m38/0f0j5io4AKvgwd+LsZLSJYzHF9LHmAassrHdrJXyYRTCMp1UiclnAXy/zKD9wlkF23Fh51wQajp/+WCLjwKTfW0zQcSV4gdcKybTIB/ScG6RH/NeBwd8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865483; c=relaxed/simple;
	bh=Bs5trV3bNeEPVBakBcUSCHpoCF1AkNNvEW0tsXLSnTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqSjz6ClMxTwRLxe98gDcabN04oWF+CQJp2jhlU7yIvwd8ko6pBz+u2YIWytRz/QkNddkRAA0MzUi+WIf/mI8hUsKlhaEMkaCUIr51F9YK7Py2vtY4Sx2jLD33cisCnCS9XhrT2QtdkSgcck026WQCZU4pRtv8JmSm8RKlGT+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcF/fZfN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcF/fZfN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949941F000FF;
	Tue, 13 Oct 2026 04:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791865482;
	bh=EtV9IQevklIm2QkVRbN60Dsqx/C1lrY+0U98O6uHjuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UcF/fZfNq7hwjW8aHme8twhDg2HiYu0Omgm0cLElhymOOT/2KJCybekxNeMTi5eMD
	 G7ZknDqrpZ5eq4xfFWNJF6+87FR9tAv1hEmwWCNwxyIh7xzlARvnf8UA1/xpwMlSlI
	 1bzgpkJ5K0ar9+YbBleg47bTz2qAsPH691JtJDrf4gChLIbDZ+tB2tSZdhjkVKjKIo
	 tdoCuaN8WSAIzSrwHFEAWlFG/BoUgJAKrkbjGGX0kNfjkY866ecgOJs6YIyBE8b78A
	 GZPLl/8Jh9sM+zCZNRUFwREb3yX+8tG5GKy5w4d632DSZRe9D1SbyFAqNKbpew7sM4
	 DcW6BC2IEalnw==
Date: Mon, 12 Oct 2026 21:24:42 -0700
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <202610122124.08E058768D@keescook>
References: <20261009083137.3-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009083137.3-1-sashal@kernel.org>

On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> The Maintainers Summit reached consensus to deprecate the Assisted-by
> tag. Remove the documentation requiring it.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Yup, it has become as redundant as specifying what editor I use. ;)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
