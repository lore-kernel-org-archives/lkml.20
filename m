Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711871;
	b=Ozkpka6Y9NiVybgh8Pr+EMBctJAyhS5dZdzu318d12loecPBgDCeojBE7BTnwWXn/EDW
	 97RClwU5IlkkEM/X27BjSFpvYuulg2180u42Kgk2C/E+PU8jOMmXn+W+1+N22WdSedhGF
	 Ha5cQ8x+wStvwRF8Kk0t4r3BJWxEubDM1v539ykWZT0Rt4Grz2PxNbWWQcIhS7n2qOvJq
	 sp4GRmmHiyDwNN63A87FpLZOf4861m9NC4AxrKQxkrkS6ZBZ0SIPJUZDzwQ7heXiAhn9X
	 /vzGtWZs/ZusBK8GiSp5LZcUzY4Kv2Uap8TGazvLXnRmiwZFLjBiCgU+F+41Os5OVYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3YLmlQd0JQGtV9ToOSBXTgfPqup9V30KJl2BPyanFUQ=;
	b=ijbpbWIYI/+o9/D4S4rD1jtl5HP2vRbXZC4lNb/aysLdszaJJqZkWgpDWHHz2f316AnI
	 i3Tf5nI/RuQK9HKz/E9Mi26QnLo9To4cINhYBVO2fEksjEdVRcZPFn52P/Lx+1gZCWg8O
	 XaHEqSj19P8dthJG4CpQTAEsD4bPQAC61VrSIH0jf8BJr3VT8ZDiNuO2I8rSX2trXx4lh
	 ZiYgGuW27YO3UZhOrMMCSCok8oUHs6R2VUIVFZfEFaoB5MQwT7HDociu3eADfMo/Cp445
	 sbEluVfQocvD6YK4/Y/4UsqIjGi1pR2obkG3RqZ+EiORJ3/QVkfcRw7Q+kULKIlRLRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=rBoQdobg;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=PmWosG3i;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E8606D83D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72E8606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=rBoQdobg;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=PmWosG3i
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39ICX7866991
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3YLm
	lQd0JQGtV9ToOSBXTgfPqup9V30KJl2BPyanFUQ=; b=rBoQdobg6Q+arvcRZHOo
	wL+911fBbIbljyGmY2b8MOcahaIVBz19aflm1VldBi8WJVauQPH/yx1KYuo4iZbc
	4gK+zzSCH3DMwE/c4tn9FiDDv6ztrFV/6RRrwzyet8u797e/4CyRBpUXHAo70aDc
	wOMjwvpLVXis4dxyCSZnb8Xkbsns7qubJwB1VG/j9QYGPKBFL6czmLR6Rgd/Jw94
	0G3t6HwGGKDL5EQLacuZYLCmaqj0n0P6U9LVXcU2VjDzDaBbHpLgSF18Ehi7ySq5
	NKWaxV69txz7DKHYmKXCDdZT2sCxmm5YKNAhbwIRZVLSdxLhxjcknOn09XLLPpqh
	gQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hq3y8b5db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:49 -0500 (EST)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so606566285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711869; x=1794316669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YLmlQd0JQGtV9ToOSBXTgfPqup9V30KJl2BPyanFUQ=;
        b=PmWosG3i75CxR45kncmuDF7IJF9b2pL4NSoAQsmYfFbVPjYJc57CMDYo4dInQ9DWnn
         LM9p/esMNjKZ9yy0+aaYlxTgrPuTf9tajiRZfF1tLh2Nhj9JoIsFtaFy6BI8rX7yYXb7
         kIMpeG00HRL/UFa7/tSLBTRxXSJA7Yde5L454o8EEKSUGXpIQ0qYzv4sW1JAzSHV/YkP
         jsu2D9diMKnriJLGCBrWCXEVRR27zetRYmGCBSKtNfKMmx1uSSV8kQDnD7yWBrqsMv7V
         DgnbHhxA8EUTtFQhDV+iNBAV7GQTgHlkH6rAMPzmZk5IFifAWCNehgb63yb+MI7T5FPd
         pOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711869; x=1794316669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YLmlQd0JQGtV9ToOSBXTgfPqup9V30KJl2BPyanFUQ=;
        b=ZQv7X8sc14YHR4qtbP7oLwH8KCQ+9tTWjCzsgNPpldPSDX4U3j4G0J4LJ7y2+ad3a/
         wjUIAIupPlJ/v3382MufocUY+GdCm0FKF1qHMLlEr06510mHPS/mG5cDDhCsztPu+uEu
         tnuMgT2guwapfv8MIpTmefte1mGufzxSpsVZ4qcexZjOjs2xLnpwEq5B8GraGSPDbPbM
         /iijh0iWF4EixwqUlbeo+LUuFXyrQeb5JWcPGutY1HScjp+f7MEyCIJ8v20YpmgllZ5M
         VH51+pAIvaqNGxBJAl9DqZeMCiRPP71JN6bZHMy9IKwnyADfOOFYn6jNbfgTLcShhJkt
         YEVw==
X-Forwarded-Encrypted: i=1; AKwUvBy0bC+kPf3pj30YXZC5dXMH50Zw6sVWek7s+FraHpmixSf5uZOw2UPwadCHzIkY8frvuUtI0ehaFGg4ves=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ezXSNROdWXDrSpRKIyoCoUpaiZqNARHU3MLBO/Og5OzRh1pks
	ESldBcbfJnuG0GDG2zfoTurYoY7Y8XGefSD3IfTICMCh5drPG2udieEppt8UtUuaRJdQn3hixZQ
	o344dxJngO+T3cANKl5YutJQpiwV+eCiduf5r/J73h6nceLd0yopC0vyzCHpKAw==
X-Gm-Gg: AYBFou1kkfu152QPHcvxWdaquoEGmdcRmGoojR0IN01kRTrnwbiz3OIv1dEiaC00eNy
	f4Y8kvbryuKelFF2yq1butdGgsZeUFRTUFkjeJ2G61Waw6hN3JA7hy8JINagX/hAtoHOItdX6GF
	ULEF14ckGU81zKYf8kT9THvd6zYoCnYT1uJ5NMVSvavYP5TJvwIAmy9Yx9FL0JdNjSolE8jQJHT
	77EDeF35/+cSVt/lNozcj7l8J/ONNpmP6uQNpbEAzzwxKSkNYKxackOg54xJ4Z5oQSv1dakWSQm
	8aH8+apWPw+xPw0VBroUZ4MITpvksip3EppLGJG85iuDDxqB6WUDgaIVZWOWzzf2znLbyj+1g6y
	IJbM2KJN2UvRccwaPlwtmSSg0F6AxYxtLcYZnKBeiA7fEEn+eMqruu2m64xw=
X-Received: by 2002:a05:620a:6406:b0:93e:c12c:fbc6 with SMTP id af79cd13be357-9442176ae51mr1975751485a.83.1793711868883;
        Tue, 03 Nov 2026 05:17:48 -0800 (PST)
X-Received: by 2002:a05:620a:6406:b0:93e:c12c:fbc6 with SMTP id af79cd13be357-9442176ae51mr1975748385a.83.1793711868454;
        Tue, 03 Nov 2026 05:17:48 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:47 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:05 -0500
Subject: [PATCH 07/16] squashfs: convert squashfs_readahead() to folios
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
Message-Id: <20261103-squashfs-folio-v1-7-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=7702;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=r5JIZpvRPt9Wi8piqaGzS/tADVSBXgkzDlhQaCDnGuM=;
 b=jMSn9tmeCbl13oUjkdKLZXxhYOo/MwGLiO4r2pfCqsCLYblczbXYwYHglZFuSx0k9iszIczks
 pt3pvpGKYVzAxPB8DHJMIWZjas0jMtuF01Hs39fymYYfV65+dUYrljd
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXz0pxWDPrYZv0
 Ptb1nUCGTCU89OKvBzJMbq9W+SYAN09DzsgtYITgmYfoF5AqWaoeR25cHruhZzgMQJJcITHS+uP
 3tPxIHLgSGBglXQzEXYNi8oMEq/IGI/4QqIoGcoNShQ4rCn2xGSkOi5zSI3eP79/7aRdUlq0+Tr
 fnbMaGsKf/bcc5OuhljttwwJ4bjZGRiYXLRK7MBYwEhAS+GcG2JmoqVnex4MhAyY9+ftAlauwJw
 C05A0FxARULJ/yu6Z5bVszpMBwRDyC13XnylBTZSSST+iMIymm4lR7A3wEOQlgIM4XJ4svAmsOg
 n3JwqqVnJ85LSwxlOjZb52EQOKBMmL4MuNhEGmu7KIb7p7zqQoTnI3BW7n1aK79O7ch6EjbIURy
 ydyuycJlh1CiA2OpfivHIpUOg5uZ5KJ7sMO3S98D4uuEq3U5DwFm9CNggykNgTFME7b6rXhwT8T
 QJ8Nt34bnAsLOhBzOkg==
X-Proofpoint-ORIG-GUID: rab7CugMlQ22cSE4eoFh9W8ShTRYch1A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX62p8hXCP0uQw
 i+XxAHWePWjZuRdJv1x6ztIPfWMSAt0+PH2neDcinkkEQ9xuA8ROw6NVuBBQTsaJztUipm9rYxS
 SzIeUxsO6twUBhhGqrR34DgN3KbIPRHDOHPhM/R2ZVYRJq+jH3rL
X-Proofpoint-GUID: rab7CugMlQ22cSE4eoFh9W8ShTRYch1A
X-Authority-Analysis: v=2.4 cv=TLrQ2Fla c=1 sm=1 tr=0 ts=6ae9defe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=JCnyy2p-CbXPhezFIMUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 bulkscore=10 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

Convert squashfs_readahead() to folios. Get them with
readahead_folio() instead of __readahead_batch(), and check for EOF
against the first folio's position, since readahead_folio() doesn't
advance readahead_pos() until the next call. Compute the block index
once, as a u64 like file_end, and use the block helpers and
round_down(), round_up(), and DIV_ROUND_UP() for the arithmetic.

This removes the last caller of readahead_batch_length(), one of the
last callers of __readahead_batch(), and up to three calls to
compound_head() per folio. No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file.c | 137 ++++++++++++++++++++++++++---------------------------
 1 file changed, 66 insertions(+), 71 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 39142c4e08c4..2f37de8def31 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -503,8 +503,9 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 	return res;
 }
 
-static int squashfs_readahead_fragment(struct inode *inode, struct page **page,
-	unsigned int pages, unsigned int expected, loff_t start)
+static int squashfs_readahead_fragment(struct inode *inode,
+	struct folio **folios, unsigned int nr_folios, unsigned int expected,
+	loff_t start)
 {
 	struct squashfs_cache_entry *buffer = squashfs_get_fragment(inode->i_sb,
 		squashfs_i(inode)->fragment_block,
@@ -514,12 +515,13 @@ static int squashfs_readahead_fragment(struct inode *inode, struct page **page,
 	struct squashfs_page_actor *actor;
 	unsigned int offset;
 	void *addr;
-	struct page *last_page;
+	struct folio *last_folio;
+	bool ok;
 
 	if (buffer->error)
 		goto out;
 
-	actor = squashfs_page_actor_init_special(msblk, page, pages,
+	actor = squashfs_page_actor_init_folios(msblk, folios, nr_folios,
 							expected, start);
 	if (!actor)
 		goto out;
@@ -542,23 +544,19 @@ static int squashfs_readahead_fragment(struct inode *inode, struct page **page,
 		addr = squashfs_next_page(actor);
 	}
 
-	last_page = squashfs_page_actor_free(actor);
+	last_folio = squashfs_page_actor_free_folios(actor);
 
-	if (copied == expected && !IS_ERR(last_page)) {
-		/* Last page (if present) may have trailing bytes not filled */
-		bytes = copied % PAGE_SIZE;
-		if (bytes && last_page)
-			memzero_page(last_page, bytes, PAGE_SIZE - bytes);
+	ok = copied == expected && !IS_ERR(last_folio);
 
-		for (i = 0; i < pages; i++) {
-			flush_dcache_page(page[i]);
-			SetPageUptodate(page[i]);
-		}
-	}
+	/* Last folio (if present) may have trailing bytes not filled */
+	bytes = copied % PAGE_SIZE;
+	if (ok && last_folio && bytes)
+		folio_zero_segment(last_folio, bytes, PAGE_SIZE);
 
-	for (i = 0; i < pages; i++) {
-		unlock_page(page[i]);
-		put_page(page[i]);
+	for (i = 0; i < nr_folios; i++) {
+		if (ok)
+			flush_dcache_folio(folios[i]);
+		folio_end_read(folios[i], ok);
 	}
 
 	squashfs_cache_put(buffer);
@@ -566,7 +564,7 @@ static int squashfs_readahead_fragment(struct inode *inode, struct page **page,
 
 failed:
 	squashfs_finish_page(actor);
-	squashfs_page_actor_free(actor);
+	squashfs_page_actor_free_folios(actor);
 
 out:
 	squashfs_cache_put(buffer);
@@ -577,96 +575,93 @@ static void squashfs_readahead(struct readahead_control *ractl)
 {
 	struct inode *inode = ractl->mapping->host;
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	size_t mask = (1UL << msblk->block_log) - 1;
-	unsigned short shift = msblk->block_log - PAGE_SHIFT;
-	loff_t start = readahead_pos(ractl) & ~mask;
+	loff_t start = round_down(readahead_pos(ractl), msblk->block_size);
 	size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
 	struct squashfs_page_actor *actor;
-	unsigned int nr_pages = 0;
-	struct page **pages;
+	unsigned int nr_folios = 0;
+	struct folio **folios;
 	int i;
 	loff_t file_end = i_size_read(inode) >> msblk->block_log;
-	unsigned int max_pages = 1UL << shift;
+	unsigned int max_pages = squashfs_pages_per_block(msblk);
 
 	readahead_expand(ractl, start, round_up(len, msblk->block_size));
 
-	pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
-	if (!pages)
+	folios = kmalloc_objs(*folios, max_pages);
+	if (!folios)
 		return;
 
 	for (;;) {
-		int res, bsize;
-		u64 block = 0;
+		int res, bsize, bytes;
+		u64 index, block = 0;
 		unsigned int expected;
-		struct page *last_page;
+		struct folio *last_folio;
+		size_t batch_len = 0;
+		bool ok;
 
-		expected = start >> msblk->block_log == file_end ?
-			   (i_size_read(inode) & (msblk->block_size - 1)) :
-			    msblk->block_size;
+		index = start >> msblk->block_log;
+		expected = squashfs_block_bytes(inode, index);
 
-		max_pages = (expected + PAGE_SIZE - 1) >> PAGE_SHIFT;
+		for (nr_folios = 0; batch_len < expected; nr_folios++) {
+			struct folio *folio = readahead_folio(ractl);
 
-		nr_pages = __readahead_batch(ractl, pages, max_pages);
-		if (!nr_pages)
+			if (!folio)
+				break;
+
+			folios[nr_folios] = folio;
+			batch_len += folio_size(folio);
+		}
+		if (!nr_folios)
 			break;
 
-		if (readahead_pos(ractl) >= i_size_read(inode))
-			goto skip_pages;
+		if (folio_pos(folios[0]) >= i_size_read(inode))
+			goto skip_folios;
 
-		if (start >> msblk->block_log == file_end &&
+		if (index == file_end &&
 				squashfs_i(inode)->fragment_block != SQUASHFS_INVALID_BLK) {
-			res = squashfs_readahead_fragment(inode, pages,
-					nr_pages, expected, start);
+			res = squashfs_readahead_fragment(inode, folios,
+					nr_folios, expected, start);
 			if (res)
-				goto skip_pages;
+				goto skip_folios;
 			continue;
 		}
 
-		bsize = read_blocklist(inode, start >> msblk->block_log, &block);
+		bsize = read_blocklist(inode, index, &block);
 		if (bsize == 0)
-			goto skip_pages;
+			goto skip_folios;
 
-		actor = squashfs_page_actor_init_special(msblk, pages, nr_pages,
+		actor = squashfs_page_actor_init_folios(msblk, folios, nr_folios,
 							expected, start);
 		if (!actor)
-			goto skip_pages;
+			goto skip_folios;
 
 		res = squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
 
-		last_page = squashfs_page_actor_free(actor);
+		last_folio = squashfs_page_actor_free_folios(actor);
 
-		if (res == expected && !IS_ERR(last_page)) {
-			int bytes;
+		ok = res == expected && !IS_ERR(last_folio);
 
-			/* Last page (if present) may have trailing bytes not filled */
-			bytes = res % PAGE_SIZE;
-			if (start >> msblk->block_log == file_end && bytes && last_page)
-				memzero_page(last_page, bytes,
-					     PAGE_SIZE - bytes);
+		/* Last folio (if present) may have trailing bytes not filled */
+		bytes = res % PAGE_SIZE;
+		if (ok && index == file_end && last_folio &&
+				bytes)
+			folio_zero_segment(last_folio, bytes, PAGE_SIZE);
 
-			for (i = 0; i < nr_pages; i++) {
-				flush_dcache_page(pages[i]);
-				SetPageUptodate(pages[i]);
-			}
-		}
-
-		for (i = 0; i < nr_pages; i++) {
-			unlock_page(pages[i]);
-			put_page(pages[i]);
+		for (i = 0; i < nr_folios; i++) {
+			if (ok)
+				flush_dcache_folio(folios[i]);
+			folio_end_read(folios[i], ok);
 		}
 
-		start += readahead_batch_length(ractl);
+		start += batch_len;
 	}
 
-	kfree(pages);
+	kfree(folios);
 	return;
 
-skip_pages:
-	for (i = 0; i < nr_pages; i++) {
-		unlock_page(pages[i]);
-		put_page(pages[i]);
-	}
-	kfree(pages);
+skip_folios:
+	for (i = 0; i < nr_folios; i++)
+		folio_unlock(folios[i]);
+	kfree(folios);
 }
 
 static loff_t seek_hole_data(struct file *file, loff_t offset, int whence)

-- 
2.39.5

