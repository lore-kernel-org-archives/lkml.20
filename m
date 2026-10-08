Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934E3B2FF7;
	Thu,  8 Oct 2026 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484608; cv=none; b=K7c090l2EbCDPUB1wCliF90Yhh8BtZr99184L9b9A0re0xHta2TIOBMLNS0vxjlkJXC0Jvmaq/MCQWaoVwJ8n1VGDjce2AH3H0yG18iAWLGas1sm7Pl565LYtUTP1YSVBdBDul5pHYq6lOZrRW2GhZsDeOpRmQYRmuZQSMU4Tuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484608; c=relaxed/simple;
	bh=z1keIMkDW9sgT1aZElw1oXdTbG2r8uKYS4gdSonjtuU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bycgc/N8AvO8xjGSMhInCDjVWqeBKcLJyrjT1B1EduiDuEtaFDwZhOde7s387Qv47RQFfXEuf4NKuvMfMEXJsOVo7doDxEllVLwtB9XSM8ANrUAZG9nB1Xang0yGOLKFuQcJIgGJXnrh/NNTFHZWNqdrL5aqiDDp4Dr6Ww5zhq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ep7nZiFl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ep7nZiFl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED5BCC2BCC7;
	Thu,  8 Oct 2026 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791484608;
	bh=z1keIMkDW9sgT1aZElw1oXdTbG2r8uKYS4gdSonjtuU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ep7nZiFlrnXc+37ZiMW7HPxnaZKKzGiZ3XG6P8cmjLLGXOzrNsPc/p3weoz6oeNPT
	 bnKCnc6v1dbF5eaabbGCj0EvqQsdZ7mtfu/Q2QRTyNwhkMLVZemP4FN8TCu/LjISj/
	 PDaQuGQwzsNBGyUQvL/VqdUvYwH1c6ra0BYzhW+NPFvFrJsp9+rw8lrUeXximpuair
	 J+9eYskEv7oiyLBtkUvtnlaPOM+/nu3DWy/I9S/2K6TyJSuOa8+oes40u3CK3cT10r
	 yvn57/ZblskmTZVp0I5wlBkkZMlhvZfv3w+16SmW70zyC9fcJpHINNaetieC3CFlSK
	 DTKbGFKgmYqBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58ADCA600C;
	Thu,  8 Oct 2026 18:36:47 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: HP OmniBook X14 / EliteBook Ultra
 G1q cleanups
Date: Thu, 08 Oct 2026 20:34:44 +0200
Message-Id: <20261008-dts-qcom-hp-omnibook-x14-cleanup-v1-0-9702f7c6f9a0@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETix2oC/x3NQQqDMBBA0avIrDuQSaVKr1K6MMlUBzWTJrYI4
 t0bunyb/w8onIUL3JsDMn+liMYKujTgpyGOjBKqwRp7I2N6DFvBt9cVp4S6RnGqM+7Uol94iJ+
 ExrVX6p3tAgWomZT5Jft/8Xie5w9fTCMxcgAAAA==
X-Change-ID: 20261008-dts-qcom-hp-omnibook-x14-cleanup-0b4318b27d1d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=z1keIMkDW9sgT1aZElw1oXdTbG2r8uKYS4gdSonjtuU=;
 b=kA0DAAoBD9OLCQumQrcByyZiAGrH4r2hJnwRKyn2OC076o+NyGhZ7x1vo11mzp7Cm4Yblob0j
 4kCMwQAAQoAHRYhBIWX1PeiLqa74i3Xiw/TiwkLpkK3BQJqx+K9AAoJEA/TiwkLpkK3FrgP/iYD
 6L/i9RHcLuFBZwKJhLomd3da/+diaM4kKRmFIcy+V2PqMdy2eyHgiQcYTRYCvvXwZOhD9Yib3qD
 E6tsKsN0nfYEuF+d1lbxi9guGFm/3L61E1ut9HgKwr2JoKjrJ6aN1SsAS8DgKYTe3hhd/fcuYlM
 5ASPhaER92taeb9sC3NOoXDBGInpwluM68/ShYXxvgcnRWkiwXrbw+f6UpacqPwUDpAFBtfEPxp
 Az6sRmWhUzRmw58yRRAfrWESJuimGRuF/bxy+yVP8X0iWsyNeg9ml7f0CuFpo3IsBDhwb3zi8LC
 I+ttyM2v5a1NHs4jl7amHAgjk94NPa1AvstI0+NeZGS8AaMW/JQbZT+ol5JQD6L8HJgRtmd0m7W
 Zj3Jh706bFoqz3JbugepPSZFihYc/N670QGc/0fiXUl+wV08s0Raku4SAyIUrEV0jogDrfXpORQ
 y4/LtB4TQovPmlPwDWZX6gY3dim5eet4bHI0Bax8f9oWffGtDiCPF7eFt/UON1Cor0mYEIhE+iw
 BYmBe8PqG2E1SjmuWiktyllbhfVxuWxaalJ86IaruJydffi0tJDwxhCIF3SXZQ7rRz4dMRBH5mc
 6OBxrzv0pENvG0Lt+2EbtAJOPLh74eldLe6m3crVgcjylvo4jLW5VODQLo4u+EwA+C2DxU7m2xB
 WtUCK
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

This is a small two patch series that cleans up the device trees for the
HP OmniBook X14 family and untangles the HP EliteBook Ultra G1q from them.

Patch 1 consolidates the duplicated hamoa-pmics.dtsi include and
chassis-type property into the included x1-hp-omnibook-x14.dtsi.

Patch 2 makes the HP EliteBook Ultra G1q a sibling of the OmniBook X14
boards instead of a child, so all three (2 x omnibook, 1 x elitebook) are
at the same level.

Both patches are pure devicetree restructuring, no functional changes
intended.

...Juerg

---
Juerg Haefliger (2):
      arm64: dts: qcom: x1-hp-omnibook-x14: Consolidate pmics and chassis
      arm64: dts: qcom: hp-elitebook-ultra-g1q: Drop omnibook-x14.dts include

 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi             | 4 ++++
 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts        | 2 --
 arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts        | 3 +--
 4 files changed, 11 insertions(+), 5 deletions(-)
---
base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
change-id: 20261008-dts-qcom-hp-omnibook-x14-cleanup-0b4318b27d1d

Best regards,
--  
Juerg Haefliger <juerg.haefliger@canonical.com>


