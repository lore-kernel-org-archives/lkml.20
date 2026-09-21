Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD773CB56A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020619; cv=none; b=UqxvKdAR8VoBKwK8vuyYqQOEszgYv0M6HHYHEr4avme7XA6D0ZP6tp/VYsXEoowolT7JvoAVukUI/xW/1SFwgEfg9eP1bfQ/6Jvb2wB4rOmd928nybhrhXKj/qg0pJ4mSyKW+CIX7pB2ozFzGdpAZI+xbeQhx4M2DsgGD8+YhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020619; c=relaxed/simple;
	bh=Roy31sMJwo3Ko3MDEcjACSn1XbPJH12e8tiFWo1kqQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWT0C8DMMVNjJJ13RJ8gnL9VcnFhY/+VTtaWptSqJlSzKJScx7Ry18EVmOQ4ePBYHez3JMN0Yuy2FrIiEZIDFM/JV+4B+bz7HrUXh26gO0zfAipp3cySt6VtdSMrRDqYMCNH5KZ8QDeJgQYvWB3YwuZabzdUeHXr/8bFJI8LiD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCgzzJpi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5HxOM5z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCgzzJpi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5HxOM5z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAptB2012957
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wnEitZEgXeT
	HWZeFwNChA7mGPM1R5Nau7TnsJLOoVhA=; b=JCgzzJpiTaH7UR5BW2jlT7da385
	Rp418DHcefbRaZ0QTlLHUmR2aT90MI6+ASLyr+aKS2POJh1zbM5KnVN/igLl3te3
	PeLnQQzubfn3cCkIBcZUs5NqaTK+zmE4LYf8Lp6Rvv6hO/n2m0FVSo4N8Tg5YgXG
	tFdEB6hYssDKdzeZSEYngkI5rPS7LDExVL2q6GBnRwXpNStM+OAymIOXL/0eQzSJ
	awkxV/ucO/f1pt/JibtiflljiK7jh7b01cA4tVel7Gvcq9lMcFm14LF+BWZsQ6zr
	LWgHHIfzBGjKECm0NzVSLMNweUtcczio507NFV0XPgdPU6PSiYDSiXS2J3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d33tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:56:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so5038872a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790020613; x=1790625413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnEitZEgXeTHWZeFwNChA7mGPM1R5Nau7TnsJLOoVhA=;
        b=D5HxOM5zzqCAFsVuPe7wp0wYcJra9agLL1r8YfE90Cm7ZQbcEIcvQn2D82xf1lxX1R
         Ublyg/voopfugNM5OXC8fFcfeUiIiW7chnoQNIu62dDQ6F7yNDzItbNuCPWlcU/xQGin
         dBb6Jcn5PGpXxQjOE0MxHfWifmVfgWu9f2eDeviJ2Xo8pEvug+r/e8lkBRzZrsiRb7IJ
         k93Cv8z1+PgIr6MdjpnpTYc32zF0PNrVzMd7cgigX7Sj+v/MqDmuPBFTiyLQ5KZH8O3c
         oiIjxB9yui4Ys9fHGBKi/5Y5dwexbpdBpy51HWyMrPgzG0VsHxY34LWTq+Ov4m1NL08m
         L5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020613; x=1790625413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wnEitZEgXeTHWZeFwNChA7mGPM1R5Nau7TnsJLOoVhA=;
        b=q4EhwLBCGqpCsjK16AyQpW/9pvY6PHvmHzjr3Gv/PwXEpdtPpZQO64S6VvYrpWofoI
         N2lg+ilvX0VRQjC+G1vZQ75aPdvSWug8HMu+L98zRo+ylvKsTgfL4HQ3o1k8AG0rqDZq
         YLu/jg4GH79HcUgT1yzKpX98vvKQhsUaQ1lWaBDw8N1EE4Ot1MOl3PiYFQAH86vBpJPa
         0OW4Iu+vdb1kYzgpgPZH8TvdoGeCgtMjz+sRsHbps8JfdunQVIjC/+sBonQkG6i3/9cU
         30OFlUtXRXH/o1d8DZNlPdZZi5SRZxCaYDvdjXWdVGvYl+tmKoXuy4U8Nh2H+UNBRJAy
         3mGg==
X-Forwarded-Encrypted: i=1; AKwUvBzlfSaM9FsjGFkdTQbpq4petfahEbqei6dXmYbTk1uwd5MzzoS6UCZJxKRFnfYCVzmyMzQ3UrL7g6hd9JE=@vger.kernel.org
X-Gm-Message-State: AFuF++mIspo4HJk83JW0eQALFR4pCGCVrkXbUlgLHkkVxqjdHgkbovKJ
	MccIEgry0TtZHQsbVHkg4iS8aV3ucDWRxnU7dezRNhdz/lQyOrcRQEsoSYvScZulSSDG+vX2WO7
	g/GNphu5p0xDhFalSA4FSTVAoRyRnJWs+IvWc68IPi0f0B44+bsZ9jPu1VVWMorNxzUs=
X-Gm-Gg: AYBFou0GxAkkjcacairvgJwtMfvjrZRSq1w+eDlZpKsAxzZmf+SiBxN/w2OAI6z8+Xb
	8u0gFuhSRpHTFoIV59imdhVvJWujlWlqiIKC/4eHMBFP2DpQVgL5wcttU3UF8/JlzyUjNk+Q5id
	nCq9bk+NdtXluDf95jz+qzzIWqZqeri4cdvWGDSG/Bc4mKYQPRTedtVSQLS/LoIuJ6u/4Dn6vNY
	4X9cIeqwYMe/UyfOlpF+yqeC2rnFW0lsOcPINWzWJfK0ilvd5b0CK4s34d5bV2ZMFn1YkT+0FIK
	aaZ3zTZ8INE2Pz4UtkC+0WacpIyB7VyE+byPTgert3pJO6vlzMsXKmVcxMUjplHas88ou6rEeWG
	lHRl8YWqyUcmAen0lPjVNeNwgwg==
X-Received: by 2002:a05:6a21:b8b:b0:3d0:57c3:65f4 with SMTP id adf61e73a8af0-3dd8c3fd704mr19717855637.5.1790020613218;
        Mon, 21 Sep 2026 12:56:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:b8b:b0:3d0:57c3:65f4 with SMTP id adf61e73a8af0-3dd8c3fd704mr19717821637.5.1790020612572;
        Mon, 21 Sep 2026 12:56:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec4e584sm241142eec.27.2026.09.21.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:56:52 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] firmware: qcom_scm: align PAS resource table retry
Date: Tue, 22 Sep 2026 01:26:36 +0530
Message-ID: <20260921195636.1925869-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: veUqrbGiQW9PUGhvwwjhUFNmI6biF55n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI5MSBTYWx0ZWRfX/klNZQYaZroj
 8U2gbpOSUUmKcRKSUuR2mcP/AamjaLiHaflHpT4Ydm/MqYuO2QL2fOCWU91fB1wfxaGTULNENDF
 isEQ19ql0fzzEtyXANOPc3KC9yDBLKg=
X-Proofpoint-GUID: veUqrbGiQW9PUGhvwwjhUFNmI6biF55n
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab18c06 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=deqSMNsBuPGoyFQvSwsA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI5MSBTYWx0ZWRfX1MnXyxXdMDK5
 75/KpBGQuu7x0Wv18o3fNO39lxVQp1E+QrJR8edNwElIQSAAHi/38uqOd+a1h8osLioSFFvgA9E
 UbHmnTxztOqBxaI+6pnq6mZbnBU/EgmN88g3GAbMQtejCbpeIunc77FMkHJyen91rsWe3C+eSNj
 CFNZgJJbFhc/QO+1a55BetX2peBOjA1wY4jgMQSE4a/tHYnZOSKdb3VpIy/8IUIHrenOy04M3ab
 Qfic6FFHQxZG2XL1RdrDF9Hbu7tuDsEavtX/MoZ1Fv12QXoN0EWUOUmbHVxZfUiRAmMi2hD16xh
 7jeFAF1mqJetraQlCydKb0xLF9lKpehYql0AU6OQjUPRfxFk+PTkTxdf1LmLNRabUFMTW7K0sYJ
 X365VZ6wYUeYc+kMrWhwPgmxjvctdw9BSbrYb08LqjQBgHdwTXouJ6RsiLDk4dAUThXbwRaLjZW
 7n2UpbUM9ivr9Y16Xwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210291

The initial PAS resource-table buffer can be too small. TrustZone
returns the required size and the wrapper retries the SCM call.
Although qcom_tzmem_alloc() aligns the allocated buffer,
the size passed to TrustZone remained unaligned.

Align the retry size to a page boundary so that both the buffer
and its advertised size satisfy the PAS/TrustZone contract.

Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - New change.

 drivers/firmware/qcom/qcom_scm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index b5959f833dd7..f4442a70e614 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -812,12 +812,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
 						     input_rt_tzm,
 						     input_rt_size, &size);
-	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
-		/* Try again with the size requested by the TZ */
+	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW) {
+		/* Try again with a page-aligned size requested by the TZ. */
+		size = PAGE_ALIGN(size);
 		output_rt_tzm = __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
 							     input_rt_tzm,
 							     input_rt_size,
 							     &size);
+	}
 	if (IS_ERR(output_rt_tzm)) {
 		ret = PTR_ERR(output_rt_tzm);
 		goto free_input_rt;
-- 
2.55.0

