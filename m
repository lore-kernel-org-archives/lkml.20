Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794557151;
	b=4ar5sjW1rujW81D+LHjnBF2jPQVk9zZ3rEXgEc5XUiIbj/v3dVxZfbZd3FC4xoBTegx/
	 iE0w5vvuMJ0iguPpZXKFT0SGKIzMR4zxswJUuxKktn3dJGDWNpUPgflyUxArDKUmQrfdJ
	 4OG1hKRtmAVP2Y3wdwSzI1M4CEx4yqSVvakj7lOzDYIh0vhbMG104Gc+Yx9fROaKbF6AO
	 Acmq63RlTyMr3tZFACeVVIHGbU8MhmrLWFiTNSFoKWJKpZVQ25GRCKxqc9YrXTwxAwIMX
	 RlFlOQzqONIbqbctHLbqd3xivZ0+ZUsb7f81NHYnhZTDt7UCORqJyMFJUmtuhJdA/xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oqtjBd2wESHyMO5oAovp1QSWx1cXP9Xallbgkc48A7Y=;
	b=ehrEInLcfg6hV/ztdhRGRebp1KwCDgZEvof4EHdtD+ejQndB9dCHk0xTGAwDejqxcJHD
	 3vyxgCUcMBgQWPRTvGzYRbQmuZ6zVdPEtf1SFKF6QnMqVcafH032t23u8yeNJqninxWJk
	 FD0E80HnWPwlBsIMrQvpCcHCA5EDvsO0SlSh87I2HtNcYWhlEgnUoIZ5kvwKRZonhkWyD
	 KgQAcezryaGyEAcud5g7AREBmhSicX5wFYJfa960DaiLkju4kSlQjkyZGUHHNQ3mQwRC9
	 7YtaWKKmwD7dz77XNqDOkqsK4sypcn4Qxk1+vdaKcYTtLcOwVmwN9rHW5bX2z7dUIFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHl5FeOi;
	arc=fail smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1DC606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1DC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHl5FeOi
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4716d76fso79394e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557149; cv=none;
        d=google.com; s=arc-20260327;
        b=qqITeCPplr4Vn/3+VZF4yk4U+bIV0Qn5+m24gRfVHkmlMx/w13n92fFBvHDWLvxPkh
         aeDrg2h1FuZBbk82P7rzyYKCdgAPeX9FSsVR8h0eD9xy8Owd+NACyET8z1LTP9tt8lyp
         KOz7byYPSVZQwkuXIcENdYeZiwks4V0EzPIxIHgGFr589FA+Skst09Uh6T0eWMNjb/V+
         vw4SoFSCzHGigGGAc9trWy+FuBEhkx/rLhYzfHQB2CZBiKMT4HnQSrS0tTddVCKyBSK3
         yMaIBMh1zVHdz92QyKgtUItRdqT9ZGXvW8+z4IzNbrecEZI0vedIgcl8r/L9ZRY9FptH
         Yu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oqtjBd2wESHyMO5oAovp1QSWx1cXP9Xallbgkc48A7Y=;
        fh=LYuFtnqH/7ziBLfz0BQwRo2TX8MxbducgPzHjvwumis=;
        b=TGryAY8tnTrtpyaZPwBUSUnpkxHXGB+eWq7NFwUEqAuU0pTPRnWlASahd8azaKNIBh
         jX+U8lOwoQm1lo19aKazxLGqSFz+zx5HW3Cko6/sn2eLFMp7OIEbT4dUcb13IAUGHX6c
         fAUGWTz8CQNhZJT1+SlJBV6KNr4nfL9TdQRkDmQK7nyjJwTnQKpw1GOD+/FJgn6OQ72P
         9bODu4YZAaPTouAG5QFTeXqJJX9rgN9+ztM4XeoWFVwZt5/iwqgr6eAnO7e6ywvyDqgZ
         1cFJndBYaTf18Im7xWpAo4Li38curIN+asQbam2A0/kGsnCeb9KYa4PsykJiDMPc5+Dy
         LGWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557149; x=1795161949; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqtjBd2wESHyMO5oAovp1QSWx1cXP9Xallbgkc48A7Y=;
        b=FHl5FeOijEJd+VdBtfrSXvIzf5TZ/XUmT4e+4SdIe4MSTR84j8yWGY07hR712hVUSz
         S3NWvU13WGbrjZo/yvud+wVPiRXHNSuhv0WsTXzx5Z9an4bjC+k0usNYURpdj2lMahRl
         gnsrpehRXhWm9KcEMxopNQ2yrhrPdimZesOW5j4U14jAJr47b6/72C+5zIwK2caWbZj/
         s91BmOR6K90dlVXLYweHA3CeDFFXSEbsYN7XjtTEU9sFZ/FTnjCPHmaBFhDfqjymwytI
         R1YteHu3cP9OP1lpbg5OTTNXcc6E5j+R8BHkxQmaO3OvQOtu+KumIURAWjpN8KwyKijp
         AQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557149; x=1795161949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oqtjBd2wESHyMO5oAovp1QSWx1cXP9Xallbgkc48A7Y=;
        b=uAszDe5mbY49DmtBXce22FXwAzTFV+LKWxhWLZziYwzyduzjJhDKgXjf/hm1BLktnE
         in5ts5CgHzQ2uVipd+dDlE/BskZKnPFEiGKTCENg5zm9g9z5DSdjtcLo7XfkojPTJTVD
         hEiCXj4k7QyMTly8G5zgkhypgVK86a2RVtFAywehIg14sJo3U943eDsKbaEn9JkXl49B
         68jBinH6nAH6nyjxcxYDIOUZ1pisLKORzFatduGdLhJ72My1BMJA97jmlp3r7t0NPnqp
         d5mwcSqalrl0Ap1h4b/PZp2yYldkfKhY/aMtIXeKFiUnk9c4YSNUkAGbsFj2Vf5KKNJr
         gzdA==
X-Forwarded-Encrypted: i=1; AL+hErFCDFw8M4XmxOP+E+uT3CYRVH7oXIPlPhY1ghxEanLAFgMi/WdcenuF/+GIAa1ukIJv/rNZR0doXyFBMXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yxouy8Ug0U+uHkWLgMTppG03Tnc36TkeRn2lS/WVIFiEnLs/n
	MbDqtzFsQFitjbHPCQGtxDHjFz9N3Ug25B8Th2VwiCKIKM0p7TCvGxAfmpesvuyk70MNFbNMaIE
	mtnRI33JBCNLSibkDn37DOMPo1IZjnW4=
X-Gm-Gg: AYBFou3EjNZSD5/hmCRCI7IiW3YFIo/ZvYZJNti/Dp7+WoVGUtEaRk/spMWhb3nNP8C
	PlfPagbQ/TpvuDuiMFxDoUbn0HwkgGN4Od850TCgYYKPeOv/AnkTQFe29Q95GoWtHPDPUo3Qp1P
	junDI3HIxEffbG+dqv148ToeBVa3/M0kipcIYKhgOdHLhlBe+9jagcD31TtGv7gMIFYYz8s8mWx
	G+8codXfgAhEixFhMcQBHIs37kGU7njcKT/dXAS8jlKKhvF3YW1mdjXro57MQPMcpAvpBPowWmb
	BKmg+H+AgWG1nEff7bl1Mts92X9Omm4P+PUbqMqWWvivwSYkuzJL9UyaaVL6gJli6jyMt1PUOgO
	bpKlJKDqujouAtial9ODIYxcxmpjEdDOZWdfA9I6NUZddfymBah2L3xWrigMK59yM0kPpb/c=
X-Received: by 2002:a05:6512:402a:b0:5bf:b65b:8598 with SMTP id
 2adb3069b0e04-5c1709b1f34mr794456e87.3.1794557149007; Fri, 13 Nov 2026
 00:05:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-iommu-probe-race-v1-1-8c0b986b7e6e@gmail.com>
 <CAEy9hNXRwH9qD-=Gj3NiY=ZVrVq02hAj0dPU+o8YfEmCcbSdNg@mail.gmail.com> <472df1c1-e1fb-454a-96bf-4a01dcd383aa@arm.com>
In-Reply-To: <472df1c1-e1fb-454a-96bf-4a01dcd383aa@arm.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:05:35 -0800
X-Gm-Features: AclHuK_Zihm1Bupd39qxey-TRk2fUNcW0Um962FEVnw_RYjI9CzqXZG7YgfHzoU
Message-ID: <CAEy9hNUW+o_6jN8=7RB7e-6afyiZOzLZ9DQpFOKTQCoPfvDD9w@mail.gmail.com>
Subject: Re: [PATCH] iommu: Don't let a driver bind while bus_iommu_probe()
 still probes its device
To: Robin Murphy <robin.murphy@arm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [...] What we could really do
> with - which might now be viable with the recent atomic device flags -
> is a specific indicator that a device has got far enough into binding a
> driver to be past the point of waiting or an IOMMU. The
> BUS_NOTIFY_BIND_DRIVER call is in fact in more or less the right place
> for that, so we could potentially do the flag management from
> iommu_bus_notifier() rather than clutter up the driver core with yet
> more hooks, but the flag itself can't be in dev->iommu [...]

Thanks, that makes sense. v2 will add a device flag that
iommu_bus_notifier() sets on BIND_DRIVER and clears on
DRIVER_NOT_BOUND and UNBOUND_DRIVER, and test it instead of
dev->driver.

The flag alone doesn't keep the binder out, though. Its dma_configure
runs before BIND_DRIVER, and while the replay has dropped the lock it
finds the replay's dev->iommu or fwspec and goes on to probe. So I'd
also defer the binder in of_iommu_configure() and
acpi_iommu_configure_id() while a replay runs, using a separate "probe
in progress" mark in dev->iommu that is set only during the replay.

Does that match what you have in mind?

Arun
