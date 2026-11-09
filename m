Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184200;
	b=3xnHpgI28MzwEpT7JjmJw9wzdW5duvKWJJA5XtTi3sknmVUviBT/ITt9nqruW60TgdRk
	 U/Jqd5EXATOQErxACdApVkfik5N/9Mt1AxfUlY1MMkUcoKtvaCnIi+wCzJ6lzi8gLknkM
	 3wwxNm6QDCSFbmi9SLLaGl4wPySs6v1w+t/8G0o+Ilqa//XYkascC3fjcyBFJVEwqDNuq
	 xg2nODvHyD/XjFlrc1BQv2osLH1zhbD+MsDp7u6sDQxXrHsJG9nHB6+Q3vBvm3AS0IudV
	 tLCbVWSXY4tacd00EfLNDKiQ2S4PBanrh9Qz+mcMVGWrKMSOsNy2yDDXg6lz2xy4b5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
	b=SJPCRQMds6BnP2z2OsWQXR/BHn1MwfHpt8li1h4I517xnoVLykgasz9cC14QPK67e3t+
	 ciGJOLqnECA/gKsSwgfhvgiijUMUmkgnNryAZCIWm9VdvcaViKTLxLmn+Cv9zEBexmgev
	 vZ4VGfQIPoU36An+17KH+gSHX2AcOze9Mm4DH5fk71jKQe0FkTOHRmF1V0bpJerZ6biUe
	 YZbYH9JExH3iwbuS0EUFZPi82DKMF3ztDjecL5iJc9LQqKrx6MTWA7WxJjn0Mln65Ux0m
	 toxWrefT07UGE/zJmmXKAqoB/uv7WTK2W7Kl/XH/R/7Zo/Y1eZ94C/2Cb8x0nhePMQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ify8EiE5;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA3606D817
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BAA3606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ify8EiE5
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49134c8509fso283510f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184198; x=1794788998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
        b=ify8EiE5p+68P5QNKi+l3dMtkPP16GvbYO6rdEREedQp2Y9270NLejDTyHFsqU2gen
         7vTLOi3RvBgCiN8Mf9HuHJVOnuPBWHxNakhf/9Iu89b7iFMixvQ54a6T+s0nmCq9NoTB
         kRLzVRg1hSJ+jE+kmackVFXicz/DARG4u0+D2piKXAQ2ukbejN2x93kygJJQ8b8bKznV
         C4j5/4V51GG1dOawM1kfnCb3gADE8wbzZE1pn5BzgxeGtd8cbZhF2hsv4CoXz/f57CkJ
         K7tvV3a41LnN+CYcEDupNFekHD5GjCH17lZ+Jy5CrljHBxUOPn1CFS/eRagGFmkEAyIt
         MSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184198; x=1794788998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3EKd0ikyZyrjPebrQ1IcrIhfAZXuC/dKRwkgcXP0o30=;
        b=Aiy+pp45Cr97lOYbcfbNetMHPl9jeu7VQNnJyUzgM3y4oYG6M/HuFDejqKnF3ZKt1d
         uwf7Pc3I1YJec7au2ir4X6nRVv9ItOR1qM1UDy/afW2h0jXxDqUE/WJTwdDhRfAiPdQO
         MdnqPrv7UW2DnGKBLOlhzhRC7jPR7XRa6vLJ3mG3cTDY7SHiIXIBiGDXReFZjSsCAyQ1
         WSdIU55u1e5696UdIJvS0bTAqAhSJ54pjs39uTONM2kSluDZw8U22hPQ9u+LbSTgrKTF
         qkJpXSf8AbqhqiLTTL5xaM/k7TtPa5n4Qm1QZn6wgHb+FPB85WhZFB361bqZ0f/J+wsv
         oorw==
X-Forwarded-Encrypted: i=1; AL+hErHmZQUq1xWnQ0RCm75WG15keIPoytZmXuaXSQiITqR4REgL9JsvjLpQvOVBqkk0/xyBhQGQ6wz2wOIkzYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yvaaIVjMs2PTytrVZ5HIlF0sjAF9x5BPw6+9vgF3fg4VwcRP5
	nbHpp6O4O/3f6pWXz5+bS5iM0rIwgpgpAFvgoqCJGlJt9g5LZs2GplRo
X-Gm-Gg: AYBFou24hl7J2oFBnIkAPaO7oe+SsE50w733q28C+DMnlHiZ+ME34OqX/ty4yBsNU0c
	5sbkAxe86vPDd+AH6mDvBJr60idqRtsQviPHzG0BN81WT2NKS0EH0fWFGMAzhLw/Hdop3RXKXXN
	omvHUA8yM5DPst8LboHZZ+zt8yBZJHJzfs+IHHK3Xx3/hCW5CwsrRLI0bP2EAdszzm+CfKS3FmK
	lfCMTlg0/lzMuJ/uCiq9Qta4IvG0W+UFlyBH5M14Pd2zC2FKfT1VZNVUXNu1lu3dwh5YOZqQW/J
	gc3XkIaOgQJMacQPO6wmhUtPS9GxgdqJX3AfrWh1r2Bg7jsysw1AqQKRO92L3D9Lqmiv1AE3dto
	NPlm7GEj8LZACmfRRslRql9z2lhihiJEiAPzXcj73dZRXe9cUIEOCnRY+INDfNk4IM7QV9+R95C
	aUxICKQavCA672AzkrzWM9/tNO3XP4lKoxDS5swM9GGmZUUUlxJUngprF/QjzU4IG/+is7GIieD
	sG/vlJjT3Q2M2EGnVi3l+Kd1mm/fey+fF292122kVypjXfZ2ksnM7cr3pIKpLzh+FZqNuidq/au
	XtApwIlMtbJ8bsMRMBuEc0P51B8+pj0ToSSsAgDI
X-Received: by 2002:a05:6000:1a89:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-49585f85ae7mr6393858f8f.57.1794184198082;
        Sun, 08 Nov 2026 16:29:58 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967a70a35dsm3479742f8f.9.2026.11.08.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:57 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] Add interconnect driver for Qualcomm Halliday
 (SXR2250P)
Date: Mon, 09 Nov 2026 00:29:52 +0000
Message-Id: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAU8WoC/yXMQQ5AMBBA0avIrDXRppVyFbGodjAiSIsQcXfF8
 i3+vyCgJwxQJhd43CnQPEXwNAHbm6lDRi4aRCZyzjPNejOO5MzJyFqWK6OkFA1qVUBMFo8tHd+
 uqn+HrRnQru8D7vsBiUZdo3AAAAA=
X-Change-ID: 20261108-halliday-icc-65a5442be859
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184195; l=1171;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=IRLmg/T4Ucg8fvDrl6bT8sXAYm2xObD8gKEFdhhsCHE=;
 b=lGzTTrqn4CIpaQ3yuUtw71gJGLHu95Xl3xghzfcX63IbzmYYaFNRze7fyq7lB969c/V+njIFx
 U3IaqwXIkvaD/gi7THqtoaOagrl45KEfyz/rxyv/2ExdFssL1eFvW9j
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document and add the interconnect driver for the Qualcomm Halliday SoC.
The display BCM voter is left out for now.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Halliday SoC
      interconnect: qcom: Add Halliday interconnect provider driver

 .../bindings/interconnect/qcom,halliday-rpmh.yaml  |  131 ++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/halliday.c               | 1909 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,halliday-rpmh.h  |  158 ++
 5 files changed, 2213 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-icc-65a5442be859

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

