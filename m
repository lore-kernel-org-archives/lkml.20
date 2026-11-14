Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627270;
	b=zrEtMSDsbJl5wu8cKsnmhhV1MQtTSNahdPpnBHyNCYFMn8Ym3CW51nCn1Jx9oG97cfZT
	 1AW9mjeheFTIdpInB6GVaEbD6CZiy+xibnpubdH9y+CNhnlN+//Qm2Vj7JI+jfXiFK7G9
	 5u2LEYBoXE4NredA5Ppzayd3CCJdgwWEZjVtfbRvgRb5zeB+Ylv/MnNXKd5s3yfy0TbVm
	 f5C6bwr5q19CmdA/iOtV0brjZ5KmThGALCDfQpwmetQofoXijqFVljxhtZYhRe/x4Nz8F
	 VLMmgO2sj+SB6G55cIV87PMMquU9gOW+WLh3B1NRia977ObZlmKKomvmf4w5tiyFUuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627270;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
	b=FPCvp3MgJBlWmuZdh6rtYnHVxfq18jUNGaQK8M4Ltlvhk9w7bCfIPLsnQHWRckxnNRmt
	 8tKuWo3HYOP7fgZ26B8klak7Cv2rFatMrImYOkjS9RaU0jT/dty7ZV0CS79ADbpTHtKFA
	 RY++NXJwymiqHlUNLhJmAXvC2Ay0pWJfj6X5le9ytGgVnN2DimNMqTJeQqiw/TRCRpm2m
	 amc0lTAcLqZHlaG7mexNrvXZLrJD6NwZkUfhMb1kIldMMv67fSUwtwQs0OBnIB54GnCbF
	 AvrC5nX8AQdirOsyQbGBm+PyWMhgFCsio4sbCuknpWReVAresb8WTMZwFVks8bPdE4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FsqjNyMf;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81497606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81497606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FsqjNyMf
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b1d1d74384so44530a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627270; x=1795232070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
        b=2bHjN5CdmnFga1lirLq1gbcldlTVIsQS1dqI6Zkn4r7HGDbDGtiu3J1uREe4F/XHBG
         69ouqXe/SJh1F6Ui9jlP/4TVBdJdMfYKpj3IfYdxJRfbAiV6UiSxMijbw1+Iem2Fy0nI
         Cvu792FnkCcXobjBC1MA3uDmXpIygagTiIRWjpW/B0TucQTfKM0phgKCuWPYD6OKAi1/
         l4AE7XtuIoGjwKjw+r4+JT1WCFp1NqXOS50d9GIHDxOeSVROof2853a24A6b3ZdTAE51
         hYJw8LqxvPtOjTDES4SvrnPlUdit09QSWYUzDa5E9WzAk3eC2oWzCjaQ4KYTeznC7lt9
         Lfrw==
X-Forwarded-Encrypted: i=1; AL+hErE+r2Ww3gdWfdl7GXiuKRyhEv1PkorOB1vegpOkHBiBShW3xiN5hXflGceiyB1mvRaqt/GBaxY7fPyDOSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sjI/adSlM4Kg0GyI09PeaaX8C9BiHTgEaJDf8Bf2m9aswDWTO
	EGyANMEZkIGMrLS5C0W8Ig/0hdglkBq9d5bFhiHFSo+7a6anrrxDZHjgDZdq4oLNOpJaYfc1IEJ
	3gIc/V21CfM19BcvfYhpu2UdZu4UrfQITiI2oj9+K9pNXs7GawAq0sH4xsU2OeMnHDIoxyC/4cc
	Crgdvn8ft9D20kS3PPu8AyrDShFQm+/TJYBithO/rmtdX7n+zzatLhVvMcU6k8s9k5hUaY3pgMN
	eljcFNTGwD8vOht+ppakjFl
X-Gm-Gg: AYBFou2otzWXGQ1Xp53fNfqqOIAjtoQieEsRFi3WfW+8zJdNOz6KEZ8cgIhMLNuyjKj
	+GvLCETbI9dnV3y6tXrsG2va88ZGzA9nIOe2JmugkyAJjVwN7loLs3PsLC/dxsueBSimXw6u31K
	pXARUeEPy9zu7yUVjp0vsBZkLyh4epDx2J73BU3WTC0E/YCdO5TbU7ih2KoflowuDN2LZh7uSJd
	yH1VNXbqawinoS51gTcwzrvCEZJy1qRiSSUCK2xo4gdQKv2mv/GRzzUiHcpDyKv10/rU8itliOu
	MJlpc5+BG3mFmtCWtiLc82BoelDXWEP5c68tdYWY18ukBQSqJrwhmtJQGvsQ6oGSIhI+iARhbVs
	QNOFPzMww7Bp7si13sKJP8/7eTmVX+wWriDXCandoR6RpVeCi3UHbSeCj59Gnv5vqYXf9DvHjf4
	Y/bHj/Qy6GsQxfePSDhTJ7M1qgGLH857G8ODUhf1yF
X-Received: by 2002:a17:90b:2d85:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3b1b0ca53bdmr4356007a91.37.1794627269819;
        Fri, 13 Nov 2026 19:34:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae9bbffcsm6369906a91.8.2026.11.13.19.34.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:34:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso7071819eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627268; x=1795232068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddgPaijUvIbheBZatU1W8+gATV3/IFQSBsN9yaAotzY=;
        b=FsqjNyMfYgeS4j2kNrm/zfVVwKD8gp6v3yQOf5DVh7CEU0zFvg6tiYf8uA+setgmAo
         J7xTH3iu1L9zPuzHHGjVEHcV20AoHjk/tS0Kcpmel0PAmHFTmFlVzj2B2J6+1m5LVU9w
         EbEkdeU+675PubUrj3KbEAmaTvpfBvl6GU3S8=
X-Forwarded-Encrypted: i=1; AL+hErHp1Wg2audNAYC19XYxJgGB8mxtwffvXMbepue4E9Ipck5E6+4D5Lo67C3GmKqIW33i3ejZ6pbf4tc6ujI=@vger.kernel.org
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr1253754eec.33.1794627268056;
        Fri, 13 Nov 2026 19:34:28 -0800 (PST)
X-Received: by 2002:a05:7300:269b:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-37acafac54amr1253710eec.33.1794627267158;
        Fri, 13 Nov 2026 19:34:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm12865283eec.28.2026.11.13.19.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:34:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	netdev@vger.kernel.org,
	James Clark <jjc@jclark.com>
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller its clock
Date: Fri, 13 Nov 2026 19:34:25 -0800
Message-ID: <20261114033425.876398-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de> <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
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

On Tue, 20 Oct 2026 16:58:11 +0200, Nicolai Buchwitz <nb@tipi-net.de> wrote:
> The MDC of the GENET MDIO controller comes from the GISB clock.
> Describe it, so mdio-bcm-unimac can get the real 200 MHz from
> clk_get_rate() instead of assuming the 250 MHz of the STB chips, and
> can put bounds on when an MDIO write completes for PTP.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
