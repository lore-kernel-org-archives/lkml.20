Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404B5439F9E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991294; cv=none; b=jLnIASQr59OZPE1+u48/MTQcp4X2gkBHYrunwqropDJ171zvazuWaBy0QEPl+d+luHOUN9k+XZEqIfLeow24K7z405Q2wdV/ZsNEGolfNsDJhH1NbyGraGRdcfdTNU0jx0ySmcY9Hw5NgCs5KDcuYz1CZ6JigOVKVY5p2uXinng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991294; c=relaxed/simple;
	bh=omRobIYeubqYt1ShRwO+xJfwqyahvimqDH0UuCrRjvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=heyMO0akc39NB7kpWkj2kG4xKJpi9mtP+7PwWbGVb00mRQHqYvJCbOfFUcNcMW4l/hW4AhXydAwvplQU6nYc3H3Rp7k3Cw+Cz9+dzY9+ZWiAG+ryR8yoEd1MTQf8LLGwo5sts5kFX8T6jLFfvr6mcXE8lhJ5DIOqGv05X7vJ9uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=JNZo3tnu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DjbW7m5I; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="JNZo3tnu";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DjbW7m5I"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689KZFpJ3492670
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=6i89
	u0mptbr+Jh3PRt95XNfEgizrGGtLlz3J/in9MkY=; b=JNZo3tnuLOTjfuuFK6SN
	R9s3lhOUMKEA3JQ6yxj4QLoqkBPKNdx3+WhZgQMRAyWpFYePUVpg86cOMRBBLcJX
	kW4YnPUzaTHGiPzS3X3YwvXA4oFBVxBCPmLWwyNM1rnpDx2wGva4AQWesPWhyV3z
	R7O1nRkXXV5SyNZuxU9Q7Vhq8/QoxQ313bwzrA+RUn8pzt/qaxqDFOzu2F7yl/Wz
	VqxiWUPmJ/wJjz5xgx/BM3x24pt6TeZ6WVKSsUSN7w3LpoXuD4eNectHz0V5mGZN
	3m9MAdRjQTMObbuFiQBXgwRksjXQhwZH1M/jAiMvWgeMbYNlr0VX6p/IbnLCMJfv
	Xw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gkcyfsree-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:01:25 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9396e0515dcso369476685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788991284; x=1789596084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6i89u0mptbr+Jh3PRt95XNfEgizrGGtLlz3J/in9MkY=;
        b=DjbW7m5IfCegrl91FmGn2bhu8ZkSTu7y9yL6FBldiBIZdOO+iiUZfFcdycTxZT2mTL
         5c4tk5PwHwX0e0nXdip7vmlUwA+ibq5L/FIjkRl5qb5IjYRMCo8dpgyvsCXaB4GT/jo0
         /ge7ZdCB6eemr1IZCWFGZMuUW5KOLkHUiYh1acwKlPeqvgXmPC0bntPHrqSwlYz1b6SX
         f6XQzL1tfTqI3+ovzIZ6Sqw0mcnuQNcCrLZGx2GPphQyPNALDrln8ndWDwpMSitb1o3W
         /x9O+7/hnziT0sw+EhKMou8+h7iCblj1v2pVc3Si+pCR1+aj1r3AIHMvBmMWf5Ixptpl
         jiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991284; x=1789596084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6i89u0mptbr+Jh3PRt95XNfEgizrGGtLlz3J/in9MkY=;
        b=GqwtHz0w17WU4LKZU1/bt6fvb1E909GKkzpRevSiCQU6i9KgJVQv9IGipNRLXqmEgf
         v/HcUhPQYdC6pvbSKtcwtLzsbcCaN026JOBU5jfAra7PVv/vbuNfXyQH5C5Uu6L3yx2J
         MNCd66qC+1aw86qzT2Rv/8NsXUB/iKwHDcqVwUKivllk5bg7t965pfNhju59k0cE30Rq
         mZSuZY9Qlbwm0y7rP+B5+Qr63z7ahFA6Aa1x9DM2FjkoaWJA7eCfNhEi3CEHNmuWunys
         eVqYicz4VTzaUPjqSDlZ2OTMYiMcUDz2ufyhcQgT9e9cxkLEAI2y/IGch+w8GTqKeMMe
         J22w==
X-Forwarded-Encrypted: i=1; AKwUvBxM7OQ+OPVDA8leVVUFbFapseGjXIdPbxfSt4ZOh/h8V4H4LqnE53o5q22Pde328jVfnycfBNgzpo8rI8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kDzyvgReRK/9yQ4XMCOTR0zHWFfsJfJb9OD5SvdRK3BnZFNRlB
	gQOFjPTdkYgNcBL+CplvzZYMPti39EKXDXoiIUc6NCLyQLg0pLXrwRb5mwbDOqVh1P6lIbkbANX
	UGSVoT0iONIAxE+V5Z+hE871iaWqh4bapUhXZ8EV6FbxX5k4+s0fqPRobJdqlHg==
X-Gm-Gg: AYBFou3XVGxZU6BbIbaPBej348zgQ+aovxTOCf28uct74T5jCMFUuEDeisiNU8V1RKk
	N+0FV4RjRoUp4ZeO5sT5JxtKL5Vs6ShemLbXYV/UH17ESV5VxkwH9Gvq/WAc2DpeGqAlkFnz5Z4
	hWyHSNDJtBf5zzstH30xjNWYndK2eODw+YQccM6p1jkETw56JrO9n+AZp2gLmk9SSeyg+qL1sio
	PuPV8TxHop3lMLqqIDod0jGIELwKCi7PLHlpRC15HBy+Ii+tEOzZfWIScKeLcGhPB+LlaJUWlcY
	2z5LZ5K9qv7iIeV55jvDxK+uMsJIBq8cOKEkmo4KFlgEQs19KBXy1MP61zMRjO6xRtDdx+rp6I6
	p9bRhpB0DN0uhXCXQ8xhHofbTPgmku3z3LmMFEBhYteApV0bD
X-Received: by 2002:a05:620a:4551:b0:939:6de9:208b with SMTP id af79cd13be357-9398058371fmr4235670185a.48.1788991264762;
        Wed, 09 Sep 2026 15:01:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4551:b0:939:6de9:208b with SMTP id af79cd13be357-9398058371fmr4235341485a.48.1788991249064;
        Wed, 09 Sep 2026 15:00:49 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-193.net.columbia.edu. [128.59.176.193])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbe31c6sm1535326985a.46.2026.09.09.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:00:27 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 09 Sep 2026 17:59:42 -0400
Subject: [PATCH v3 4/7] block: honor IOCB_NOWAIT in the block device
 buffered read path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-blkdev-fixes-v3-4-1a5222c6e8ad@columbia.edu>
References: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
In-Reply-To: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788991197; l=1869;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=omRobIYeubqYt1ShRwO+xJfwqyahvimqDH0UuCrRjvM=;
 b=9Nl/nBXz4hvk3iMfr00Au+HApKUeQvDeZ6iBBKqO9QJ17SeC8ILbrAXylK0i39U56AAhdqk1p
 C3uCDh4Mov0C6ijIxOEQBV2lv/lFui4DUz9SbYFWmHNXQ1PAMkEJOfC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=S/9MU4sP c=1 sm=1 tr=0 ts=6aa1d735 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fJxgZNdXt3opHMdyAp+FXA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=s8mzj7eOnaliLhoSWqYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: imf63zSO2aPX3amoCYb6OwuL24qwpVlx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NyBTYWx0ZWRfX+mNBKnMVliOH
 UoNUdgC04jQLSA8jwDm615F9AASm2ucTEQJ+rc8N9SHRHwadCaot3YVIhXnGdYWdO+9jerkImO/
 IVcmSwRXKIRHReMOta+CmNn8/k8ihnnV5ZCMdsSuhXv8sdro8qikPcjBQtn4JA8qQIrtyM8JVFe
 B3A8dPp81p4g7TSH8LfmSmz+BaiCT13pftnL0ZzMPDo9Gy0IamxZ0nVERaH90zoKuvPIeDtdEpC
 /icv18tGicCSJ6qN6Xb+VwFFw3xYHHYLeIkw07y49EOmcresOlq63NEC7xGnUC5NV85RdwY2cXU
 qNzlD0u9Y35cjCEU/RwI1aF3xz4lLMjP/XGeT5+IOnI/zCyFtLXvw0SMCGS+GIt/KxrzPRHhyfO
 DobJ2jzSY+FyrzWzQvWGx2AN6KbgusxX2HbOsnECwIbVWBYSOL7s/qzGDPy9TT9DPxXH5S6zm/F
 h0q3MjgPhuARmSBrN0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NyBTYWx0ZWRfX3vxWvCj/UJbk
 pMFjDq+lLP3vp7VY2lFAvCgf3fXvgK8/Sq9r8f7BLTpUvtGtR7LMA66nHoEh1nlMxj5rXcU6cSl
 vYpprDgHlHgb7U6rnnCHvP/7eoutn92Vr6QMwlqw6dFECToma8ph
X-Proofpoint-ORIG-GUID: imf63zSO2aPX3amoCYb6OwuL24qwpVlx
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=10 bulkscore=10
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 impostorscore=10
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090247

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
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
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

