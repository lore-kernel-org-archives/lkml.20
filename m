Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4743B3F5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234081; cv=none; b=K09SWwt8MfTBc25kg9PHKGI5TgzVCm3xkUKVd5Qyu6t+qTGPeaU7IamCVfrP2jRDOAKTrS+FivT6ycxPmREPZh2dPHbMa78yYEBGNsrYjSbHllYVnJl2JiSWBE6A1x19Q4fmhYM0arpkPJM3muUhQc3ppi0w0jebUl7vyBHMddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234081; c=relaxed/simple;
	bh=tu+tiE5Dy+gQ0qmzHr41PsO5oiHuuTlxsXsSJdb4oNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QdnJ1U0j9szzCshmjxhwfNDQGAQGOvdERG3ZK8zRYJMxCe+Q/ybwOGyouCp1XkLLFIQgb++Zm1CCjIsum99AjVAnabe4wezViMAg6m1ud+3XeNDOgVtKqLH0AFkLxPgPitPUZqNzwOzlB15KpUL5TXJ8xPmXS+YZGe1VsjxvBuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LN4yNUmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxXrqS0o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LN4yNUmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxXrqS0o"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810p3Gb1223581
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 03:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TGSkA5vy38DcELVchDrIoW
	vMRB6AuIQXXh4MQUVn5AQ=; b=LN4yNUmw6jxpE64aiU/5fBh73TuRR5bijxesBZ
	oZXLi+2TD+1j87Lja9RvkCHm0LgwznPdryCSGly1J6r6tp0zr7Zp6DuFLlDVqVGV
	OHy5W5H8cHDhf9S3WRpysXzfpC9Muu0OHozBlUDwjk4oX+tf/9qTwcxJyCVXd8IE
	9b2BmNRMHr9udB0+ShggSqvK4B1ZnJfWwCTBjgLrBxolakmhqqb3dKThUdig4baq
	QZFQEXn1mD6E3EHRDpAaI8mEbZSSB/92ibaQqBgBSwOuKtI3dIQgyJxJWgZRBKhN
	VkRKMHc2oJZfGPvmcJUOqTY9ohRFVv9tPIRuxpb0KybBIiNQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgmkrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:41:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7328637a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234078; x=1788838878; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TGSkA5vy38DcELVchDrIoWvMRB6AuIQXXh4MQUVn5AQ=;
        b=AxXrqS0o3645OmA5rS+el1S5eI4ZszZ+/Y8NpsIzmNEnOao6Pto9K0qnuSSO5MxVKx
         M+aiUJUbesrTBuJFLXRnWjKtBzR6jC04Ck1nbAAiOJCTs0SuZcWH8lT+H8EDcGMjYVF7
         D0DANAl00XZwb6yUXaNWGOWFXqASKk9NvCh9xUTJJwQkuUJPgxm2nHWj0bQfyDLBhVH2
         Z8u0FlaG2wSFFKWL9n8uv7TVEhcQfZWC4s28vMu8YYtmYbi5vQ7zIWrGjuBGBxd7rxGK
         xUBj+00QhixqA3+4D9sMN2Z/RjjUzP9IqLc5lQZlDQaG7I23Ts9bq6WFvjrgnNAl8I5T
         HnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234078; x=1788838878;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TGSkA5vy38DcELVchDrIoWvMRB6AuIQXXh4MQUVn5AQ=;
        b=a3RkkLQHPE/IGck1HrxxT8PwuGeWndbAKzCHIsYUItyqODbhgrRms9SakCoWNPsyaO
         oPz/nDCaxjpsa0XsFYCGgmjhuhQIU62+wFDdHHUAw6tmhJMmeAOFF+z3rIjpINvv7uKb
         LUTb7FQMmfrl1VM4MidDFy9xe8RNFW2omAj1jThRwkHui55AuJooafP/HtLBGS/wpUTH
         LFf6YWZuUox35NXFzr9AabiMi+i/agZj/bwhPyphBvI8EWdVqQ46HxUkK1CvBvBRRhtq
         oAO5GuPDp3uFIUoC9vJs1/r9jY5AvH4jB1mLFR86mk9hHgx+4j6AMJW3LsJ/GtXgi2RD
         re5w==
X-Forwarded-Encrypted: i=1; AKwUvBx2TafupPZLhDhnLyGGypHg4C6KiZNvaH2jyYZ6rXeMZDUWaLTin0NLyCyWvWWiko2GqoJouR4x59MnOUE=@vger.kernel.org
X-Gm-Message-State: AFuF++koFjcNPVlC010sytg3GvzH0sanAo9Su3jXemQV6TUaqwggJGPp
	CX0pEadLRHHjk4SYEJHt+2ic14kbJ9eTeByKH7j3aMpnmjAmusRV+V7vdf5CaN2EFomsmqMm5fd
	7MBrqq9UM4vg2cfujbZLCYyNInweiTbnMael6Hth+qItDMxXxmNgob759bslU6txPltk=
X-Gm-Gg: AYBFou1g6Cf+vNkQ3OKZSLv6N9Ogs9vuMWvEQ/r62CjjlkuAc4ZcyL5wRz5+oGXB3qq
	kjyBPv+SOUNXCdUVkkcLr3SdToUWwgHqRZwewy6DP3S+PkzfeD0AdrNyRG569YXhe70rqrlfHHA
	bjpmt1n331iVb3VdFXiiDyvyo8WjMMenYp7XFTWh+3sddkNuZwoLbwMrrtvmmSbgaVXIrAxONV4
	Poj49FKQaGaQGSmySQfxIGFVOW3c9m3Mr+cJZCqcRMkMpIHSeBGhcLV9oqdMRhwAWUpKIt6wwxu
	Bhw8mRXRnPvg3ZFVneyfm7nwWkHXJ107MrjJXIkj1Jd9Ig2F1UDETRhsoTclDiSWMciQaApDCT1
	frRoFszQoVzVOPa1fOrmPiEt4waOHLHXcPa4GDnifXKUn2gD9N7QC
X-Received: by 2002:a17:90b:3c44:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-398dcefc24amr18581538a91.19.1788234076856;
        Mon, 31 Aug 2026 20:41:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3c44:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-398dcefc24amr18581466a91.19.1788234076407;
        Mon, 31 Aug 2026 20:41:16 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm39128286eec.14.2026.08.31.20.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:41:15 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 20:40:27 -0700
Subject: [PATCH RESEND] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-maili-spmi-binding-v1-1-3c38c4eff7aa@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788234075; l=1265;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=tu+tiE5Dy+gQ0qmzHr41PsO5oiHuuTlxsXsSJdb4oNk=;
 b=Ce4a1Is98NL1UmdMoYVz5/vI5d9Pa075UFuwZoP841nGkRe5ErdRi/bQxupf0FRrRRex9EuWy
 MMTGLtdEsNpCNI5YXouamm7B8RUCdi+tslehpSc2X1xFKkK7geC7xza
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: k-BvsmQ-Whbi7BmzPjfvnI2cLeeW0_hl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyOSBTYWx0ZWRfX0i1+gt88iBDs
 1DJR/LawKn2FaskEykeDSXTb2CFIfwpgoPVaG69z9LddLqlWGcgF5hr9n4n51zYPG61kMWifGsO
 zNzqTWzskSFfIf85cg5v0z2VFe06TjQ=
X-Proofpoint-ORIG-GUID: k-BvsmQ-Whbi7BmzPjfvnI2cLeeW0_hl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyOSBTYWx0ZWRfXzx340AKd+3Ur
 HAnMe7H2hoCz0hC8y70S8f1TQCPnTMQF22YcTvXmBSIiwp4mrBWMWIHp/rFoFb3uvJW/K7KbvRN
 0UgEu1mzXC6EMssM+6CaaNuQOmV23qphdTke/LtHeY0ghwFby6nOECL6f6zUkUEx0poSptw/C7G
 5J4u25MKuhuYSgqi5vqFy1V79wQFa0fNQxiDwYgSJ11AzFeYIq07B9hMYqOPLL5dVi7UZPalSsd
 qF3re63wZQRi35/gUqi7S50agsvEgm1k4LbGc9f2I0j5cwtNk6qFxz+BDHVl/SE/jBDEgqGT4DU
 RZhV6VAd7cfXkYd98SYxlPUe/dzmLNTkZUfLEZEjVVHwt9TC08PacU2D5SxVuQJQzLZ6CH3QJI1
 FmzfRTlvJSP0P/yujpNMzVmLcMx5IquHSpk8Ur3pSGyYAFOfcsRqUYTdzGASY4Fb1wvZRT3r/vI
 bt+bk2W6nHNzmZon5Dw==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a96495e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w-QGtfMo4T9X6HggfYsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010029

The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
is the same with Hawi and compatible with Glymur. Hence, add a string
for "qcom,maili-spmi-pmic-arb" as a compatible entry for
"qcom,glymur-spmi-pmic-arb".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 1593a1183a36..44c864fd5fc7 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
+              - qcom,maili-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:
           - qcom,glymur-spmi-pmic-arb

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260609-maili-spmi-binding-dbecf60b498e

Best regards,
--
Fenglin Wu <fenglin.wu@oss.qualcomm.com>
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

