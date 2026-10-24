Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874895;
	b=sVrIB8g7kCvVD8yNEpQ6Xyrz75R+5DzvphPhBoNFKVemUPUNj+c6qIGrdlVBJ0Fk8Erd
	 eS5ss+DURQHitCjya3m/LnmZYTy83JKcxaNhIUC1HnfzNQf8ERBvI6NzosQ+szyLjn+Lq
	 +hR00EYpPavh+ohT9sna1BCHNsbHhBEWwoZuTuoHW6zzFq69N5myocSBvw7NW1lPwkx8L
	 HxpJ5NcIA5z9VADYfttT9U/iFCWt1ivIRtIC/woY+1VThlBL496d2W8xn9rJVEOWWZEsd
	 SwV8f6GBcq/0YpeCMqTMNSNJ2qehLZRQyl5XquqexdRXic7NPms4BH8MLNbO0LnwvSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
	b=PY6wavuWEjbjkmDdQErSX80YoT9AGGATcHScjjtc6aKmkmHRIqBGe0OyuvOGE2s3A4mV
	 u2OAVa+spQjVOZEJWXqEtSQU8jazow2xmfuqmGkn+pHZGiXqdO8dD1oO0OHQO6GPxXVGL
	 +N0PFxmCo0Qgyjo4dLPUee9vO95ccUprMAObZOrtvmv7hD1hY8HOYrzTW+LIv4R2cMj3T
	 Ix0j08IqUeBZrzRBkAREvmhtuLiAu2DbQ5X0NfGNm0Tp0Ayu8LsEZo2Dq0JghNRKJb/cg
	 j9WTUTX3HBoXXPANTXJ+JjPvTiJesVZSyUqxkMnb3tRe8s+JVlOXSaVZQyloj9gdyYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kff1vHAP;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0811606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0811606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kff1vHAP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso4706995e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874892; x=1793479692; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
        b=kff1vHAP2Nu0zIpudBmNBHn5KX0VBdzJXu4jvP58vSoo/pHneUWZCK+nIdNMuxPvmd
         MMKZ9fKFKJ598ZVVeOJxR2XhwwlrIi+xTcPZLuLSYi9hw+QWQaRrGxZJX4Jd2/9vvNJ8
         HRnEH0V5yPdn7Bw1r11dowTzcM5iZmlnh2ripLAHidxKlyxKokb6G2qRHcQfDDtnJXcK
         kuA9zRcem1KIObpVQ6cqQJoDckpwyFj/Qxa1oC9rPRaYv5Cr4HjZMdUvWSNdXnWbSkPT
         iw9YPGRPKMg1b/5GtNxGrHqmt+j9A+kbxt69Px7C1m49FxTKJLe6p3aTq+JcNmEIACw8
         qQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874892; x=1793479692;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jHvev2DHjFHkJ3V6zZIDP3Luuvx+DUDiyJHl84mF21M=;
        b=w0uXDKcL07V/xsbTSlKV67SbWdcYa41aACRu2/AGhCIbHdwEbv5aZK8ymW85S0IcXL
         8KU24lT6u/3OWWIQ8362pcBzBUTp8K6dbuVgQkj/j+/K4ruir9OqmlALpZEF/ZI9FTPE
         CxsjO2suCAqVovCWgL+pSl0ALRKe3vlLqkmE2oTomVyk720o3P72d8SQH8ZavDqA97CH
         jQSP+9XXq+bLtsCpkS6mOJy2fQIX5EnN71oH4Rqry1TJz85Y9KLSKPvEQFZlNyXLPaS5
         RL9bHLmT/z6Sq0Zx95DHWpig1jfXrFymktACrDvId8BDtKs+9Rf6nCEWkTP8XmORm3kb
         XvtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcwhCl5ahCkO7GD87Krq5pBuJ548lexwz59UkDMX1MfDb5sDuBB0yU1olGx9KpgB5ulGlkKlVavw9wP1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOWVqsgVUJEe2r9iZKRWlxNCRhJKrYD8p8qaS0YyZEYUsdWA/K
	2Ip+H3vpxWQONRaJNks9QxRUqGQ10pQRAaR6vxGHOFctJIU3odF6NFJk
X-Gm-Gg: AYBFou2vo1/UzRR4msTA9k0tzW8QG/buT2+wxT9TdfJn+GjSaGziyVihdbDmnxdpI2Q
	fg9eBUREiJUGJvuA5cXwspBKZ+7AbgUK0Cp6PnonLAjOFOc/5eLnP8774vpvJ7UMhPQc8DtSo/q
	YZWfGdhKoK6cLtZmrwQBzLRvbYAurxWWuHKUACP+V8I/MXnu7zUroDb6Po2wz4t9VFryV/0UuOI
	Xxr/XNUUxuAJGuhLMckc8jeIJEw1adonjCz1lQp1wLlKNYoT+Z6uNUOw8ShLQjO/utfLjW1fabE
	+H6507c5oLuzQwGGFdWF/11T6QVYUweDtvcp42OpIo29lHiuOjZBIMogf+2GzkTUterK/5BjRya
	KV6KUyJ068TMF7nuW4W4MygqMzCVK3iQIz19HD4Bw4wbmKqUopSP5k/pX81FOiPz5W1KqJwGk26
	Z86hQAXjnKs2csSXWWhkZTKxzVP4keTe/EKiutboAGUirIt4aA+7bUug3Y0C9CSMnrIhfNg77km
	QJkJ/Je+eel16gUgF1129NydcGWLGtfgd5Oi8e+zRtRzDXyC13owBAJyLXhV6fu0ekfevJlag4t
	wxte7Nfq
X-Received: by 2002:a05:600c:5397:b0:4a2:a9:ed56 with SMTP id 5b1f17b1804b1-4a35ac99b8fmr44041955e9.8.1792874892206;
        Sat, 24 Oct 2026 13:48:12 -0700 (PDT)
Received: from theSameSurfase.localdomain ([193.222.98.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm6221793f8f.35.2026.10.24.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:48:11 -0700 (PDT)
From: thesame-personal <thesame.personal@gmail.com>
Date: Sat, 24 Oct 2026 22:48:04 +0200
Subject: [PATCH] ARM: dts: samsung: exynos4412-p4note: allow powering off
 the wifi card
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
Message-Id: <20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIMZ3WoC/x3MSw5AMBAA0KvIrE2iNT5xFbGgpsxCK60IEXfXW
 L7NeyByEI7QZQ8EPiWKdwkqz8Cso1sYZU4GXehaFZqQr9v5SKQ07uT8wTgFs9ltNFi33BhVlhV
 NFlKwB7Zy/Xk/vO8HJtVRYGwAAAA=
X-Change-ID: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Artem Utkin <thesame.personal@gmail.com>
X-Mailer: b4 0.16.0

sdhci_3 serving BCM4334 was missing cap-power-off-card.
On my N8000 this resulted in the following messages after sleeping:
[305.759883] PM: suspend entry (deep)
[306.514698] brcmfmac: brcmf_ops_sdio_suspend: Failed to set pm_flags 1
[306.671504] brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
[307.127267] PM: suspend exit

The regression was triggered by commit 8c3170628a9c
("wifi: brcmfmac: keep power during suspend if board requires it").
Midas already has a fix in commit 2ff147fdfa99
("ARM: dts: samsung: exynos4412-midas:
turn off SDIO WLAN chip during system suspend").
exynos4412-p4note.dtsi does not include exynos4412-midas.dtsi,
so p4note did not automatically inherit the Midas fix.

Another affected board was fixed in commit 863d69923bdb ("ARM: dts:
samsung: exynos4210-i9100: turn off SDIO WLAN chip during system
suspend").

Signed-off-by: Artem Utkin <thesame.personal@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 8d52aa13b8..03b514a82b 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -1232,6 +1232,7 @@ &sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 

---
base-commit: b47faa6004d86ade16b90d24fa1e1f179e6f7230
change-id: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf

Best regards,
--  
Artem Utkin <thesame.personal@gmail.com>

