Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4244D956C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351967; cv=none; b=oU+6LHy9rVLziBtub/KykjNNKtmWaGFEC+ePc23PyvXmoD24a2JBa948SXcnFjdM27e5l9GtR/+X1JQU4AHFTUsANYdQNPZKUBCdC/1oBgn1RGaT6pZdExtd46u4I9ekXTNGNaiJH1ueUA5HHyA9uUQpFLbXvHwV67jVLOSvxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351967; c=relaxed/simple;
	bh=zDuJCdpny4nvDijWnjUood5Ogh4JDdDd4/+inxDkgqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ga84bUOs+1GGYb8ynWfgPjhrc2s3Irjcst/oOozjTgKVMHUe/79zw8gKQiRZPIKI1VakZ12ng4X3u0VnA+smE2E4E7ri6Eh7ARI3TJFfQkyFipq7mzsepAxwyde3EVR4vwWUtTEXrbXObnnQbPdA48M4Rr+vONhQ3nW11kQ8wWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI86Rg99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jf3G32Tr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI86Rg99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jf3G32Tr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PCtNAE208828
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9+1rwJEQXq1
	lO/cD3GiWTUUYzCO5JaKWtBAY2RhYZaI=; b=QI86Rg99O/cQBiooeAMdGH6d2qr
	/2ApE7DEiMzD3YrXNmwz+AFIQiuSiyeU538+94tBUEGoj2itMo2gej/TfPXlqIaF
	zZ72GNYlwbjhiqHnwtDgSSGltE9iecu43LiWKRH0DKQEAzXnXEZewprdY2FRNWfm
	3wweR+e6s0j74nJNxeHevQQbBp3T3hxokyJL8PRt6yueJf2AFuxy/RkmsnSgBBNn
	TXc9twwC6JYh28lCZk+wcQNgeeVN+eTQiS0oTdNHyZe+4VJlNRsnfvPoTUwC1OCN
	6/DfLq+X7JrgAdJpeU7WAmXzD0xZrYB28w+K3rYTyvBwyJiFwLIJro0IqDg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898v8q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:59:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-877ef1457aeso954718b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351963; x=1790956763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+1rwJEQXq1lO/cD3GiWTUUYzCO5JaKWtBAY2RhYZaI=;
        b=jf3G32Tra/vQo2W/RHr/6lshX5qjJDK6ktSGtR1koZZgv4TMNHdFF+6g9b4s2pzg1l
         ot4GKWrXemT8aK8tflltXaxm21qPUcNBEoULrvr4tpjl9dtkuZ49i/+92IH5vdo8XxMG
         OEOjN7QXQEiwg+WfH4vO3lFaaSDWTfo1M9PmB84X1pOYIhPczYNGfN8QDdy391qEbUap
         zYz2IXH1ym6DP69fvwVcSHLkIsqcwEE3NkcoEoiEGyJEj+rURUBoYW4yvmu/c03MIZcK
         UCsVIAfaSF5sgjZmeiTxTtvTp301/6vvcWW1yiw57vEopCfyJO21IhX2CY4Q6SQA1EEd
         mtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351963; x=1790956763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+1rwJEQXq1lO/cD3GiWTUUYzCO5JaKWtBAY2RhYZaI=;
        b=xNoKb/hPONrgralVfFIfZY3YifPlV0TwKdPj21dXWTii5pPo6w5fpI/yYrfYxwgnrC
         HGSRj/Sb/QmrhjcfbXqSH+amZX8ZJdfBhy/Cx4lOdSoI+ItIGctrbeMzxB1xV3spGB2r
         YaLFZjHeUEtDisfdUzIgDfOhC1a5BpYN5Y0oUpqT+OIZjqr9jb+voVOXpTjty/VumZ/+
         BNp6WGMBK3Ziaiy4kQGE9CtZc52/ndjJD8LWccbRueBbM19hjTJswLK28Xx4veaS9h/h
         n3If5PnY1aKQPp3b7TxI7lpdK3dfyijyc8mHZ3QMR0ue5R8nfVz++gKPT24gX1T/6OlN
         7skA==
X-Forwarded-Encrypted: i=1; AKwUvByAGi7nldhQov338FV3Ro6CxfFl6uHWKeljC2ZyNSmRDO2LcJ27Mm+T3o25n5ORnUd0mbhPXVR72JPJ9Tw=@vger.kernel.org
X-Gm-Message-State: AFuF++mZFLikTXtkyisAtnnSgJeZumbeuqjmqu8dSPYqIMpGM74V2DO0
	twL2tcFlFcT9ez9cjqdzP2pWULsbNcQNT3krI34wdlpkdu4vm1lBB57qTP91ezLvr+c6Xxyn9Df
	h3YjLRM41caaGJvucJhi/3TjRdew4WQH+zbhX8DC+pYSMihhhWXk1AhNSl4TeFMc3B18=
X-Gm-Gg: AYBFou3iRzSEKKglnBuBYiIkGerQpw9yYL6Efd5G4Uvfa7vwYM4E6lJ8X5ykGyAPgxC
	OpuuAgdxRymTVdI1X0xOCuhgbT2NhWV+nyI+g0To2DSgQN7yZl6bVRba65ntu9jNRLZS+B3yxw6
	RA6aYKKyjNMjqm0oACR3zB5uBRslUBLwuGAKrDejUG875SA9sWcH7+ubTH5QQCSonpBpwjJUit4
	tn9noE8NNCTuQccTEVLQPXPhHh6k8pbXhEfridY+9ZfEFMBv2Td1Wl4cwhfKqzMQAkmTamb/3k2
	VdukWzeTSK2XW9nwTIk7GSN1yK2RZXRADxBgYBVNVr2EnBFyAYes5WVhCyCQBptHvrjlWD4doOZ
	/3fhZ78MkHtBKIL/37PK1CxpptuI=
X-Received: by 2002:a05:6a00:6f12:b0:880:a842:bb06 with SMTP id d2e1a72fcca58-880a842c13cmr905905b3a.45.1790351963320;
        Fri, 25 Sep 2026 08:59:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:6f12:b0:880:a842:bb06 with SMTP id d2e1a72fcca58-880a842c13cmr905860b3a.45.1790351962748;
        Fri, 25 Sep 2026 08:59:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:59:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 8/8] firmware: qcom: pas: remove qcom_pas_auth_and_reset()
Date: Fri, 25 Sep 2026 21:27:37 +0530
Message-ID: <20260925155737.4161358-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX+QlO7xS+X9MS
 MAi0gGJla+TeEKePFaqFoVqt8eLbm5bQwWMwA6zGW8Epkiaz8w7+N7NxsxFyOWLmK7iuhbGdKvp
 OzrS1AFaLwQDc/98OAmt4BEa1pGpHMoPhtf00L52zs+cKmiRM16+XgIuKbhApxHVNShzKTVrYFa
 cDyvnEZyVkssQ+a8jp86BtRSgaWkwuEIuVOqMYQCd++v5D5hoaMbyEqW5+tZaYNjTYi7PGCJbWp
 IEZzbdDCA4u2V/J3jaVhLzgeIKmRf9ES87NA7g/Q5xB6FouxwfLiS7cvvAnWlmOn8IoUil2nmA1
 N7C24RGjex7+VnfVTxf8VMAkjDOXe0+myT+3gKa7k670aZGi9k/f45ZnV4ciPnQfN9SJMNpATyr
 nt82bPovo3ssY64QZiiNNYF+r2tcgjcBm0f1a610kq5Avp0f0h6L/Fq3VqmIHytGBbMQK02i4QQ
 +t4D80voQAQUo7zr8Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXy6A9ne/NAM6q
 EzLeijOb5u74pZGTZOkFjgI/Tim6SNxO7N98Cv9XVFj0fRj4hzFvq23RRSDl7cfRrkEG1c9YPsg
 AXF0wr56Ie9u9QmMDiYOSTg/r9wWlTw=
X-Proofpoint-GUID: ySVt1M_nbJ75D80WwxMb1uu0Zy5pXByC
X-Proofpoint-ORIG-GUID: ySVt1M_nbJ75D80WwxMb1uu0Zy5pXByC
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab69a5c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=sV0Ut8U-cAKt8JUqj3YA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

All callers have been migrated to qcom_pas_prepare_and_auth_reset(),
which additionally sets up a shmbridge over firmware memory before
TrustZone authentication.  Remove the bare pas_id-only wrapper, its
EXPORT_SYMBOL_GPL, the header declaration, the auth_and_reset ops slot
from struct qcom_pas_ops and both backend implementations.

The internal helper functions (__qcom_scm_pas_auth_and_reset,
__qcom_pas_tee_auth_and_reset) remain as they are called directly by
their respective prepare_and_auth_reset implementations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 16 ----------------
 drivers/firmware/qcom/qcom_pas.h       |  3 ---
 drivers/firmware/qcom/qcom_pas_tee.c   |  6 ------
 drivers/firmware/qcom/qcom_scm.c       |  7 +++----
 include/linux/firmware/qcom/qcom_pas.h |  1 -
 5 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index 93d78a5c1201..6de6d62adfde 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -166,22 +166,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 }
 EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
 
-/**
- * qcom_pas_auth_and_reset() - Authenticate the given peripheral firmware
- *			       and reset the remote processor
- * @pas_id:	peripheral authentication service id
- *
- * Return: 0 on success.
- */
-int qcom_pas_auth_and_reset(u32 pas_id)
-{
-	if (!ops_ptr)
-		return -ENODEV;
-
-	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
-}
-EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
-
 /**
  * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
  *				       remote processor
diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
index 8643e2760602..a296be2be8c0 100644
--- a/drivers/firmware/qcom/qcom_pas.h
+++ b/drivers/firmware/qcom/qcom_pas.h
@@ -18,8 +18,6 @@ struct device;
  * @get_rsc_table:		Peripheral get resource table callback.
  * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
  *				reset callback.
- * @auth_and_reset:		Peripheral firmware authentication and reset
- *				callback.
  * @set_remote_state:		Peripheral set remote state callback.
  * @shutdown:			Peripheral shutdown callback.
  * @metadata_release:		Image metadata release callback.
@@ -37,7 +35,6 @@ struct qcom_pas_ops {
 			       size_t *output_rt_size);
 	int (*prepare_and_auth_reset)(struct device *dev,
 				      struct qcom_pas_context *ctx);
-	int (*auth_and_reset)(struct device *dev, u32 pas_id);
 	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
 	int (*shutdown)(struct device *dev, u32 pas_id);
 	void (*metadata_release)(struct device *dev,
diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ac33a00687aa..dbab9a43e6ca 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -320,11 +320,6 @@ static int __qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id,
 	return ret;
 }
 
-static int qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id)
-{
-	return __qcom_pas_tee_auth_and_reset(dev, pas_id, 0, 0);
-}
-
 static int qcom_pas_tee_prepare_and_auth_reset(struct device *dev,
 					       struct qcom_pas_context *ctx)
 {
@@ -401,7 +396,6 @@ static struct qcom_pas_ops qcom_pas_ops_tee = {
 	.init_image		= qcom_pas_tee_init_image,
 	.mem_setup		= qcom_pas_tee_mem_setup,
 	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
-	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
 	.set_remote_state	= qcom_pas_tee_set_remote_state,
 	.shutdown		= qcom_pas_tee_shutdown,
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index dc57c87870cf..08b9c5049dd9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -845,7 +845,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
-static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
+static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -886,7 +886,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	 * memory region and then invokes a call to TrustZone to authenticate.
 	 */
 	if (!ctx->use_tzmem)
-		return qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 
 	/*
 	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
@@ -896,7 +896,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 	qcom_tzmem_shm_bridge_delete(handle);
 
 	return ret;
@@ -977,7 +977,6 @@ static struct qcom_pas_ops qcom_pas_ops_scm = {
 	.init_image		= qcom_scm_pas_init_image,
 	.mem_setup		= qcom_scm_pas_mem_setup,
 	.get_rsc_table		= qcom_scm_pas_get_rsc_table,
-	.auth_and_reset		= qcom_scm_pas_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_scm_pas_prepare_and_auth_reset,
 	.set_remote_state	= qcom_scm_pas_set_remote_state,
 	.shutdown		= qcom_scm_pas_shutdown,
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 1d132e89536e..07d0f1fad85f 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -46,7 +46,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 					      void *input_rt, size_t input_rt_size,
 					      size_t *output_rt_size);
 int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
-int qcom_pas_auth_and_reset(u32 pas_id);
 int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
 int qcom_pas_set_remote_state(u32 state, u32 pas_id);
 int qcom_pas_shutdown(u32 pas_id);
-- 
2.55.0

