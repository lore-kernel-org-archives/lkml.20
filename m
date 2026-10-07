Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9683E497380
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363825; cv=none; b=drr8wUlEFUZszEonYRb15sVf2x/18O1LALukxI4AwuOj1UJ7L5FeN0U3EwOdYK0us9Qr8TFdPctkQO9eRuBnj6O3G8FcHS2UdFSFThtqtZ1bk2Ee9Xru9DTRKudz3cda8BRjT1vJH7lYMTNeSGJucEA7sQuCX9c0kKtkni1nAQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363825; c=relaxed/simple;
	bh=IaV+7Nqe72WztSaW3MG9b28k36h8V9JiDqMww/MfWcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q7n1xYXG4h0zO3MatR7pwu3FBX6Of8zlbIElqUdSBJ1rSjmw86Te4R2iFHt7ZTL/FGT8sQPhi5/SwLl1gfX14ldOamHP5oFD6dXWu7wVX9NuFa2RQokrEF/17fIear4gg7Gti6S27TLqK+x/n1DGWKYB0rqD9pJHq1v80c46ltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kB2dm+zX reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kB2dm+zX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jXqJ3810929
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MAZtRLhJFy1
	2wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=; b=kB2dm+zXJx90f6/0uOhrIF38Idx
	9imi1u8j6+5xgUMPgDc8MUySf/UCstELXstMXWYPFS4irlKEUwdq8K6WOmfWskRh
	GH4pQY3VMSU5ckYzqrlNE5XCmEsXia/eLx25EphRN6ZtsWKxmIDp81lfESSScWZ/
	4wa1/gWR/1tAbE+AUB5sEPAtUnUKoZqo7z5zQcQNqVGVPsvnt2frMj3V84kP229C
	ZS4ZlARhgGIfQKmHPwx0QgJuOYiyI+/s8ZQfuIbX3LCNs6N0652NwADUFlULJ1HM
	WtJ/z4KmNo6P5iWan1hk0ZhBztjgbCdz+fTU6nyx7O8oxQ0yOORfyY4Oh7A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrga9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:03:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so646372885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363792; x=1791968592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAZtRLhJFy12wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=;
        b=fk8LwN1SlTcjZvQKXWqH+PJyxND2FbcFuxZwHGwpfee5Rof8OC4ew4O+F/Mi9oskkk
         V1onCTDchcAR+Q6CZRNsKMx18I7CVjlnw0GxYvgAxEt0p4cpF/3E6x9kBNhLuF3yDH8t
         v+w+K4Bbp+7/i2GbfG0BavbsE4KqfmNv14MhTELGet2dO4a98sIUbMIcd72WZ6J5cQ65
         aVkogec+poy+Y93Cf20AQw6bR3J0+FM8MrDCFFfPKS4XIKBxYeqMV14ESF1igu2Bwvs3
         bVv9mS9UDWlsHhD/78dfYFEnjIWJfbdprCzV0pBtWWgz4oHOy1RMJOZ1HHo+C4Qr9d86
         +MJg==
X-Forwarded-Encrypted: i=1; AKwUvBz0pNGYX4ufd4j2KTEpS242jQbM0HGXNcXWRXtp7cuhM/JFzmgQjoeWW/rQrWk09RcwHC641hdg5HziUGw=@vger.kernel.org
X-Gm-Message-State: AFuF++n+01JOfXd4RsYxSM+EDO5QOj4NRQJDIIADA9Lf8CNpqjfaaZUz
	FgBOG7aiZMKCLgUHXTlzxnExIGsP9aFIcX8x+HeQqRIUvBmWW58kPAbSBtLadWnDucOUoFtcmir
	1OF2va52ua1QJTQhl0Xop6rkMATrns5unBlPHEa85t9Bn2AB2PfWvSg8ejX+1BOb5yho=
X-Gm-Gg: AYBFou3eXU8MiKvH/cADEiQYcNk0eeGq/AFaaPU6zcpApXb2+/+hthDJ17iMwILXwlk
	G0nnAwosUjI/eW9p5fuIIwGpAzoqy+4T+qmwvjKGAWw7SvM6gN/AiDWWOWdUNu6vzE8+eJJGwjz
	1pPwuCCrrYMH4tQvPWDONMVNEz6r4q4LApZnESDVXdC+qngQKA3ZnqAHvWOD7bShVMTSmyMV7W5
	2piQQLXey75b9OYNyBaJnQjcdNSSBFa0YnVV7Yx9ZhcuOQfKAhDdhWFPdY55WTuCPoHLkW66CEN
	JJPeD4oqHpkYx9X0/IQdauPjsyeCJHV/7xGW6yr10F31cgGT6KleVrNzY/A=
X-Received: by 2002:a05:620a:4091:b0:93e:4e27:359b with SMTP id af79cd13be357-93e9b7760d5mr316518885a.24.1791363792204;
        Wed, 07 Oct 2026 02:03:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4091:b0:93e:4e27:359b with SMTP id af79cd13be357-93e9b7760d5mr316512385a.24.1791363791531;
        Wed, 07 Oct 2026 02:03:11 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:10 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 43/45] media: qcom: camss: ife: queue params buffers in FIFO order
Date: Wed,  7 Oct 2026 12:00:39 +0300
Message-Id: <20261007090041.3732717-44-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac60ad0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Esc8-VpS8LW7SIx68BoA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2P1RQc13ahWV0qW_TC0AO6_aKfHvDAKl
X-Proofpoint-GUID: 2P1RQc13ahWV0qW_TC0AO6_aKfHvDAKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5rxQIRBJSmPP
 BdHUbvZpvQEkHhIRpm6GF37koVRvNiPW98+caoe5dIV0gDdFEBMnb9espE1z0NX6c0YtlNMtb0U
 poWBim10boyftK6ivtPsVXleLGOmO4070W0r0d9B7QSha20HQ3UfRO5JRFYm8d6pngUwj71V3Ew
 rP76gRiEhSAwUW8NRUdlvDWDDkUOWBk11vbVodIqD8FPfydLTlFLoaXznbqK0AvbS9SsFwTxhNV
 pRKwRCG97dkEaSOZwyZuiR+91BaDHmEagq+z3/IU9PAkrLG71JkB1CePAtNQDfXdcPjtmNDoILy
 vWXZNKOWSYCrufggI7iUYRgR2AbI8zZOOiOBn8codjxLuZ9TCei4gF9XU8lBuYUlR9OMMNX3SWV
 WZyMP9VWz8Uuwsbd/ZrFZxVSeJjQ48jxgmNWiy+QDIqB9zmjri77QbgsVGGnj2JTsWeah46VrKF
 EzPhjLmnHBiOHRqzx0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX1MIfmdbnpQak
 zDS/9Ne6C4XeQz79wNhJdvbutVyP3VVj2e0cZ7IYszmco+OzQOUU0W5NuIiv864uWVysJACsmIg
 +J7GYQ2b3OR9sB3mLQ8uJdyHZ79Nkts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

ife->pending_params was a single-slot pointer: queuing a second PARAMS
buffer before the next PP epoch0 IRQ consumed it would silently
displace the first one, completing it with VB2_BUF_STATE_ERROR. This
means a userspace client that queues several params buffers ahead of
time (mirroring how image buffers are queued) loses all but the most
recently queued one instead of having them applied one per frame in
order.

Turn pending_params into a struct list_head FIFO, following the same
pending_bufs/bufs_lock pattern already used for image buffers. Buffers
are now enqueued at the tail in camss_ife_queue_buffer() and dequeued
from the head once per PP epoch0 IRQ, applying at most one params
buffer per frame without dropping queued-ahead buffers. Flushing on
stream-off now completes every buffer left in the list rather than
just one.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 25 +++++++++----------
 drivers/media/platform/qcom/camss/camss-ife.h |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index ab6102fd1126..57fab10a87f5 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -293,8 +293,10 @@ static void ife_hw_isr_pp_epoch0(struct ife_device *ife)
 
 	spin_lock_irqsave(&ife->bufs_lock, flags);
 
-	params_buf = ife->pending_params;
-	ife->pending_params = NULL;
+	params_buf = list_first_entry_or_null(&ife->pending_params,
+					      struct camss_buffer, queue);
+	if (params_buf)
+		list_del(&params_buf->queue);
 
 	for (i = 0; i < ife->npads; i++) {
 		struct ife_video_pad *vid_pad = ife->pads[i].vid_pad;
@@ -1360,17 +1362,13 @@ static int ife_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
 	struct ife_device *ife = vid_pad->ife;
 
 	if (is_ife_video_params(vid)) {
-		struct camss_buffer *old_buf;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ife->bufs_lock, flags);
-		old_buf = ife->pending_params;
-		ife->pending_params = buf;
+		INIT_LIST_HEAD(&buf->queue);
+		list_add_tail(&buf->queue, &ife->pending_params);
 		spin_unlock_irqrestore(&ife->bufs_lock, flags);
 
-		if (old_buf)
-			vb2_buffer_done(&old_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-
 		return 0;
 	}
 
@@ -1387,15 +1385,15 @@ static int ife_flush_buffers(struct camss_video *vid, enum vb2_buffer_state stat
 	if (is_ife_video_params(vid)) {
 		struct ife_device *ife = vid_pad->ife;
 		struct camss_buffer *buf;
+		struct camss_buffer *tmp;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ife->bufs_lock, flags);
-		buf = ife->pending_params;
-		ife->pending_params = NULL;
-		spin_unlock_irqrestore(&ife->bufs_lock, flags);
-
-		if (buf)
+		list_for_each_entry_safe(buf, tmp, &ife->pending_params, queue) {
+			list_del(&buf->queue);
 			vb2_buffer_done(&buf->vb.vb2_buf, state);
+		}
+		spin_unlock_irqrestore(&ife->bufs_lock, flags);
 
 		return 0;
 	}
@@ -1499,6 +1497,7 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 	init_completion(&ife->reset_complete);
 	mutex_init(&ife->state_mutex);
 	spin_lock_init(&ife->bufs_lock);
+	INIT_LIST_HEAD(&ife->pending_params);
 
 	/* Memory */
 	base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index c38b96076a1f..9656d29717d1 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -367,7 +367,7 @@ struct ife_device {
 
 	struct camss_ife_pipeline_cfg pipeline_cfg[IFE_CAMIF_HW_PIPES_MAX];
 
-	struct camss_buffer *pending_params;
+	struct list_head pending_params;
 
 	struct v4l2_subdev sd;
 	struct device *genpd;
-- 
2.34.1

