Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD83D3CE3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326571; cv=none; b=NCQLVzZ2bZhassoFtbaJDdwWE7uAh+o2DgxzlVyWTuEEXw3Qxac4AYKgtFjwsn41BIQeA0UkHoD6F2/h3qvlJsIk2+EWxoZocq7cIZW+z1K9rw8fdFDd20EQe8IrCrGrDVUUrzk0C9iiuYK5hogleDpEXI0+IHK8EvMh+VIb2Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326571; c=relaxed/simple;
	bh=IaV+7Nqe72WztSaW3MG9b28k36h8V9JiDqMww/MfWcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RHF65py5pzpmR4IvV4FgcLmeJ1eQ59hkThh5A+Rp1jSEVv4TzU/r0KCBapHhrTIhpvrLKc/9gc6+Nwt2UNNOubgmWdb6qL2Z8dwIcp3BD4CZjRCZ4JkCHNBijj/hecF/fpovOovDVS56RuopHAONtUMqrO3/a6YeddWOwt4K9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3ZamGyq reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3ZamGyq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LebCf2011540
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MAZtRLhJFy1
	2wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=; b=G3ZamGyqebVX5YIEpmKYT7Imklm
	DZChHQ+Qsqbscd3JLJsjn50TwHAs3LhSaKQ6OkLPrTLu1u2sNU8/0KHRtjeucXby
	Ujxm9V4xkJEQab8S5zNV7gwm3iMPNI5TJUVwAjHyxCN9nVraqosddwC0/l7YXi3w
	DeGitE+NM9qkZG7lScH4KE+psRpyNquHEoZpZlX9THTxss5YYfi690FjLg5Dn3eo
	tgJPeJCVsUbdqFMQU9nxdq3XkcSONOlm1cFCyfIoIuDC+DpSm2kkbPli+S1jyK19
	GmTQT0ObwIdFnoF/ITubbeKPTkDpDI/NpKEVtm8a81hHW2rJJqCWYXU7gwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9u1v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so725264485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326513; x=1791931313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAZtRLhJFy12wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=;
        b=GiGs/YPg/nhHyMnGKkdG4+NA9Pwocxu8jy8kgGt6OQ5WWdgUoy6i8u531is5cDMPh3
         gGGTubB3BcujjtWxknkJszNPrAXrh96+jIl2jJyc+WQBrPvgwLqziHGz0/xOKsIxttQ7
         9D6DPZiW7OaNCQgfQMxHUDXSkBscm8e6v+3cYLD77avfZveHZT9ZWTSTSKR3+zwl6mrb
         qGRo/XerDfL6x5YfnNR4QYVR2lgr9Gab8fv4dNHjQQL/Og/WFhv0SobRYRoXl3M5xLio
         6L+hrmDcDt5QJNIG+eO2JFkpdcY5gInWgTnWex4PFcTGSPPnLhn3hm5hcQX68OV9FeEv
         TXig==
X-Forwarded-Encrypted: i=1; AKwUvBzxgdd1M6Eh47MKcdqM1OIpIG+I8b4OZrL2dnbY+catz/5VfEO0sDuzpm4x4Q6sOxsTMTqTY/n7+MvNdfA=@vger.kernel.org
X-Gm-Message-State: AFuF++n+VrRG/Zn6FTZTeQzYgpPDanPdary4RMnAL3mPtX8FxjUZ+z+i
	l2isQUVkxiILScOID4BR2CMST1PTIlt9yPvC/iq5mR4fmc9PjXz2cxM6KiPkmpUyoadOVdU1pRB
	pJMEPDbDnlk0rhEw6qJ//S5id/2cNUmljnh7WELbu8QU7ZVzRSnlGJ1h8TZj0zE85r8c=
X-Gm-Gg: AYBFou2d1fvQ+esoSMxLVavhpjnOXHQY7MrWJCznqFzOOTCV1NjLvDpeZcLLziZj/PD
	7kCKP9jfGtihPNwBVIxA9AMfkWM99/gUMwIJ0Uc6Qn5Piw7to6yt9OVcDKFpT6l/e6sOFiO6t6F
	bd42jPn9fU4KwdlWVdLFXPmcx4hTAxP4IYKTvmIqnMXv4WIFIvb3UdSFymiBbJ7ue7dB3sYn2NT
	UiQNVnm06bs+hRYLc+VNbdiXefwmHMGqvkofdq3GMjxhc1ECRD145MBpk77Ur6KPHaAFNoqpHFg
	jkP2p7SVEyKJ86nK9bASP8//ZDeIYEjIc8jVDXPQmSC4KeuIOn0S+uAhvic=
X-Received: by 2002:a05:620a:4011:b0:93e:980a:88c4 with SMTP id af79cd13be357-93e9b8d9b1bmr73209085a.83.1791326513494;
        Tue, 06 Oct 2026 15:41:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4011:b0:93e:980a:88c4 with SMTP id af79cd13be357-93e9b8d9b1bmr73203685a.83.1791326513025;
        Tue, 06 Oct 2026 15:41:53 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:52 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 43/45] media: qcom: camss: ife: queue params buffers in FIFO order
Date: Wed,  7 Oct 2026 01:39:51 +0300
Message-Id: <20261006223953.3382273-44-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac57932 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Esc8-VpS8LW7SIx68BoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX80UnSyI/9Nxp
 fp4/11EjRJZ7PscZEvXeAMlSfsukjnL+oupNL5pAOsRc2uPyIqaNTmtvksM0m1aWm4zk8npH06q
 2r9lTvXw9kbqMR5GlNhVaf/Exf1Mnck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXwmxu/B1z2UaS
 8e3WoX5QGfEngSVYiXvdfJ838OXtIlwlx+aKpMgkukOHvMEioj5Uc+N9/b0TVQgZxgqgschYkQP
 g4f2baKi9zJ5Pp3K/H3qRI1qxscv67rmQ+omNC0X6thR2bJ71BFBPGSserKKuawdyiI3rpgbBV/
 0oo1i5xITlmspatB4xNXj346ArCU9C2eS9zTown/5Htn7/5snNBNGlnoLP0fzjvIhdPyVn9EgOU
 BMAIXH5hC6iB4efj126Rjrv3RoSC2dpVG6Z+8HbhSO3EhkTXPobc5pQstT/J48KwVPC1F0FDs3R
 KbzujTHbA2JvZhq/rd+HHsba1+awxFTrC5aJbVFbiRmtBGdAcTK6hQzaeCv+bXXxAhL7ktSQchn
 HuyVyI72t07HkAc9+ZdQQvM5qpc2vbIZVvRowp9oIcoiNE4lsZMG+n4xWa1Htxu3FpDP+fGlybq
 bmZagF+wVLTzikUIcsA==
X-Proofpoint-ORIG-GUID: qxut8olbKRDzou2-O_WnwmiFtJrpoCz6
X-Proofpoint-GUID: qxut8olbKRDzou2-O_WnwmiFtJrpoCz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

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

