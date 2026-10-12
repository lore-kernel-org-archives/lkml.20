Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D334BB27A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825483; cv=none; b=ugeKX8P5UOWkosjhPwR9G3U7CubSEg2gAk+5R5cTkotRZtWWOYpfU51ca3zGsdEo4n8rcitBinIzKT8dn1fAgIRyc66NDRhT2DJN3qtjqusdi8sNGXKqipbQuUeqTDuKBnkGYxHZ0S7x8cYVBIdrathw39aMeQbjvz/Qw8NNrrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825483; c=relaxed/simple;
	bh=gbFt8ciOfohrHWqv14Y2EFhv2nLjR29TaCi6EnMiTLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZ4c2Jx+Xy8WKFL02Oiy8MJFpln3z8Fmige5k3Z+qOIjhwIoa8RenNrEw2txujApwY8uVO7RRj3ZxIHI+oYP0NOi86HgwcYyBh3HGmUnDzpYtBUZsSPbQvIvZX5RkEDtld3YXajo5p6mKhDO4Nh2t1gRUe6nMI1epFANRa+YvlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Av4Qo6lY; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=0TFvlOu/; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Av4Qo6lY";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="0TFvlOu/"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CGcEvG1515963
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=NMVd
	rWLnEXcyjQrDT7O9R3xiAAqaSp8nj0+FJeNk75c=; b=Av4Qo6lYlRQCds4gEh6r
	FKf8uF+b4OepNeQLbiAuc5zkqyJ6LfbEatEQfvjXnUX2+fHhOtmwazhX7lvXT+sr
	eTrPWnYhJ/lA3+40AhBM3RkEFje/HuGwqNLNFIt8Qu/WbKZrD3Ym+t+1fkN4WC9J
	F8PaGEd8/5elCfKy4c7w5kykchlUNkvT3fnbPtfSK+R3IiTa3qDbjA6FZIrsSJLf
	RDisuQhRhdZ4fxbbyCaDitqaRNjaFrO+JawAfeFSY/zmOOurYiwzIpXHQRBAAC9L
	lECj4jOzMRda6zCOTmTd08twkxO8bf8IdY9jE6bWCBNd/xtL2mHLwOpqwY7/B1GG
	0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h8y4w391v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:18:01 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535294e0f64so42803101cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791825480; x=1792430280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMVdrWLnEXcyjQrDT7O9R3xiAAqaSp8nj0+FJeNk75c=;
        b=0TFvlOu/CTG5+xPFQvVBXRWusqgFncGUVeaGoDRBHgH44jUPrsKbU8yd3/xh31V+q7
         QVprT49SA/UgQfVngburCVgIz/c+IDPJo5UKFHgdUlmF5fNvJASCVfl4rrzNYABTEySn
         uA0BgtmpTuMvcNy5fy5aQUIQ+eyFEcdt3J910rmbxhWkoyYnCiSNd98WFfuYB7soVkDs
         bTBGMwn0TYYAV1jNgx4UZSErXA4XxCIEJNs76opqVmR+yre3VFxeWULQEeEFV5kVWDWx
         5BndKbuFV7I6LfbvbAdLx7+0HbYd+5e11Lys6U2I9KoWz6tJM0IWCPSWQdjIpQb1O5vx
         NXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825480; x=1792430280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMVdrWLnEXcyjQrDT7O9R3xiAAqaSp8nj0+FJeNk75c=;
        b=Fyk9F+8FYxX3DHrzBoNd06BL6rPV0iDo+xxl5YACMMaPj7hcSqP4jwD4G9GieC1Z9+
         /D8M5nrdnGjUoqZewV+qVBJE7ryjJ7Jf79bpw2PylLYEyGO5ET6Q9rmS9zMH2ReiWjwh
         PkkbTkNpsT/bOAA7K1DlcWR1xzPmqdO24A5EVaEKP94zTZq5Kmv2sUXz/TnQtpWCXrhR
         omlSP4GdA6GkW0BdxsKEzhhJN7WLz6aXkJmJIB9MvYGngURyM8tKAzRYHr6/febIZBgT
         wlxqIo2B9mAjsHkrnxvl1uq5P+8os9NW9wa8QwJfNULgjWpMIik52JJvx+r4UZLIgZfM
         VRJg==
X-Forwarded-Encrypted: i=1; AKwUvBxb1mRO7e3ehOk4QLlX+F0+93myTiu4jfERK0SEqTm6+15LrShWX5cG2xfvF80RKTUckrXxlGck9XnJ7u4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOJspGm7K4ThoTsXueDLQV7dBq/gSAfkAl+M3FWv+u+ce0tixZ
	CnIyxnwcU35JufkUFA/jaMb/dpijULWrU6C6nR/wAtyN/3UKqdnlVjMZMuX4F20YqaAbnX8zcoK
	iCd6T9kik68ZHmjnfMXa7+4MX2t50zHaaE5iF31LYm9Hjfy6ZVwJbqXVrrkXatg==
X-Gm-Gg: AYBFou3jdpTLQPHeipZTTo+vN5nJbNHEojCFypBum+8aCVSSPtXvOJQKGHuwEcVx5Kj
	VHwRpfOUj0x/FURtAaYBNLJO9rB7mauhY1bUvMb5ygWWBnHn1K2Ie24Mn9vPQ380hqLM43iqmRL
	ABXakCqaeRZpoVcjvZvDUTwcwk3HY2hOYUtzqPUiMaj5dEoZO8vT2u1yAnkr68udt1qvMsepbZS
	FFf/GPVLYV63dYEnWf9YwTvgUDQtmmlg3IIkujvlu1HZNdS/IzGa8qVpIBndfb8UMpbs85bW8GN
	E7YPW4EGPKWuWIjUqsNcasRHIlzsRpTh+kgoFf/jNC3WUvQ7l5xyEAHQZMJQrKlAU2HB06e9CXu
	619QpXcOyPFrLvR4gNzV2gDT6JNiZnA2tjb1CsshWuTlfrco=
X-Received: by 2002:a05:622a:a07:b0:532:d0ab:f3cb with SMTP id d75a77b69052e-5359fdf65d9mr164802341cf.59.1791825480462;
        Mon, 12 Oct 2026 10:18:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a07:b0:532:d0ab:f3cb with SMTP id d75a77b69052e-5359fdf65d9mr164801951cf.59.1791825479913;
        Mon, 12 Oct 2026 10:17:59 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b79a186sm84105241cf.20.2026.10.12.10.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:17:58 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 13:17:41 -0400
Subject: [PATCH RFC v2 2/3] ext4: never fall back to buffered I/O for
 atomic direct writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-ext4-atomic-no-fallback-v2-2-c4b30c60e500@columbia.edu>
References: <20261012-ext4-atomic-no-fallback-v2-0-c4b30c60e500@columbia.edu>
In-Reply-To: <20261012-ext4-atomic-no-fallback-v2-0-c4b30c60e500@columbia.edu>
To: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>, Christoph Hellwig <hch@lst.de>,
        John Garry <john.garry@linux.dev>,
        "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791825472; l=2351;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=gbFt8ciOfohrHWqv14Y2EFhv2nLjR29TaCi6EnMiTLI=;
 b=ENBK3P7gap6/JSjV/fjnYsUcHEMolxGfHrZqXWM5mSIVrjc/3fxzRoQmWqoATnB7ZpHBdIrlZ
 uEzTqTBqv3bCyhY+WyQJhJZWj8EFnLp9stoatMPSIF3095emc7jksrn
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2OCBTYWx0ZWRfX4VGqMfKOYGHH
 5foU3qOHHR0BWc/YNiaG7qGSq4Ge/zlSRLJHUY2MTydwiAv3OD31IqYS4j05UqIOIFtqZyfdHe2
 CyDLhjldlM67xdOLEXZhG3AHARIe/9doafsFVD2EfGsAr5pynO3A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2OCBTYWx0ZWRfX4obCDOHfibS1
 5OrSrsL2Udz3JpmT+tvnEVYCJzx50vJGMgQmKlACIug1D4Q7LiGPXma2J3akPnO4O0EePB4+e1E
 JhaYYXtQ0qn/i2qEPjmvuVNKdbUB191thXK3T3/ZI7cAi4omoQRCNQXpS9kEMIsmk49g2CQimJC
 3P77InnSn3VG6qtVba8frJ5nt2MgOW3NGSdHeilMw45h9JY1yfqHU41EuAyAEocWAFs47a4kMNk
 Fhr2YiAVgeJUBzxoL+h163fJAj8J4i193Ok8D0KcwEOBeL577k8agZqR2ZNEwETEuJQlzyIs+Rw
 zqSC9xY5NEC8gL5534o/8JeHPwTlyFYO1qaLkBDHSgt6Uf+vwJ7LmSaITBMIVcqqEHK7NJDVPg5
 KByjTLchqaZwjqf9PR5xu7J3Ag265tUa5vSe9VND7q7WlBClCgH0+XLoFq3fzxI2IUNE07aheIh
 8hS4ouSSYpLuvGdqzlA==
X-Authority-Analysis: v=2.4 cv=GOydgeNK c=1 sm=1 tr=0 ts=6acd1649 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=ExgVtMUaGOEd3M8Mp4cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pg0B_g2tDk5f8GLR2sEKKKEUMNjuUsXf
X-Proofpoint-GUID: pg0B_g2tDk5f8GLR2sEKKKEUMNjuUsXf
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=10 phishscore=0 adultscore=0 impostorscore=10
 malwarescore=0 priorityscore=1501 lowpriorityscore=10 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120068

ext4_dio_write_iter() finishes a short direct write through the page
cache. ext4_buffered_write_iter() now rejects IOCB_ATOMIC, so a short
atomic write would warn and then fail with -EOPNOTSUPP, as if atomic
writes were unsupported on the inode.

This came out of a block device fix [1], where an IOCB_ATOMIC direct
write could complete short when only part of the buffer could be
pinned, with the rest going through the buffered fallback. Christoph
Hellwig noted that ext4 has the same fallback and only warns in it [2],
and John Garry agreed it should reject the write instead [3].

In contrast to the block device, nothing reaches the branch on ext4
today: iomap requires the mapping to cover the whole atomic write, a
buffer that can't be pinned in full fails in iomap before the bio is
submitted, and a failed page cache invalidation returns -EAGAIN rather
than reaching the buffered fallback. A short atomic write is therefore
a bug, and neither a short count nor -EOPNOTSUPP is a valid result for
one. Fail the write with -EIO before the fallback, keeping the WARN()
so any future bug is visible.

Link: https://lore.kernel.org/linux-block/20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu/ [1]
Link: https://lore.kernel.org/linux-block/20260907071217.GD934@lst.de/ [2]
Link: https://lore.kernel.org/linux-block/a7752d1e-8ec1-44d1-a266-c287c315e8ab@oracle.com/ [3]
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ext4/file.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 19a8843ac420..11e375bd4ed1 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -679,11 +679,12 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		loff_t endbyte;
 
 		/*
-		 * There is no support for atomic writes on buffered-io yet,
-		 * we should never fallback to buffered-io for DIO atomic
-		 * writes.
+		 * Buffered I/O provides no torn-write protection, so never
+		 * finish an atomic write through the page cache. iomap must
+		 * not return a short atomic write, so treat one as a bug.
 		 */
-		WARN_ON_ONCE(iocb->ki_flags & IOCB_ATOMIC);
+		if (WARN_ON_ONCE(iocb->ki_flags & IOCB_ATOMIC))
+			return -EIO;
 
 		offset = iocb->ki_pos;
 		err = ext4_buffered_write_iter(iocb, from);

-- 
2.39.5

