Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662095;
	b=hK96cGHJOl03u92/N2+f74V/IFM0tq22fBXUnMXwZkadUdI4ZQ2RNwIRfQCZk724Djxr
	 9knfzhJOJcfdm+Qc3XX9pNDRqpr5JiM8wxgEzXGX7c0dm4p6eEF5Bz0VkaqMAiug7TjQ5
	 pypGvqUe3V9896SIL1Z9JLdupG+mmhgP/nGu/wu/UWLx/M1A4d/Z0bWpC9Wi2qkioFv2n
	 d24UtymXWJAKVG1ub/gfHT4Cm+cnC+K4pjr5Gkh4HuO1RBhKZGRDbY8qrtfzOylUne3n2
	 vdg6DsWg1EiirFpPWDPf2hyEXVM5I5oNjFTIIlTYfIDXHB6EE1iMOGa3mG3TqukOBhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ZO3QijMDlQGB6qI6turwFa39VuovzlWi+zzZq/Y2Sow=;
	b=pFwNmBai4smoiWe/MSAk4XrSW1+8ajOk06Wl0IKAWVQ5r55CFBGHl8ZAwct+pVyVCrQq
	 XvpeYA+trZTKioZUd+QmXRMEuZZxPed2pLIDDIsJaW399sSyVex5KHzRzuqvRPj+jNyYP
	 Rny06I7n2mFAMPqRPv+PXIV9axFLCLUpRBvHOuOkkWCpfFbPPuO9NVrsTbuqQVjw0+GSR
	 9Pxo5rPenLvH8VVxc+LDEbSdJOP4Ecj3lbX5UtBPCBh8B9p5EHfou/WlDmdaAGjSMZarM
	 aDx2OCLJkZdRo+OGHgNI6jE1O+/e20ZibPVugUcH3/0nEMaIfh9HYZqxZzj9EctZtNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="qIjlwC/5";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A08606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A08606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qIjlwC/5
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9e53d011eso10233855ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662095; x=1793266895; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZO3QijMDlQGB6qI6turwFa39VuovzlWi+zzZq/Y2Sow=;
        b=qIjlwC/53Ob/h9wveqCCxyG9bSf/7jYt0zFC+PfBzfr7JccVi1Ia9lUEeT0vP+48cg
         kyg3I3XtG9jdkw093xYuc6ENRd4wRprh8Iz91QwAqcLfS0rt0QchpQy5Vp1ry5C+W6fi
         daSJR1L0aJJpG5xYLIu43uvLNNkvR3ujJNEfW64BJRPTpaXxu/7aztMBkE8y9/cSZFRO
         M88B+RmUx+/hQ27zQjiPzLbT9pK9o9vSjVaJR9CI3CqiOQ2p47jmxl/ccMTbJwK3QrgS
         6Vi6xSMsL1qLBnuP+pAzXjQaWQV93OzyOziSJh9tBBt2t4faan4YnvXy8xZ9ZwmaPw0P
         MZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662095; x=1793266895;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZO3QijMDlQGB6qI6turwFa39VuovzlWi+zzZq/Y2Sow=;
        b=DSsvonJL4rcuanIt0gdy/eP8q8S48VLbn+bcQAOweJTlyq3btw9i4LSXxCUFAN7FJr
         4gmmHMVZ1RM8VkDFk/ZSdS78wG17GGBJJwa45zyUXeDp0UKvZ2fl1Kp0+zFKXQgZqR9X
         wf7HbPwzuhbmbzRv8q99Jnqj8wBKP7WZAH5XlxBezoi4lJQG0bZCgAxbSjjgUpHPJ4wd
         WeF7fwuz/iMlH8E527IVdKCQSFXpbUSBEt2q0U6wezLEIAwmE0Ju6Vo9f6rZuDIQJUbu
         O4AiK+moc4rPWLTxUT8r/0lVtkoUcQJ7BqGXYQeS0aRBxLBfYO7W4tK8iWb4PLdByiE/
         Z66g==
X-Forwarded-Encrypted: i=1; AKwUvByJue+DZqYlYfNA+AKgySc6KtdpmZ0Scm8XpUlqO9LuYBhCkbVZvczFwFvwrqDduwBCx7RpvmCrfR93oiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz2vzABg/Xy9TwUzBFMB6N4N8mg+MmjY7JyUjdjR8pNPdVFfot
	A0oxmSPJXSWq7MbIgcrB24nNOFg9QhZld+q/Yawo1Lru4r8HuqH9Q4Sm
X-Gm-Gg: AYBFou1DDTvNX0t+VsTPMkanszPYgug0p1YnB2Qr7ICnLDLXRZNL5T/Z6ioffyMYYJD
	JDZLpTCRyZB0NS5XzKyhG7OMQViBYAXRrsgUgufB5xCYI2SC53pWGloaoqd0CJewDW0ku1+j+vy
	iUFnOHO9PBuLMg92cyrGWn8Dq/90/w/T5V5nCnNpybT8T1fbc4iNTUh5pfLnR7P96uUlFwyJ6SM
	Jfh+2AcdcEIz3c0qLi7vrO3w6GOAUAfJf6CcDLTpQo7lrlEROQBLGrVbahE81tmQreM/yGwtoO8
	5RoKCL6eHfjO0n9YOd8szMQe4mhG5VjtwQYogpflnyAAsu9v2vM54YCAe++3kgdUHwV7y/2OfTs
	ZFW12YOGSJE+YpOQ7SKuJBzkrGnvB/ut1yGCZ1+Y6X90j9upYIWey2bUqAi3lwe6Azah+WyuFsX
	0T5SdwUSkBJ4IN9iACGwuJoev7oEaiaz5AdnzEIGd7KH9Bo0m8x3ipWEyiC3qam+OfzK/WybtMG
	nzpkjkwnSJkGB2JtNUMQv0uyLP3j9JZWUAe15qHdmhVug3Ymg==
X-Received: by 2002:a17:902:ce10:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2ea43fbc008mr40821225ad.48.1792662094813;
        Thu, 22 Oct 2026 02:41:34 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:34 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v3 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Thu, 22 Oct 2026 09:41:09 +0000
Message-Id: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBBFf4V0bU0fUsCV/2FclHaAMfJIi42G8
 O+2GCPLOznnzEI8OARPztlCHAT0OA5xyENGTKeHFijauIlgQnHGJZ28Qdrgi5ZaGGaVUKrRJOK
 Tg3jeUtfbd/tnfQczJz8RHfp5dO/tV+CJ+2WLfzZwyqgFq0EUcNKSX9pe4+Noxp6kbBB7sdyJI
 ooyb1Re5xXUld6L67p+ADr8iXrrAAAA
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

PSCI on Qualcomm MSM8917 and MSM8937 advertises support for OS-initiated
mode through PSCI_FEATURES, but rejects every PSCI_SET_SUSPEND_MODE call
with NOT_SUPPORTED. The cpuidle-psci-domain driver treats this as a
fatal error, so probe fails and the CPU PM domain topology is never
registered:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

This series adds a "skip-suspend-mode-switch" property to the PSCI node.
When present, cpuidle-psci-domain does not call psci_set_osi_mode() and
continues with the topology it has already built.

Skipping the switch is expected to be safe on these platforms since it
matches the behavior of the downstream kernel, which manages the
cluster power level in addition to the CPU power level, just as Linux
does when OSI is supported.

Additionally, it also adds the property to the PSCI node for both
platforms. For MSM8917, additional change is added to fix the system
being unresponsive at idle.

---
Changes in v3:
- Swap ordering (patch #3 <-> patch #4)
- Link to v2: https://patch.msgid.link/20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com

Changes in v2:
- Small phrase change in the property description
- Added property check in psci_1_0_init()
- Link to v1: https://patch.msgid.link/20261017-psci-fix-v1-0-dedae27e4a31@gmail.com

---
Alejandro Tafalla (2):
      dt-bindings: arm: psci: Add skip-suspend-mode-switch property
      cpuidle: psci: Allow skipping the suspend mode switch

Reza Kurniawan (2):
      arm64: dts: qcom: msm8917: Use a shallower cluster state to fix unresponsive idle
      arm64: dts: qcom: Skip suspend mode switch on MSM8917 and MSM8937

 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8917.dtsi           |  9 +++++----
 arch/arm64/boot/dts/qcom/msm8937.dtsi           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c           | 16 ++++++++++------
 drivers/firmware/psci/psci.c                    |  6 ++++--
 5 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

