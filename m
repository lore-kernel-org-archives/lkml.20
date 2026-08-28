Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AE946D09F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925030; cv=none; b=dji8CAO+1VAOQS1ijBSImslW+ZtPjE74qzowDjoU7VFVssIA73WLl0T7F4QM2FIG0ZPcXgyCV/KWjuctF8R0eT5JOHiRhlcc+XasHsk3O1bwdHF0CqLr9E6SwGj0b+yRZsu+Hbfd6/qgZT8zlcp9aVdI4FS+EHTrGw8De6aQOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925030; c=relaxed/simple;
	bh=dVg+Kna1OS1/t+OMJgLb0pIoDRWpFDUIK/hgTycNT2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uS2ZixwCbhOMG/gOCVKlO2SaeiMRK46SQmsiMxvetxBkpXcjI0JN21bQHXiyApcpPayAsE0bAl+59DKAdGhFLMy8z6NuxRIE8jlIPmtvUo/mrm7QUrMI1RHmKNjMU4HoC2jTaPic+8ERgP32+dMQOfmT7dWhW6mJuvoRdHXdiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kEzFvb4I; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Mfg8Q9xK; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kEzFvb4I";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Mfg8Q9xK"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCY2bV3231789
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=YQ2v
	5WPLuMyVBiCPn6/ythOOcdRgTs4YGXxw08VQDF0=; b=kEzFvb4Ii/COh0VNXWbg
	jGFLHoxKadM8kbCQitKcBnzHqsnMYyg2tGuYvZA/JwUEozzytJRFLGbYuBE9cSqO
	D36bVlbGBD0tIkgbyFSCTDHvtsOmEn9uoiA7DoJLdFD7l764X/sOm39bnqGY2/te
	cEK8Mso2PvZQm2yfNKji3prn3pkOXoFOmBS7Au8oFI+CCEDh0vlpHtzR/afg6i5j
	zkPKdtSeP332G5P+pVWxI3AXx3Y2P2OKSjMOgz5puTsAAkGcxluqVpwf/WuSugU8
	AkGTrgdsgOJm2GxOtddoWnOYvtDeACjv22baN0HOizFDe6z4REvWKFU4YnzFZ9mQ
	4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gaufkvgdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:28 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90a602a4e6fso25489266d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1787925027; x=1788529827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQ2v5WPLuMyVBiCPn6/ythOOcdRgTs4YGXxw08VQDF0=;
        b=Mfg8Q9xKe8cIpccpSISXftGDjO+Sa2X488by+o81ZkWDkR1nhrWXTmbDeAXsWnd1Mv
         SYfbKx/69iHDYwrKo24RVF+LnDCXE4cOjurTaYWY0Qb3a6QXb1e5a5+OTqMtjUuRoPgq
         AJTQXX+V17HB+u5/pG3e/9aR25GfOUwXEMjxtd4VJWWjJ5Kd4Q492ZACQ/Y/8r96kSzt
         XUstf7XMPCw5JpZyDEDyOAPCI8yYhhsLK53qfQ1LKuLuEnKYFs3wiOWJlwx1ZYV0xyCu
         oW3AQsU2xqtaeqfyCtelOP8rryFe4sZNshK+MXogLfEmYYYmDcmUD7+9ieWQ90yH32pm
         Ru5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925027; x=1788529827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ2v5WPLuMyVBiCPn6/ythOOcdRgTs4YGXxw08VQDF0=;
        b=HJd6sPOz7L1s1ClqfMeOs4t66rz+0ae1VClb3ndk80J7Z60omr//rUIC2iU+hG7cqW
         5OIyXl3DLfy1p3c+NI9cA3PWemkmLrA7DsNKJ9MDTk9kk/qLC8+tTK2JWK3b0dkC6LSl
         dyFABaFSw11oQ47WPWdlPGIK8wERxarQOHaX/tfQRUpTLua0MVVvRW+/hmOdRJ6k7Bpb
         Z5IbyXJWtct2/iL6Ql9Yl0Y+jCvs8K/V6GoqSCUAdGQM0wcTtwKSEgdCDvNkP2Wzx4SW
         TVJy8JgcQ7P6d+Ex42zXggVQIYTbBw+rnlYCJnoubGgysnP4dVhakt5H6zI4zEWUeK6l
         SIag==
X-Forwarded-Encrypted: i=1; AHgh+RqlPqlE0UAcsD9k8gGfeLG633xkWLT98yhDjCV4/kryWD5BPTdpNo989T4V/8bAPwXp1KfAkXbTHKjFdws=@vger.kernel.org
X-Gm-Message-State: AFuF++nDRa2IWyFiKg6YYlbKVYq7HKUlBMleQ8Scv9wSFaPiBKoh+JEq
	bP7A1X8LjmqQqL/B6L5AnoFtqjb3siVuDC4BXa2KVUZ7T3Ci/82YBSCz1Cc/fOhpwBNEDrRKieB
	M6uV0Mw137qdfV++mB5HUDLCTXXS4TtCKN7CjCocWUqS609nV6kFbZbonRotATQ==
X-Gm-Gg: AR+sD10smN0dUI3XpJ0L8KPWqPwmIoBIQQgcnVQaea5i358t2M0+5xc6kOX1zh8Duks
	1rtDao6XQSZLhQGqQo1zytDjPzDWgzgS0SKxHbL3GvmvcIMgPYI+6HwteSpkV8XXOXr2EfAqqgu
	YVRJZ664cM9E09byofD8lhkz28t680ARnpDiTSa2RlIZ1rT07uO85d3OZodc2zjMGkPUvA/wBvz
	SiirgSF7GYtiDJZrLmDL9XbnGo/KrXGo+HoQKBvJqMBGfTiJhbg1kvbtRXqFWSYlg1UdXFrbEd3
	5aiXn4BG3Mu3d+stuqeV86o27sZtvvLkEVn/sSGUUwXNr10iZgaxNVnMins0FqtMO3R4k2iVqjn
	gBkRhLtlx
X-Received: by 2002:a05:6214:460a:b0:907:bfc0:781e with SMTP id 6a1803df08f44-90ce0f1c9b3mr99273346d6.30.1787925027018;
        Fri, 28 Aug 2026 06:50:27 -0700 (PDT)
X-Received: by 2002:a05:6214:460a:b0:907:bfc0:781e with SMTP id 6a1803df08f44-90ce0f1c9b3mr99271956d6.30.1787925026237;
        Fri, 28 Aug 2026 06:50:26 -0700 (PDT)
Received: from [127.0.1.1] ([45.130.83.151])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4534ebesm15645116d6.48.2026.08.28.06.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:50:25 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 28 Aug 2026 09:49:53 -0400
Subject: [PATCH v2 4/7] block: honor IOCB_NOWAIT in the block device
 buffered read path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-blkdev-fixes-v2-4-32f3f40cebed@columbia.edu>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
In-Reply-To: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925005; l=1776;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=dVg+Kna1OS1/t+OMJgLb0pIoDRWpFDUIK/hgTycNT2o=;
 b=+LKbEJTPkxRdLSw389VbqFoK/GHLhz/RdywtxJgd9bmpKS+r3dMK94MXnS3zwzZfPjp1ib1jr
 LtdsVtapnE+Dwxgqd4SRQg4Jyz0zg84y2pw5wmLu536svMsqr6ZIElC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a919224 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xDWFIMX55ayQNp92vt0S/Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=s8mzj7eOnaliLhoSWqYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfX3sg/sj9Jf+jM
 3CplvpNBFw8VnA80JagG+72w6t3QkCxQ622u2k/AITcwSxGJ0BTPJ6+OeLL0sxI1vDJ2pn8TZdR
 fNcl1rtwfLLeGVTcAHj6m0TyGHS4ZmJGF0WHMKYVlfcrxaZAW9cszatMvwPHM3GwAK/amNaKVAb
 W8dyEGazX0imGrKG6wPXWCg/bcLgQHMnLzxtQ5n2yiWpyJAOP5JIlN1GqhePr99YCKIATiRPd8y
 +LJ/1gone9hbZN7j36So7n8+gutoqKFWqW3BOYfwiTxBxlr0Yvjjw7YfkWtfTUH7JRNDRr118TW
 pnWRmF3kPRehxRTl1ebGa9Cc8rbSwpDBdHkedvP6fTOf2NWvgqSTcevNf3wG6YXSOm9CWkQEjeM
 z8Dh5qGVFpbGgmtM03zxzYq5shd8JLyQ4njthy7/dtQINlZRbk1lLHlNunvk4uuD3vjU8J1D7NM
 /YNa5USlcty4RsP8Uhw==
X-Proofpoint-ORIG-GUID: 8kUZOpP8N7pU7UCaPpvsUBS2NUpcsCV4
X-Proofpoint-GUID: 8kUZOpP8N7pU7UCaPpvsUBS2NUpcsCV4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfX3G+ag1QJFkYv
 Zzsu0yFs4kk9gFpeSeRlYjpzyisy2RX4DGj1mJ6DyS6v7WINJ3XBI+XcSQqUXrrnvLJE1Smeq3G
 Qf5RXsIjqtJw+9ELiQbFepBTTk4eZw5edscamg4iBh+hNw1GtgQd
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11888
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 lowpriorityscore=10 impostorscore=10 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280119

blkdev_read_iter() takes inode_lock_shared() unconditionally around
filemap_read(). Unlike blkdev_write_iter(), it does not reject
IOCB_NOWAIT for buffered I/O, so a non-blocking read, or the buffered
tail of a short IOCB_NOWAIT direct read, blocks behind set_blocksize()
holding i_rwsem across sync_blockdev().

A preadv2(RWF_NOWAIT) issued while another thread changes the block
size with a dirty page cache blocks for as long as sync_blockdev()
takes, 4 to 6 seconds on a scsi_debug device with delay=5.

Use inode_trylock_shared() for IOCB_NOWAIT and return the bytes the
direct path already read, or -EAGAIN if none, when the lock is
contended, preserving NOWAIT semantics.

Fixes: c0e473a0d226 ("block: fix race between set_blocksize and read paths")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260802-blkdev-fixes-v1-0-a82fc549fd74%40columbia.edu?part=2
Assisted-by: Claude:claude-fable-5
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/block/fops.c b/block/fops.c
index a51814821100..a3a709697b40 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -845,7 +845,15 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	 * Take i_rwsem and invalidate_lock to avoid racing with set_blocksize
 	 * changing i_blkbits/folio order and punching out the pagecache.
 	 */
-	inode_lock_shared(bd_inode);
+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		if (!inode_trylock_shared(bd_inode)) {
+			if (!ret)
+				ret = -EAGAIN;
+			goto reexpand;
+		}
+	} else {
+		inode_lock_shared(bd_inode);
+	}
 	ret = filemap_read(iocb, to, ret);
 	inode_unlock_shared(bd_inode);
 

-- 
2.39.5

