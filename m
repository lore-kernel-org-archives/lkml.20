Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51502931EE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381835; cv=none; b=V+kwkBe0dOpg9AMzvP2LeL6P0ZnisvAEnOk0RWOij1+tAZWDGfbj5dufaqplrCp6xjzTQs1A+eHnvMXo9dBeraOrdHfzyopb1lpNDfmI78RDwwIsbJkl+xSvoKmWp/UowfWEw1YM4J4XKg5mYAG58QfMtis5ZvB9mvMBYbQL9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381835; c=relaxed/simple;
	bh=f6q8FoltjlovTDu1+uHniIV9mJzmkVGNfZOq0t3Zo08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZivc++HdwLdKSwU/xqeJzTR2n02NBVb4GjO4xtgOwHSMotZZdXPbmWgHEU85arANWM9C3b7TfkfOig7To9Jm6fJffPybZZas6pvNTjWzEf/PMynBLSmskJItU5949v2t2ZQc7S3W6I7Uanx1s9essUXH8ooOkegMgnK3jaXqmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et5DBHyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUcQmWh6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et5DBHyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUcQmWh6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHJPS2418015
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BwimQj+9cTD
	SXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=; b=Et5DBHyRvF/r8A40pKXkCpcvi7n
	pc+ccSgQslut7Y7/Z9dBtUxnzI7V+eraO6a/SrKznn6+5Gr7J8IxWoL+1hIbiSBS
	w+PAStqgrsc28jy0CWzwcqgvVmzfDDA59z4FnHCUBeurhHu/53Ns1JDNj4QTqM8d
	W7K7PRxdbGbdd12/CKoYw2UDxmRwi2/eE6AX90Ttb5YLKudEbuh48xFgOd7e6RuT
	LU/ue2gJBVAvyzp52enSIIwDSFnra3E5x3IeIYcg8cMVP2KKPuwu2o/EqVKQRAxD
	PWCOoxMIB4X+ufB5wmwktevgN8xGjYAeu9Tnd2FD2oiD5/mYNWZFmyh79HA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdshfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:43:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d63bad3d09so25880845ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381827; x=1788986627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwimQj+9cTDSXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=;
        b=IUcQmWh6PkZ1fU2o8LiWY7O+8WlNmG2q6NUFEGZjVQwun04eC+hYzOGIWIuGqkwt8q
         4OWOQN/MmO1fsnP7LDKRLrXO0tm4CmYwftCezANz3TwXRgqUPjzc25+1EjUhQHZI+5/P
         406zHDFy5EP65np1wupuHYjX8kZTn9K7Vz5K3V1+L2YWgQ5wYOQFLcor1eAwp5P6Up0B
         urPfYpBNnHPmToSVssMRU6pO7eY2FrfBzFAYwgS0f8Evgf3sCjUzMuc8KftKnum+Wx/m
         yMXwswn/qX6QZMZAH5wWq4HwrMliyp84Wf/HFoQjrYfaxe53yjKO84sjpRyyy+oZj3iY
         uzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381827; x=1788986627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwimQj+9cTDSXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=;
        b=p7Bujf/2V4c87+p8Z2NusEWO6TpslssLUL7CtSk5IeM3m6vR/s8yLf8NaIzl5zEEEw
         f1LQDzOJ2Osbq9EAxOGSpJPP0CaSAD+b4A5Jt3cE+WvfbmPLA+EZU0bOF/oLmd9lz9Fx
         /weYsVcrDDCzHPxfWEVbREufqxFa00wVl8be/lVqZWVb0SzARBBIC3DhCn0vxA8ggM73
         q/mdCgd4pRHQUmQnHwhLwDD767aFqQ+446nqTNm6/JFZiLHGYJO5wuAYXaPIF1P/RHCo
         gRep5i2LOHfFYqt6G/A81DrfQfSCYbm38sgTJadysoICoGL7G2xkaX3e1aJoggUrg9zP
         0kVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx24xGAvr1y8k0MOJmiyUD52VMJCuMl0d0np7x2AigaUQxMp7NIIpx8dxeywYCA7oXCw8L3m9UNDtMPsPk=@vger.kernel.org
X-Gm-Message-State: AFuF++mWOAWvlEinxybwTRMJXG/Y7QWw2xBn+RAVLwdc9kYW0CGaRdeE
	F6hQo12Z+qXP9eJuniS5x/pscVGA1OCN+bjYJakrV7BMDXWS817wqBBnVD7z13iCW8DykNq6/Nk
	J13y7TGkdNTjyGIx5YAU5hsj/hVO8fmudSki9irMHB5SIVeCG2rbsQWBLI8MHK9BGLvM=
X-Gm-Gg: AYBFou2umWbO584czNloO2KbO3OrfwTDOweeJwCJiRS9PVljuvQFU1kKFW4EAzcPYJc
	SUnvQliC9lvXBKVbwECdbJ2PngRsL3BHS1+yiWIY0BZSu4eL+k4iXDdlmodpctKkieJ0Z4aSXSY
	gkC3om/vkehoELlPVu4Rfl1exjlsOsY+771UbW0OQ1DsiiqB8EFHekMBcDN+hldazyL5rV8mYlL
	WrvfXK7B3ZiyZrx6n4RM6PhXoMAoelNCvbkW67YuQc3SxA+Y8uExnd98Pvo0DLdue/ox9SztndR
	YrF0tz2cp2s8q+AAks+lav39l5g88lkz7IMq0uuzR7Wp0VWK9uQLA3e5TVfN7zeRlLE123uYi2b
	etRBYKHEYBaKTh9zi7wztk/cJl9s=
X-Received: by 2002:a17:902:da87:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2daec6f6b81mr93347555ad.11.1788381827418;
        Wed, 02 Sep 2026 13:43:47 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2daec6f6b81mr93347075ad.11.1788381826893;
        Wed, 02 Sep 2026 13:43:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate dev_pm_genpd_set_performance_state() errors
Date: Thu,  3 Sep 2026 02:13:32 +0530
Message-ID: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a988a84 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=l42t8P_hCmqpnny7Gc0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 2-G5bYCIhPqhMleLqlgvbXww8DtMJwvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX1JcikTe+sJs+
 6+IWho4FMmugy7zzMxs/1StEDb2NWBN1Crluw9Jf1OlzK4j2uIR0Oc3+jOSPu7H/oTovW4lXPb/
 KtVNmcAhqXMJmzHpocI7ytnt1LVQt0C5WqUX6iW5d1N9MEixrABaHWeZvK+DHO0sT7iBHqbH8A7
 +XZbpf83fpDmqRzNuNemdHWxKpPa68jj775vKzW/AlB+HaUKGl6mW4ZNS2dn4fmr8nYlXsSsz2m
 SA5z8GSCvNIQ6CqwcUQwR4c9xGl9j+fed3t8dbw7INknNC464fyeNEtYCY9dyE51/7yoZAHhWp1
 B6YTBux+vjxi8D97MNXvQNzfMdNU3bKlWIRGIHM8Vlah0pN/e5j8oWjuV4AtTEEqTeuESQQSAxy
 JoWmu4aX0Dvti859/e3VmE87Z5HBdDeY0p+aXJPUUdad9rRW3tp+wFvTP2LoBNcxS7jqjVMlwzM
 pcIrn81XhV9IE64COEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfXzvlVfWT+WPlA
 bLBdUX4Ww8u7PcZ0gOJRe6ryHjoDFhPwRvFOTOFkNBRsMcHz56I5IjlvBpK9m7HC5XPJVYYvDbF
 vXUSQBbrdaBxixSY6LhvcEVMxrWxj2E=
X-Proofpoint-ORIG-GUID: 2-G5bYCIhPqhMleLqlgvbXww8DtMJwvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020183

The proxy power domain enable path discards the return value of
dev_pm_genpd_set_performance_state(), masking failures silently.
When the call fails the performance state is not applied, yet
firmware load proceeds without any indication of the problem.

Capture the return value and emit a warning on failure. Firmware
load continues regardless a performance state failure is non-fatal
but the warning provides a visible signal for debugging.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..01dc0194e130 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		if (ret)
+			dev_warn(pas->dev,
+				 "failed to set proxy PD %d state %u: %d\n",
+				 i, INT_MAX, ret);
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
-- 
2.55.0

