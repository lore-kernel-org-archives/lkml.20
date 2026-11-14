Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663217;
	b=hAan4kJqloqtPS/lKu8LZxhYxjS90BKFNqLJf8CYn51/I9xya/jjbEFm6uuaqH6K2n80
	 Z3ChTLGF+KU/p2BwGN+pnl7Pi1h/znyQFbue3KdEyxAukIYnBDiD2+DUoWz1ZO6j16Iwv
	 6R2kFHaB5GLMmCjUxLhHS//Of0FOlLPkZvS1vUokhrkfZLTi2ATb2Pky5jW8LKD70hsgq
	 x2lNhvBMTANDdjZNiFAeU81c0ZRQlQjBoo/73qPf67lNdOdM1GPiVlv09LN9tOK48SEfA
	 5qiKJ1h0TrXWE1EYpEkudVp1dBSZJEXbxfrECeX4ouc3ILR5Yb1Sy/zFTjObMmsMbRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
	b=LjH9XQzTwvXQFm+cRe4F6EnbL1S5ADTPcwx3LnL61IsvO+RgT/cleUNZt3zgAeguVF9Z
	 1FjrkTEnQemGPhxIVAWBNK8vpG0CSmi0Sc8GPRSr/Z3BtmQIQS0Uwb9AwuT1uoReCxhz/
	 pM2q6yuGwY3keXOOK56AHKW7QTkIIMaIEEIC9O455hXlrl4fGQdi3a02qYS6iRAZBy/4e
	 PR0W66QEhe5mg3Ag+Qz49BdERFEgyPAw26CsT9IjcETQOTlMe1Rrm2IepIeDM/OfKilYK
	 Xew1Vu2FpUT/DOdqcF8Q/Kkcayt4Oz3HlARi8kroGbJu+nlnZS8nyXzwLkV9RpTxfXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1oZUA4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H7Sq3x/U";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366E7606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 366E7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1oZUA4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H7Sq3x/U
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w9jF1750095
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vJO44KrOOjK
	HyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=; b=BE1oZUA42W6fgiC9Z3KFr5aLwF0
	qrSUMj4QcCd80jqeRGzGyuVmwkt3sz3M8NPBH5SmH77ILW0Atf1P2O7UuQKZvqJo
	3Bnz3pcWOfqJ96SLmG9XpB91vm9bWQv3qzFiNmcZHr3dE38oWklHj9BzYG8znQ2f
	wwv+Oig8bGCe/TnH8/pEKRW1eK5ZGAOX3VaIs5c5Qh7uGb1bRw7vfETtmxR5dFLy
	d6uStR3hb2V6sojYFSE98/dawDix7j1rlQGDVGeBy2lLo7Fl7nDw5ReGzk8ZSalw
	LJ3CVwa5gYWjcaAcsySE0iA4QkJZwb0SEn86xxizWCZwM4co6DY5IXeQjsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj40v46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e94f72fb9fso17079005ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663215; x=1795268015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
        b=H7Sq3x/UCbDoGmI7OwGiIC3sywajgJeEnfuW47HYJCZZVDO/pSFbIwP4FsV+5ett8k
         ghdDpoy6Q28LC/RbPxRNdkBLuSIy/0paJEOxcNvljCPE/icAR6Vhp59a1eucZujNKval
         yvzzyqs5WnGi+c7/LMSl82eiJ4qbkLgsLcvYDGk5cxgVOWjF/w9vpLZejVBwAWXdQmOE
         FYolJA4P47GhPLPTyCLDXbyzieUIjN1UeHJLkO7nkJK3RGFl7uqVz2HAnX4+kSN1NYPd
         Hnzsnlh/wDDJ95j5QsTGoK3b8cBhU3uEMyxODDzePpE7aTmXSnZ4FqQD1LHMnwItz6z3
         XF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663215; x=1795268015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
        b=QreWmJuxSg+M5BZzaiH5pBPITGwYrmvJRIITzyRbCVp8fwfQyob6oNOLz3FuepODs1
         8uRLvE9mfdvyfRmstuSExi3eFBfnDNN0PElJ0tNn75OX4SYkFo6sGNsato1L9YV+Fuxa
         cLZbChjaTlh7uSGLl2n1xiXHjt1uWGPHLlaeEk5kJigI+w2J5tAOKJTr6dPkvC/WFLvR
         9ohiCS+LaD+NhxbIKYI9yk6Fy4YqpTE6LmIoHlnn8ebTOKoVVD5ciST7UPvUFgjNXlkd
         srYcTCH++/F7aWFm+JJEynPgvVoXQrObbYVFZfsYykGeZTKEgpBL1gG9fcygJjFhEtA5
         CjPA==
X-Forwarded-Encrypted: i=1; AL+hErFxaEasLQ8tGKJHkPT69TrfaoeS0bLMuEPxC60UmItxgyFGXhtg8UDfSWGBPD0FLxRk3OTzgcWTE3T6pzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iO75QPEPrp3eyWvidTb9dEBRaKEKeBRf/ndBGhTcWg09osFql
	g4jlV0twJsz7ChoJoavtIS8hFsyK5c7zFH4Bd3llHsCQXcH0MzBrNZ00/EqOA8Wlt8TWrhSX1NG
	Q2HPsrU8C6Y4H03AVly7Fb3cwIr7HWXZTr3nUz39Rv3GgWWIPHLbWIbMxcGDIJuvYotmvlLbpDP
	nejA==
X-Gm-Gg: AYBFou3j6FguazFHSbyIx8xa3mEiHjc6Ob2cH9TtAvfbfi4GldhK9oi+wduKhL4K4X3
	N1fm41Bm91xDbvept+9P5Agr5n2sfqe9B0szJkkDd3iyfnqSdhdTx7Af42tlEDkgRI5eThcdSWo
	9wAhV/72OS25tGN9el/hmA9m6lLcS1gtpu5tbFLrIQKiWBYWbGRxAg+X8Fl+w0EoelRdO2D6xJ/
	AEHneugUs9/VR/3G2DfjYKDxH3TCw2ioqcWoIG02V3R6BsDLOorxEhv7wF/GTL+ZCy4oQ7qZLMA
	/wVHYh1SEDGfOYlRPuee598M75qF7LUSkYPq608OIIXBinvk+//91DKrUw888GrfZto7+4FMOzO
	3wWPRRVdKxb/JVN05ammWK9B4LHcu3DsgYfrLBeHN8vWCzk3TJX5JuaoftapzYEaMP6Atd3Uuch
	DgPeKkCcfkRbJd2wiczRL525BamDlj1xTXr1pp
X-Received: by 2002:a17:903:244f:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2ee0de41da6mr60980425ad.18.1794663214507;
        Sat, 14 Nov 2026 05:33:34 -0800 (PST)
X-Received: by 2002:a17:903:244f:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2ee0de41da6mr60980105ad.18.1794663214036;
        Sat, 14 Nov 2026 05:33:34 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:33 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: arm: qcom,ids: Correct SoC ID for Nord SA8797P
Date: Sat, 14 Nov 2026 21:33:01 +0800
Message-ID: <20261114133304.989635-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX6LT78n3G5vLz
 ZIqKYiE9oPflTU4LE5lApiIovVqLgCyc/LZNF+rgzsfL0IDlOkkDQYDw7tCFsVHbXu7tuRpQCS3
 UjS2xSzXeZ3h8GsMl42OlvPqAddvG/eCUGr1OAhuV5/DZlxysjI8Yf7Y+lv6owHmjBf/ZdMzo3m
 AfoFP2IxVAzFYijzDw8dQay9KjKjQtwoGrLrxf+y6cKgB8T/2C03SZ2yO03v4wtFHznqLDcxZ00
 UdrKzdaJQl9E0e/KzyJvR2NyKqFcg2xnXKbppEw9GmztSBBi1d05w50sK5ZPFo/2om+F481u0bU
 /Dy70MkRpsvqoZTtcUuFKjnBLzQGatYegnBwXPZnlIoP2PNmUGgzgV3BpmGWQ2q8dwXCdl6mPyL
 gACR2tRDBjAznZjt7mkBrsE8zuut9mGDz+gn5zHyRoTmElfSMXiV/6GIQ6DkOxCJig6oER5GLkD
 3YcfwAjpS7xBm4H9vEw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af8632f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4vZ1Im6IUACyycUlj1cA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: dBzBpMAQI2cjtarkVcNMc8HQ-84sr12H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfXxGE8z0mE8WfW
 rwi9SbxHW14J0wTBKM1iO89yFdLTu87yP/mp9k87LUlAQV6VAN5xjKyW3zDl0qDv0rXsLwNWIok
 qnrcqyq2ZLAUjhKn6tkfHT5HBjGhWPg=
X-Proofpoint-ORIG-GUID: dBzBpMAQI2cjtarkVcNMc8HQ-84sr12H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

QCOM_ID_SA8797P was defined as 690, but per Qualcomm chip info that
ID belongs to the QAM8797P/QAM8397P Snapdragon Ride module SKUs of
the Nord (NordAU) SoC. SA8797P itself is the default chip info
variant of the family with ID 648.

Correct QCOM_ID_SA8797P to 648 and add QCOM_ID_QAM8797P for 690.

Note this changes the value of an existing define. There are no
in-tree users other than the socinfo driver.

Fixes: 0670a10b7c22 ("dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d89d3b5dd00c..5e84c5a7666a 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SA8797P			648
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657
@@ -300,7 +301,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
-#define QCOM_ID_SA8797P			690
+#define QCOM_ID_QAM8797P		690
 #define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
-- 
2.43.0

