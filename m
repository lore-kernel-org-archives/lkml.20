Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673291;
	b=RgFb6wvNp4hOT+m97l/Oql0McbCtI6gyNVt/c0KrSIo9O0i9WknUmt2326dE/X99J2KG
	 5Hh2EGKLKeMpT7aetSEts8+zS7ytorOE9bcaSnLplg9knIUK1fFVy/LkDW1CLk8mJWc72
	 ophBJWUF5CECUiX7kweScxw25C+y5VDTIalybLP68Q59vEMvdo4ng2c0ihM+AcdKpYZcR
	 vmE/mJIKxlkObL/SFAYUPp0lfIB+OaF2pxExaQiXECPNe0P8YO9Ski15jW85p5kt/tisJ
	 +Zn4NnrrUw2wBGuCjs8YHmcF4hVmK+6WgSmhHbgkMiREJEJbW0hQa5u8hL2OHN5N+Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SAXE+Cbl9G5IRb7happTo9S2j4c3HyT4UpqiPP6R4YQ=;
	b=Hd61pIodLS6j2xwYrEOAwNmGS8apmG2otJqYM4YZn2gjh4SEg5DdgDiUjobeXXEjmMZE
	 RI56G8SAH798Pnuv43nO5QNYf9ULGSlTgOfo5qtKmJsIcZlGEUIQ9D2q2CcUfQwdDJWXV
	 DB+koVkLTxN5+gPkpxTRI9CtJIh6OrFJHqACDH4IWI4p3V5nMI/Sig3clMOz5fkLgwvEV
	 Sq4be284yA9Du4+v/dIGcjzYjUAMNrMKT1JjQRigpBhAgF9pWdldC0FmtLU8WTKmQtT/h
	 Hl2HD8ooQ/sYilSqtp8PkeR/cY5MCUPN/3/9MPHbrGXIE4h72g0Hh8UJ8ci0k25fndw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLoOsEvN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F314A606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F314A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLoOsEvN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so23382695e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673289; x=1795278089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAXE+Cbl9G5IRb7happTo9S2j4c3HyT4UpqiPP6R4YQ=;
        b=HLoOsEvNbLLkbRRIYZsJtLww7CbQcnin1oQuSxP54eY4wkWFnWCPiDyqur1mMaOY/l
         BAYYzwyU3dnEvSYF4WG9SC8fjp03w2JTYF8XP+egEYQGU2HG0Zml5mgHgrfElNL3nR/V
         xFQQug8gOPBmz4u4F2d0xwnwVyqSdUlOueJIqBg94uBNbtzShZnRpVTTXOxERD4nbxKA
         s9G7sYj2+NexFH5/CM8BqXIkmxSPnb3fOTVNZicYk080/8+Td3Vh+3unzVoc3NQ1uM0c
         D0jQjRaGs5/kXf9PRVuUiYG7OCl4UR8VCa8EdINSehubJnbmYGsDhURGjOseZuiOZ+mi
         qYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673289; x=1795278089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAXE+Cbl9G5IRb7happTo9S2j4c3HyT4UpqiPP6R4YQ=;
        b=l89OvY881LzUUNXK79C6mpoYb9dtnC1cJZSKgqTXOKwcmR7mTKMIkYTviD2eOpnbkb
         BQ7ypQ+AGThna0UDI4vYGFvFnwF768hnYL70RcRDh0nMlY2JZiU2dEBh13g5ybFoBZSn
         wdevnqjQxGxBoSPqSyOFKBwicIcD/bQFh8D8/LY+xSQ4bqrWfR2RwcY44y9SlDx/Hw6L
         hFhKKBXTLYflhbAdUWrDVw/g7khOcjxVvSKab231oyy2XDtJ3AFDzs4jJWW1jtBRBNJv
         oC0CwY+PgQBjdUhzS21uuUMxH+ywUOw8Ssi03QvpTid8+cLafBFteLdzZG6kmyze92k4
         32zw==
X-Forwarded-Encrypted: i=1; AL+hErEulh3N87YlseXHXFQRU+3AL98eK5Dy0XuylO2kuqRbwLyIgvmxHl5r93+G+Yq8DPVHeHJIJZ+wrr9tJI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y2afoWp/EF+9Io9kGtlou0dw84xG0bCxr0Crvr1C0l0ArAvOG
	nhQ5bIMLT25A37g849l+KL92VhhceX9MgZI7I/bXIy0fp+6bGU5SZaGt
X-Gm-Gg: AYBFou38gw1F8ghGyPu5Tp4mM6kPNmZZnS0wOfWzKfe/ID9G1vOYbKwiRhMU3NJo0If
	RWtGRo6Xy/jo8kh2TUxmr/IgZQTnPhXRZuKvcr16kuJc4bdGZu0pvL14vvKRGM2pVd3G3ZEt1t8
	WIfbww25YZNeOSdMNJAPlqC8MjNkcCNKLwvZ6wDf4UkXFcrrqTCBXunTsfZAH51iSSB9A3WMNf4
	FUkN1k33MsK34Cz2N5xmeaVgpr4bngEwl4290qx4Q/i6LH6rjuPWoU0dLdM5zV18vt/EBCiOA4B
	rzAy4Xxg2qEIECypB4Gl6YFen+KgXKErU3/DUEwQUxH1SvO485o8ojBH/YIrT3qo9AYRmR+JQ+f
	e+r6EAfQ9aAvdQzUSPM5ZX9OEz4z+KDQ06BGotme+fNR/jSYvp1+lUTOMSZ4+d0h29o2sSA9jSM
	raYq6DY2Xkf7LzA38pt0jWvWbWH5H8vBmx7L0Zhi6k4vEZq1VYA6PgkiDKqC+4uFoA5dVmudNsP
	FueM6pFsBa3HBbUO27k/52/a1knaFYr3zadoMosI5ShEqHMLioGF2ZVZk1QT6dgQQfk90g5gl5G
	aU+vWya3Gp1dVuRl0jvwADjG10Tfo6+7mm94zQhd3j13PzWIqk0dovvAZk/FTgCcaaPJfwdze9b
	RuUUXTYmiSnr62Q+ggdEmV5dPpLVo/SvXTh2O
X-Received: by 2002:a05:600c:81c9:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb55a65b31mr117276745e9.18.1794673289246;
        Sat, 14 Nov 2026 08:21:29 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([197.45.81.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm162652275e9.11.2026.11.14.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:21:28 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: thierry.reding@kernel.org,
	mperttunen@nvidia.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	obabitemitope765@gmail.com
Subject: [PATCH] gpu: host1x: Remove unused host1x_channel_release tracepoint
Date: Sat, 14 Nov 2026 18:20:06 +0200
Message-ID: <20261114162006.3673-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Nothing calls trace_host1x_channel_release(), so the tracepoint is
unused. Remove this unused tracepoint.

Fixes: 6579324a41cc ("gpu: host1x: Add channel support")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 include/trace/events/host1x.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/trace/events/host1x.h b/include/trace/events/host1x.h
index 1b6aeb7b177b..6e9010ec5a3e 100644
--- a/include/trace/events/host1x.h
+++ b/include/trace/events/host1x.h
@@ -33,11 +33,6 @@ DEFINE_EVENT(host1x, host1x_channel_open,
 	TP_ARGS(name)
 );
 
-DEFINE_EVENT(host1x, host1x_channel_release,
-	TP_PROTO(const char *name),
-	TP_ARGS(name)
-);
-
 DEFINE_EVENT(host1x, host1x_cdma_begin,
 	TP_PROTO(const char *name),
 	TP_ARGS(name)
-- 
2.53.0

