Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901593;
	b=zoQmVWOO+UTlyaFwPxmCZCx9yW5sjIDCOKgW5Cb6RmuhvmXqsNdVS2JDtgzjnYAYZBZv
	 h13zaStDxTjrQdyXtYZwZX/ZwSwlDR7I0liJa7owcFM1uJq9FGLtnuoMVJwvJ8PPUOo4D
	 RcO+5+V9TynMTuQcQ+2ysT97/mwgo1knq76LiukaONHXNWhCCCL68F87c6+A9LpJpJ8WQ
	 GBWyw9Z/spd4+wi6o/i8tHbQJuRC3cdGSPpWBAU/OiHPOajikpOJDTU41JK6N71uJMHI2
	 MBHKsbWDvkEn74euTq54UzSm87hK9BlpKlx0qZ55AWQRDd61fHOzBShlrQNopIKqpwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=13gBg7QBW6VxUO230NS+TxRvi6Fhbsy36rbkemPFH78=;
	b=aQVAEoXZRYvURF2ODDMGAygJXaQd3O3pwhUVavxvvpJpo5uBbqqohbDKhgfQCp0Rp7RB
	 pETmQbc0/T53UTLIP8n1mgJKYXNBoP2eM0vdB2dOvpPE6TWfaOltZDzRahePW3EiNDCcW
	 7PPPn1zUrEW9BjHf7CYArp6cZZxvmm1Vk3LqWNY9m91Jpz31wMibh6X8K6kBWYN03ZZFa
	 D0jbO+gfThxupz+shE/sPqZ4B1l9ctlA/txsYKaJS40kZKBoOpDrKmjx0M1cMLeMzQA3m
	 Eguwhw74oZisPZfUFGFm7aUeFP1YDSMommzhep+c9P4Ru+vlyiSftKETmqlYkVq5NEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=XjsgZo0D;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=GRpN9Fnu;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A09606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58A09606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=XjsgZo0D;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=GRpN9Fnu
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7jUT92304999
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=13gB
	g7QBW6VxUO230NS+TxRvi6Fhbsy36rbkemPFH78=; b=XjsgZo0Dq0PXXVgHHx58
	gK/2O+GJBHHJlhWZ/JcKiC7IqCvQWHjLsH+II5P5VSWF8XJyBxGCkvqh0ahbHwM5
	LyMfsVILj2Foi2+LCWxnbyZ9erCdRJER+6NpuRZ9AFyCbB5tAHj3K8tgWVnSLN1W
	t3Yqi++4waxuJbZ5v4cLXRrBaVRRPGbGhmZMbU5Jt/3lwRbbXKDanpaZs728HAzc
	3alMVeRgXJ2iR9FGM736hItlyhfSS3xiHrbgruULfqzHNFsZyD5gkk7kV3iNSbyu
	YjQ5EriXu9D2IbhBtF8wycjmdNtwn9lLe0FzGOg0JvLa1YLzuB6r1fif6jgtK17u
	iw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0hw2r467-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:32 -0500 (EST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55c5cbc838aso579711cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794901592; x=1795506392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13gBg7QBW6VxUO230NS+TxRvi6Fhbsy36rbkemPFH78=;
        b=GRpN9Fnu8f7+31r5I5nRKc69JUHKtAlwRiwQ9Tnv5o7t8t9sl1Q40+EHXcKhOsI90i
         JpIq6bzaWcQWFILaxk18MIVWYyai+F57ueVjiMW3TH9EKTOcsNblnr7ALn6S00KX6yQ2
         /fmO8h+kxxak7zKPI2GGoVUMthWNfeURsxBG8WaJ/7qYm///nG2L52VbeefwB2HnvUzL
         XqfJGGuHWp6h9AL9f6GGNObpv7gBMd02CcTUpqGwlvrKXnL3TExZBnQO7PoppySilezh
         HrQfk367sognVwKOxiAkvjKvxuiQWNT9Ykc98EN6vF0uxTitHoc81CIS6I1PpH43Mg/f
         89KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901592; x=1795506392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13gBg7QBW6VxUO230NS+TxRvi6Fhbsy36rbkemPFH78=;
        b=RPtcNvRvQvHIbmdAh/xdjF3hypK9GJe5Oy8lXnmo1MGrPt5DzMVTKKRLwQPUFeQNZx
         pCxh68OQ78X/XKLu+/rAQZMRIFbWdbsx8iQQMYslhRftZ7ROCUNa5rzplTw0omNu+epo
         oiwLf7QxSwBjUBy089KuQcWGHeeuyn/gDLJzYKZsskhPJNcmoRQ5e/8fykkNxoI8sSgt
         n90BqKB4KLy+dbEidt9ZfmJw7s/jztD5vCh2H2YUkCF4jDFF4w1wvlCDdvoHGzwcN9x0
         h1LMse7pVoiBKcKf28z5Xi3Giva9Oa+NJA8FnUBislg+BUvNcy8wOQiEacglOO6npWHK
         Nyyg==
X-Forwarded-Encrypted: i=1; AL+hErEaMErEJgn59FCx6MdNF8GcCJ0Z2xl+t+yrDPZD/g200YEIdIaStK28zBqYu5YrVMGIa+I/hRaa/xbH+3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+19S+Z+/mPUPXMkwfuktXEvGT9RmhVTk3aD3vnwIL+LrwzgJRl
	DXs0G83zIoowVxPyQxlKCR0i3a29l1H12er/HJCqcaTW84LS0IdUCXFwoe9COpHnU/aforGR8/r
	moQY1j6XETBDjkfVjlhlVJbIiO9IXhM63CKk4tz6wm4s7V2dzung7JQuBa6loIcsTR4dhmA==
X-Gm-Gg: AYBFou2QzO0ZbmG3LMbQeYuwjsSzysmqThbMDPbGI8nTK3XbLi6HwgheIIASk9clMtC
	dAcZ5KhxpxFe4gx4JBIILhLI1nGju3Pxwa53VqramOw/fl7GkWe6jKkteBHnfsQum47s4m13xrT
	/MBZgcfEH48nMye3gznJbuTqKLRI/MjhQhl3BS74HjPF7mAHzy7CLDq08Hw9mRowndQMHOD0Y9p
	ROn6Krqp0RRHHHqgQatzngKWeQ8OXoU9VNKRMcPpc+ChTGuAOwUQT4Orld2l2oj0X5pQGPtFnug
	fIEWJ829xGhSer745PXn3ePm/PAP83R9BW5juI9olSaBuvH+fAoZ1pwcy3okJZRLVy8qZEq2HJe
	9oXPNfuAQ7+he+DQ1VEwi/8pUIu9IIxX29z9JUpsjwuWrUYxRvAyOLVHNnXyC+tvqa9x8jDdMqK
	rvHQjePHQuHpVUWiT9RA==
X-Received: by 2002:a05:622a:1a85:b0:55c:fa5a:b230 with SMTP id d75a77b69052e-55cfa5ab36emr143284611cf.32.1794901591752;
        Mon, 16 Nov 2026 23:46:31 -0800 (PST)
X-Received: by 2002:a05:622a:1a85:b0:55c:fa5a:b230 with SMTP id d75a77b69052e-55cfa5ab36emr143284341cf.32.1794901591140;
        Mon, 16 Nov 2026 23:46:31 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db0f58sm105632286d6.39.2026.11.16.23.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:46:30 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 02:46:28 -0500
Subject: [PATCH 3/3] gfs2: remove the remaining page references in the log
 code
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-gfs2-log-folio-v1-3-35db3db42e35@columbia.edu>
References: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
In-Reply-To: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794901587; l=3235;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=I1OoGwa46W8CbYKC4H5ofZJ0hfXIdWRBljG1BL3y/x4=;
 b=6diQgVHk6GU2bnyJ7q/nrEUp76qx4EOf+glkpY27FpjD4ExEKSGR3OZbav8MHGycP1ctbesaP
 eQdSkHne4R9C70wmLaAuPo5kz3hd/Jpxey8KxyXFzjCrTEGnphorrrO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX+c8NuMTnlnzq
 sMAhJjyED9X1OCQM7rLcPQVsl6Qnpqn8ABp6xvbvgvKBCaKw+MkybFRGAg5hlXdtL/at18XrRSb
 vyr3PGnKVSLGix5SOdZal369YxLprBo3AAWqvKB3Ox28pwvFlXtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX2wYd2ZQtcwlk
 BWTwrg3MJMH81tXHiqPR8C7mSLl1U0Dx/QAlu0slXyO/AmN7VdASUNc9sRtLxz9E78GWbmOn/SV
 JWXHgGvWoLvjZmcteMEJ+6NEa1gtIFlPfKxrncfYo3UY6LsDYkxAwGaClq1TTzulFqdW5bWsDw6
 i2SvYKjxMiBG14izptozVd3TtAYHMVZNOn5Q0mW7Bv9k4k2JOyaDoUhbTBuGEJdPAbvWJr6XAYU
 emK2orvTQggh9yxltmVB9anABWmXGsYnKe0kO7s7GEerTGMkQOuFgyGXt8z5pDGif60akGsLGeO
 EwpXSUoXoeQyeRKLz39np0CeYH6Neydw1HhO/GFM/HkCl5OHrWtCEwnyO3qi1qD/qHiO1C7D6Lz
 17CVOEMk5OSCU+fv29zyssGXfuvk9n/dtLzHwOO0W6LwMxAr+dJMVDT/lxRWa0YHDp/DS511a8y
 pY57Q9iX8I4gKbFieMw==
X-Authority-Analysis: v=2.4 cv=IteL47/g c=1 sm=1 tr=0 ts=6afc0658 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=RLOwVVqb4wJnjAl-1mUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: M5jz7IfWv4SftnqeEk09gVE5ZOpNDiU8
X-Proofpoint-ORIG-GUID: M5jz7IfWv4SftnqeEk09gVE5ZOpNDiU8
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=10
 lowpriorityscore=10 phishscore=0 spamscore=0 bulkscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

gfs2_jhead_process_page() takes a folio, and the comments around it and
gfs2_end_log_read() still describe folios as pages. Rename it to
gfs2_jhead_process_folio() and update the comments.

Drop the struct page forward declaration from bmap.h as well, which has
had no user since the unstuff path was converted.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/gfs2/bmap.h |  1 -
 fs/gfs2/lops.c | 18 +++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
index e3d6efdfd890..7b44cc9c742c 100644
--- a/fs/gfs2/bmap.h
+++ b/fs/gfs2/bmap.h
@@ -13,7 +13,6 @@
 
 struct inode;
 struct gfs2_inode;
-struct page;
 
 
 /**
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index c86f92f2e508..805466667e8a 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -446,7 +446,7 @@ static void gfs2_log_write_block(struct gfs2_sbd *sdp, void *buf)
  * gfs2_end_log_read - end I/O callback for reads from the log
  * @bio: The bio
  *
- * Simply unlock the pages in the bio. The main thread will wait on them and
+ * Simply unlock the folios in the bio. The main thread will wait on them and
  * process them in order as necessary.
  */
 static void gfs2_end_log_read(struct bio *bio)
@@ -464,7 +464,7 @@ static void gfs2_end_log_read(struct bio *bio)
 }
 
 /**
- * gfs2_jhead_folio_search - Look for the journal head in a given page.
+ * gfs2_jhead_folio_search - Look for the journal head in a given folio.
  * @jd: The journal descriptor
  * @head: The journal head to start from
  * @folio: The folio to look in
@@ -498,9 +498,9 @@ static bool gfs2_jhead_folio_search(struct gfs2_jdesc *jd,
 }
 
 /**
- * gfs2_jhead_process_page - Search/cleanup a page
+ * gfs2_jhead_process_folio - Search/cleanup a folio
  * @jd: The journal descriptor
- * @index: Index of the page to look into
+ * @index: Index of the folio to look into
  * @head: The journal head to start from
  * @done: If set, perform only cleanup, else search and set if found.
  *
@@ -517,9 +517,9 @@ static bool gfs2_jhead_folio_search(struct gfs2_jdesc *jd,
  * our references to the folio.
  */
 
-static void gfs2_jhead_process_page(struct gfs2_jdesc *jd, unsigned long index,
-				    struct gfs2_log_header_host *head,
-				    bool *done)
+static void gfs2_jhead_process_folio(struct gfs2_jdesc *jd, unsigned long index,
+				     struct gfs2_log_header_host *head,
+				     bool *done)
 {
 	struct folio *folio;
 
@@ -630,7 +630,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head)
 				continue;
 			}
 
-			gfs2_jhead_process_page(jd, blocks_read >> shift, head, &done);
+			gfs2_jhead_process_folio(jd, blocks_read >> shift, head, &done);
 			blocks_read += PAGE_SIZE >> bsize_shift;
 			if (done)
 				goto out;  /* found */
@@ -641,7 +641,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head)
 	if (bio)
 		submit_bio(bio);
 	while (blocks_read < block) {
-		gfs2_jhead_process_page(jd, blocks_read >> shift, head, &done);
+		gfs2_jhead_process_folio(jd, blocks_read >> shift, head, &done);
 		blocks_read += PAGE_SIZE >> bsize_shift;
 	}
 

-- 
2.39.5

