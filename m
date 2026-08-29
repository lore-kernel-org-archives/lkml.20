Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13811397
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787966354; cv=none; b=eB8WdJ4G+DkLgBTeoHoW/6iAowVZIsQYbgntbpuqiFpsSqGnxtEo26TcUbwwSqIz8TKN4L7zV+hGbMfeinZmc4EL3E/JZ7cCKU97z+vu/oJ0+V+1gh/ZmJiKXOFIHWdf3tGNElA8xshn5EbhOPIVgUvYBuC8MaycBq/ullj3FxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787966354; c=relaxed/simple;
	bh=HscXdFpNsRlkFpSvaVpcYt8mqsjP9QoFN8kKOJceJZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezdJ7eZAULrz+x8xMGnQJJmx0nOC9tTD0coZEHJqzg6EiteHn6trmbN6aoyuD+tJWdk7beRWZ+Hix9/MFHE5D7FFxEaY1xktmTPzhdOqmvhJWi07sAdKew7FBxoOcjRbXZ399oBgy4EWEQ7C3PbWm/1/tyAEd4ruTNv13DH/jgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1Xd6sBx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1Xd6sBx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1888211a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787966352; x=1788571152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZg8mAdLVuaPOBvQhtWMylhZ2H86Gw6DTQC1M2Z4EuA=;
        b=F1Xd6sBx3vrV87skcElJnPIPJBt/P28uvFHzZ2w41E7w0S529D5Gs9VAEPFd7o6UHW
         xPpArbTSNB7K8m6BsR7K4p1Ug2IfLHhHRXYG1HDqIVX9p/l/C6+yD4K2B8qDXZgakWTI
         kN6L3dLJgBBbiHH7XnDOvd7Vjxj7QVfOkg+b1KVwOCQIeWVwiZmx7250WtldhvGJZ3ce
         oxDMArggVi90A/vz7yIaCfOuXBRLJqEFYAZMtzp1b+P6LYJtGyrQBrzFDmWFr822T8VP
         RvBfqWxqnwT5wXCGvu4T5khNiuaqzTrZHWNkfNLRo1oEN0J5nIW1jly1RmL8fceuWsKo
         H1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787966352; x=1788571152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZg8mAdLVuaPOBvQhtWMylhZ2H86Gw6DTQC1M2Z4EuA=;
        b=eJQ4W8NSO7WjgTj5/RttYJucIYQWt6ekHCysFM36Ds6glpEmG9SY/KU8Pxa8oApjBt
         x9A2zKX2RvaoWoub1bHzYAVEq81Y74WYlmEVkkXqNiJSFW/e+eFd/xCAlmEabyI7a0JI
         iTbpZWUgIeCle3NLGCV50BNXGgO5rz5VCyi5MopTWlP2Bg4lT+/Y6sWIjs9lClq7TuXo
         /LFtTI9aFCPKh/CTdhh1hbmoMAUTUvr1OUfrk0YFiSOg/OauJhuZA1cxzKoxAAObH0NK
         yAAOFUGQ4/2r9IAav9h871MaC8z57Ujty+QQgO6y4UkQYsYOVlByrDU9dEd1qJYiA7Zz
         +wxA==
X-Forwarded-Encrypted: i=1; AKwUvBw4HaRH0Fec2BlJwQRYNlUJWwrXpMCSxyYPV2c3AWJoD5tjdbCsKRXpaLUddDTyytoka5Qnz9kvjTFtmBM=@vger.kernel.org
X-Gm-Message-State: AFuF++nI7qebEmTtVpqjIY0q+gbtcwLIhwlDk7MmCF+0mfINBJiNqmky
	A6wP7yqVG3HwtZEUjz4+7rHTMyr9jaacs6xqsne6lgnbUVXlClbP8Nf/
X-Gm-Gg: AYBFou1AP2umty/BKv1NMTGN9XEP2F7iOTntwuGUNj23UmWvdnDk2tkZe//sbaWyFzs
	3uKPzYxjtYrBQ+V8DOiPefto7g6YckzTAdTalz0gZ4S4TZHgZzGcwNmPSV+ox+XLLyQ5lfzWsI1
	RGYaUJy2swvviSrp2LqBJyU7k3zTRnQ6dmZvK5Vp5Im7TTttOUvL7xSMA58RfvWt4xnY4ntq/Fh
	r1wDMHAFoTeaZ/09Kc6mS975XsTNWc16V+TIJ1IW1ZswpSF+rnMAgddDaVb5x3BOClphUzYDC0G
	3A+oOMkGEaMPnku/mFlQXKHm0L+2gT5BsK5c0UUoLwedIL/J12WGH8C3xGGlK/GiOsdj5nMuour
	L6EQwipIcO6c75TqcRpcMVaKkidgFWjjvjBygGnZdVkRtesd7Xul5juvzJti10K+UGvlIx+53t4
	4rwYuu4y0yt8IzCe7s3WSaFmtHEGTg/JyPdkWDuQTl/hVLnJ9KFhShGcnk3qJyHQ==
X-Received: by 2002:a17:90b:2e48:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-396d0feda32mr18850877a91.15.1787966352081;
        Fri, 28 Aug 2026 18:19:12 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:a9a6:70a4:308d:c424])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm6833167c88.11.2026.08.28.18.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:19:11 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
Date: Fri, 28 Aug 2026 18:19:01 -0700
Message-ID: <20260829011901.325379-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When gadgetfs_fill_super() fails, it's error path calls
put_dev() which drops refcount inside the_device to 0
and frees the objet. But the_device pointer is not
cleared, leading to point at freed memory.

VFS will then call gadgetfs_kill_sb() after mount
failure leading to put_dev() to be called on the
already freed pointer.

Fix by setting the_device = NULL during error path
before calling put_dev() inside gadgetfs_fill_super()
so that gadgetfs_kill_sb() skips put_dev().

However, if the fault injection from syzbot failed 
and it began the open()/write()/close()/unmount()
sequence then close() and umount() will each trigger
the refcount to drop once via put_dev(). This will 
still cause UAF since refcount is only incremented 
once on creation but decremented twice. 

Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..77efa984ce84 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
 	if (rc) {
 		put_dev(dev);
+		the_device = NULL;
 		goto Enomem;
 	}
 
@@ -2066,6 +2067,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	 * from binding to a controller.
 	 */
 	the_device = dev;
+	get_dev(dev);
 	rc = 0;
 	goto Done;
 
-- 
2.43.0

