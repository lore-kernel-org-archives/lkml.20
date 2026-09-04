Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8B52EEE75
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527271; cv=none; b=UhWuWem4u95laU98oOyvP8Cs5byzTgR8bDhXdKH2A/0YnIfCNmkYFIErFaf86tAnpnPqDxtVHsA+Rpd7i5jpoTVh3NyzGMlxE5FVr/LiWjnOIqvlUk4IQpzvc0zjMlp6px1s3pDnrcR7MD3y8xQr6b6wM9F5vLiUgxszwUmAeVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527271; c=relaxed/simple;
	bh=ZYyUqu6sI7SIz1YOEE/GYSxPypcgV67Hts5SjXKxowM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW06Wyx8MfYB/8pCD1viiXAhx0tpDiJu+z1uLNlB/HnHQMZjghvXPoECKdfY34ncc3G2OAJH5NLP2iJ4gWkplp9uLAA/YjYw27C6M4uQ0oEoX9WDBwW0dLwWvdBMTuVaE6JLRuHsYVGQ52WD6bEhXLh8uDH4ybFKuPnFzWKWgzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Rr+q0YoI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Rr+q0YoI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41216143D;
	Fri,  4 Sep 2026 06:07:45 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85A033F7D8;
	Fri,  4 Sep 2026 06:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788527268; bh=ZYyUqu6sI7SIz1YOEE/GYSxPypcgV67Hts5SjXKxowM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rr+q0YoIBt+QpyYTKmX5JV7AQu5Bf37pokB44mtNlS/6V5Rs91+kUDGSAV6BViYEa
	 q7Vb3tq7ksP1rLUDFlXfMLKaBIlW2cRikHTOnuRgIlAnhLcANmBN9RZBurrzaDQkrn
	 JJbnluZhOIAanD0VFe+lpozUxxBm0KRtCqaeIeCI=
Date: Fri, 4 Sep 2026 14:07:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: tspamiitesh@gmail.com
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typos in
 Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
Message-ID: <20260904130746.GX8904@e132581.arm.com>
References: <20260904041942.150054-1-tspamiitesh@gmail.com_quarantine>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904041942.150054-1-tspamiitesh@gmail.com_quarantine>

On Fri, Sep 04, 2026 at 09:49:42AM +0530, tspamiitesh@gmail.com wrote:

[...]

> -Description:	(RW) Enable/disable tracing on this specific trace entiry.
> +Description:	(RW) Enable/disable tracing on this specific trace entry.
>  		Enabling a source implies the source has been configured
> -		properly and a sink has been identidifed for it.  The path
> +		properly and a sink has been indentified for it.  The path

s/indentified/identified ?
