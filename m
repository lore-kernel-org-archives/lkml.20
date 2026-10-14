Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022673F3262;
	Wed, 14 Oct 2026 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970107; cv=none; b=ShwHgPqzAJuhp6A2GnJq9gOJD4GH+CtG/moPnxWqA5GHHReVEafslP5y50aYwB845TQed6xMaCZEqqEAv2S/8cdZ1O7xUV64LmXYH9to1OAOWiKaZ4Prgv6HhyhN38siksGmccW1JhGKzqMMa4KJ5bE0daALwexbCew6LVTUXNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970107; c=relaxed/simple;
	bh=wj2EVaF23aOLgm9S37sOK2Pof1HsuFDtVmPhQD9BgJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rh+Gf068u9MJtQ7sKWCaGavZMQ53WOJeLm8LvTp9v7atV8fogP7hoKQvUaiqygZ9toLGFdAsn3Tk9sOnWDTHeAfefYsva0gqemnMlmiKRNJHPOqBjglTI1WS2gvO0qBPOCrTXtc+G4sIfgenXK4ykY+mhT5nOwwiEMqPCXZcZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791970077td2b7769a
X-QQ-Originating-IP: GxyUscLd4VJfxxw1OBbKTR4CbkYqOk/yaznFihgakYk=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 Oct 2026 17:27:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6258583955700137001
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 14 Oct 2026 17:27:48 +0800
Subject: [PATCH v2] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sc8280xp-gpu-smmu-fix-v2-1-eaba3afecba5@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhOAWlceQ/DopQBaoKQDhAM4
 e4WPIDL9/P/fxsIB88C92SDwIsXP7wj6EsCrrPvltHXkUErfSNFKYoz2qh1xHacUfp+xsavyKr
 gzGqui0pD3I6BY3z+Pssfy1y92E3H2dHovExD+JzihY7eP8dCSGhsYYjThvI8ewRbr/bqhh7Kf
 d+/cqdAP8wAAAA=
X-Change-ID: 20261013-sc8280xp-gpu-smmu-fix-e07e4a2ed7b2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dragon@radxa.com, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300; i=sophon@radxa.com;
 h=from:subject:message-id; bh=wj2EVaF23aOLgm9S37sOK2Pof1HsuFDtVmPhQD9BgJA=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFnnvSVi3IWeZLRyFhwu4Izo3f0helJb3M3N+vV/5aUUZ
 1lGfb3YUcrCIMbFICumyKIQzzCXvTL32lOxUj2YOaxMIEMYuDgFYCJ1pQz/s/dfy4t7o9qRMO0O
 S0niJtegvQkcHCfrX/1leylZ9XV+PiPDa8uL5yUCd62YcFbiwc+XVasc2FTTz3IEn+PemcIWGNz
 FBwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nb5s8+K9ZDwbP5h1QgSSPiDAd1wZ5VSyqUcFpMpHOL3Dh9hPjisyr+Z0
	yGfKth6MM+Omf6rOxbDdgXfi41zALP0H+ooV82KOychx3tURxUfnXkYaOWgyDyXmuCSyDaR
	wVuWEY9/8Mw1C056tlmWrhR+HWJT5pCDkBmZVN0fOffMPJUvB6MjRmeHcZ6It4vSsLxBUSD
	z9XZS5YETfW33w0cATYyrdGwGGCHXSWoxYruwEv//1acUJxPDE/ApkQ5Y2J0U8laxZO4Qat
	04BY/zJZahoNhrKfkTPj8rcZj7jF6/r4+1ZwNwXnMKa1q/u4Rhm+OLpC5J5RIlJHwNvJavA
	oJ8a+UwvYGiNYjrbNUTrsHXqq9DqAOt3iDngZxQYEdYT84yM3qf5eDFNmQOAocCiCqIffDT
	EmWLR63+ouMem4PB4x9QXqW9j5pckprEz/hLzxzBNlUyUyDK3iHSlySJVxF0CnVuLjqIURX
	hAMvX/Pc9tK7YRMvf73Q8lPKTZV63Se6AIV6iiqI9/96A09G5s4tV6IA1nBk45RbBKQui3A
	dmIafGQTMZif0fGjpdwEw4dJCSMgxzyyu2dR3PF6bNuyeNvw+yxN6J2Vs/dknZJcVserYPr
	2aLSq5asoFkWHLAuM0+ebQgpM77VHKGEOuj4H4NXr3zVTXGvMPKGVg25KJ6sOetBmCHtzJl
	jqPSccAPghImzGrGYuQSNM/cHYF6J33YnMfGr1+MOl7cbrOK7qkL0cN1hjR4W5axhUy2V5l
	LYfkxJa8AQBfiAKlAV9nJoVOy8g9Zcc8OQ+GWPj4faSwPXF/Em7OcYnxAOOcxXrH5kx7a30
	iBefvdo/QnFzTPHS9MK3gNOQwZflV+os3lM6kjj7GZZnK990WKHOWCtXztsJF/NPnPsvTqe
	lwK3FxnCYdl6Zojqv1IA57RrZ2vfC/pO3pOivSh18ENTx0+6y15iick6wcGoBJ+pz1BOZPd
	d965+EqUTWOM+vM/ZuYgBeCWpeHPJk/cvGhacOAKoNUNGiPv+WTLLoxmnjmXmBQUdlhM858
	snqDr5jR2RLswfbq7KgY48rd8XrwsxeRtsxvJq3rK78bYMLwBUlxVGXf1U0mLoE5kjbCc0z
	x3MWNw+gWeo
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The GPU SMMU interrupt list includes PMU interrupts as the first two
context fault interrupts. This makes the driver register context fault
handlers on the wrong IRQs, leaving translation faults unhandled and
potentially stalling the GPU and preventing recovery.

Replace the context interrupt list with SPIs 680 through 688 and 703 in
context bank order to describe all ten hardware context interrupts.

Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v2:
- Describe all ten hardware context interrupts (Konrad)
- Link to v1: https://patch.msgid.link/20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..477eb55948d5 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3533,8 +3533,6 @@ gpu_smmu: iommu@3da0000 {
 			#global-interrupts = <2>;
 			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
@@ -3544,7 +3542,7 @@ gpu_smmu: iommu@3da0000 {
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 703 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
 				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261013-sc8280xp-gpu-smmu-fix-e07e4a2ed7b2

Best regards,
--  
Xilin Wu <sophon@radxa.com>

