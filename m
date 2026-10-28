Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215130;
	b=D4coV6xFFm/+A8aa4ZntrbrU7YgZBiMGx4zKGPurkmzXLqmthpXd+Ob8dn3P2lBB6K+Y
	 aEi4/n2GmFp3D0vedDCkzdEef/OUs+bj/q9FY28cQO9jRwTRA/3Ki2BaxdMeuw1vBMbNP
	 vFjYXA4xv8C5KqKFVGn6yFfvNg50/wMtELji8RjTwComjIMKN2f0J3SQbTqOywwkmvAX0
	 WYWEaXJq1WSZ6DO+ume5rWGzqhoOfIhmTMv/Pztw+ye0ak0BmIHK00VdopYX6vbuqnAYV
	 F0u0ptt2ZK+bvgCo/1QbYRB8hs2RAMm63t25EaEgGybt+yH4y6LcDPZmEqfCnK1EhvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
	b=DchA17V7SvAxNvCJsmpX+3Q6ahzaFmYx9lv5QslojkC4SiHzKzYPk8FnIlKPcDc3UwGA
	 LHgF4xrd+Cd4+giEwx/PRc7JgZlRY8b3CFXtVOehVpKBFEBsXyU13cJuvun3irjAtuY4G
	 FBjEkMTyvwZ33NH+902OMutr/jOQ1+uJefGVgfSdN7ZPVD8frWHMjiwwmGbqdfWZmiPv3
	 fS3L3HPHw2jXidhEfF4geV88sQu1ilEfcenQ5UaNT2qh2L7tUAc3keL3M250VGVzrnFdu
	 O2vTMz6Zh6tIt/ErQjzFifgN9IgkhrT/OmDpO7d+0i4D/Qn0v4nlNeNaU3qnyUTmU0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poYg7JtD;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227A5606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 227A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poYg7JtD
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4877837890fso737184fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215129; x=1793819929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
        b=poYg7JtDStt715lgpaSNPRhqcRR/NCASHkbcxI2Vh3WH2m/+ObY04VAI5Z4kMq00Xf
         aOwkqLh2V8bQ5JwX/uKoAmPenhlTKmqwzs+xLW3WJlma2HME4vwPyG1bFOa+HmC9Lk1X
         ronkRHLgtqngw5ofLvaduIOv2lH/58Ljm7LV+eGbqq5z5j9WjZYutZ4atQiahIllJSSz
         ZH+FdBpfgetva2PC/KgR5P5L+X7/dW/Td8nbwT9jP9VlVyZps4ePAwX9ksPgpBJMz4od
         8lXmG5M8XBXTzFPMleYn2OrdsIeq/ipbW8fmobG44F0scnJsrxuAHRJcuPDTPtB/caT8
         SDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215129; x=1793819929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1G5M1f9Y/OD8XK4DhamsKx4jsdaVOstj5LTRN/WC9Q=;
        b=sWDDapgtKtcw3X0l1l1hjJ4SDvHXN+g3xc/4N+vRtKAOHjl7Re1P6iSu8YKg/Meuhe
         a72ZGVIQzF6pkxzGw40fV0ps3WFufGU0Zpiu5yYHuwRIeLVlf6kTj8QplxlPyHnibKyg
         wUMojEYasHytAkTQWf8c0UMwFLhAi73bVM6Ijjn2xdohmnSGwsJzR6Hh/GCOnvAUIb/O
         2D/hbkNk7huWNXvDdARj7a7xMqyydSCNyE+QN/CR/LcFrbrumoOImHxXyefTLIH32hfe
         jYXxV94Iied4yQ05cY/QNcif4tQiKTBFP3oMTFE36ENALBSiP9w08z+0DnGKva5LHlIv
         9dLg==
X-Forwarded-Encrypted: i=1; AKwUvBz6ZrFIU0Cs+tcZvozs7SqZTECD24LnPAWvFSqlDfYwxbBceVBigW58PXqOmzLhAhiRAtuiEkWPUHLPLhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8t01AKt08zsxUcRYopKuZfZWWqD1of1a6QaYnsYFnZguMmysL
	JncNf5hnqEj2YRt/OAyU1popV9Y51TDHy1ZYBNJXwXU0FKCBFvyXBd90
X-Gm-Gg: AYBFou2CgR0vg5jVORLguJ/QVTlLScK8Fhh3cqAuzzUO+CJ+9NQixjkgV9sAD3wFg4Q
	dn3uAIrOQtcALdjvPYl59R69aYvf85WqeF7dzA6rpgt2RdT8lATnf3oAFYHyrZOnLEE9DYKoFWF
	hlB5dlmUrQpihDm9wl7yjUpwzjhq08tIq6+uOnaF4XQmWmPrqTQQ4+/mrn3dkYFG+va6hxx9x9r
	9PixsDeiV2qXcaSGphgPWdei+DaGoECk12OfJvWpxlW9sAK1wDx5MqSouzwB54slWnux+x7ALTu
	434peRVZhFokoGN3yhHFjR1qZbgrhng2R1vX1LHeOpUqDfjmVlRTHgzTKTJ9pYPg0a8eSn/5XEz
	lJCK35SkhlFaC4sNi1LA4foUiXMNIbBWlFuN2+TJR9KmBmSztxjT/LSFlCCeXMf+ZiZ10R/CwL0
	tOfJAQ7Ya07hoBQSmEPrNl3xCR18vOQ+TsR2bAKMAXaYaFpa9J8Ni3iRWZA+GjHFL379VelQga7
	16KvemfxHhcyqoIAVCUd3dPgFfQkPNwqz92qnWlD2WcXkuy+9Ndckldf+vQ1J/+RJf0EIvZMHuj
	9/mk3JNwYl1VFY9UrnWKmupTA1ruITz3jnZwnqeg6VxpS/J5NsmNC9gzDQ==
X-Received: by 2002:a05:6870:569e:b0:49d:cac9:28ca with SMTP id 586e51a60fabf-4a8bb21d55fmr2619589fac.2.1793215128834;
        Wed, 28 Oct 2026 12:18:48 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:f26:718f:8dc1:b185])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b785d108sm3092916fac.9.2026.10.28.12.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:18:48 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Wed, 28 Oct 2026 14:17:58 -0500
Message-ID: <20261028191800.27829-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e kernel. Everything listed
in patch 2 works there, including suspend (s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v6 [1] (tested with v5). Without it the stream
  runs at half rate and the monitor shows no picture. With it, about 1 in
  4 plug-ins still gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.
- I hit one hard lockup while plugging USB-C devices during testing and
  could not reproduce it in later plug/unplug cycles.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I went through the regulators against the
ACPI power votes for v3. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v3:
- Set vreg_l1f_e1 to 904 mV (was 880 mV, copied from the EliteBook) to
  match the ACPI power votes on this laptop, rename it to
  vreg_l1f_e1_0p9 (Konrad)
- Add Acked-by to patch 1 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20261026154001.9323-1-jeff.roach0@gmail.com

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 855 ++++++++++++++++++
 3 files changed, 857 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

