Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701960;
	b=P0xWqJtrLiS/W0yatWWpn/YHYhrpiSVpv0tEyduHbDGpH185SXDbZyb7ysql0TYWNYuQ
	 7OAzfAystQ/E85/lxwj9Hk/FPJWSmvGEt8qsC6pARDKHrJPeq/lZ0FBPm68GiHTYHo/vl
	 cV4Hwau8MTJGxxwrrlTkuoFXjQQy8GOziQoAmp3lSuNXR3OQD87rs6pOfCLsi3mZyAzPD
	 I5wlWfTWURNgSHK/Zj5jk9xkAArJuPr+0ozfoBJYOvfe1ESdGq/X/tnbFn6/f67cXhyjN
	 nlSkut3NPwYX27tPVcmmwREJhI2xWG66qlzpjV86eC1MkHO89ptxSlEkfl5kj2+iIQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9OTHugQliWNMFHV9r9MfN3kHQpTez4X3FtLgUfekNy4=;
	b=Lahc0MrFNSW29hRAlQR/rv0wg4jiyxNl876KQNRi59WYEvLkv8e0k/PxE5lrikvzcFEj
	 bgkb7rM32e3hgWPLgSWl4VfWnU0q6SLpS4ReYescHRgzCWjA0ODyxlgeQ6GmG9JEYPBzK
	 ZcDHbsbG/y21rzBFc11QCesX6izo+CVRboLt53+0B3pr6ySwMQuFcpD8ekyIMVoQqyhBA
	 RpNTodMrr8k6nh5er7Hv123fumAMR92uCwmiX8bXRm7wGa4wF1YSn9FjKgGSzirS8j3ms
	 ReL9LhwBmax4AhvMZoqvmfJXhKsEI0PHeXxFdhqUdKcwgc0a1HhGnf6MjhABhoocrMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oUoSKOU/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hb2xmngy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D08606BA5B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D08606BA5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oUoSKOU/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hb2xmngy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAUk72201864
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9OTHugQliWNMFHV9r9MfN3
	kHQpTez4X3FtLgUfekNy4=; b=oUoSKOU/WSY8TyBJ7fYAgtZ2ukVbmoEFhacU/E
	pFUbBsoA0DUyxE2U7gz6X9Uz/XUlt3MtOEIN5Z5KZWYjWq+FCNx94Lt5JwbFqFDf
	+vpHiQ+FtlrT4kBi52kyFiIx/IHtXXuquhpalp5tzk55E0J22GMxhYQbNMeC//Uq
	F47yyh2MQrOv92J+g0PrwkbXwbBVDAu8qR0cpJaZG7va3P3jqDL/M8QJ857S4foS
	6Lnzkbf5iAAfgtfv9GKxKFyC/+FKvSDp3Adk/qg6A21MGXyA7ka+a/aeyrNzcLq2
	xQRuDDSs8dZUxLdcOwEVCGmsPGxPMEkLLreWgkMQ/dNCcOBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r39mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:32:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so3247660a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793701957; x=1794306757; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9OTHugQliWNMFHV9r9MfN3kHQpTez4X3FtLgUfekNy4=;
        b=Hb2xmngyhlLSIVdAk6SLafRLebLIo4wfzrKXn6/RQJTRXODvaQWhTybUalRBhqzjzv
         OIZeroiz+VRs/Nf0tNdQXzXjyUHBEgEHJPDMixp8Lg4HKhGVAlX3jfW63T1CmDnznT+3
         VvzNFp43+grWZ/OiTRfW00K3W6bTAGoLXCHL8dqC94zGHRO2kD/Ui3XWDG2fvJAE4513
         GK+ugQBxl+j3Vj+hNmgKQ5AZ28aWK2YBQDh81yxdNdETgRa25fc52SvrlsfrESi3WLpo
         rTCKH/H3mRPhJUmBKJ3OzwY9LoSdno/xfNaMbIiDRRvFAnG2ykcIhhs+IEHLiYH1c2QT
         ROsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701957; x=1794306757;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9OTHugQliWNMFHV9r9MfN3kHQpTez4X3FtLgUfekNy4=;
        b=KUFvmD3o11dkxg+lfqbK1FIKSuUAsfy1O+qHKN479YVGFa+S3yNhpTJteX2cqZjU5p
         3xV8Hbm2APv5W4A5H3+lyYgOWBhMIgSVN4ejIPJ1SLyfk8oRIMffQSy3IoRUtMs6TP45
         +bMAXXBm3seWMSkwGLLkiO+KFgBv9ARC54bYD4Ge3eQL9bqp0U6i86TgXTjzLvciAL96
         +PPEoxtP0CusWdcZ7HYyN/mzyhzVKDZ/4jjC5c7LKdCyvd3EA1iUlThmJr6rxW/uHkXh
         r2xyRzvD9y3v/WK6iskipZTLbQ9D3cfR6qXf2p25eSwir2eD0ipxg+t7gouzWeP7kxp/
         3Dnw==
X-Forwarded-Encrypted: i=1; AKwUvBz1pp5FSjY8M0fWtsWEPaLLXac2QRgMxIrBzoTeH/Ur9E93Vkyj3wh1688/x6jNb/lu4eVw5HYHXoJA3g4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NyNxKHIDMGVONPP31w65EeU+sbUCa2nAu69xtRAjBZI8xCXSN
	Ujj/+6sCeaAhvX3o8/OMZ9+ZRsD1zAmj3MY9aE757rjtN0P7WSBarZOqbq7evEOw6U8MQafIC6B
	6S7sPlofGUsqNn/telHzPm89bbuzu9H+vrppK/jJjzcYeZVN0hBGN2Xobmh+ikb+/Jwc=
X-Gm-Gg: AYBFou2HVv7ENBufZImKdYVYfFQZ39OFnq+tBB1Lsoyd2x7lxfOGeZZmA5pvOheDMyy
	Hk1rMUOkPnjxFmNgWiD2o/dZGuf2B9wW0K1NRNKpIFr+omMWhiWJcn+MBc3PfNpMtLPOm3OjRXv
	cVBsHgGbQ3ms3SCODCjyZ99VJlbQsyk6mBrbugyLaqDyP7TqBORBvf6JHP5DF65Ctd4Kv199B6F
	+FwCSroj/t88OIMlPnuFx3PK8mpJSfxoIu0IZGeS3t535zzOwBadVsVe266WgoaIjpqWkclTLC0
	iJdex3KkwmwDjoTaDmaJ7iuZUscQE70UZOvFZJCSsMJdh2JrgbERWPKKPxzidGZd5Gu6ZV0muVh
	dpHKqAIOr9A3yF5F+wS2ZIFYZvBrw5jaJLS0lN94fIlPCRsCJ6u/Im9LWV2PAS1r7bANj3bGOl8
	ph
X-Received: by 2002:a17:90b:2e4f:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ae89536bffmr9604447a91.6.1793701957170;
        Tue, 03 Nov 2026 02:32:37 -0800 (PST)
X-Received: by 2002:a17:90b:2e4f:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ae89536bffmr9604430a91.6.1793701956680;
        Tue, 03 Nov 2026 02:32:36 -0800 (PST)
Received: from congzhan02.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3740814a91.8.2026.11.03.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:32:36 -0800 (PST)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 18:32:21 +0800
Subject: [PATCH RESEND v3] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-virtblk_sync_quiesce-v3-1-f40233f9bdd9@oss.qualcomm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        Eugenio Perez <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793701952; l=2531;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=GA7vQS8Tiz0/LgX66p7Nd9+W/EfJ3aiCYcUb5tpLGpQ=;
 b=LbXB6Q5QCzunltowh2X7OUgrJOoa7ZCDRcYJximUm767xh12vRbVj9yQba6diwAiYryTaRG+W
 eTQIzHhKcO8DAINJrvgq0uE8bVDzdsSuasQJVRd2EDSj9cg1dYIik2U
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Proofpoint-ORIG-GUID: G8HGWuTJ7BW64NwBy69MGU4zyyY7PeUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MSBTYWx0ZWRfX5d4+i7MXkrJ1
 4TyrMR66AiL0pxkaJhKo1/CryL+Qf3/xcTGCvU8L4bwhHXwlbiUJ6BLPbBv4mWlTXg9YOZmnvJA
 1icYXrjsoeVfMCv+Bsje3x3OZvE+7UwF+kNDiF15fn0a4C/dRtotGEdOlzylEF2gCfygyxEp0Q+
 iKut/FVDVxKweKYnAAD2SCEMIc19yvrbQ7DgEwPi+DzDIM4RJgPPOYL8v7EnSBV2poYaAHaJhiJ
 e3F9dORfx7/+suSu3PAMrEMRjZlMbNDqq75QVwk5K6uFfQs2F5t9W1PjfCPeO021Ptp4fXpy0Ol
 qyXOgLB3KUntZOMnJNBxi90Q4Zlv+pQ6yJnAZdJ7B9RMUewGOtyijuV47MycrwRXpUXZjhq5rDK
 fv5WqrUzV6Y9KFd2PcGNxSmg3Hro5awTQcgbIJVm6Y7To6Nt4upx5w2xrVMObqUO4wplPz/hsin
 5DEtGs7Lh/ZiW/HdB+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MSBTYWx0ZWRfX4dsCQIsWsjDD
 rQfBLQYX6vq7EgPHYAU2HhSXEJvfxN7RRYIoZ2auN+2rSW19DIdGJZbn7hgy7LPKXZl31fbrlhg
 SWscptH7kjX9hINHxKQwyFpbQNMjfaY=
X-Proofpoint-GUID: G8HGWuTJ7BW64NwBy69MGU4zyyY7PeUC
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9b846 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=kkXLOB11zRU5SlhL2XgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030041

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

Fix this by using blk_mq_quiesce_queue(), which waits for dispatch code
that was already running. Keep the existing freeze and unfreeze order.
The queue remains quiesced until virtblk_restore_priv() calls
blk_mq_unquiesce_queue().

Fixes: 7678abee0867 ("virtio-blk: don't keep queue frozen during system suspend")
Cc: stable@vger.kernel.org
Acked-by: Jason Wang <jasowangio@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
---
Changes in v3:
- Move the race description into the commit log.
- Remove the blank line between tags.
- Add Cc: stable@vger.kernel.org to the commit trailers.
- Link to v2: https://lore.kernel.org/20260912-virtblk_sync_quiesce-v2-1-09a001549b72@oss.qualcomm.com

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
-- 
Cong Zhang <cong.zhang@oss.qualcomm.com>

