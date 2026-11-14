Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626129;
	b=ikRW6tH0ENrwbwFnmnq1lTrA1UJcMEb/D/yP6Df5hX8AdNm++YK0mPIPGKr5AsxqNOcQ
	 RUinFYk9uspmyYeLU6IJ8AKTAam2myoszIHlx1nUC0BhN4lvIZVjjFxVRf8Wq2oEWV6Fu
	 uz1ZCW9U7Ew68YqEfFdAGGbuILJ4nxvqdNCiNoGGvjyIvtMm3HJANmxefubl2TyhdXYgB
	 12X5K0pvq0D46oyVe/3Ap90OFdBwXzJTiB/BUpQWwS9zU3CnFlxap+2JPCOYzG1QB0zdW
	 /YVHPGQsuaaaC6hYjgcydHHBG9sKXceAzaFSp1eM9CjGEGgQVGXfD15XnsTd6b9t9ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626129;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1ADXgRDEmtJTI6BRLdXJRmKIrZ9FU+mVSFJb8701l5g=;
	b=3f8IAzoEFiJrmaR6HSL6eJ+DrHaoYCdMtkm4IBLzGR6d3Uk9JLxypuR1BALYYVFXjp9I
	 pZ2xKAHtOar2OnYF1KjhqXWplupwcmLRt2AjeBUeIDnRVd5ofT6EL25TD/H5a2SM8MCbx
	 ZMQWUXpxgaz4bn56sSyq3BuPRW8WAYabHp7AJu+rzDZNe67GUq+Aq8GPh5f9LfH0DqClo
	 SdYnD6+FCYUuRsGWj9prp1xb23HRDB9GLOWrMABHarDU32AS+NPjznFwa8eufPqbf+GsG
	 fCOmUfaBL5Es5uEVL+J4D0QmmX9SDyYLulRyuCln0V1rYGNPc4vAqqb6BpLeCdeC5Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ydx0uO5W;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B535606A8A0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B535606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ydx0uO5W
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so601895a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626127; x=1795230927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ADXgRDEmtJTI6BRLdXJRmKIrZ9FU+mVSFJb8701l5g=;
        b=UocjbSOKYGEUCT+zVlwVeAL65sLBmEXK4ZfyITlDlr/8tVU8NfcXuMcScxpLbo93V8
         Bi/L06suqyTm/d7kDPhqScIEDcgK5DJcDE+sYeB0H6mjXEctNz8mdFC6P93IYS0Yv64w
         5Yakr31CHnqMvRCwWxlAcpG0Qf+p6I9Q8+Yl3ZD/KS0Uu5uyGWUjPQm+h1WRcppgAYc6
         6b3koykI8fxuqu97oWgtc7Zp6wS9IbATTl6F89N1RpWHj9S+I4ThbttcgzPFYcBajlOG
         0oGgDBCK0yIEiWI4Q6eRtSn3NNzzY8Is1A7+5Q6QQS+Qe3m5S8l4a1WCfH2tq0Kfj8vQ
         PHlw==
X-Forwarded-Encrypted: i=1; AL+hErEUmYqlCm03U3Kj4Re+LiifBZaT8zR+jb5gtx9MDA7+vsKUHUTIcTijX78jI4jhtIEKU27/zVBZ+qbRnpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XfmuJQzML9ody3pd3FBWIUK9Io2JuDk4fURIpf2BPqUdRU08Q
	TwsmOVLeReZzSWFonxRalGVruqqGf83FowhX8Q4PAIKcMF80sISEeqlovBqusLRQGrtRAopcUvp
	/USD4cZYuFQ8vRdgd6bAf67ASbhEerOucj6Ps3Uma42nNJSov7JwGXyYQB8ggXSSHxvt7uEoh/H
	mxgsLz4RY1bc6v7jfs/cDgaJNGZrbHNhYbZK1FSlcfl2L49Kc8QK9Gaym5P3XI5ZTaUyQauuW/t
	+BPSs1ESkCMedh1maKbFvDh
X-Gm-Gg: AYBFou1QpIB67O+kmgzLYAwH3F2EmVmBbJ98ZGPqi1nCjoljxFR9Q+KX8pMFy0CjO+i
	eZ97jDPpqv9taeSaby+QX1iwOZPCPsMl8P9wL8eHu1SQURfv/Z3PdC/7YjMJ/QLINGFqRFTbaRa
	2n+vFHcEY2vrVibHy0XQjQvYfOgO0o8emDxFJMttBreynnmsPQsoOmj+EkCI/8qo5zkOgjNPDlg
	2pUTJ6el2eKWmjhWHrpxezNl2iDUPI2oa4o9Z8TthyvPt+I0PUZqkZ5HTpxvzIaEX0xE/ytkRmE
	iH3xR2INX7gILdSld6C4fWj6OS/W8gXp5Pa7Ma79yUCSpz+xLuq8cufksfcLJKY/XsEQEPJ5+Ak
	kJhmGpE0xUYG77g5EhcE4vz4hrVoZDxcjXPXUtaMrbYBXeYudYnY8Bit12ap2nKbiGFYEVkxci9
	7AthxOlSJCzR75v9N6oBJpcSfkXyFUwmRlZSgzp3G4
X-Received: by 2002:a17:90b:5844:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b1b0b95d21mr4080675a91.60.1794626126844;
        Fri, 13 Nov 2026 19:15:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da174sm6921651a91.2.2026.11.13.19.15.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:15:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so310991685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626126; x=1795230926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ADXgRDEmtJTI6BRLdXJRmKIrZ9FU+mVSFJb8701l5g=;
        b=Ydx0uO5Wa/ZsMtf9r9v12TrLp3gQNc5atm2D5kn+stX/tJdRYs828NKyFUerrqTRis
         mz1Zm9ZlvfhtXfONE31RN0O/BEaHDkpyuEtN8Thua1+CUUIVQiuDkpm1EyvGkmNCJh3Q
         BbEZXnBGRT0YUILg6Puk/b6xbYLIAl4SmMusY=
X-Forwarded-Encrypted: i=1; AL+hErGh4nU7rMV7dYr69g/4xvOoKMIYbsNQZjjezYezaY1qV58mmEhkhmOX1lkRoDH7QHM+GSUQxWLnzJ07erQ=@vger.kernel.org
X-Received: by 2002:a05:620a:454f:b0:945:fcd7:7830 with SMTP id af79cd13be357-9494bcce1e0mr715359385a.83.1794626125640;
        Fri, 13 Nov 2026 19:15:25 -0800 (PST)
X-Received: by 2002:a05:620a:454f:b0:945:fcd7:7830 with SMTP id af79cd13be357-9494bcce1e0mr715356285a.83.1794626124999;
        Fri, 13 Nov 2026 19:15:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5e579sm34132906d6.17.2026.11.13.19.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:15:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] firmware: raspberrypi: Store child devices in struct rpi_firmware
Date: Fri, 13 Nov 2026 19:15:22 -0800
Message-ID: <20261114031522.871320-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
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

On Sat, 07 Nov 2026 19:21:36 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> The hwmon and clock platform devices were kept in global variables.
> Move them into struct rpi_firmware so each instance owns its own
> children and their lifetimes are correctly paired with the parent.
> 
> Also check the return value of platform_device_register_data() so that
> an error pointer is never stored.  The child devices are optional; do
> not propagate registration failures so the main firmware interface
> remains available.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
