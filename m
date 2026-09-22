Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE663B3BF3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045665; cv=none; b=G+veIltQNFfI4r9xEc5TI+DkLAOyVCWqU/WR6b8mSPT1qB90uJwgAqYFME4hwuoq+cglyTmJALTEdicBL97oeYuCzaWkFRs6u9PY+DeTlWTN0F8R0otHweF2ZvT8OhtxsD62YvRiKtCZWAPFUl63qslAo2CrpbWcdRk0ok3IF/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045665; c=relaxed/simple;
	bh=nq9znRgRZjLWqaFLfeT8on7MP5eoL92wgy0gjCnJo20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T//aX8KNhZePcMOvAQXIssWPrN4QmeD3l3nSqjVNJyMwYuYTvHTnlwbijdq9ydlSNBeHIanCAccv3kh5zGLrM6dIA7M9qqcfUJLshml0koBq05axixMAcPYXqDetwMT7dQV7fYNxHk5TXyBAVPr44fQB+CGYot2gCbx2qwe64Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=K2hYc3zK; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=2V5FIkno; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="K2hYc3zK";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="2V5FIkno"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2a01J915738
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=KP+P
	vJoAhQCgzlvOXJ2L9SVLgK+v/z6TgoIKhrOsOzA=; b=K2hYc3zKyKwXGOoR938n
	PnwCqEdOcGMi42fT3DLSN8CKfiievseaUARRPtDCxwhk2lQBPqMuTxt0U1LoxOBS
	XiyRKpPwxtOK7KSVeCdr1T8PLAQjzRO2rDnVzwrkvRW/C1aAnuMbIG5PRxVmyUcn
	hb49yWeYT3NCRzG+kPuwBkH1M/wSTavru9JnP+BQpPYlvWASL328YeQbMioOQ5df
	HNfOPhHhMP6NIhPJeGXf8L0prsDZT/oMFIgZhxAeQeto9oBsuFllT7ILaSTGSAVH
	k+rL0IjvOZL90bBVfCBaFqMoDufEORqwk9tOLcKL0fdhculYMSkX+tqj9qujNM6f
	aA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gu7rac9pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:15 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530d86d40acso50978311cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790045655; x=1790650455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KP+PvJoAhQCgzlvOXJ2L9SVLgK+v/z6TgoIKhrOsOzA=;
        b=2V5FIkno6J15vC2P1ADpKluMlca9xx9p0KKi4DRxpmxkOmP5+Aj8Cfa7s+CkiQe3mc
         o/urTER/D80t+1+QwH56m0V9YIUK5ZHO1ivjaTHQMbDoe/KLohnzF2k3qC8hKkWXGTEM
         1hKMvRRjSvxE2lpchr1bwZcyt4jM8zL0jnoeIg3EdogFjwYBzSI0Mh/r+s8/7TYU9ZQb
         hbwfYSkedpGRWhMZp+mNRJVfawaIBCVoSa8kVMjiSvN51anX7pBESu5qckEJQEg3UK0k
         zkw94X03x2LRGICS0TwaQG1VjM450hcjnOclBY7nEyZFiFtN4jHUtPrHxbA1ST0XEUrf
         xH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045655; x=1790650455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KP+PvJoAhQCgzlvOXJ2L9SVLgK+v/z6TgoIKhrOsOzA=;
        b=hE+VBMwiD+ODrj/mCmisUBCrhWdUkiH59iMPp4Ic5dxdX06y1lTWP5jHzL5T4Qr3Ai
         Qq1D149RmjacbjnEhaPtdIGc19yPgnVHG/E71X3r7saNY0vqMnbIQ4QUPxD+9nWs3DhM
         lTnfMCfjDPx30gzB97PheoSLcSuFmml+tu3B6JlO0OTNvothO4gi58G4YoLrcSZJA2nk
         jneEYU4o7GPjTUTSWpEWih4STbIfjapbF0jrxhbk99CJuJWtcO5ON8XMEUBvJePI4BpP
         j225DNPzeB21mMSJPQo5q3xgxrmMKSAi8OJooIR6vMSHkl5RDbR8KBG09ANAqpHqUw72
         xM8g==
X-Forwarded-Encrypted: i=1; AKwUvBwlT0SylAETnRnbDVVONHNMiRHIc8GoWFNZ2dPmuBNDToVlZFdMyHFr865EBgQsSR/2F6KI852XZzTTW/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lo7DYBwdjsMBp7aklNNb3b2dzEgHg6dMqKCOOY7lK1Gp1iSVQr
	2CZTtcEZbLx0TyvUVIAEBTmFiv9kUTNPR3Ju/8MAYf/CLpjYF1UbO2JLrawp/r1fVKh+/66TSIL
	I8aAKBDDCXcquMjpfx9W+cRaMqXeJbERM17fxKoG8N8Vw/d9yc00SdU0nRK/ASw==
X-Gm-Gg: AYBFou1nn7MbpdHbATijXs75azXoVKBwgHA749Fby0m4HqgeeOVNGbuMz5Onu/VBk8T
	IYS1geQITj7GehJWIK/pyxB0xWssBz1jrJqObPoFfF/VNiNRstv/eqGDb8Pjz7aeL/4q2PWWtp+
	dxDNF8/SPqL9PaIZ3foavuefbk29TDANs4je6nDh/G8QAYgbESRdnf/wDPw1bBw2ALwxIuUSgDS
	rTEvWNUNpEkoMYzklLzN5XaNA+/ZkKVU2INGXKgDaZ170p312yXL+h5lx4TugywrRhEPf3+P8kW
	6IOvNw1uy7AwCBWm3LcT1oSQxciU9kHdC93tLhpaCQtNIeGxoR4xF3RlCp7ne4A9pmg/5b58AEW
	EjC+yhYiCA0H2ka8zme2Z68Cr/f5WVsrjnm1KveGSYhjq
X-Received: by 2002:a05:622a:15d3:b0:530:318f:3086 with SMTP id d75a77b69052e-532d8d5c6bdmr36943681cf.17.1790045654943;
        Mon, 21 Sep 2026 19:54:14 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:530:318f:3086 with SMTP id d75a77b69052e-532d8d5c6bdmr36943471cf.17.1790045654505;
        Mon, 21 Sep 2026 19:54:14 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18fce9fsm2048421cf.15.2026.09.21.19.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:54:14 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 21 Sep 2026 22:54:00 -0400
Subject: [PATCH v4 3/8] block: take i_rwsem for the splice read path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-blkdev-fixes-v4-3-e2801f71ede9@columbia.edu>
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
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790045650; l=2886;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=nq9znRgRZjLWqaFLfeT8on7MP5eoL92wgy0gjCnJo20=;
 b=7dVFcPnIbhn6HEGkPFkd4WuxV2yUl4MopmXtP53F+9o2WU0cm5H/Y85ki2rRu01xj+T0gEz7C
 Y+WQVZTvkTgDOP4lHzo7gi+6WQrpA2y6M/M3+1E8BZJ6vRHT1X3hjph
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=fIWsTpae c=1 sm=1 tr=0 ts=6ab1edd7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=VwQbUJbxAAAA:8 a=JF9118EUAAAA:8 a=kXXCQoMOyz17bj_MZH4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: BAHCNzG9e77uJEnZqsljNU31GOGI-9yR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX2ug+2TEWaFkJ
 v+jARpM7ZH9g8+IcmIHS6jK8ThMfnludXIu8L80zmYeZ/mLJG1t9KfeutDUMnm3y69eBMeFuEyX
 MYyQsAi2ihR4UYPfx18yNftbpFHOGA0N/dEb3r2+HSHYwsySQqVj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfXwgaPYjwv1Mcm
 3g9ou1v64Ksn5zgcIiLbEi6OjMq0J6g7XLIbQC8dPD8zzUxlKQGuCeeTfp5djHQdlwSIAzEmEUr
 G+v2CFNiEY7hG0RxiOsFWbC8GN20D6CxyQeYOleqZK9mrPug9Oy7PKh/ptQRjDTNg6SqA12lfTe
 jQGeHVLtjdCt7/8utaapd0XQzKG1y/Hlo0qgWZGAOxLfpDz4tEEK191amyJyM2JqkuoJTISAqjA
 Gdolyzd5vGkpPqUdhsG/pXztVPeen+piOKIzmcXeACpwE1y2+2Y/y5PXX2IlCyfykSkDP5mA7Ah
 /P08V28LQB6VeVEvV4h8+pbBmGTk2eAOTt7nAXRGL94WPtOMHzB/6FqgyKTC55Lg+ZhM5Uwqa8L
 5OxV5Y+9wPqZl0U41X2/oCOt67/yiF6GxLJ8+gPFU/er03N7q3CmZ2UUZbdn/4NQeAGxdMbh0R0
 GKMlcOSL4Bapml8Em5g==
X-Proofpoint-ORIG-GUID: BAHCNzG9e77uJEnZqsljNU31GOGI-9yR
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11912
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=10 impostorscore=10 clxscore=1015
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220037

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
index d5f569333f46..a51814821100 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -855,6 +855,22 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
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
@@ -956,7 +972,7 @@ const struct file_operations def_blk_fops = {
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

