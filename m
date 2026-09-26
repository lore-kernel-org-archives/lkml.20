Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B7420E7C;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426433; cv=none; b=iaQ6Bo+QLDRJJ/Hy7p21S2C/Gost0t2hMIxnrbTtntvJNfu0JVCz9FRP6xnkM0FVBMKT/TtVX20wNMgHJ0Ax1xl7vCwvBc2EzAcg22Xx+L39OAzAVzDpZk7pESl6b8EXX65y8qe1u9EopJfsIM1UzTpYqbgtJQu64opTGtRQleI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426433; c=relaxed/simple;
	bh=xjTU+sbFxgAggl/vVSj98MM476PDRp/Fsy3fzVYTSv4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BanIADQoqlfcWSLh6TZ0KaFpVZwcgmBzgpNeftOtYGTXol45nf7jeRbUOGUPNSlFAPclcMiaH30QqmqbbI9BI0HkfeGiEls1dI9bHoo7a+kfk2VVTTrpwgb0B9JOX68NITVToz0GXE9jR09e3zraorSjFlbFeciPjyageKzLo1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bE24dhkO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bE24dhkO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54A3CC2BCB8;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426433;
	bh=xjTU+sbFxgAggl/vVSj98MM476PDRp/Fsy3fzVYTSv4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bE24dhkOlAkKBhE23guQZryTMkICDLRhSJUs4NvOrL3j7fXP5BdSaYtumo+UnvqF2
	 gGTG7ImDNaUGcOIt0pc4cPYTZ54baVYrZPXg3wEaPtbTDauZwJ4vpYu6qbQLkvlC+O
	 wQuuupYhx4dm2u2s0o0T1AhAZ4fg5ceXCfSplyRPyE+XOobp4mBzixEAJ5OtUtNbVx
	 /0ToO+O6hqDFWzfINBeyTj2L4h95xXPek2SpgnSVP3NdTNTIpjX3Rx6/N9ToGtYdj/
	 7DKXEeAMOanNbAAttcseKm2cm2gZ74zZA5IojiynOouNZXFSDTAI9hHMPM04vg+4Es
	 tf0Pqupi58QEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E526C98328;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Date: Sat, 26 Sep 2026 14:40:19 +0200
Message-Id: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMj3ZLKgtRkXbNkE4vUNPPEZIskAyWg2oKi1LTMCrA50UpBbs5KsRD
 B4tKkrNTkEpAJSrW1AJSvOV1uAAAA
X-Change-ID: 20260922-typec-6c48ef7ac8b0
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, mfd@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=xjTU+sbFxgAggl/vVSj98MM476PDRp/Fsy3fzVYTSv4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt709jwyJHrD6CfhHDqzowkW+fwNwrlSwXtg0O
 hYU/0A3JkCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PQAKCRBgAj/E00kg
 cl9lD/4rcGeu0us3gr1ySqw8KNKrs54/QxPwlFkuGnScpOzRvoBmGlwhjSVxHUwzVuwPv++lOnV
 DOeQAip+sSE/2iDz2vIxpyvOYyvPsS1UgjV2abr+yLO8O5Frn3fyxCrsq1wQS1TIaxyo1SeFWGN
 9Iw4cuQf9Pr9NXOh0cPePkSrOOaxbX/10hk8WdDIFBPCzWtyMsiZIAsy0q+hLLrW2CAqysCKhOO
 zscZNGtbrE1NQgRbO+B77YB3kiEDSPQ+XbISdkXD45ini1gbyOVJ26nzqC7GGTEcQetcfD3GR6A
 b5t0P63Yv6oZ0mYhIH+WhR/EaOQX/1LtAmDsLm0X7MlkokZ1RTH1fugGSysaZHjKQ32VGEu3Zvr
 QVXUWoR/pAe+IctupGWu2SY2WJ1li8kCRngBe0P10hvnjMvYZuwYgPs2aMWg278r7TbeK7L6+RV
 gB36AQ63GzbJPeZhUEonjiTCzEduK+mdOaoCdiqBQjC6nK0CvAIjoy/hdobzK+yUAbuCJKLPxMy
 9kDVzAx82d7tHT8iHz9EHaKXx+ey3x17qZPkveT284VkIYH4UORftQdKaUJkrUBUFTm/DXpxpXN
 n5LsdTfDuwhFZJdZBixrJ8zud0OaBRKcNh5C2nNL2U+ANSqrt7BwVfMsQEVzXIbWGQ09Pj6WP3r
 ta6K+o3Dom9rdtA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This series adds basic USB Type-C support for 1st gen devices, covering
configurations that do not require VBUS power (e.g. devices using
externally powered docks).

VBUS support will be added in a follow-up series after this one is merged.
Supporting VBUS will likely require refactoring parts of the SMBX charger
support, which is why it is not included here.

Tested with an externally powered dock station:

 - Pixel 3 / 3 XL
 - SHIFT 6mq
 - OnePlus 6

Tested with an additional, not-yet-included VBUS patch for non-powered
devices:

 - Xiaomi Redmi Note 7
 - Xiaomi Mi Pad 4

Credits to everyone who has contributed to Type-C enablement before:

 Casey Connolly
 Zachary Dry — LLM generation and testing
 Max Furman — LLM generation and testing

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Alexey Minnekhanov (1):
      arm64: dts: qcom: pm660: Add USB Type-C port controller node

David Heidelberg (11):
      usb: typec: tcpm: qcom: Release the connector fwnode reference
      dt-bindings: usb: qcom,pmic-typec: Update example with vbus-supply
      dt-bindings: usb: Add Qualcomm 1st-gen PMIC Type-C
      usb: typec: qcom: Make PMIC port probe selectable
      usb: typec: qcom: Make typec_port accept also different structure
      usb: typec: qcom: Add gen1 Type-C port support
      arm64: dts: qcom: pmi8998: Add USB Type-C port controller node
      arm64: dts: qcom: sdm670-google-common: Enable USB Type-C port controller
      arm64: dts: qcom: sdm845-google-common: Enable USB Type-C port controller
      arm64: dts: qcom: sdm845-oneplus-common: Enable USB Type-C port controller
      arm64: dts: qcom: sdm845-shift-axolotl: Enable USB Type-C port controller

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +-
 .../bindings/usb/qcom,pmic-typec-gen1.yaml         | 130 +++++
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   |   3 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |  27 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi              |  27 +
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |  51 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |  59 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  48 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  62 ++-
 drivers/usb/typec/tcpm/qcom/Makefile               |   1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |  20 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |   2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |   2 +
 .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.c    | 605 +++++++++++++++++++++
 .../typec/tcpm/qcom/qcom_pmic_typec_port_gen1.h    |  15 +
 15 files changed, 1045 insertions(+), 11 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260922-typec-6c48ef7ac8b0

Best regards,
--  
David Heidelberg <david@ixit.cz>


