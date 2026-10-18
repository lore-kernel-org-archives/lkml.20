Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28686419FA6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297801; cv=none; b=bVvJcVOJbHDJu9Yx4WENhl2pmZOd+Bvo9qFwY7IsD/wwk1PThOo9FY8MPU6rAJTO5joLRtT+rwnAl4Jqa1cLOf5mxSV42cTZ8bslgTwFhzcv+BC2B5HWU8awctbGX2pCCYkX6kNwan4NVYXirm0elVsjkGSNG2mB/un+teLHA7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297801; c=relaxed/simple;
	bh=Anss7133/aANMPtcn5QRXQaxDH/4VeyG3Fgcsy6YMc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EBnNP2fdyuquK3ESbe1ruJo1CrGZmZZKMMvAEczwbKY+5byzTgfngr0rNpvD3h7xpU6nmVEDGXWa2/GsPmTWgoJMKdI74/fgjXQR85vvpaFV4JLnQKFveS7EZihmC7wMEThO84VDig9Oxe/Qz7MjQVTgyzpxhrnfnlWiD79l+YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbJtyab6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbJtyab6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6d28aa26cso3848155ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297797; x=1792902597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=;
        b=bbJtyab60pRpfxg2B0XuPjmJrIruUt6Dq3k25lsiQSFIjD5OaOQTdlME1k67VsWjho
         +kj7ftF8WBjhxabYEodLwoPGSZnRYLm5aZstMbMhxCLyHYebf3Sp0eTNYGqohVEHmzWo
         trVh5sjLSBoTYSgMjy3mo2tCnTv3OzqF+oL0R4sXKTFI94F4sb75bCOcrrXGCKv5Usmd
         CmUwk/acpeF7KwjCBbxD8Qi2UxA5L9+Wbe+DKBgf5yKCMuohpEfQFTlGZh4Adty2d8xj
         JSAmU9mVqech7nH08lWEMfGxVk96sXSmX15b4f2+CFMr2G4C5wsndrxlmAZPikfb7ugj
         Ul9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297797; x=1792902597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=;
        b=J0NtGGclVcoZt+Kqj2C6ujMVpf3tcdnmSJBHq+yFwu7/ahbj+qJ3KCTHUF/fohawX7
         VP+3LnntZWZ1OZ+/9EQ0MacifnGDXvlDxadV1fEEJhCaoVKh9nKayJBzsM9/zS5N0JkQ
         J8i0UYTh/LxV7ZNWBHGKvMwQ9CKUxUDh0UAdJ05fqvxmpPyjHkG6jNy0ekP5VcfTIZbE
         pFWVHzvQm9AYRw2n8+3HQnSU3tvWv/bP/5DMuHw92wkGWZUYH4VR3s1/fnuH8PelNlxt
         LbpvVYWHXF3QxhVp8UNjVMRN0jZHfo7Q5hRAXieXjgDdmd3z4HuKXXOahF7xe3uE+V8z
         8m4w==
X-Forwarded-Encrypted: i=1; AKwUvBwm0aQSBgP+efTupbr8oV/aNxb4gx2sIBgt9ptk18TrCrRkVFikHkuP4uyFl4/iPr9tgdC9RzHKxTuXGUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmprV/S5YH+cWrcYy9GgLMO8hmV0xPuZ7KZhm6YMbaXQVyFM1O
	O5hgZPEF4v9BvIjXjcRkzV7Pxiq+mZN+D/dO+7fua8bA7SVmglsj1qw1
X-Gm-Gg: AYBFou3Zn4OIMp5m3eX2dFf/mU2Nr6e5CD09XDYzrzmntd4vpHnUA2dn9ElEQervFu3
	/xzgSghPT0BsPz4UeWVYpFzNKS4RBIxNnZ7fMqZMrEXvg2sEJefAl04WPFihzpkmqfEaS/BCv4d
	lnmCtHhpo2dnEq3aB1XY1GiBszxPNUI9Ttbye4bB2klnWwVb+v2IOK4kjKGd/skNOQlFZ4/rYM7
	ylIRAcYKfL87ffvOHUdCBcwNtrpaguA7HqDi4BFDV/t0wAAq+FcQLRfpsEQ91WekXZUch+9kc5a
	u/Q6QDLGmOxJiTFXBqTwr5gmQz1XHzjd1Z9cS//N4Ec5PhxXJU5+P2XCvwxB9aarkRDA4bbarCs
	ZWe9Zr2rdeUdethyybGDqgMI5Tf+j5igyNLJOP4eC9fr0SyJFR4Ii+HMKGe0yfTuEgy1Lvf+fd9
	yKX/LY0AiUxtgwKQsCZC8Y/gszD1xdM2n5p9EOqc3PxJEMcFw4lBUlE/L9uqbK25U=
X-Received: by 2002:a17:90b:5610:b0:3ac:8897:7b88 with SMTP id 98e67ed59e1d1-3acef5f43f0mr3344212a91.58.1792297797308;
        Sat, 17 Oct 2026 21:29:57 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:29:56 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v2 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Sun, 18 Oct 2026 04:29:20 +0000
Message-Id: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ7CIBBFr9LMWgxQQ40r79F0gTBtx9jSQCWah
 rsLNcblm7z/ZoOAnjDApdrAY6RAbs4gDxWYUc8DMrKZQXKpBBc1W4Ih1tOLnbU03CqpVK8h64v
 HfN5Tbffl8Lzd0axlX4yRwur8e/8VRfF+2eafjYJxZtFqlA2edC2uw6TpcTRugi6l9AH3CMdds
 gAAAA==
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
 Reza Kurniawan <imkyufie@gmail.com>
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
Changes in v2:
- Small phrase change in the property description
- Added property check in psci_1_0_init()
- Link to v1: https://patch.msgid.link/20261017-psci-fix-v1-0-dedae27e4a31@gmail.com

---
Alejandro Tafalla (2):
      dt-bindings: arm: psci: Add skip-suspend-mode-switch property
      cpuidle: psci: Allow skipping the suspend mode switch

Reza Kurniawan (2):
      arm64: dts: qcom: Skip suspend mode switch on MSM8917 and MSM8937
      arm64: dts: qcom: msm8917: Use a shallower cluster state to fix unresponsive idle

 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8917.dtsi           |  9 +++++----
 arch/arm64/boot/dts/qcom/msm8937.dtsi           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c           | 16 ++++++++++------
 drivers/firmware/psci/psci.c                    |  6 ++++--
 5 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

