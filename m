Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762095;
	b=1wIQTkADDB8GeiOAVuontGosqxuVDzT5dCPiUA3RbiJ5tWifRG8nEFEGKR85NbSRGcRy
	 OKW1SmKF2g4UK4ej1+1nXISyoT30zG+PehNFY6zibGn+tOl7TeYWe8C1cSuMAQM2ivjV9
	 kgtqvo7I9IZG3B/yPdxT2sIT8IORtA1CTc/BGGwF5cljLkC50luUG/B31sKLtaK57uO4i
	 i/LUilHj9ToRdb/yHhhEYeU/9JgNaNikGoVlXAIpcbT+oEKxhJXTsiM6FPJFiAdd0L1D8
	 djrN9dGT7uUdzRLdCc3zDwqN1gjnBlyomGsmPr6zvhWSQTjNVQsEJ5EznAisn+QDgNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4/xuQKgFmax+PlK8RsrrP9CtynouzaCSXzHEkLVU8HA=;
	b=11ZTJFv4fj/9+q+qDI3VzPhehvtRTN7xQDyuYoQVlcKPruPnbWO/UjsysYqO91nS9Tz9
	 KPI1DmUyne6TrkMzkqBmLjiVkXHCi3CmO+6QQDM2xRsA+Sh3tzSs/I6Sv2vrfPLTKF3wP
	 6MeIwUX5NuXO2bwejX6JLe9viziTrxxkwExyuO9DqBsCZSNbSDzwiZMm4su+xepgl6tua
	 LJY5JnBX7Gl1lxoeDQ1Az1J8oCWRQs1hmIsRdjVi3YpdVwaN18BS3GQKtHPJ2o+b0Pc82
	 2X5fip+u3LE7QQU79Iccuz6mi3BDtnETlh/DYaWF3QkTJiuh+erx80vbMuzkiEy8jsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=GaPAMHpr;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610AB606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610AB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=GaPAMHpr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so2017685e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762094; x=1795366894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/xuQKgFmax+PlK8RsrrP9CtynouzaCSXzHEkLVU8HA=;
        b=GaPAMHpr42ecy3Yixz8307T4q2uhyPQNdYB3zqdnsxzbCfPV03222Tb+bYULUfSiId
         4hvrNFPZMR9Q6OT77poc4sDVLKWR/Tt4ETs8UyIM9nBb5hsQsIOr5CqVjtxf0N+kji5u
         yAHTgf9r40XzS36rayLBQKjL2MVY1SDeYPXz6WjZn5baNyUBDLOsIk+2TqgqZXDT+HXR
         B0Mg9e+xLJrrU4CaQLjZlZ9K/U1BWZ/cMYzSRMSCmdRkxwbU2HVxNpZQ+UdcBjKDKiRw
         BaC57U3e+v7hJkNAHT9mqOoMCEs/idnx7sDnwDTM3aGi9CIfMgbp5JP7F1CUbtbivIi7
         cMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762094; x=1795366894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/xuQKgFmax+PlK8RsrrP9CtynouzaCSXzHEkLVU8HA=;
        b=MAyrzRRuPp5OXcOpcxnikEss8Z48nE27czO7L3pMjtJf7WnDVT6aFE72Ayt1H8jTnH
         r9dGZn7rbyli0vI+xlrXornSyimFJrFmKgBJMahSQGlvktfzuaYaUhm1DcpU2M/CqDnU
         LNsavr77K9HPULj2FTAAXOh7oIjXPkp0j0mGsia8RUvYkZCfo4q7HP0+Cu6sIocJthfr
         +cWQ52mXchHUYiRt+gJCDwcnbLV2xbCh36ASdpI2Q7h8XeeB/lymPRH5LcJjrUs+A/Jh
         mUqFnZh5GcchEQzL90DZAZJ974TIyzfHjb9o3YsX9Qo+d1MVFNaeJG0d9cuizrrWrDRM
         3qBA==
X-Forwarded-Encrypted: i=1; AL+hErE1l0wUjJC0kh/mI9gJ7JeIJQZPyCaNUyqOPWhfIJuExB0eP+IQJl8OzKM2EReLP/lSDLLXZ8BVasSaZpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VSCdtWZIUUHeP4mzPweptk8ob35ZTKROPIozJhSYrF8HVacHW
	JIo/eLQBzQyFMB+ddjCMfu37vrillxuuaYGQRPF0Hgc6C0qLm4spHHHw6qkFOKhJJVI=
X-Gm-Gg: AYBFou1JBq2DWbOVS3zw1t52VRdJCeymlWNoW7e/OPbJIJ6cfEFCMiuLjuhOA134uPh
	3h4+SOJplv80NhnmvbFsJAYO/1veFLFeBYua9Qnt+grJrQV9zfD5fwLKfTNpzxmQ6YhI0bv5Fna
	DThwoFB2sg5eTitAAo6TfljLDFMsWexAKBGT/PExUe91fZw81Z69zFakPOyZHxEGWSrT7VwAGDq
	r/uB/XxKNGh47o2nFQK+YJCRCifSK9lw0oPsKYrAdXdAAjJsbO0tl6Zf5pk30WVz46uvyNOhDNP
	2ftwYdPDhfz+xu4F9mlRMWT5Gk34R+xSp+sBAkxjaCED5LfgbFP8ClGCReZ/expLYu3lTkqrH7w
	Pk4oKNLMSnn8/IcFPLS/Gj7HDDcE9FO6WeZXYSfAIcSCZg89KllGb0qixU+bs4A6hckl+ruquBF
	bw1p3UiBrO0/iFwbjaCaYvFQsqGk/cON6CABjHpd3RoPSTW9aopSFgtHoBYlTNX1afFFBgBOl9S
	N9VRTFhSZcTyahb0+EKWBnEhFDbykRsMljJBVUtjVRzft/GGoMN4+/ZQPyqxhUDyRKJWSet+D7d
	ANC1wPVS86J6IJVndVkNHsnk2ZNy3lGso1J1PgDAS9pzGWlRLs4nXBaXkN+e5yZIyTVO97GDcEB
	glSiOZsR2
X-Received: by 2002:a05:600c:3b98:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb55a8c128mr180753495e9.25.1794762093849;
        Sun, 15 Nov 2026 09:01:33 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm11599174f8f.55.2026.11.15.09.01.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:01:33 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Hunter Laux <hunterlaux@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Boddie <paul@boddie.org.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: Re: [PATCH] MIPS: ingenic: Work around stale L2 data after DMA on XBurst II
Date: Sun, 15 Nov 2026 18:01:32 +0100
Message-ID: <20261115170132.24780-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
References: <20261111-mips-ingenic-l2-war-v1-1-0d9dec232a7a@gmail.com> <988F3625-C300-4C68-AC70-E371E5D9A496@goldelico.com>
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

Hi Nikolaus, Hunter,

On Thu, Nov 12, 2026 at 11:24:40AM +0100, H. Nikolaus Schaller wrote:
> Maybe the individuals and teams working on the XBurst devices should coordinate somehow
> to avoid double work and potentially incompatible fragments?
>
> E.g. by describing which hardware is available, which topics/code patches are in the queue etc.

Good idea. On my side:

Hardware: a HiBy R1, an X1600E music player (480x800 RGB panel,
CS43131 DAC, AXP2101 PMIC, SPI-NAND, Wi-Fi on SDIO, Bluetooth on
UART0). It runs mainline from its own flash.

Posted and waiting: i2c v2, PWM v3, serial v3 (binding only), display
and panel v4, cs43130 TDM v3, the dma-jz4780 fix. AXP2101 v2 follows.

Not posted:
- CGU and the X1600 USB PHY: yours, as agreed. I will test them on
  the R1 when they are out, including the 1 ms wait after POR
- MACH_X1600 and the R1's board and dts: I will rebase them on your
  MIPS series and dtsi
- the X1600 TCU and watchdog (needs rework: the TCU is the X2000's)
- a driver for the X1600 SFC (SPI-NAND)
- MIPS kexec writing the new kernel back from the caches, and keeping
  the jz4740 MMC clock running on an SDIO host

All of it is in kernel/patches of
https://github.com/mgcrea/hiby-r1-linux, on top of v7.3.

Thanks,
Olivier
