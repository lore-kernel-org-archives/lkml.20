Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685A3B0AF3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378007; cv=none; b=LVMin3+iPST/TKXyepANxUiV39zfWYzluom7etgZ9gygKibB8szZ3tFvqi3P9BtOnRdPeBE8GbtF4TyI3lKrc62Zltz5QSVscZ/AakqyiBcP8JsVZhLBQxDg3wIfvYBddtQ7TwlRVRRBqzQsrSwhcjIJohbPqskSJklb9F05C58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378007; c=relaxed/simple;
	bh=eWEnh3sITCDLcXnpg5vDD53TJlmRpLxQxP0NJ4pSGJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELKKrEXY76JA8TK+/5KaTCWN13jCe88N7uiJWKUHUFR3GoZC1H4LEBj1oKr2pYZp3BpYnsSXebL/0Xe01M2g9YEJp6wt592qSAniszV/4faWpe3Ht6snJMtVEcA6v12t7DYHh7evs0Eo/vbcz2xdGLIu5xNmgKkG31fSGWBRJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGHu3lrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an5c1u2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGHu3lrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an5c1u2G"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrZF62483918
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XNQxEG3zzxofyaZfwBRiQvttvPUbCdqoUXf
	aSnqUlIU=; b=aGHu3lrI0giv7SYC6vttPxcfRcE/O5LDlFlrO7br2dCh15SRE+N
	ya4PTT5DXANIhR20nKJTiWzaywSVtwgFQhP1zb9kB1xHA0gsLMe4aNM04MLlQTGR
	RnCErdZjd5qgp+ykTn/nhpJ8BTZ528FaXSqnJOgCYBQQOdDhCdQOCwntigwseU+j
	lzdgMfBEVW9yJUAhUmyvngN6hebNvMruBdmKy25lfbWDDlQabYwEph0Fh27nKeQ/
	M7Gl0map4BYcJCw+8vh89RjAxIB6N45jHYrE/mxCjRQOa0SGDx6X2eARGk732WyK
	WMoxhtfqqOgQaPj2ViZAS5GFMUYt3jGjOlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9kk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:39:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2551292a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377996; x=1788982796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNQxEG3zzxofyaZfwBRiQvttvPUbCdqoUXfaSnqUlIU=;
        b=an5c1u2Gr9XM3tsYjtQ2wonJWy6fPvcSfDyB69BzeHBC3jrFmXMbJbnd+yPp2/MiBB
         ifUJuOEI9jy8S7GPJnWP+7PzQibp9GOkBlSPU66iRKBlaxsKKhWFck+QqVhaUCEPXXuw
         tLGqocjZ2KlOG7xvsd4le4dUIpw9n+heZTl4vSXscp9d0utTdmhimPnQdaS/0DtDl0g1
         MSJIZ9jrAcTLJuqxFQC33oLDNKC08BuA+6qdRTFIJ3IEmphvCBRyfbVeesaEzei8mNSF
         0xKfh+Z1aofVlX+QpUuCxOcsLM4JiMgkXNd/hweznsRsrFPt6PeNfH5S6x6xX88MalgP
         6SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377996; x=1788982796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNQxEG3zzxofyaZfwBRiQvttvPUbCdqoUXfaSnqUlIU=;
        b=QRICt6ENiNlZY81MQYMG0vVjNScGmzSC5GjQm2ncvEheK/6IChnirv0FLV6fHGmGUP
         mwO8tbPsg/CpfdBfC50sH5kAZS2vXXZRpNuZYZXWhIdxx7LvZmpDFx5Ci3cFFwnq1JoI
         FNqGs/II4/y4JnJC+Cr5AreId8mtlge1tny+YtnACYCgZvXJNYFrzxDJWU+si/bKxRLI
         0PoXAEkVqTlViqfrg+Xghr6mkygrL8RxPUW3rXJVStAsay2SQ0zfnEeVq7bSzp9FVskN
         fvmKAAEw/N7n9H9dnt7Ld7m+ySqiUOlwADG7ivaFyTIxz3oPqHfs67bD5kugCrnVRKH6
         h+dg==
X-Forwarded-Encrypted: i=1; AKwUvBwNlBCE0d4d3pKvAvrfBKpFqIMVts1OdRqJTthBKxgY21fnS7+GiO8xYEceMDDeCqujzb3o60ZeSxzwJT4=@vger.kernel.org
X-Gm-Message-State: AFuF++mHQbmWZxMsbmDhR/4upwErkI1FDz1+/Ew5y/V2ZCKBZ7c7qWaa
	p61VLxmKZ8Q/n29uCglsQLCjgeUxqOVpuM+sLxMZtxR4u4Tg0TADgw4X1GsBNA1B3vMXnCj5E2l
	QDC3hjOorsCZcLYoMPgnCxJGoSJvnQbpGYwpSgLdLmlTaN4wX+rRMjJbCYaagfuladMA=
X-Gm-Gg: AYBFou0b6pem6OzQN9jtDEQpBE8BT8jdKe6ocjGJij8vg9PUinYe20XxKm+et9PLtDg
	3dOcQdsLMn7tvK/r3wQpNu57QL8pNIKUYv/gmtlFgfz2C3eTLBl98KS+1Ert+VcsoggQtSISjD2
	OIPO+l+YA4zpjLNTy/G5dEpJw70ubhy4a8gwMHLQZ/QnJqRndRbt3tYeeIbo6khd95TNLJ8pR1d
	0/eBS7MBKszWe0fROPa6pGhy1Rt/dBIv7cmb3csqa6vKDLYEbnsGAYUKOCPJUoA8xKKrfBpk4MO
	JwWr8o8UMbMJ04HWlmHynO0BrLhFCPIZgavM201HDpRot7vcpXvvIma0Gx2RY/hqLHPU47Cx9T/
	LybDL/yWbUDPEbc1uwwcgBuQArDQ=
X-Received: by 2002:a17:90b:498c:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39aedce7b13mr11371137a91.0.1788377995601;
        Wed, 02 Sep 2026 12:39:55 -0700 (PDT)
X-Received: by 2002:a17:90b:498c:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39aedce7b13mr11371067a91.0.1788377994879;
        Wed, 02 Sep 2026 12:39:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm556005eec.0.2026.09.02.12.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:39:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:09:48 +0530
Message-ID: <20260902193948.1999595-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 32mp1BENbJVHJ4BmxNqjmIUlINPNXGXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX1A7bYUN66JH5
 y9BUo7pjKG2vjB4ZHmytQ9VkyEa+MpOKfmzPiSWcAwqcLaLRlZfyxPpeNZUIPrixouH09PfqI/c
 xHP4GeZqxWGvSqhxblciQYNntF2tF9LRvJK2KFjiIuLdmKnLwu+RC2vWMlDTSEFKVCqHAsjrLAB
 SBUUVgwlCUQ+lmZFL+2MTGPeZKJQUIgamK+4YKZJkE4tPREQVq61Qdv7MGcr356J39/woTrDpVh
 dQvFpGbwq4TCNo69QfOc/RiM+asMZMLaqoRD4tFNGxxT5heuf4a9ZTC/+sgX+0d35DpQKlxnpxK
 K+iIjl9AOk5iQLp6OsPj62Ps/9caWaW7AqauPpxxttR6w4KkN6qt4jQMGEVBV/an80mBOpqvKzD
 SCxpXVdJ8uwcpxBm/BgLXhJrGk+G5FWej+q1COn0lZqAbbMoDzI5tBWCgxE3irGHiMnqMoLxZsf
 +YYh6MMEnzvDrU2lRNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXxSGO9sWfJ335
 yD7x0n1mD9jZxYWmUIJv9p05SCJehf90XwXtqh6QoMkwuVxk0vHZrqTHJxx41NVbVoLmIvEh2S9
 q3GLqPEozy156pJzKXt/KAQ/K2wBTlI=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a987b8c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-SVse2xkFbf2KMwQCVkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 32mp1BENbJVHJ4BmxNqjmIUlINPNXGXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020173

Switch from of_reserved_mem_device_init() to the new resource managed
devm_of_reserved_mem_device_init() so that the reserved memory region
is released automatically on probe failure or device unbind. This
eliminates the err_rmem cleanup label and the need to call
of_reserved_mem_device_release() explicitly on error paths.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried Reviewed-by tag.
 - rebased it.

 drivers/firmware/qcom/qcom_scm.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 80a51ae644e2..882d1865f3a4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2760,17 +2760,15 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(scm->dev);
+	ret = devm_of_reserved_mem_device_init(scm->dev);
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(scm->dev, ret,
 				     "Failed to setup the reserved memory region for TZ mem\n");
 
 	ret = qcom_tzmem_enable(scm->dev);
-	if (ret) {
-		ret = dev_err_probe(scm->dev, ret,
-				    "Failed to enable the TrustZone memory allocator\n");
-		goto err_rmem;
-	}
+	if (ret)
+		return dev_err_probe(scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
 
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = 0;
@@ -2778,11 +2776,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
-	if (IS_ERR(scm->mempool)) {
-		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
-				    "Failed to create the SCM memory pool\n");
-		goto err_rmem;
-	}
+	if (IS_ERR(scm->mempool))
+		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				     "Failed to create the SCM memory pool\n");
 
 	ret = qcom_scm_query_waitq_count(scm);
 	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
@@ -2858,10 +2854,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	qcom_scm_gunyah_wdt_init(scm);
 
 	return 0;
-
-err_rmem:
-	of_reserved_mem_device_release(scm->dev);
-	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)
-- 
2.55.0

