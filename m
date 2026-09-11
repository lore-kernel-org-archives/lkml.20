Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F995353A65
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136469; cv=none; b=exh/2lx6M4KhrbLiiwTUf4Ay/CQp0UcCEKu4hgRQKvo/wXyvkU7nNMF+//OJy/Y1K54uZ3bzGGHdrcpJFC1I8TCqmN2sHqeQQ1iSAqLRq7w7qfRWy+WWbXQakQ4C/SQ/PqdneHHLhn+cXnK/py/ZVICiTC+vTbMXK3yCYCZ0ybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136469; c=relaxed/simple;
	bh=BOTzSHBVyhqvDjlvFvqw3Zdmu5/vzVG84AmyMcCiDf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g59znxjZr2EqcmWPzHHg0x55P2cMTR4lvs/1BDYhpG3K9waZ4OsSx7Gq1gwGEEzwIS+NwxAyvAqMLkH1g2W/vlRdJ1Rod092LzDX0XxRFmhCCFRzgzm/9oJZOKI15Zf3bUsjc/J3hZyniht+8nJ0OAadaJERF3gsR2jLHrfU8uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPxXoWol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9nl9wWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPxXoWol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9nl9wWE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiY9n3505470
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vNrBsY1KmFV
	0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=; b=JPxXoWolDJxs5jyDVEg20nWOLXh
	95ScjEYo3ZMRUmcpLiLJfQ4oKJbF9ZIStjLTpqK55LDRDvaOgUVAlP+TL/1Y6EF0
	U8Qb72aXVb84P8hBFsiPqV5rM8YcnOLSHCayfIW8VjY3SyIWF/bRQPVwLxKrmjlI
	bm5XKb828E770rf4iad9zb6Je1SaGp51HL4ncuDXltgOxjHTtI9vX4AmfH7KW0ND
	kzKYDVIkFaVkvcZFpdOLWi0D3WSTCCFSY5Nvdwk39+VYnO7aJMcjuGHeiINptJ5f
	4e0oC9r/yC5MhZYFsyAS4RkXBUCgjqTOPFk2u2vYy8V3wFNie0CeLxI17Jw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhvkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:06 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8546e211940so11429547b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136466; x=1789741266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNrBsY1KmFV0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=;
        b=B9nl9wWEsD9bqF+MY0wEGbUY45EY+pGh7ju/WAkJEHUwxn7jsDekaQTwxsdwJEH3q6
         Hue530bnp4NZM7sUj0Y6H5LReAt1gWKRMWVkE7PcgXFMa37Qhb7nzDLbsu/zWNr8+zVb
         Kl1ZWTw/0JUv+5HOUZwvFDmVf9oh+yw5hmwBHJORkCKM2L9oGeKic44vPCE5hFN3qQKi
         UcA1XS1QfIR6sRjCTtox37/Vj9/W925WJbu1AEd/TrGZpdDMk10naBSpTrXidqsMLcuk
         lWAXZyYhM3YjlOS7SqCNEO2SO9H4fyycOFDhj6NLhrNskLeaSdJSujBi0JzGOtxy5T7G
         lW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136466; x=1789741266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNrBsY1KmFV0eVNZ8RefljSRUWHCi7H4Prg3Fz5IFwk=;
        b=rV71rSxsR57Lpzmso2CK5hbBTt6VhfNZY+H1COwm9tFF+lLvJMRCUvCDGJJTF0uueL
         1k2RYPLAKcdiUWbJ5v6eP1TScF/yIiZuICsPe89j4xH2B6SSNYNQhIQtKywKDwKPgOoD
         aqAatjlQLsH2AzTJeioyqq1O+V7rXsg4pSzwXWv24SKayZ4hIYY4WH2mRjvXwq9841jt
         NeW+AzPDEeC8o7zLN5R+ov/MosGfXjqXYYu6Dv1TeAUE9DpUs57EwYgRljvrKJ04i8kS
         AU2C6I4VbdHfWOL9R5Mbe8hGiuSz0nNknnLbU9Zu9vQ+QKxKHkcoVwIiNW37DbwqFsqr
         jH9w==
X-Forwarded-Encrypted: i=1; AKwUvBzTXDKjq4eOBNLwCw9SnZMLPgVzpR3XaGlNKeDACHU3DrEJ+T5qDHiczCicwDCl2+1pqYp5EczGPxkOCwU=@vger.kernel.org
X-Gm-Message-State: AFuF++n38zeyc8sEVPCiyLZk7Q+Fvq8Kd2VFfxqHNH0tQ4IQZrSaMyjE
	FyKbkW5pWNBva0ljDM94M1OuNCN6wLRCH+DI2Zx9YBAOWxYzlAuPtiuUpizyrcRd7ziEdxom82O
	8D8T2SB8scMRJAg9ok/wPEVKlsVz6YSMxmHuTgDnUACLv7jM6MpZ6bGyKhdKvios1yBY=
X-Gm-Gg: AYBFou3i85rlKGF5NxbtnL8ABbAB7uOAhViaU86UgjInPS+rxdfqYn5LWrgjErM2ec7
	2pwtmLpWEldHXxqDtzNmF5kMq3BDxEyGEFxHhV1GQ7IzEeXCL9Hrm7lVYflDPHD8xCy5A1s0lR3
	+OkoInycmyVmxAAn59Wg/+Hb0k6B3m/K+wZKv3dTE2IfBHI1T0+6bGIFOWJyDQDkhcWdGQiVbMz
	BYvbbnV1NIXlADn+ZLdXh3x29pwP8nRfOB91Lu/oNWc5sbwTuf0G+KzfPNKoaynRJ2gOu1yI5vL
	JQbgrMnDOWzeiBpapMHqPVkpiopfzlUOXpkDYLgCWksdXLxX8TDEzXov2W+DsJrx8qynTTMOtR0
	TPqpDHmJmmDRzSo7V2c1i1Z4y70wwL/kFdvPjsqjsJmPRuyHBYh/T3p9cJ15V
X-Received: by 2002:a05:690c:3489:b0:885:28f5:66b8 with SMTP id 00721157ae682-88528f56fd9mr7614827b3.60.1789136466012;
        Fri, 11 Sep 2026 07:21:06 -0700 (PDT)
X-Received: by 2002:a05:690c:3489:b0:885:28f5:66b8 with SMTP id 00721157ae682-88528f56fd9mr7614477b3.60.1789136465135;
        Fri, 11 Sep 2026 07:21:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/5] arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin functions
Date: Fri, 11 Sep 2026 22:20:36 +0800
Message-ID: <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX512KPn+A2Gb7
 job0syoAv59Ux2d2SKZ/+ThvubvxZI9UOmzyddv3Sgpd32U1M0v022DXc+MD/Bhy+8GTAnVWQ2f
 1JdqmACBrM9+ifgOYIicJ0s9Sl1uNrbCPv7/LIfCR8rnUus2hmJpXg+jod87qDwUJUQC5s0IHCX
 h6Kk1jKkyQNc5xHNYajKkUapxNnfi52Oah0LFRFUYgHNCAb9FNzmIOZcfm8XJjvZlBA1kEN1ah4
 aZWKoWTNwIvaCqITwJByxalnfFEmjJjGAfnk+B+1BSORDOS0NtQlPq/3XEcI1cc59KVzKFp3RDQ
 refq9c9Himt/+0dcHv823C+7sEp2x63RaYroVwjVfJyrXPfmN6RuDGrHdbmps6mK4i/pepSNgDS
 84ILPjTs/fQ7sFO4EEbpez9Jg6YrF29lotBDop13xO0iPpDIwVV84srjIDe0b06zkBwu31IbWg8
 7Bv9QZXteHtzm17/vtw==
X-Proofpoint-GUID: MVuNtiKqvmRbBSxSiSV3Suerpl6Jj5eW
X-Proofpoint-ORIG-GUID: MVuNtiKqvmRbBSxSiSV3Suerpl6Jj5eW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX4o83ymzh/ZAn
 t4YIJQy69e+0Bwk5rYlk5RWWFvBcQ+lhrq/ffZ+Bo/Bdh7jeLbRmCLj5KQq1LzugUAp/CE+Sl8n
 pkEz5csb3MpRcO3QT6gpqOJGE2miv+8=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa40e52 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=asaw0DWA8FDCBGCi_ycA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

The i2c9/i2c10 and uart9/uart10 pinctrl states shared the same pins and
the same "qup1_se2"/"qup1_se3" function name, so the I2C states were
indistinguishable from the UART ones and ended up muxing the UART lanes.
i2c9 and i2c10 therefore did not work.

Now that the TLMM driver names each lane pair separately, select the
lane 0/1 function for I2C and the lane 2/3 function for UART.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index a03ee16c9cff..c7ac2e66632e 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1056,14 +1056,14 @@ qup_i2c8_default: qup-i2c8-default-state {
 
 	qup_i2c9_default: qup-i2c9-default-state {
 		pins = "gpio127", "gpio128";
-		function = "qup1_se2";
+		function = "qup1_se2_01";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
 
 	qup_i2c10_default: qup-i2c10-default-state {
 		pins = "gpio129", "gpio130";
-		function = "qup1_se3";
+		function = "qup1_se3_01";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
@@ -1461,14 +1461,14 @@ qup_uart8_default: qup-uart8-default-state {
 
 	qup_uart9_default: qup-uart9-default-state {
 		pins = "gpio127", "gpio128";
-		function = "qup1_se2";
+		function = "qup1_se2_23";
 		drive-strength = <2>;
 		bias-disable;
 	};
 
 	qup_uart10_default: qup-uart10-default-state {
 		pins = "gpio129", "gpio130";
-		function = "qup1_se3";
+		function = "qup1_se3_23";
 		drive-strength = <2>;
 		bias-disable;
 	};
-- 
2.43.0

