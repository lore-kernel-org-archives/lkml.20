Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007374;
	b=rB613vfztkW8z/b26/OgLvVDBGEw+djQlRQN6cmIDhrylYsTj7LT7m4bdboPMTaIsQzT
	 /MUW3jqYX7uldDN0YKe2dVLVtLEALdYbwjpepw9RjsjcZL1YHpcdT9XveYDY5JCphkPSP
	 9Nw6yFoJ/udNKWeaVL+2x1jwUC9h9ZGQMrUvR31NPLMFNg9sTno26wtNt7JpiJpws1Ju0
	 dykyRbHA5GL84PZjca9PfWd48r8sv/BebXll1bW4fKn5WGZcfxUNRSJp68vzD0HSYLNlS
	 IeY9Rk3trLzIA1jPJQqBLa/6DOqqr/FUMVCE7m2xVz/WYXFlu2UUZn7NxZRTYPhJKkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
	b=SwSoW4Yhk5/8CX8h6kLYJRu60cr/fxTjqH4wNs4lPrI4ah2Ah553YLvY0Z4InAWK+Ju4
	 3YFb1DogCS1Ai3j8XdogCHCV+vgss0aXlolAhYfTCnJDgM6tkCG/z3ExLKQoQt0iw4yMr
	 338jK3GA55+xwjoGq7UsUvigLy6aw0iXJASWoc+Ow0G9ogHU0iwDjP3M6xTqJhm7EjjVJ
	 NJLdYb+q1JbDO+9/dGboF76ChM6kriVuSGtvYrZzbmovbdar087hc7RO+MLMRWP7h8usf
	 NWvhDuT05Vk7aonol6UYSoPcV/7llwffyV9UYjDE8sHRG1TOO5M9bBdS/WJ0haEHEsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdnvFZ5N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8TrjHhT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A1606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938A1606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdnvFZ5N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8TrjHhT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mnx761063816
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfoXwA9UTdo
	ZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=; b=pdnvFZ5NNh5JpRIbkvzKkmuRAF1
	5dWEByr97pusP8voRwwuJ8oTU47S6O9wCGV9dAYqR1lGVFr9k0sKh5C+/RoSbmec
	+ZvEOCNJhvQUO7wZrI3e99t9YO4fixPO41EP+l56+SkPMUGuUSRGkmv+mYyvxn3C
	0lbvITCUswoKqpO+DHRxEzwdNe1+NofcjGHS+ENjHuEOcZv3MuCebtByCmE3bBDa
	geq7o7i9XkUlu/KfuyIcjNDJDowlqciKNbOeNRhumCGcOdF+wJUnIOiFpn6u3Pqa
	u77afprU3oQBukkN9mhFg/CMnhLVGhnmtRdazH0kSla5BouWOTMIrmeXugA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv0rb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so718037a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007372; x=1794612172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=W8TrjHhTP8U+nitBoApHGM66EyJYcPNGycfRBw9wHuWOs0Cf+Nz+qHp72ekg2oBOOP
         N2blE4VhaC2igg5yaXYzln47egZrUss+kVmnq0qEN9nddSZvxx6EbckseZRxtIiDTE5v
         QmsZvaWtKlbZjGfuwpo+4xOlagnhuRZw8fIy0xVWhITJZd5lx7nBiBhw1sSTTQ3yfZL9
         qtYR4eSHFxhzDCQp8qOe5QIgo2G7KftAAeuN5Pd4A1RtOc4q+T8XgwOD6cdL1lPleswQ
         bqq0kVhLXpYTjqc0Us3kmkFx+MRJBR5WnPS5+36uwInG9iKXYKQI0kT3G+3aS963KlgM
         tMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007372; x=1794612172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfoXwA9UTdoZzNFdOqsicYhSJ5ry/Efkki2NBM8m1i8=;
        b=1M3E+m6oi2Xl2mhg0Yg1wJ3awr6JsHu7Rq8n1NP4I6+vI1xO2aBa06rgQpP1PktvTg
         RAHvXUilAXzLSvwHq3NJSqwWlvPUuuy4O0m0exIb5RMqVDZG5coKG95kTTM79MaEleOk
         G/HJ5foEbHJftj9r6QdhG1FitEjgweP4WITf/PVoXxXsPH3s7GkJUbdiaO69Iz3/2WmM
         zYVoH0hB5HR4eYfXqFRcBnL59uON00AHzll6ZvuKdvkURgLc/20HpH3s8Bheo4iJabJr
         xsvOCWTO2tUr635pXaw++81eECm09fL8ZFmL0Tu242EcfmxiPtFcTxnTkNz8VAIMo9lG
         nVmg==
X-Forwarded-Encrypted: i=1; AKwUvBwkvqYEinJjCThjE8fTStlDxpc3Y9wAQdicxd945An8tf5w9K24aBx33x0NeSr3rLQHL3x4lIaglBJD+q0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pjcqzm20dXfWjQtDhS6OR8KtvssHh2GtHu/t/5AocEWt0mAss
	OPIH4Da/UMBlaqLxKLFL33EbajUoSu4e9oNQ+NMH0etJa1IU1Z4U/Kq9X8XA8f9+mYIp+PWQxiM
	3HuJtC1Y4iaTQiUMdDj8xf59lvTvLSmdzDc3Put1/zh2LcdpFVjADYh2DJU9FA8d+1pI=
X-Gm-Gg: AYBFou0mzyj8Y84sPKKUz56xGenVWdw1jptbt663ekNFpb/i1imW+92tgSKg4jBPbN0
	cTfragLOdmzx1rm4edEgjk7fJbpeepDi3in3iFBND1P/lLsedxjtbooo+2CNgfQCqb11bXz9vuT
	0x/m8dHLpnt1vkN+UHtOrWZvvO1uIGjm4KR+LQzp46mTjyuuU+ja05AYVLjRE5yGfOQVfWROO8d
	9E2lBxg5kAPMdabl6IPge6vYsTjksIAVBUWjsF6JmkpX46veTosKWizw6BWhzohlACOE7SWC++X
	qrCN+Sv8KeNOQ3JN57IqMpktljY1yl2lDyUI1JMAX0eQ91ER+BvTImX6bzgLY0jzf9vhNa0pVg+
	bVyO15PMZIaPQjy1yzOyykNr2hBcyToVmA7xUh6SYz/8mMkQwrVFJVoDvYezPayaIIpMFJfgd0v
	bJYHZQU1cJT3hYfHA7f1nvadwtwCY7evTfyHzaSeIVdOPLvO2z0/xToNvxb13wew==
X-Received: by 2002:a05:6a20:938a:b0:3e2:100b:1043 with SMTP id adf61e73a8af0-3ebb2a24b25mr3767375637.42.1794007372304;
        Fri, 06 Nov 2026 15:22:52 -0800 (PST)
X-Received: by 2002:a05:6a20:938a:b0:3e2:100b:1043 with SMTP id adf61e73a8af0-3ebb2a24b25mr3767342637.42.1794007371878;
        Fri, 06 Nov 2026 15:22:51 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dc9156sm1003773b3a.36.2026.11.06.15.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:51 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 09/15] drm/msm/adreno: add temporary __maybe_unused
Date: Fri,  6 Nov 2026 15:21:01 -0800
Message-ID: <20261106232220.47602-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ess84bibPuIDiIc_nxKgbXGByu_EF-HV
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee614d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5VHPQfPT90DSkkNPp7MA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX1+NipR0k5IpI
 lbOA7UqXmn/VxR7F8ZdCip4JwVY8nlCyTXZYLeowQ8DumdbmPD8MAJF99r5RfTDXwbWJyTGZazj
 dqPX9vg/C9FrnnQDoWEsyqzwfvJKPHI=
X-Proofpoint-GUID: ess84bibPuIDiIc_nxKgbXGByu_EF-HV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX6EHM558LqS6k
 cMr2zyFTggIhNCxppt3jgseoV20mLXzkcIheEaVEAM1Phq5OLkaITb0V2wAfB/GCLgA1nIpuxh7
 RBySbYDqyQp7Njyjlv8j/mFXFq9SoSbwxtCuG3LqtOaUcn6C+Ak0KFg8RHgyG4WKWkj80kitMMi
 S+kZOhbH1khF+qXM4LskYtsLH5J95u2WvKgKz/Gswd+ndikcvMg5zvMQmYYrHxvtbR+MjoEC1Y+
 BZ2BFU+BpkhFKAVE566fOx3/XyZadCHyrQpGANOO3genz/Ui5h9FSZpZNMNzYyvkWL8FVX8YF9/
 JPn9jannF9pVZl7rWn6xPWn4X7m5MV567a9/jEnqa/8HUjKR+elbP7vjgvcsHhqdswovDTH4ogq
 6XzrukRX4GZhY8BfPmyI9vs8tH9CI+zScNOIx2+FqDwZhPsJJts/LzrFlLmxP21HETfGiHhCCOG
 5Wjcq1UMKIKY84UJ67w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9e0d37ec9c15..2408adfeeb23 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

