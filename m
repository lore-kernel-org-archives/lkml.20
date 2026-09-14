Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B84847124E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396680; cv=none; b=ghoURw2RQ1OYUoJxj96U0eAPraLr4/jxWNTnc1EVfGbihF3W9JMSKlHtB1+XAVg29221cRUcU6iHcStx1fuPeOMvA8vhjzBK3FjBYN5MMgQEpZwK8A9XgXeW8MOfGSDOS8cQAxMp/0jwoB8pdm3+jy4OPlugj35FTphp09VpBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396680; c=relaxed/simple;
	bh=iT/FZEMnleE687KdY6E27lK5mHHkASo1EJs5U6DSIK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TiwnJ7w3TZ5hT3xqi5UXr9dhKVlPzVCITJoh6Jo+ilFprwnvjLX7C4hMYQBqlAICTPrslJ3UsVa6pzZ8GhTZgHYQIprqHt1h9tFnXTB+IT60LRHnuZHD9YmTDqUW9bD9COx81bywzIsSatQnHxhTw+mGLkfb7aKH2M2aExb9vqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=j5GHoz6D; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="j5GHoz6D"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2949ed8cc3so550559566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789396676; x=1790001476; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0o5vfrfW6OtANZ4B56aGkknEqwrzuBWv+LAox018S60=;
        b=j5GHoz6DLJJ2/0ozKpIpU/PCLfRz72rzK5kdnzD1nXm0Ls7wH5Ii0xq4fhc+TcOdsb
         Sm04RHvNNoGA46p3CNYLvOqPO2k5ZCk/PGVqPMvl2rYYAU4DVs3Mx8z2PdOGE4YfBCMt
         CkAaBoahk6Dkx6VwyaZbje7Fp279I8kMFMjoGvSRcVkOEjgtageDRhy/tj1OzZ2iCLCs
         Vk2IlmsPYDTkTBxvh0h/8TkB5pvz8Evs+Dw5dA8waLSehkEspV3CK2owu3mbc/A7iUec
         V6B7N1X7m++pwTaRIBQKqXYjdEVFeCEI/02CGf2N81U93uzdhB3YVCjO+tfUXSPAuiWL
         q2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396676; x=1790001476;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0o5vfrfW6OtANZ4B56aGkknEqwrzuBWv+LAox018S60=;
        b=eNfOYhIufmvyHIeoc6HVHLDs/oA6/9oHYt3ydQf4ENzinRryOit7i2TLgfBWBKMAxk
         JK/ITfVQyQxupd0AgteVrcb5i+D9yOa220Md6DYJt/Vm2SPISVXn1U598teO4u1BRNVW
         WBNTSwLi0vC8KK/MMl3RWKUC0w67kyg2TAnSUc/OIg3h7actZRI71/emE/UV2bUgKH/I
         J1e1SO5mLz7otxuzz36kzcadmBjdosVG7Dp5y2tORB9ybJlLXyp6/bCUUeInMb4j7g9r
         pxa9nMgzjaqNt4r7ZYFHhXJAMqQ9dveRTSpnEbzdeqioNiNUPCqYhv+rmKMs8VWe+PET
         5ZmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOHhzQ/+9MIB0wugNist6uZ9WdIhkxeYinTmgpIiAuIk1X/QIBrKK7HGHosCr3lnNL+QmWgoJVXR3f6PA=@vger.kernel.org
X-Gm-Message-State: AFuF++kfusfZmXOWQ1B94Y+2IWuN/D0waW4PrRfyTCJ7JDlhmcU+AwuT
	gQNllL+8Q2BR5rJuPb8P0jHEQADseGxi505E0A0SU5f7XEfOpvlu1Q53p50V5JfgMFI=
X-Gm-Gg: AYBFou3Ajs0cbCD9svCA7pEC16uAs8q1bRlvjvfe9BqCzE2SZVpKQWETPnbZ+iMobxv
	TzjHLrpfkxFk9iJ2egt89L1iRABz5BFpCXJJ4eBnBK0A6Q0udatcEC7wnwPCwHfbffRKDvl5y+9
	3kOH7jFgC0nok5E+jC/6unDllCEknTCi5orCOzSV7lWMDUoUgUqmFdeqxxHFcq8gP0jJ3GGEB2k
	Xxp+F8MibaPG1fyrNgPdfvmZfwlDFDn06y7ZcT69mTYeFBwXcMYvT9cot+Jks2i/kF/IBprwIcP
	8PPHAbB3fKt9yelo6Bhes0DKJHqRueU9/xYayIJ6g1onDZvJgM2OtqxTc7bWmVH9rc2RwB0P13R
	HyQ3DV6vgQuX58+/S/tNFlNxXe007k8hFM5BAHrryI2pIyL1FRdus5n1pAYq8RIsnmbWKe520Jo
	Cu6SCt/j7WyHLwLGF39YpIgbWNkZqwtq0QCka1RGDL1TMZkR8TLrz+sw5HB7vSax0fvchk6PlwM
	xm3J8H2eeoLevRaceOGFAjwiCjVzdzo/wP/w6uCORAKn82YmAZE+v7zvNwFQNAzLWVL
X-Received: by 2002:a17:907:72c6:b0:c26:19de:912d with SMTP id a640c23a62f3a-c29b86f1ac8mr215323966b.32.1789396676416;
        Mon, 14 Sep 2026 07:37:56 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660b29a7sm449634266b.43.2026.09.14.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:37:56 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH 0/3] AW8695 haptic driver.
Date: Mon, 14 Sep 2026 16:37:46 +0200
Message-Id: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALoGqGoC/yXNwQ6CMBAE0F8he7aGtthSfsUQUssiewDqFtGE8
 O82cnyTzMwOCZkwQVPswLhRomXOkJcCwujnJwrqs0GVypRWGuE/tXG3bvRxpdANsep6pg1ZaGc
 rLdFZo2vI9cg40Pc/fW9PM77e+WE9Q3j4hCIs00RrU2z2qgUHBe1x/AB2u9a2lgAAAA==
X-Change-ID: 20260716-aw8695_haptic_fp4_driver-397431e97638
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789396675; l=1104;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=iT/FZEMnleE687KdY6E27lK5mHHkASo1EJs5U6DSIK4=;
 b=eVlU1pjmzGtg79PQ+00EkT/kSE6G8qdAiCpTtZHnhwFBmeUJP8N8oQKkA6tnrhHyrHBJ1VI6M
 Y6gUnIrzPkdBXpzT67RX+NAjLPRBoddY8a7/MD1NFNT3lbAZX58vf1J
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Clean-up of the aw8695 haptic driver patchset that was sent in 2022.
Variables dependant on devicetree have been hardcoded, and unnecessary
functions have been removed.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Griffin Kroah-Hartman (1):
      dt-bindings: input: Add compatibility for Awinic AW8695

Luca Weiss (2):
      Input - aw8695: Add driver for AW8695 haptics
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics

 .../devicetree/bindings/input/awinic,aw86927.yaml  |   1 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  26 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw8695.c                        | 753 +++++++++++++++++++++
 5 files changed, 791 insertions(+), 1 deletion(-)
---
base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
change-id: 20260716-aw8695_haptic_fp4_driver-397431e97638

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

