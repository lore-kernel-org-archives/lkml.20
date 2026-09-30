Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E024ED1BD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779963; cv=none; b=ugCiA8R7PHvWBNphVHf/1hq84ZYX7K4ukPHTUdfCenAp0x210q1vLH6P4GlWTkKu087UvQaObREBj2MIQlKagqMtOYlNfUEXTXyGw9QmT60QgmSfSVtHfOxcNkxb4lae47XzdIcKtJq93pq4UdffEBeADMcx85dubJGdIQVD0o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779963; c=relaxed/simple;
	bh=GLhqiOOG/ARARD1eN/kge/LRFSAxUT8726/4rLJXLbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hWydjJ+fxKAURfFNnaF+poAjJOdbxzQRK94Pnjb9yjG+CXgMtbrgx41309djVgCoyThlBP+6lQB01XvKRgu2Fl2UYHfPBGcA3GGtIIYrDmmbChs1vKfgqJJNg8JfSwMa2V/zGMdeAQ4imI+APlkh7nOpNGOqxRrCQxjKZN7n78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgUil/9F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czmMVz4m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgUil/9F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czmMVz4m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxpVI3063756
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FXnuFReb/aR
	g05c9O0/5RdoakU5qHY6jskp27DmHEHw=; b=hgUil/9FuJsiFNe7cCNkmqo0cNH
	AAdJSbiY+tmpI2V1RcP4UAr8FvcMPGzUiQDPZpnGfdMDaFh+XpltuHLIWdPEjsu3
	3YuKMKEkuEM3goiDNXYEtWEl9RzE37FmD/Tc+3oqjEmLYaHJZl6JtLxuxBxE9ulS
	dGY7C+1pgH9jCD+F1c0pIuM5ip8DAX37cT71xyT4tiUVBwal40iwEfx/BfETYILU
	6+lbzAm+9BkKNldJiygg9juGmanAZoFtD0Q2uyXu/AftZgBZ72L7MFCrVfrZ086l
	Gqt8baeifnEdtWr3ol+fzLuGk7twBcyY9FLAbFF2SMZ+AIWDGWw5eiwMBwg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjk48y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33baaba6371so1545752eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779946; x=1791384746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXnuFReb/aRg05c9O0/5RdoakU5qHY6jskp27DmHEHw=;
        b=czmMVz4mqX4WpzGhoSIcGy6Aa0OBtnlbms9xUcsPvNR50WFpqaPdhzk/uXZkYXzXEm
         75hNgJheXsanT85Lz1WLQgoE6P2l/FaHzpyHmiVXwT/IVk2uHMiwj8oM9iN8vqsscF6N
         8tPfWy4QhhgJMreq88jPRdaXY4EW+H6nA7SWnvoBmf8IQyvTHkXP/tUsYLXfpJeRPsTv
         QtbPAGSounKV3HusKbFlHg/or7qI7qGDr9uUtZaxQyTTA8mVeUaVoqy6mkvMWYilT2FF
         iBJscTZoOye6OYb6xK/XjhStI+hdET8op/+KqZO4IL8MDrJ3uD1QhABZsZli2q5/JvxY
         KYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779946; x=1791384746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FXnuFReb/aRg05c9O0/5RdoakU5qHY6jskp27DmHEHw=;
        b=P8IRpGdzDlp+vZIUZZHhpHAKAIubB4RD57LlWW9oFqFfX8udl4pYAwNOR3av8lZ48i
         GHPxaXdKCqCB0NLS+Z/JbmMmkGEJHgO28mrsD9T8TJf/qIzaNj01PzhWrgimV+YSQiPF
         hco0CvOMOVuZefyrYFdM4n2J7XZrNxqHPuC5LENoKvTlSYKXq/q75aUBCYjzx6L7n1Fp
         HAVrjhU2Rn8dZRAAu+e26k1R/Hfd7KM4J2Chc9c0ay+h9qYVfDZGgR/JeOd8x3HmPRBi
         6+EFPFdrElikmyqMF36opMUGeERX3Hv+S+dup0nVcQBdXOyfvUudEGcC7JnhjxN26eCI
         NNBQ==
X-Forwarded-Encrypted: i=1; AKwUvBznh+wAnIR8eRTp1A0CETOu40NMsKYkjdt8uUeZwDfcFxHLorN08Qi+e4ulANTCq2BAd5bBBTtUB21qOoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQH818BgICT4+UwDHzahcoIGgwTTSYMCS0wRRxGv6OLg/6rqMS
	RWdMXLr2isREeSuB16jcSthq9U/JzdlCumTImqeVBYxVlHJ03IIoXKp/eoBRr+ptBOwXnzT3wxv
	TOT1kw0RTO/TQczcbHPS4l3Na8X/2C4rNmLXURSTj/1O0RdgQtKVoB8ll4qXvOxUnUB4=
X-Gm-Gg: AYBFou1zLsKeFPxx9laKQtLSG4TXZBMB0K6THlODgGnk0UhKH0s3ZjZRf77YkputWC+
	pZ7Q4cyzMJgwbljQ3FRTK2WXQxho44pINUbEgYb8wabP6ATWy6v2NrkKOgHrTdYja8YJRVEDGnh
	cnmtzY+6XGbrQkTn3PJigwjppY5fmWwcKB/zv/phcZzdv6zDYKShrMYrEjij3KtWeShnkA185hG
	92ryjBjAzUGEbu3F7X3i89sIeK47DtzwOWHdZehGAE14aeRq+dHiurxCyivQHUfoUUf483V4u/Y
	8Ex2fbJT177WaIvpRSl3TGjMnr88a7LigNDfm0Syp4cXjmbunkDr0NP3f/J7NFtrKgDIbe93Ua0
	DWFo92LAfBlR8rKSUXCNEhSpQgH9VO+M2V9YyEe5RDMlnxMxqlnCuj2E=
X-Received: by 2002:a05:7301:420c:b0:34d:9c6f:8af2 with SMTP id 5a478bee46e88-34d9c6f8d0bmr113723eec.40.1790779945447;
        Wed, 30 Sep 2026 07:52:25 -0700 (PDT)
X-Received: by 2002:a05:7301:420c:b0:34d:9c6f:8af2 with SMTP id 5a478bee46e88-34d9c6f8d0bmr113681eec.40.1790779944661;
        Wed, 30 Sep 2026 07:52:24 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:24 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 5/6] soc: qcom: qpace: Add LLCC slice support
Date: Wed, 30 Sep 2026 07:52:14 -0700
Message-Id: <20260930145215.3380977-6-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX0IZwuqWkoGPo
 Aq1F1h+1sT9tNE8eWQUVGD229SYhmWD+EBEvAENVjhUox1QX5b5U3v58/icPmFqF2EW2LRhFSkJ
 CVDstUq8HhbVpWo1y12ks2nuc4LKa6w=
X-Proofpoint-GUID: gmaDgoaLIeOARPSTPayzPulZqk8V2X-Q
X-Proofpoint-ORIG-GUID: gmaDgoaLIeOARPSTPayzPulZqk8V2X-Q
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd222a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dejIaLI6GUeI2fIgeLMA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX5dWTIt+PisLj
 prmihKOsQXkx/dSdAijJGozWfGZOqq5/r5AtouS07E8AQ1P9t6RDaxN8K9SKSSG9hDhP3F+tpWq
 3ysHMfAtJ3m9mzX4vlR63FHeYIPpzMqxcD0wi2hl19acFPO8Qf78YmzDx9scBnWOK+64onqwxsl
 bU2TftlUNzXAOF9lJLM72BQC9n+W9T2K0mjnDOSHZ6PZBKleYIEh4iYrpGQaA/4yJOje5DEpHPW
 TRhe/ftSAFk6G6oYDbAgaVi8w9X25lwaC3F7nOnlCALeMSSjCFj98koIrs9Fvx29cfTF8qQv4yE
 K7jw0V1B/EZyCxKHUHl7AiBeBAuYdoYFIOo1ArjTPhiSaMMm5uYV0ZB5x7fSr4Tq3rAfT7Iynj3
 lI4/t0RwLmqQmEqxKC+P34ddbpQbJPd2ByJz+TNhq2sRLddPoPG7c5h5SRS9dvU+epk1Gl0L554
 /41xpkmnbjL4d95HEBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

QPaCE can use dedicated LLCC slices for compression and decompression, but
the driver currently does not request or enable them. This leaves platforms
with QPaCE LLCC support running without the intended cache allocation.

Add the QPaCE LLCC slice IDs and make the driver request and activate the
slices.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 drivers/soc/qcom/qpace.c           | 58 ++++++++++++++++++++++++++++--
 include/linux/soc/qcom/llcc-qcom.h |  2 ++
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qpace.c b/drivers/soc/qcom/qpace.c
index f5b21ffbcbff..86a935ae2ca9 100644
--- a/drivers/soc/qcom/qpace.c
+++ b/drivers/soc/qcom/qpace.c
@@ -18,6 +18,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
+#include <linux/soc/qcom/llcc-qcom.h>
 #include <linux/soc/qcom/qpace.h>
 #include <linux/workqueue.h>
 
@@ -42,6 +43,8 @@ struct qpace_priv {
 
 	struct icc_path *interconnect;
 	struct pm_qos_request qos_req;
+	struct llcc_slice_desc *llc_comp;
+	struct llcc_slice_desc *llc_decomp;
 
 	int active_rings;
 	struct completion no_active_refs;
@@ -660,9 +663,35 @@ static int qpace_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to map QPaCE registers\n");
 
+	priv->llc_comp = llcc_slice_getd(LLCC_QPACE_COMPRESSION);
+	if (IS_ERR(priv->llc_comp))
+		return dev_err_probe(dev, PTR_ERR(priv->llc_comp),
+				     "failed to get compression LLCC slice\n");
+
+	priv->llc_decomp = llcc_slice_getd(LLCC_QPACE_DECOMPRESSION);
+	if (IS_ERR(priv->llc_decomp)) {
+		ret = dev_err_probe(dev, PTR_ERR(priv->llc_decomp),
+				    "failed to get decompression LLCC slice\n");
+		priv->llc_decomp = NULL;
+		goto llc_put_comp;
+	}
+
+	ret = llcc_slice_activate(priv->llc_comp);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to activate compression LLCC slice\n");
+		goto llc_put_decomp;
+	}
+
+	ret = llcc_slice_activate(priv->llc_decomp);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to activate decompression LLCC slice\n");
+		goto llc_deactivate_comp;
+	}
 	ret = qpace_power_on(dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to power on QPaCE\n");
+	if (ret) {
+		dev_err(dev, "failed to power on QPaCE\n");
+		goto llc_deactivate_decomp;
+	}
 
 	/* Get QPaCE HW version. */
 	qpace_priv->hw_version = qpace_read_gen(qpace_priv, QPACE_CORE_HW_VERSION_OFFSET);
@@ -691,6 +720,14 @@ static int qpace_probe(struct platform_device *pdev)
 
 power_off:
 	qpace_power_off(dev);
+llc_deactivate_decomp:
+	llcc_slice_deactivate(priv->llc_decomp);
+llc_deactivate_comp:
+	llcc_slice_deactivate(priv->llc_comp);
+llc_put_decomp:
+	llcc_slice_putd(priv->llc_decomp);
+llc_put_comp:
+	llcc_slice_putd(priv->llc_comp);
 
 	return ret;
 }
@@ -708,6 +745,10 @@ static void qpace_remove(struct platform_device *pdev)
 	/* No callers remain; tear down the hardware. */
 	cancel_work_sync(&qpace_priv->disable_work);
 	qpace_power_off(&pdev->dev);
+	llcc_slice_deactivate(qpace_priv->llc_decomp);
+	llcc_slice_deactivate(qpace_priv->llc_comp);
+	llcc_slice_putd(qpace_priv->llc_decomp);
+	llcc_slice_putd(qpace_priv->llc_comp);
 }
 
 static const struct of_device_id qpace_match_table[] = {
@@ -729,6 +770,9 @@ static int qpace_suspend(struct device *dev)
 		return -EBUSY;
 	}
 
+	llcc_slice_deactivate(qpace_priv->llc_comp);
+	llcc_slice_deactivate(qpace_priv->llc_decomp);
+
 	mutex_unlock(&qpace_ref_lock);
 	return 0;
 }
@@ -746,6 +790,16 @@ static int qpace_resume(struct device *dev)
 	if (ret)
 		goto out_unlock;
 
+	ret = llcc_slice_activate(qpace_priv->llc_comp);
+	if (ret)
+		goto out_unlock;
+
+	ret = llcc_slice_activate(qpace_priv->llc_decomp);
+	if (ret) {
+		llcc_slice_deactivate(qpace_priv->llc_comp);
+		goto out_unlock;
+	}
+
 	program_urg_command_contexts_v2();
 	program_decomp_core_cfg();
 
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 713cb0221b14..feddbebf1183 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -85,6 +85,8 @@
 #define LLCC_CAM_IPE_STROV	 92
 #define LLCC_CAM_OFE_STROV	 93
 #define LLCC_CPUSS_HEU	 94
+#define LLCC_QPACE_COMPRESSION 95
+#define LLCC_QPACE_DECOMPRESSION 96
 #define LLCC_PCIE_TCU	 97
 #define LLCC_GPUHTW_LITTLE	 98
 #define LLCC_MDM_PNG_FIXED	 100
