Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268103;
	b=gb+HBexgWp+00Xh1fi1ZFgtXPsqbs/fRpdBjiTH50WFDarAxPZAta4kNO3mw/Rk2q9Wj
	 u79VGHCXWSqdqjcM6JJyZrAI2GSOqwsVevXznG6Sxlht6r9uNL964VAwwcGJtCZIi4qf6
	 wlylFViLZ04ySwBx7w+k2HN3RaM8X8V/cYhQcsB9qPmLh6M5gK+9oXZJcMrlY072giD9Y
	 jTOZiQdM5ktffJFcIDLXU9RFlUYovFKTYCD7xInbvuUiLeoZ7J7UPqhIR7yj28Jp7c9NB
	 cggHj150NSR+0Vp/v5h0i+ojAmub+p6CPs+JU7IXcvf5J/smYNzYzCpXRB0sRiG0hyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=+skd4ReZXdp3+ybDH7k1AcOUqtthV7E8Fkq0B8eZiX8=;
	b=F5XfWzeWMuYHtu/UOVR6qnpLg8HrKmXyqKsuoVSCBpEmWRYOQOGKpzHSXE8VjiXkWhpi
	 f95YMIpiupobj4RTQdhMeKJdbY3xbge7QBMbcaoDKnxxkF5EacoE5XND/yM+XEi38AiUk
	 MtG0MGBNGKlVIzPTyV1izuvCPa7mz7gc0rcCWarUMIEuw6RO5iKxX55KszT3dEOKzn4tb
	 3Ul3W8A6IJtHNPqJ6HOKInPVn6piclJBd/A5Uy2nX4RkXMv9YZzRImzVi0JQSyf6/4IFH
	 vS1HCTIoGWM0Ogx15stopkqjDDXnVLYYVoIvxetxDhjmlY2lGtGpnrtA3wgHBXp1AnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PyWZKKGz;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E782A606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E782A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PyWZKKGz
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e985106c0cso11259145ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268102; x=1794872902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+skd4ReZXdp3+ybDH7k1AcOUqtthV7E8Fkq0B8eZiX8=;
        b=PyWZKKGzuA82zaPBN5BfGWkb7P7ViZ+nEmaWr5iv0VQfpoB2ZZTTtIS3L5TAHM1gsF
         5i+mRxqj10Z+rCVaq8x7AhIp8P4SpwpIdx/KLZ1n9JXeQh5baf911uZbK/8NDuYzXWyc
         oVCGSyrSTCWr9C3gj3pScM2g7gRiF8nVJ/b9wiRLgnQzRtulS9lF8Rx7eXkFewAM13Qb
         IuJg+zNhGeFA1BVqdaX1Aqe2tXZS8Yj1Maztma9fLuyHPiIranj5f8rlte4tKozM/j6X
         +UL1tXrxLrc6M9dNb/h75mbi0oGENyVrMACWegcp8mQZ6H6v0lnZmZ+rofUa6SwuTxwk
         CrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268102; x=1794872902;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+skd4ReZXdp3+ybDH7k1AcOUqtthV7E8Fkq0B8eZiX8=;
        b=1MoLQQX4t8d+vUJbrVwAiiU2pXC1umm4f+nNcXvMpAd9//1LcH0RtdYHrp71i+E1Ml
         ZXBwb90FuFiHb9dV5Vw82F2Hgw9FHnjC9JMd5SsaZlmxqnFBebPRjbUJkv/NLmTLzTP4
         x41dlVLfZYpO3SvS5UV05T4m/3OX60uQUAHyPOjNyfg1+he3TnXxe7U5Wwec0rmyzxUz
         I3uVHvZEZDIk+QF5lvNKjAdmgtGwPWkmcxgtk1tyQnX+HqqO7lF1SKm+Tkvii+NSrqUn
         jyjdKrOErXb3wwn28nrXBf0acYEM3Im0euTp6kj76vc424bbMPB34hYMSHCrz7RXQkll
         JfrQ==
X-Forwarded-Encrypted: i=1; AL+hErGKs7ZCyhKTHb08fOiO0LJUN2QRNixmugw5d7VgaVfrv9nUAQWRNyw8QEGm4nRZx+QoRkHPxlybR11j5E0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lBxckiV9TtkoLPAvuBnIS7ydDh6s4pWdbuvnOnaTMSYVkmmuv
	3JLOM+17QcHsqt5VWqFkRG/9WsVoty+JtSXUfDNWhUIBWUFUp6fxJDvz7venvu6qQ/0=
X-Gm-Gg: AYBFou1EoxeaEwcctEWImUXUiPMEiMlk5L10LYLZKxdzeobJtmw7uaAPbrL/i3He5sE
	UDOWztNmBaoXPBIMOpA6ePqSZwex0Z3kVlbPPcM1McvgCJ00YbS1R7UPBPaEK2XSOkeSaEIfXp4
	E7HBXvLEw7dvMxcXPr1clPmDK5UVnGQsAXNt46jKedCuUJNf730QnjmsPbHfuvuCvGaKeSNhs/o
	BW0znJulyShejdJoTpyiWLrFIAG7Ki8PZXP6jooqcPRf6yTO5Z32fQX/XvxB36CqiRiBv0F7GPh
	2juRsksC/4LVAi8VG1Uy3pN2GfbDyA6bokW5wN8N/Y5qEZMPPBMUcvIj67qCf/u7B9UrEzCyZnW
	Zc1BU3LagZ1JPGMSZDpF/4kpyAYabTJ6TASzOzjxW2oMD9In4nnBxAl0rCYy7YQDs5xNsx2nAHP
	9sZdjtTmyDagseRTaLmAojtiTO58uTG/5veAmSgZJW7Rwc7SNzKW4OQA+C2ssJgD0oxiSIX9v5v
	lpXchSPhkOqsrGPaUlFUZHbeScY/M17DCr0E4Axzb0wuyLlycj09lzkPziQVvMr0y05PNeNDOMB
	OF4qT4f1bQHTiKaVV5Egmr0P
X-Received: by 2002:a17:903:3c6d:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2edb9246e43mr6572065ad.27.1794268102310;
        Mon, 09 Nov 2026 15:48:22 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2edb6e108bfsm2626145ad.76.2026.11.09.15.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030-patch-ektor5-dm81xx-vd-v1-1-8ba90608c25b@linaro.org>
References: <20261030-patch-ektor5-dm81xx-vd-v1-1-8ba90608c25b@linaro.org>
Subject: Re: [PATCH] ARM: OMAP2+: ti81xx: use non-scalable voltage domains
Message-Id: <179426810111.2265990.13077488859947627237.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:21 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 30 Oct 2026 11:40:30 +0100, Ettore Chimenti wrote:
> TI81xx SoCs reuse omap3xxx_voltagedomains_init(), which registers the
> OMAP34xx/36xx voltage domains for every SoC except AM35xx. Those
> domains are marked scalable and reference OMAP3 Voltage Controller and
> Voltage Processor instances, which do not exist on DM814x/DM816x, and
> no PMIC data is registered for these SoCs either.
> 
> As a result, omap_voltage_late_init() tries to set them up on every
> boot and bails out early with:
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: ti81xx: use non-scalable voltage domains
      commit: ed20363e55aa1ea0dcf865f6776354f1628f5375

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

