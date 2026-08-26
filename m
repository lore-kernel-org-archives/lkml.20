Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A2741D4F1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750772; cv=none; b=khe6lyDsvokdZjMeZqwOlkD4lJ8wmJkxS8OajPoJXgX+mqPHuHtaZhILrpPYkA0w3OMqhcqgaL/3ss4Tw6RyJYuXCinn/39sWnP5xdnadPk+rczPRyQvzM9QiezgymJwYSb1FD4980t5PSVoSDQFUUujPSkkU8P5a0EVjJof6UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750772; c=relaxed/simple;
	bh=TPMCLTDubnlYeSj2OYg28HGBF4sYYUCTAMZ6mmfr1Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oS7OoDahk4lOYb22SO58w00RSHKSkCcJZ14bqqSqewdwwnavWozlQOmNjjcoCSvbMvaJiTubUU9rcUOp5pxmla4LLX+zXXeWclsfFLqZv1GL6SS2GWG18yw//n+R0k+cg/Z9CidDXMWSXx1/HHf1gD6e6e75H6PYnMOlnWOTbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzSeb6wk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NS9dgbQW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzSeb6wk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NS9dgbQW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCJnN374915
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1NtfMNjXT0T5Ju/tm8MIwOoIu61gHB1srsVawFDusc=; b=UzSeb6wkv3B55J0E
	WQTlbIerm2ahsEtxtU2MXsOxcC09NyyqHC1vIBeWZRhT/GWVvdt2e3u5efj1Zw+y
	Y8Ce9bLhwOEoLhnJ++SPkbcNgIOso+7wKZ3C2oizFNzZq85PvMNzwfjk7ADNvVUL
	8hDZ+RS//lNA7hNRwGqo1AOE0mzY7nkAnDlf9HanbEIjNhm0cE7JoSQEWepP0f9T
	5CcnIC07dCcNgpvRZSub+ZAG7FJlUr7An5UFR7sVhwjQEitWF0Sd/dQW0tpjYd5h
	E1+dBoLlx1ZARDJmjTEWDcUT5bvOeuNKX8iHEZXojIx8CkA5aKZXHOBEZCiOo9St
	lHXHlw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxa0ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:26:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1265020a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750768; x=1788355568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1NtfMNjXT0T5Ju/tm8MIwOoIu61gHB1srsVawFDusc=;
        b=NS9dgbQWQUlXBPUkWP4Da3TOV6bV3ijxQGeUVaK7He6NX0Wxj8n3Rx9cSXDz/iCCeg
         z4Oznqfc+iLHziUp2UgDHIudq1RyhbEyVOmjDuR4tZgtUNAZ1exFtKzCyEMAXoEmxSu9
         217Kvu8xpUhaQOpIRm/wnrS3yjPNlp4kjmnAqtkJlKDTwrxFCx58apvrKASUQVXsUh1f
         1x9+2Co5uLio/0hoKBxGE5awUwHI2eFbcfcjXEhACozZKeTKs/w+mhOtpgeDHjy9qhke
         L5HzR3EqZbPEQ2gePWvOe9Vjt3IXVBgrPQOQ/A+aJqgEiq6AzrXb2sJ7T5E6P/XQftsp
         NvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750768; x=1788355568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1NtfMNjXT0T5Ju/tm8MIwOoIu61gHB1srsVawFDusc=;
        b=jCqMP2XvDezgMjkt0X2a4VGciKvyXqddm3SdLYwbHDHi6tqXnfgXNhsXQXsgA6fUBM
         AGGrhU43/oyGrom5BIyugseo8J9qGj7xaYpSiGhYVoavwLHZVEcMRvXADkCuyPELH068
         4/2zyL5jqnpQmW8ZaNLDYjcK37K+X5O6ZKtyXsb56xedYOKo+B3oVIubjE9WzWig/1C7
         Lgjq4PbcHkefLCcv7rwVPQV6VPnynXnNCvzH+HqJYpCVcrNfaL+iWIucpwZZuIQSaXfE
         kYMbvy6w914qxilLIsDM+cNyaR2krUPmDuOIm/z4uyhFiKWw6w9o1p4Qz92NSyLuatNn
         JG9g==
X-Forwarded-Encrypted: i=1; AHgh+RohR5qnuPihRv3dgg3ztMms2N6Bw+mSeseq6VzpL3eFmsl0zGgo593ObFK4yTUHnS92yk6VriXAycLG5NI=@vger.kernel.org
X-Gm-Message-State: AFuF++lhoNG7XQ9Z9Vv++S75c8cTG3JiHeAI90CviW47YZ2ca1LN3Eos
	Imb0ZaDk1vvWE7Yz+8vphn116ccBSms6GL/D20Xo/zhkipeLNtIpHaxgv7oB7Iq8sfTGayKOm6Y
	r//p3HTk8RQvWfD4UxFoiw2YN462c4m5FzCzAbH4u108kNw/4kIrbsEsXnqs3IRPdKqw=
X-Gm-Gg: AR+sD13P7/j26ydl36PFv/tf/XbA4LKDF4sClCUg8alut/KY0EAqb4o5m1BSQYMS6vl
	5LrNL5eJxMdo6cvQikpd/dGdrAVpPdwhk6hRhGidVrT85zevO8hoCjisA1LPVJhvi1ClZ1JeCSr
	BUWsPejkXZhc/1zhzbs6Mk2/5kmHLJEPKYjU5p1ZDGXG64qw52oeZXk6cJaTTmvSncOqNL9GA+6
	EtzQ8MjF5tLy3EN89zA1LkI+yQPKX0N8HdbyrjWh7fk+Oe6n4264ppbjGde4G5Qj4qcP47UZdu2
	Rm9tHzpY9qiC2MwUsPRUmOvCXX4DapY0M1bO2yAwSXjNWwgH4Ox3Cf14tkYgs11qp/F3nwUJPwi
	7m/6PEnmIhTY7QrRlXcuk28vuiO6nR+g5xQ==
X-Received: by 2002:a17:90b:4e88:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-3966d4488cbmr15782740a91.11.1787750768196;
        Wed, 26 Aug 2026 06:26:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-3966d4488cbmr15782610a91.11.1787750767715;
        Wed, 26 Aug 2026 06:26:07 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm4581108a91.8.2026.08.26.06.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:26:07 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:55:49 +0530
Subject: [PATCH v4 1/3] misc: fastrpc: iterate CB nodes manually instead of
 of_platform_populate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-dup-sessions-v4-1-35555d2bfed4@oss.qualcomm.com>
References: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
In-Reply-To: <20260826-dup-sessions-v4-0-35555d2bfed4@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787750757; l=5256;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=TPMCLTDubnlYeSj2OYg28HGBF4sYYUCTAMZ6mmfr1Y4=;
 b=rtf85DxaxIVXlZxJuVEjZMk7uqHRFjgWoi5Nd9/cmK0eGzZEnd6X/m13pe49ZFB6VAVYjN5gH
 yW2lGXF1ZscDy8DRUywyUzty+CMOmcllSM/7EsFo6G2Y3fYW1C3mQJo
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ee971 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0tPlnvf1ouYV9MwHMgkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: qwl4l0ixzXP4Q1w8JM47YmXIIl58j_z1
X-Proofpoint-ORIG-GUID: qwl4l0ixzXP4Q1w8JM47YmXIIl58j_z1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX/glf67huWb1C
 m7dkZHWAP1lMdZ7yXc/v7NeW7mydaLKU2xXQH3CsQ2lPGkm4+h1iMj9IYBgwlvg8i4FQb2Nvnt0
 eTvVqMX5ydNU3xFvELYTgNtrhnPvb1xjXUlchaI6bv+ShZtLDVYa9yU6h6W9/swEkgL4CX09L29
 daXPgmqiZ25OnFvRlvwrQsLcuknXaxR7XEqbuGFRxfrEScMT6cdYRTdOTodorVxrWye5ragGNXT
 Pf1f0bpeAmlvXOIPNg+8o0h7mo+e/6ttIVBjGmg9EqY8o3qu15BtWW1FiY4uyJhKDcwV9+7Mmvp
 IINugYlp90kKnk/9ffzbwq3HKHMvV5+PdN3L5UHsmgEPX51rg8t5XrL2UC7r53+5F1c3VnWKfqS
 wfvsqkkyWFQYMvgkVgbewy8at/PLd9X97kMT7JTJ6Mx1IlVQkokoXhFE11CK3B3NEeQYX0jNEmp
 uWZSnISsy0YoG9gku3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfX+bjBYOeGusCx
 zn/7vyB9Thp6quPc8DdxJMe8AiTP/D6KxbKk7GOGkgvPZlYw/Y7Lcm9ORU7kQ5lp2FEVe+xKE8F
 bJWVRTFXRZIPN2iYnMk1j+Bt4xGx4GU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260111

of_platform_populate() only guarantees that child devices are registered,
not that their probes have completed before it returns. This creates a
window where fastrpc_cb_init() may not have run for all context bank
nodes, leaving the channel context partially initialised.

Iterate over the child device tree nodes directly, initialising each
qcom,fastrpc-compute-cb device synchronously. This ensures all context
banks are fully initialised before fastrpc_rpmsg_probe() returns. Since
fastrpc_cb_driver is no longer needed as an independent platform driver,
remove it along with its match table and remove callback. Set
OF_POPULATED_BUS on the rpmsg node so that of_platform_depopulate()
correctly removes the manually created CB devices on teardown.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 83 ++++++++++++++++++--------------------------------
 1 file changed, 29 insertions(+), 54 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..a153107d0085 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2363,7 +2363,7 @@ static const struct file_operations fastrpc_fops = {
 	.compat_ioctl = fastrpc_device_ioctl,
 };
 
-static int fastrpc_cb_probe(struct platform_device *pdev)
+static int fastrpc_cb_init(struct platform_device *pdev)
 {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
@@ -2385,7 +2385,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);
-		dev_err(&pdev->dev, "too many sessions\n");
+		dev_err(dev, "too many sessions\n");
 		return -ENOSPC;
 	}
 	dma_bits = cctx->soc_data->dma_addr_bits_default;
@@ -2419,38 +2419,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void fastrpc_cb_remove(struct platform_device *pdev)
-{
-	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
-	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
-	unsigned long flags;
-	int i;
-
-	spin_lock_irqsave(&cctx->lock, flags);
-	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
-		if (cctx->session[i].sid == sess->sid) {
-			cctx->session[i].valid = false;
-			cctx->sesscount--;
-		}
-	}
-	spin_unlock_irqrestore(&cctx->lock, flags);
-}
-
-static const struct of_device_id fastrpc_match_table[] = {
-	{ .compatible = "qcom,fastrpc-compute-cb" },
-	{ }
-};
-
-static struct platform_driver fastrpc_cb_driver = {
-	.probe = fastrpc_cb_probe,
-	.remove = fastrpc_cb_remove,
-	.driver = {
-		.name = "qcom,fastrpc-cb",
-		.of_match_table = fastrpc_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
-
 static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
 				   bool is_secured, const char *domain)
 {
@@ -2642,12 +2610,29 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->rpdev = rpdev;
 	dev_set_drvdata(&rpdev->dev, data);
 
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
-	if (err)
-		goto err_deregister_fdev;
+	of_node_set_flag(rdev->of_node, OF_POPULATED_BUS);
+
+	for_each_available_child_of_node_scoped(rdev->of_node, np) {
+		struct platform_device *pdev;
+
+		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		pdev = of_platform_device_create(np, NULL, rdev);
+		if (!pdev) {
+			err = -EINVAL;
+			goto err_depopulate;
+		}
+
+		err = fastrpc_cb_init(pdev);
+		if (err)
+			goto err_depopulate;
+	}
 
 	return 0;
 
+err_depopulate:
+	of_platform_depopulate(rdev);
 err_deregister_fdev:
 	if (data->fdevice)
 		misc_deregister(&data->fdevice->miscdev);
@@ -2677,6 +2662,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_buf *buf, *b;
 	struct fastrpc_user *user;
 	unsigned long flags;
+	int i;
 
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -2697,6 +2683,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (cctx->remote_heap)
 		fastrpc_buf_free(cctx->remote_heap);
 
+	spin_lock_irqsave(&cctx->lock, flags);
+	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++)
+		cctx->session[i].valid = false;
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
 	of_platform_depopulate(&rpdev->dev);
 
 	fastrpc_channel_ctx_put(cctx);
@@ -2786,28 +2777,12 @@ static struct rpmsg_driver fastrpc_driver = {
 
 static int fastrpc_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&fastrpc_cb_driver);
-	if (ret < 0) {
-		pr_err("fastrpc: failed to register cb driver\n");
-		return ret;
-	}
-
-	ret = register_rpmsg_driver(&fastrpc_driver);
-	if (ret < 0) {
-		pr_err("fastrpc: failed to register rpmsg driver\n");
-		platform_driver_unregister(&fastrpc_cb_driver);
-		return ret;
-	}
-
-	return 0;
+	return register_rpmsg_driver(&fastrpc_driver);
 }
 module_init(fastrpc_init);
 
 static void fastrpc_exit(void)
 {
-	platform_driver_unregister(&fastrpc_cb_driver);
 	unregister_rpmsg_driver(&fastrpc_driver);
 }
 module_exit(fastrpc_exit);

-- 
2.34.1

