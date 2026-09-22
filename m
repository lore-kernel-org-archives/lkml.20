Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0E13B4E9D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045671; cv=none; b=az84cyv8me6EWnGDDXIJ7ucT0Gqk6WZN6VmLx/cvRNgeA3N857ubJouzNeoY+tYKFvqS7PdlUcYt9myM7nSunpbqSrFNmhXy/uF1x9cUpkMkbWi5MMV11k8KitsTJdCHBgwZ0ayhRG1IO2GvhyThs9BXdIaZrz4t4EeemXSsY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045671; c=relaxed/simple;
	bh=wygfwy6WLEmcRyxRJTfZrlUVqjeOxy5tXzglSXSaVpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KbrtJodLZ/YSlMlzxX2nRnDGhNZHFN4h/XJ52nUVIoLuaHrFx9LAh1DeNpuruTUYoRo1DNPk7VS17nLe/ibnfSqD0Ond7AMmARJw4OwTzYlRoONKRdpuLIgF8pucRZQDP7s4y1N9rHMVqGuIGI3wvK74tnrFSMzyhIurnadT24U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=O+QRAAop; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fX21hCT+; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="O+QRAAop";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fX21hCT+"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2XKt2927647
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=g+ry
	kKqwK3PaWFm95Xep4+ofJmlr+BCp13pqFh0Yazw=; b=O+QRAAopFmkvoxIzZM0P
	WORu32X0XHI5gHmDaQs1ePqKbaMfpAxkVIHGYMzOgcRu9R2R01GNv11yPzCjS3nq
	fAwm8dogovc6oskOvCM9oHQoS99qwTOrHJbe9MDOUpMGfMa1LYDuUps+butZKR2h
	BEaMBbvE96ylt+RvmprW+cyXIb0JhRLRvBZaDOiYQgftqipAdfOHBi7pmxNZghph
	lcPWpDAsc+mhQrkkad6GLAbx3sww4wrFQI13vvEjgtu1H6aPk8MaekCz2bodEgTE
	1Oozk1QC1SPDJjufELeE8CdISQUs6oBMdypJ9LtWrRYZJKvKaAZ9qtZrXPWnnvPm
	wQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gu8h5bmku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:14 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530e5b709b1so76552811cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790045654; x=1790650454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+rykKqwK3PaWFm95Xep4+ofJmlr+BCp13pqFh0Yazw=;
        b=fX21hCT+yy1ijAlkKTKIQ11VZ5il8b5e1YTmEpOroLHjF9gasVnZnWTt4ymH0zZZGh
         cBRE1k8sB8Fd5psdyeZXJdaofKf19hRAIFcC16wD8Jk+dW+/s4k8OLMdon5QsbAoG/En
         rUxDVd6P0rkWIWejg23rLlrNGkLRBnJDEwEGabZLqkkKOA/zLO48nzUMwVo0WYWu4Fpp
         0ypLgN+SEuHuirBe0op4VXMITPwosHfFPoQxjy8bDRa04YdMgMt84nzwL1jDDJEGjfev
         Yfx5kp6pKZK0bzLMVk72jAPC96pPrAgZEnCc4yKtNNfLBLJS6S51fi4L3peAMlmweYQL
         /AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045654; x=1790650454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+rykKqwK3PaWFm95Xep4+ofJmlr+BCp13pqFh0Yazw=;
        b=RxA2ZNnEnV7t4EUkoI+R0L4mxdk2LSdSJhn+99MQ2bWCnFajzmuqah6dZEyw7Z779G
         dHF4RfCdsZrxnFczpUqnpyHCU21ewF5YrfHYZMuRAEWK0t2Z29d1zdKDZxj3FxMAD9w2
         gyOahWIuK5i3ZBIcVdAxLnLMZRiDQBIej2YITqtZe4pfUMaHZ3W3/fLeKw2DlC5r8rNu
         pZzy7PwjzJeez60stYhIiSjNCWq/vx38+rdt7m0iNqUkAwXqCQueIhsydpbv3D9UCZJR
         OPJvtV+WPNowZxjf5txQ/pJYiNqKE3SEI2VfjaBGIKEFAwObco98QFFgURpFNd7x48XQ
         TYBQ==
X-Forwarded-Encrypted: i=1; AKwUvByrTwjm6yrEFRZEDYntXSloZGDZtURpGChSgxUCoV9JPBVE0qjqGahSPQJ/5mHnQ3o9Ve7yViQnhDmticg=@vger.kernel.org
X-Gm-Message-State: AFuF++n9A0qsl30Ieii6mEzRsOUKEMwa4cAylNiahMjnfpwt/mwRBWrJ
	22ThMV7hd6vB/A+4kHwKsjfeQ+amYrlC91Iy8TKrV05EDmTn8piCUMwp+sfMbPEwv4MaKtHCXY2
	ch817EeqcxWC56PDdeamZFpp3ldJJTE7vBwMDdtAtOvn1E93Wjy2cpuWTO/KU+w==
X-Gm-Gg: AYBFou1un9MsC0wvbzr55DEmN8ATP6xKTM4xsdSaZkGn0SY5amQHJWDG/cw5nHB8ioX
	c7jHvu4EbA6rkY4argt7kpjQcS4xyChtp34JAY+DkkpR3L5gIHGN3pXWyctyj/dcgCYpfkhcqSg
	X3zCnH6wQyNqQeyyOSEc0y60rPsCOJYaNTCj0263W+21gsHY+IUE+V/gL6Cu+PNSTAn1F3/gr75
	HUcrr0ryGRiMR3FxR3+FGO55paYuhCeHpOyGytp95AQcEVQc8Z7Bu6X/+0Uv+56M6ssHzRIycyd
	unwbA7d5d/3KOd3YsAsLuXo5A/5ktSorCwIOCxIKX6fsNBXGqR4Smsgu8rt+J8xYtapmQwFREL5
	RjuRnb5AIUN4i4245I/kmt3AS8H8GTqkIYPsiOBUe9W4i
X-Received: by 2002:ac8:5883:0:b0:530:fb97:4986 with SMTP id d75a77b69052e-532d8e6e41dmr35889721cf.51.1790045654010;
        Mon, 21 Sep 2026 19:54:14 -0700 (PDT)
X-Received: by 2002:ac8:5883:0:b0:530:fb97:4986 with SMTP id d75a77b69052e-532d8e6e41dmr35889531cf.51.1790045653533;
        Mon, 21 Sep 2026 19:54:13 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18fce9fsm2048421cf.15.2026.09.21.19.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:54:13 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 21 Sep 2026 22:53:59 -0400
Subject: [PATCH v4 2/8] block: take i_rwsem for the direct I/O write
 fallback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-blkdev-fixes-v4-2-e2801f71ede9@columbia.edu>
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
In-Reply-To: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.garry@linux.dev>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790045650; l=4766;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=wygfwy6WLEmcRyxRJTfZrlUVqjeOxy5tXzglSXSaVpM=;
 b=sPYgGOCsYx+rYKOC0hGHBpvNO8eZLUjiJzGZjWcsKv81n8diiIzIxvYlKjsVW3sH+6PLcdUl0
 +x98Eg8Km/BAVLRPp7uJO1KTGQ6lqcwCo9X7hWR4yj2d/ae8lIK9v2l
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: Ub8MaxH5rkAjdB3WtacS9j0j5TmnM665
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX/kLt9zhI4nIL
 HL03coOAYRg+ZB4QzBfL2FSJ7Pell85NaUwCLlwSYcv5jZWd+OeTJNd7mS2QksW++I7emt7TD9j
 zUCgOq79nUuHo+wkweQjUox8tAAV6upYk0wBEmb78s/U5yg9ohlho1FcSNqAoJUMshe3sbVUynk
 Y7Y078h7NkYVXmVY+zhHhWYsCw7V4Dp1/XexSVmp+tN6Vk3NgjihPDXG4Z6kGB2OZpImm86+Boj
 AEwc1TdoCU4QXMK97yBnfDMjzyQaYaK1yMXeIiGg9tR9nmJyWr+VwpxHbQEY0myWaGqaDWldtEB
 hlFPGvoVDcr/BI303F/anwk/joXAaUugntBa4FLs6uyZvTy7yBNZbmcFLsQAO+G5o7SwH8laZRP
 BBykDApHqrT7ZzKU08LN08ImYnmMDcrsIBo5dY+e5yQT16oPlJovkuVkGVbiGarYtER/6H5OoM4
 dhSc8kIuUL/gZHpl6kA==
X-Proofpoint-GUID: Ub8MaxH5rkAjdB3WtacS9j0j5TmnM665
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ab1edd6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=NEAV23lmAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=JF9118EUAAAA:8
 a=HaKTZzbUtGO3MgJEFeMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX417xWR5mH8RT
 K25mqdKcTcHEn5rkslcCFCuX/fw5yK1oUNPvNo+RiwqRJu25enpLhYTASgoVrWvnf8wYqOsqHMg
 h8qJ9GameoPySV93W2WaQBCzCC1czkvPvGBjl+Ei9OALdQS6v1mG
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11912
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=10
 bulkscore=10 priorityscore=1501 impostorscore=10 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

Commit c0e473a0d226 ("block: fix race between set_blocksize and read
paths") closed a race between set_blocksize() and block device I/O: with
large sector size support, set_blocksize() can change i_blkbits and the
mapping's minimum folio order while a concurrent reader still holds a
folio of the old, smaller order, leading to crashes. In particular, it
made blkdev_write_iter() wrap buffered writes in inode_lock_shared().

However, the direct I/O fallback path was missed in that conversion.
blkdev_write_iter() passes blkdev_buffered_write() as an argument to
direct_write_fallback() with no lock held. A direct write that completes
only partially then finishes as a buffered write with no protection.

This can cause a BUG by racing partial direct writes against
ioctl(BLKBSZSET). Writer threads issue O_DIRECT pwritev() with a
two-segment iovec whose second segment is an unreadable PROT_NONE
mapping. The direct path then writes the first segment, fails to pin the
second, and returns short, entering the fallback. A second thread keeps
toggling the second segment's protection so that some fallbacks get past
fault_in_iov_iter_readable() and reach the page cache, a third thread
populates the page cache with folios of the current block size via
pread() and readahead(), and a fourth thread toggles the block size
between 512 bytes and 64K with BLKBSZSET. The minimum folio order only
moves with block sizes above PAGE_SIZE, i.e. with
CONFIG_TRANSPARENT_HUGEPAGE raising BLK_MAX_BLOCK_SIZE to 64K.

On a CONFIG_DEBUG_VM kernel this yields the following BUG:

  page dumped because: VM_BUG_ON_FOLIO(folio_order(folio) < mapping_min_folio_order(mapping))
  kernel BUG at mm/filemap.c:858!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:__filemap_add_folio+0x860/0x8d0
  Call Trace:
   filemap_add_folio+0xc9/0x1f0
   __filemap_get_folio_mpol+0x240/0x660
   iomap_write_begin+0xa87/0xd70
   iomap_file_buffered_write+0x304/0x6a0
   blkdev_write_iter+0x255/0x510
   do_iter_readv_writev+0x23d/0x3c0
   vfs_writev+0x211/0x7d0
   do_pwritev+0x121/0x190
   do_syscall_64+0x121/0x630
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

The same workload also trips WARN_ON_ONCE(pos >= folio_pos(folio) +
fsize) in iomap_trim_folio_range().

Fix this by calling blkdev_buffered_write() in the fallback path under
inode_lock_shared(), matching the plain buffered-write branch. With the
fix the same workload runs clean.

A short IOCB_NOWAIT direct write reaches the same fallback. Taking
i_rwsem there can now block behind set_blocksize(), and the fallback
already blocks on writeback of the data it copied in
direct_write_fallback(). blkdev_write_iter() already rejects a purely
buffered IOCB_NOWAIT write with -EOPNOTSUPP, so do not enter the
fallback for IOCB_NOWAIT at all: return the bytes the direct path
already wrote, or -EAGAIN if none, and let the caller retry.

The reproducer used was written by an LLM, and is available at [1].

[1] https://gist.github.com/tzussman/69d06bc57d42a42989eb038b1b5aeb74

Fixes: 3c20917120ce ("block/bdev: enable large folio support for large logical block sizes")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260730-blk-dontcache-v7-0-3e8e6850068d%40columbia.edu?part=5
Assisted-by: Claude:claude-fable-5
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index c57784773fe1..d5f569333f46 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -765,9 +765,26 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
 		ret = blkdev_direct_write(iocb, from);
-		if (ret >= 0 && iov_iter_count(from))
-			ret = direct_write_fallback(iocb, from, ret,
-					blkdev_buffered_write(iocb, from));
+		if (ret >= 0 && iov_iter_count(from)) {
+			if (iocb->ki_flags & IOCB_NOWAIT) {
+				/*
+				 * The buffered fallback blocks on i_rwsem and
+				 * on writeback of the data it copied: return
+				 * the short direct write instead and let the
+				 * caller retry.
+				 */
+				if (!ret)
+					ret = -EAGAIN;
+			} else {
+				ssize_t ret2;
+
+				inode_lock_shared(bd_inode);
+				ret2 = blkdev_buffered_write(iocb, from);
+				inode_unlock_shared(bd_inode);
+				ret = direct_write_fallback(iocb, from, ret,
+							    ret2);
+			}
+		}
 	} else {
 		/*
 		 * Take i_rwsem and invalidate_lock to avoid racing with

-- 
2.39.5

