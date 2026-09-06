Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48373DB30B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704460; cv=none; b=L55aL6PE+WLpcQDSLlQDAQMtKjf05ipckcv51MPvdXfKU/qElzHanpw1tejjc9QPwnsua1I/q4G5ahuosUKGmb5SC9uk6Q6SrJcpzJ6B0yqV60Ggh3xN1bSlewoWhqz69d5CpimRUPxhNw679XLR7Q0kiXGIIX0/C1aKERWaaDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704460; c=relaxed/simple;
	bh=etqEEFkeJcIX3lqa9eRXFbFOJs0Vg/DpeovmAEQLbhQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YKGMs98zE0diMQInYvGlD2JQab7KOr3zRLQKjhfsYEuDGJBBVrtTvQdqGpZCKjQ7SHJVpN83An60mAavaD3jELMNzJYie8unl7S981YI994hlg5RpWWGT0nM+ehX5+ZWDnYjXDrrhTWHkMBLFpAQUmAobV39AtNmQBb44uj2Z18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KY6Gaekl; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KY6Gaekl"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba14so2303720f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704454; x=1789309254; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/W8aszwjZdBVKtXzRsN2cdUmqCgdu/CTE3YvhQXzQRk=;
        b=KY6GaekljH1aQI8sZbqWStwihlhFpu3DjHeP/dOSSQiD88u7demZo+1wroItOX5r2U
         wiQ3Iax9qdqMQmaKcd+d/2i/WkNnd90dhbrafmGU2fnTHWloWsoFIXoqwAGvGFKIX40H
         qtzOEeGr39oLvhhue/R0mkFCm/XU8/sTf2OwOU5Nik0aeuPHkt+qqMPwvfz+05XfiRU7
         1KxjR3o0MbwZENt9eh3cmn43qFxIUFY4lJkXsN3HULkMqHRibgnXBizlXPSbrnEOH7yQ
         312j73nHp0VZnEat8d1X86hYcDuIt+BaiiPGnqgtUX2JLruVqzc0sZWfzoYdJpMMF70T
         d1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704454; x=1789309254;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/W8aszwjZdBVKtXzRsN2cdUmqCgdu/CTE3YvhQXzQRk=;
        b=kI06hoh6dT0J6YkzVgYvxCjtsO7Ejpm+D2nOTms70ucnZZ1OGZCs/waGBv7XFO1kPb
         mVoeiw/ldWuGOXpcQmiqhARz2yd6OFazgHKcIKN1cq6j1TDWQ0T8J/3zq9RrqJbJcUMt
         kC5O2ObKeRkgPT1aNO96AJaFPh64Lb6JhI1dp0yLgSOSjc3a/DcDxmrQyKU0ylf08KkI
         V7OXk0HCyBwDjLIsHcfNPptwWAH1cFYs0MFkDNnuM3Ni2UhbOKGlqcfFM6+B9nJxRImV
         aG69EvlNXXV9748FdYXTGbcM+SFdqVVULYpq8AhRI4k2s4QzyOVeWu5ywGUy7udnyPzH
         HOcg==
X-Forwarded-Encrypted: i=1; AKwUvByKXeq64MdPigkWGLwHty0IbKS5Wb9VGtUKuKupzpzYCs251MPoi33QU+x/14SVGtM+xo3+Ys8EYCWRCeM=@vger.kernel.org
X-Gm-Message-State: AFuF++lXK08o/pUt2L4pqi8xGZBfEsbAH1MpFFVZCkYX637oInIFJqYz
	AhqURoYZErEQVQIcOLvsoYnryvrikVcPhOznBW0GOM6Cil+TzhWeHPvGohKHAsxd80s=
X-Gm-Gg: AYBFou0fL6I9hBvbaD7eDiuksGU8TiT6YLfKS7hoTuAncEiTsHTnaCnZRg8gCXuIRzb
	xSE4FAplEKoK02NPvMiduzYfkDgm9kzuR2oKmcUL1P2wpf3VHat5Z1/vXT06qbBe68K2Xkl6jI+
	YQaRqFqxGN3Cq9zcGDs7s2Wy3R7dQNTbR4wwmW+u4aWEcUCp/exID6hBIeT39rp+A3nDz0/mFac
	gp2uVD99uXUr2FnVljUgB0qGm/IIKmsp/ueQkVMDtn/2vdHA89Z7jBQ8KNZA7o4C5N1GusCjcy6
	rZbQ7O/3h/k2PbcLXYwCQCDUxsdQwAblNW+GWCBsmLnlwz7Q5VpKLQKxfvCMS9qeVBVu0H3JdR3
	HSnavodMc0lwh8pF4I1Q8jHHE2fLVV2Ao/lhA+6CiWpa9N8LI/HTba1I8Tt/+Acg5i/j8FUMwu3
	5dQ5IJGoynpc/E4JIpl2B+NYvJcGmf+CUMC2LYCp2LIJ7iPqfFRHYdKRlEA3vZ2j10TyUklKirP
	A==
X-Received: by 2002:a05:6000:2388:b0:482:e968:86d2 with SMTP id ffacd0b85a97d-4858728bbb2mr18098681f8f.9.1788704454361;
        Sun, 06 Sep 2026 07:20:54 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:20:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 00/13] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Date: Sun, 06 Sep 2026 15:20:45 +0100
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOwW7DIAyA4VepOI8JDCaw095j2oFgaJC2pIIqa
 lXl3Ut7Saeo3fG35M++sBpLjpV97C6sxDnXPI0tzNuOhcGP+8gztWYgwAgAw08y8uB/a+WhZuC
 H4czpWDNHCBaDIE3esrZ9KDHl013++m495Hqcyvl+aJa36f/mLLngSaWOKPXJavf5k0dfpvep7
 NkNnWGFlHwBQYMsumZ5xM6JDaQeoFcfqQZJQu+UMFIav4H0CnXCPod0g7ADpa0n2cMWwhVyQj+
 HsEEUrCSLPTpHf6BlWa6UaJ314wEAAA==
X-Change-ID: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel J Blueman <daniel@quora.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4683;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=etqEEFkeJcIX3lqa9eRXFbFOJs0Vg/DpeovmAEQLbhQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXa/PTl+WWhgojBgcxUBmELLAdC+QRB2eZusg
 LwcHgdt0luJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12vwAKCRAicTuzoY3I
 Oh4BEACoWQyDBjBdERIrxPpa2bmHGM0wwtRKhsgpvUoQAEPR9APlZ9sCZoPyOa8x+V/elmLwPne
 rVGea04LP++u/MtJHg59gdVtdhApKhW9ERsWdoY4JG7cluHkaPS1owXSnWtqBFIggJwX0oolzEc
 DKAFl+G+ZOj+popHc6OE8jniU29QZJhZbPgQSJ7T9ENNoklDYSxUATZcAw/btnZgWFO0U14s+Fq
 XxXRmlwKHTGiq610RSIGLi/zHUbWcMHDtbPmufcriih/09tSZo4ryKvVWlkDMPOxmYH169orvsx
 lBUvrae+1nPPzYlY+2KiSKQyEWS4vrpGkKX5kl+KpiFf9pW3oWVGN4oeCeuuYfYPhlC9Fu1b4KB
 NitoKa6REpEsk2XILXEd53Bh9TChAjBcoKsEOGCQ+X7lH4NwDHPtfyGuvvBievzdYRR107O4/BY
 CP7fWL8TAvdgvGxsDm6qZsl7gblJVOuMdL8FNxenuOZQ4OmnNjwlCIOSpnZhBmAGaBgT+Nj50Fo
 BYeBqjweN6XZP27EYbr2tUEUq1zxGHAWYNBnUGg0ZjpsxaUISajHCg7ICOQehcbH0fsLXNiGuhK
 bBRAStfjtDwUPvPU+w/xCayHlsNDgYC7N0kTje5Z53xZl6vWOfkxGrFJk/SrnJOtzxhIiRJd/bv
 dSz3ZWS8Yr053BA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Changes in v6:
- data-lanes start at 1 instead of 0 in the CAMSS node, aligned with PHY - Nihal
- Link to v5: https://patch.msgid.link/20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org

Changes in v5:
- Adds Konrad's RB as indicated - Konrad
- Shifts DT from vdda-0p8-supply to vdda-0p9-supply as per schema -
  Krzysztof, Bryan
- Reworded commit log on the optional supply change to explain
  standalone CSIPHY nodes carrying their own supplies - Krzysztof
- Moves yaml changes from PHY series to here with the DT - bod

- Depends-on: https://lore.kernel.org/r/ 20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org
- Link to v4: https://patch.msgid.link/20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org

Changes in v4:
- Implements agreed port/endpoint bindings in CSIPHY series
- Depends-on: https://lore.kernel.org/r/20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org
- Depends-on: https://lore.kernel.org/r/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org
- Link to v3: https://lore.kernel.org/r/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org

v3:
- Too many depends to have this merged in this cycle plus some review
  feedback on the depends patches but, for the sake of completeness with
  the other posted series - posting this now too.
- GDSC dropped - Konrad
- Clocks dropped and renamed as agreed - Konrad
- Using mode PHY_QCOM_CSI2_MODE_DPHY
- Changes ldo7 on Slim7x to value indicated by Alexanders
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
- Link to v2: https://lore.kernel.org/r/20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org

v2:
- Defines CSIPHY as sub-nodes of CAMSS
- Includes updated OPP tables for those PHYs
- Fixes supply names for RGB sensor on slim7x

- Depends-on: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org
- Depends-on: https://lore.kernel.org/r/20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org
- Link to v1: https://lore.kernel.org/r/20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org

v1:
Add the dtsi for 
- CAMSS
- CAMCC
- CSIPHY
- CCI

Add dts for RGB sensors on
- x1 crd
- Lenovo t14s
- Lenovo Slim7x
- Dell Inspiron 14p

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
Bryan O'Donoghue (13):
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      dt-bindings: media: qcom,x1e80100-camss: Make vdd-csiphy supplies optional
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition
      arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
      arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8 voltage regulator for RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor

 .../bindings/media/qcom,x1e80100-camss.yaml        |  28 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 489 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 127 ++++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  82 ++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 159 +++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 158 +++++++
 6 files changed, 1034 insertions(+), 9 deletions(-)
---
base-commit: 5176d213b3d4405ee5a9ede7e9eb876368beb994
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

