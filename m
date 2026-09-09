Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4F43CE6A;
	Wed,  9 Sep 2026 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940329; cv=none; b=R5g60IVldarmENvdPLjuEGD715q8eKbe+dlk6ci4+FtELzMRm7kIktWcB/x2XXsvZFOMY1l3PGEO1S1op2rVTQzWC4Pm+WIOLqExipHWdllBCs6e2iq6qGvR3L98KSWSd4ZhNYPvRYheaO56IdJts4/wEsJZb1/QlddusJUxW/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940329; c=relaxed/simple;
	bh=Xo5ZZna6fj0XzdrU3K7w11fQnxYp9Ig+cMNM4zANL/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R6BD4TBpb5pw5g+OojPutfz6enk4em9eUo9xo7Us7BPzuB77Hs17xRuy2LunM4hYr+BK8sU+qSkTjAg3QgABvP1iylUkAWXyamXjiE8FhdNe0uQOkuXStfNAUErw/OHu4hB+DaS/ia4uhTaxJ/nSi0o4fkXZPYBsomkyGJyDeuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1788940308t5a964bd1
X-QQ-Originating-IP: mnQDQc0d55bdRQP8PubdyMMyenO5XvvyaiNu1uisIAs=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 15:51:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4351813937813255194
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 09 Sep 2026 15:51:38 +0800
Subject: [PATCH v2] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks
 as dma-coherent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-sc8280xp-fastrpc-dma-coherent-v2-1-a112abfd41b4@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr2K6dkxpBIor72FYDNNBagIlnUowh
 LsLeAGXL3l5/y9KOHoWdTstKvLkxYdhA3M+KepweDJ4t7Ey2hQ61yUIWWP1PEKLkuJI4HoECh1
 HHhJcC03cYm5d06itMUZu/Xz0H/WP5d28mNIe3Y3OSwrxcxyYst37d2vKIAOuDLIrq9IW+T2im
 /FCoVf1uq5fvzz6g9wAAAA=
X-Change-ID: 20260507-sc8280xp-fastrpc-dma-coherent-460cefa58dbb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4578; i=sophon@radxa.com;
 h=from:subject:message-id; bh=Xo5ZZna6fj0XzdrU3K7w11fQnxYp9Ig+cMNM4zANL/w=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFkLBfg/veDblbFv9vlpU2/VpIg1Klu+VHx5PKt478Ebm
 rp9Xy3/d5SyMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZjI8l6GfyoreqwFojqyDI44
 Ftpt2Wv+VJ/XaX3Yk28L86cYh0VvfMnIsO+XZcOx2exVJdON631eKR56dvbFzclsJUf/zNNIi97
 kygYA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mnff/9wu0oJYFCw9CqkLJ8y3ha1ZbM8UntmgUvmwyPQiEVU9RPR4Ncik
	98Q+e9gsIxd0aeXjt3bxHmgukwJpuPdACUFYbI0U17MYFnk5WQ/a41c9b9211ETIewUTjgm
	iYGvtRyeVdQ2UQPM2s9G9BjYuy5/s1prxgzS+zIyZJBJrd8U3EbQ/WyfIFfOutzA4L6Rofx
	zXhHAqrtMepbgIXA+mT5rQ34YepcNICJTK+U9WGa8EnQXmZwgXCwma+mLkA9RU/QQbELgTH
	JmwME6HLHUoDOKItLLv0WlbHNP4O49Ft5+A9/Ll1RiH8b4RYc1VuAplM8SK3pIXua6vFj6v
	9YjHAOZy/psjTmDY1r5D6DMKe6G8dJLTWQKJ7PbGG5nZaTUJp6GQiE8fCJnPzRm87gELArs
	NDrtEZrMIVWQyuw0ZjedMXo20Fe5oGPB6fMUtH0lKS/PsSsC35IMkoJX/oPFEchdJCmExEC
	H4LIMhU1pPAqeFQ4vAe1L8WRo5FhJK75P7OT+PcfbK58uJcRT2X7t690wo8iSXeil19Du1s
	DfnA3jO4yo1vCNr19cqXVdIKF3NqHfcKhv3mP9crReeJ2LCQWCWrkipg/j43jRxq3MzIruK
	E3EJAa1G4Va0AJNuU94C9vKsTjnI2DydcrXb/kc+ZwBFoEwNhBTCM1KHAPk772M86U4q5u5
	u5yflWkPA+95QPSHni8lEg72Y+2p/H7UI01HouLcEv4zSaQ3dAXJ8VMNn/TiYSpQxANxwFp
	3L7FeeR2UKFW4qT0CyyBFOoTZsTXJ0HkwU/aloM4skcFn3HZydoRAtBkMovm7SYirY06Rij
	VVMWxFCYmlMyu7QrWa+FJkQbuFo8LI1dDhjANPUZt8SKUQzGG3ZrLHCwyNhD3QS5tH+Qckj
	ThHJRH/fh9eEetM209d7OEVJEZM5sjoAeQygZpaxnORFNelvQ4T1mL1FELYe1aHQhEyco1H
	/rpP/dmcBzI01wATncZ2MEH3RwslJp3cpakZP25ILjYqgFlmLBpTTh0UF7JjvFQn0vF6Vo5
	Nk4HvNVVyQjq/0SofbnN1qmuBM/aJ+kQl09ZSWZw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The FastRPC context banks are DMA-coherent on SC8280XP. Describe this in
the device tree so that the DMA API uses the appropriate coherency
attributes for their mappings.

When FastRPC allocates shared buffers from the system DMA heap, the
missing property can cause intermittent failures while loading DSP
libraries. Both fastrpc_test and the QAIRT platform validator can fail
with DSP loader errors such as "mmap hdrs failed" and "bad address".

Mark the ADSP and CDSP FastRPC context banks as dma-coherent to fix these
failures and allow QAIRT applications to run on the CDSP.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v2:
- Rebased onto v7.3-rc2
- Rephrase commit message
- Link to v1: https://patch.msgid.link/20260507-sc8280xp-fastrpc-dma-coherent-v1-1-e92aed797865@radxa.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..dfe7dbaebe62 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2910,18 +2910,21 @@ compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <1>;
 						iommus = <&apps_smmu 0x0521 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <2>;
 						iommus = <&apps_smmu 0x0522 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x0523 0x0>;
+						dma-coherent;
 					};
 				};
 			};
@@ -6235,84 +6238,98 @@ compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <1>;
 						iommus = <&apps_smmu 0x3181 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <2>;
 						iommus = <&apps_smmu 0x3182 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x3183 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <4>;
 						iommus = <&apps_smmu 0x3184 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x3185 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <6>;
 						iommus = <&apps_smmu 0x3186 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <7>;
 						iommus = <&apps_smmu 0x3187 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <8>;
 						iommus = <&apps_smmu 0x3188 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@9 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <9>;
 						iommus = <&apps_smmu 0x318b 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
 						iommus = <&apps_smmu 0x318b 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
 						iommus = <&apps_smmu 0x318c 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <12>;
 						iommus = <&apps_smmu 0x318d 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <13>;
 						iommus = <&apps_smmu 0x318e 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@14 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <14>;
 						iommus = <&apps_smmu 0x318f 0x0420>;
+						dma-coherent;
 					};
 				};
 			};

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260507-sc8280xp-fastrpc-dma-coherent-460cefa58dbb

Best regards,
--  
Xilin Wu <sophon@radxa.com>

