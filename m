Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818E30498E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034718; cv=none; b=TFlRR0wK1I8TtWul6xm9IUxdqC2U+l8Wf+APh+Tx3vc9O+ZzrWTgnJ/v7g/KqohGUY36xak2jaV2j8/TQbseOj8MtdY9b+SqLNegQY/yMLpUqpoFv4W2cbzgPMzigwrcNoY106N3WgczS+dFz10JrKy1ZHWIOAWbC+Rl9yE+bWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034718; c=relaxed/simple;
	bh=dFhC1z+EDvEt0t+4kDQuvuxnIcKAqfOusvzAzWnwYCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BStT4u3F7AIK47U0Pm9GjaVT6XELjzvCnU01tSDb+2VuQWa1SsTHoDN951JQJpPhVAPI8QnoTHG/gpuPhcqT6iAQkIOTz/llrZ+QUCIGHnP5eDJL0NUADj3WM5x5KGlA+/Z/C9bJtAz50SDoY9QnyZZQEO+jocZYYic9/jyDXWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=OWdB22kV; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=m7gRLDps; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="OWdB22kV";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="m7gRLDps"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2ZF033445570
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=DWqe
	9XdiB9YALa0XNdGGt3qO4v5pjMXhO74UrVFhCcE=; b=OWdB22kVGDXt6qvpaA7C
	ET7zw++v1tAmUdO5l9nhHw4RuVQU9PTgKbMl7SOmNORRslZk8ScAnPJzNaa4eRTV
	8ourJBDmwYDrojki+dMqrBQgHzfxjXyrX+PWfS8pLZnqQInXEMKh9oJah9UmxxGA
	WwBKafUO09tCDN0nJ49f/o1O9ztFE+vQCxLY4GG3NHieeftyHnQkL8Oprf9JaQvT
	y9Rw/wQ7D/7IckAwDtjTADAmHjEoQsegD0RioedEPgYVABdTOwLymGFSGhDW+nsG
	/fylvFWmwxQvFTqtKVXJH0vtZ8W5gphO8/pWP7hn024L5PLtHRzgf0yNIj0SeZ7D
	9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hah571vaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:25:16 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5339253dc3fso106427201cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792034715; x=1792639515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWqe9XdiB9YALa0XNdGGt3qO4v5pjMXhO74UrVFhCcE=;
        b=m7gRLDpsKPi1/a8ZmXMIETEBDAhcul4SDqItdZUQGjRm+3kDmViE0KV6IWc2zzCwcz
         Nnihvgf5vcFZIaY6ePHwHZn7yUF0xlz3rAZdjj8TSGbh5hJGxSQDA6AZPIrvf3BQFO92
         7jcJD9zJnLaz/SUFo0y5JlY226zT3U7X9KCQe/pVRLae8NUfIA2xmiSnXYM9x8Tu3iVs
         syQFJIcusiR+3mcjgFdWIXFeqz5XsphTdL3H3NfklaiUnLDoU7eOGoVHn+NM51W/lWST
         JcLST7DbQFD40WxXbfTgQy/TC1bW3IMXwKb19/N5LWSsGoegiHCOrrlm70xVkySdmfTw
         xyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034715; x=1792639515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWqe9XdiB9YALa0XNdGGt3qO4v5pjMXhO74UrVFhCcE=;
        b=Ws8tyuN8udEi8/sEW4yMsP9766Uo7mlsoAG3qiQX8Hi97t7dwvrRbp5UgrfL+5t7pI
         51i5lJP+odn2bkBaRMcZQQ4zyYaYaLpMKPVs8Fq5pIA3tW9MjnEr61nGmZmLRrAVsVhF
         7rdzlsLkqJlMbQlU3IXfGKzlKX4euZazwYLF97ma5sEJvpKO0YjubgKWnsWnXRtXacNW
         CYEOiHcjU/P0Y8cBdXF4tNHxEWXOzz4BJCMJqIzODbe4cEDCBDUC9l6z1Fu7bOAPm60b
         a5YZMlr059QGeyY174j7q4J7ZPd5/G9gf5/EIZ5OBhuCgGiSM2anPJBJ+idOjalaFUVF
         u54Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQLIiB/fEoepEEClEiy1CrCAa60NsBkgOi0hY3jKMAGH+Zqu4g74BkmMXqAI1s08LEmIPYSaB7bnvXeXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTPE12ZGftsN/hR6I9KSIxLBib4cGBY1Wf2b8hHXZ6bcQZdIsl
	967rBJSGMwmxAp7VADI//jZ0Do45C/2SomduehA1mNXw/IQtnkYDdL70VfDFAx9tJ6R255NBPwM
	/pSHBlsQfWTN9dylwObHzd+iWCkz2gtmQyg+WslajHU6BDfXiWaaIUK+azcYeqnuoSguI1A==
X-Gm-Gg: AYBFou39IrJiTJXVTe6hMRr7OCb6nLu0VMzTjzQy6gpUbYveMhf0i22Xr8TLIaShpdk
	T0Ie5h8lC6yrNldvYxNlTbcoFBuswzEhOROOwaTwoMNcb6F7odUNiOXdv52rD17V0n6W1pYJ2jp
	MhbN8AldqrZMvNsnYafy9JseNUSvIObF+8PH+le2hGzLR9nOiYIYHGMf+fB6j14vzOD+2gOskst
	Qsnn0IQZT9mqpuHo6Kv29SYAl4gKPlVn7m88g9eJ7uqgFtM4znfq1HKPXH1XRRIhwiGcS+6nl4v
	gbOlON67GU6gnebCioqY62ADQGhSZKN0bWaZqibtkzXzgI/JcnD+GHEW6FsmRBetMwgA5sNWODm
	acWSfUA9yhX2MnU/q4+z2T+XZubUY+HY0Y+B9cRDRA2F2
X-Received: by 2002:a05:622a:356:b0:535:92a6:22f2 with SMTP id d75a77b69052e-5359fac57f5mr307845231cf.15.1792034715197;
        Wed, 14 Oct 2026 20:25:15 -0700 (PDT)
X-Received: by 2002:a05:622a:356:b0:535:92a6:22f2 with SMTP id d75a77b69052e-5359fac57f5mr307845041cf.15.1792034714638;
        Wed, 14 Oct 2026 20:25:14 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127bac07sm15022721cf.14.2026.10.14.20.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:25:14 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:24:58 -0400
Subject: [PATCH 1/2] mtd: rawnand: nandsim: use a NOFS scope for cache file
 I/O
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nandsim-nofs-v1-1-47e49f37e387@columbia.edu>
References: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
In-Reply-To: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792034707; l=1770;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=dFhC1z+EDvEt0t+4kDQuvuxnIcKAqfOusvzAzWnwYCc=;
 b=gdPk5oGVHFG9xdpf1Jfc5X7tjpYQFQ2+zh2213hn1/5jO5zP1y/i4CExdetr8Nuku913JxF7r
 LnHBFIRYa+VAPob8ci1x/JImO7CRu68XQi+eF8SlTgWIJIa3Ve0Fn+V
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfXzC63nFw33iqB
 a1QEF+hXDAhHZ7xyPDrx1SsQA7u9Ah4H7JT7zN1OrwXegbXvKmVyPLSzg/GZU+olzU7aXl25967
 6DRo04cQTcvrLk5+XQvFi8+dbUE/SySOV8Pz1EbyKMqSRwzFtx1DL5JHQW0yjeZvj0+iRw+xtar
 2QA5nJESbLat9EPqNzDv5ECDe9xrXkg/A7PA7CrBOjLuYh/dHwGhQ1nvWVpnDezW+fnrKS0NqBd
 V9vJayQgyvTYubDZje1jFqsW2OwMy1w7q8Sqg1IhEdHWWqtlGE88yivojqr2Q5BBIyfmzYqQ3rR
 zlalwlNTuubKgz/DxGC4NYvedROq9O0202yhV6nkFaOCEgyLxxf+FT0toJreQszpw6S2SsaTcGg
 6gKbXaOYIMx5mILxktPtV5/R0vSKFImNpwvudv34rq1wT7rBufNwGGezVBBX/b3zXRUsEc1jxeQ
 sdDn00y9qvUKHJXQM6g==
X-Authority-Analysis: v=2.4 cv=ZMJCCn7b c=1 sm=1 tr=0 ts=6ad0479c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=jB6vpCtqdLSoJdYjNPYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: nlil4n3szPAwukdgtv_QPVhHzZw1AmB6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMyBTYWx0ZWRfX1mv2Y4A08euj
 FV4RvhbtrFX66Y6KOzsezTUmtr/nyomOW/wA2c2EasJoQx+tvYiI1z1MjI3/Zmzz0K0iotzbF2C
 3puspXnXDp/Ol8i7JtAkuFUCi/DUQ47SpnJBsOKl5JuZ4Zbpw0wG
X-Proofpoint-ORIG-GUID: nlil4n3szPAwukdgtv_QPVhHzZw1AmB6
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=10 impostorscore=10 lowpriorityscore=10 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150013

nandsim reads and writes its cache file from inside MTD operations,
which the filesystem on top of it can issue from writeback, so an
allocation in that path must not recurse into filesystem reclaim. The
driver ensures that by running kernel_read() and kernel_write() under
PF_MEMALLOC, which is more than it needs. Use memalloc_nofs_save()
instead.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/nand/raw/nandsim.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..4559df2cfa3c 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -1342,14 +1342,14 @@ static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
 {
 	ssize_t tx;
 	int err;
-	unsigned int noreclaim_flag;
+	unsigned int nofs_flag;
 
 	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
-	noreclaim_flag = memalloc_noreclaim_save();
+	nofs_flag = memalloc_nofs_save();
 	tx = kernel_read(file, buf, count, &pos);
-	memalloc_noreclaim_restore(noreclaim_flag);
+	memalloc_nofs_restore(nofs_flag);
 	ns_put_pages(ns);
 	return tx;
 }
@@ -1359,14 +1359,14 @@ static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
 {
 	ssize_t tx;
 	int err;
-	unsigned int noreclaim_flag;
+	unsigned int nofs_flag;
 
 	err = ns_get_pages(ns, file, count, pos);
 	if (err)
 		return err;
-	noreclaim_flag = memalloc_noreclaim_save();
+	nofs_flag = memalloc_nofs_save();
 	tx = kernel_write(file, buf, count, &pos);
-	memalloc_noreclaim_restore(noreclaim_flag);
+	memalloc_nofs_restore(nofs_flag);
 	ns_put_pages(ns);
 	return tx;
 }

-- 
2.39.5

