Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964040DB53;
	Tue, 13 Oct 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885598; cv=none; b=fBrZ6L12XhmvQDXS/rL+UWSW4zqej2VBXj5qTzqSWkZPF7MQegoW8lk/sD4U69mELj/AUpm5clU7YW458Bd2+U56OO6o0iPNiAaBsUIDGJj+KNaRT36jhwZGbsX1FEwKBm1C5dSira0RoY739em/nSj3fuXsvZToell3YY3Dz4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885598; c=relaxed/simple;
	bh=dUlL9M0ac+ElyrJhMA1aGNoBfZHQuHzk2sU1ZpuuXIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fvJ3J3ZVgGsip2Y2dPbdZ6z5LTu+nYzQHTj9amlhtvd4Tg9N1+nsOfFTWtKMEJTqO56AOpBybRcTBGN9sjx10/ANlPiq83E/pmiYJd3hVeKT0X1Yc4M9x1bHvi4JnJRgIZwHuGANgBTyt528hFnnI7pTsFX4LaoFhTfzj6qrRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1791885572tb6b18932
X-QQ-Originating-IP: 1BGUWLkxMiuAX64AvAO65k2urEB/lKhw04MWwEKwyfI=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 Oct 2026 17:59:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14585725684793915466
EX-QQ-RecipientCnt: 10
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 13 Oct 2026 17:59:19 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW5gd4qUXiW60PVkE2jLjhuC+
 O5tevkdOP9KhqQwulUrJXzV9DMV+FNF4dVOA1j7YhInV+/8mS000rgl8hAz2zhmfurCcDUuraC
 vO6HyjQll3rv3x2HL3Rth/sdo234gElMUeQAAAA==
X-Change-ID: 20261013-sc8280xp-gpu-smmu-fix-e07e4a2ed7b2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dragon@radxa.com, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=sophon@radxa.com;
 h=from:subject:message-id; bh=dUlL9M0ac+ElyrJhMA1aGNoBfZHQuHzk2sU1ZpuuXIg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFnnGP7O054UzRf3vpv7n8q6dbv2bj9deO5t6/zHSVPus
 AQsW33xe0cpC4MYF4OsmCKLQjzDXPbK3GtPxUr1YOawMoEMYeDiFICJ5HAyMjyO2vtj5YO/cxOe
 vjtkbWSxbFfhlNs/Cysfr+RXFGv4qjuBkeFHU/MbX2+uSwv+PZY63ulw1mE/y4p5NxTCimvnh8g
 4cXMDAA==
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MRlJlBnjh5AJey+NVI641g+syhYURjqEZ25cexL43X6GxnTP3nBAgNNX
	tC9cIFZc/bTwIlJaHIpJRPYjmPI2GMg9QLNUeBRGsbKutLyMVFXocI3M0TgNLFpCKsLU66N
	0V7/lilpqXBsM6lIuRq7bu08sF0yzzhzNOinNSPa4AwmXaJG9gQD1On0Prch+tDV/1OBQpz
	5gKLxkWhoKNVlGvrNj6T49lfqlDPCwgGSdgOsi/xrb4Yq+D4yAwBSDoLvB7CN/OBRXDt28z
	8p9taocd8hdbUQj9OLS9kVboHj8UAZCMja4FfPChio/cdjyK0n5kkVu439C7gqEMj/DEziW
	bhhXS0l68Zf6YGfXOGq5elpV+6+np+UNfdFB/UkgkjE7Kweqy6deZhxBFk8tDXcR/ywcGqk
	HqjPLHmOrcEhbYHlvbjoQHHOge7DTadCrrUydIFKJ0brq/2nwf985JXc7d3OuC+GyBIUiDF
	DIkiSQpW/pc7G379FYdYaRF/pmeZ40fLpczr5Epsk4cU3ZmewNY15/n+9DR25I+77zITmik
	D0FDihyqTBDvCbs7LWPC0DLRn783uEX96RWlujcahcyquYgQYq1ilHeCkZIkEQbkDDshYIF
	8II2xvGAlwpw9RQXFw87nF1KkxJm1Z9vCsEGTQ0693ezyjVQV5kKTgm8x01IPa5/gYvMwm2
	cXWv8WwhPP+8kPC2LtcVnvyuOXj/j2GC9YOEcmTghqwmkWgvgu9Dtw1RgGC8z5BN3/zgWc1
	SJ9i9CXiX7Ae/T81xxcaLDNJEZEheIDVvfbsr6J7ysbV5cXWwJLk/v4YqNeBQmHD2uyr6pA
	w9fSAbySEwTw1jtdG5q616BSlmid+vXV0njoiq49Ft/apjmFvEm+nGQdFwf+ta7aA+ED+zF
	JrmFrF/7ZBpTyGpa5fPA63VDBC6rrs/OnlY2iT8Etz1un5m02WLuAf/UCbs/F9M0VjKvHc6
	vqjx81XBC8Td+aLQA1IcLlGKtup0VZP4naaMaFkzXvSCobvr2P0oS17D2yeET5OAfS3lgD1
	3KgSKfTpkj9MzdztxR
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

The GPU SMMU interrupt list includes PMU interrupts as the first two
context fault interrupts. This makes the driver register the fault
handlers for context banks 0 and 1 on SPIs 678 and 679 instead of 680
and 681. Translation faults are consequently left unhandled, which
can stall the GPU and prevent recovery.

List SPIs 680 through 686 in context bank order to match the seven
context banks exposed to non-secure software.

Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..504ba6618bc7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3533,18 +3533,13 @@ gpu_smmu: iommu@3da0000 {
 			#global-interrupts = <2>;
 			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
 				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261013-sc8280xp-gpu-smmu-fix-e07e4a2ed7b2

Best regards,
--  
Xilin Wu <sophon@radxa.com>

