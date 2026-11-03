Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711859;
	b=qGuJr4oWbdjuC9Of/DpJ4AfLcCuYMRiIs0KEl8u+dgkUROfoC1aYYDDiBEaLPOgueTGi
	 mPX2kLmFlTQAW0j90Pu1OP/6/rDXG12+OYMGQKReIY2JPy+1FHmbgmvvmVH3Rvwm9J6Vp
	 +XTaCSGUSSZKe0xvdEwTuO5uYmZ45NenYRA+OcLjwcYgboqcgvw5nO/oh1O2Osy1tFzX8
	 VWrsW/t2Y6QV7w4GHaVe8BDbT2rpoPaxnnGDecPwnoyUSZ4LD92MK6TKhRB7p3oa5kTYV
	 WygBvcqLY4einDj21ruCtKA+owhtYZ27jpGXBR9OH/428V1QsouQrE4Beq15NS2IAQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qYSxn1XfiaP/st3a00FEfiZHOq3MU227Jvp9fdcquiI=;
	b=CdvMTweLK2FcmICu6/askwgQTussEtAKGRM/HjTvbmOuz2Th3EiBVhfVrfNrwL/9HX4S
	 Q0OKI0jDHwQDWt3UH1/J9ZE5Bnt76XsH6c4nwBK//1guKr1DOlWhjzUwejVoA6lHX1trt
	 1gqp86KSwMm3MbTXCRzDuEsxD9Xe40hiE5OGEHhdiHO1C5d4Y0rcQzZxwzB+lZymXBSL3
	 x1GJvg+FFcOkUU+u0G1Yi7UGVkZ77fPv1y4iY+LAAXjaLDVmYOO309l9toyvneZcxd4KU
	 xZVI/0qFSrlD9g6fXkgvQN8gZjmdrEvL6958c45ph8q/L5y82zVmMduKBsEXlmlq2XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=DdnpZctt;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=VdraNgxe;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6279A606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6279A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=DdnpZctt;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=VdraNgxe
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3C5SiM879660
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=qYSx
	n1XfiaP/st3a00FEfiZHOq3MU227Jvp9fdcquiI=; b=DdnpZcttVgUflw2w7IOG
	hUSthiZyMpb4gAm6xk6W4B6SM7aufEWTOAKbLeJZoQ40uHMnFxsuiFbjZsxufFVq
	wehTR7XjN+SQVczywDhmyx1kDfY2gA00sZE3gkMjhl4l8IYfUt0yxS4kXJek8VA7
	jRx40QzIJCKYqyNv6j8Q45WXC+kXYSRBvVCe0/M2Dmv+tNEXKtkaXnCaeTXajSCR
	YO+BtZ5K/8LkESX2JA3XzmKaUyiFcTqwR+32R+8QdRO+qRoYSnLY1YryXvp+NgPY
	4mDpXB+YpZ1VP+xdyyKuTGEEO4aIUr2+cI1b+87ebZfEePMM4NdyjVNKPy2hVlGG
	xw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hqf9brj55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:37 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9440b27c1feso726117885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711856; x=1794316656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYSxn1XfiaP/st3a00FEfiZHOq3MU227Jvp9fdcquiI=;
        b=VdraNgxeJQng5LaQGz+LcVlVu+Y/clSZYEjkdRVhk599/W4pHqQFt29Oh4ZDsUStPb
         lZg0oKVCrgkh8pjYsXJxdSQzIJs9vdmZq/U4bvuw7RobIOyPShrg2Z1EzHWgXT8qL4bZ
         w/dr2PBldJFgXb7dQJ5QDanvLWP7vcSrRC93xjJsg2qSKun93N+A5b7NRXfnwP4MzMNN
         lAi1/keWSCPe2Cr/igtEb/cObpjf5UlzofI/KnRLIX1/gV40iIKnmS5eSnG+tXs0HSzT
         vgqYdn+hPJzv4B4PpUgaih6MCp9ZrM9PS3GSKFmlGMiZfKZXsH4MTca0OXwXsvMuD5iS
         Zuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711856; x=1794316656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYSxn1XfiaP/st3a00FEfiZHOq3MU227Jvp9fdcquiI=;
        b=LeVc/xoy2vd7n899PGXHu6e3Dg+mu1KXryui6q63IdqZMEB+5EgoutPZ9Mj7h0sLiO
         tO1NQO62GIE7XyE499Rts6zBd0Bx0FC8XMztrNCf8zXy/r5a8KNcsjT70kfWjnP+b0P8
         riT9q91ZPsb+uYQYRR2WN+Q5GDMo6WM876BYS+1jIPVyaG3UTAbxKkvEs+mh7G/Rq1LG
         vHg41gAIRBU3lX+knyzmWNXMdzj8KhuqTtjuNAqPiGNp68JeY8QL0TSj077QD9YQzuQl
         5O4D8EWJgy4Nr/RgiPsAuPxD8Sn2sHRlTldh1o921Et15DDEW2S0ETcfAcTYpsJFalr8
         dwBw==
X-Forwarded-Encrypted: i=1; AKwUvBzmAtUsU+w0U22cM+EO6TCzLI432uQcg86J6MzGvdCEf4c1Pj4dUO1xRRedoAPZOxbGmtwoBe8ZSLVo/ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I9CfQD6qQSh7uQOSloMGgXpdoLB0Bu+KcW6oRjUiY3lQDvTgA
	3MnbxH+8hu2LP6PQNyNHuQ2r3JdtwRLSXQAmM74onKNkgyF99gaoAZC1dij+j0OSyyyrXtezSxV
	hYl19JmXul4efjDMdSlh2WbVIJyaQY9+3TAlfB7eVBCRvQ7PGIIpqBfMGnts0OA==
X-Gm-Gg: AYBFou1FmrxI8YFz5A6J/QaybUJoKNOedit/oZlWjOLlQxG1W58vYD01nt5HBAvztwc
	NnVdy4lAxB7DyP61n9DLIm3qgAuHa1aISSDBpOqCXcbhRekQBgM0WYE9nrjbsTReyLH2PYLmKPd
	ZIrJMEzxObvmfaKWrh4px7MKfv4+ByWjh3u1ufZzrMkszbGQCPY7QGg6IeLWOGJn5+Gonu0mHeL
	My7at49OdqHm/uAkeuBWAMO8i2vvUQS75twIEgBBGGe00nEmNbzcTpBdlHRjur9lMnh644nINI7
	G04CIA/Sfv5Wepa7T0pZJo2NSJyu8bvtprtX3lKXfFSAr1TrHpAB9qyGt3y9SyjBMcIYR9OienK
	aR1GfV5COI9rTJI+fEP5WWHTSSM6ZrcWJD1dHlMWsugcV9tnE4zfyiH/RAnk=
X-Received: by 2002:a05:620a:318a:b0:93a:11a4:223c with SMTP id af79cd13be357-94421585ccamr2029616385a.9.1793711856489;
        Tue, 03 Nov 2026 05:17:36 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:93a:11a4:223c with SMTP id af79cd13be357-94421585ccamr2029613585a.9.1793711856031;
        Tue, 03 Nov 2026 05:17:36 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:34 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:16:59 -0500
Subject: [PATCH 01/16] squashfs: don't truncate page cache indices in
 squashfs_copy_cache()
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
Message-Id: <20261103-squashfs-folio-v1-1-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=1892;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hhR/0qFXTHIEAAk3wh6pERZ7ESuQx+zeS3j5JBZjUqs=;
 b=bQLgA9Sj6NYRfiZu1hAhI/T/7HnYWMH7y2gf8Kc4NWiullWkt9QZ5B/Ebd1nqWfqI4Yv/IZ6q
 ucYYDIDV9cSAx3zKTMkx1jCU7iTAs+BIL+Ci0asoHImWlnVQ+gMBggP
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX5BEeYcQXzH7f
 aHrfaL1oUm5kRxFXWrAs6/D75s+5nKMPL5YSYnF3BaC3jXv06l6+tod1rcd8LVqeSfW4lKx0WVr
 UXzAuUPEPPgFHqZduwL5w3DIXhdxlcSKfdpj+zeqYQ9CcwOpPyWAO2dvnsYpdMeruEiW8tbOHj6
 LLT3vvxuu7RISv+IvD0InMUVQUepkOZuTMtMWN87pIWFpt93LWu2FI+IgLYuf+VN3AHE48YDWww
 qU8cbbpcCevHEq8JqTEPi8w9F8x1GH4ZRjSPhxapaP1hFWVSVwuqF9odZrcz5LGnU0YBV/nHFGr
 gGKVubJpjkL9vgc1fiViKWZelWUnYu1lEwoV/AJOSpVAaHhCvmnOwvCihSBwvFmPV7REt7goaC7
 iX8W9jfnnQvoiqdH/QkTL0/AJ59FaOPatB+IRIuJLZ6gup6OJZLNWOwlBWsGoz0R4zOEsAfRftT
 ay3kztGMG3KX7xQAF2g==
X-Proofpoint-GUID: MT2XUTY1Qy0eBQBILbzsB0NZSpXTxRkV
X-Proofpoint-ORIG-GUID: MT2XUTY1Qy0eBQBILbzsB0NZSpXTxRkV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX0AUawtQP/VuS
 HNZJoXGwPoAcRtOxaBuBPcBA4h1xhh6fNVNr5fBAdAE/3TyywuHGml3iroHh7/DbcOWq1sJZRvO
 OshIPlDutkrL1NOIpgY5jHW3HTDV1qqixC7gg7mxgqqoRJMha6Kc
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ae9def1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=VwQbUJbxAAAA:8 a=0xRz-ObG50yOKxxSkZ4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=10 phishscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030052

squashfs_copy_cache() keeps the page cache indices of the block it fills
in ints. On 64-bit, once a file is past 8 TiB the index truncates and the
loop never reaches the folio it was called for. That folio is never
unlocked and the read hangs, and the other folios in the block are looked
up and filled at the wrong indices.

Fragments and sparse blocks always go through squashfs_copy_cache(), as
does every block with CONFIG_SQUASHFS_FILE_CACHE, so a large sparse file
is enough to hit this.

Use pgoff_t for the indices.

Fixes: 1701aecb6849 ("Squashfs: regular file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index d83594ce91d2..9c9a437ab118 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -396,8 +396,9 @@ void squashfs_copy_cache(struct folio *folio,
 	struct address_space *mapping = folio->mapping;
 	struct inode *inode = mapping->host;
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	int i, mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
-	int start_index = folio->index & ~mask, end_index = start_index | mask;
+	int mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
+	pgoff_t i, start_index = folio->index & ~mask;
+	pgoff_t end_index = start_index | mask;
 
 	/*
 	 * Loop copying datablock into pages.  As the datablock likely covers
@@ -411,7 +412,7 @@ void squashfs_copy_cache(struct folio *folio,
 		size_t avail = buffer ? min(bytes, PAGE_SIZE) : 0;
 		bool updated = false;
 
-		TRACE("bytes %zu, i %d, available_bytes %zu\n", bytes, i, avail);
+		TRACE("bytes %zu, i %lu, available_bytes %zu\n", bytes, i, avail);
 
 		push_folio = (i == folio->index) ? folio :
 			__filemap_get_folio(mapping, i,

-- 
2.39.5

