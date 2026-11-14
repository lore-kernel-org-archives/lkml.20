Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626781;
	b=p1weMzF+wiGVsxdHEF0IG36mXIBN2gPPgfYCCXlCeTZTWwXmOKLcDPzi6le9hQDnG2MT
	 a8bn2jOLxqFfI3JjpwOYzHBRZ/sD/AwUnRsAyG2kBTRQdtRD+XxZkeJIdlk8uz+pEOMdz
	 ff80/la4TXaYII4HOy6DkNUGGoFX3XjmQbQBwekIj3l8R73xSTw9vXpW0wPjL9tyKK7db
	 /UmvE+lv6JCjvsLN5m7IC+nYC0OqaJd2YBrn4lHh6EyT1EpXVCqY9gLqEFdzPzcrMZuEf
	 LbHeT73knHvQCk0GowHWEwCThmlkPdfI+Rlmddt7u12WUA8+IofFKcZIPDtG+C4Jxiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626781;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=;
	b=qQ+yBMOzs7/T4vtWBPrF9b30Qvw0cfbRa0l+cfzv8o3+cbfxqC8yRV+4khWSd6MyCWI1
	 g3qofOrQ8G0uTxIMJkgvDX5BSoxhD+nDaCsCxbVah8Yw1F8j0YP9hxOSuHPjAFWmAJ52W
	 +BWHzcTaBv+7zZlfVLnETAp2R8XRoHhukTMKUPhxw1Wf3SpcuHqTLvC2+6v/HLjvGXbzg
	 TKVNSTQkLWjR1jGVOV4//Xk+PItkhG+Wdfg7b6N9dWbBw8oryhNUjDxRCz7MFtdpPMnc9
	 jtFFzeYWwxpLnzW6BV7+SxpGf3qC0Fqqa+pir3hrtmgwfM05U4on04X74dAtSdgWBzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NEiDPlUr;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A2D606A882
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A2D606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NEiDPlUr
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso853395a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626780; x=1795231580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=;
        b=PssdYdzLxJga6eFQTb4xfvsPn8rRni2axQPjtpgL2dDBI8Ynd0tt+TgFQqtqWtGEKs
         +r+eR68a6izIFx9LB5NUDPCFpN5yASCA4k9sxJLBcZbuN2hektyi/1Q75Xa9eM4x4mTx
         q9Ck80jNVPq/RCJHmBbeGRmaIBWaAC6zOUhyYdoDgmv4lRdRkT/e1oeINV9A4ItuxudO
         vV7eyosmskOhTKr3d3Ol060aO77kOB9Ff/s0NvZwdmFWolR/YeV9whRVTeTeJovtLpbI
         DDeO1VyTnNrMdEHsOBfErUrbdLzqFS0TNxCWjKYm8uCb8n24xhNUBSOrCLVc1VYdGh1j
         P9SQ==
X-Forwarded-Encrypted: i=1; AL+hErG88jKB4WbrlL8dkZucSv/K3Fg/7EavGr5sLwCPi499kbB83KEXJky9AmmzA3o6o1QCs9gZbKXKCgQd3zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h5ZjH5T3R8zff9ASfjmIljtBXVRWmiNP7QTYkl4ht1EWLtLGA
	jIf8PV+ifJiT7uFcKA68k43WuVblQgUx29fCoO4pVrEmNjTVUGiaHzB5SQIEq2dMKe70wr7Ppqm
	8S6fJGlNwL6KOsV4Fal5Zkp6F4zqB7XgnWRdUBva0aWeVwNvx6hIOOpiZUNZ8zpTYZw87BW5bgk
	snj2iKsBSFDEywokjuUXmDp9t/i2cxULGqOIFbbqsPxFYfItVjGqY2T6Wvm2aDacQWk0vfgnkMW
	75jruJ2WglFPzsvanQ7DEc6
X-Gm-Gg: AYBFou2pw3XsgoBbwr/3XRRkU51yKuHfpAWcdijIrijwaIps/2GsMw8Va3HuN4ywknA
	NH3SKOlMMRshyW8zeQOQO37cOAecjR2uX69hjAX979pf7KjOsqoyMNFzzDf9du/C1QmjN4/O2zM
	OTEsUSqbLcs2ZGQWNO1Mi2l412nHWm8Sk3sclocnDVLvA6rZN8EuFNNx36GpTG08k8u9+A91UG3
	5OpGzTcySW+ep28Zw5wqPZ9x/KjDLJQfI9/dI7MqFFyZOR0gsNLy/mrtVqaAnXC6ZYZN82tIZGE
	SXL1YusI9La3ZlkyOPypUNEcqn0MFy4EU8gid2L0Ci3VRNh1127oZ2EaDT/UBUFMkUyLO1TjHsc
	CYqLzrKRL36TvcStc4ZZ2bw9ndBWbB9ACo4nDQ492euGr4NSQeMTKoIRR9fPo1UkyGpSKZvbgrm
	IXxboE3O6tBk8nrrky98R1D5lS43Aq+C4wPHpmKAYQ
X-Received: by 2002:a17:90b:584b:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b1b0ccefabmr4069922a91.66.1794626780492;
        Fri, 13 Nov 2026 19:26:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae81cfa5sm6101267a91.0.2026.11.13.19.26.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2070476eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626778; x=1795231578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=;
        b=NEiDPlUrW5CXC+wl3oI1nbnz0QDGSTKwZemkNoH47Cr6+piZAwSMF5IY2+gAw24u16
         n9P8gaFPbAW4BLDwZqVIf3+fGXfdOXkMQ/maBGh7HgrUXveAWI3M7MTvetKMeGm+HDcr
         i7Ubd6PZ9/H8uekjiClLJuW8Ejr6VRdrjDj2c=
X-Forwarded-Encrypted: i=1; AL+hErFseoZZljOleR4EZMfaqb4IBsQBKBCo8ZBMhjmKOTJ5KgVUpOIDpA02pquXmwkkjXq5r3cCtTTmPWX/sFA=@vger.kernel.org
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626095eec.21.1794626777524;
        Fri, 13 Nov 2026 19:26:17 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626066eec.21.1794626776854;
        Fri, 13 Nov 2026 19:26:16 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm11863608eec.0.2026.11.13.19.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:16 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 08/11] platform/raspberrypi: vchiq-mmal: Move headers to include/linux
Date: Fri, 13 Nov 2026 19:26:14 -0800
Message-ID: <20261114032614.873772-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-8-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-8-d25e3b687e71@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Nov 2026 16:48:06 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Now that VCHIQ interface is destaged, different drivers (like ISP or
> codec) no longer live under the same tree as VCHIQ-MMAL, but in their
> relevant trees like media or audio.
> 
> Enable access to the MMAL headers for such drivers by moving them under
> include/linux/raspberrypi with other VCHIQ headers.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
