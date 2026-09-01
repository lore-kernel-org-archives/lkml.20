Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B99446D570
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253144; cv=none; b=cd10c0UMaEqmJYBVmycGxFPGGmssg3uVarIN3TYzFAk8bygdTKXuUQLpvs4tm+SUI/sSR2tql7RSYboHupqhSznd0ltA838Qr8CyxrhyAbFxeztRcahNvawHDe3xTj1z6jd11L3bVoxpDyagH9wTd3msNL9zVxxZmCO0Yzvxdkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253144; c=relaxed/simple;
	bh=wUOmiA7i2EaKRUV+bEKJTs81gkHvhUOxBuyUyHxqOK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T2dML6HJX+ZdY/lySS6MO2OzT38GrPdlOM6cEc1IMN8Lr13R9bkRFYRMuhpQ3que0Di6iBC3rt1lWDJitkXUlX9cBaPVpEqsyEkEMzUcUtarhygBP+tuNxVny71nxDhosji9toXuK5qgSB1/k4gEw93l8mxAqvP457ToGvvdeWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=h3aOuCQ1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="h3aOuCQ1"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c255c58156bso801728466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253140; x=1788857940; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5o+LGs+bBAm+txc6iMYrrNKuZZMfQFh8GU+2rXK/RU=;
        b=h3aOuCQ1Uu0M0ADm0IWukQ5Q63G0BhhDQXhVYQ4E+hSsQtUgOzqcfqu+uwxj51UaGr
         RiQe7QNrWUpq39F+gOmmlqHhAH7PF9ESldCUueVkTSf1S22v8xCZOBgOoUMWrnrvALEV
         KembkfItZcoVOlUP8sCM4qZqb2jwT566bd4eAlHgI1tkUFmNCZ8LZ4Y1s35vMAQt7eFT
         2HFINOEmb11T3pasU9sF7AsT4iJ9SwdO9LMZwODx0+KnAQgetdKfCtzpwgBGaLYoE8x5
         iwBUuAdMtjEsyt+xoGuRYp2B4tEccE84j/QmaTGAyXM/dxtlSShxosj+cHt0j6WlLlkW
         Lq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253140; x=1788857940;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5o+LGs+bBAm+txc6iMYrrNKuZZMfQFh8GU+2rXK/RU=;
        b=amo9VoR6tZJB/iz2eck4hrAhBat4dMIuz66lDsEwxA/fM834a8acDh00u0tikdZ4+p
         p6hv0IXFhnvOwznd+HNIoJBWMtRTG3ATxeoEVEh6pW8c0Qp99pWIbSTp+tO9z8g9HrRg
         MFhZPebL84j3Ezy+oqVDprdCkL9aetWQKSPPg45N/pjkV8jKVdXdDTi2i/VNZ4464h3K
         l1PAP/g97YNcXXdxFcazTTFKFCJyOnO8JEFhmFkk07QWPfBWEaQgue9shq8GUrf65A7g
         yE87NCV+ZmuS+1MmF7ZvHYQ8BN8qy/PLUTnRBt4sr74GDRlSP/OMerkt5gOIbQZhtMu4
         vl/A==
X-Forwarded-Encrypted: i=1; AHgh+RpRh+SsOZx+jS6pVklVROZis9vn/NKtBLViISD0SbifEzDs/KNer9coO3AYYxIrzi+DcJxXvMHgjep3Ik4=@vger.kernel.org
X-Gm-Message-State: AFuF++nQKqTd8fUjQrKGCEH5oJggF+jwC/vkb6zhQgmGcgOOsdE/Bjjj
	N1EsTmJo2LYB7MFXowSvzyzAkIiSt2GIvRfP2hTCGXdJR2JOHs3jSooqLzpY+0lfFFU=
X-Gm-Gg: AYBFou3Y8VtoKjFazy4bAynJ37wdt4NQvMsXtskO4eOP+7ajCqHdHaqARbfZQJNh1xS
	DwpSm0giqIuwVVvmzmX+bqnZlxBr/Qba3OBoqPLkbH1jkLAAE0dcbEhNmurCbQToBRlhzds2EGb
	VclIwB0bRpH1sDAY0hNjnbk3CAJ87+NIzfxus9vVCowKBqY8RhQLSjlcXakjE9XT15hdfk8OXQ0
	q/HuD6wFSQmgOEwylUMW69GqmyFf6xxgZXKIHHeBRd1Y4TkvwPfcelxHKkXoC3cGkRqI/AHz1Uy
	UtYh0965LBPtGErAFjLqYvgdIfcl86R2gZofeOWXPAwCgk/Q5jZV10bP9pypjSjyWP9c05W55aE
	OICTnXgtUw+jxpSAmytVqyyLaYPgp5geftaPARgC9c3oUtiEoyQFWFz7xcBIj6fl9vQkDG2APXG
	Pu2ZREW3oA8mC6wZMB8+x80NH4zN4JMkEjNBOcpob08CHwyubWnAzPMMsVDK36QrMuN93Lh40UQ
	kBj4CEl+nQkfsFSl4LIlPzqqfH78/N2cXhbn6AMq3w=
X-Received: by 2002:a17:907:728b:b0:c24:680b:3944 with SMTP id a640c23a62f3a-c2557169784mr1987875966b.13.1788253140425;
        Tue, 01 Sep 2026 01:59:00 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add supply names for PM6350 RPMh regulators on
 Fairphone 4
Date: Tue, 01 Sep 2026 10:58:55 +0200
Message-Id: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBeoRTqyVxk7qEtdRLQkVjbEd
 1/djt/h/3cwVmGDW7WD8iYmy1xQXyroX+08MMqzGLzzwZGrMaYGlYc8teuiaDml6YPXGDoiYgq
 +gZIm5Sjv3/b++NtyN3K/ni84ji9W4RMUeAAAAA==
X-Change-ID: 20260901-fp4-regulator-supply-7f6b999e9624
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=899;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wUOmiA7i2EaKRUV+bEKJTs81gkHvhUOxBuyUyHxqOK4=;
 b=z2eqSalHbGfQjzg71aMZg7ujz63UIPZr2SrhpswnbsCCa14W27/nIzJt0iuISGhF0S2inwisN
 7Wb3f10VUziACsCVq2rcq+yvaJ2WQiuMn8q0Cm5JxWtP+/gDDzSxrE1
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

During bringup no parent supply names were added to the RPMh regulator
driver. Add them now.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      regulator: dt-bindings: qcom,rpmh: Add supply names for PM6350
      regulator: qcom-rpmh: Add supply names for PM6350
      regulator: qcom-rpmh: Add missing regulators in PM6350
      arm64: dts: qcom: sm7225-fairphone-fp4: Add parent supply for regulators

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 16 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 46 +++++++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 53 ++++++++++++----------
 3 files changed, 90 insertions(+), 25 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-fp4-regulator-supply-7f6b999e9624

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

