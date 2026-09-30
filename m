Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA69E36F419
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790738172; cv=none; b=hv2xtle+rj/mJZ/yP8JgPoy+Z8bkx/XOJwU9yDQO3bEJjmapGXmeuM/9B0ung3eHWqF7usaSPTFvFwi7KvGt1pit9tT8dF5p9UGhnA1thOuvu44Nluu4O3/3zX7G5sB6I82/bDoNN80rQ2QRxgmUDlr9hVZHeTb224+waxAVa38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790738172; c=relaxed/simple;
	bh=GwlG6UlV1cLzB6P0R4GVEk+F3ect+UN/UsEzBHwB1AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jn98YvCLM96H71U/QoDZYDUs29dTubo6Ry75BOx393YtZ6SAKQsYADLAGHq3xzWNmSjxs2YWuXo+eKXLhlkiirw2dY4BogHttaQY5bUEQiM76kD6OKX+1JBRmbyoH2ZfeF9xD81+6AlFX5ciVkwrF1u7jUal9y00uKvZ35RuXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/xGGOxe; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/xGGOxe"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2518362a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790738169; x=1791342969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fARVtGGuJPknRqNtIyIcoRVsEn2tgxMNe9tXK/dWuo=;
        b=Q/xGGOxebYAaZsHkPYxCys9oi3O24yHTgyhGAIGlI/QCohJPMXVfZC0vcM1Pq3Z5MR
         fJryvP9++EAZ1QTG+I/RzI1G3Cx2IK2/KYXZMRvrqGqGtpOvn7lGvJ5KhCeExz5x3Mq/
         QWDoU1MDiL8WrJDxIjb1sxgiN99L5Q7zJdxXGMWo7H+ga6AIWbz0Tl2iJCbOV7Zs3JXr
         b2AUmVM+X9vhccGRMUUqhDe+YYOEAB3cTQu2Qjxdd+VLVDQs1mHtoN3ozNXAWxDXCL17
         mTX1SYryQUY130Fn7HUhsdJOSDwYC0vlZEzhrWj6MM8WVw5Iqi8Ep3rzSq/lad4G5ZLe
         hiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790738169; x=1791342969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fARVtGGuJPknRqNtIyIcoRVsEn2tgxMNe9tXK/dWuo=;
        b=xEjE1qF9xEKYacsKRh7H0lbrE3nucRCBhzn+R1EZqk5j/2uowDxyfXWTtUw8wvk0Gx
         CopeWgG1T3DUBdMLrWXtoAKqG+tfeyPK6tteRxiN0Dh0r4aiknpG7TnK1k7xbOswM/2o
         NWAk0j9bkgrOZwfdTs5hZ45L8bQGBb2nHyTuktvmYYeLTcplKPBuhO0MgRp7uDKo03ke
         DM0AzFOS3xxyg+0IOWqSLp91ZBWDzFIXLAgWOtrG6UYbvO9l8SsHUuIMEwxPjqVqHCBH
         NeuTYirsZOSsBvuptzPK/SGMo9qRy1Uwxr90rW3HOTeD518S3IH2yGCkegd6duznWM3I
         QpOw==
X-Forwarded-Encrypted: i=1; AKwUvBwb3H/JelWduO//ZYQD5WGPlgeCGY+H3jI8qJLGvQ0scRjaKBLsPp/fSrtiUg4iq46VLVWT6rID+kw6a44=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDawsTFZ2AdxMB6QLF0pkCfTODb6Up8ab1iW8Uv1dVkYrvxJ5e
	9xT9036JxVn/HqapgFxPQ2uaozV5F0j2mKcQhLe/VKIunYoeBgHDZ4ItOr2u0g==
X-Gm-Gg: AYBFou1FEI7PANxP+N8N2qw9zCzTrjS/EsXUH0Y532ctmQ3S/0zi7y7IDEldrzxBiKL
	QOnetIjqPo0C5P6vGgStuL4FO8TXQ03V3U7lNTtNkbXknY0V7V44yJ0D0+ZBRR4GSE6y7KLH4vn
	uPWU2Y3BfpvOs/Eq2/Wwh02ZqoNRAGpaeHFrWkIOEmGNpU8YJW8uL7VGW2fvgc/XLn6zsS3EXph
	VvyRqtr1olqC1XqyU86Qus72IAgkAtKbqYm7hNfa0WSwtknfOHxgaMWamvcHRD3k+4xW+NbgFeM
	LDNXDfYzb5aP3hiQTIoO9NnCJIgPi9sD7NSG2v3ztr52nEAfaVqAHbEEeKoofHvUekhiPNVR2Zb
	05z43jj5MkMfjGvZu1O63PXzEl5s5U3WI6VG8A3VJBhyWO5yL1lYuV5fviegPd8i9KxAc+a9mlL
	3wgyEOCEdUX2+RjVY9K6DDGNlJ6c0WxGRm6VYa6+Zl2gXFEkP3pdmYGOf0Wf99IlPuv4kduGtoL
	v8sGa57ZgjCq67O3sQrWNX0HX4E/6JlnlkaE4pAqDvmrWURX62NRfjdo8aCtMnqa2BCty2HFje3
	KHMvhK45NQ==
X-Received: by 2002:a17:90b:39cd:b0:3a4:aae6:f4ac with SMTP id 98e67ed59e1d1-3a4d18e5da8mr47944a91.48.1790738169404;
        Tue, 29 Sep 2026 20:16:09 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce1c9045sm588743a91.12.2026.09.29.20.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:16:09 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Anders Larsen <al@alarsen.net>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4 5/6] qnx6: abort mount on superblock magic mismatch when silent is set in qnx6_mmi_fill_super()
Date: Wed, 30 Sep 2026 03:16:03 +0000
Message-ID: <20260930031604.70544-6-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260924073920.2782917-1-benquike@gmail.com>
References: <20260924073920.2782917-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_mmi_fill_super(), if sb1->sb_magic does not match QNX6_SUPER_MAGIC,
the goto out error path was placed inside the if (!silent) block. If silent
mount is requested (silent != 0), execution fell through to crc32_be() on
invalid superblock data.

Move goto out outside the if (!silent) block so qnx6_mmi_fill_super()
always aborts mount when superblock magic does not match.

Tested in QEMU against tip of mainline commit 62f4c998b297 ("Merge tag 'parisc-for-7.3-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux")
using a loop-device reproducer mounting an image with invalid
sb_magic=0xdeadbeef and MS_SILENT: on the unfixed kernel, mount succeeded
(rc=0); whereas with this fix applied, qnx6_mmi_fill_super() rejects the
corrupted superblock magic cleanly (rc=-1 errno=22 EINVAL).

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v4:
- Rebased cleanly onto upstream mainline commit 62f4c998b297.
- Added QEMU test procedure and verification details in commit message body.

 fs/qnx6/super_mmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index 797d8c238bbb..5f62df30467b 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -51,10 +51,9 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	sb1 = (struct qnx6_mmi_super_block *)bh1->b_data;
 	sbi = QNX6_SB(s);
 	if (fs32_to_cpu(sbi, sb1->sb_magic) != QNX6_SUPER_MAGIC) {
-		if (!silent) {
+		if (!silent)
 			pr_err("wrong signature (magic) in superblock #1.\n");
-			goto out;
-		}
+		goto out;
 	}
 
 	/* checksum check - start at byte 8 and end at byte 512 */
-- 
2.55.0.1082.g2b9226bbc0-goog
