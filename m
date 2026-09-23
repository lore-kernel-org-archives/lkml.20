Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1C446EF96
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152823; cv=none; b=W0FLQrOf96JwrEU2pcTNXjKBLpXS7cXXw7tJPpz+rE1iI2p4K2E3frVCW+8pmUyKor0GZLr6n5acsEVbfhdxIMovoGnyiSUXiwqWn8Yb7l7dxaygwbsPquYaoOVXKfSCi+TBzThb/OONfLyaUm1lyTkR5NbrcvhcsiNR0pi8/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152823; c=relaxed/simple;
	bh=2NFyyzgKwY0d5hBYe7MwLGfgwcNpViosAh7hxpTEgkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qJB9KpOUlUSsjgJszgG1jhnXRjh7lc/nB8X89/iDRZwuFNLWMaJwnwELKVqAXO09+GqPkbxT97q05Q44B5DPWsLGK4+KD2GlW8I9ScDFIGzqWyhSrYoje1mDnHP/w/UbUpl66QcF5lz/d+faU653Mc8wVVZldrmW5FgVBLovCK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4/0w7Jn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAfXAUOQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4/0w7Jn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAfXAUOQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Ji4K3332943
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWqTLAkW4i1E1lvz+cnZILkUyZ8Lt+Lp/+qHaxdTMmQ=; b=b4/0w7Jn9teCNeyn
	0yOhAx2//r7QxLON/6ARL6fPGV1kt74+4rTxnVgKkgZB2/Y1R7tPF5YPdtUL1BNc
	UZ/rmGRrqzvONyNWr/Q2cE2ZT5MTxHTUtgo4ICcb8hjKOv6kL4eh1J1ydF86CgXY
	M/eF+qtYxAWXTzeCPOtdsqXELS/KnuWSxzbbtPIbwMlMY/OY5SO32A6SmV6ZiRrv
	RbujksR1ebVEeQRLXtCqn5CqkFWr+1wE18fxq4t4DZQtKg/OhBmzImzCVigOzIBs
	1M0T0452jO9xxBbEGchOM47+xBB34ydJ3ZoBcdADgHkLWhG5LOYzQw03DD2Zam7D
	qSTYuA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xudnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14318be7d79so735164c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152803; x=1790757603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWqTLAkW4i1E1lvz+cnZILkUyZ8Lt+Lp/+qHaxdTMmQ=;
        b=YAfXAUOQv2eRmDeO3PMJAt06zvJT4wTuXrOYsWthLQTZ2vAr3YsGNqED4lbbTqaoDx
         V/UjaOpX2attdMpeSVGAawCZ9aJn8WmUpVoe2yo9Fip1FnXfgw5wmmEfd6A1Fru1LtxM
         WfwG/a7i60UIsXitrYfbme5QMS09nm4Jk6kjefEdScyJyRHzo9e5yIRiePVxMKSImIiO
         eSnbLrCMGGw4f/vYhnmO+WkspfFeEVuUdxIqhE7RFWGPrbF4c2IrkqfMZkv2tWACj8GN
         iDULCpVhQBXv3jPqgfTVzviekTCDIxIPXTKMPBHsnhuFTZgBMLnUpm+3fi0hj2yIVjwC
         4ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152803; x=1790757603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWqTLAkW4i1E1lvz+cnZILkUyZ8Lt+Lp/+qHaxdTMmQ=;
        b=ur9UW+JZkO08Kz5cfL2lFAGuxRAfalaHI6orrwFn1qKfe8i0EvSREFxlQG3XUv0fyz
         tKTMK2iogebl7uoYjw49kkcfByyGQv85Ixa9kgt9oPThbWrL1+5i5VHiWTFNOEoChdoh
         tH1BEhHoH58NIWpm/iEerwWLF+iPo29TUDOk1fclvpLrcEuLdl7wifUNQGwJVxu5+tF3
         GV5kqiEhRYC5kc8blNFLE5lkEep6wiJ9SkHIpLFWZIhWeOHoHXwS5HYCiq4fZ1J9BRJ6
         LbOOsH6t2K+UTwGKQvbmc1GClkCycy44by38sCoT03yXa7GS1zzcVle7BLmW4t/T6BZf
         9zlg==
X-Forwarded-Encrypted: i=1; AKwUvBxt8ixTxHRXEJmGx8Na9NT0THISxy+4vOe9V3kDLjnSifmFX04GS+yVeQ4JENw8uOdDzVJoWDIJGrM9hFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kqBwo0OZv9pHVr93YO3AeWdpiJYzvh2hUlDytH/sfOA6/GuDRE
	xjDP70+aPy5WKaUcd4jHmxON7uQ+ohNAsgWz+k/h7h/3dWMhoBDcFApvlL22cCEYKj1V/H302I3
	GEHRpnwCw1PZtbU/Ezggk9dUzjP2B7Zgla+7s2ysIRIIqa1hR5m22q3JuSvuNZ+h0zyNpA5PurN
	s=
X-Gm-Gg: AYBFou1iyNEf9F0wGllvpD0aYdZ94KdiTZk+c6VJ9Q1XHtme64p749HLDolQBkjD0e9
	XLRZJHKlk7Gvt3BJ5nj77JFW1dJC7jvihzmEeSUAfKw+azey3YtFKq7xQnCCbsgnD7mv7asjLRo
	ehdLfUYVjjPAl7l2zxIwMZBggZLb59Us4XB/zn1yZBZMUYY7v7aTdbsAz7bvjZIpHk6x6TvQiDz
	Zqbybn1by+w0zy6MRsisha9gwv1VjDNlxGdLADV0A79+7Ap/bkGkH1bLpsKZI4V4KH6JCP8SXva
	CiFvZglWPs+Szs1jTsg2WbKJFPlJgWn1sZY+fHjt+x0CZpHW+fLHo7Gfrqv5EeYvRfPkCrJLbH7
	eB/PxSBCwv6I3gz6rUV/MtaPPyzwPfq1W
X-Received: by 2002:a05:7022:3a08:b0:143:26ed:2dd5 with SMTP id a92af1059eb24-144f917a486mr2880957c88.31.1790152802679;
        Wed, 23 Sep 2026 01:40:02 -0700 (PDT)
X-Received: by 2002:a05:7022:3a08:b0:143:26ed:2dd5 with SMTP id a92af1059eb24-144f917a486mr2880932c88.31.1790152802151;
        Wed, 23 Sep 2026 01:40:02 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm4701275eec.25.2026.09.23.01.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:40:01 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:09:33 +0530
Subject: [PATCH v5 1/3] misc: fastrpc: iterate CB nodes manually instead of
 of_platform_populate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dup-sessions-v5-1-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790152791; l=5975;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=2NFyyzgKwY0d5hBYe7MwLGfgwcNpViosAh7hxpTEgkg=;
 b=mONT7plOj00vBr7bPCkQ+mur2h34QQjSDvPD2H0kmekMmjOUwMSZwsS3ccbS3yc+6u4KmFLGf
 bYX09Z4pyaiC54+aur6tmXDbvknthilgX/NO2T3HuR2pJi8XmJEMcSx
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: _xZP1fRgJunnSqrgwFNow8OMKSaNISP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX4llpARZ5GBlo
 e84GkFdnUtH9O2AS+ERjcKYh6DPOr/i3DOK/R2ruW5FDEuQtjfDHPKzy6Ih7QwPzio4jXleFMrj
 SsNWO3wZxwJJ57j5N7KBhxb4iHiw7JYRpvDp1HRIh2XD4h7Ko0fgjfzOL02n+jnLaciZu23lAra
 kg0dKvv+ZWibfNa+nJxu09QMsVGkikzng+w5/Y/EsyckOQNmLNUvC5En/sb71oEtvOoVC4YvxvE
 9195EplYPbb5ZIhOxdl47O/usduves9Dt6zP3+6FZwxYTSODFi6C2qYW7T6MSHiqSq2hL7xqycs
 AzFkUJlCukPMJLCG4Zncq4piMrKPm4E1gA2MBSAZYA+TQ6CJNa7mzAQ0iSnyb2hwOkX+K7tn+NU
 z3aPE4GmnVWSUWypCjoyP4l6MGU0qSeFwocqYrRvY7nNtdpj1hB2gak+4Q7sqIq+qJI+k+VlO+h
 mDAiZOiu0EasINI5FAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX4FlliUxw23fS
 ZqU6IVgt9TSjuj06V6Z6/20T5bpP9OBwUx6NqyPCVpWZ8xOqM+zc427YZxfEUZBUPy5joblKgFg
 aPjLNe3xH6ai75gJyL35S3zuTwBvmCE=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab39063 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mOEaRXDu9pUODS4UlNoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: _xZP1fRgJunnSqrgwFNow8OMKSaNISP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

of_platform_populate() only guarantees that child devices are registered,
not that their probes have completed before it returns. This creates a
window where fastrpc_cb_init() may not have run for all context bank
nodes, leaving the channel context partially initialised.

Introduce fastrpc_cb_devices_create() to iterate over child DT nodes
directly and call fastrpc_cb_init() synchronously for each
qcom,fastrpc-compute-cb node. This ensures all context banks are fully
initialised before fastrpc_rpmsg_probe() returns.

Introduce fastrpc_cb_devices_destroy() as the symmetric counterpart.
Before destroying the CB platform devices, invalidate all sessions under
the channel lock so that any fastrpc_user still holding a reference to
the channel context cannot acquire a new session backed by a destroyed
device.

Since fastrpc_cb_driver is no longer needed as an independent platform
driver, remove it along with its match table and remove callback. Use
module_rpmsg_driver() now that only a single driver registration remains.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 104 ++++++++++++++++++++++++-------------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992ee..f20d3e5ecc81 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2333,7 +2333,7 @@ static const struct file_operations fastrpc_fops = {
 	.compat_ioctl = fastrpc_device_ioctl,
 };
 
-static int fastrpc_cb_probe(struct platform_device *pdev)
+static int fastrpc_cb_init(struct platform_device *pdev)
 {
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
@@ -2355,7 +2355,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);
-		dev_err(&pdev->dev, "too many sessions\n");
+		dev_err(dev, "too many sessions\n");
 		return -ENOSPC;
 	}
 	dma_bits = cctx->soc_data->dma_addr_bits_default;
@@ -2389,37 +2389,63 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void fastrpc_cb_remove(struct platform_device *pdev)
+static void fastrpc_cb_devices_destroy(struct rpmsg_device *rpdev)
 {
-	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(pdev->dev.parent);
-	struct fastrpc_session_ctx *sess = dev_get_drvdata(&pdev->dev);
+	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
+	struct device *rdev = &rpdev->dev;
+	struct platform_device *pdev;
+	struct device_node *np;
 	unsigned long flags;
 	int i;
 
 	spin_lock_irqsave(&cctx->lock, flags);
-	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
-		if (cctx->session[i].sid == sess->sid) {
-			cctx->session[i].valid = false;
-			cctx->sesscount--;
+	for (i = 0; i < cctx->sesscount; i++)
+		cctx->session[i].valid = false;
+	spin_unlock_irqrestore(&cctx->lock, flags);
+
+	for_each_available_child_of_node(rdev->of_node, np) {
+		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb")) {
+			of_node_put(np);
+			continue;
 		}
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (pdev)
+			of_platform_device_destroy(&pdev->dev, NULL);
 	}
-	spin_unlock_irqrestore(&cctx->lock, flags);
 }
 
-static const struct of_device_id fastrpc_match_table[] = {
-	{ .compatible = "qcom,fastrpc-compute-cb" },
-	{ }
-};
+static int fastrpc_cb_devices_create(struct rpmsg_device *rpdev)
+{
+	struct device *rdev = &rpdev->dev;
+	struct platform_device *pdev;
+	struct device_node *np;
+	int err;
 
-static struct platform_driver fastrpc_cb_driver = {
-	.probe = fastrpc_cb_probe,
-	.remove = fastrpc_cb_remove,
-	.driver = {
-		.name = "qcom,fastrpc-cb",
-		.of_match_table = fastrpc_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
+	for_each_available_child_of_node(rdev->of_node, np) {
+		if (!of_device_is_compatible(np, "qcom,fastrpc-compute-cb")) {
+			of_node_put(np);
+			continue;
+		}
+
+		pdev = of_platform_device_create(np, NULL, rdev);
+		if (!pdev) {
+			of_node_put(np);
+			fastrpc_cb_devices_destroy(rpdev);
+			return -EINVAL;
+		}
+
+		err = fastrpc_cb_init(pdev);
+		if (err) {
+			of_node_put(np);
+			fastrpc_cb_devices_destroy(rpdev);
+			return err;
+		}
+	}
+
+	return 0;
+}
 
 static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
 				   bool is_secured, const char *domain)
@@ -2639,7 +2665,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->rpdev = rpdev;
 	dev_set_drvdata(&rpdev->dev, data);
 
-	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
+	err = fastrpc_cb_devices_create(rpdev);
 	if (err)
 		goto err_deregister_fdev;
 
@@ -2711,7 +2737,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 				&cctx->remote_heap_addr, cctx->remote_heap_size, err);
 	}
 
-	of_platform_depopulate(&rpdev->dev);
+	fastrpc_cb_devices_destroy(rpdev);
 
 	fastrpc_channel_ctx_put(cctx);
 }
@@ -2798,33 +2824,7 @@ static struct rpmsg_driver fastrpc_driver = {
 	},
 };
 
-static int fastrpc_init(void)
-{
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
-}
-module_init(fastrpc_init);
-
-static void fastrpc_exit(void)
-{
-	platform_driver_unregister(&fastrpc_cb_driver);
-	unregister_rpmsg_driver(&fastrpc_driver);
-}
-module_exit(fastrpc_exit);
+module_rpmsg_driver(fastrpc_driver);
 
 MODULE_DESCRIPTION("Qualcomm FastRPC");
 MODULE_LICENSE("GPL v2");

-- 
2.34.1

