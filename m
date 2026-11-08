Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117268;
	b=OMGG4j9xqDwgw5QMIPmC8SbFI1L/StfmnidJcqxM2Ww/zUs3jfHTcIqoWvvUmVvW7GYJ
	 CWfZVTW9ifhODcJ68/cP3ovEwQROc5WGSxoXltmrG3EdHDj5Ps72NiH5SUcvMmX/hJljl
	 3ErLETvROqONCWoxXItSp8klKDTuqbLXTtNMDXnW+89dFdfXO8NuPAzBQyucEOjyUCHp9
	 fEFRkBtwjnCQ9bc1DzOvmfNizOYodWWT5AD33scJf68xu6UYGfRqWQ4GbmbNALlIsuBkA
	 vsAsYWM2AAkdxyB7TTEN7X8ewaP7nw8NEt21AlkwjU+SD/de2cN96JC8aZn76Zr2NVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
	b=TrucGD4xf/xWtceCWgVkzlVElOppg4mbu85mz6QUIgnFgZSPT0qoPxS8K5o233ovQi1H
	 +8siif2NLupg0ueIkznwhM2D/sBsZowCC0HykADuYScVA2uISpAS1L9BGjW8rgUDxdpwM
	 y05+qym2M/Cc+ty5mwA0XwqT4dbi3IgtlEAILRZtdqvtMjVf3qP7Zu3mxIyVGNZyKJoiD
	 +H2iCQ0tsIFCxUupjEwM7dppNmmLJ7EI4bjaTlcUvchPWZqAOiwjFZbFNbWa0BZif0xpY
	 QaW+A/bbtMQBnT3aO7QB8Nc5e/yROHuuVGlYTQEjJqCILJBH+MpGINqKVBKCmPE23Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boTBU262;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63072606A31F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63072606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boTBU262
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490585eddfcso161921f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117267; x=1794722067; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
        b=boTBU262RK2YOd1OLyUG9d3v/UvvA/mj/XbBNpA3gniG/44sfnl1Y9wzA+TD1KPKLT
         qWsFj22BNFuIzSq8hENGltILEIWlyeGRem5pZoivV7hO3Pgk386f3yVkAyfl9prUI/qg
         6gAE4nad5RLyYQeGWWacm4wToKmSlnYS4px/zyMKuDiJWgA6VJieywpNAOIjxh7Hz96v
         /YY1yrPJt2U0vNin1sQBBceCWIvH+qbLoCsMXUmVOmKuzVC94LT6BqLjb3zOOtG/z77F
         RomGuVgqNNYdqB2ICoAP2vLSk4hY7Nr7pdHiFMEIJBtRQjF3dkpGZkLFLCg83ElrCMnL
         IhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117267; x=1794722067;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
        b=Mm6QL/cqxv7AmXe5AsnJQJuUthkEJX+p8CKqg2F4LhxKWOsMwAVvm5mzyy6gfpjy0O
         CyPvERjkUjrexJI/nZP0m6C4YuHJLSAkwLR60mLWQ5Tn1ZUwNmblpbO0mGfIjgdepaSP
         o2P43JVedZvFAV+HJPQvTEeCLiuo7Jd3WUCy5OeEK32r5E4Bywklsz/kZdTNbCUrhyWj
         9dI0103GhicX0Tm/2dQgZ1502SlhcqULfgi6kthlGsUgjyVcvoJrmd0V+jPVfCHXDmDQ
         XS9IW9lGnU0mPRftn6mVqRZXmN/4BB06rLLdEZZMubTq9V4nCCnjltIQA8JEC1VOBJ3N
         F9iA==
X-Forwarded-Encrypted: i=1; AL+hErGaVjwzwwrf/8wXL4ljFs+TUGTKANw3EqoD4CbIc9Jy4X9qUMijWFsxi651/RxqUHyIAoUf+mS9p5+dDmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iwETqobRVUpsnt2iVU2mwEupLc6hN9h9BRh0Nl5g0/ayg8KI1
	B4H3QjQD4+fEHvtRuADiu+kNAbersQnkJRfuisRLJfNVKwOCX92km1gJ
X-Gm-Gg: AYBFou23eFYlN/53gj74srH4v/CYPBjIhJU40sO6EmcWGOhKEeSfwrYihIhM9J1drVR
	J2ge71YclkiRS0rTKD1cj62eI4VNb30jpnA7XgBSTMdJ1TdzHYtTBpmO9Xt0sfThqats/1bp2XO
	HI+PUpb5wF9SKVX+7REP+DB4pb3jgObWPVi5+sEnXZpvilQvUG4g8IbhxSTAXt/6H0son27Lx5Y
	mbZdlEpohTOj5OlWpq4Te8ls+CrWGc2UL0b7cWML321wrEmW7Pbq6la9NPIc4zdK3NFdg9fshos
	XU/bSvY9Qp+RUXa4QAKNd7uUuyYv8fzvAloZgHY5c2Rgi5vStFS3fPLYnkUHUgvzPYdYTKBjdUO
	l1G4kYNaU1inBbr+Q7OaveuIauHMls9N7CnSWSWJ7EwnaPcjJfooMfRLBT8fDAbs5tYxswK95Z9
	5yt6cRaX0jyr7ZtKE61T8ycOeC/Pn2N656a5TvsU6T4po/iJCF1AZOkblzrW1CeRvFVgwid1pfK
	BoAM21aS93xSAEMVmVZqv1IZhMredJa7VxKSAIUIPFmjZvzQUInQeiQJ0InSGPais49fMgdg1I/
	jyqThWuU7SiVXynKdb7rcdScE05DWD8l/nDyO3fY
X-Received: by 2002:a05:6000:25c4:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-4958d3fa337mr1211047f8f.56.1794117266571;
        Sat, 07 Nov 2026 21:54:26 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:26 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] soc: qcom: Add the SXR2250P SoC ID
Date: Sun, 08 Nov 2026 05:54:03 +0000
Message-Id: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAHsO8GoC/yXMTQ5AMBBA4avIrDVp6yfiKmJRNRiLVjpIE3F3x
 fJbvHcBYyBkaLMLAp7E5F2CyjOwi3EzChqTQUtdKyUbwTFoXclNsLfkJi9MkpWmKUpVQ8q2gBP
 Fb9n1v/kYVrT7+4H7fgBvva7ndAAAAA==
X-Change-ID: 20261108-sxr2250p-socinfo-a250c0a83416
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=687;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=qGwquROsopcDhM+Z4ThxOjcRoNWve/5H+Br9FxG/OS4=;
 b=T1HexMag4r8AxnhjXYeWFmzK9ht034Qz92V/qKDI11bVg1yO1o2yrrrMK/F8XAQrq9fGEyfLX
 3VaReaJcjwXA7VKOdM05c2yaseMFK8VETIa9tiPtBP9L5mkPMHF0y8Q
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID of the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2), used
in the Samsung Galaxy XR headset.

The patches were written with the help of an AI coding assistant
(Claude Code). I reviewed them and tested them on the Galaxy XR.

---
Stanislav Aleksandrov (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
      soc: qcom: socinfo: Add SXR2250P SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-sxr2250p-socinfo-a250c0a83416

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

