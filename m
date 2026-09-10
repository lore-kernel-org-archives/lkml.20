Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41036EA98
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057873; cv=none; b=b+CejvdSDPfgwouOx1UCAGjklLrRXggRhuYiRr4kCub+kAjCAC7SC1m+IycpyzdMhmEsXWEZcO38fb9vUGQLB3r9fJR7gfQLn8OsVLPcSgqmU4+nZ6+5r1+0xNHodIVHkEahS+X/4K+U3bGwxXxX2S4Vf3/PScSfVH6cMHFgryg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057873; c=relaxed/simple;
	bh=kcJgGBv43uV4lQuuDHe4VjFldBPqvQ8pUtSwWNQ1PIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CejVX20tv9bfNsD63L/QjB5zsaDi86nJUdGgIrtfx3OhogWnFgwiAdPwNMDqI1F8OWuUq5wQeUUtNcPjL25vc19w7x88dHWPQTp/5YK32Zv96Rqq+sEzM3vg2z/l5VDhhegRAAklAy5D0ksXrbof4C9Yudke/Ob6xja/Gx0cX4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k46jxYaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ks85O+sp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k46jxYaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ks85O+sp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4IIr1275152
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m7yzWTdFaMYpCscxPwImij
	Ly8JVKI4jHgQ7Y/ei13oU=; b=k46jxYaJTuZcphY9IGriGaTx8KR/eHKegwy7iF
	mT3YB1cvTGLVdkkeJ5pk+eNt0AJhUzGvnklQlbKL8d9m3JJt4azqWnBN3SZd71j6
	tyqfPd+Kvh4tz3X+3tB+vpMKnq3+5YqNhwMiDTOQt9m7Z+BCdJbEaB/z/6I0+9FX
	fGCPs7h9qfaJWEZ9NO/daV7x9IqUSEGRLP9rkrFxfr9E+TbJwaXxG72c8+KhfI1P
	b9CDepIUA0arxpn62PiV8OPdbzSJMfvKGuaz0WLa+T7Xjx2Rx6Ve57MZQJMwfd58
	cN3g3qfJY5QKbv8L6co1n6IdAO8Q1U7QCppRIznbQa+7Rfqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkw90b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:31:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so5286792a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789057869; x=1789662669; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m7yzWTdFaMYpCscxPwImijLy8JVKI4jHgQ7Y/ei13oU=;
        b=ks85O+sp3zLzzbqZWdG/F8MCP4hN9OmTojOOa2H2w5vhHEOrHBc0UijtfeMmdNSeDy
         76Xj73gO3vjnibznEwwtOTU7iPaZy5BVzV9C/hywrLWW7QvslbayiD+jOQw06tc2Wweb
         rC+tfaMtuNnj08Am4Zll5vCW36K/S6+n8p817gkgEsOFTQy1084Ecjwjmmwzst1yUDcT
         JdIuKYySMic0N0GBRAwDhPs2bjp5TSqqgH+cLB2B2tmci2N4wvMcwFaOuFYDiD3g52D3
         WKevWuz2zqzy8YeVNrYVd0BSH+7bHNt1jAzdNpk1WcEvsb4Zxeep6hjtgUfzwDYqU8AB
         yElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057869; x=1789662669;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m7yzWTdFaMYpCscxPwImijLy8JVKI4jHgQ7Y/ei13oU=;
        b=id4MimTjX0mQzf2aiackqDKthJrfuquq7ZP1VKDHx24IuBypln48PV9c5VO2fPaaQP
         z27qQHltLGL62P/HYypMC7c5DcylQc/WQJRr3FrW2DcAI8z4kH6AVz/Xa7N/cCpJRXxu
         pl5DWeanEXu4eJB5UCNzKPZPJjRP+si957JZvAO+kzpANuHf48YgHNnrP3hFKAMMAtJ1
         H0WNdQBLGrxxZuj9O32dR0inUSt95nC0Hn6ulmyaBg3hvX89APkxvnRg1rI4jYMljhH/
         FINdtG6ql0KPS7sdsEGnFoby5AcYIz9/M7nDqMjHK4+lqjD8OTl7endvvL7aj0X/lzh6
         O69w==
X-Forwarded-Encrypted: i=1; AKwUvBwK8czj4XYrUB+cZh6gFudXzLxoPrkUmcDfLgxAlNntzRQruK8CS6uv0+z9y1M9AemxExXsouNBEMG4Cco=@vger.kernel.org
X-Gm-Message-State: AFuF++l5802DS9kPC7A0Jf+XFuoZeg7jdBMgpdE/Truona3ffRTIu3PX
	CBFHY637eVm4e3Qa2jqitgyuxvoB/aJaQ8XVkx/dSK/RztXYNU76+Chb9BP7/Xj6HqEs2OTCyRj
	LOjALcAkaSyCl8GzaOs2DLwM/KLoJFp1OojD4Bc10E+1D/mEUpCBVDNRDD2n7Snas384=
X-Gm-Gg: AYBFou1QXg9f9I5og6e5cIu1eTkDwJo9scqhKsqO0590fxXUq3HWWLGo+oawrYhXyhm
	PjC+JCCrPgmiWvZSI9Nv0lrsRgp9p814wCy2UTTg6AZRu7wXeKOCuUflEEU6C1ftobCsc9X1iLr
	RKc8ZGId5uFv/INWggrxSjhEakUNGyc7t4Lylzhd9Z8iDumwTi9spr4PFhKx+jeTCZzpL/PWiGx
	sbgRVlL+5+pjcZ9OFyYGDA7/RmMMhsdZzcVSnEsQMX96rglK/jxbgV01MCSzn+EN6YGfNLQmHPf
	TtlbkHByfZPu3u0WWj5qVnAW8AW1qPWG+O53lpOUYQH48fSV5S6TzgNgCbqi9/gGakTPqEtkFku
	eJEnaff6rI0BbxEtwMAUJPYolvDUhbbDjuNqFmQ6ZudKA3gZf+T1OKWkpJ7TzIJh06NFd+xQ=
X-Received: by 2002:a17:90b:2542:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39b2620a2bfmr59984548a91.18.1789057869018;
        Thu, 10 Sep 2026 09:31:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2542:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39b2620a2bfmr59984483a91.18.1789057868409;
        Thu, 10 Sep 2026 09:31:08 -0700 (PDT)
Received: from congzhan02.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm424320a91.1.2026.09.10.09.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:31:07 -0700 (PDT)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 00:31:01 +0800
Subject: [PATCH] virtio_blk: use synchronous quiesce in
 virtblk_freeze_priv()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-virtblk_sync_quiesce-v1-1-a883f8f31258@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAETbomoC/yXMQQ6CMBBA0auQWdukbbABrkIMsdNRR0mVDhAN4
 e4UXL7F/wsIJSaBplgg0czC75hhTgXg4xrvpDhkg9XW6dpoNXMaff/q5BexG6bcIqnaW6yqUJ5
 L4yCnn0Q3/h7b9vK3TP5JOO4vWNcN0oUde3gAAAA=
X-Change-ID: 20260910-virtblk_sync_quiesce-9b2c88d45416
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Ming Lei <ming.lei@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789057863; l=2010;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=kcJgGBv43uV4lQuuDHe4VjFldBPqvQ8pUtSwWNQ1PIE=;
 b=n62tXsCZlwo3B+DeASbqVIAWgz6tguB52thgCTLihVpIEtl7yEH7lwlKoXMLJgcunsnLFSFho
 hgTCaG1bfqqC9qqcQSpc+BLyUiPxSdgV0tmhJCYlBGxIekBRGveLDX0
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa2db4e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cmBj7K86vS66_wzKDlEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIwMCBTYWx0ZWRfX+zP52d/5uzMl
 q+GNfTigou2Sg2XsvQCpAToH/K8sN3Q383Tth5IVLslXf/fdw5JDaw3CM+LfchZtRTqQdP06OCs
 E2fe5DAVlyP7zddArXQ013BgJwmwoa8=
X-Proofpoint-ORIG-GUID: iGLveeiFSU56iH1O0nHqmfdR34Sg82jp
X-Proofpoint-GUID: iGLveeiFSU56iH1O0nHqmfdR34Sg82jp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIwMCBTYWx0ZWRfXz+476WsB8tQN
 QsBqNjGna12QC39BvOy0gbMIzSJmNuOy7voHPQif+ardkA7hw6N3Epb92JE9ARuoYDJIYB/mcOE
 P8n9BaOIz37znrROPblRer82PIl/xrXeOz0b7aBsVGg2qCrQGXi6Roo5O5fmTMsJoLIqTRPyWyc
 Xi/x6mCqa31RHNC+c0cXh+OFxVXTwn1tDcMHLvYck4t/2PC0zPnS1ays5tyuarMiBx1WPjEwXaW
 H/tUUd92ATrCPfkiLiDaiyKwYus26LPGUUYVjCQP6Wr2LFc/ECYofr1mOz//vqruLjXS9ae82eP
 pDvqCFSKf7pVP+/aovgNhn58br+tVW1w8MkuborZrAkoz+/ceHngwaC554AwUL/DNomCcVx8wF9
 j51CDvrN4FWCSwKzRmPYTSyvMBRs4JO1GFNusquMhxb31eTerWv9T/8a/kPeyUOjuyLLjbdUIf5
 72KO+qbNYAfxqEA575Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100200

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

