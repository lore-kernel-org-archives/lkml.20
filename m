Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32CF3B71CF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045673; cv=none; b=qHaZWdJv8wOOPjuHksWVCD8H8vbinCYeCzKLorGuVQTlPrl/Xj++4iRg7fRqOxOqYkm2BL7eO32LD/sG2CuAoWf/ZhtmLGANa9y5SC/dDImY36x9TWCcZabinZ+UDEqIaAi6bTKmIcBYO6m7sAqoBQb8B670aniGkpzqZrPlPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045673; c=relaxed/simple;
	bh=omRobIYeubqYt1ShRwO+xJfwqyahvimqDH0UuCrRjvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiUYTo7Y49RFQcmcVt8apLdhy02gZW0hZuYgwetd39BFMRoANR4bfq2rvsLN8br2sIee3v42+6X7uc48ApPT5fM/mAJVlpPOKPgiKctO0/uLc541GPhbh+zHA9RxDRIhQc8IBNHSVdrvc/bH3JUsdGgENzWNLvAJEHa52A0NYbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=M5ppccQw; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tjZJ8eIk; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="M5ppccQw";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tjZJ8eIk"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2XJS1927644
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=6i89
	u0mptbr+Jh3PRt95XNfEgizrGGtLlz3J/in9MkY=; b=M5ppccQwzXRPdg+A6MrJ
	2W07ZiSmF+OaQvMQb7Ib09TkPNR0F5F2/zctGnpqTZZvonMpJHzsZpk4wCceBiRb
	DFB4bljXctP6LWA2rCLpYXTY5FiXV9XWDJ412589AHPeiA2xrd3n2V/wuz8/WgKD
	bknjvCEOwE8ze+x1SMNKl8F8JYY59H+aw1P4vO1HRLLJjipUWtWcNtbsEASv20bv
	xFmiSccNmmYaiaCXAgiNuUktE9CeVcy6SXQfUfQqq1be9z2JmiFHIAzTzo2IiN7k
	kQWTopsFiGnI5iFeqBcu4fHiUjwPfXTOH3xHgkq2WfH6xy0dTZJ6fX1izPUjdhQK
	VA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gu8h5bmm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:16 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5329e965ba3so46657321cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790045656; x=1790650456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6i89u0mptbr+Jh3PRt95XNfEgizrGGtLlz3J/in9MkY=;
        b=tjZJ8eIk+rESZb+/Ih2cyfJ/35TOIkbNjJWWOsH0qqvB/QwY3PsEtR4LGtHWzou7cP
         CuJX2hTslfsoeJEMrlL9qTKZnMg3qaW8/UUFt00ZViZ5zZpZgdFmzortiGPq94rgZHLN
         i2Gte/X9veOi1no3s6QD97XIb40OkDXKWNL5SFFv3W0y8pQ+iyqXFiAvFHvqVaX7TwXj
         cyjL4YDAX4zMUNZr6LENYZDAY87Ony2eMK6FTcAXSZWcvrSA/COW2h97dItVEpSd5cRT
         mvgw3cyLi+myA8FVHsQlM78hi3mu/RQQxDR4yJESfUeHhWmwLF7systyXy+e4s5tZJfI
         e4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045656; x=1790650456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6i89u0mptbr+Jh3PRt95XNfEgizrGGtLlz3J/in9MkY=;
        b=LI6D947Ua0A5sbq/ksNfVv7Ia3aDQViXt0EQtm9DgQC/mzkVpTSMA9IRCRDFRU3Ye1
         FSKlqLrAAfHzX+knRGVvJSJ07lLW4Ls5IQnRH2iCQ5ccLjAsjtDQGRB2krPeN0xtoBlx
         hHSS4xkUNY5owsYDd1cIPI9U02kUw2CJRXPvfOrqnI6gKRO5JlLG9/Y7kuyoH3LoAW8Q
         2EUF24Y4B1PkV2EKsmMltk6wvD4yk671E8j3IJIlaisYrDeNUxmnP59cIHPvTr1NPM6S
         jCuSfOJG0B1pwC++cDfTdycaBoRLC2a1ZVueB8YuV6Enepk1t0DUndV3TLc0TP7IcUWW
         1coA==
X-Forwarded-Encrypted: i=1; AKwUvBxqUrAx133Zo6MNLtdeEVcWsYsVbMOZSCAv4qQPlIXBPhvpbc5rVddAiNy4l1D1jsrd6xb/LsF7FBW4Pxg=@vger.kernel.org
X-Gm-Message-State: AFuF++levmTMvz+Rs/Yg6/yPWSittMfPMB/sIeYdNqCxR0IhBX4cA+KB
	J5qbSVCYgAiDqY7hOhUecS+wAhgKIexmosvAO/dlMDWHLdY9f8OaQQVjjQth9Kwqvb/qDNgjXbW
	hVWm6l3LvAiamecK6sNaNh8YFTaTfMT9P5Lumn1i5GF85UCza9g4d3xLt0REvQg==
X-Gm-Gg: AYBFou1577u4w9gp8MO1LMPpctImsnwkoCf0C3PeiYATvK1cjmPmhHcolIBen/bg2Sp
	5IQ/P7NhHEAwhwtZ4fBYdV8icnt2qYbTw+Qd4guXzxoufB4AlZutw42S9a2WX8YGeVQBWRTazon
	4PPk6awXRrZpAOtkURJv35dcLvS71JPBnGnL/IJmkWOztKTDkWMAxfwLzsbRFMAkNx4rJ/r2iMi
	0aqW5YYGKUl78v6jitIsYu7nqvHIFucfdmdGMJ3nZ738IvJKS9Wwv7nHeCctE2fqVfcMdltJ8X8
	U3cQXHXF6sBlQAkS1NmeoKoZFdRAyOu0GZNKPRH1/PA/c2Gprgs4DIpXhLc8VK1pqHJCiiWiOMK
	z/TL4NCd3i6LgZTD27j5MgMlliEiTmSOR0idq82bosEjF
X-Received: by 2002:a05:622a:c4:b0:530:e1b1:eae7 with SMTP id d75a77b69052e-532d8e42b59mr41695591cf.47.1790045656219;
        Mon, 21 Sep 2026 19:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:c4:b0:530:e1b1:eae7 with SMTP id d75a77b69052e-532d8e42b59mr41695171cf.47.1790045655381;
        Mon, 21 Sep 2026 19:54:15 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18fce9fsm2048421cf.15.2026.09.21.19.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:54:14 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 21 Sep 2026 22:54:01 -0400
Subject: [PATCH v4 4/8] block: honor IOCB_NOWAIT in the block device
 buffered read path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-blkdev-fixes-v4-4-e2801f71ede9@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790045650; l=1869;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=omRobIYeubqYt1ShRwO+xJfwqyahvimqDH0UuCrRjvM=;
 b=qT/lrNi5zaYhd+JzSKZI4UKN2sLJXIRxjskBolny/l4uz282lj4csoNWpPL+3fzZxW5WMp26w
 3FhmTJTqeDiCYNpmkWWzFqRQWANMWALonEgRf/JAAZKtqJmq1ShLQl5
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: jUPuTfN9DuwUBcP0vpq-4QSWLDzaK_R_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX4/eSR8oANZMC
 +A/J5LXMjh/qOZOCbX7zpSKp4moVj6s6BXezohnESQyjD+3vI5Sa1Yoo4lvg3pB8aH/509xrc6Q
 emydpA9cCyir6Em8f5BAvbxS2G8cg8jtAdmGPjY+1avvEHu2zRUsiLY1ldYO3oI60t0JiXSdkd8
 BuppO66XpoOoRvRAbZNMBdCTOHg6zasPRRNXhiOayw96D9b8OL25cZT8qPIpw9i3OGRKBVifxjo
 BRU4QALhWgFxwBdQ3pRDdhf9ZWCQQIXxPKmoVno1eWHr3mPMVMOsjlr5Ke4xd88WAj+UuZRq+Lo
 AhZFrCOT32w7STm1CwTrCjOfvcQITiKAC1rTYr1hjp4P4bECPf2i90zXiapSK3knlBz4og7lwMC
 aqlA+GHc9TZl9AamOXFxpiG102qzyxe1kptpcxCrxzs8HHYGscuEsoQemyYsOzc/IlAB+lD5P8e
 wJDhmTyE35AId74bfKQ==
X-Proofpoint-GUID: jUPuTfN9DuwUBcP0vpq-4QSWLDzaK_R_
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ab1edd8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=s8mzj7eOnaliLhoSWqYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX+0g2QEW/oC6o
 55qGrRC6L3vSAnJdB8aqfzdkJ3XM5p/F5OMzlJ2Uy0jemfnnNXHDecALszag8hb83WTs0JkIz9o
 GKpjsqF+7XE2SVN3dOTx2+sEGwr7fjdeOhwckfc8qFa3ggIlMgd7
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11912
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=10
 bulkscore=10 priorityscore=1501 impostorscore=10 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

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

