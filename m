Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814806;
	b=ncRmdM9YbtF0R1Ys6DonHRCeU+4gkvtcsaQe0i29AL7IuguDRQCgiqf4Q35pUJS6PcLP
	 +Fp8XqZOXI4V0TQL4Tf1c7MQFBjiEvVWNYWTx2grsBfwONbC5jEgv1xraP1TwejPRzuIg
	 uoUIsEJqCKlXpvaM4qCvdI7tVWXLj9tefuQDqw4Xx7soYTsB5DkDnH/wQy6ZEwjq2k3mi
	 4XgJLSlhIDVGZbQJrp4IToBJdnEL7GEDg7ZGGIy3/rGic+VqK7m3PFBOYNq4jo1BR8zG5
	 zNPTO/RbHDWRTmXXXDkMNftEOCck0tZvviRDyJyEGbkvmRbc/xxzbc9HUHcgYrXyBMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7HwD/9cyl5yU69DIEKa52hPN8DCHL8GdVhIFYuxqFrc=;
	b=mUA/1/p/wsEjNz7aTDYwh9raiuX3tQqCl6BwYsQQ76hSuJCyVFSinNipk5wsAOZlhSiz
	 Neuw5bM6uumnSYMNqiGJJ5USitsCPxLVKwbcPGjkNKRsXJELynpWQnw9u9slttQdA+lqa
	 j7ScgUBj4VlHWCGcr2XMJaH4FRdjL3CFmZZA13pmnoxpFbSXQKE41ctfyXp6u7k42+Glj
	 +NKQ6IFrHCmX3SnWSupBJRWfSa85jjgJMsMDNyIsK/YveUrx3vBBU1CALLzS3GLTnio6Z
	 qlmhGHZ4RbYwD3IM9U7utekAxpp3zevnUJGRo0jNRCd1adxwoDtLoRL7O9ccGEUJ1OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6LdmkbQ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D560A3835
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE8D560A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S6LdmkbQ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4919a880834so1455356f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814804; x=1795419604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HwD/9cyl5yU69DIEKa52hPN8DCHL8GdVhIFYuxqFrc=;
        b=S6LdmkbQVA541jEVdicLwZOEbw2MGB5A6Cr+05flbgQjzuZkxsmnZrhjTKDEa9Zs9L
         r+eLO8DS/9pPo3yU4ZUGL+J1Uqm8LB4KRn3Hi00Upp3AKhs7ARcEQcrSlv6tnTYocw7d
         6EtSnQSBTXMJmUOcuWSNz32eYMVEZcOTq+qs5Oek/WJoeas9kePEPria3pXpOzaWy1Z6
         alfBNg22E/VfuCkUMvYNVnWKIsA939GGnQl75JbUBFwuog54IVABVFi7Kq0j8BxwR+2D
         ZvuIjx9nv9Jp3G8FFGHLyYvumznDoN2tgYKty8ER9u8BO9QZ9C2wOV6o6uo88Ts0EUA4
         6gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814804; x=1795419604;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HwD/9cyl5yU69DIEKa52hPN8DCHL8GdVhIFYuxqFrc=;
        b=ZPv04Av+0fzAkr2CuBcTm2TgQkbMAVcq9ojcliQn3e9/RUvzflhd5K7gejcrTlZbOy
         XaYOaqVrwUoOWOjBBsaqj1Y01VAybI9ZbAYroXkayHDZ7BpVeV+XzPuXuq6S6xpprt43
         G53dORK/jaAsx39UsbIB4g9skQDq1lKG7YxQ5trCsDCHcF8vN6LEW8nMn72N9vXlfd24
         XfblEep7a4exxMl8cR1bigA7u9y9KoUxdYHu5qkGDV45SpBYyFsJc8DP8BzUMbqQ9R4p
         mTULiPQWobTxW2mc66q9KXMHIxLCHa0oSqzFClDX1BHCUiASuews3EBcUmB0d1DkpY+e
         RADA==
X-Forwarded-Encrypted: i=1; AL+hErH8ZIsVoPOw9q8nxyh51ZX8AsA440p+EU8RbD3OxUbPRPwY3BcNPzYWVsDWaEtZNPyvUsE1wJadphBvzG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+0aJZ8ect5nrKR4THsN1uz0sMlE6QT36UjZ0FTwBXmcKw0oVy
	1zPqohG83lAHIXTRVS/VGLNIuTcu/8p0jaVkhedZ3gFjiKLI/xYSZuJJ
X-Gm-Gg: AYBFou3QiW0KQQTKjqfBM1QlYbBBP2IbVnxuaCiK2CCjElxMeZZTYmZGS/bELuH/jLe
	FWXA2foJJgAp5ee5GLxfBRLvo5M7O2sGOQNtidmTMFlpCZ0cuEjfH1A8mBhwInVrASW7zeDjkXI
	rPa6LaQ6qc6/FB054nXSDPqmwE8KqDPUEF+s+fp32KirzzIXBA1CXhUBuKA+D08gFHfrG1n2bmM
	HNPUVDHdfOYOpewLrWPVCoeB72850NL7Zu9x1HUmTpfwJr4bGncS095Y2iL7GZ7j3BX40b6AALB
	fScve9onoyZHS5H0Cfxk48MbNWzcDnb26808DBL9lv+asS8TDWTeqg4LM1QqY3F4TzexHfZF2dY
	gIGdzE+wEqG3RQtBkOIV/xe3dmXeAG1VK+Ydeguvd9OxEXZyftJ99nzMSz7CLdIZiC/fO81DPXF
	0S/Umvcbw8diAJF84OFYMJ9FoGOWh2zDw7lChtHqmN+oTVEdmJg/tu3qcJT2XX4OusehciJMD1m
	krEcybT6lKMFB4Q8XRkKZlHV+gig7pKOEDsksE9OXwADmu+vF28VyIrxiBHxpl4wsFy12XdNBdk
	eDEjRiu6WgXlqfrp6wap3tcY+CUvvF4=
X-Received: by 2002:a05:6000:46c4:b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-49c70ed910dmr12914294f8f.10.1794814804277;
        Sun, 15 Nov 2026 23:40:04 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm20354115f8f.35.2026.11.15.23.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:03 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: power: supply: samsung,s2mu005-fuel-gauge: add S2MU106
Date: Mon, 16 Nov 2026 10:39:58 +0300
Message-ID: <20261116074000.355176-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074000.355176-1-tadilhusrev@gmail.com>
References: <20261116074000.355176-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The fuel gauge in the Samsung S2MU106 PMIC shares the S2MU005 fuel
gauge's register layout and scaling for the direct voltage, current and
state-of-charge registers. Add a "samsung,s2mu106-fuel-gauge" compatible
with the existing "samsung,s2mu005-fuel-gauge" as a fallback.

This was verified on a Samsung Galaxy XCover5 (Exynos850): the s2mu005
fuel-gauge driver, bound to the S2MU106 fuel gauge, reports voltage,
state of charge and the sign of the charge current correctly.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
index 05e420316..7b9d56d38 100644
--- a/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
+++ b/Documentation/devicetree/bindings/power/supply/samsung,s2mu005-fuel-gauge.yaml
@@ -14,8 +14,11 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - samsung,s2mu005-fuel-gauge
+    oneOf:
+      - const: samsung,s2mu005-fuel-gauge
+      - items:
+          - const: samsung,s2mu106-fuel-gauge
+          - const: samsung,s2mu005-fuel-gauge
 
   reg:
     maxItems: 1
-- 
2.53.0

