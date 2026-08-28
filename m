Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7302C469834
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925045; cv=none; b=E9bpggTRVxzpwjpKEht5XRg5yk1MEGmE98wpR544R8kLGHJEGYjW/h1PhTX3J8YFCb6sVSZChxJxZyNi2idZ+psRQCi21Wyxzxy46+qfKpSO9NlNdW3L1D6rguVhbxksi/hgU51oNk/0WkxqVMg/C9NHML9fSCIHfb0iOxuujnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925045; c=relaxed/simple;
	bh=CLBEYcKpWyuhrcgiMUWFD60aO3Fph2vHxszmT1moq34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFbsMZLSbwqcfJXmggXSOIgABpqh5owWy8Bz4MVWnj1Inrba8k+9I2u1tY0tzUuPXrgEdZvk/KJ35AA6JovK+VzsUqtgz+nJZ7zZex8+XxbDFvuqieIpQN8sDuRlhwJBn6BWjAq82dJAqCOYB59JttFyMhUnimfSUJ3on/hTCTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lXpIiGs1; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=2ZJ6UdCc; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lXpIiGs1";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="2ZJ6UdCc"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCYS8Q3930717
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Bgm9
	Lli18Fm8IY/j8xR8FpbXhUGGdPwb42mwnsGVJrE=; b=lXpIiGs1yvcVkoXZ+BRp
	aah3VZmrUyPV6mFS+VhqketrNQ2RqfVXqEBYRnBkUUe0o1wV1AYa0MGOKHwFgFWr
	vyu9F5LMzBI43aWEGi9OqL6qIbtzM1HYbbMBdh5tceTRAk5+1jvHcNYqnGUFA23b
	jSGjI+NBOaTwoTlsW16joScTiICVC0oDIRd9BpfITfAPkKVItUWKreTrVu/0ra7D
	I6ywj55ZQa8Fy8Pd9cpSS5TmaFHUBJH2kt3Nhys/EKQERzQjFv7sXmNJUUhXAcnl
	ymXEWf6xv76Ppn8D1ed/iS5bUJwevRDN9KYSm53uiU78uxa3QNNkj1SZfj9Atb4w
	vg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gb9q70sk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:50:40 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cea0b5522so3536886d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1787925039; x=1788529839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bgm9Lli18Fm8IY/j8xR8FpbXhUGGdPwb42mwnsGVJrE=;
        b=2ZJ6UdCcyrJinjZQ/lBFbR+QmLb48TYCes6ouy9jqUHD6V5wnZ5XI7QluGc5R/6/Jx
         udiJp8rnvMJjANjcFUeG05V95CKvxeONXBCb99+gIwIHKQyE1+QkVpZD7O5WdVfBcq5G
         Z3NxsqMoFmUypGX/aLAZy9kBSX3NsW61kPQbCZU4N3wt3Nl1K3hcBl8tjVAaBWnNZKCk
         RLPwsYxbqocI4TZVCF2SXvB8tNoJJGnkripSQu5bpHmniaI87jxNvmlI1w/HGfQ9BwLj
         RCi1sCBrCNDxYJ6kMgaAPlAT1K1CDLW4d3SxHtEzMim829c+2ds1i4zGGLPfRK3YUML5
         mb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925039; x=1788529839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bgm9Lli18Fm8IY/j8xR8FpbXhUGGdPwb42mwnsGVJrE=;
        b=pciHxrdlD3zy6wCJJxx7yOCi46mTOSBN92JYGttXeEky1V+UBcjOV7h3GA4ZWW01E5
         rObA7pyz66j1D5smUcpx1Gzld0J8cLeN5VxyH+OVes5r6ZsM3ngW2y3Vg1gsLEelEV/W
         1HBmXKTGhvmW1IcgC95D/nMsXd+XqC2VnW61zgR5j58jxIAllCwjaThDKj155VliUVJc
         RKvdmqOGirNniKUY3Y5XclClqG22l7/UgpGvgcqZcRfAu87SQ0CfjjlD24qkkv4yPqqA
         VqNIhfSdUvnmP+7cphqXNgZPLfQrxlVeg1L2rtYkjk/6VkjbPV7vypt4oSLcGqtCkk8m
         U9YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC4v/fkukAolPLdJ/2OVZBE2ZG3cWaB96x7Ii8o1HcNjnMbIwTtu4a5x4CLEm5s41jGK+Cn+fqwQXJaH4=@vger.kernel.org
X-Gm-Message-State: AFuF++lDFf3fy+MsNKcK7Zz2IalEw6zFZhMI/g+4A5YUnu2RxAxmfV/t
	4Dd4oZU12579FlU/dZCj4Nt89/2hRmzNhWdn5VDyez3uDnf+DYAViDtx9V5eA7uDHmKR+2SGnC1
	yRV+N3K46HB/dEjM7yzowsxBGjEhsk9kmEWH3rVnGaPFdICp5L2TbvTYlLRxVvQ==
X-Gm-Gg: AR+sD13gs4b2EUZcprqp/K/KumeVA2PgYNXABYLeNri/hpZAUHPXf9bbcoL1eIM32sV
	hvsKFFf+A+aumsvLSVbl+7CWSF1VflCfWKAhwEHTGk6YCuwA1LDpkF9HexCQo1rAAr6ZdxnHLRp
	CMdX0lpwTCNCNtA+NhGXuFDou5edhoDSU/iED8E5ep1m1o03/x42u/JqoNyPNfDfGwg76dtGhJc
	UYHiL2IhbxbNwHYub5gV3VEPdoFVYUGwDDeBxpQlakjR9rj2OUyWOu78GPhXE0lCRrwZU0MWjv3
	YZLYI2WzccO6MF+aJtlG3A6B6hgX0i1Bscep1C9zbHxkpd7gfgIno1l3oq4KKd6H/XDjom4ldC8
	QZmgymVhG
X-Received: by 2002:a05:6214:234e:b0:8cc:ea2c:f2b3 with SMTP id 6a1803df08f44-90ce0f0a733mr76345896d6.21.1787925038958;
        Fri, 28 Aug 2026 06:50:38 -0700 (PDT)
X-Received: by 2002:a05:6214:234e:b0:8cc:ea2c:f2b3 with SMTP id 6a1803df08f44-90ce0f0a733mr76345216d6.21.1787925038479;
        Fri, 28 Aug 2026 06:50:38 -0700 (PDT)
Received: from [127.0.1.1] ([45.130.83.151])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4534ebesm15645116d6.48.2026.08.28.06.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:50:37 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 28 Aug 2026 09:49:56 -0400
Subject: [PATCH v2 7/7] block: remove dead metadata handling from the async
 direct I/O path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-blkdev-fixes-v2-7-32f3f40cebed@columbia.edu>
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
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787925005; l=1284;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=CLBEYcKpWyuhrcgiMUWFD60aO3Fph2vHxszmT1moq34=;
 b=5WvKxt3K2LYokFDzH4WeJTFTA7gEIVIWCTmbVlba+tySOCaeA5kMtbAcp9DpKL341If1ztIEY
 xh3MbLbTCOAAGoQ8NrQGpjPrFv+GQRpn8+uJLIHNzo8rEQPhfBCqT+R
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: ie8cwU4hyLueUWo71A-SoGgdwn6XZ_k5
X-Authority-Analysis: v=2.4 cv=IKUyzAvG c=1 sm=1 tr=0 ts=6a919230 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xDWFIMX55ayQNp92vt0S/Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=YZNyPf5b8iN1AD22L6QA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfXwGH/ppGaWPYe
 8WVgFifbPR4Mkgiae+y/5CfYcpIu83mZ5w1bV9qCemD/4IzA08P1WhnskjjaUlwTeSlhEvLK0bI
 Lt4N5slwT+EQV8CtOEOKX085Bektu5y//9+QQKLBW/sPiSTLhr2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOSBTYWx0ZWRfX4qy9wpJNAK53
 Mr3qQl8cB7i46tuqqL3EmWF8+yr/yM8OEtghvR9e8U1LjvBNB9CjaS0tKl4IQYi6sZwt/cC1SMl
 eC7N98RWk3gWjdICpm4tX4XpigqteJK9ZAGLl7aSNNia1605dyE2a6f++RSNSdTrsuGkfxf5apY
 RflcbGOiHt3KFhW7ZICUnwr2yVufviVcG2lbhxIG9PKiAjxCBhTVPW4aEWsCjO8kq2nq9jr3Swq
 daY1XGQ3jeTno7qUWgxBINHt1VGiYc7Cq1lSPRLvJJo/HJOg+BR7OU63XuHJfBGRCHZhlJzqzix
 Gt3UeSLRo48Qgn8kSITsogALYFRtIVToQW1CcLVK+arCthlu4VS6CejQzX5o8CtyzarI2/uwHX3
 vz6v4Fr5LWyMfIl5CmBMvwWWgPm8KE7wN82QoJWXADY0PyQ8qKoGB/m85/fqMusWg9K6YLXIGa+
 eiGoM3EHU4Zss6JK1EA==
X-Proofpoint-ORIG-GUID: ie8cwU4hyLueUWo71A-SoGgdwn6XZ_k5
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11888
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=10
 bulkscore=10 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280119

Since commit 2729a60bbfb9 ("block: don't silently ignore metadata for
sync read/write"), blkdev_direct_IO() sends every IOCB_HAS_METADATA
request to __blkdev_direct_IO(). Remove the now unreachable metadata
mapping in __blkdev_direct_IO_async() and the unmap in its completion
handler.

No functional change.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 8769bb13df1c..1964cb113842 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -312,9 +312,6 @@ static void blkdev_bio_end_io_async(struct bio *bio)
 		ret = blk_status_to_errno(bio->bi_status);
 	}
 
-	if (bio_integrity(bio))
-		bio_integrity_unmap_user(bio);
-
 	iocb->ki_complete(iocb, ret);
 
 	if (dio->flags & DIO_SHOULD_DIRTY) {
@@ -376,13 +373,6 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
 		task_io_account_write(bio->bi_iter.bi_size);
 	}
 
-	if (iocb->ki_flags & IOCB_HAS_METADATA) {
-		ret = bio_integrity_map_iter(bio, iocb->private);
-		WRITE_ONCE(iocb->private, NULL);
-		if (unlikely(ret))
-			goto out_bio_put;
-	}
-
 	if (iocb->ki_flags & IOCB_ATOMIC)
 		bio->bi_opf |= REQ_ATOMIC;
 

-- 
2.39.5

