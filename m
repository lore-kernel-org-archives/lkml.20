Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7865A5133
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894350; cv=none; b=rAivyWxBBASjjpOB+3gFmVFvP3+a+1lUNAn+Ct6qTBnLeREj2N4z6EOSFcXoOg8uqgEgR2hsTGYfYZPxLxUP2R/DtOeeOnnXNfAbd69LbG6LOGfr6dEGWbXZbK9LJ37YYb8uzv23WS5sNX0W9KplcX7b++nqIkVgZgvihMIGUoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894350; c=relaxed/simple;
	bh=NH8hCdUqoEjwggQCxCWwuM/riw4/p5jd9e2lIyL0BgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cTprkfZqesvm93Dn2up6qwQ+g0skhkAlGHRBNHTwxlLgCusO59Kx3PgSK5cQgloJayKX9BMl7ziNEYYjLajmScqzloCPtjVU9PuKwGH4uORO17Pa9QhLicMXh2Jfm5IKqbHArocua70ZWLbXMmlOUyaGE+xHBSBIVtFYyrA+6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8ClQkIr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmpBnqrR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8ClQkIr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmpBnqrR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688GLqG33502029
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 19:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMNCaqOh+eaKj5SCYMfOKgvYNnoP17b+wFQCBXGNPk8=; b=Z8ClQkIrJ2oVTy8J
	Ke5XPuu+5XQ/cRrQFDXx/hHzWErFLhAnC4oR4Xv4c4O6lqMn+y1D2DNlgQzdrBt5
	TiK7lcdcSLARZeWlQfa4y3vt8oTD9d4AFyyaG5OomjXbDajpssE3aVoC9IavWThP
	aiFyLiMk914XXaqkViSFyodsRYsR7LozYxYyjNTN0pyLh3T82m9wdEKSit1UoXVY
	VQgFxNyEPguGIYmMejfSxxLA7/9OQJ55p+3jRitcALGEhjjNoNPHbTb2/MBT+5FW
	k++sYSxTya/9O7YJnkZSLmaW/Z1aaiQ3oAjx6vcJFgH8H7CDtx42xq632tqQupq9
	pGZRGA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpgsuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:05:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so9476683a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788894346; x=1789499146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMNCaqOh+eaKj5SCYMfOKgvYNnoP17b+wFQCBXGNPk8=;
        b=DmpBnqrRtqfu24LB2pIbfr7XKWHIoWweezRKpJi3kuMH/ilP/mZ54lf458VV5pleLu
         Ct3tEvpXAXfKnvzThkrJPKZ8Zjpgnk7+inIdFnMrvF65mL83Gxn1ti++gRVr3CHOySTQ
         sN6M4C522RS+mzMRUNsbHAkR0TNwd4mHkYYCW8qr0KKR+Gw3U07L3ZHI1D68S5J4CzIU
         a9k7f3lTg7p24QFBCFuK4GGuCOy0AgIw/od3cNJ+AHuOHRUKijSIi4co4xZO2yHZ4QCy
         lwF7/0eKdw2+TsNTxzP7WWM/MjZRKWpmdOoj4Eph6nd+KFgU2fE884paRNW1Cct2MeEj
         sTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894346; x=1789499146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMNCaqOh+eaKj5SCYMfOKgvYNnoP17b+wFQCBXGNPk8=;
        b=QvPeaCTiAZjxn4wSqRmpj+1A1PDUnxZ1h/rK6S26mpi8482mTy1+0zzhmtLBctTsU+
         F6/Jly4bRm3dhhIV9F9Io+1OdujbWV7rOjDlCj7/zV0A/l2KK4Ke9UfIJ6HNXQQnLluu
         7vAd6+IkLhkSlVa5IJyBPTyEYrsNMsfC5ni7jZ18AM2hhr45Jaz4z+2w3KvGZS/ZRZHt
         1UTaEiEdCflo1NVKsB1C7oppO2RPB5MbNnqbbzemj+aBo4rf3/aPvZ5iw5kxDP0Vq/UJ
         8bnHGUH9a7pxIqIxpCEiQrDCos/3nnh1MtIz7fBRG29FldDQr/BDpzkZVEF8N9Ilsdtx
         ymng==
X-Forwarded-Encrypted: i=1; AKwUvBzBu64SJvSHM0KyrbVeZTl5A0PAoWxVgIvI4OkGGt1Re3MkCTb+C54JjOAwth9EmoKf5XzgAnrlz+aHm38=@vger.kernel.org
X-Gm-Message-State: AFuF++krjYkGXzpeAT4stOLdPI6pBA4srO8E5Ejcf56haUnK8sT6VHUH
	HZhKL/Hvb5/DBTunqHkFlh2Pi/vvt5K4NxCYSTxgHwIkEc9JRBFD7+ijhgDxXU7QtooUnD/wJlX
	Q4wfYB1B5jpmBPKaGpHIqXY6o9E3viGT64rhzRq2f9t28sCOfeK3cnyI734mXeJig8FkWNg6m+9
	4=
X-Gm-Gg: AYBFou2coiDGDrzfOwZ6+apsmAp4+GvOwq903WXNG7X5PN01gEYEh/tTVGytrsHxClB
	nvgm/zK/z7fMwFyMDZQBrq5t/VYaPD0sVEyJ9m1DWuLtjmomt9OSGcznqdtrdIuqxjnmIm+R4bU
	LdwPKgzNrHk1EWVaZdRlQWpnhD+ArLra3QdVME1kUooUCriFMBvL9bHbbXO+9C4k8YgpI8xeI1f
	ICmVQWdneaTyhgSfPWgnGU7ycqX4v4DB4lzfCdkL6g2jagKevq7uLJ2laQpU1Gv9v0YvNbqTby7
	Gg2oatlgnhndu4g5cG35Du8YxdLaadqw7MciF7olp9O0Z/4YFgIBGL1w7kFmX/6dKiST2X+TCPh
	m87XJLOV8t3Zh9UiLfoHDzVc2ICyDC3DDS0sz
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr43809678a91.1.1788894345798;
        Tue, 08 Sep 2026 12:05:45 -0700 (PDT)
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr43809571a91.1.1788894345226;
        Tue, 08 Sep 2026 12:05:45 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm37603085eec.12.2026.09.08.12.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:05:44 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:35:33 +0530
Subject: [PATCH 1/2] soc: qcom: geni-se: Correct QUP Core ICC vote
 constants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-correct-icc-bandwidth-vote-constants-v1-1-fbebf6b3c341@oss.qualcomm.com>
References: <20260909-correct-icc-bandwidth-vote-constants-v1-0-fbebf6b3c341@oss.qualcomm.com>
In-Reply-To: <20260909-correct-icc-bandwidth-vote-constants-v1-0-fbebf6b3c341@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788894336; l=2116;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=NH8hCdUqoEjwggQCxCWwuM/riw4/p5jd9e2lIyL0BgE=;
 b=0Dcb91wtWU1eJCAqBwA1L1Y8lMdK1ndi+zysr0naGtdcBD/+1Xo8tHaMgRUId6ALC9wUMWI1B
 /GZ7v9n2Ys4DjSDUtNLfC5te1X5g+3I6CGLvIJnysAhLcJ0MTnentqA
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIwNyBTYWx0ZWRfX8JMOKtfL4qS5
 v5FT4o+Gg9bFDpMpBnDEJLlzosdzOtpJd0QXTTjUEbSalwDBWslXM90sENn2nMwh6hBxRp3wzP6
 kZl5Ue+OuVnMUq26aZdJccm5vOcfIOmwywun8qtxoO3iLMhmpj8ty4LAakAjO4uGGT9cRZrSlil
 EqI3VGzcf8FRQdcRiuNvOXrqv2kMPRgVBgzgn3y1zc3sTELbZPHWZFcx91esiknKIM/O0RsTxNU
 FgI0Ol86pKUXFEpQRwURpqG0/GWokgncKsuUuRcHxqml9jvtc2VEKtCz/uaUXfkdRSQFJiTaOOu
 xc+I6fyEmAEIJZTTWvdTvkiL2WRwcztE66DLmoONELp7AONzyg+72S0VreaJHI99s2kW9crq2Gh
 375E/LXHjSrHo7luk/iReqJ5fuaLp1xlhN4YpfmwhRwS8NHsz0ZX0iEqKcwvV6Puq88R8cr7HsE
 DqFJW5qc3VgU7zQ3Zng==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa05c8a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QsC0wKSHi7t2lIrDVIEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 3KC6KiZa9fpL-bePcee35FoxOOYcROQ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIwNyBTYWx0ZWRfX85d5HqkbxnHX
 WNkIHY835Y0BcmW98ugxFgKryweOrSV7h6eVOvCvZq88YEmcFwZ0XyM983Wet5MEKCLmn079JOQ
 gIimZMf9VkNdaVaqc7Rrwipt/kY9pII=
X-Proofpoint-GUID: 3KC6KiZa9fpL-bePcee35FoxOOYcROQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080207

The GENI_TO_CORE ("qup-core") ICC vote selects the QUP Core 2X clock
rate. The CORE_2X_*_MHZ constants are expressed in Bps, but their
values are several orders of magnitude too small. For example, the
50 MHz threshold is represented by 2500 rather than 25000000 Bps.

As a result, clients using these constants can severely under-vote the
QUP Core clock.

Correct the constants to their intended Bps thresholds so that the ICC
provider selects the corresponding QUP Core 2X clock rate.

Fixes: 58ffbba6a399 ("soc: qcom: geni: Support for ICC voting")
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 include/linux/soc/qcom/geni-se.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..2243005f5e2e 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -347,17 +347,18 @@ struct geni_se {
 #define QUP_SE_VERSION_2_5                  0x20050000
 
 /*
- * Define bandwidth thresholds that cause the underlying Core 2X interconnect
- * clock to run at the named frequency. These baseline values are recommended
- * by the hardware team, and are not dynamically scaled with GENI bandwidth
- * beyond basic on/off.
+ * ICC bandwidth values in Bps for the GENI_TO_CORE ("qup-core") path.
+ * Convert them with Bps_to_icc() before setting avg_bw. The QUP ICC provider
+ * maps each threshold to the Core 2X rate named by the macro suffix.
+ *
+ * These values are core clock votes, not GENI transfer bandwidths.
  */
-#define CORE_2X_19_2_MHZ		960
-#define CORE_2X_50_MHZ			2500
-#define CORE_2X_100_MHZ			5000
-#define CORE_2X_150_MHZ			7500
-#define CORE_2X_200_MHZ			10000
-#define CORE_2X_236_MHZ			16383
+#define CORE_2X_19_2_MHZ		9600000
+#define CORE_2X_50_MHZ			25000000
+#define CORE_2X_100_MHZ			50000000
+#define CORE_2X_150_MHZ			75000000
+#define CORE_2X_200_MHZ			100000000
+#define CORE_2X_236_MHZ			118000000
 
 #define GENI_DEFAULT_BW			Bps_to_icc(1000)
 

-- 
2.34.1

