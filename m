Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A33F1643
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382958; cv=none; b=TW4GXwhcQ7ldJomXPOSY8mfxNnK2SXWmpg/rnxbY9BvkKnWuuHZ9mrTzN0ywnZxtYTdQuuUtX2hF+8tRVlZTUeGf0BoAfm41dS1wkRlrXW8khGkR+r8Im8qM/MuwNU2Jex7YagC3L9nHciITb8XTorSCb+EG/mHy2IXY4A8pPTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382958; c=relaxed/simple;
	bh=3TFWsmk4nygEarMrcHgUjqJqHhwx0C2YZ3wDVLywR6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iremb36wFf5d2hMunB9oyh5RqrhmEJLEXikgrUbIIwG1LE6aqlDSYI6Myb79Nk0S5gqC3ql6ZeL2P754kdSo/pDwslsBHjbK9Qp/MROArINJKxKqJoe/09YPuu6sJ5LO6afFsTQ+DKS0ZeldCy7HfJ08a4mFrLdJUTbcv7UdyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FqpCHKve; arc=none smtp.client-ip=209.85.160.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FqpCHKve"
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-530144b6ef2so2443441cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788382953; x=1788987753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MelvgAVPAD2i6TwFcxxB4mgOswGwKZ4Gv+Vrn4dDTU=;
        b=FqpCHKve8DY8s37O/bqYL//ry4uXHCHV1G6EA60Yr2MU+qkDOyTbA9GA+Pfc3gBgBN
         AgCyxiHM0qYZG5R4eWMuqKHZPolE2vxsIKmjTHzbw1Rp/Y0XF3NSj5oQBDRV2LLRhlxH
         GHIaxE/W/d51Rc5kLRaIKsEOqu/K/VQGK4Ack62rUvKz25oSH2kuSZm0AYB9w+OVKLEL
         WnZkm7cXCQ8TaPxAgnRviDXcexelch0Rkr9Go//BqanThBuKshzm5xP8iy6bIHPVRmpI
         HeCzsdXTNxAlJYSGwDEkssu9MAF2QY/7/VjvNmmRnlEBrc2YN9NaBT6ua+mZ7ZPYFGTU
         njmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382953; x=1788987753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MelvgAVPAD2i6TwFcxxB4mgOswGwKZ4Gv+Vrn4dDTU=;
        b=EMIT7H+QOJLu3c5X8KnQ2iNcp83dPU0ibgyv3ZkRkGjgoiDgRejFukQCcQUeiYJNo9
         HCIKVVTHOOp+HA2Brr4DvmV0GZYUbCLOT2w8QSB8bEmV2sq9SoRw2IB6Q4dQizqJrGvj
         +TLbf2mUddaF6WiQP1973xLJqKev7iraSf3xsE9wynd9pvwEmWIt8TqUZj0uPHsZJ68C
         ekW+K8Iz7Xp9mIKEPbg01Vo8muudWOHCsdr+vLqYIGdg6F2VllEzIonZNevkuWfw+sWx
         +Bg9G11GQEqwMy+YTiJW1HiWroA0qt36BKDSU3B9231oIAPu/qxlfVIm6zRa472AXqF2
         ua1w==
X-Forwarded-Encrypted: i=1; AKwUvBy4sq9KfnFKABFe7SQJOQy4/4dhGjuYuSijeMGPPK9Wy5AhKo9NUyTH7zoasB/CadSSeyR0dWp3vhjkS3U=@vger.kernel.org
X-Gm-Message-State: AFuF++kggeMzcX88oJwflw5lr/J5lq4HyIcvsa95kBesWaTsaATUrwkD
	kX6t64hrM5UR3a49Ch1Rwk+u9KaFaEBvDcrbppzctPjCVwGpPd52qHl/De3rqzt+Ui9GxbsG/8h
	nATbaPlqN+BbtN777mzNU3P322zL2B3Ff9XSgILUN5S+4EK0AwmP4
X-Gm-Gg: AYBFou1v8BueccWO91I7tr/I6rjGGhRanTOxWPSGCb1I4zNL4BMBEYKQJp59BKnLdw0
	jQFKteUw/wNcAguJZRFcN4ouICBtmgSQS6wtpdTuLes+zJMNLhRAFwfKLWKXIeZbL2UObIDrvms
	pqsyXvfThtw9jV34MayYyf637XlzO206G2jlQU5gRnqGAXJOImr2vc/Wc1m3ZRtztP06EP2b00i
	j0WhDNfUMZUB1slM5WuS4HBVe2/QVfuTq7Oy/Hy1/AC4BqEp5F7qws1pdxf355YpLE/aVyihY9D
	fGr6a/ZP2my1iiCX579vjauNHsIITERZsfXZ4g8mggP68r0R7/Bs+XO0rtR9BTIYSl+Z4XGFade
	ZifDvjibwU+/VRjWX
X-Received: by 2002:a05:622a:2c9:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53036b97d16mr55677421cf.2.1788382924707;
        Wed, 02 Sep 2026 14:02:04 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-530331dcdc0sm359051cf.28.2026.09.02.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:02:04 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (bond0.slc5-n17m28-k8s.dev.purestorage.com [IPv6:2620:125:9025:20::a31:41f])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id D182240347;
	Wed,  2 Sep 2026 15:02:03 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id C6726E40404; Wed,  2 Sep 2026 15:02:03 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	sashiko-bot@kernel.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/rw: keep CQE flags on iopoll requests when adding kbuf flags
Date: Wed,  2 Sep 2026 15:01:59 -0600
Message-ID: <20260902210200.2336720-1-csander@purestorage.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_do_iopoll() assigns the result of io_put_kbuf() to the request's CQE
flags upon completion. This overwrites any CQE flags that may have been
set by the opcode-specific layer. (For example, if __io_uring_cmd_done()
had set IORING_CQE_F_32, it would be cleared.) Switch the = to an |= so
the kbuf flags are added to the existing CQE flags rather than replacing
them. io_req_rw_complete() does the same with the io_put_kbuf() result.

Fixes: e26dca67fde1 ("io_uring: add support for IORING_SETUP_CQE_MIXED")
Reported-by: sashiko-bot@kernel.org
Link: https://sashiko.dev/#/message/20260827191705.D53C91F000E9%40smtp.kernel.org
Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/rw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 95106dd1d7eb..f2bbb0b1c30a 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -1371,11 +1371,11 @@ int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin)
 		if (!smp_load_acquire(&req->iopoll_completed))
 			continue;
 		list_del(&req->iopoll_node);
 		wq_list_add_tail(&req->comp_list, &ctx->submit_state.compl_reqs);
 		nr_events++;
-		req->cqe.flags = io_put_kbuf(req, max(req->cqe.res, 0), NULL);
+		req->cqe.flags |= io_put_kbuf(req, max(req->cqe.res, 0), NULL);
 		if (!io_is_uring_cmd(req))
 			io_req_rw_cleanup(req, 0);
 	}
 	if (nr_events)
 		__io_submit_flush_completions(ctx);
-- 
2.55.0

