Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E804248C0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207825; cv=none; b=l2OqixjSjnLSJgwpi5idYGGgZ6vrBbTpmPi9vrZSSFNjpYZI1NvHojqkCRtMTqtLzVXr/0Y3G5igaT38ntFwJMF2z2AUeCtHdIKeqx+PysUgVCNlf4SejG7QhVvnRGdvNGzwrHWMAxFn2KqL/k5dpJayPpLjIgG+sZKboM4QW2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207825; c=relaxed/simple;
	bh=+6JrzqfYyBrGC9pfDqzdgv7ta7N3grQNKoC2mDums3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IU3GX3aZ4wABGGIA9VK1zTnhgT5XZLvAHqAXnCNlaQOWsPpRIYvdQG1K9VFwyQHLL0HdEQjGXs5o84aza4oaIX4oKa1+aTfeZyGdgQnDz7h87LBb6UsZ4BM9CiKsnNjOg4krfWj8V9heD/5+ov2FJ31DSKHG9AAzGkbkkO8q8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZIF+oELv; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Xfp1wmY/; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZIF+oELv";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Xfp1wmY/"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNCvmp2038797
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HttR
	teK87V8g79twx1jaSTPrE7lew+ZNw8C68XNjrsg=; b=ZIF+oELvaW4TWpkgzVo9
	+v/WeH+if8/IRVrLAJKDNHdQTl2ZHsH+jRqHFkmNgR/Fgjg4w+FdDo0kknGaGSW0
	ihnWu9Wi2+2yayUmldfplrbrtVnR/uKIAU+3ACBCq8cVU+tVFYRdSBZScK3bTjK1
	+L3/saRYZiEIgkFDT7lWt3bZ6b7T1DndNE7JMRJtn0gXtdM57d0B1aIci3jlbtGg
	npWUP5yBf6uctWaYskHQM82oJZcAVRRU9WkI41Pa/ywhRbnXw753KtAoq05umEyi
	75akWk2w9/mrZtn0apY5rHKVZy9R6FHkuGMBuEkqN7jhMuM7zBm9Fq1kr4lJBNyB
	SA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gvh5wcrvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:57:00 -0400 (EDT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so1265564a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790207819; x=1790812619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HttRteK87V8g79twx1jaSTPrE7lew+ZNw8C68XNjrsg=;
        b=Xfp1wmY/GwU5bYrn38l3lBntinZsSggL7IG92n/d1k/STAi24AolVLTeqyThD72ruW
         IaU0ofx5V/R+dXCf5eKbziaaOvT77Rjwy1+El58SMy5qrXzjZPNQWyRzgvYDDfGc1jAX
         aMtx/FMxtQ622eWM3bX2R1efLNrKHSmCY7pyK7D8dRwLMvnN0IDGbJJTKTWrEfmYtkVX
         NRDsonus8B4nz/RzTqh+52p00/bJKUsxbQ56b8WX2gBmsx/YcfkvHOX10aUdKB/XP/iw
         2sue/GWOgcyHufjpLOr7BRL6puGBacl+vsUkDMCAIrTiHV7l9Sz7x44bCa29hd4Oi2hR
         wn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790207819; x=1790812619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HttRteK87V8g79twx1jaSTPrE7lew+ZNw8C68XNjrsg=;
        b=wHPqeGpxEcClJ/fYvGDuE7GLePY/4VTL5x/2lgtHzm+wDKfZIximD8PFTeY3SlEjwT
         fpeNqQyEHv95+0QRNIlL29YhRhve1ZEp05qgUwHmXZJyjlcf7wEQKASzE9cpysWZpwHh
         Ht3fwmnPgdxmx2V+7YsU0wGhqqUxdCxNf4rTcd+xrqgACNTqQA9V5Y/BLxKzTDBfaPOI
         lDZZPSGQRp2p/EBfW2GRQX/Z/EAn04NU6yNOiM5rqpeaobgTCulSTZA8XiEeUGEsNID3
         LhcoKBGswoMvimLkgeO/XgZWhpzr+4kO7COd8IvGBLEZIZT33EPx76LFmBd8Dou1LTzd
         uaaA==
X-Forwarded-Encrypted: i=1; AKwUvBzVLCxm5DG/qVf7foqhzN3FUxXFhbZpo56DeYvT/DKv3vZqCK5Sife8LC0yblGdo4W3lNLiRl7o+3qDkOk=@vger.kernel.org
X-Gm-Message-State: AFuF++nPV0mUi77mu7oMb2R7u+a9E+HcShSp8yl+qacFb46nE9SXKpIl
	k1JHRI1d+mJX8tsQ0RJbFnxtoZDm03GF92MxLoHbFZikH+biWdFt8U/uDzEkQ0SAR0nBz/bgri7
	Go7khZ481zP/2OeHMRo3zRXquNqbiUBg2yYpH3Z0IhkTE32hVWybGp8MYr0WRVg==
X-Gm-Gg: AYBFou0j6vkfK5RZizq4yNhC59jAwq4RYlVfJeSCfWPZzHQWSaxGpNLxupm54Y+MWb3
	6OIoVGFTN4i0LZRIWwlsCVEwRRjqdtEyIsxIb3RlAGugcwC51TpOhNkmzIp85W4WceCxSlKO1qP
	54QGrqeK4DUMZiwIyAsVAG7+exoNSBH67l3oDHl3cy4P3k0VHk/iH6SoKCWXT+JrqFuBuPzyaU6
	roZX/zAUnPiSy8AtijiV4MWPrd9c9xQNFB5EhDaH+jkoUGwJKFDNeTanYkcG5itBZlsC5KuQjRx
	QOZs9ecWSkMLOaWm8W4etCJ/3cXons211/1j2QMY77YsFpFFX2PFi15Wr45EZO2wNG9NXyDHYUx
	t45KquqrxuCDkDN1ncFd2EsDaURiyWotPd+LEPivnEW88sQ==
X-Received: by 2002:a17:90b:3985:b0:39e:6c69:f482 with SMTP id 98e67ed59e1d1-3a098d5e61fmr587379a91.65.1790207819423;
        Wed, 23 Sep 2026 16:56:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3985:b0:39e:6c69:f482 with SMTP id 98e67ed59e1d1-3a098d5e61fmr587362a91.65.1790207818962;
        Wed, 23 Sep 2026 16:56:58 -0700 (PDT)
Received: from [127.0.1.1] (RED-LION-HO.car2.Seattle1.Level3.net. [4.53.155.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976ca5f9sm1331613a91.14.2026.09.23.16.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:56:58 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 23 Sep 2026 19:56:36 -0400
Subject: [PATCH v5 3/9] block: take i_rwsem for the splice read path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-blkdev-fixes-v5-3-89e60d66eb38@columbia.edu>
References: <20260923-blkdev-fixes-v5-0-89e60d66eb38@columbia.edu>
In-Reply-To: <20260923-blkdev-fixes-v5-0-89e60d66eb38@columbia.edu>
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
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790207813; l=2886;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=+6JrzqfYyBrGC9pfDqzdgv7ta7N3grQNKoC2mDums3M=;
 b=dD7Cr3HZsDdAA+/bC11LwMS3llQ1d3sCSR6/9uZY0+P+73KAknov8g3Rkg8eZm4OsVsAKz51H
 U7kxqmE9IGaDj0C3yx5QoD1f+Q+Ez0zWFF4MgOVTY5TZY87E0SpFnvK
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: 5-hgEqRf86Zre2jaZg9ZLjgjtNuRBGBV
X-Authority-Analysis: v=2.4 cv=DIEacCNb c=1 sm=1 tr=0 ts=6ab4674c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6aZ3Ysb2zzbY2sELL/OBJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=VwQbUJbxAAAA:8 a=JF9118EUAAAA:8 a=kXXCQoMOyz17bj_MZH4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDEwMCBTYWx0ZWRfX7O0cmaK5F/oz
 kEQATfbv+RpziiB+PcCcD6FMvdKv733eQp121/jcWXcRghvxtZ0AQIHQomK8WveLNH2xnwLAwF0
 oWB85+2oUGDnwSSL0o0YK1a6TAq9W7vUstE22Bgib0JXnC+3VN67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDEwMCBTYWx0ZWRfXwg3H7ioISy+1
 IMhIivtkn8VXBVfWvNF16U3sRx2iuDhUaAZyaX7nB+I57r7yppJXUWj1v4DXxhXL1nLRHQymyLK
 3KCNFGkIuV0fNcyNA+0f06htVdd0h6JKHtFmzoFPPu5m4WRqHGDPNw/1K2WKgAHtBqwn/tmtDCF
 LVtt6yVFMDVaU7H40UL7YMt00wr7LCREtXlDE/uNuThrZsRG3sbj+T1YXIluwXVa42Nn/FgoRtz
 e6cwWpZgJU84fUvrsZxlpT08tfGDPmNGzJJOTwtR7Pya6mcrTkKoIhlQ8Ym1WXs6lKqSNWaR1nR
 JImquB14L2pGqIiFQKxp15Zi8pIUIm3B7GH0zmaohpbH5w0odlNPOt+bWOu4CuyDJ+GH9JXctXe
 bWR7nC6BDry2JpdCMqprr9ZroCbqeB4y4WBq3AZdGAW3mlUav8Pi0w/3eE5XSPbQff+0kCpXVwn
 rZRM2WkNLQ40dUaGjIA==
X-Proofpoint-ORIG-GUID: 5-hgEqRf86Zre2jaZg9ZLjgjtNuRBGBV
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11914
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=10 impostorscore=10 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230100

def_blk_fops wires ->splice_read directly to filemap_splice_read(),
which allocates folios based on mapping_min_folio_order() without any
lock against set_blocksize(). A splice from a block device can race
set_blocksize() raising the minimum folio order and insert a folio that
is too small for the mapping. blkdev_read_iter() wraps filemap_read()
in inode_lock_shared() for this reason, but the splice path was missed.

Splicing from a block device while toggling the block size between 512
bytes and 64K with BLKBSZSET hits this within seconds on a
CONFIG_DEBUG_VM kernel:

  page dumped because: VM_BUG_ON_FOLIO(folio_order(folio) < mapping_min_folio_order(mapping))
  kernel BUG at mm/filemap.c:858!
  Oops: invalid opcode: 0000 [#1] SMP NOPTI
  RIP: 0010:__filemap_add_folio+0x51c/0x570
  Call Trace:
   filemap_add_folio+0x64/0x140
   page_cache_ra_order+0x1dd/0x3d0
   filemap_get_pages+0x153/0x760
   filemap_splice_read+0x13f/0x300
   splice_file_to_pipe+0xc0/0xd0
   do_splice+0x6a8/0x890
   __do_splice+0xb0/0x210
   __x64_sys_splice+0x80/0x100
   do_syscall_64+0x10e/0x520
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

Take inode_lock_shared() around filemap_splice_read(), like the read
path does.

Fixes: 3c20917120ce ("block/bdev: enable large folio support for large logical block sizes")
Assisted-by: Claude:claude-fable-5
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/block/fops.c b/block/fops.c
index 7ff78b448659..652297cd90b4 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -860,6 +860,22 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return ret;
 }
 
+/*
+ * Take i_rwsem to avoid racing with set_blocksize changing i_blkbits/folio
+ * order and punching out the pagecache.
+ */
+static ssize_t blkdev_splice_read(struct file *in, loff_t *ppos,
+		struct pipe_inode_info *pipe, size_t len, unsigned int flags)
+{
+	struct inode *bd_inode = bdev_file_inode(in);
+	ssize_t ret;
+
+	inode_lock_shared(bd_inode);
+	ret = filemap_splice_read(in, ppos, pipe, len, flags);
+	inode_unlock_shared(bd_inode);
+	return ret;
+}
+
 #define	BLKDEV_FALLOC_FL_SUPPORTED					\
 		(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |		\
 		 FALLOC_FL_ZERO_RANGE | FALLOC_FL_WRITE_ZEROES)
@@ -961,7 +977,7 @@ const struct file_operations def_blk_fops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl	= compat_blkdev_ioctl,
 #endif
-	.splice_read	= filemap_splice_read,
+	.splice_read	= blkdev_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= blkdev_fallocate,
 	.uring_cmd	= blkdev_uring_cmd,

-- 
2.39.5

