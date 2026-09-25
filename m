Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93D848822A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331208; cv=none; b=LqCjOmyEK/MUazvIRPJDZn7cm0kqRM3eXNV3LEtU8MqL6IkCbEoKASOsgFXiHBvrPvMVBTyOp4CtMku+Uc6jRIT7+rO62L8bD1FN6EnbhQRXIPvPERXx7MA7KcYqsR9pfLJEi3uETo7G9ssY9w1ODpZ7FMk3v9Wns+laQklkLec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331208; c=relaxed/simple;
	bh=BGmwBTNE+NWpVWG51Ixiacse3NJ3vHPzMJL3/ficNA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bozIBKfPgweIc280LCnjwaR+1TrbxvqyHSudmM4PwkYtBX99F+1UCbADVfNzzge7B+hW8xHCO+94izIGGcmFZrknCDxvkb448AvP/BaSbNjoHxLxzUCqa46c0344piH66i69+joTYVZM3k+545hxvwO0Wpvm/4Li0YdY2x3VOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhPZw327; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCPsf23G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhPZw327";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCPsf23G"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YpqO039889
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4V
	cyg58u9o=; b=QhPZw327XrL1zG72bL1cVgTHwJ9qZBhTwMRqPGGpgkhAlGlaqot
	3HVExAjAP/42QCwpQfBWqPxZDbYO1X8QNPBBmVPXIdIP11xHhYp5AZyjlDXadLs+
	7VRy6ZofPL2XBQuwHK9qNJLvPhysc/0k7mshC9olftAS/x5aRP4I69v1jydg1D1c
	pSXhIv2OEB/3/CIcmbKwPq4okVQTpPeV94b8neMyAfYKtpMJJo1r4rTQZAKJHSzU
	xB0U8UF53JTvWHc9R5jOBZSUPDCCT8WoD6t4d4gtDCkb8EPLLYBQgFDaluy/XANG
	b4IOb/Ss41U9RmfaR09MRt9eUzWNTiK+zag==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw46547jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so2485998eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331205; x=1790936005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4Vcyg58u9o=;
        b=dCPsf23GT5yt4LQkPJ5p1i69mkScc2ZdJqQ+crE7rjEVZ7A34CWM6PVyHebNbMY2OE
         khEWRkG5X3/ZUZTosF8OtkWVq6sry3SdOvZeHaJ1R3nup7gASolgLY+Tk/XHLnIFYCh4
         6P9MasfOuiNbpz0NEGqQj2oBpSgI9BpywOY03M4xojhlOHgE1qegGOiuMNxhY+4G60kw
         GkTPzban7EHfXm8Xj9BjOKv2JIwMjXUdRYfckVw5RT00LhuKrTi5WJH353Zi8dVP3NU5
         YF8lFhnHPIrg24CLrAXfNgycR6gZDqyrCO0GeLi1cvzOPDR9MmO0OEZSg5b80WZC4rDA
         SnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331205; x=1790936005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4Vcyg58u9o=;
        b=OKRcvF5s2luKcyNn/VGnS/TKt1WFtNgcOXXDvP6vswcfmYDhP3OoXVT/pJ0ytDsdrM
         HJ/iPDAPnPJyaiBfefUcNLpJVu+MQKDCBzlEqMNR8nGClZtHXlIUeHH71m92wV/tRV7r
         b4eN3+nc9JGHjvRETndJjGJqcV8MppgWM47Kbj6mn/ftOUE8E9X0OxR4OGc0IJ9mS9q7
         qsDVclR5zSg4iNnTJmdh62b8PZJIKD4y7lpDryox3FZYLN7hn5mUwU0EY+ijt4H81UgS
         1zM5EKOnk8o2NyA+CycKEovtPf+2EmCFXew2DH5fBmiqbhQfutygSB6EcLSVo2yiZ3qX
         H9QQ==
X-Forwarded-Encrypted: i=1; AKwUvByxUFmXZM0KvNpR7nGscxrIMO1pT6bfIcDxhDU5VcrbDvp+/e2g0PI3lY+jRsMrFT2F6qBXrfUcRX/7H4k=@vger.kernel.org
X-Gm-Message-State: AFuF++kvmWUpjpPHte/W9eq6pw1eaHGD+qGB4mA6u/DQorZZ47nihite
	68g+A0/g6eDGGxg6ZnyzvUeIadCGtVwIvjzXJu+On5R8LIJ6jKhWB69kMmKhEJcaH7XnKaU7aIb
	k1P1fSN8bfxVWykYAl+aniKV3+SP0/fk5GAVuY0Ilr/ldDW2PFKgzF3Q0jFq/nELrzso=
X-Gm-Gg: AYBFou3Rj5JbG+FCZwWYeCO2FH0LLuC5Qov/A32sdCkWNPWpY2k7eidFJX8rbcRU1jZ
	ad9VKMY0iEaI0CaqggsN086tMxX/ywse5j5Kknx4lrW59PMsjA/1oBpDPp8mOOSP6QrkceOx8Ed
	Ungkzh8MleKvUIBwLzutdj3TYDyAXXOEQ7j75+rBglX5x/ATnxsCdAapySM3epuWC6VY9XWxdnc
	3c8Z0wFD/xIsC7L0Eu7xH0YioyaKj9AfvRo1fEQNcD3ESvvfGjWx9iCFEiAoLgK3srHbVtN5pcv
	v94Jn/UgEhdzpOCCcNdvOq7T/K1HBSdg8LVR5ly8DuAYCyF+WjICPagvFxitVrBWzoIwSvDcXb1
	YdVuJyrS6qWGxsGhlGejiuW3Ofg==
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265255eec.6.1790331204425;
        Fri, 25 Sep 2026 03:13:24 -0700 (PDT)
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265036eec.6.1790331198736;
        Fri, 25 Sep 2026 03:13:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/4] arm64: dts: qcom: hawi: Sort IPCC client IDs
Date: Fri, 25 Sep 2026 15:43:05 +0530
Message-ID: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab64945 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dLohXW9gwQ2bYbRNfKsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Ji0ageJuZiEvZrgetSjk9BSLjWYMLftV
X-Proofpoint-GUID: Ji0ageJuZiEvZrgetSjk9BSLjWYMLftV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX1BJnYg0mpEQM
 7nwEUTgl0lAulc4E7IPCtsasS2B8hK5m2RALlfpw/pUJAcEGImGDcWb3jPkbeflhKF08G8GvkEg
 RYXRVliJQxMi7zwqirsgftEDgs6Hs4RZDZk4aB+5oAR96fyPzMqDmAe+D178wwDoUxsMrQr0N0K
 KTxb9Z5ewBuuIPYuSeU8Rdzc0doKWsImIQB9PKq9s0lSeEjhHHl1KuLJyWaKhK5TC4m26Sotzps
 rYdGXUDANt5GuB7FdqQh20jjOwQ6nyyVA6EToJL9SOoNjhxSH518LdTuKyGFDAx2l3F8ulbZfBN
 1nHVJq8nMA5qKZLlXoVSyZ6vltoATx6SPodPPBXhZVJC3QX9WoNaTvk7EO6ajDRaCGcim6kVtHK
 3NHGox8NYSBbUKDQYY2nW8bwcGfG8a6BqmZt0ZHtc5Cn+7UNhDMpFCVKE96k2RuaWHaw33ok5c0
 exruPX87kCPfi+/qcAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfXzBSX7R6/Y5dt
 xpNq9ctOpP/CYLGFvHRzWbF//jt/ur3n124XPHFNcPDMCR+v9nfCbvoUfBNfMl1T84hbdMz282Z
 2zOuPK2bTFiLVFpgNEqqNgwCeWghXeA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250040

The IPCC client ID macros within each group in hawi-ipcc.h are not
ordered by their numeric values, making it harder to cross-check
against hardware documentation and spot missing IDs at a glance.

Sort the defines in the IPCC_MPROC, IPCC_COMPUTE_L0, IPCC_COMPUTE_L1,
and IPCC_FENCE groups by ascending value.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-ipcc.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-ipcc.h b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
index 67f228e1aa0e..7659357691c1 100644
--- a/arch/arm64/boot/dts/qcom/hawi-ipcc.h
+++ b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
@@ -14,11 +14,11 @@
 #define IPCC_MPROC_SDC			4
 #define IPCC_MPROC_CDSP			5
 #define IPCC_MPROC_APSS			6
-#define IPCC_MPROC_SPSS			15
-#define IPCC_MPROC_TME			16
 #define IPCC_MPROC_SOCCP		12
 #define IPCC_MPROC_DCP			13
 #define IPCC_MPROC_QECP			14
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
 
 #define IPCC_COMPUTE_L0_LPASS		1
 #define IPCC_COMPUTE_L0_CDSP		2
@@ -26,10 +26,10 @@
 #define IPCC_COMPUTE_L0_GPU		4
 #define IPCC_COMPUTE_L0_CVP		8
 #define IPCC_COMPUTE_L0_CAM		9
-#define IPCC_COMPUTE_L0_VPU		12
-#define IPCC_COMPUTE_L0_SOCCP		16
 #define IPCC_COMPUTE_L0_CAM1		10
 #define IPCC_COMPUTE_L0_DCP		11
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
 
 #define IPCC_COMPUTE_L1_LPASS		1
 #define IPCC_COMPUTE_L1_CDSP		2
@@ -37,10 +37,10 @@
 #define IPCC_COMPUTE_L1_GPU		4
 #define IPCC_COMPUTE_L1_CVP		8
 #define IPCC_COMPUTE_L1_CAM		9
-#define IPCC_COMPUTE_L1_VPU		12
-#define IPCC_COMPUTE_L1_SOCCP		16
 #define IPCC_COMPUTE_L1_CAM1		10
 #define IPCC_COMPUTE_L1_DCP		11
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
 
 #define IPCC_PERIPH_CDSP		2
 #define IPCC_PERIPH_APSS		3
@@ -53,9 +53,9 @@
 #define IPCC_FENCE_GPU			4
 #define IPCC_FENCE_CVP			8
 #define IPCC_FENCE_CAM			9
-#define IPCC_FENCE_VPU			20
-#define IPCC_FENCE_SOCCP		24
 #define IPCC_FENCE_CAM1			10
 #define IPCC_FENCE_DCP			11
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
 
 #endif
-- 
2.55.0

