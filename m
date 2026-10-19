Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440630;
	b=q3mBNnaoKS6c3li6hIPFINOTzyjJ82r821qt8upibNXIT3BqSsEjMg740xZYz/sKaPps
	 h/O3TIgsgFMyc92hPYj0lMLY7EdkTc1dt/Mhz+HJZI6wwXdzJAOIv+EUiGL1pHSZPiZ7p
	 YIcPHYuhqcJz42vyPOttofSGXoq602D09wwW4uYReXXKDvuWm4iVYon3Z5qlKss+fHQJ/
	 eI5QPP49/Id6USnPpDUF/rUDmosh93GMPXby23X2ZpkNwNpB4xQmtn5qf6au/zxdFxBqT
	 rw6tYPOsf2wu3LUjrvZgV55yFuKRB5qCK2TjWWNMYUu5JWCECJD4NGo4jnbxc4JrrAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440630;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=BVwu0zGEH0/TN5lnCQrb8LUaYg21LYYId0LnB698nU8=;
	b=xfL13KsOzs0Qy9O6J+w5q+1PkW2/RbBzDcfV2EP0Wx3aMMzULvCxuva8Vi8iMlRnaA8J
	 LTspKv1zbpivw8M2ldqD78Iiu5mfKYQfZOn29OxUj1KOenWI76OHmRMmRTHmLjt9ZSzjc
	 ojIPBDziJpakwHOL2T2ruM4kWCoGnnv0/9Oc2yErGwXjDAkKd3MCYaZSSwW8QGf1+PzXZ
	 6nRBUR3BHnb5CgwL0WTftd5Q/HGzRwNJ5uu3qi+82bghRjtmYq4BS9UBE9SVtohTPxVo7
	 z9+XQwdwRfWMAUEbJbfwZpfNSK4hGQrriSrFKUNHXABgMx9/WIl8HuqRWaZvULa056w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EXMRCviC;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4FE606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4FE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EXMRCviC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9C58DC5CD5C;
	Mon, 19 Oct 2026 20:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B20160582;
	Mon, 19 Oct 2026 20:10:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F72C10328C22;
	Mon, 19 Oct 2026 22:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BVwu0zGEH0/TN5lnCQrb8LUaYg21LYYId0LnB698nU8=;
	b=EXMRCviCklnOjnqoZRCVUMZXw5pVoRsryS6ybXaQiO9uSmEUhsW6+j3LG2OPiuUnGVDyn/
	HwTKQUtsqdGjGrj0VPFehQ9dWp4/jpTYnWoqPH6g9FlXhrtpYRhMSqvekHGXq8imvaNYzw
	CuCgauxmavb2G9sCg8NmdT4TCN07HxM6cFO7maDY4/Z6HNrmLNaBfVKwslOcIMNWoh3pPi
	Je+gLyBTyFj5h6KrNX8Afxr8Ay1gEbB9nbDhIhsMb8Pk0WSI8pngmV23vs0vfWNxNm3Z4l
	UQrAqES0kjpIIby8A8mKCEi68br1S3m+ePXDdZ/0c3cXkQ3IqVB6l1YrGd53wQ==
Date: Mon, 19 Oct 2026 22:10:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Gregory Price <gourry@gourry.net>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, rui.zhang@intel.com
Subject: Re: [RESEND PATCH 0/2] rtc: cmos: Fix ACPI RTC alarm handling
Message-ID: <179244056610.104236.1471257559903305892.b4-ty@b4>
References: <20261015173029.3091872-1-gourry@gourry.net>
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
In-Reply-To: <20261015173029.3091872-1-gourry@gourry.net>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 15 Oct 2026 13:30:27 -0400, Gregory Price wrote:
> Resend of the series first posted on September 9.
> https://lore.kernel.org/linux-rtc/20260909225132.1392883-1-gourry@gourry.net/
> 
> RTC update interrupt emulation can stop delivering events when rtc-cmos
> uses the ACPI RTC fixed event. On an affected system, a test that waits
> for five one-second update events completed only 40 of 50 runs. The ACPI
> ff_rt_clk counter stopped at 218, exactly matching the number of events
> delivered to userspace, with the event status set but delivery disabled.
> 
> [...]

Applied, thanks!

[1/2] rtc: cmos: Disable ACPI RTC event before handling it
      https://git.kernel.org/abelloni/c/3f67038df8b5
[2/2] rtc: cmos: Honor explicit use_acpi_alarm parameter value
      https://git.kernel.org/abelloni/c/3c7acb209e1d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
