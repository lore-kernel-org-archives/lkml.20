Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA73C1D60
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894113; cv=none; b=tA++hiTD3vKu36wzcvThv1khvPKFEdjBqjkelKnpvhIdpu5+/trxyFt0a86gHQI/SlgW4ALlg5oAUW1b5UGgaI0bkMyI4xFHpRejVmGWvM4/gZqBoU2+yLVl0fivQSY3R6JZho+zsfOVAscwJrWPxMdBxmfTCTn+tnb65Yhm4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894113; c=relaxed/simple;
	bh=ooNpW8JTLerSSYS5oKKFbYXh2GfP0xI8kf0/srn2Jwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=txSg9524hVaZitwQv3BYWeM8FvMzBaDoLslEUvYSy7VkZyOyUG2vRaOmurCkmr+BJQzfq4n1VzytYR+53jR+kIF/TU7GZzZWVYEtQ6YpnrE68GGRszZShm43RzwHGBP9dvTIXuHIToTcc3hr+wcRp46b9QON35rNNcAFadpM/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3KyARQy; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3KyARQy"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71e253c90so5831375ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787894111; x=1788498911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+L5wETtDoWmts2CARQJ7hOgr0xkLRcjESgYRsPtYLoQ=;
        b=l3KyARQyiN+u1Fz8oz2XgzBL6Qf0xLXmeR5XlXvTIrGSoiNiSdIx9/0ovPsRrBnidk
         xykJNABvXAuuRjTaQCptZpTvChoEriNaEf/CL05QUOM5myRqRCVSh27AVW6HZnKY4zIs
         lbDqa3vzoTN88W7BlfNWEuVAizhBdWTn2RRFfNgMspzPwnezFqjgpXu0sBlKdQJUJUoc
         47Vas6x9BVH6QLxRjhYDZE8ZU9hy1kDDkqx/YRUOe9FXmef32e/pQpwwEz/qermqNzi/
         BIo5AVx2nbOGoEZdLL0fATKDEUtUIMWvZ/vz4+JMb9lqLdUyrOLSznTMVPuWgZ0HNWeP
         jBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894111; x=1788498911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+L5wETtDoWmts2CARQJ7hOgr0xkLRcjESgYRsPtYLoQ=;
        b=QwoTeKIESCDlxvg8kHgqzLnjAwjG/0yRLMW43dfB3MgYB/04z64NDv304I8suwUoFa
         oGlEbn+/GpZxtCDGwgSn0IQIokeySzeo/g7zV3101BZBEyjqmClhGYfQgkfOgCw4Lz9b
         TjPp5YRX2G6H9OHSA4fXiCx0FPNR8VLcpzlQ6qJygsMU5ABCqsczFqmibooRC6rl5guW
         fl2Lzmgyr4PWbBrRADTgS3g9wi8b6Qj9WJCGFA2DaWUPzAxtVw8C6NBsDTpcr14cWTd4
         eo3aWH+Duj4VRKx1ks49IOYKqFbw8stdlrSZnkHvggrdDCht0Y/EByVrOvjEQOG0DokS
         +Ulw==
X-Forwarded-Encrypted: i=1; AHgh+Rpp7fxqXslJduXo3HDfj+SHcEwRRqibYnhhm6zq7xzVua+ZQYx3K3NRkd9LcGVX/bdRyA8BUhKVtlQxnn4=@vger.kernel.org
X-Gm-Message-State: AFuF++l3RlNldRhsxXvjZOt8teyEeY70QWEk0khgwPviLodsbAWzsK1K
	DMg2V9+tgcZs4gCGAZR1iVzKKo7bAuyvEk5ySRJ389bS+HcyBqs6AC4F
X-Gm-Gg: AR+sD11KzcsXR647nOlmTNo23KNDfGFoGqaDNA42s9EaSgD2GYBXvEXIXn2CskmJS6q
	G07ZUHMnRtF9eDRMGRw9UOYZAk2HQRN4kAyaREfadP+j5Jfc2hauOMaf/Zi9AeRKHvmDGERbw0h
	jQjoDX5vJRtB07HhosMGbf+I49trtyyLA5+ByoX3Hzn2SpffJ3IK+/dBR8zv9g7xDdQXJefdt4a
	HUYLh+lpOJwvo64x4svNy6K5mYFEltP4Npf+6ZWxjo4TpXDQXpIas1+P5SnhJyPUQsn1daDrh5F
	2q3JHgv1nMoFuvO7hby/mruARc1mgWrXtN7n+IWl7OHITJkYsgxmB/lILWPnl7WRCxL1dPbZKgz
	4JKlJKrZAzJjq+Y77SBCiV6W3YHqKn550V+izRBLJno1YMbz4vINY+3/LZqdW+jFY+MwlYRoycZ
	S/qFUliw3yRAoJxkL2tG+vBf55lmJXTm+kAeLhPkeNGLZu5tVUK74RX0/Bj/qd3/kpwfEhW0tIv
	w8MPwMF2KYexT+8DNxUNAStGIH5GXMhZ9Gu4hfkbc0=
X-Received: by 2002:a17:902:cf0d:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d74def3ffcmr81309995ad.7.1787894111223;
        Thu, 27 Aug 2026 22:15:11 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75952ea6fsm2011745ad.21.2026.08.27.22.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:15:10 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: imx-jpeg: Cancel timeout work on release
Date: Fri, 28 Aug 2026 14:14:52 +0900
Message-ID: <20260828051452.1940559-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mxc_jpeg_device_run_timeout() signals job completion through
v4l2_m2m_job_finish(). This clears TRANS_RUNNING and allows a concurrent
v4l2_m2m_ctx_release() to continue. The timeout handler then accesses
ctx->mxc_jpeg once more while releasing hw_lock, but the release path may
already have freed ctx, resulting in a use-after-free.

Synchronously cancel the timeout work after v4l2_m2m_ctx_release() and
before freeing ctx. The cancellation must remain after the mem2mem release
because the timeout is the only completion path for a hung hardware job.

Fixes: cfed9632ca8e ("media: imx-jpeg: Add a timeout mechanism for each frame")
Cc: stable@vger.kernel.org
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 725e94152884..dfe3b1ea6bb4 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2805,6 +2805,7 @@ static int mxc_jpeg_release(struct file *file)
 			ctx->slot);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	cancel_delayed_work_sync(&ctx->task_timer);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
-- 
2.53.0

