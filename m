Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5823AEB39
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255357; cv=none; b=l04TNXHnyicxxgHDV4qcbdjGA59nZCycWI4qD0fE3BYMj1/U7bqiyQHYPITo/WxO5PY2aio85OgBHMsghAzo/kPQE/+ipMfXHxZMXPErWcwLKGlAL0HsPfkpiHY/K876Rb2hZjalxmp/AZcN9iZL77nz+mqQh1l9i241K7zNkG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255357; c=relaxed/simple;
	bh=PvCtvOycJmdiDgVzTzfFtgjjZ7LYOBs5XgQP+trDJVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nl3dPgAS12o5euF+bJqpnq6vysvYvS/pKZRqn10E3zi/Rn8u4BG2Ra8pfZVl/0i9uKzrRrzfAr8YyJsKc53X4wd5qM0ZClbtPxlg/r+c7J6BTfeE3Ezywl7s2iIGzHUlT/ISx5u1OKK1zTJVfZAQrW4Z3ad+loXr4u0n4ryUhW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw4WZwvf; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw4WZwvf"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so461501a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255356; x=1792860156; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=;
        b=Fw4WZwvfriO+l3kRN/bjOuImPUIFcZ4lRcFN8sxbu/R3cDe1FXp4WayNlgdiBmv9RL
         3M+Sje4h0j3Wl2Kg2POv3bAOlngb4bKncoO/Kbpu+6NmXM5mm+HN0v4W01F9VHcG3Ve1
         19JI4PTBa5/yworDhfq+D/T7dTs50MaREmNhr/I4FzNsu9qkzsibWS11efYeSahjOyar
         ke/yq5QSzuKc3TIedoyCV5JPonmqGY8Vl6BSBb3zbdy+NsEUe+d4Kw1rPojVPDK9glvg
         oh5YO6Meiu4mWIJI9k8Jb72O4l71Ybalm3lle22OjHBf8h5RGF1Ka25baN+JxO1uVdQz
         5NtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255356; x=1792860156;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=;
        b=i9Yni9d4OUDG0O1m9oYhb+kTFjEk7NbvUaueX7UAPnwUIU2+yVUBLvU710AxUMX/JQ
         mdt1Y/utNU7UDenE90S4fVfAn/t0VlgWA5plwPb77sRKDId3idI9iYZVxH0cj1BC/mBW
         DMZ7PfPRR0y5REXX/uHQsuEZZUOoQFbA91o9jYfW+VroIdKDtaJlX79oko3QHo+ytVRu
         Y0qebIXsxz1EHiU8liIeOnb8Y2Tw6xM6nhVmwIxDkW/1+/pwvRn19dl9sqvLYTnw0IHl
         3pP2yBp3b7JYLq5F7ou1PZg5Sgp6o2Rip1d7Z6bmRNqfwDOJpukkV+TEFW5QHBlhZ0B6
         p3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaAyHrUt9lQdUU0I88Q6+V1CZ0+u04dqF2O/pG22CgNjhiPZ31HaJLcRo/pxeEU1MQcAzhgxbJE+h3hbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzbZRlyC8FniSMnvyYJeUmIZ4Ldnr4JrUXIDrJz+zS77lieNJf
	IsOtyn6oQV6CqZOrSbbXKTuhXPrtZAR5ZuvFV9bB1WUTQNG72o2OGJMA
X-Gm-Gg: AYBFou2Kgyvw7XlwLfrMpW3xI4zj3h689mXMBYI4XdMnMby0JPRxjzRM+wz1Sot0wEt
	JPYKk/x/UxpHVxUsSMJNnqla4aOBXU8yXKwXl8QXkIeEW1huqzXZbcGpMPi+AF3nPYzAUC1mG1O
	ctPooVI8rsNfwdbZw9L+OaDJbnsDO3IfY3rt8Gd9s29KRUGLN7TkoheeoV0ue8GkfXRFgLe8pAN
	jfV/43W26Gpuwo06kEZDjvoCLrqTmDirL62JYSwWfb0gKeLGiL5ZugM3Zmb5i0QaA/xfVAdQPlD
	crg5V5SoRa3MMLYtCss3XTjYTfoQUkAE5rdqgPHQ+hVI14AYk9/adufbB8qN8Q+o4LGFz2ZDFP/
	L6X15+7e0JSa+U6FsP3sdFQQyxlW0VqYsgzTgx6iBo+3eBiQbwBP/2HuUhZwKST3Pffo5i/OaBv
	0+4Ff/Z6L2vGajCRDFwQHd0Jqgra1CArQWgn0FrSjrsFopUb5nIq9Yxb65YB34fg==
X-Received: by 2002:a17:90b:4c8c:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3acef1486bemr2929602a91.34.1792255356104;
        Sat, 17 Oct 2026 09:42:36 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:34 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Sat, 17 Oct 2026 23:41:22 +0700
Message-Id: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqAIBAE0F+JPSeogUS/Eh1M19oOFW5FIP57V
 sc3zEwCxkjI0FUJIl7EtK0Fqq7AzXadUJAvBi21UVI1YmdHItAtWqud9EYbEyyU+h6xxN9VP/z
 mc1zQHe8ecn4AiZ//EGwAAAA=
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
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
 4 files changed, 29 insertions(+), 10 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

