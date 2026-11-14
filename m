Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663229;
	b=jfdI9A/3DE3fAyn8SNeXZWRPLF9Dcr/sf+Xa6K4o6Ghpq4EYYXe7Jzfvzu4DfwjiRe8s
	 ULAU9t/2mNhA1RqLccEDfPr+srXhPMZ4pGy1PF6W21+35gQYTqtTFQP6+KlnxZF8eGWUx
	 uybJff9cODT2ZYNsR1itaivzs0xkdmLYnyHedmGD5pMr8zhuBtdS2sStwpgtvKfQOJbwQ
	 QIZMG4nmwGkC7gfXs9gK4VttpCAnTGGGZfopdj6hJnNPXhpxPEPG6QwBI15IEYJxEy54N
	 jfShq33+cjYqQupdQ9NQUbDTuA1GPPA/uzbHN0Tme9qSGVyzN3IDt2Pfp1mbOv+xrfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
	b=TXYpZ8EP5pYw6u9sp7KNAc/hVsrTcczI8O1oSh//NYoizekupqBRnnrJwKjCtElB4tXA
	 Li1sS9LQ+sk5FCAImvnPyC1mM689zSL1Fk8bLL5BehsB+fhnxZjeS/8rqSjhn5M+/otPW
	 LeuxzNPmwjvH03D+rJNEtBUufmjvGhD/mlrLCQ5q/ZbZiJH6bBpxp16DEKy2X+hlv45/e
	 5YV8JOL+p1j6L+XJoKfyBCo9pEYqqvDeJ5EqxJRS8D8rnzpUNdQ0ibZjNd3HMXUWK+35J
	 22sROUcaFnSaSLiYvkJ84wk7D+O9R1BqVFRkS320I6nxSumPIm5+SHXlF2FJ9gNX8Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0jg0wOs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7wXEufy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A5606A88A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0A5606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0jg0wOs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7wXEufy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wQZx3379691
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7rjRjbUCbBE
	YBTu1h8HP42axTTj090IQJUErwaGJ3I0=; b=G0jg0wOsQwALK0I6fuaxrUZqtF0
	kFrTDzQoEGgsxyJb5bqP4NFVV5luZKBpQLKuHtBqTAIqipRn4/yCloo3dQWhV6+q
	okeBZ5mzCKd00pIh758obnvtrIwQcGvf05sYR4vHafts3yHceY7bth5/NxEQWfd6
	PHc3eCdhIN9F2DAH61VcRihlWo93PPrx1yW0TN/6pJFnVOcp21T5q6GmkTDtL2dE
	pohaw+CzMhi2biEd+Wy5Fu6gNirvJQkvDhP/scrBsC4XpqJneLyX6kv4ZGOCta50
	V9g1jX0Fs1GrUq9wz+UwFgsisi4xILG0rzJ3pCkKeChQnstIhD+D55rKL2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx0vc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:33:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee184a2474so11194545ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663227; x=1795268027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
        b=I7wXEufybj9XjNfo8H4l7DitsBSJBdwTOKpNqc6vg6aucV0PWvnZjAv/OEXJ5ZaX3S
         2OMbgIdmEsXKNn+1QFZH6ql44Jrbk4t6dk1cVzPUBrl1xLKYqKzhFQyCk1r6whO0bJVA
         BQp1/6J6nal+k92jzwp/BqrKZOOfSuZpSC6UcmVMvhzb+UB4LyKX/PTxvH1P/69cccKB
         Z3YBX87oSufX96o42WVsefyUoJY59jD42L6W0uNlqlAizSpbpUI0gTI4aIb9CTT8yvDI
         2KYLoKTuHUl0K1Hso0K1EBOEXo0ortTa3sssAiop7mPsXVRkzL3CGQjBv11bOOaKUKjt
         3Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663227; x=1795268027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
        b=pJIPUG7cQlkE7SFxK4BVWkmgjeksuz1HW3hQn2PxPyUxZR2ON5vwPSlrJFGfFrWq1L
         n0LBWsQlF6dp+zOb/rwH9CJ88Xvgu/oXeGtVPM3CT43Em2QSHfU0FOOWV50+4SQCu1pq
         AveJRSU/vnqo/ccIIjtBFR1nCS+Tu/DLjNVDFpeHHI6vUzC1om8w+e/0+UB6JYbOMqH4
         TA5KjhYvuyX1+rX0q4VNf+Qa+fCpDX9iRg7LIiF/O05OIP5WdZl6WkEH5+2Xl6SpHT1r
         sYSSaEc4hrmcTVfY9z8C8GfSFtegIPltb1MU6Rfem1NBX8XJRTuc2gQ3U0dJI+z6VkC5
         AmeQ==
X-Forwarded-Encrypted: i=1; AL+hErEsdTkGfzUMsBF5iLEo0caf5GiBEjTTSSuCGalmSxh6Rt7J8vLHrgClWj5VZGXxY9IbW/3UuAW4n+82i0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2d8vJj5dysFCqGNYsAaBMvvf3GUWqnJzoKMskNrWOpkMaPJwT
	B7i75y2A6sEMHnuo2oglp3kMEJJVPNDuinOjqUTDugCqgDmsIOpms62Ej1W9b39UWTNIIC1jIon
	kImTPTVQ1g3UzPgjCaiQzOw0gMKPxGT0Sw7/7LtDysQjuEVaxLlTWz4kmT4a0nNUj9nU=
X-Gm-Gg: AYBFou1POVVPeGGX+DH+vH/e1Hsxh3XUl0AzAZ/oaDGcrXGuV8eAU/FVAVjHABG5YcQ
	S5lHHac2Srug/MGqAFdo7YzZP9n12YBqGQpxfEwNznpM5aq9NfTyjrrNLfs+MIJDCS9rJvNHEXI
	EvE4z5WTjndXLdOAJuJlWTy+0QPBG42Ir9Uc7+i5YA6ujight7qfN67wLGlcn7vWJzjAQK2NlwQ
	0xFhXUGvBZuOUqXmrpYd+y1oyfXXL0aFS5XhSq1yFCGgvrkzAbbegozalhHfFHH5kjd8ecO0NCj
	D+ibdvPM2X1Dtboc+s7Ymx2SHKCfkgycAGH8mmhvFJB537xaQOSRTj58RytUjE9ggXxcYFrDO6C
	ZVEAhvB0qfW72vt0Uq/1VXSaK7Ejase9xtPrUHDqiRDTh5jnYhDHS81VMbLVET8+7Ov28To45SC
	vSWZCGpfGDtsWN6I6aldhoNAS6qG5o5lLl9PU2
X-Received: by 2002:a17:902:e84a:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2ee0dc04d6cmr52558105ad.37.1794663226570;
        Sat, 14 Nov 2026 05:33:46 -0800 (PST)
X-Received: by 2002:a17:902:e84a:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2ee0dc04d6cmr52557975ad.37.1794663226156;
        Sat, 14 Nov 2026 05:33:46 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:45 -0800 (PST)
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
Subject: [PATCH 4/4] soc: qcom: socinfo: Add SoC ID for IQ10800MD
Date: Sat, 14 Nov 2026 21:33:04 +0800
Message-ID: <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX7zHODs19hl4v
 qxwpEMXkRqdWpRdR0JqJ5qoZUH4H4tVJEwP8G+wnwldSz/fS06UI+2eGNRUF0277pG6jaQJl39g
 lYCN/1LF0RN/JMVH3OpubQVaLRRbdJTDvLzuOY3OguqkjvtEanbF1LbXXogbuftbJi+aFVCAVCF
 qtVZ1VKOI+ZkHiQc9cLZ2oytDmy6I8ya5A+Ab8Og0npvxK7vua/ED7QfNVtoPfcrmaaCW0qSzO1
 hmrIGUgeodXZtJnDFQ5HH9yiouESD3gOKAq+nkGTL7vy8I+rf3M8heyygkNHHfnWhcOR4U6HLED
 OVAqlLxrDuWnFy5EXSDlACpZfBb5EBBheICYwA8yEbsOPAMSr5tVsOf/fW9/oWd/3BHxwLf42/0
 DC0VzIfB1w6pk+Bz+Bc6zPpwWdF1y7RxVoT/oQmMYF2Z7afkHhz2JXFXibgNJ2p3pAdJov92EiQ
 Vu/jJxg+KgNFPge0A1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX6F/v6dd3fyaq
 ZTBvx6gXuCs+NBrZ3jQ5XdNe5XI3q6pWCBGxp6y1dvs6GjYbrNpCPJIfTMe19UfD/gs715m797N
 xVBLjfNkcBUrbu7d0fWA1eEMZLe1DOA=
X-Proofpoint-ORIG-GUID: nmRTWFyuc6iVpc0ktpkn85Ea_I3Zf89K
X-Proofpoint-GUID: nmRTWFyuc6iVpc0ktpkn85Ea_I3Zf89K
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af8633b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0mEx7QAgp8bgaAyPUFEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

Add SoC ID for Qualcomm IQ10800MD, the robotics SKU of the Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ecb4369fd309..950b5c226f04 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -561,6 +561,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9630) },
 	{ qcom_board_id(IPQ9640) },
 	{ qcom_board_id(IPQ9670) },
+	{ qcom_board_id(IQ10800MD) },
 	{ qcom_board_id(QCF3211) },
 	{ qcom_board_id(IPQ5211) },
 };
-- 
2.43.0

