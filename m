Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566840;
	b=QbV/cjBHIeV2oJpa5ExxDcPJ1Ualv59TLpNdbs1Nw7bIYEhaxS38tSb1HhZ6IEe7ai2g
	 qeRIf1gbZkjpI/KPeMIrf30crjcnKmvOD7YeXQmy0lZRjnsX8+MoKwjyk7E/WwnPVRLo8
	 /SQG0yYFnr0puKeHl4nu9/jLvodNchZzLINfn9e2toL6abbqzgegJrU9GMOCwVBWG56jW
	 72o0OJrDZg0Q5rESNgTNcQyEI6Jid7E67Bvj/hwFftFBGazbz+jCmFWMHFb6urDb3+cH3
	 Hjc2hEN/GXGSg7JcLrR3LZ33E9Y7YwrKg/ilVuFGYSmwPxuFh63qRTBD20V/6B4YBMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566840;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=BWwjQzcNdHdkRB5j/U4h6P+LV+nTL5ji/UH06kwPew0=;
	b=tRf3jovIA18NDXqVtrUnfv5ywGJ0osZDqYrKaCv9Z2D69uMX7643liAR72DLSeSiDE9h
	 3N/WgiKYzSvTK4viNga/mLv0h6e9VLiXHmVd29Zf4mT3wBUI1QYOxrbuqzANSQF0HLujH
	 h7wchhS0tUf4hTw6IuJiqirAKh8QJ33zmhdQRzATiTu1DO+iAfEI6oLUXOfaCGvaa0+7F
	 w+vc7soa6m+CPhSZdZESTxk3PHYOz+TGwkESQqQw/7d3/4og137rz7C9uGU0Lr1ryYPT/
	 ddinZ2/EFOF3Lr74VdcTsU8uwqd3Q7p9ZQxYneKiuHGg5+YotULKPeCW5suJah3BIaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0ovLg2Nr;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C617D606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C617D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0ovLg2Nr
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0FBA14E4125C;
	Wed, 21 Oct 2026 07:13:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEB2B606E3;
	Wed, 21 Oct 2026 07:13:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3306310328D20;
	Wed, 21 Oct 2026 09:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792566834; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BWwjQzcNdHdkRB5j/U4h6P+LV+nTL5ji/UH06kwPew0=;
	b=0ovLg2Nr8xmCZ0LDSoNViWsGYL3O1202DVoW2TUVpZYdWbSdLaVVsDFMM0MDevQ/07q6ZT
	bF2k/6WOQZsEwQX5p0FD+37dL/dauwCXK/0O4O20UR192LPY3RHdV8+kqKFyd2oAjvw1cX
	SzjYKnsHSCaRnUY6ngRYU2Stz+URQDSX1pz63PtStS5R4zGQA63miLGq0PUOyFyRr98a/5
	2tU9ULZ0wgk2tbPqU2H/lV/xc2c1vuZikq81wkAehZ/vtjru7QF10KNqQuU4QusQMt4U6x
	x3KcCtLQBdp8RpvzuSlwPUoJ7GzNLOjbm+L8p7ohapDXirHbVCLLaUxxNwfliw==
Date: Wed, 21 Oct 2026 09:13:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akashdeep Kaur <a-kaur@ti.com>
Cc: praneeth@ti.com, nm@ti.com, vigneshr@ti.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, sebin.francis@ti.com,
	s-tripathi1@ti.com, vishalm@ti.com, k-willis@ti.com
Subject: Re: [PATCH 0/2] rtc: Prevent hctosys from using invalid RTC time
Message-ID: <202610210713515313f800@mail.local>
References: <20261021042435.3895543-1-a-kaur@ti.com>
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
In-Reply-To: <20261021042435.3895543-1-a-kaur@ti.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 21/10/2026 09:54:33+0530, Akashdeep Kaur wrote:
> The kernel's boot-time RTC synchronization blindly trusts the RTC 
> value when setting system time, but RTCs may have invalid time 
> depending on the boot path:
> 
> - On first cold boot: RTC may have lost power, time is invalid
> - After low-power mode (RTC-only) cold boot: RTC retained power, time 
>   is valid
> 
> On normal cold boot where bootloader or NTP has already established 
> correct time, boot-time sync (triggered when RTC driver loads as 
> module or probes at boot) can overwrite it with invalid RTC data, 
> causing time rollback to 1970. However, on boot from RTC-only power 
> mode, the RTC has valid time and boot-time sync should work to 
> restore system time from RTC.
> 
> This series adds a flag that drivers set dynamically per-boot to 
> indicate whether RTC has valid time. Drivers check at probe if RTC 
> retained power through this specific boot. Boot-time sync checks this 
> flag before setting system time. This enables correct behavior for 
> both boot paths while keeping PM suspend/resume compensation 
> unaffected.

The proper way to do this is to return -EINVAL in read_time until you
know the date is correct. There is no need for an extra flag for the core.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
