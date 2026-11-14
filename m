Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627414;
	b=J6wrWzWaOONwzUJOCpY2nY6YELaLKfJXH5f3FzevXX5NGcGYwsqfVDBIlZBcEukALzaY
	 4CwQdX2wMXR6UqS6ol8WZt+52beSuBbthnFKsQLHlN/pTp0FE/jOL8donUzGefBxif6rM
	 eaejuEEBoNQhyRTu1+96cZ8OXToPrPsPLyIG5o5w80UFBda1s2ur/Mvvk6s025xM1CP9h
	 KVpUiCa4G2xI21cjNwojJXG7IoWBuv2vdludFTHdetl2O88eUrQuAP7snUSc8A0mj2ZmJ
	 gkcRuSJlvdu1Ohu/eWVDZNWH0kUUS6zMlcGc0IU4qJVE0/LFg7XUH1r6nOmKeucSrtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627414;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
	b=KP05Gg88tI3pN8j5Iyv0pO5YrbCm7hMmzPiaQedRymn+7RUa6Qg5q17E0UdaNuq3T4FG
	 lSARUMcCCm58JCL5SEo4MMP6qn1KACMmP0550VuPkyzPPZ6Q579MaR1A7qLjN6/5iDTz6
	 adHUTwLC5ZxlUNtV/QTTDjYAvZ0D697Uww7QZghNgmCkiGWURmHj2jVsnQaL17+dzBTVP
	 QdCv8xTZqcdyfnlExkVfaM3XNRparzkom8wwcWb4huQCamcVfx5s0tRmA1ZfDD2lDt/O7
	 xMCC/8kwQqAcyOWhJvQoPqfSe97LCnvDe5eWtkeHajyaCgqPBbJ4UzDsCw3KoHdnxtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TzRc7tZW;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551C606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C551C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TzRc7tZW
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso754738a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627413; x=1795232213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
        b=nPfe61zoVxDxdhdK9lYqzuvVz+JeMgDpeRRx3ar7ckdTaRGABq/7WF1AE4QyyVYpsa
         h1Xd3U9PgWLwGp85J2TUFEGZDoyQnxRKMSnQRAo4W2C6p+cxNcJ0SnR5v89j7sq9SqAZ
         KUNfYfTx06pXscCT3Gj9qw2GeeozMfbrddqw1LdUupXocYt5HvdLJUx53TSeiV5LscfS
         E2swQB46fLE79MPhBD+h567zRim+yLrfpdB90N1/ZAITAy2cl0hZpBaRzSyuI6Nsvha0
         x3HGLAq7NGXfXRG35s+vG6qcyDnQsUMp8X1UoebXWhCcVbsQRg6OT26zO3IThFTxk1nM
         ceaQ==
X-Forwarded-Encrypted: i=1; AL+hErGkwXzhBnlhaJ1pbsCFz/oig5+cmPj8+m+efFeCeGdnVKmQYpZ5JEC/66tzefi4MI6fgfG6N9bHR3wpiW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MOfK5vcbOwC7odxQ/FtuA2J506XpvO9VLAPIZKNMevXTubavC
	gJ66PTFbGF6CD+LwI696d5UU0ZNkfQMkNx4zP732TSB1UIZLdoXG5cr5dDLf5TrMaYq+AYqc5CQ
	IDZBJXpUMSISwCAvETnmhUq1KgtQIxXrGS7758QajTkgDOer575BQyeViiLSWzvrJly91+fQFpN
	DpKonb96R1y9TM/2NmKuzCyfOgPcfmkDExcICaZ59s7iMxkQ6VHZYJyFzy94EmnLpk0AXvQlKwv
	zOCQrnWcWERuHN+ZuDGcBZL
X-Gm-Gg: AYBFou0OSQ6wRceeercOPXRoT3He2kgogvJ58RpDzJ3p/rrD54XioLUdp5F99NjIaQ8
	lYvnBYvuUTEKK+myZhpmBUsxl++48PjCcSt2keGtt6KjFIcGdRgIonh3UvE6Q0GfXWUcUUmbOCI
	lvaBtGP+uaAA4Vtou5DXdcts32jyL8dH2qsqZ/nDsqMs1HtswPUrqTSih1ohE2hOKuGPnEed1pS
	2cQQVBesZT3XymU1dx9pP/jV2f/js1RDDT41K0C68gXnsCnw1A911FV3QRzrgTtn6Ht01Wcxq29
	6/GT+ryEPYvvdgoK5ikRNlW20bcO+fPPzjMjTcM7fT0l/3EFTatED20XuXNWCpARUedsrjcTY8w
	d6BDZdWd9w0ertAWmj0GTMsJplqz4zRD4EbflzcAgFbK4NUT6CfNuZOpsAmOMwB/O
X-Received: by 2002:a17:90b:4c49:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b1b0a3a7fbmr3980447a91.31.1794627413135;
        Fri, 13 Nov 2026 19:36:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da174sm6965965a91.2.2026.11.13.19.36.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:36:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2011024eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627410; x=1795232210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3a+9UrHFnp0GCYUcXwgUcuHkUgb2iyxD30t2rDDa9ak=;
        b=TzRc7tZW6kapVypoYXHsPd1gQaJopsFAPueN6HdIdQNjm6U+S5wRtQivmVOR+KHZsT
         EtKaeNnA3F8wEkIyjL5pfG1DodhftCfgL6Lqd8Up7NIelHeYHqSBJdx3Ajow5fsv6mXU
         1MLCTSf+QynS3YDE5+014f9Siy4vRIJ7J3QbI=
X-Forwarded-Encrypted: i=1; AL+hErGPPKnTgOzUMUIUBqnuq9Qw3SKa7XJvlcFImiYXDVdDls8ACU76mUAmJfMEY+lRoWkWrUYCh3268NSb+Ao=@vger.kernel.org
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr3722064eec.40.1794627410034;
        Fri, 13 Nov 2026 19:36:50 -0800 (PST)
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr3722036eec.40.1794627409340;
        Fri, 13 Nov 2026 19:36:49 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm11532824eec.6.2026.11.13.19.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:36:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
Date: Fri, 13 Nov 2026 19:36:47 -0800
Message-ID: <20261114033647.876683-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022082927.59030-1-martin@wetterwald.eu>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261022082927.59030-1-martin@wetterwald.eu>
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

On Thu, 22 Oct 2026 10:29:24 +0200, Martin Wetterwald <martin@wetterwald.eu> wrote:
> Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
> (both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
> not detected anymore (vc4-hdmi is not affected).
> 
> dmesg shows:
> 
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
> 
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first.
> 
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
> 
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
> 
> Cc: stable@vger.kernel.org
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/fixes, thanks!
--
Florian
