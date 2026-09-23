Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E6433BAC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207824; cv=none; b=jjQ+C8wzhnEbtO19VumBvcC8HAIk/BEHamN+LnZMLo0o5Sqq+h/zRe+uNo1+N0JbVGrmsb3VhUiHEo0CrsF9Y5OKEfbJdTHIFaQvb4Abf1ih1/mvJWYMtqLhm7SZHZzzP69GMABkIhaSUtqNaPaH6Eb50pFzW290nZx0uKPqZvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207824; c=relaxed/simple;
	bh=yXeThnqDkkqQfZuxk0/UWy3aO+ZnELynhrbLzksgHI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeJlufsl08XT+nzWwSY1Ky5xXbdbBpihXs+lnwmPdWQRUF+np+S43JSZp/YWd/Vy9i+u3YtzYYl+xOSY93ZoC1fuTo7naH9xznb9Fh3BsXqXLkbGr58nnUj7tRWlLEBB+cOvS10go7KS6y94CnaH5DCggGIgv5t24BBHjet+52Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sj5b9uc4; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=yrwTXPMc; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sj5b9uc4";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="yrwTXPMc"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNCW6L3594959
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=tePV
	uFSvZh3YZ0vx9H5UbQsBPQSfTF32xq8p5PG2Idg=; b=sj5b9uc4LsyptVKr+OoE
	eTMaUxHRYpb0oukkyF9M/sqlvTEOh384V1RPIGb0H5/FOmaet2XLIrc41yPXv2He
	5xvT4roMGFGCne6FCJbUVnbuC3jjxf0MUi9N6xftBPxSoh4Q9Mq2IMEkS1NBavIC
	0xfX39reA6e3SCDTn64JhDwVB/Jx7SaEY/Y53RxEloAMuf+DHyy9QP0335/gjXjJ
	lMT1QPKwXyWbKt4it30YDciqfjjzF/mjEEYDvbazsLjWRAqlID1SgoPHe1wMJTKl
	dXgcBH0+SK2UrTX7hW46hENyx8jdx1jBYhZ33z+T0/gS4377Lc9EqSGL3aa7UFKW
	ZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gvhw6v5hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:56:59 -0400 (EDT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so2344557a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790207818; x=1790812618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tePVuFSvZh3YZ0vx9H5UbQsBPQSfTF32xq8p5PG2Idg=;
        b=yrwTXPMcEJinzT4ktvTbKKrgLFxQ56hHVJ86zqbTwJyyA96yhmNTV1a3mqiyFqL0al
         nDZQyFK56u3mZpR09kakpJnLpQS4CbWuUeJNuJtGz250l1xXTkAp/1rssRDiW67vuZqF
         3LwtG/YrNHT0PTPErTI3GGt8Z3wD7BsmvvFS1bI5UWFWhp6qrnnJp/irfzIjThBphy7C
         vBruNu9BzXH433BW1GE0Qi/y8D3EgYqUP7JH0oIPUqFZeSRi6PKGbTAxNQ2xCypOdXeD
         durIt2Kl3L+R1ntqStICQdVWeM91ACG6qDwfCoroMHPfiSKZf1LcWGiOJE1P4/tt+PqB
         ZYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790207818; x=1790812618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tePVuFSvZh3YZ0vx9H5UbQsBPQSfTF32xq8p5PG2Idg=;
        b=VVFBcBsnaiaaarvHXa3DijTpLVhvwG8ev+y/agBK4RSvO4F3bSmKVWFiZ2ahu/zwFb
         ppW2ecoT/FanetL5BwgQhbje0mYadnl7W+XVCtTYlzE5fN0RJlFC1+sL2tWw4/q4XuiX
         NBXEBbIrE1JUnqx8BexrcPPUTcc4MDVw84hPPfsLsdc90yKeK81FubudTpPVcA+PJWOu
         vlCh6n9Zjur3gKUCjF8qMIsCJiWi5HDYwBoTvVZ1qIBJnKwaQihFHfVAVTuBa7kdETyf
         JORCH1a5aN9klVT5Xmt6yyHn/C6NoXWOUPI7oF+Mnd/Co+IkseNG9shkGkkuDCnS3fh7
         71mA==
X-Forwarded-Encrypted: i=1; AKwUvBzahyBMJeZ75LD9iRDdXiXykXIJaXCYSsoqOL2WqzorVjepw3lmYv/RxB/nwJ6qbQSva3QiDs09eHHStdI=@vger.kernel.org
X-Gm-Message-State: AFuF++mdspNOalF8joTSfXhRsilwsCI4wa6L6qunjZLbIoyRXsXSZCmz
	yMbEX1FoMW2AcPU/b7wFnI+u0l0MKJu8h4wIiZJyg6v4tDkBb8Se1V2chBxNb+e0rjrxgBnq97x
	8dWlmWLfcxPTmpb1hR8aI2mKaQsTcxvm7m5K7vkHEuL3wVBGI/Rsz36NU7ZQSFA==
X-Gm-Gg: AYBFou33IGeDNE2o0gSct7y9o4FA4oB8eXQbCYdGZKDayZ4jR+Mf2QvAPY45g79H3vI
	E2N9klOu0ReSiyNaYH4wI7zzfRWtTnrgjSNnRbrlpKPtU9zoOewt/sAxeadFqt4REJiRbH9ht3D
	muG+C1LBVUx/jAdz2qmtnFwEuyk10sI4N3xEfRRpbZDqK4Gnqkmj60g54Vh4xxs5aOTn3/9goLc
	9DWOYq/5bWyn6WmdHmunfhxpgWIdHTehlJkeKlY0kazmJjvGicBVAxZJQ+hQL4lXQm37gyB385I
	QX79CtuN8WG+w6NwFJTMQXBEbztNB/NxX55mOfNQ8YyjyyaP7KUyqYLzK0BTOFLoXMXXzSgqZYS
	Wxkuzj3zI7GWg3WKLQllmd4zUyUEfn1Bmb+10QLv58mOulg==
X-Received: by 2002:a17:90a:d603:b0:39e:4d1e:d47c with SMTP id 98e67ed59e1d1-3a098606bdamr610947a91.25.1790207818505;
        Wed, 23 Sep 2026 16:56:58 -0700 (PDT)
X-Received: by 2002:a17:90a:d603:b0:39e:4d1e:d47c with SMTP id 98e67ed59e1d1-3a098606bdamr610921a91.25.1790207817951;
        Wed, 23 Sep 2026 16:56:57 -0700 (PDT)
Received: from [127.0.1.1] (RED-LION-HO.car2.Seattle1.Level3.net. [4.53.155.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976ca5f9sm1331613a91.14.2026.09.23.16.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:56:57 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 23 Sep 2026 19:56:35 -0400
Subject: [PATCH v5 2/9] block: take i_rwsem for the direct I/O write
 fallback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-blkdev-fixes-v5-2-89e60d66eb38@columbia.edu>
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
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790207813; l=4766;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yXeThnqDkkqQfZuxk0/UWy3aO+ZnELynhrbLzksgHI4=;
 b=QkG2d8Jbv7plkdNQIPKBKPZEtuwiBr0JNrWEczqcHSyaxtBfP4cb6kna3/skQP8mwhum01j+g
 xPTvsnpqIsgAJj1MhM7jYr4Q0lcCwmgWXpAHraJW1U79pTS3KeTw8CI
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDEwMCBTYWx0ZWRfX4+REdSmjBV1x
 0rQPHk/KMfGLwNVmdqpqtJo69X27uEBUL6YgnTy4IKD79Yg+GRaTtG4tdsGzwBOIbHUc54ZofwH
 NhxCnWA4JIzasSGvScbiG3gYv+RiQbqZmtL7rl7TGQBqc40PF7oL
X-Proofpoint-ORIG-GUID: zKMzzVmLBghZNrDp3A4tDjswKmWsmWH3
X-Authority-Analysis: v=2.4 cv=HcaB3SE8 c=1 sm=1 tr=0 ts=6ab4674b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6aZ3Ysb2zzbY2sELL/OBJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=NEAV23lmAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=JF9118EUAAAA:8
 a=HaKTZzbUtGO3MgJEFeMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDEwMCBTYWx0ZWRfX41T3+J16F0N9
 kOY7W96gp9pHuxHquLfqNuLdV5HOeM0OifBTOpccGyR5p4B4XBkO4Jxbh0MXQkJ2iPWNYgPhNx2
 MMVPC1mdshyKzCbavtMjeIISlmR5OLex6PcpXnmxymlBSOG28/GeP7j9d/v4eCW+ATMH1RYSdwm
 +VmNnvzF6GbKroqNV0ygfBSISkULQkg+niKDdxpFpvu1PDK+0AZ/rcyp2LBja6oBiX99EUwHk+f
 M6AHfM8tiiFLS19gxQGbv3KgHZcrelh7sc2a3JVMTABe0XQ2STU8jDjYhsCjNwDR/AWHpEluNo6
 bafJevtzVADuFY8mMrAyR1QVdipJL8lsBXtR7Y4zIoAp3uc3+ychLBOJTh/LzZHQ3WF+brM5SoW
 /nCIgaYupguM9w2r/CFW9/xBbbySFZp6qNhyPNDY8QQdOz8iPl6L/ZDhfQeVL026b1ZUUyCNJfU
 IOuq7ReeYbykG/yv90w==
X-Proofpoint-GUID: zKMzzVmLBghZNrDp3A4tDjswKmWsmWH3
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11914
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=10 spamscore=0 priorityscore=1501 impostorscore=10
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230100

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
index 8d74d0e57f43..7ff78b448659 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -770,9 +770,26 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
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

