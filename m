Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505696;
	b=ydXrBfTL/4K/vjfURMOfioLqi3wocyrCaMA10iihUHs1uPIEz/EmuHHpwTMIAdGruVc+
	 IoVPvntH4LvAMifv6JKmcy+H2A3eqDSa2U2tgZr1R+TREWIDtLaV+EaZ/inIIuDhmIGhM
	 7W8cLsenqqonqWseqViF6BQxAuAIEbxxwpQ9WDc8LMTA12Fi+2nklmca40nvR2VVLBDCB
	 oI4+qFH2FR7w6y6Zg0a2kOuSPGc7D9FBrnamWprxWArkB+5HX3mVtISoX5miHNvZXINZw
	 HYMFfsz9czIrNgl1gAi29TRzUtkZYunyn7kHqfJOzG+bYdYdInJ4clGmnEXSqDU+nnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wUuadG0Yw2Izwr3UTyTfSeRMzW9ur52zaG54mUGgnbs=;
	b=OX7iYK5XeA+kVD74shFM+PYxfg+PQI7/oBYW7rB9LspEx2UdtzI6LopYpvTPyByYi/Md
	 xXwGcfiP5LW+h4E3Ok4onXqSKHlLvFnStQ0INhEKK9vFzGHztnMuFzKS5eqIuY1rvoxOa
	 vSbKsvnRl09thVyfF8cOi+NpW6v9YLWjuUJR9wzsyC4uvTR+uP2qPRiVb10fkdO/1a5ce
	 RvqLEt1G/RvdiGXM++YtXOu+LJmce4Mkbam9JImYhDM6x7zYpoGmrb27PynomJm+706aq
	 Pei1nYUxbAGIhOyQuE4W4oC6xHd3f3M6SgDMiBrt0mBZneYUfopAASgyFPvCxUmMhKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=WcZiU7dq;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8775606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8775606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=WcZiU7dq
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53664b4860bso44258561cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794505695; x=1795110495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUuadG0Yw2Izwr3UTyTfSeRMzW9ur52zaG54mUGgnbs=;
        b=WcZiU7dqYkVn3XbOr7LnVDUkgYhzKfqKV+4wtU9Ll/aqiDDEMIJM8j2AheQt4peZbR
         5YglCi/0y31gAuQm99zSTUGraQofwuVsLVeoM0lIYCvP/X7IFeU8zjfduNXaeKM9CZD7
         x9jW8WUySgUi4NRi/HAeWE+dMhhATm9Brnihy5/G6T5xujc8r6UtLDPo9JNb8yBD4UBQ
         e+bCaRqtCn/FU9d13zcEmTSjcxr4WW5EUHPMf+Wd04NbR8Qz8qi7oat2638a63hhfr+R
         PGt2GoUCzwuLjtBXMDNULtkV+m6sPwUsg0P4UWEpu1ioMfb1SDW2SIh8h+QtmXo06LCl
         F3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505695; x=1795110495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUuadG0Yw2Izwr3UTyTfSeRMzW9ur52zaG54mUGgnbs=;
        b=ppmKvLdqkcRG+4nQq2hNBGcwyxr8cxTRrTJSF2OMyzIzzyqfLeKrRfG6YFqFc/8tCc
         2UxEHRmpZxPPXxCC9saopVbBjNQ++bmBuNaO6ce+CPMdgnF9z2WMDAIvNGuCx+w8HESa
         Nv9Ovw5GJr8gKkG50DsS2ZAuiy96PzzKyR0o1JS9D7YkHTA8RVc3Be/mUMtPe8488CXk
         P222D7jJJC4TIOSjjemibzI0iyo1b872U8eFxG9UM5umMK7O5b8K0fD4+/oYALjagYmL
         ZJGAYzrXeFIfk6T8BE4bb/dDgDxhxeIBXTjlPEDeCIpO0FXuIcHF0EkC1Mz/VuCdi1xC
         dh8w==
X-Forwarded-Encrypted: i=1; AL+hErEQJwh8cVhnpaVzcBkOgvAKnLJtQXwx2Jb7mwlJ2NymS5Zp03zZ8cuTg/eBUB5mK0fUMQo/pgs3mDo6tiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dc0cYR+GFKDub+6Bt/kSG14R377spFrHgaz1eHL1rpzI0G0b4
	F5P93FpGmWC3oQP38WvBcIrZVzkZxc4ctYOzXUmnV08cJv3vvGhKwJlDh9ZmM8h5i1N89pPkJFV
	659claw==
X-Gm-Gg: AYBFou2unc3WcNblMIbE4mxWmiPsXqoD/g3ll7aFa4uRjAe0nN3b1rqZ+66aXUI6VYa
	zVVCED10FeVymhMP1Lmqg7RbCAV1g/8rDrTP/9/Suyy7t8wrHldtuu00h+w1G+DvRhOQ8ucKkdJ
	2GGlDT6209Rt+GTnyrIEl/QmgErM26ocoe8VMklTMsww7hCzzh9R8Ku+yqmn0h4K2jPczdjEqoI
	kkRMNo/QwUPkM7G7C2hVQsmUf578XKMMU1c/glxzb2xP7Kc+kIphUAk0f9pSQ7eWFHqcKfwIRsG
	DJaS3qs+oaYyqXIMX15OHAaUrMhQcm7MZ9rMk2PqQjS1HxaCguEg3XDsP0ZVQggx8y6VzveQB6g
	9hp4C743VsrOeRS6sar1vuTFqWlN8dHjN5rxQAiNby2dSRHhoOyIJrqtIomq+B60b78jpwtkm0G
	sf/hPUQDuRNMe/cgtJGU+N6VJ/i4BNbOvD9EeBkNWRoj/8P8+9e0RTzt/nRQUiAZdy4vAHmmNfR
	dWOTVePThLRk2KxFYTaUM/YEJA6BhwAoWoLbGZu9nu5JBVrRiV0YBSMzeeOdpmSSZKB/w8d07Yh
	kbNhjh7wf5DbDdCEYTkIVNVWz/yj8iR3swY0wgbRZBB5jZaVb7Ku
X-Received: by 2002:a05:622a:17c7:b0:535:a5f9:7526 with SMTP id d75a77b69052e-55ac9089440mr1514941cf.69.1794505694735;
        Thu, 12 Nov 2026 09:48:14 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0ffeba0sm70521cf.17.2026.11.12.09.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:48:14 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Jens Axboe <axboe@kernel.dk>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Hannes Reinecke <hare@suse.de>,
	John Garry <john.garry@linux.dev>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bdev: do not report a statx block size below the block size
Date: Thu, 12 Nov 2026 12:48:05 -0500
Message-ID: <20261112174805.1200379-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 425fbcd62d2e ("bdev: use bdev_io_min() for statx block size")
made stat() report the minimum I/O size of a block device as
st_blksize, so that devices with a large minimum I/O size get large
enough I/O. Commit 777d0961ff95 ("fs: move the bdex_statx call to
vfs_getattr_nosec") did the same for fstat().

However, the minimum I/O size of most disks is 512 bytes, and
st_blksize was 4096 for them before. As of now, programs that size
their buffer by st_blksize, such as stdio, write to these disks 512
bytes at a time. Each write that covers only part of a block makes the
kernel read the block from the disk first.

The issue can be reproduced on a disk with 512-byte sectors with:

    stat -c %o /dev/vda

Before commit 425fbcd62d2e ("bdev: use bdev_io_min() for statx block
size"), the result is:

    4096

After that commit, the result is:

    512

This patch will report the block size of the block device when it is
larger than the minimum I/O size.

Fixes: 425fbcd62d2e ("bdev: use bdev_io_min() for statx block size")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Application impact (Ubuntu 26.04 user space): "bzcat sd.img.bz2 >
/dev/vda" (bzip2 1.0.8, 64 MiB image, disk with 512-byte sectors). On
v6.14, it reads at most 688 sectors from the disk. On v6.15, it reads
about 108,000 sectors (53 MiB) while writing the image.

Tested on block-7.4: with this patch, stat reports 4096 again and bzcat
reads at most 2,104 sectors.

 block/bdev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/bdev.c b/block/bdev.c
index f20f91b3176e..c9a3d7832c42 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1430,7 +1430,11 @@ void bdev_statx(const struct path *path, struct kstat *stat, u32 request_mask)
 			0);
 	}
 
-	stat->blksize = bdev_io_min(bdev);
+	/*
+	 * A buffered write that covers only part of a block has to read the
+	 * block first, so do not report less than the block size.
+	 */
+	stat->blksize = max(bdev_io_min(bdev), block_size(bdev));
 
 	blkdev_put_no_open(bdev);
 }

base-commit: 8067050e7226844fb32062b5cea947e5897d3d7e
-- 
2.53.0

