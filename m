Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D306397AFF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326476; cv=none; b=phKYceIO7lbFJI8/LRgmVu7wMGMjqwi9XmeIlvcicbdHuJWuEm4nWSO1HjiG/CtyAi0Z+rRO8xrSImG1tmyu6C0eFAdryHFk8nbPURn1Df53365FMN6GK18AM18ONSC+zMbJtnv5ix8rFOwFLt/BJt/fAwpa8uaXTtmz/hQFevE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326476; c=relaxed/simple;
	bh=T8GaM/DWCcTwfgaKLNVN9FohEqx9SJOxt4Sb3BkyXS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jKjVu4fObPTxZ8joOmDDXb6ng7lJ7t5qhKxJHBVvYo+pFbGd7MoucPkGwMbYKMf3p9xh7sfWiYQp+AUhoG+dL0npZAri6o2NFjmZlAHIpOHWIe0ZIl9yaMR+PvQPewhSnHzISjZ95+YohbS6hwbZYvSft3AnUGkqrkMbbDi/iHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAhgj1fE reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAhgj1fE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeNvN1899642
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3s9eIt8PRE
	KTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=; b=nAhgj1fEHyGwT9gekjIC9W77i7q
	Hos4Dvcn3GJ0z3+M+KsdxPzyKOwxTJmD26SfMkpsupHDfRvqtWftWlvYlASeYFVk
	CpKWa8rzQp9XMecuOlIV2sE6BEV38beXLW+JZSvqnud/b1cz6MLFkL4/JgfUepQB
	gHRh+Zvxa6ZQg8ENgA5VfohzLQWyElRMz1QJdElmdfwsVYidh6GBHiuXld7ft/SO
	7KlpKQ6ruR/fNMcOpPF57LIiXEfx6IiLHBxUIdAfEa2HsZ3zMupDFK2QZrtynNA9
	uAJ4l/C37f/RL3RMmSXjIYqKZ02AWj0Zk7emp9+2JBdpwQc7CZK5PhQ/ohA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uhn0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso574183385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326449; x=1791931249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3s9eIt8PREKTbC0XLz27Q7AE0rMoVpZ0L/j9AKbvXg=;
        b=euuAv2Imf+hwrtkCX/lM4CSnPixB+5S/a/3BJQ6P44XeYIeEOGjH3o8Oy2qbWMgjN0
         qMLMxQM+UMbxUOxpPRKDiycjpWZLwKRPTovhy3cRnAW74uxx8E1RApx5+oPoGPI3kYA5
         u+FPBlXa6t/T6qzt9dGFuggnO5l9oI+ZWxmUYfM0gQg9nzc0X6smP/4KeZzxREYrGyIp
         4+lCV49pLVZFQiPmDzohZjwndZh8AD0JVq4PLwQSfAW6qAAC+zecmDO3yPFwOVkx1PIA
         0SbVcuEkP1AJXyg9ZGFkViMVMxX7Np4nD+L8Jbkriz7TAGi8k15O5o/wW+3uvelckRCw
         VTcA==
X-Forwarded-Encrypted: i=1; AKwUvBwWkmKfp69etySLMSVUx1F3aPzhU4sMJI0u9mo9Rm9pExBcPiGCAu0Mkk5up6I1V5LI1ePDbBz39ncD5TQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lRi+KXYCjlIOG3IeYcnRIK90ZDD0mjeBV1NRkBIveHg9SRmqKf
	gs4z234uMriasP08U35oH7G48uboR3ze4u5ALc6fp1XHrVOWx8bvZYy0ZseM4FwaVeKbnpUPk5X
	L7Euag+eG7bD29NeHs8xNt658s/9Dlv7m4/9BrcROrCZ7USGWL1wBu6MQeDoXwotRbhk=
X-Gm-Gg: AYBFou1Owzvma9ttnKkEyC/NZLvPq+gMUpCjazwZSTgFLhu116ieX1Gjk6ABr+syosW
	2QCekU7gCYsWG/b+CeIyHEhEw170IhuZ+OTNB6BfNmZ9qGgwTNzvh8ANnh2ddB4wZTQwA9estBo
	R5qKN22kq43eTgTetXhmeLOtYX7+/0OUo+IYZ49myJ3BIN7e0b5JWQTraMoV35fLcN0gWJwde8y
	I3rVjzmeNKZejXw2TE5XyIZC6wLSgwWBbCG1+CEGILqYT9JL/bGm1gzHil4dMn8kw0fHM8QTvBM
	Xzuz4fBHCbOJnwM4dEeanFfNAXhraPHcMp1avMy06u33ErDJ8FPhYfE+Ja8=
X-Received: by 2002:a05:620a:8801:b0:93e:9809:dbfc with SMTP id af79cd13be357-93e9b8ee68dmr74952185a.79.1791326449172;
        Tue, 06 Oct 2026 15:40:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8801:b0:93e:9809:dbfc with SMTP id af79cd13be357-93e9b8ee68dmr74947285a.79.1791326448708;
        Tue, 06 Oct 2026 15:40:48 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:47 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 14/45] media: qcom: camss: formats: add pixel format lookup helpers
Date: Wed,  7 Oct 2026 01:39:22 +0300
Message-Id: <20261006223953.3382273-15-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nd4rA565ODsjH1lS4iEcWNr38JjGLAL_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX2RAWr6z4Fttb
 5DSaFkCH5ank1HZpXf5JvBhY2DszxK05OW/T1dNCsBn8M/ohYdE2gl9mcx38YHesN7gg95PYtLM
 DxVgF0OnUNxCHoyfjz7TO+Y6CQvcciM=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac578f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=q9B_VXwnRp6pzYBZdsAA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3sp1zZRBwCtK
 kvf4wfNfXJJjZo/9Tm7I69K7R7sSy7VUjaTT2h7ut4et5OgdwwQOUchNn1eUplqRbOrkTCrhLBl
 Smgi4WHFrNMKgXLg5jkjlDe0fZV97HL/T3QarIjjK4MxpMIuVLG29EW3Uwv7P77PZxwKNZ+/1Qz
 c28cv48rRs65l5K35gg6LvltWjMdohvi70YF7fZiQOUNT+Nbs+Y0SPgS1Uv069mVt6a8gWN+E0F
 CWZFyVQShwXS3mbQmuvMV8BPp+aFrlyoCrBqnzwAObeIOMSmktsn1lN4hps/dc6KKWQrolV3qVd
 wkU461ZKEfPE5m6S6R2aq3BndkKe9YPi5t5e41B1GqQNQ6epR8wC4Ck/AQxXyLw03cZxqEVWIma
 nHmNVZM+WN77GrFvj+pqtYZ23TSMrZgJwsmgivesrgAqWIAaj4S3kLxPCZqP/qDSVcb/OJYvXJW
 z1vL+B9V6cBPp5RiOZA==
X-Proofpoint-ORIG-GUID: Nd4rA565ODsjH1lS4iEcWNr38JjGLAL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

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

