Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711875;
	b=uNpGdITgGJFE/1s32bEmo0Swu1V528b2O+wNvzv9tfLzGLPU/6rwmY6JWnIDK1zoYhJk
	 xe6ttAF7aRjZPn2MEsvcjTpXmQvHlhW+Erls9WbGBKiCc6F4sXEqeq1619CqOX8voFZbb
	 tBoVx3t05OlBn0eTxTDPv03scMEg8wVMn02Qyv0y2BGmWC5GG5vsiKkCLdSnqqkf8BLRr
	 wA5NMDw7BBsAnuESeVEHLhTkbgpQAIlisnBPDUTZ+teCvbCIa14sfrR5BkefKtwKr6Zyt
	 Wyn2MUp3nF9f2lW7oR+gTM1RDoR629SSSy6mgW3EEwu6/7Wv9zoWSFGgYq9t/BTxT4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=na3MQ/PvkIAJ39U+bPlyYxpLZk3vn4kZmyS30VGKyD4=;
	b=FrF/FBdeTbfnAbxq6/FEpPehsXmSq3SBl40RfZLsIhT4jE8f8D1ojC9E0PytyVqeQbLg
	 QBZFpuqjNJ8s2hU6bHLW2BFHSC0yc2RKODwEf2Vn4pAgWqUFodzwOWFFGbUrtRglA7P63
	 85I9n44XSuUOfAGejGtqHb5OMppa3rOvG1WkvrwuqFjBGhuxmzj+qq/T/bPwEOgNHoquy
	 WtIlX5/MIc4XZB4A9IbuNKbDl04jn0z/nct7GVr4oRNIdiaihCyrg3iyjMwMKno9mRdWI
	 HjwNwANKXYMyZGRRqgO0EBwnAaFfPmVFJYGFkw0KO9GsLnMEuleQliAUw0mOb6hEe3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=MdiJFb56;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ImkJVdPV;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFB7606EEB3
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFB7606EEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=MdiJFb56;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ImkJVdPV
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A374wbp3921689
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=na3M
	Q/PvkIAJ39U+bPlyYxpLZk3vn4kZmyS30VGKyD4=; b=MdiJFb567mkvS7psLkEH
	T6PCYa3UpC2Jnx14n/tnMEyP84LSwV3d/4AOCSGJsjwjhKYMIYAD6SNT3t63G5Hp
	WZrSXR66KCFjSpiA2+6G7HrkEUrs7lE3OL9oWXYCHMVj8S/8Luwr3bQICflKx/Fr
	XIyTRiE3myWHBgNrMFnD2zJfxPbMXj3A6hW+K6Ooc3BJu29iTSTd6drJLdX3Sh4x
	8HuMKPg/NYUiEYFQsxO/NM/H8Ohot3qHJRsy9E2VPTMJ03kp/7hqGtTjZxa2V8TB
	64FFaR7FZlbMpXQJgoqHCktQwiPv2AIlGQg5LTD2ci/ZJKdosYCNdxaf55aKZsfB
	KA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hqawfsede-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:54 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f13c143c8so750768385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711873; x=1794316673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=na3MQ/PvkIAJ39U+bPlyYxpLZk3vn4kZmyS30VGKyD4=;
        b=ImkJVdPVgGfoPnaCCGFsxkIrGj+CguTP4viOpXocGvsSUbcfSKp7J77knqTpgDRVkq
         JsMcOehevCdznhyuRFE+FLBk36RmKwskFX/kEq/LxfKOiuekGovAIeUxgWpWBgc/S4r7
         nhsaEFS3rVctR8T7JdrQMaBeVnYRGjHDMTQB5cqqz4NNmVpAyNxOq+B2jjTbNRhtWIpd
         RsodH5Z+aLpY921etsZkdbWtdok85sETH5VVBPVsD0/gQ1xzuupJkdjL/o7o6Jew9gMh
         5aMAtRNMyXJYJQEAheDDjs9DfW56P7kRYKvXDUBmPZE/LiFuLXDml2+DOiQMiYMX0I0I
         4RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711873; x=1794316673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=na3MQ/PvkIAJ39U+bPlyYxpLZk3vn4kZmyS30VGKyD4=;
        b=rVUcBqa9o7ohrIKX/q+vjM/DMklUKuUP0Z4E9ahh46H+gGE6bf84jI6SWnQ8ZFk0M3
         7nAAMCaKXGl6Sxk3YaC5rMV0w70lNCjBUL6Qtgli5HBC4Z3XmA249COy6YLJM2vCJ9vf
         wMXiH5eN6D28xkLCwXjYBb5gPJIz7ga3AunzQ3Uj5HgLBJivDkvHPY0AWRaxDtvirTwm
         VvsBiniZaPoN7LtShqSE6MQO/9lI1W0coZW4bsiyKkh7Ly5oWm/MCY2HekE564jMOuu9
         Ko49WyGFE8EuN1BIkpcIucH9SQ6dfgLJ8ykeU0NWlNuwRyF+ywrDR2z8WZvm/6CfvD+W
         CJEA==
X-Forwarded-Encrypted: i=1; AKwUvBy60GxDX0Wnbn4kQboX9pZpQTaB/hNUKULBLvGVjY6E2nOYawwW//pot1OpQs3CRihQ8UtpjpUizssUhsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kQAUGi/5+GRGGpixQtyWKDZz1iadVp1HrVZ3r2dtXWXEL79Db
	xjFC7IOu/dF7+cdc+UWeAHpDpir6S8Gll+/SRIoEL2H6J6SZT1EDDtI9AiSJWsX+rX675IfpVHJ
	yFN++pFeHJGq9Lp7aF96bpcXOVIMRGGkDNPh6wgauxgPl+aOEsLfBXuDapDqFcg==
X-Gm-Gg: AYBFou2uIwJHBJCgfZNkp5Y7T687wbpsr/e9YlljNvBm5IPZ1ppF0vUB5ongEq8s9yf
	DwzyD9XhN8Pxl5zhvcCEJ9+yiLGEz5YCEKWJrnMV1XjwNxnlwnoa8Nfp6SDSxzIpouw7UDdH/Ko
	BwU2t9zHbm80SQIuDNkVnbTIhmqr5/vcbh9R+TPU8hePyFV/R+mvVkk+QFcoYeSMESHCSmji8vf
	S+NW18AGBtMnhTJTHFSFhTXs8BNbMdXr9uh9hs8GOYFgPxjLVBdXXD2qCLesWeQQpcu7AT04j4J
	C1sCoJUb1QvVuDzmC4wqpAsEYHlv0t4QTsA3ArOpxMqmIrPL4u9VTN6xnJCQVWnAWa6t/cLiVrO
	jMMUOH32zcdkxBLJQv8NrhXRaV0mvpulz8JiiZW5+7fBbGy90w/sMUmg2KkM=
X-Received: by 2002:a05:620a:2a08:b0:93e:5daa:67a4 with SMTP id af79cd13be357-944216f09f3mr2094080085a.29.1793711873248;
        Tue, 03 Nov 2026 05:17:53 -0800 (PST)
X-Received: by 2002:a05:620a:2a08:b0:93e:5daa:67a4 with SMTP id af79cd13be357-944216f09f3mr2094075685a.29.1793711872649;
        Tue, 03 Nov 2026 05:17:52 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:51 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:07 -0500
Subject: [PATCH 09/16] squashfs: give the folio page actor helpers their
 old names back
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
Message-Id: <20261103-squashfs-folio-v1-9-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=4361;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Ylws9lUFZ9Y9vyYmEQ8uowakN1pwIk3FUGMGbS6FTrM=;
 b=Ii6eo8/pskcz7s9DgQot+5NwGpPlxzBd1JywvZ9SMkICWnmWGCEJqqhdLBu4U5kCjC+1lEPxY
 5BMldc4Ev9vAhZHFEp1sCxFxmqh4N6Lt7PKqWT1VSiGpXjNwuBK7gib
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: SEICmg3KNa2nIbBM4mPpX6c2BWwfpXt7
X-Authority-Analysis: v=2.4 cv=DsXDa2/+ c=1 sm=1 tr=0 ts=6ae9df02 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=dOGH5sHRsdiwx2VDu4QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXzasLAtIBYG3m
 p4YUArzkY5ExsMR0Ltehjv7GZi0u9wxhyjgm8ezPtbQ9G5/ocvZoEHyLjqCBDZQt+7Ige2gxB78
 uvZyIWGi8h+67VMnZzyk+WwuiWOq33VZlYMuy3RK1AksMWRVAsre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX2b65LdmuKP1C
 gCNgFZ3SWJRNhCxYu9pBZv2+Bpr0UyWgD+Jae5FheMq0M24AHC5L20BdJ6ih5C70UuY/SbdqFqs
 sNYjxpn4JjwQ4+asurtTHztu4uUvTKniHIwgRl+aBUOggQPOe1K3kCNmjM37In1EHFTcOyzC7lr
 gmf53QuNOtxiyTDyM6iUZabLO+oJldhVuOnHBFqF5sIT7AhqQZ8s/qMPK3X+IYYOo+D4ZaresEF
 wPL5s8W9B7QTVo3jLP3wdRkzn48ZUnZmdlNrIVT+E0Mx6KBDMmIu2eIq3W5tIFOxP/CH+Ct8zsU
 f7pIT1Geob5S2ieaov+/EKNFF3oqLzWR2AxerQBo88ytw7fMuGzD3UatWnQMpYQp0EZty4mcRiA
 IqfDhxbwkT5CGyi0iWFP5gnjAMjkyX+FEejQtvQuDm63WO0TTmoNZr2lj2JNmFxUtuFAzSCsOd9
 TYH6sB8iO6/zEWUGY7w==
X-Proofpoint-GUID: SEICmg3KNa2nIbBM4mPpX6c2BWwfpXt7
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=10 lowpriorityscore=10 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

With the page actor gone, the folio actor doesn't need new names.
Rename squashfs_page_actor_free_folios() back to
squashfs_page_actor_free() and the direct_folio_*_page() callbacks back
to direct_*_page(). No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file.c        |  6 +++---
 fs/squashfs/file_direct.c |  2 +-
 fs/squashfs/page_actor.c  | 12 ++++++------
 fs/squashfs/page_actor.h  |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 2f37de8def31..e024d2e21246 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -544,7 +544,7 @@ static int squashfs_readahead_fragment(struct inode *inode,
 		addr = squashfs_next_page(actor);
 	}
 
-	last_folio = squashfs_page_actor_free_folios(actor);
+	last_folio = squashfs_page_actor_free(actor);
 
 	ok = copied == expected && !IS_ERR(last_folio);
 
@@ -564,7 +564,7 @@ static int squashfs_readahead_fragment(struct inode *inode,
 
 failed:
 	squashfs_finish_page(actor);
-	squashfs_page_actor_free_folios(actor);
+	squashfs_page_actor_free(actor);
 
 out:
 	squashfs_cache_put(buffer);
@@ -636,7 +636,7 @@ static void squashfs_readahead(struct readahead_control *ractl)
 
 		res = squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
 
-		last_folio = squashfs_page_actor_free_folios(actor);
+		last_folio = squashfs_page_actor_free(actor);
 
 		ok = res == expected && !IS_ERR(last_folio);
 
diff --git a/fs/squashfs/file_direct.c b/fs/squashfs/file_direct.c
index 55286dab03d2..266b5fdea67a 100644
--- a/fs/squashfs/file_direct.c
+++ b/fs/squashfs/file_direct.c
@@ -79,7 +79,7 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 	/* Decompress directly into the page cache buffers */
 	res = squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
 
-	last_folio = squashfs_page_actor_free_folios(actor);
+	last_folio = squashfs_page_actor_free(actor);
 
 	if (res < 0)
 		goto mark_errored;
diff --git a/fs/squashfs/page_actor.c b/fs/squashfs/page_actor.c
index 8cf6c956d802..185365c1afda 100644
--- a/fs/squashfs/page_actor.c
+++ b/fs/squashfs/page_actor.c
@@ -87,12 +87,12 @@ static void *handle_next_folio(struct squashfs_page_actor *actor)
 	return actor->alloc_buffer ? actor->tmp_buffer : ERR_PTR(-ENOMEM);
 }
 
-static void *direct_folio_first_page(struct squashfs_page_actor *actor)
+static void *direct_first_page(struct squashfs_page_actor *actor)
 {
 	return handle_next_folio(actor);
 }
 
-static void *direct_folio_next_page(struct squashfs_page_actor *actor)
+static void *direct_next_page(struct squashfs_page_actor *actor)
 {
 	if (actor->pageaddr) {
 		kunmap_local(actor->pageaddr);
@@ -102,7 +102,7 @@ static void *direct_folio_next_page(struct squashfs_page_actor *actor)
 	return handle_next_folio(actor);
 }
 
-static void direct_folio_finish_page(struct squashfs_page_actor *actor)
+static void direct_finish_page(struct squashfs_page_actor *actor)
 {
 	if (actor->pageaddr)
 		kunmap_local(actor->pageaddr);
@@ -135,8 +135,8 @@ struct squashfs_page_actor *squashfs_page_actor_init_folios(struct squashfs_sb_i
 	actor->pageaddr = NULL;
 	actor->last_folio = NULL;
 	actor->alloc_buffer = msblk->decompressor->alloc_buffer;
-	actor->squashfs_first_page = direct_folio_first_page;
-	actor->squashfs_next_page = direct_folio_next_page;
-	actor->squashfs_finish_page = direct_folio_finish_page;
+	actor->squashfs_first_page = direct_first_page;
+	actor->squashfs_next_page = direct_next_page;
+	actor->squashfs_finish_page = direct_finish_page;
 	return actor;
 }
diff --git a/fs/squashfs/page_actor.h b/fs/squashfs/page_actor.h
index 3a98bf691ba3..bc4f44122ddc 100644
--- a/fs/squashfs/page_actor.h
+++ b/fs/squashfs/page_actor.h
@@ -31,7 +31,7 @@ struct squashfs_page_actor *squashfs_page_actor_init_folios(
 				struct squashfs_sb_info *msblk,
 				struct folio **folio, int nr_folios, int length,
 				loff_t start);
-static inline struct folio *squashfs_page_actor_free_folios(struct squashfs_page_actor *actor)
+static inline struct folio *squashfs_page_actor_free(struct squashfs_page_actor *actor)
 {
 	struct folio *last_folio = actor->next_page == actor->pages ?
 				   actor->last_folio : ERR_PTR(-EIO);

-- 
2.39.5

