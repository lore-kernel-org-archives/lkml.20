Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5083B27C6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045663; cv=none; b=q2UvtZReoHJhEnTq2iJg+Tqcn6hDKaR7VpYrdpDXLc4lltwET7ps0uavZiwj7usHetG+j9cfWRo/KpS+XZsSN6Scau9D5312K4a/MOW+nc9rLn9aKY9ykY0FSUEHnOT5FalY1zwFZdXO4onItGAv5f85d5OPkdU6oprRhxXqbUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045663; c=relaxed/simple;
	bh=EbC+zxM1tqI8jGM5V6h5xGabP65wDxbe+0kLZNaqFJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z41xZ0z3OI/dHuLeNSlVjyrIOFVx36zlrOMw1g+22G8ptGoZ48KDVPrIdH1EkCChdK7DMyFIjyiDgHWk+b7fJ05fT1uSBnTCwtfAzH0dqq4vDSufMQGNPTzQan7YKynIHOjxWHH87sGqPJOyFhw6vCCp0D6x1G1zE7I33BRyLSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=HrNROfLZ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=UF0QmMpd; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="HrNROfLZ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="UF0QmMpd"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2XQ3S853248
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=fCyo
	Pm82t/vQFUFDMN7TNa15BmngKFwJlt5ScMnEw8M=; b=HrNROfLZRDR9lv4nMZtz
	iPHcGTYii1LCajuBfX5TL14K0CBPvyjfbf+g8HthUMiBT0y8yUFFJ/OHUfvUipwJ
	GzYVzZG1zJ2ZbglZrz04hhC9m70a4QESexv6bCeV5OuDpakBGk83Z6778HQCCl2e
	vcnPXknT1CF0LatW95l5yDUu7uYD1mchGjx76P9aBN71sR4+TQeBgPgmrCmrHAsH
	/iYmq3Rx+YA9DYfmWu0Ee+UQeG4QanI4shyhvV89gc3NGrQF5PBmIpgoj7LyfKf2
	SBPN3CfSuW+UPf2Yn1n1gclqWvpCNv3BHIhLLMfBJL9s9SPq6u8HGrne1YUXjNDS
	AQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4guf3vrkjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:20 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530f5e827c6so83191071cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790045659; x=1790650459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCyoPm82t/vQFUFDMN7TNa15BmngKFwJlt5ScMnEw8M=;
        b=UF0QmMpdAoR7AzoZwR8ZbgJhSuPu0y3dnNs7I+KSc1sNz7OiGZT7GZAT5O+zYRY3TJ
         INtNbt3/+jMqZN8tXMU5ocwKaKTGlbn4af5IcZh2oBtvVW2VNSUo73hlLuIoHdjL2wTJ
         e43s5DtObmXvx0oQxdX2Lr4Z3rff4rEutk1B7k+3XtKWsXJ9pbwIypjvQ3bOMVkM4DQX
         jE4U9dbu/wtqOryHOFlNz++hz+/vwLkRepdeGrbAMGEBGNt8S+FuzdatQu0TBwLqKfcM
         yV5+ey1HUG9+BZfBlgHoJ4evhHPtiXCznzLT0E93BbgAkjtokJ8VaBzs3txeaYwIWBjx
         CD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045659; x=1790650459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCyoPm82t/vQFUFDMN7TNa15BmngKFwJlt5ScMnEw8M=;
        b=M8s3U3N7aFPiPHPDP0Mz5oOX8MPx9JuJrWFXYqodTtcj3BKICwoQku8aV8DXw5Dema
         Sz5TGXGfaOEfROeyyqZsYaBiUx0sXenmzmZdxDNjV9vAJiuT88dy3SxBbyNwPT+qKvlQ
         qHRO76jG87CuXuGmmTpQYvzjIUM4ayW/a/3ZNdz8pRTBlYyoCByv02FLFHb7uzzRepIk
         TdxAVj/l1ZHDd/5CteSHr0u78fUYRfiKzUZNvlXIoEBXioM8YjuTYqofhof/j1urBx4O
         hi3YAVc+PQSGzP9B2OBkIuVldzqTslhSm4zMO2MDDQQtZgzxfF7XxnflqdWSl9a5+5NC
         2NVw==
X-Forwarded-Encrypted: i=1; AKwUvBzzPWo8HHO8Svf03lk5BKCdGT01ckW1QyIKnhcpXWh1OHoaxGrFUOAPO0uIhV82tF8leSQbnU4QH62HkgA=@vger.kernel.org
X-Gm-Message-State: AFuF++lCd5zki/VooHxzOyLDuI8ZDtU1siD6dUocF+rwCSuLAJr+YHJk
	x3e0dPTpgI9EWEZsJzlDtb92pcTOFWI4DNeGMPG5kQzt2uOCOcNh8azwCZprXgZtBDSp993pLqh
	OhsUsygNCNsLJ4jXd0mkLCbBtWYVXS1ffG7G5ChkLpvmiHAiyq5NCU5Qx6Wc4ig==
X-Gm-Gg: AYBFou1TkSz12AQiaTlxilxEZ3OGFkUjUJIiJyq3DVxoizpZ+KQISznMQwlsYbMxy4g
	N68r8kQmfeup2A4tRnSlPrEfbAnBsI/VynE3x4AG3vFrlnJxyumiMlPinR3tcWRbm1lBOZ46Zs8
	yrxeWhXcUFbKVLPKaY8AsJEWsJkqe3hFK2PKyMjDWcOxjbPjGR/m6VYO3X9KtDhwwE10+Cnv/oD
	Uh35paw2U+e8HSHHa8sgJtlCInX/lCVGESeMLcJUJPMbU9eMm8cbYWjDL4nFryEaCjZtfak3Zyv
	ZUDdOGtUbvC9rp0sU9QzTGby4eTsmRiFPH5Rva1CJuLv8cH+kK+BRMIhyQm/KITqG4eii106N+e
	+gJge4JmXio84O0UvAz8NtXVpVfzka4WsML0EraHioEq+
X-Received: by 2002:a05:622a:230a:b0:530:f67d:83ea with SMTP id d75a77b69052e-532d8d31f2dmr37334231cf.11.1790045659420;
        Mon, 21 Sep 2026 19:54:19 -0700 (PDT)
X-Received: by 2002:a05:622a:230a:b0:530:f67d:83ea with SMTP id d75a77b69052e-532d8d31f2dmr37334121cf.11.1790045659047;
        Mon, 21 Sep 2026 19:54:19 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18fce9fsm2048421cf.15.2026.09.21.19.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:54:18 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 21 Sep 2026 22:54:05 -0400
Subject: [PATCH v4 8/8] block: remove dead metadata handling from the async
 direct I/O path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-blkdev-fixes-v4-8-e2801f71ede9@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790045650; l=1396;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=EbC+zxM1tqI8jGM5V6h5xGabP65wDxbe+0kLZNaqFJY=;
 b=yERiseFIyAnUCk63ZZni+vwp1NciaCnnL9jJ2tVTvoeYLsx2HpPUCDme8TFQIXwRyRoflEjN9
 /H6pW6x2mioAhcEpOVrUEWzzjpeSQ8S6fovNVbXT91kBp32OLbKF0A0
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: 9wAcukWwdLmRrDduQObIYTwORLalGYot
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfXx/SaszXyO7wo
 7ws7GujAI9mLaAoSJEVs68nGwTvfybM/A0Igj/qfbYEUpXmFeU8MfRfXOLHeapqq2jRE6sXdZnL
 KkEi0q8ziJN/n1VIqCAMY3Far8stptbe9Y7NMtP1lxgXSa7dc3aI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX9B6Ef2FxzdTW
 xTMKGk+3lc3JMT2Dd4rUMLzQgl4a1aR7A8JaG2dD5OjrfX+JbvpvuCOlOYBjBFtB3zrUWOxF2yW
 UW7SVz72fDh8Yua+QAIEaN+CvyrJUBGJ+MRt/kn2jgaxXegit3kyvPwRKwV3Pl2mv58JeJH9SZx
 hNfO2ZmIxaVWO54qxIyIlhLqJC3Atjvs6RjT30XrvIV0WVy9iHt0CR7p2pTUX2F4kuysEmJiz6c
 8+JFOy/ag9WqB+ZpL3SkiQaprryeD2RUi1jDe9/naB00r9kncaV/UJX6rhPgXO4gzJnzwgftylh
 I7tJk7mFNIFrR5eEFKte1hMSIzWwtSOszgLv7Omu5BlaIFaFkFiEQPe99nw2xsgDF9S/bYqqaZJ
 +BJQRaxblGymb3ePt21XgETSGL50Zn940TGKAA3ng4lmHf2SRsL/gig0YGkMJZ4QNz/qKcaqhED
 7jEfLPyzKq7MId1oLAg==
X-Authority-Analysis: v=2.4 cv=U/UHnuru c=1 sm=1 tr=0 ts=6ab1eddc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=VwQbUJbxAAAA:8 a=IE87Obj3e0A1gCLlgTsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 9wAcukWwdLmRrDduQObIYTwORLalGYot
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11912
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 lowpriorityscore=10
 impostorscore=10 bulkscore=10 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220037

Since commit 2729a60bbfb9 ("block: don't silently ignore metadata for
sync read/write"), blkdev_direct_IO() sends every IOCB_HAS_METADATA
request to __blkdev_direct_IO(). Remove the now unreachable metadata
mapping in __blkdev_direct_IO_async() and the unmap in its completion
handler.

No functional change.

Assisted-by: Claude:claude-fable-5
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 7f23778f6b81..55c2e606c662 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -306,9 +306,6 @@ static void blkdev_bio_end_io_async(struct bio *bio)
 		ret = blk_status_to_errno(bio->bi_status);
 	}
 
-	if (bio_integrity(bio))
-		bio_integrity_unmap_user(bio);
-
 	iocb->ki_complete(iocb, ret);
 
 	if (dio->flags & DIO_SHOULD_DIRTY) {
@@ -370,13 +367,6 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
 		task_io_account_write(bio->bi_iter.bi_size);
 	}
 
-	if (iocb->ki_flags & IOCB_HAS_METADATA) {
-		ret = bio_integrity_map_iter(bio, iocb->private);
-		WRITE_ONCE(iocb->private, NULL);
-		if (unlikely(ret))
-			goto out_bio_put;
-	}
-
 	if (iocb->ki_flags & IOCB_HIPRI) {
 		bio->bi_opf |= REQ_POLLED;
 		submit_bio(bio);

-- 
2.39.5

