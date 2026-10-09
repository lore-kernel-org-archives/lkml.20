Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3518C4B5CD2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545119; cv=none; b=uhkVaHHWa7AV8UDF3TPP3bVCFEYrO81YRMcdmD43L3Dqm0IyRCrqeGq3n2FdpH0JLBH29xC8FfGeRWNK0k+wGJla1A+UUKbOqJYLicosAeuBzgmD6PrGE4EFXqHcKcRLxlgs0gOpxpc5kJqnvHIRn2YhAylsgjYPorJ8yaU39Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545119; c=relaxed/simple;
	bh=3RiJrg3T/A4hkKUCBr13+wDz2DdeBZFJrHuY/UKpTuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QXUF1rXPPP4i9whSZm34cb9JS9P7W8V970OAECwzgAjTPBl0heAzKFjP5oM4e1ybBvFcYk1M7tVZxdr8jBe984geCO//V3EsvonOjzPLz1ra+j0Mx90MfDN/WnqlUWG7jDid1Sfwa2hdChwaKweBUeJfpDK35vNHguxjIfvmp8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MpGRI8OK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MpGRI8OK"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5372222a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545107; x=1792149907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N0b0o/iVMAqwN7EkNfQamm6FVceYxCUCOkfAzEvfWWw=;
        b=MpGRI8OKt4hPgbXGQ54W5nO4Q+98xXay39DFPsWRepYfkTzj8FOQ0VGNjeH1F1NQhR
         zETB+ef1og9GckSpPIqKrCDUISjs++6JkylXYycbrDc3Rvbb0WvcDOIscoc8ez3Jmp2A
         U5LP3jF7CKsTYSO0Dt0e+xiPHmBPh2v/JEdkyVx92XePUfjsS6pD0R/LnICGOUbPzbo2
         01Lb6pY1lH+PDG3CAJZXOxVUpyo2FHrvb3MgXiwQx3s1ePhptG+M09I+wtaFWxnm2bln
         Hizwz2pHhtqYzqBO4XUkinY8TdJtJjUzEWLBS6BeICcS/3lhYElT4avQ5e+lMQ3rDKDB
         cqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545107; x=1792149907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N0b0o/iVMAqwN7EkNfQamm6FVceYxCUCOkfAzEvfWWw=;
        b=rJxqs77B1MqlVVHHmeEJmOjWP6mT46sZiyx5zdeuPUNYQQB09devQeddpM/hRskax6
         0Dxl3a7rE4zTiz/BujUOgo++XzhH9TXKMJAlkyorfkUxXxh3en/zPIFbKhJYNRzqq5NC
         ad8aEdpLyCYpMwdwByZcN0h1EWA5TRnoXCTx0f+HLm2Xi5YI3oF1vxmLnosChwX4K8YZ
         yjWjXxOrkgS8vDfo2UM7nranNGGkbd/JjDpGziRnHfcmPGGzGe21vqm2OgdMaUdCgYtg
         OWIEGk7Wfeov2vk6kLlCevkhiPgAIzDGG8ttBCmXS2M9PXt2yR6cltZkRkpsBlGJF9XK
         A6oA==
X-Forwarded-Encrypted: i=1; AKwUvBwNuO+lkEPiMm3hW6OVkiK0kmRPwV3YDMHo/otT63Aa6OI3IaQyErF7KHyp7tNshsReM7yu67ge72RkLfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE+mEqethpRdVqG55MDnOr9DTmaty/tK4cwpYIgqZAXL+M6d4+
	4aQHor+MN+H/FdezU/J3BKhbKsndA7g0O4U+xSjv14zD7pbNIyLQ4x0ABnEBJmDsmi8=
X-Gm-Gg: AYBFou3xrhPAWj+222gdyEIdC+Q72Q6Pvn4SP1ekFy2Nt2/guZbDATCJbT3wsE7+7JG
	BMcfrDwUrQ0GzyBoW53FkZXia06HZRAvdoTpWmig/eetLlfhW5zeAlgyoWDfXMVbUAJaQNYxLBt
	fXRdJRYgmhiGVVVTqHRBH6OrLFlSt8speUtVTqiV4vRscNmClalJ+q1J9JMDPxC8gWKEa0EdEHp
	wBkAIPrNvrMdwiIH3lb1BIFS6Kq6/e3eFVMcasCG6TqEsDuyOAniLHeW86G04tx8rhoOWlGlXG/
	TjJ2XRPo0VsY84Xl8y8dXmZvw5Q3wohwmLDIq0fjAbPVSIBpMAAsMCB8p0PbWOgT9H6KUnwU3Ae
	ufPPrWjzpPCQ0FmbaXThn0wfef/d9RgDkzuzFL30VtMj4jajYz/aFHfgw+4jernAuX30wSR2ds6
	cFNQKSYC8ZU5+9L2RnHDglk5UQbownOlRDDJbKQJ+ESv73xnj2Zww1AHUcpQYFD/yAtazBoIcu1
	+mnfH1htTCO/rgmyZ2zDxrewTW+v0VZCsOYEPBXR5siI3S5BD0M
X-Received: by 2002:a05:6402:5189:b0:6aa:96b3:9d7b with SMTP id 4fb4d7f45d1cf-6b17c29892dmr1280328a12.45.1791545106487;
        Fri, 09 Oct 2026 04:25:06 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v4 0/4] Add Novatek NT37705 panel driver for Fairphone
 (Gen. 6)
Date: Fri, 09 Oct 2026 13:24:59 +0200
Message-Id: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQW7CMBAF0KtEXmM0tmPXZtV7VF3EkwlxBUlqB
 wuEcveaULUIsfzSf3/myhLFQIntqiuLlEMK41BCvakY9s2wJx7akpkEaUCD4N1k+NQMdOCqVRq
 dc611NSv9KVIXzuvWx+c9p5P/IpxvA7+NSN+ncmS+15hvEnEcj8cw76r8tlU8omI33Yc0j/GyP
 pbFWn7xQxYcOIFDD9pogfjeNSFO/TjQtsyuS1n+ayfso5ZFG+M01gDWSXil1Z8WAPJRq6Jrb6G
 zyqNT5lkvy/IDgGAixmABAAA=
X-Change-ID: 20260501-fp6-panel-3d35c999d894
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=1623;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3RiJrg3T/A4hkKUCBr13+wDz2DdeBZFJrHuY/UKpTuQ=;
 b=n9sHWAPeaTz9L7Cy6z9jwdx3y6w5vzk+5mzW0/ZlQz3qGFVUMFYW57e+R6ZqSvxIy0hegT4mX
 x3/J0mNuhZHBttdJDYIRjMBMuURkyAbJDcdJ6clw7UjiSEyywsqyeAu
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings and a panel driver for the NT37705, and then enable display
on the Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v4:
- Use MIPI_DCS_* for a few commands (Dmitry)
- Link to v3: https://patch.msgid.link/20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com

Changes in v3:
- dt-bindings: don't use 'contains' (Sashiko)
- driver: Use devm_drm_panel_add & devm_mipi_dsi_attach
- driver: Replace linux/mod_devicetable.h with linux/device-id/of.h
  (Uwe)
- Link to v2: https://patch.msgid.link/20260918-fp6-panel-v2-0-6695c4008920@fairphone.com

Changes in v2:
- Fix kconfig dependencies of panel driver
- Pick up tags
- Link to v1: https://patch.msgid.link/20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com

---
Luca Weiss (4):
      dt-bindings: display: panel: Add Novatek NT37705
      drm/panel: Add driver for Novatek NT37705 panel
      arm64: defconfig: Enable Novatek NT37705 panel
      arm64: dts: qcom: milos-fairphone-fp6: Enable display

 .../bindings/display/panel/novatek,nt37705.yaml    |  71 ++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  64 ++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37705.c      | 396 +++++++++++++++++++++
 6 files changed, 545 insertions(+)
---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260501-fp6-panel-3d35c999d894

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

