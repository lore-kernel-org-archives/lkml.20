Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762012EEE85
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051637; cv=none; b=tDkYza5uqNSNmz2kvGz9hxnDHRlGWFOXINv/3lFUldCXDzc/RJqxdCz+wrDHC5Y60yaVe5BESC4LFjbhz14DFixmeIfe0p5ibPhrTW4h70vEXNbcm5rnLD/LoD6oW9YVwTDnbzLGhZqC4wS1R0JgDAe+/siSPokCGI1zG1yqd6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051637; c=relaxed/simple;
	bh=+CrABi2X/StxEwnWst3mUt/1ibBP9K16D9ajzjNs1nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQLBUjVmNts6pWM+mQqw68sY+ut0+rw25dFN5d73n0p9Jl8Pa8np+huOzME2UC7N5teXYvtaT2ueoZ8MaBHGSAaBAADdI6+PRVSTGG8mUyTk+gEA1gu73Szo203p5QXc6Gk8SxiZlNJgPFVvOZ5YjsJfnkkYg6Rv/jCmX2fPAIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdK/lU/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eajmPJay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdK/lU/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eajmPJay"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Dtk2673792
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=; b=HdK/lU/KCvOIEeVB
	b8eXQ+pvxuQFs4/Fr2r9BmulpGXozcQQwxEsZZNsPVr0Cs6N5cW9rxH3AOgg/1Tk
	jp8AJsJ6a0o/PNKcUs0ptbqnt1ZK+Nup8jV0mMtIPMi4HzmUyVMNApvIIJOo5o0v
	uyPlB+0GyBiFTMV5jWdXVQHPCFCwSFLvOb2HH2/j5R8rZT71Yrq05VT1Y1ud0WSd
	oCdOo90e5egi6xAGcGCuncWz9cvM7o7TqQoBKKP9SzbZEgLhCygII7q3u0aBGFy5
	NAz3U1f2C/tOqo0jJSUEXXS4i2PUS+Ja2R+xOGD0yPyCgJeNb9HoQKDmWC/ftM0z
	FR1tvQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w7a6pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2904097a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051633; x=1790656433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=eajmPJayqslaM8h7062zPfs2F7yDcfbH60Lsb3u7Zw9DuH9ToQqn3FrGNO3WVCqfbS
         1qloFmlhOn2J+2Z1iWc2LWhmToRijtqC2fL4YlQO4pigamWIrWvgPeozlkFhhcQ3BVut
         BkcPAQIJYPtkXDi8RRSbnhSPMjXhsbQiElqUTbYPpr7UQeEkY1tWAgp27zQtj/tzaZ8o
         m7K7bsLz5A0Na1Wl0OUzxB5yWwxIE6VBeqnuP6m7XwaCo13W16TSjBu+7qdZifKkIelU
         tF7jpPsuvw8vdLRkg674lmR8NWT1/N96rlq6dYZ05dSSlFTKIVxyPdXdO45dWo0Z8uda
         hb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051633; x=1790656433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvjqr6fgEwD3B+/nx7OrBeom5nuYsBLcU8Ew/WCH294=;
        b=fjUbChsr18oQz8UR5tNQLAehW3jECinM3cMgKED0N2dLOypCAG+WMyNAZFc7QJkpLb
         HUy8eduWRJXlEwao7cMhl8DFXQBngeaA0k4DehNIaNDEQwfj1u2egk22HuOpBmaaGORo
         sDeQlBcbwXa1T8WNyHuwP4oO9FnFTPdSThhLLwvNMYoNnROXIrvcHw6edX/LiUvGAayy
         nXpyWV0+NWPlXYj9vJXAn6qgvzkXGS6RTy2F1VZ5TfkjnaXPpUiN4drC3/YNMB2E0IF4
         4nNr40DBbgXV2HMuu7+6cijevPA85enP6EiEe64s6KjReRKtHpQPoZmNv9r6kxN/nQtE
         Pq9Q==
X-Forwarded-Encrypted: i=1; AKwUvBygURgXq0qf37VScTTPAMTuTkRdoTIztX9hrC4awzA5K2rcx9qnxAnhvlYvqIkWWyH3Wrd34TQgWO/rIMM=@vger.kernel.org
X-Gm-Message-State: AFuF++kmRwlYV8uUQlrXz52CzuCi2ozh3b0ZKbpJHKqBjC0P0S7iR2wT
	gAlhOO9lv3q7I3W9LUTTu3FDWFbx/NmsSsBKMFeDwu6LMh4b7qfOP0xvYERF1O4jVghvaiDc/mb
	eFd8VK8JTMSfQPEKQpSoBWgRo5dw72LmDz4M+U/8W0cUX6LV6qlgGFQL4ecKKIOsLlf4=
X-Gm-Gg: AYBFou2jcDLVu2Wu/n7SfRhMScGPNQUYN4Q3dtMbp/zW9k0yxFcrRSbOD2ywO9aNr9r
	NDZnlSVimkBRL2J8By+69TI66PvoNtKdBnqzozwf8eHXiiQcE47MUNSwqS3hvT54vftkCjwYZ8C
	tbLVKvuBPfIbSknt9xMX8rWaZ9s30AXXKZ9K/zYhMLY5R5PWLMA9nQzFUoQRLcBkfELbsp9DHQK
	9nsL21Ohd9z8azXH7Rz/B8Th0koNJgR2tDz3ZMcqQ5OmUHOP9MuaV0LvXUmJDmczFD1nnwxG/vy
	oOF1bcWwAMe7g57WS8kJeHAsEyb2pzV1C6fajs60F1roW5tTI/dQIv/Fg8Fy6NdLiuOveKxeEeQ
	NFARSni629dfGUxKN5OKo4UaBa8KGUNUjzQ2lBpSr9ydAdsDlGcXZewjfNETA/s5nRVDzpmKI4f
	T56iZFVVq4nUgPqjPjgxXPVQyOLh8rEVBwPOE=
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr19428378a91.23.1790051633409;
        Mon, 21 Sep 2026 21:33:53 -0700 (PDT)
X-Received: by 2002:a17:90b:530f:b0:39d:fcbe:c1ae with SMTP id 98e67ed59e1d1-39e54ff2f17mr19428342a91.23.1790051632870;
        Mon, 21 Sep 2026 21:33:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:03:15 +0530
Subject: [PATCH v2 2/3] soc: qcom: socinfo: add few more SOC IDs for
 IPQ5210 family
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ipq52xx_new_ids-v2-2-4b1a0f3d04b2@oss.qualcomm.com>
References: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
In-Reply-To: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: zIrdmahUNk-9CHFTWHgP96gQcXK1sJuB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX0zDsgJ9GhxBw
 k5BSUmtFSHhnj1B26D1Hb6Q3r5BsDkoA3O45dxIUaL5+qMN0iSCQMnHAk9pUg+YBjNCHYOiSMRT
 eDsuHg65eQ1H+PtJYm0UzHrkkGVrILUWbGAxIhf9ZTQPh/ntxLCkHKG1Fq3Iw4n4rNWdvQ3dmXN
 xbppfekYVqx1ZN//b2C1ryU7Nfwxq2Cn72gnfRj6f+HSTo3DB3M3O0j++esgZNgyDI8wrpxHbtp
 nhVYC5WYkzuPkmCxMMLA6s1NpWR9pBn9wK6235/HaL30cLzEBTptIDkGKYraEd0CRaSQLKzz1KU
 JsyYTbhWM/EuhkTTZ1ZbIB7zj4gQmn61w2nu7tApa6aeJrRDNhIFsx+Dvkm4/KL6D8tzWRJc+nZ
 A2PvisiPWZAsd/pfPOT8oKu9dQGFm4Oe3PEElpKRTVQFjIHrVyH69d7iUNFrXKy+kB1TJuiOm6K
 vea8t3NQNQe/dNb0a4A==
X-Proofpoint-ORIG-GUID: zIrdmahUNk-9CHFTWHgP96gQcXK1sJuB
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab20532 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PP8aMIA6NNbLyI7UcOwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX2jelF/KldbIw
 NhJW4fn5eMlpK0cxmfTYv+fayMScx4p4CdlCqA9/nNmMNtYlVycZzJJZaymTef6rCxsaD9qkd29
 zhEskKi5sxMCFlVULxrl6FwxPbICpJk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..4e7e14fe7231 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -558,6 +558,8 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9630) },
 	{ qcom_board_id(IPQ9640) },
 	{ qcom_board_id(IPQ9670) },
+	{ qcom_board_id(QCF3211) },
+	{ qcom_board_id(IPQ5211) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)

-- 
2.34.1

