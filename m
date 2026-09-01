Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9655377553;
	Tue,  1 Sep 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256009; cv=none; b=fN7KJ1tMiTBZSLlI7D0Bb7gRkgOpRYShIB7s8aiJ/xEW5ysajeC/dRl6wPLibTxZmZ9Wf1k8Xp4HnDKGTvrOF8rSAUXdxNg3498atvaZ3kbLmSsqLQCEy2awPYDVE8d/jC/oarVeboCDMvrD5aJAjcbt3yglXPKdDoLQXdVNefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256009; c=relaxed/simple;
	bh=EuCdSn+Ko6zSoRheVp+OKy4lFzIoAq22EO3x/9VuSHg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e9pz2uyD4XldBCAsVpUqvEUg6Rv7eea4caEhK0HkF3jXAqroRqXi/p74JcYDgyHkvXgo7H73ruQWZSY7BIxRm9XKnRrNSy+J3p1Rd4Gg+ksnEUSiMW8tpRSlYJxVPxiF/m5C3nPoJxnbszYLanmEt5fdXG5vRMLIsYNuID4W3wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyRl86Li; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyRl86Li"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 398A7C2BCF4;
	Tue,  1 Sep 2026 09:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788256009;
	bh=EuCdSn+Ko6zSoRheVp+OKy4lFzIoAq22EO3x/9VuSHg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fyRl86Lib/dIt3+OZaHEhNceY6N2Uvxx3e8fRcHQzPJmlHscGJuE9X8YvLgSVjz4/
	 1B/xedMAYXcVwru8j6u38xhoiC5POq9bqPAro8CkouqR86c66/HTsUmZV9kBEBzq/8
	 KJ8oWSSy4ozHYcgc1yMlxOwcBFyy2CsSMzQ2mgSXJz2aKet2T7fj2T80ExpjFLtRFs
	 vB0J73CnkOWJnft4+mSY+3+AJMhYM7/FZlhDqGd/49luVexSnN/s3nFuueGnqJIT3r
	 olrQQl3HxwVVNtEY3vef46uY/Vo6dW25F/c45m+PYByzFFFfMU+lIc+NtVEXFoe36D
	 Nk6UFHDaGusFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2130CC624CF;
	Tue,  1 Sep 2026 09:46:49 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v8 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Date: Tue, 01 Sep 2026 11:46:44 +0200
Message-Id: <20260901-pixel3-camera-v8-0-99f159883348@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33SwW7DIAwG4FeJch4ThkAgp73HtAMmpkVbky7Jo
 m5V331Oe2iaSTsa8f1YxudypCHTWDbFuRxozmPuOy7cU1HGfeh2JHLLdamkslKDEcd8og8tYjj
 QEETw3nlMxnmiks1xoMQXlrzXN673eZz64fsaP8NyekuqADZJMwgpVG1qK60Bg/Yln/L0HH/KJ
 WdW/1rFtgJ0zgdEqOKj1WurtlazJWVRehksgHy01d3W4Le2Wt51MSAobZ1Rj9b8aw1b743XCbB
 1tOnZrqySW2vZhkQVeKRU1ZtZ1Wv7Z1Y1W6darXS00bSrni+3Dxzo84v3YLr94n0NmuIaaaUT7
 5i73T4cRM/L001h4q0RSoYUZULrTd3w4DgNw0gi9odDnpqCh+CU0wGVw6i9rAkkWggWKySbKAW
 IiCpxI5dfQw/iXZgCAAA=
X-Change-ID: 20260315-pixel3-camera-a9989bf589ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=EuCdSn+Ko6zSoRheVp+OKy4lFzIoAq22EO3x/9VuSHg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqlp8HS44DHCeYlAege+kyE/npzSoaKH+ehizUK
 GeM53R3qNCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapafBwAKCRBgAj/E00kg
 credD/93Y3g86maD4SvQHw2BG7fojyQsF0W3XbY8lzMvI60Z6PwIvJj6wLKAoyacz1fYwV5sOVf
 KpSkAzkdVof94AwD2hHSYSzn7zVk9BS3/2HgpDh1L0nenetZNSW/YbQpxqpVlhC+daDXiK+grQY
 Cjy0ypH3A77qz1HHOyMmzTm4pJ5hsLqCDwcPG6jVsTYwyDHnbJ7JWRIWY2pCeOy4ZuwqqZc+8e2
 wk7BK50pUJa1wwslVKj5n4cQHxm6AGwhoQ3efGp/BJJnFT+iy1qLDsGQNXgiC8hOupBxGXFzxsx
 cd+GsybTGoBoAOPZpPcSYL/dVK9/30XwQ12XRqjVMao8oxPdoq0Kmj449I39Gw1Yt4jBH8OwQCY
 zxKLtV/7nN6mBP02DBBaUtjhOBGGlN36Q6DNU6yBxSYpKWpO2SB2c9VIu9B1DtSXPxVDYBXGOvz
 NHqnGYGujzTgRqoQSTWZy+GCnMiziIPjcDPd2EGsVFzw2unmFykbDSkFx1m41QSD7URSwoMKlJk
 pIsIkt0Nr58N+eSsJi0x3HWri46Le/cNixYmR8lDVLpW3flnq3hya4H+rjvPv8TLUpvL4Qe9gRL
 p6Tmuxi847HZpWlLXeE5j63kLzxkLUgabP+Ec0afgH4MVmlre6RYTu+n3KMSZJxJyWWbThcKxob
 CFNMYB+AHSVDZHA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Describe the dual front-facing IMX355 sensors (standard and wide)
and enable the PMI8998 flash LED with hardware-accurate limits.

This brings up the basic camera topology and flash support in DT.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v8:
- Fix ordering of includes. (Konrad)
- Link to v7: https://lore.kernel.org/r/20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz

Changes in v7:
- Depend on the
  https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/
  (Konrad)
- Sort the renamed regulators. Why Mr. Anderson, why. (Konrad)
- Link to v6: https://lore.kernel.org/r/20260720-pixel3-camera-v6-0-afe419bef476@ixit.cz

Changes in v6:
- Remove forgotten bias-pull-down property from cci0_sleep node.
  (dtbs_check)
- ..-regulator -> regulator-.. (Konrad)
- Rename camera -pin to -state and remove _pin from the labes. (Konrad,
  dtbs_check)
- Link to v5: https://lore.kernel.org/r/20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz

Changes in v5:
- Added function-enumarator to flash LEDs. (Sashiko)
- Dropped l22a regulator needed only for NFOV actuator. (Sashiko)
- Dropped vdda-csi[0-2]-supply, as it was unused. (Sashiko).
- Added previously omited cam_mclk2_sleep sleep state.
- Link to v4: https://lore.kernel.org/r/20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz

Changes in v4:
- Use 24 MHz ext clock for the cameras, as the downstream does, since
  the upstream driver can now support it.
- Added additional LED, as the phone contains two separately controlled
  white LEDs flash (upper and bottom, in one module).
- Increase flash-max-microamp, as I took wrong "flash" from the
  downstream sources and dropped Dmitry R-b.
- Address formatting issues. (Konrad)
- Link to v3: https://lore.kernel.org/r/20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz

Changes in v3:
- Dropped cam_vio label. (Dmitry)
- Move the MCLK2 pinctrl from cameras to common camss. (Dmitry)
- Link to v2: https://lore.kernel.org/r/20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz

Changes in v2:
- leds.h include escaped the initial submission. Fixed.
- Link to v1: https://lore.kernel.org/r/20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
      arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LEDs

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 199 ++++++++++++++++++++-
 1 file changed, 198 insertions(+), 1 deletion(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260315-pixel3-camera-a9989bf589ee
prerequisite-change-id: 20260608-kbingham-orientation-20afc0fb6957:v4
prerequisite-patch-id: f6f506c34bb7e7733b5b63a8f4a654f3302519bc
prerequisite-patch-id: c45901f8d919eb99a5bf282a1c89f5aa7c36cc52
prerequisite-patch-id: b2c8278c88db9d929453b8153f3e698cbf0053f9
prerequisite-patch-id: 3a3ac2a645475b80538351a603f1c5d90f82f600
prerequisite-patch-id: 68e98a7f998b731d8c5520620e48b63dc839cf25
prerequisite-patch-id: a974449f960564d9eb0f6b042cc50469f906784d
prerequisite-patch-id: 4eb276bae93e280d14a1acdf5470006c4aff5832

Best regards,
--  
David Heidelberg <david@ixit.cz>


