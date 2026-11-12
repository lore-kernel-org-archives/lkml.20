Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503447;
	b=2YhFkEWvuQ3S9554GAEVj1CXqWRkifNWQAJupPlRLJoa5dvvBwP5jXzkEHcEMhMkROmS
	 3w9jhvdd3RwI0MZ09l7yewa5xDMTN2uDwb2KeO/fwrUwsb+jJqg/J2HjFnhAhWbH/2S51
	 bT5N0NgDaB4b8aclCrGZD9906mC5jHhGiFBp2HGVOkMGgpG5R37Eh0s4kUTy4rsXgCcGu
	 /ZIS5RYFKiS15rnQ1l/TFOeON1iSMqbOl9NoVr5cyX0B7hNKm57iMx4fpGOy/Ql9Envl1
	 CB53wvdsp3oY2g+jmPPFk6GaI+VQF5+EY5nioV1Mnmh6iN4n6HJkpI4LL4tgHMggt6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503447;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LRHO5lmdhVp8ikZ9+SxeuhVOjOelared/N/6wvFgJ7Q=;
	b=UX+OyzY28fKMHSAGneJ8NNOM0kCqtjDHcKskDixBdEiUDEwxJ0VaZbVwQ79hUkypy6RQ
	 A21+uoJtS8xL9uhg6oNc7SD5s3mxqHrYEejHMeo5hU7yoB4guZxUnZtglPMyvmaBhNeWh
	 9aV+7yObTMu6kNJ93It2GJfzw6c4kOtD/7EpBBUTztEc5icJ3SDZdk8JZj77G8fn/02qf
	 TCGi2JPBpkcqJqa/milyIGhNUfIpyXR6Qguzc7OydIGFAbxxGhOn3Sd+9N+NYpeHAb5G9
	 m0efFtQAkRNXJrq5UGQNcmXSp68+72e5YRcTBWrO4LoYU1sYbO9clUJ1m6VMpHgu6Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=X7i4vWnS;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5862606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5862606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=X7i4vWnS
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18BC11516;
	Thu, 12 Nov 2026 09:10:43 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C4113F632;
	Thu, 12 Nov 2026 09:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503446; bh=GXl24yWWtZO9v/KHQgClTSYkqQLlBzrjLfrp8Pe0W0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7i4vWnSoc312bqGeIF8SzhZ2FHjBr8SOrqg8v+VNd8eNeMjmJjOoUDoWUBobe/P2
	 YOCSxGgV0fpPgUQoreaKJP0wE1RbBGGniEKgB8lr0iXGpR3CW9m5RU7Qek0XslN4Yb
	 nLAPwI/58VBTo+bZ6+IBbNjHK8BR0zV9KSlwVXfc=
Date: Thu, 12 Nov 2026 17:10:43 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
Message-ID: <20261112171043.GK9176@e132581.arm.com>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>

On Fri, Oct 16, 2026 at 11:46:11AM +0100, James Clark wrote:

> +static enum cscfg_load_ops cscfg_get_state(void)
> +{
> +	return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
> +}

Could we check !cscfg_mgr explicitly in the three functions instead?

Using CSCFG_UNLOAD to represent both "not initialized" and
"cfg unloading" is a bit confusing.

Thanks,
Leo
