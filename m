Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431C4433BAC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207838; cv=none; b=gOViS1LU5OUF4DFqCgChTASOAEFOlmCsw1NW5RIsU0NFjlyiU7SmBlGLiNcrA7E7Ucq53ntClUV834YWY4oIehp25Jp1RmEomNaaQug5wUEWvxasX1kupAthMyiiv0gkLwfBH/y2B8dPlGVidaaRNb5p9m82lb0paHArRwW/TM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207838; c=relaxed/simple;
	bh=YMDQDXgHvisSOsY3WQrY2kVt6FOq3O9Ypoh2P+vxzKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNf7iQGsDQn/A2DQLvmO6wUBwkSaHIHA1vl3wjeQdvFNmIVg1j6LBuGU3IPYgQZ9u0ks9WAS43Dg1HEF+voGVYXJIn97xC8ZrobBtKUOf6mEEoMYcMQHL2AEU2CDRCf9SXI8EjdBUhpeoFZhzb3TdR+jbJCAY+TWAFmQwtWSr4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=PDW2zhaR; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=d1hDZ1Vz; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="PDW2zhaR";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="d1hDZ1Vz"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNCRCr2170337
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=cc0o
	mFVdeKpkhDBaIU83p8O9yx2QegCmTSxi6DGn1/0=; b=PDW2zhaRmjM/PwcRtiGz
	eZ2hTCCD6j86/uM17aF8r64rYhw73ssG5EIwsHgmc2WZqh3ZAj4B2gaHBBrllJym
	HJiQemEpkr49/l6zx1HsK5MAF1dgwxwY6F4rMZmyyCcDEzys9UoYDByrfwFCvYeF
	3LadGeN0h5eMPgrSjVDkVLcyK+O/DcpcK926aaFVe57qj49wWTB0BvGPFCbyYkxS
	YVOnMfyPnnYzBd0zvQzoeaf1GDH4c9cfbW3la8dsc2/STmFrJHxhycAbB699Lixh
	NpTPNWLQfrMA9MGTls7vwldTjrB+XcGoJhv3Diorn2clMAie7GlBiMTiD7f9eKYe
	5g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gvmrat1ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:57:09 -0400 (EDT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1382504a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790207829; x=1790812629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc0omFVdeKpkhDBaIU83p8O9yx2QegCmTSxi6DGn1/0=;
        b=d1hDZ1VzyJpDXi/AqWmaDPuJSIJXuFs7q0jQDQl9ae4hsl9LHnQhxLEHUL82Y3mGT+
         GZ7v73bSrY5bvqaIS18A0CKA0+cT6EEsRicXaLBWL5hVQ+9UTDrt1ItQJ6Q9BhO0q9N2
         tbIbrKMsptsMSSj4QXJmp3BBfG8cP6fA50knLCY3e2AES4WmVjOC/L/ifaSTxWh2tIZD
         6JaY4NWvlalghQM/8KvCj4fPFVlN8s9u/B2jbWmkvjb7Sa3bd8rdxsCHc/ZQSo2aqoGn
         XzaNucc3jZDmW92K4XId6hRgH8nCTnSePQVKeTfsxmRdNiRBR9pm7FZAsN4Gz6ivLuEy
         WfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790207829; x=1790812629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cc0omFVdeKpkhDBaIU83p8O9yx2QegCmTSxi6DGn1/0=;
        b=mangK8g/PUvpjr5Rjj6Q+MYXIjuTYATLOWaRDQyaN0kCEhPCjARCVz3kWrjrpa9438
         WXMAqIzTQZ1PIeQipn3RhhymghbCNt6Cd9368hS6pVDG0YAan9DPbY7H6s2XpL2lKkb9
         SVqt7UBiKGXyWorMAM6ETThEQB0HAHpGwkZel6A1ZuymR3r58LdxfvWl1dDQ7GuIcWOo
         5RdjnCb7XpQf4uGgo3NAAihcuIN1/o2RMAgWZ0R+/k2D3qO9cVMclsYnKXcaDSF864Zv
         hXbQQbB5R2fXCOkrz38AjqDspjvKNvykvv60phY2X6+vzyAQ+ETObQ0OWVAdxNN47HCI
         UcUg==
X-Forwarded-Encrypted: i=1; AKwUvBxXDj6F8UEMikmy9s1q79CfzPNkqNwXzJPGjD8D0DHX/YAfg0HhHAWwOnOv8qQbifk0ipDCk6i/KD3WZ4I=@vger.kernel.org
X-Gm-Message-State: AFuF++le9oZcNOd++69INU7DYEQIPWc4Gdg28fNp8yKbIQPMPWzThOWN
	FoV1fZf6tYesa+ivoy5pMGmMnTbjgG7kxP8Vz7Md5pJTzIh71dTjX/Oa/n2waSdGPhGdM4hqPC2
	3Z9Lt9wm9GrPntTPKhNw/397fW38TUxYK1x4CirftbO3SWNrU2oKN6InTElE9ZQ==
X-Gm-Gg: AYBFou1IU0izl+bC2I0TEAwiqrYPCHEssMLrkzjSetX5/IT33q6MFgBlGTqWRUBgmzP
	5lrogZfNnDv9Z8+ZvOe0WnVDXG4706uGqZUgEDIqmckvmzZQ36MKscIvM+KA+BuWBsT5sazxJSJ
	Bt3bmJZ/bxUdDYuPjPdfgKQGzjY1nURlfs2p4BAaEMz7pscA6O3BprsZP4M+WEvnmTQDJnPrGko
	n4WAz0wlja+/xOsQEl91a+8Vclmyh29sE/dA8lFqxSIPm4jhayTvgYzC5uuOX1KD9R4Cus8wtVf
	nFFZ47N8L74VyA85VgW6lD58Qgdbgsact7sSyVUZ8lZ3Y/lti6AeS4tSCHDtaoqj7skUHGYPIT/
	qIJ9W9k9H+7HY4Kl4/C+zhb641XTZPN0I4+WToH6kawUA3w==
X-Received: by 2002:a17:90b:4fc8:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a098ce492amr490412a91.19.1790207828812;
        Wed, 23 Sep 2026 16:57:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc8:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a098ce492amr490405a91.19.1790207828356;
        Wed, 23 Sep 2026 16:57:08 -0700 (PDT)
Received: from [127.0.1.1] (RED-LION-HO.car2.Seattle1.Level3.net. [4.53.155.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976ca5f9sm1331613a91.14.2026.09.23.16.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:57:07 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 23 Sep 2026 19:56:42 -0400
Subject: [PATCH v5 9/9] block: remove dead metadata handling from the async
 direct I/O path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-blkdev-fixes-v5-9-89e60d66eb38@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790207813; l=1396;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YMDQDXgHvisSOsY3WQrY2kVt6FOq3O9Ypoh2P+vxzKE=;
 b=sPILe/kyUbp0UCL4bz6D402nDcKVbwLmg2pPSjHxEY9K3xV0BuZybj9/lGnB5Pvf23U4M1YB2
 0anpPrFDTkYCwMc6vi4Kax3gcCsgrwudHvLW7rNxmggYFs8LnnxxPGg
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDEwMCBTYWx0ZWRfX/JLl5VSlkuck
 jwzSjb3Yk1X45+Ig+JITPo7VYzNn/aufEfk3Gl0Fl4BIFClOcl9EHBrXELTO5lah+j3W+hkwNmS
 ZaQNnIf7XwdPMD6Y48RbAfi+ME+aPgF6ppnY2BPsYObZ7wfsBgi5
X-Proofpoint-ORIG-GUID: jdPXFrOto_0350oZJ6M_0RSd19aYqB2j
X-Authority-Analysis: v=2.4 cv=cPp1IVeN c=1 sm=1 tr=0 ts=6ab46755 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6aZ3Ysb2zzbY2sELL/OBJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=VwQbUJbxAAAA:8 a=IE87Obj3e0A1gCLlgTsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDEwMCBTYWx0ZWRfX9czfNIXx1T+i
 /ifRg5KEso68X+JtqY829O/9wDxL5RX5AazWfm4/kioA0EjkMwuaBZqB8aRVjJmyqh229FRFNTv
 5oZ9YqPv4d1t0eG9aMts/oW1l9uv9V9d37tnW23Lhy5+Gd/GNbQdBuMgbOIysb/o1Nx8KsP6XRj
 4ehE+CeCyKibTJismDgsiLromTo5M2MHCr5bRnSkq2VbWmVwM6Lu6tSp2UArjGtYTB/TdeXBynk
 dvHACAbJYG9QEzy0Y18BfYe+JqQqeGJ0HY6hDkrC/4KnQmHFnHcGI4xCO5p3rcSQJSa5dw0FioD
 iA3nsc5rjQ2pzZGeY3Kpdo4nRkXwq6Rn/3T4fA4E1PewxXR5j7MrBJ+WBJe+WlW6WlQqFjlQpr3
 Z13G17v1NbRyUxzvjMyXO3Hy1vL2ljwpPQqDl20GqZoX7lYLt2e0Lh6Ubkow+2ZNCs+PzL0aWqV
 rWZ6xM34m3L2dzyjXcA==
X-Proofpoint-GUID: jdPXFrOto_0350oZJ6M_0RSd19aYqB2j
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11914
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=10 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=10 clxscore=1015 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230100

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
index 59af4e808204..b13e8f83ff82 100644
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

