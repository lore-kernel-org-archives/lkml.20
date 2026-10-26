Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030986;
	b=jShcOv+cjbEvJClcIZLMPLHYuvmdp+cKkHPOfSLv7IHBb7TYvlFE/ol7yZSpivXYxsfc
	 gr2oxASlxEDpaP8nuou7x2FVdjWyL6pjrXM3Cbn6yQI1arofdUU3A24t8MzmJ9wDLOo6i
	 2kyIF/yR7wUSFrQ9jFcD3GBLiRgFnPADG5+p31/GQRrpQiBNEey1ww8K0/Nv4xD7+4nLl
	 dolNkq4YwmPc7B0Ir8Gzq8CS8/rh+eTuzgZ/dmIhLVZQL20e3imZpU1g3FnVrZxRbt19R
	 dLHuIGYrK2dz0IABzHcPYPLHfzYzz64AvslwPDek1hShv78iF3ebOkJOJXCAuskkgvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
	b=1ZX47AQ5v8OzbeltNQsmMGFwVoj7blRXMjJiAIZ+S9sqAa1NyChU5/DSbJsm22euakv8
	 ecUlt9aemYIKJahHu7bLp7qWixTaijDdIPX1HQe8benT4Hv2eqA/eDd/3C2XQ1lTfgENb
	 sm0FROHxff8WEIXcjGZiy+PkytPCICy5UnbFzGkVqHHupfwFr6n4HoeJPO/VWNZ9fF7bM
	 QTVy4F2RLdYXVoNZixjEBkdSQqt5hJA+8PklzD+yG2SDW8qBhh0o2kK1OxzUpZNzOwaLi
	 UejuzLrHOwIVo5ueClOPQ2FmFZpF0kQOMu3WT9kPKHxTsfL1k9sBkBEwLbfVTIR1r1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VanedlGZ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD76606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VanedlGZ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so267845e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030985; x=1793635785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
        b=VanedlGZOu5ndUlScCLSxlKNzB5QUBvJHOy7xAvY+y80EAJmk/V9xxksuf8NQwaU8P
         CE9ZNZ5I4maGFZZBUtr12or2LPxp/2FL8+VneSbVf5rkar8wljOEfTGIs8TO1HH/r4LR
         az6MJXoQYmFFLWv4hMzLFxDhabjVMSfzwN7Qa9+LMqNUhNI8xC4lzBoManTpVANSlari
         bBjs9b+DDHRzGGulw9/AIgtEixrr6DS4UqLJXmlGSO+GGs75pLqAvk0DyQI/Wg8KMGRG
         PJw7oflt3vrLO05Gsgx5K4XRgx222bHpxgjMJjEQoYksQNS1QMXHMq2Fvea5H/udQ/AO
         hCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030985; x=1793635785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
        b=myAuqdCPqEemWaX/B0d+SD8Qxq7xIARtFwwpWmWlNE4XZwxorIrX7qSz5XwDxWR8Wk
         ODqtuLUP1f+Li0dgn6bVpKibeoM47q9cbtXsZvVurwMSh2o1eNbdBOQe5jrcfgJ4+rcz
         C/afeZ5J5gWjB1w3SVygNvW5y6/tHc4Q60KRFIQmE3rM2lY6xJQMvECMuQJY3eOnGZMV
         x1TrDk6N8TS0JYkN4SUM+zq+GdeB8TjdxbRZA7/IGdsIFg8/2eJdA5mxdJhbfXHKM38I
         d4OACkkDR/TqfVdYnGGr+kC7Rwy1/41+WadPn4s+SxSHfTjE0zn19yi+g7Xm+EJRaNSK
         tC0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOb0ORKdrXirHimVfOe9lvxkTRBU5lvmAtOmgvUzbOrG+rw4jgXBk+OJ2V54QQn6PecaYq66FH3W8PiMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxNNza9KmnyJFm3OiqFTGOige4WxpXYa1yJUrNMqhcKcUU6BSO
	2MbmLc2CfJQlYOKjYF6jelYf9D3YuY1dWW7993VNbG2VFM2Q5eLas/J3
X-Gm-Gg: AYBFou0TnEIoaPUF6OtsaNnbdtSGF1aiXdXkuuNX2eXDl4w8nORDSgkHU7uTQzcuVaF
	oF5eA3dAQuOKRkM5HDtXeb04qYlSMcPBhotkozWuLafUtMInKM8BcRjZgtudlvJ7uOmEMuiskCz
	kE6BKYKaGMxEzq59QqhTSU0ZfCzTKeBmQdLaoZK5jhj1hLdWLu1SS51RcDwLr6/lKvaueY5pVqj
	I1XsmIVkDe2m0rbMjazWXgjHf0p3q8iAgpeJjKWiogqctiZGnhGnrn6iaWbO+ber6fLEtbgbmZ4
	yEpz28elBtiYFz3txXWVVRjJPulfA1jC8WiYc/Hpr3/uTIFaE7pQfz/HyBQp3X/5CpKasAdq6yo
	pFwpY3AxPtDKLN7KbQrKNbKBjqGG0sOD1RpEG9TsS/v76iT1RPLYNHc4E+xAzzcX8bJJlfr4T53
	aidI5l3SJmMeJBlMbSE8gojcf7UgVzaeUkz8P9Wj9xDkL5h7++9/QGPuFhYPMoCdBaEQdgMgjEQ
	t68zML7iGTnryuZGhUaIFp5duUwTneQhr9+QFBHYO15l9ffD3EkqV7wIx9Fx3Z4wGjURKWSR8xE
	9/4YDv1RQHi8+C5XkV2wXYDf/+BKYQ==
X-Received: by 2002:a05:600c:3115:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a7c16c5294mr2538075e9.13.1793030984491;
        Mon, 26 Oct 2026 09:09:44 -0700 (PDT)
Received: from theSameSurfase.localdomain ([89.216.103.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm224923225e9.3.2026.10.26.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:09:43 -0700 (PDT)
From: Artem Utkin <thesame.personal@gmail.com>
Date: Mon, 26 Oct 2026 17:09:14 +0100
Subject: [PATCH v2] ARM: dts: samsung: exynos4412-p4note: allow powering
 off the wifi card
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
Message-Id: <20261026-exynos4412-p4note-brcmfmac-v2-1-14b372972163@gmail.com>
X-B4-Tracking: v=1; b=H4sIACl732oC/43NQQ6CMBCF4auQWTuGlgrqynsYFjAMMIltSUsIh
 HB3Kydw+b3F/3aIHIQjPLMdAi8SxbsEfcmAxsYNjNIlg851qXJtkNfN+WiM0jgZ52fGNpDtbUN
 Y3rkiVRQ30/aQAlPgXtYz/q6TR4mzD9v5tajf+ld2Uaiw6PIHm0dJmqrXYBv5XMlbqI/j+AKcD
 dU7xAAAAA==
X-Change-ID: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: stable@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Artem Utkin <thesame.personal@gmail.com>
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

Fixes: 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board requires it")
Cc: stable@vger.kernel.org
Signed-off-by: Artem Utkin <thesame.personal@gmail.com>
---
Changes in v2:
- Drop the paragraph about exynos4210-i9100.
- Add Fixes and Cc stable trailers.
- Correct the author name to match Signed-off-by.
- Link to v1: https://patch.msgid.link/20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com
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

