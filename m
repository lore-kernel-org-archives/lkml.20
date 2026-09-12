Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B837189C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203174; cv=none; b=Nmr6Le933LHQD6hxlSQ4WcO/cBIq6qa98RW/kMqKy3UHoXTVMHCW9YzHgGRqRoAQwahKbhggoVl/C4ce4MynQGbUVqc/x0IfQBWD1sjWUmPTxMGeSGGapEMa7eyutzOwOAo4V2D+mYlqNhAkBkE4qJ/y2sNMSxYYOWGVmsYH0lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203174; c=relaxed/simple;
	bh=dquZraZjSq1eNM+T01tcQIrz2JYvFIRH7UkrcXngR/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ERQMp4zbbm0j46TYFHwZqVGq+HyouvTxUij9xQRMmM5dRvXvX9+cL5P+3BDH8xFB4OFj/MxbD3zYRJsqHOcAhrelqq0c1P5UvgBLlDURD5R28yU/R3bUPxT79t6U2EMsI7E8n/b/DbhZB6mkkB1vhbeKAPwiROU3pQomSopLTtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAAHydwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e18SaTpT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAAHydwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e18SaTpT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C84wrj2443090
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JBHFKISvb5GpVQD3ZIst72
	axNU1WVodRSK6PtMFk5sM=; b=cAAHydwN5dNGUGUMFXpisq/Iq0RO/ru1PTNKhK
	zgjYiDXkNln1quw5I50Sb0gMm+HcficYy3izkgODOkw/NFQtwDGX1JXUJUIWz3Mo
	/Wtf23DYrFhkN87N6yvH+3JCLxQIBjEZ9NQTMydXhjCjkveTbXv7HxuUHO8YoIAQ
	zvuWkUX6hPc1M1/no8didy0oBYmUOSZZFBQZfU65re+5FtB1p3HSWXGcfy6rMANp
	ctPggWEuW9xwZ9MqREqofKCXa+zTGNYOXEYgadusZpCdb2iRvMfNBEklVP6pEqPq
	Gv9PKaEPu83VwK43p0Fce7HgvaylYYroKO7/TOuO5DLUwjxQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c0hj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:52:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso1499179a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789203171; x=1789807971; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JBHFKISvb5GpVQD3ZIst72axNU1WVodRSK6PtMFk5sM=;
        b=e18SaTpT7w9K4ZnNcaORhoMNCx76gTmRjQv3GXtA5M3MNxNXXsnXnc3RhP5ObMAqnW
         1OJD/XoQ0hiOUCF8ObU0gxA2S4y1sjOEs9OQIn4nfkE7KTvdRwHXAW1XlC3auW8egpgK
         1qp7z+JjE7gLrugInazxiL59UF2nisF725LV2CWsCyLG8OBxfk3Pg6TEyun+SOiasS2F
         vS0+L+uSsBJGNk5QSiRi0yflc6Nl0C03oV3F4CrPbms6+uDmFoje2PASpmd3ky/ZHZLN
         ZwW/sJ7neqmT4uHEo/C+sm3th2/Kaaz/R6OcrBq1p2HE1Z/RCTxoFGXjXJUHpUhukpTp
         jdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789203171; x=1789807971;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JBHFKISvb5GpVQD3ZIst72axNU1WVodRSK6PtMFk5sM=;
        b=klPqcuRorwcFu4lFw+z4UMF2ybE5qgev/55h17YrSCOo9GV8y/xCe/h580WwXWzyvz
         VA9f4Gv1OkC2eUu13jAycj8iOgvORb5VzgcpJL4UlVQQX2K9+mvfc9CfVqcm75XwufEg
         +zHwE5u19aV4KYqueuMLkA47EOupbUJY8Wj9EMp7l3TK02PywRp8BaRxg6NO0XiyVV8k
         bP09FprJicwqiEfVsA3PHds/yqhCTPfM7h2gx4ENMIoggg3R+SKP12gBC6IzRkSmTvg6
         VncXUglx5zdMLewkE6k/fQW2YDZwyq+pZuiqxxWcip50OAPTLL+X3jHK4i7Efte65lhJ
         WxpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQku+otSuSMKcYJUdaEN76ZHoDWUZyrRoYomR8MTPuSs8dk1d79KkoLbRxj4koR1B0cLhE4/zJHFb5X+0=@vger.kernel.org
X-Gm-Message-State: AFuF++lspkQZ7ZbMqUKwQx6nA2AuSmR4Qle5i+E7O+deV3sUOmY00weF
	w1fsRnMpi9A/JMLVsTRxUr5GkyzkmcdfTj1h3x0FoSXqdAIPLf4A7Bokg6ObVUH0zoJBIHR2Kv/
	xwPM+UzkoWFjZdSgjVQThbzaUQC16yuoLH4MfuY1YNnhnLhaKrkwTCeC8zMO2IhItcpY=
X-Gm-Gg: AYBFou33vZP6py2QJt8/wJ5C4Yhmy9yftxhHc/K+Wr/OnYSwY07H0jWJ6M3wIljbDpE
	8tXb0eQtpdf/u1PKXjOCawBmoX9qviasPrHXpx0lfXoUgwrVlIIdC2DmZZ9SeiZLFrTMsjgYs1Q
	kiI2oY/nmZTSSOBT92XKxv2pRHC74Sf8UYlmmUta9w/I/X42/oMi5Ln1d8Sn5Nf782H9yX3sOBN
	TTEZx0jyKrZfeakhnN7OVfHBHt36jDR/VWDP8SPjZbxYmqlcqxOP3GHnAt1/Y1V+GxPHAhQ6KmH
	c26ejBabi3ru1wNH1tM0Lmf9d3ndWhT3E7qtj0wWGm1HY+5gSyl/TV0tzQnprLG8ibHblm2nA+9
	jkFiM9ZwnzLj+atKY1XuP+PL714zaWQj91tgX6t57S9YP5e+vHhg/BBso1sDEhc65kOnfW/Kt0g
	==
X-Received: by 2002:a17:90a:da8f:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39d9bd6976amr12162606a91.9.1789203170740;
        Sat, 12 Sep 2026 01:52:50 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39d9bd6976amr12162576a91.9.1789203170296;
        Sat, 12 Sep 2026 01:52:50 -0700 (PDT)
Received: from congzhan02.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9afa367bsm2721832a91.0.2026.09.12.01.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:52:49 -0700 (PDT)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 16:52:44 +0800
Subject: [PATCH v2] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANsSpWoC/22Nyw6CMBREf8XctSW0PFJc+R+GEChFrgKVXmgkh
 H+3YNy5meQkM3NWIG1RE1xOK1jtkNAMHsT5BKoth7tmWHsGEYo0zHjIHNqp6p4FLYMqxtlvlWZ
 ZJZSUdZzEPAU/fVnd4Pu4veVfprl6aDXtX3ujRZqMXQ6v43vvp+D/FY4zzkopo0Y2EReJvBqiY
 JzLTpm+D3xAvm3bByMsulHRAAAA
X-Change-ID: 20260910-virtblk_sync_quiesce-9b2c88d45416
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789203166; l=2165;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=dquZraZjSq1eNM+T01tcQIrz2JYvFIRH7UkrcXngR/g=;
 b=0Ru6H5o7DriZH6nGIn+WEPZQ8StS9Rizbxvz8EIwzzUUBVZ0EF77mcdQDEO7uy9EnjUAdZw7+
 t7tYlt2DxODCqquyJaKo7mzhK7StK0v9KpZ9C/U5sLB8hfQCB4cYQMQ
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Proofpoint-ORIG-GUID: pHoohVsiCwLQFxJSctEOqqWgkwGjW-SM
X-Proofpoint-GUID: pHoohVsiCwLQFxJSctEOqqWgkwGjW-SM
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa512e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=roso6HiFfYj01OpyUwUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDEyNSBTYWx0ZWRfX35ZqUWy7RmfA
 Dzar+TQETapVdpqg/Umpmv1JU+38iC5d0u8u1zjyPn9gP9WFQMeDzlOflpyW6FqAPtw4fjae/Ts
 RZWW2p8W0yxWCreImgTFS1pEc9TlGJTrCXQ2yd3JY2UkmtW8zTVUJ6VDZgCj4ltGC+ycMpFQkT8
 FaB3HfGxy2R7su+9PaPV8PvCcf+1M0/+/fGCY2pg5u8dQiVTSzjfjOljTt86EoKqYPVlhj7V64h
 +fUBUXIZ/ikSPSeW7XrXknq/lC4Ai5+BFzELwrOtWObEWUvxdziHxu+pQkUsOGrpvnIOgDjtAeQ
 S1U1yu/9qXT2r1uSqZCI65QXQCD+n5qGKx2hMKStQPFrsYekmmV6NUqXQmwkkbMa7aEHBahP1Mh
 qfORJ0d6t6dPwgkPmFMgekau9sCbUQWKK0J0T6HZwDSYyWavIi84Dw0m2VPF+7BeupQokDvkXDi
 +MRID/JT9V9Glon608w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDEyNSBTYWx0ZWRfXy7/i/lk07AmW
 JUL56JPFgHGc82YBFDyCCe/Deoc7fiIA/syV2j3/3WLVEdY1JYLB02PCtQgHoLmAuSa7rjS+5z6
 yiVroB+CsqnRsoU9EF+KFwAWzd/Dops=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120125

Replace blk_mq_quiesce_queue_nowait() with blk_mq_quiesce_queue() in
virtblk_freeze_priv().

Keep the existing freeze and unfreeze order. The synchronous call waits
for dispatch code that was already running. The queue remains quiesced
until virtblk_restore_priv() calls blk_mq_unquiesce_queue().

Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")

Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
---
blk_mq_run_work_fn() can call blk_mq_sched_dispatch_requests() through
blk_mq_run_dispatch_ops(). The dispatcher checks QUEUE_FLAG_QUIESCED
while the flag is clear. It can then be preempted before it gets a
request. At that time, it has no queue usage reference, so
blk_mq_freeze_queue() does not wait for it.

virtblk_freeze_priv() then calls blk_mq_quiesce_queue_nowait() and
blk_mq_unfreeze_queue(). A new request can enter the queue. The old
dispatcher can run again, use its old flag check, get the new request,
and call virtio_queue_rq(). At the same time, virtblk_freeze_priv() can
reset the device, delete the virtqueues, and free vblk->vqs. The old
dispatcher can then use a deleted virtqueue or a NULL vblk->vqs, and the
kernel can crash.
---
Changes in v2:
- Cc stable@vger.kernel.org.
- Link to v1: https://lore.kernel.org/20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com
---
 drivers/block/virtio_blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 32bf3ba07a9d..7a570591e040 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1595,7 +1595,7 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
 
 	/* Ensure no requests in virtqueues before deleting vqs. */
 	memflags = blk_mq_freeze_queue(q);
-	blk_mq_quiesce_queue_nowait(q);
+	blk_mq_quiesce_queue(q);
 	blk_mq_unfreeze_queue(q, memflags);
 
 	/* Ensure we don't receive any more interrupts */

---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260910-virtblk_sync_quiesce-9b2c88d45416

Best regards,
--  
Cong Zhang <cong.zhang@oss.qualcomm.com>

