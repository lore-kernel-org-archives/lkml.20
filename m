Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924446A611
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496655; cv=none; b=LI7kMOdLqqT71WqG0H/uCh3TcrBrJYzEEcEzhWrwLAnySRBXpcHvbjd59AbVCqQq3gM9dviHp7uQv9Sh1ZU67cMjjuA/MQaps84uTWEQ8E6YDgkCeWhggAn6It3YIjfALdxxeq256AkKPWiN3aEmgJFJFe3dNwkGFsmcYo/MgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496655; c=relaxed/simple;
	bh=bDiWHJShk6i7zr5B6FyA0afPk4sRorrNdqSU9Sop/mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3Qn2DnOmUh4iUTujjGjMgkoG+ph4hDgpAnPyKyqTmhOG7fVY2JMSUJVwmiOXaEGqdS6KCq7CmxKW7faEebn+oiBAuKPj9e5rHFXlpZnwqNDXUmRmVAssE5thnBwwm6yd4OE9F730je033fc1NeOkZbj/TBlI3+w7f22RrDlc6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpPUFyqt; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpPUFyqt"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7ba2ee12f65so68753137.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791496652; x=1792101452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Sb97aFV3br+uUs1Uh+s0Ki4SEZXUgdRiOu1c339JCo=;
        b=HpPUFyqt1GKQ7P33WF3QzGANelh1SAMVv3lxkDclhC5jhJ+iF1G1Ls3eMvv11xfzxg
         URy4cGXLsWqXff13jtFAm1o/wjd50P2Xi8BaFy4ScvzAhK9+1cv828bAWGstIpOStuu7
         OFD1JNYM4hXjRUbLgkCd1zcnCww1+FvmYIs5fFiSs+M9OeFKGTipC80GXkcoWyJ/UyrJ
         DVkmtjlGthiA9wQV/4u16OADkYg8NoiN6c7huuZ5TMNVdnau7F16iAoDtikRUMAXx123
         9ju7zegJ92XnW8XAKgjxVpp5VlB9fl7HwnCtdIM96pejjCHq1VqAqFZ2ISHVyWmCLCeL
         k0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496652; x=1792101452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Sb97aFV3br+uUs1Uh+s0Ki4SEZXUgdRiOu1c339JCo=;
        b=LcEyZ0XplQgjPmvBHqp22eFfDdpSdFtpa/nGVrrRVXxOYFd4UIonkJ/7GLIe/LohdW
         vIQvFQNCbF29WDKmrbDK2ilHZJ0LPkEap/rdHhdjTTga8JcEWPI1KvndcAgu5GW39xca
         fdJd9sgKZiPIrodlUcF4DfZS3Xw8pxI4VJ8KEQd76nR7QqsZtBJ1nPxRcQtwaLpG0PTT
         pjj2S0PAuVUoulDqaqeFxfsTKReYPpy2GWN6jI7gl+4paubTOz6A9SOPgyy4HkBfJbsq
         Pd4awuwRgaYs6MhhIUMQqht12uv0EjaAFDyKCefPiHk35pE82TTYpcyrwIRMoDlC/U5d
         4Dsw==
X-Forwarded-Encrypted: i=1; AKwUvBzmEvhLVsTWQHdOh1uB1A75Jxn5lpTbLLpqfsec1DMGCObmyGvGLcHRppA/cjd2/Tv2SDuMDKX4xbPFD+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+7RxMOsjlS0lGq7nqk7GgvgnVgi36BtkiaNbCdCJk81SsulW4
	jRd+wfHr/p0BTzcYhSmkjHe6GlI0rLIcleTuhL7pmnJCiiqvibgd+l9rkl12QXZvru8=
X-Gm-Gg: AYBFou3pPSbLm/SxIU16N/no1LzIZmmN6LUA8PpMt+qqcVKMtBHkiKeDv/TkiwL5qAr
	uCDeqqasuY6HLVQETPh3OlIaVKYixycDtppK4VzivrepS67BNGywKlDqeXeea5L/CX+lySfQbnR
	s6Pw3DVQh1Fttl/OC8RdyQcbKZoTPLZGbD9Ppgf5zGVqYO9jOsCtv3f5qq/IXa3nDb0UvyOaYrk
	z2iNEcJT52e/PFPjKeIw74rqRAfrzvIXvjx7/9lezfJORnHNXseZQLuD9l3CvlUPXVDzOaEPqL1
	USbrWjf1aAxkN26/5khWqrLlc7/GdVNuGQbhh+JkqM2GapQboitNjdNRi9zjUfM3LDiGehl2Ogc
	4nKEsEdt8OjBIG3S9Y7axLVM3W4HW7lAi2qkQiN9c0xGfFm+lTekFnmZEQlKVgV3jZC9tB7nOr2
	LMEdobtjumHQYtqnbpOvicGWyj9kqIehzmxilPYL5RKujtCNAq0Ly/m28Gtd5e8xjoc6DfSz4T8
	boJOQAQqsyFryQpJfePbLTFtXNOWPPgrjPT3zDC2ICQ9uz5ICgWLvrSXH3il0ABliFFZMdFBZZh
	Ack5V3j8TN2Z95fjYeI=
X-Received: by 2002:a05:6102:a4f:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cb367883bdmr61294137.1.1791496651822;
        Thu, 08 Oct 2026 14:57:31 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb353f802esm233301137.7.2026.10.08.14.57.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 14:57:31 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: Sanan Hasanov <sanan.hasanov@ucf.edu>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Subject: [PATCH] scsi: target: rd: Reject page counts larger than total RAM
Date: Thu,  8 Oct 2026 17:57:07 -0400
Message-ID: <20261008215709.46014-1-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

The rd_pages= device parameter is taken from configfs without an upper
bound. rd_build_device_space() uses it to size the sg table array, so a
large value such as INT_MAX makes it attempt a kzalloc() of roughly
64 MiB, which is above the page allocator's maximum order and triggers:

  WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof+0x294/0x874
  Call trace:
   __alloc_frozen_pages_noprof+0x294/0x874 (P)
   ___kmalloc_large_node+0x64/0xd0
   __kmalloc_noprof+0x24/0x54
   rd_configure_device+0x74/0xdc
   target_configure_device+0xa0/0x1c4
   target_dev_enable_store+0x4c/0x5c
   configfs_write_iter+0xec/0x124

A ramdisk is backed page-by-page by system memory, so a page count
larger than totalram_pages() can never be satisfied. Reject it with
-EINVAL before allocating anything. NULLIO devices allocate no backing
pages and are not affected.

Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6")
Reported-by: syzbot+fa495e1497c48a6ed885@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fa495e1497c48a6ed885
Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>
---
 drivers/target/target_core_rd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
index 092d9fe0d..3700cc1b5 100644
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -14,6 +14,7 @@
 #include <linux/string.h>
 #include <linux/parser.h>
 #include <linux/highmem.h>
+#include <linux/mm.h>
 #include <linux/timer.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
@@ -188,6 +189,12 @@ static int rd_build_device_space(struct rd_dev *rd_dev)
 	if (rd_dev->rd_flags & RDF_NULLIO)
 		return 0;
 
+	if (rd_dev->rd_page_count > totalram_pages()) {
+		pr_err("Page count: %u exceeds total RAM pages: %lu for Ramdisk device\n",
+		       rd_dev->rd_page_count, totalram_pages());
+		return -EINVAL;
+	}
+
 	total_sg_needed = rd_dev->rd_page_count;
 
 	sg_tables = (total_sg_needed / max_sg_per_table) + 1;
-- 
2.48.1

