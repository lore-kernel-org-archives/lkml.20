Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947868;
	b=zC8duvRmO05GkV/Fda1ay+c0NyN0ZKLqQNnaPI8KyFI1B9U1RGnruQkbeK+0pEBpd0zR
	 UwimM9Jp61MW5V/37O3yPNBAc3swAF3VmpgEb1VPSzVDZLSjgNTWnwsTDmteFBhUd1nX5
	 5o3mqMYlA9URbeS3PDgPHmMZL0jLJ978PZJz7UtdXf561uiDIAuJV5tkEqaAki0syd2WN
	 b0HMJmxO34QNUtY6IsVZhnzUWXZjaYumaLFPf91RO2PWIKtAZo6vOi+TAw6ohKx1bo7vn
	 iJheoGwf2alzwp8Q44lkZ0oPFvMS9+sOOkmFwZslLOTpKj0iwdOI6eIotFSX5v9mwsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
	b=Kxbsau8Sg/XxbzKAdrwy5gve8QWGm/+NBz+fsY/2+WtUYhrNbZJrWKLwsVXiuQBzdaYW
	 hLCTBc6sdIGXe5zuvjVF+8FQmD4NbCeUmd+Iwog0cKK6/EVJWXGkB/YLQCFES9lqWirbd
	 K+h9giPHlIDrjnbwqWRc27igqom0EHtlSY0Dw3SFSpie/ioRouJWDoBT+1jvQFxaPR+gM
	 Ts3K+fq3TtZBFaqXA3SrwvwGFOqIx38A4h8baObjPh4piu/jG1KSv0wK90kRDQZtuO0AD
	 38wvjkwELIxDo60l0RW4PLVECPMHCDZ0yaWk+pIGVKdw60BReOxZaRKLyYUv6cCtF6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pllk6hPC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frBOfoIq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74E606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B74E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pllk6hPC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=frBOfoIq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6400WP2264895
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 06:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=; b=Pllk6hPCzbgjTS4L
	Lb3qhY1U4RExnpmitgxHB4Acq9kf+EW1lSTEYMFPkm31u77F7GgpkWshZJnUDL4k
	DrfKbBkj4uoVQBY+6JissiFCgAxJjdLtIVEmPaH5+HUZ5mUOp/upOiN+sPHLxmt9
	EPdf+bdPg0zUfYMc383hHEps9/5lZnYvXzXi6MpIPs0CwAVv3kjr6ckwM0nK5NtA
	SaQ9pdftVfLPd+oKZCPdCuhW7oCVdL3k3UxNvhaHy4W7ERyyaiX8uz1/ZUcXQUOn
	JgDs/sVMpkjF3dhVG2WjiyXW4eik8Mugx7LpxdceZQ6kUH7vdhbFd4Mx6uZuvjXt
	mvlm3g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9hdyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:51:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so357976a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947867; x=1794552667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=frBOfoIqLFhb0tr5lzaLQSMpMDYTPUe+Fxakj37QjglurscRcrbnyVG/77gjVpkCIa
         DgeQMpGpQn0EtQRA9ALXPKvgVy+Bj+BGF7zdPECukaIj/yLzgJZnqOq0IBuJh8CLBHc1
         lnaHH+IROQgwCnBzPh8qsc3J1iRFFTKeHTBWrPLGdWi+8/ZMqfPKpPFNgSW3DPe/yG1R
         vC5qUeuNQda8SKbVyKptd92TvfvRuRc6OiiY3s1i+5V+J+OIGgpsyk6ibbuN6br61FmT
         p/X7mVl8b2IxRiZk0+SeiyDlR5HnaAdMwEz8jWx5f48AmuLI4ToxEq9i+8qSZav0WhJP
         heJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947867; x=1794552667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=g1KQtPjKAHM9xTP19eE0tDkfEAgghi+DUL6CJgc1qYv23ADDCqJHKfhYE8HU6PFiOQ
         ZtVtytdMGrkGrK2mblm5FW9b6HhHpzVMOPXYXpuiMfhOz65lg99XVaddQE8vU2D3d62l
         bXwf4CcdGsAqRCEBFXKl/EIyuUji9D6T6b3dOa4mbpKWU4LI33civzLpUGdevf7WXYna
         Si64Pp19LYlCpE0hgZbC5pRt9LNlXUpHDP3S/u/9UPmgQhHqsdnnMZvHm4x+d9XCN9nC
         oYaKjjWxOu39xdQmnh5ABiVPvMXi/smHS+3RLFxeFidWiJ4bQj0++jcWM4NLPRhmgnT+
         QEXg==
X-Forwarded-Encrypted: i=1; AL+hErE7ZSUhAC1XZLTbepJW5Jm9962GSCA3yLHp4bHMCEfX24O8mRNJzGUDLXQmP72R3hj7AoOLL1u1rsZSk+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BFLHRsAfg31loHMNWHLcII3wu26iPD6O4YeLXk6Baw9SvwRgL
	sBXUuqvW8eGPYMmsiDYSAFxA+PCJt7o+tiouA1JcXeBqAMxmv0c+Xnf6Bpe5SvME8jKuMaFOgXf
	ks7zufc1QdOPppds9VGlG6cg5XJMFT/wC4l//ndhBq6ZyQuT9s+bzlalzsYoUiQ0P4GE=
X-Gm-Gg: AYBFou2ihRhXSDf4RF1ghvynoYT6C36gSpQHNlHz4x8Xx9vzpG8C6Ev95u6xzu+J5RE
	azlpo5nIau3D0vjGE/mu3atm8iVzfLVIqVbdskI7Mh2C5Rj6QhpcBvkOGKGl4nhhZKaamCLVMbp
	1JIDyn/xj4R9WHJjMVT4rQHTO2p+IIml+xB8sp3VoqOJrWSU0WdSkAcaUoriU/R6fwvWZKFA+bE
	zwEEC+WQ+hWrM+jbvTksuliXiUFCrDJusnweaGvgLwjk2JHqN8/xqBkDoxFY8eirjUF3q9K8/pG
	vBHN0Y6ZXzzCfXMuEYNvxoqNC+Jb0vhjqbN5CVqiEt9Gh1VzAT0oawTLCqdLJMVXnhmdGS8GWIK
	8ygc7Fp6ag1wcKV92xDy6Y/3/Y0Ln5h7+0JMdcYU5sUn/UadkNQN3q3fK2xs0Q7FI1mB2hyQmbB
	S+uRl/
X-Received: by 2002:a17:90b:4c4d:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b0db6ee69fmr1388247a91.20.1793947866812;
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
X-Received: by 2002:a17:90b:4c4d:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3b0db6ee69fmr1388239a91.20.1793947866358;
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:51:06 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:43 +0530
Subject: [PATCH v4 2/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-hawi-maili-camss-v4-2-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
In-Reply-To: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=1461;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=O6JOHgjWCf6k0+eXloLMxj3S4Nm7SEUIMrYIjwRLIus=;
 b=0J78F37O0f9bKC6fbPmKMswzabA2px9rj+Plc3qcxMWcxeMS/pTc9HKNtYs+5MrbeLGZVuuNx
 8WyPRjLiTw9D3UZX5eeVL7ax7VaLBS58JgE1DW4/yo7qd9ebMIaIoQ6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: XhE7TAp8MuyYA_n5TErBDJLbcngp0jbY
X-Proofpoint-GUID: XhE7TAp8MuyYA_n5TErBDJLbcngp0jbY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXy7y+CfXJxLIN
 hRMv8RD4S/KSznpLgEhVRb2C88dpMtF/pxNGkY4M0Fex0s4IV9XqaG1eWlIkAdGMyJUnXPhfZ2c
 xZsIc6lkXqA1yjAXxriYSSBFYYvVRus=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed78db cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXzg8ArXQhNqEb
 +Q5lUOMmIGdC8oMERwmyJfFLlY9pTcOWYmPpVii7hMQQi/aFWiunBS+kdZkOsvvZvwhfO3vBJ3e
 8IdbtiEEH3nEJMQ7OSQSSl5UV+YhtREdgxDjC194W4LLMx1569NLuMjPYjZeJSa4zm+xXcv0Wai
 4bGs8oC3FO+vw58e5grUTFDFT4l9Su342kZIhlI+FlIlcI8xp3I2NwLAQp91bCTtXZ+JbJrrXAL
 EN6F5Ll6FFE/E7Ez3oO5RIA8wQTnlkuA//D1I79rViWPFpWaHC2si1Qlw3BK2kmUr4cGbCZvOZ1
 Y1gpG4iHpNZlZ7bGPM4e2xLvwpP7lj57L8DnOMNRhc8VRmt+uh/pl8bf8FlwKvxpI8Tv4ZusUnW
 6zWGlZapsgS1uArkn6ZcAb0IkocfVfGulRme6j5hEYzJ1Zv+KJFS5ow0gc2Wzl+NeUnBrp2NLOU
 JuKflzsnAwhCYpB22Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060027

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,11 +18,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

