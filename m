Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A9A47D477
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363720; cv=none; b=lypG9H6ogCy5NmXgE7n5QjW4ox5PJ7gpPmJb5ZO873S76ZoC0l8gNW8T7IQdlTPD9JmqTct9HIzL7w5UuvtgaC8XV4jRUkvMWCRNmBG421SbOWpN19VEWOO81gDsLMXlXdifMPjYc5AEdSdUiM253vGTDqshhN8opR3yLGVwySc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363720; c=relaxed/simple;
	bh=T8GaM/DWCcTwfgaKLNVN9FohEqx9SJOxt4Sb3BkyXS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HH+/M+gI/g7JwirUCcbWEEXbaMuIFuMqLUCOGTcCvZgTZHrumjagqh3KC6l+BMXbWQ/1BzD2oejlCVP7ZpV4CCVyDETfSqXEX+eOCsIxnuFHWfmveVJX6YCFkqkfdOrES3MzOlT4coycCwFuKUJWrMqzm+nAK60Xva2q0Z1s/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blrlk3rz reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blrlk3rz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jRiv118860
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3s9eIt8PRE
	KTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=; b=blrlk3rzgF1XvmajNUV439Xx1RL
	FSZNlvvah4TZqNZvgGD9CfhGLqPwi0sfOABWYiCViXGJKU04+H8vhaYc7z8I5Ohc
	3UGcOP6X1XscXXldLQMO9ctCe3Ecnzp16hoYgmMSoenJHoFpXqBv0YiZX+4Z9tiK
	Bwa3m8foxS/JwpibQq8vPGz5Wi/0DkH37HUS0+H023FpX4IcgAxkL7zJW9OwHEIr
	AzXwJcSjUQNdfLJ0X0L7qXq8ZwnnTmljSxEOgoVvnS1JijvwWKZ+T44arqFGxQeJ
	dNI5DtIIh+ilNUCWz8NhMMw/3XLDRNFTXjWWVndWit1wjUxpDWw89QKhBMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58r1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso738826685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363692; x=1791968492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3s9eIt8PREKTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=;
        b=1fKdb9eoHKboCp7plNM1xALnGD82VHuRtC47sjJ43ltDad+NoDT7PEpydFmiuZ6Sqn
         SPMM0Ljlrf90fJOI+RuLZr68J8BnN8NCAtIFM++0dhHCtRlE9Zglh3lGSUqCYuc9k1/c
         ld06cngsV2Lf5oFI4bWKuH+ejNg1mDsXPpuK/xUKzQjBL+WffREijmbg20cYJ86RnmF4
         2Dmgzyd+hCoT3uSHp7YniYReWyLCLd3inbpF8N/W/l7nOBOcjctWn8m7BNHMw42aPxll
         +H0jZiyvW4YzwEBRonWtrwLxP05w4kCVbHtHKLyuD9MNRzLnqL8D+/5x8EBjq4KYyH9K
         t+pA==
X-Forwarded-Encrypted: i=1; AKwUvBzs30tAIlZoEH7Y+N6opcX9Hum2ZFUnioXFgekmD3SkGpcQF6ITW9mamyXnb00JrfSKpYgPtcal7Hfg0/s=@vger.kernel.org
X-Gm-Message-State: AFuF++lcfwyawoO+yC1R55qSbKKn62LS8xAoHi12RpayAhybtWeosUNf
	+dRCIfJW9A1rK4IULZ8AeyBlhTRu+sLCUSiLnBPI4dNjxQYL1tIFjo3Mz7SMHvQzgf3hr9scEz6
	QQKi5DlEG+tRac4+lb5IaukIiUq8weSzUiAO6ahUheP+J31rqtLXpjc0MmVgHk2/VIi4=
X-Gm-Gg: AYBFou0HqfeBQnJgQidr0MZiIIAgSronbj32Ko02y5y8z0n1uyquFY3CpDNxejXeYor
	ydReZpfOVs8O3xtkp2XD8zJVJw7mul9ZQO3eZhHTMcoLY065QFr26DtfAFVjLULu+MyK7pj2Omx
	saZlwEe2fpHdQbotrjsMZ/EcRPJK8vhqGGQgO0GZgYQvy9/8BEoW7Fc33QBepRAzhwaARiemQ//
	7eYC5kk/PdzRIZ45tzkFCQDU9akCRTPO0vh0cf46TdADYwXjAu23s4KchOQTcTEqTDoCUkRb0ne
	xfxHQk9N73EZ1dCS7uhtz7x1SI1qKS1ViZeP+if5lZhpyZhwDV5VIA1+5Is=
X-Received: by 2002:a05:620a:d93:b0:93e:787e:bd72 with SMTP id af79cd13be357-93e8610e5damr1003527085a.35.1791363691672;
        Wed, 07 Oct 2026 02:01:31 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:93e:787e:bd72 with SMTP id af79cd13be357-93e8610e5damr1003522685a.35.1791363691199;
        Wed, 07 Oct 2026 02:01:31 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:30 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 12/45] media: qcom: camss: formats: add pixel format lookup helpers
Date: Wed,  7 Oct 2026 12:00:08 +0300
Message-Id: <20261007090041.3732717-13-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+rMA1W+PE8Nz
 nUDu4KIBvUmfcfvUL+JDEsSZhlCLMTJ/EJxltDEdbHv8cAHES3DocL72tMCThc2QPIBid/+kF/E
 90X8JHeev7Y9Ste12NTXHhFeArvk/Gg=
X-Proofpoint-GUID: SQ1oCCa2BLVWWU8LcPMdWJkP_HRjOEp5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXyPZfX3IARK+q
 p0fvpFPWyjMJJ8yRiAL75CXIxxepm5uJruMElVFslTg4j5n1NZElQfaJNHH7IkHgfx2aDgSJMq3
 Y6xZxo/74LKHOTHQKAcfLiw65Zp6UBlY+AI6eZcmrxK9M9AqnbFo1XGtfw0LHceDu2fpX+vrIWu
 ObILL32H8ShuKHrMlrMFCaD4G47M6GlhOodFecYF61OUb7/u+ut7JwJcutMfXn6/dkN8+XCxea/
 DETpnvnW5WnAet8tl7etuE3QoCi1YivokeN4WcZm/BQIWZ5Caakma05/rJbBRDyfzhUyB2/45Pb
 N+A0gfHRfBuiD9+zIpNNpxnz5axnp1waOOWIyZzX8wuHVZgIM1pXyWYubayGLQ2n/5un9j53pV8
 Vb9MYbV1sJHa8jJ/5B5jgNjClXJVymSbMKVsilCGeB6S/Ekk4PyASVVXOa9TyqPmgmM2xf7ujuz
 sLl5/u21DqpbkFBNriQ==
X-Proofpoint-ORIG-GUID: SQ1oCCa2BLVWWU8LcPMdWJkP_HRjOEp5
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60a6c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=q9B_VXwnRp6pzYBZdsAA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add helpers to find a memory pixel format for a media bus code and to
calculate the stored depth of a V4L2 pixel format plane. IFE format and
performance setup require both lookups.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-format.c  | 31 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  3 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
index 52cb01306ee0..147287e7f033 100644
--- a/drivers/media/platform/qcom/camss/camss-format.c
+++ b/drivers/media/platform/qcom/camss/camss-format.c
@@ -12,6 +12,8 @@
 #include <linux/errno.h>
 #include <linux/lcm.h>
 
+#include <media/v4l2-common.h>
+
 #include "camss-format.h"
 
 /*
@@ -103,3 +105,32 @@ int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_forma
 
 	return -EINVAL;
 }
+
+int camss_get_pixfmt_index(u32 code, const struct camss_format_info *formats,
+			   unsigned int nformats)
+{
+	unsigned int i;
+
+	for (i = 0; i < nformats; i++) {
+		if (formats[i].code == code && formats[i].pixelformat)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+int camss_get_pixfmt_depth(u32 pixelformat, u8 plane, u8 *bits_per_pixel)
+{
+	const struct v4l2_format_info *info;
+
+	info = v4l2_format_info(pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (plane >= info->comp_planes || !info->bpp_div[plane])
+		return -EINVAL;
+
+	*bits_per_pixel = BITS_PER_BYTE * info->bpp[plane] / info->bpp_div[plane];
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
index 4f87ac8c4975..f1af2d3a2c54 100644
--- a/drivers/media/platform/qcom/camss/camss-format.h
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -59,5 +59,8 @@ unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);
 u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
 int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
 			     unsigned int nformats);
+int camss_get_pixfmt_index(u32 code, const struct camss_format_info *formats,
+			   unsigned int nformats);
+int camss_get_pixfmt_depth(u32 pixelformat, u8 plane, u8 *bits_per_pixel);
 
 #endif /* __CAMSS_FORMAT_H__ */
-- 
2.34.1

