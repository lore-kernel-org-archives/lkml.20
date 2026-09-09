Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80522D2394;
	Wed,  9 Sep 2026 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941363; cv=none; b=YyrWKEOVs3x+S0bBs2tpmgk96K8rFKgII/lV/gX29FtIkrpUjilJgXPgRdVvdlqeb7WFlAdpNI3ZfnoWEQjsvEClSOagq/jPt+qi+MDxnKsp4lJtJ3uvf76/brwoRM9bYoM6UwrNmvJI9gpKOejbrmNPwTaJeMn8GvdqbMahE20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941363; c=relaxed/simple;
	bh=VME4BPMRxHcODBkmIIbXPXvF4ro7JXBuVxpLit80aI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=THthV0RBvNGBbLenKqQKGjxIpHWUJa4lbcJgeGAoyOj1/Dt2XC++1VhbW1m42x6CVhxSzY+tsOsjZ2AJIrYQbFvkgPeghprR+vLRfzwzRz40lZBfbQGoSIq+ujEOGntNzqToWs1aA3O7S4oOLsXfSwyqgs3gD7VzPlMButLQMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1788941340tcb6847ee
X-QQ-Originating-IP: x1z6lSOXDA2sqZzODoKXrIHUUnd9HNU9oeUk/YVicr4=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 16:08:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5462903154121869628
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 09 Sep 2026 16:08:53 +0800
Subject: [PATCH v3] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks
 as dma-coherent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-sc8280xp-fastrpc-dma-coherent-v3-1-d38184e8cf9d@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OzQ6CMBAE4FcxPbumrfwUT76H8bBtF6kJlLSVY
 AjvLuBBb3qcZPLNTCxScBTZaTexQIOLzndLOO53zDTY3QicXTKTXBY85yVEo6TiYw81xhR6A7Z
 FML6hQF2CrOCGasyV1ZotRh+oduPmX67vHB/6Tiat6NpoXEw+PLcDg1h7/24NAgRQJZFsWZWqy
 M8B7YgH41u2bg3yo1W8+qXJRUMhJOraZkJn39o8zy8SLc+dKgEAAA==
X-Change-ID: 20260507-sc8280xp-fastrpc-dma-coherent-460cefa58dbb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5357; i=sophon@radxa.com;
 h=from:subject:message-id; bh=VME4BPMRxHcODBkmIIbXPXvF4ro7JXBuVxpLit80aI4=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFkLRcQPndjyx1LHIzYqUaZxn5SsXv7zv0aOjZwPVu3br
 bZQPs+jo5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwEQiVzL8s2VhFm+LjmWQZZ14
 8+ZuLXUFoRXe5U9DnRW/Gtss2JvvzfBXuiHJe++dR5etHNa7cRje5Nru3Hv36M5uSZf+Hy9Tpx3
 kAAA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MAUIYBroEq6R6gODr684PWc8TQgzkzPuaSUdL2r7XzOvX4FZf3iUjuC7
	aT/g20O69RSPF9KbNSjxA0L19YwBz8sOWYFaTCqfP9nQ2duodL44Gw8325CIYK75pA2AaQ+
	4Ar88KNmKy/ZUIdB/ryvPSYTeNSphE8Tv0K0TFGqlrCiv6TaP5sbaZA3T3ZNp6o+mKG2Iyr
	IXuBvPxIuHx5UIEyTAF+Gz+e6FNrp2G6u8GaQmulElZSr6E942fR8LWbNI7s1rgsnYJ5im1
	qS8QR/eIwZ4llpMdh5h+PtnyvoRHY4aTYQbrO+pd5bOu4A7Cs+u7k6jRy5k425uDdJSdX8S
	PQT0Rm+QCfpbet70WXAuL12cbJ2Pga8xDN4P1IK+p/a5DwqP4mZZAZA912ZZQRbjpEbJy2q
	STAlRptcQiV3ifNEOrvDtVPsW5fENiuyJ6yZ2zgvm9L3gZVHuciseeIIpFl08wOfFtolBmw
	xV3DqyQ38IH4l2jgFl0FzLS9oTINdeKvqG0NKgfdv47MnuZazvkFXp4BOxIq/P6guVdD/A+
	M3isN/tR+qZknJfKl7YYQaGFrKW7c3ughAaYSxROsqkCQCiRbA8f74Ll5hpCdcwFXqbUjw9
	lzuvpq8C7EJnR38ct2AoEKrrRLNzQBCKsbA/Mg1LD6ULPXCFhgGiVsCyz0m+ROER7sCGJY+
	XngAIQGD/A/dkyLAlhJfYSbcY01BNULhJxAxxl3WBoYLRgKhL0rJVHBxodHgzAAkuAMHF9a
	ErXn7UbuUFEJ7L6fxifpPXGOB0aw+8aIydz48bBm8x/5Gts6OxGaCtviPWAJuX+SggSvJre
	QZ83/L4BVfofssUtGqrRPaRoGC/zyDa/sI2rfSJywn+sCyqJp/IyRtN/NCOm5bbq9kaXOOF
	93mXY+v0+02A4phR8A2DyQDkIzzJnpG3E6LIpIte06V8Py3dE78ABWOxlMtkx+s5wAYIenU
	ahgi7D3WGAHzLeC7SjB87PThAyL/HuxxspqLXkrCJiM9z/NrFOJVtn5q4Mot8gvgxVbr81W
	IB1n2HQqJqOFWN9+dYP6RGssQbiaOuE7R+88B8M5jqH+f5hqyQ5BMo2SjHiAYr0UMwj2cgU
	z8lH/jG1VsbvEj7tNxYjOE=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The FastRPC context banks are DMA-coherent on SC8280XP. Describe this in
the device tree so that the DMA API uses the appropriate coherency
attributes for their mappings.

When FastRPC allocates shared buffers from the system DMA heap, the
missing property can cause intermittent failures while loading DSP
libraries. Both fastrpc_test and the QAIRT platform validator can fail
with DSP loader errors such as "mmap hdrs failed" and "bad address".

Mark the ADSP, CDSP and SLPI FastRPC context banks as dma-coherent to fix
these failures and allow QAIRT applications to run on the CDSP. It also
matches the behavior of the Windows driver.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v3:
- Add missing dma-coherent property to ADSP fastrpc nodes as well
- Link to v2: https://patch.msgid.link/20260909-sc8280xp-fastrpc-dma-coherent-v2-1-a112abfd41b4@radxa.com

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
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..f9ade505d83f 100644
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
@@ -2978,18 +2981,21 @@ compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <4>;
 						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
 					};
 				};
 
@@ -6235,84 +6241,98 @@ compute-cb@1 {
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

