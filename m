Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC133CF204
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030401; cv=none; b=Vyjsbs6Xw4ZUSerjx7MAQRej83GOfmKp56MXgD1jJSQb/xeDt0i5BRAVMFzzwjRryxH0ApTjb4fBbRUQDGrcKga5RAY2azWy6OzU2jbiqXA+5hocet53ia5HR/k3RpeUc8bh19vs0vzMBWUE5MhqhAc92NSnYFrlb5oDYR00I+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030401; c=relaxed/simple;
	bh=zKDeThFxtOq/YnRewcVWCXbCWCJLJJZbkyg8pJ8JtkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5BRFGCwIZT/FHhmHHjBYngTW3pPPtd/iCMa9ybXtVPAINoYsNyAwqjuDTQtfGzUnGWzkiX9BQSXD3e/y2ldh86T9jkei1XZST3ZQZ6LG2GS3pF3ruMVESgHWhlir3G1CnD9Fzn//AtsFj6R/DkFYpvojhjkFw0K2/8K385o7XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVOa3WrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4XhRXdP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVOa3WrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4XhRXdP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pqRJ1289991
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0Z5Lavbu/aAU6/XKYFJLgGgtCEAsfv4RpfkQSQ7loI=; b=KVOa3WrIg3aW7NoE
	6EucednecjQi6/lTjAu8ExvYZ5psfP6WlLEG0VG88QRkp/lRAbQEhde1gfCTg7FS
	Eu7FCl34+nR7NmRBdwdLBGSFlc6ypAUM+8C37fI6mqQwLLaMdMzRw4WX5IZG+jCT
	nlqDiioeUeRWv5L9hJm5odktxwIFyKwOzQcbx+267yfsyRr3bd506BFUUPKBKfRE
	RO/SUpKwtOTHXcx4yGY8Jc/oNyVMQNYmXSPMpI/ZydEEDC6rqInkkzD2LUl3dYsn
	19q+TAdC0BQVqI0MGzrlH3BtCx+0nXan1cJ8VVM+l1oIe+f3MICQaAohsop+2Yb6
	l1cpCg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydjy16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so8570350a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030396; x=1789635196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0Z5Lavbu/aAU6/XKYFJLgGgtCEAsfv4RpfkQSQ7loI=;
        b=a4XhRXdP/9xBrc3ftD3m6oOSKm+V1ZnuusbXfP2jD7IOcwsRNaNz+N7ayZYe1zetJi
         4WO8yi7fqxob58dY93ibRAmpeGVJOBK6DsElmArFjVbGGrXy9g90S4/Q89JYDTPSaagv
         5RlYtoQ5eOJdawN1jKgzqG69R0LnwojLHc1iT72L4yOeSZzQ36PZqUi6N5iXL4hebGjk
         b+jlswkefLYiMUdrC8IuH6AGKCwZoIX0vELhaHDu8a9zDtPDCzRGMtFu53oUz4Hhi6Ku
         OaINaKGOLFhtluUPdo3lDX3Hy+ZA2NFIAo9Ee/wb4w2eeEFRfVUQUioxDo4iBeL7HyXv
         B/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030396; x=1789635196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0Z5Lavbu/aAU6/XKYFJLgGgtCEAsfv4RpfkQSQ7loI=;
        b=LXg88wfD6lAqwQGjmiaTvmHD49kM36rOyeekb3Z3jzxUfMaIiaM5IIte6wUwoSgcDS
         UjdcEao1I+7ti9S9cwrA8wRmXFAT8Couu9zVmNxRJ5TvLm0/h6xfk5yb3z/yBo5AZo+j
         wbGEhC+4pwm33HqwNr+cbdF4d2i4HRvmJ/8K37BHO66/eIvoqYmgeyTqTQw9KhiUgYT9
         A+Yxeo2VQiKglIjrstSfrkTQ5HPl88in33TbYBIQxObx9cIYx5eReayKR4mac+QiJ08I
         kpc4C+7CKDY4gpLmfCYIIHt4GPDKTIwqNsK9eNG69vrF5je+Ks7n0GxyAgjkTL0IFwmg
         Tgqg==
X-Forwarded-Encrypted: i=1; AKwUvBw1SJ3mPlbTPxfsSeShZ7Mq6ozp8fM0vgHhIfXwKtYxPQuKf9M5XMn56ell1gsiNu3g/usdOcxq9oXl8rI=@vger.kernel.org
X-Gm-Message-State: AFuF++k+PBybA+osDhaKtcpUxT8rp9oKL21JqAzgKHTDvUIknNoAkC2A
	THGudYJpPGQ0xbrfkp+9T9lUydtLxBDhF782QFuFl32UY5NeNixQZ/JIclbhmuSvHK6j8tgxhd9
	R7KwpVqr1Jy3mARxy4GWrSROnE6k0oppTTYLZV/SD5mJtrSVo5rgCKpfikM3fwZ+YQ9HgwEdCVO
	g=
X-Gm-Gg: AYBFou2r5g5zete7ZrjoHcNKo3hMzpSzaF5688MHSQdcok8MnfT4x53jGDsoIJqUXC4
	hQYle3hp3FzawSu0uk1TVea6WEUIF4cZZotevCd1kVpf1NHC59HQpx43Wh64M4ugEC2aWXB5DIC
	yhN4wc/jGRcTMt6+++iRaGyW7eZ/8qdNvzhhV6xgk5spi2y+DiBBRMp+wMgQ2hllMk0CoumvhaK
	mj8nKT0U9TflnDb+fvuOtc7FGOP16d4ZKCaIMnZZbr803QPKHQ5n4g9B8+DyNlvSIrYmQPyPri2
	H9rkOPDi9+TGYdn+JOPLDW7fs2IVnXi7Bc2mm6rOEKd5P+ZMa+Jy0ZmGWpzT/ogdu/HNYLS0kPp
	vnAWzXE+G5FxuB2Wx4HdKRgfnAMcZ
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39b262e4e02mr59286915a91.23.1789030396287;
        Thu, 10 Sep 2026 01:53:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39b262e4e02mr59286802a91.23.1789030395432;
        Thu, 10 Sep 2026 01:53:15 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm12398722eec.13.2026.09.10.01.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:53:15 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:23:02 +0530
Subject: [PATCH 2/2] soc: qcom: rpmh-rsc: Skip read requests on unsupported
 platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-rsc_read-v1-2-c9b7fa3cdde2@oss.qualcomm.com>
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
In-Reply-To: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789030385; l=3016;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zKDeThFxtOq/YnRewcVWCXbCWCJLJJZbkyg8pJ8JtkE=;
 b=QkkUAgVk4uFrrERBQketSHPu8nx60DpZNjIvFDoA8uDGS3Vg9SN+2RZSjqaSZuWTLWkXH347l
 OAEINjx0CoyBFIVn2EMTnVhBmTvwYluuW1xrXIJ6v9/i1EWb7X6wRvn
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfX65hCMdCZdv/E
 afrxPehDpsAx0f3/lCziuaP1cZblWklbjMUleiyCX1iJN7jeN4K6op1ThH1O7G/5o7Re9tC0ERv
 oNj1ipzG4Y0X5BgaYFi3Uvv+YVH/rtM=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa26ffd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=k3WCD5QtlwoTK8Or2cMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 1MRdiDWC4RnDtoxgtBQ2pRwE1PnhJBRr
X-Proofpoint-ORIG-GUID: 1MRdiDWC4RnDtoxgtBQ2pRwE1PnhJBRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfX5Nx+QIHnv2Ae
 BNuNtqAaD/z2XmZ/hYD2Qi1yMvMlhFWXNXzaZeVAHbItShEbofMSenjPqjC4mZE2luxCc+AEcMG
 0EE96MYSeyq/tQIbyYPd3lEzV+gjJSuQ/Y8Y+G75qAyZjfakM5lrqcJx5pawjbs6B5hgF5Nh4X2
 HKAAnVf6z8Xhbjj7UZRVcf5HB/Ms9c/eIAhdRS4RTbr4/EgdYT8JQFkmzcBUNjLvhn2ACMaAe/5
 xEk9O4kHxNRZOBNu3XxF8bWFaXR0qDUwKSXDpfsl337EYzI7e9f5LqkyBBQdAePhhKWjmkQPdtA
 cdWf5UZhX/qT0WcBpJRNiMPyHHcSXWXybWu/2T5NvxA1DX3hyvo0snzL15+zuBpRurZEqQ2+W/s
 FWBa7o06/ms63GoLBjs5/lDFNru7GpF/hXaADDyluuWEyu0W3eI2NPi85mBIq8D8w2v6K2PwaHd
 kGdimcsZyliPv6epCzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100099

On some platforms AOSS do not respond to read requests. Read request in
such cases will consume the ACTIVE TCS but forever waits for a response
blocking the subsequent write requests.

Skip issuing read commands on sm8150 and sc8180x platforms. For such
platforms return success to the caller with the resource level at zero
to avoid the caller taking any action on error code.

Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-internal.h | 2 ++
 drivers/soc/qcom/rpmh-rsc.c      | 7 +++++++
 drivers/soc/qcom/rpmh.c          | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 39441a25af9b..960a62f0e931 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -75,12 +75,14 @@ struct rpmh_request {
  * @cache: the list of cached requests
  * @cache_lock: synchronize access to the cache data
  * @dirty: was the cache updated since flush
+ * @no_rpmh_read: controller does not support or respond to read commands
  * @batch_cache: Cache sleep and wake requests sent as batch
  */
 struct rpmh_ctrlr {
 	struct list_head cache;
 	spinlock_t cache_lock;
 	bool dirty;
+	bool no_rpmh_read;
 	struct list_head batch_cache;
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index f84a399fa5dc..7a210f924af8 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -986,6 +986,12 @@ static void rpmh_rsc_cpu_pm_unregister(void *data)
 	cpu_pm_unregister_notifier(data);
 }
 
+static bool rpmh_rsc_no_rpmh_read(void)
+{
+	return of_machine_is_compatible("qcom,sm8150") ||
+	       of_machine_is_compatible("qcom,sc8180x");
+}
+
 static int rpmh_probe_tcs_config(struct platform_device *pdev, struct rsc_drv *drv)
 {
 	struct tcs_type_config {
@@ -1155,6 +1161,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	spin_lock_init(&drv->client.cache_lock);
 	INIT_LIST_HEAD(&drv->client.cache);
 	INIT_LIST_HEAD(&drv->client.batch_cache);
+	drv->client.no_rpmh_read = rpmh_rsc_no_rpmh_read();
 
 	dev_set_drvdata(&pdev->dev, drv);
 	drv->dev = &pdev->dev;
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 360242a315e3..fed2ea06f490 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -240,12 +240,18 @@ int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
 {
 	DECLARE_COMPLETION_ONSTACK(compl);
 	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 	int ret;
 
 	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
 	if (ret)
 		return ret;
 
+	if (ctrlr->no_rpmh_read) {
+		cmd[0].data = 0;
+		return 0;
+	}
+
 	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
 	if (ret)
 		return ret;

-- 
2.43.0

