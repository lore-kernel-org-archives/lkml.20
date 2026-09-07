Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207543EAC80;
	Mon,  7 Sep 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796694; cv=none; b=VQg5F7UxrgsymoI9vYPkYm1RmVL2rEi4xyN1bl5MIicJpruT0+Fv7ku+btj5PZdHzNVp1THSaivOsf3qUNYc9A81L8oUZ4mx/ZY2zcTYK3PYFtTsm9aoqPFgq6w32ffl3ZiQwOKNsZkiYWMeNQtfFDnSqF9QbLadauM12YC7JHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796694; c=relaxed/simple;
	bh=izYpDFcedIv5VF1QLbBfUUUj17Afor//XCv5m/lJmRA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zi0ppueLu1mvkVxyYGq3d5lMBJid+m20eS16xNH0WliIy5C1ShGGA+SIJjlUyrRl1mmhyfL3vAAWn4OsV6qS65bgWFaJ1aibiwAvWaTbC4RRwqZDwhrmzIcMpcaaZDerk2+tho9oKHFI/uw2gAYr49mpDcHmO8NqdixWeBU/mU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzf1tx/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzf1tx/S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3216C2BCC7;
	Mon,  7 Sep 2026 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788796693;
	bh=izYpDFcedIv5VF1QLbBfUUUj17Afor//XCv5m/lJmRA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hzf1tx/SZ4hTn1ZmqYC8s+K4qM6Y2wD7FvU3+vyE+rBHRPIcQVNy0rfpc3L5ahI1s
	 TH9uelBkwD4MYNlHyrU3mEeZo4OJJz3Ac7gDkJmSNpShiE29UWCtjng+Ra6g123g6G
	 xHJoDktf0BB5TqWHSS73pb3cOWcVws+ZZQ38wuTJg8GKBTPVlj270p3bfbSZhXeB8D
	 iMEumGQRM6Qc85g5f9A2RZ5agrFEHT5Cj+Cf7uTaH1ep1JtiBhBNUOQi4WmgSURVGL
	 z0kiuu7/4hFbadwlw8QblhQWDPhWL5OSGAw1BjOnUnRh1jB7i7bYSW6Nu4X5t1v2DC
	 6dh5v8PCvvOXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C179C79F99;
	Mon,  7 Sep 2026 15:58:13 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v9 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Date: Mon, 07 Sep 2026 17:58:08 +0200
Message-Id: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33SzU7DMAwH8FeZcqYozlftnXgPxCFJXRYJttGWa
 jD13Uk3pHaZtKOj/P6xHJ9Fz13iXmw3Z9HxmPp02OeCnjYi7vz+navU5FooqZzUYKtjOvGHrqL
 /5M5XnggptBaJWWRz7LjNF+a817dc71I/HLqfS/wI8+k1yQAUSSNUslK1rZ10FmxwL+mUhuf4K
 +acUT20KlsDAZF8CGDirdVrq0qrs2XlgiTpHYC8tWaxNVBpzfwuRh9AaYdW3Vr70NpsiSzpFkK
 DXPTsVlbJ0rpsfcsGKHBr6mJW9drezarOFlWjlY4u2qboGRdL8s7ipecWLCFqbXCx0/XzO/76z
 js0/G/ANP0BYhA+QmECAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2870; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=izYpDFcedIv5VF1QLbBfUUUj17Afor//XCv5m/lJmRA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnt8TRklC8ZXMii3+CfbWksF6uiZYCnV9mpcvT
 nQbqrdTYWiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCap7fEwAKCRBgAj/E00kg
 cscjEACAO54PjNxZG/RO9TuBsV895kdUM1WkYyB5ahVDpWrg26MYkQs/argrYIibSQUI8gmUel8
 LbS+kjX7nAdIdMTYLukoxsMjpAtO9nptZAO+EaMHFa48Rn0rjzpxK05QBtXmlP8PuL6tgm8ccl7
 Lz2b3GDO5uIGsE+vud8HAVuFbgRDLb7MB21IqbCaQrG/wzhy0Jz1nLVvr2J/Zt7dnzNfBZyf9+D
 z/OBxk0fHUbH8/xervUFFDR/qa14nc/ABcbskvLL1jI0hAneWh1Kn211rdrPVTl+jYkIY+kqUQw
 /aWxLvEJ+ClPEF+jUkr9fwUclJnx8/931eKHz9wEsF3sacgugnUUeItU1pQt8uSKEl/2nPZjA+W
 3uCLMPAsWiuxh6IcGG8GzIkhdnFBDtQI2fDSIZqK/hqFGuJ8q04hALheiPfIggJEZjvxuwogmCX
 qYTUq7TyAelFmGsCWsyyeK2/7ZBq80PseobYpRcZdx8bi1jTnQjPBhfeUjGNfp79DevCUagEM2W
 LTlOMZ2rzXq+Q/mpbWksIhRASg7CZvcS2/bRd8Ne83Vxu432o2FbyXT29suCI+zmJ0ULfrc0QB4
 xgI5i2N0QbNSXeoyaNBJCSnK3Jt/eUz2buXp8up1GQpwFQESMP9NfMLcRjLLHTqFexNsic6Kgpu
 Q9joSWQcEjsc8ww==
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
Changes in v9:
- Dependency merged, no longer depends on anything.
- Link to v8: https://patch.msgid.link/20260901-pixel3-camera-v8-0-99f159883348@ixit.cz

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
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260315-pixel3-camera-a9989bf589ee

Best regards,
--  
David Heidelberg <david@ixit.cz>


