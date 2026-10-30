Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369152;
	b=uCy2NjeKmNzElOEiTNSOtaOCOxXl0Y7AQu8Xl5ZN6kdgszWeZd+svu1kUiKoEsw/rKjF
	 hNHiTssCpOLu0QG5r3hrFt2lWhfZN8VFP7NjdS8C0HlQVmTg0oOkcbLzxgzhA0PaC5CVz
	 JZ8jJEd8bknPQtuTpBDwfizIK5ZnJlO05SoysoWvAUG0oVNZgOpdX14wUu3Y4gwu+2xhB
	 JSP7KAd7slq6w8iYYn29xntm3FPstVoKRZNumwRxK8Yw5g8W+V/WiuO7fq95FJC91mc1l
	 ernAX/jqKAaZFgLK//RM3U+Ngma3TNJxq5fv4kqlGE1NgHm7U2Cbz9fwIEh5GfPOEgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sv4g/tjxw4E2DDvYaZDqzz0ULZtM+MSYGqR0D5ByUdQ=;
	b=ig+CpjmHzf6v6tvE/I99YtDiyIKhsbgH45Xligy9blDAmdtwhejIrP8MXDr4fF3UtIGd
	 kC87QTu+WEvIk7+vdbyWG8A37XlFAzBUx3SwMnGRWiHGr+mHxFXRiFkIp38spQbRILmgE
	 0UAXTviRIUij5Y/gmYsgSiNRDTP1sSbIF3UIdFGcb+IK8BNHfXi60Xori9dp2bKAf9Fdt
	 pGzi11rZR4JU9JKPtbkK81/V73vpM8Bo+EJEwmJBUUr+bXDIj0mCmgq2bzTjnhOICp/rt
	 fyDvnLxQQX0e3iZpmBWEFiZmS+BUPWs24EXL9Ka4Xz+O4iUcqj5pZ+sfm7ynKgu0VTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gB+wSrHe;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FAF606A335
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FAF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gB+wSrHe
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so351058b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369151; x=1793973951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv4g/tjxw4E2DDvYaZDqzz0ULZtM+MSYGqR0D5ByUdQ=;
        b=gB+wSrHe5iKmUzBED09ovuO1VLAyAwGkpb8LAzjAM5J/x1bYWhbGTLK59Mfcv6MUAs
         46DRJ6lv0zbLPRmjMtBkvsHNYPg8wdIYS59jqLtTI9I3ecxL7oLYCJn1i1y46+rAHV8D
         OMF5zJTo9XcSLsbEoQ1Em1g7MGFAb5QHc5B0yLWmCfzqPajxbVN8Va5y1MEyrJeKlTmC
         ikodp5iWsg43LfiArRkveBSxxs3QOTRgPJSkK18nyGrsjnsiJJj7tyqyGnlOLOtvu0kq
         VdPxCp57VJfpVB5yB4LrH0o5pu0t/6FyMPRmMSrlHOayJqKBHl6zb+0+8vATIPkrdOiV
         QNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369151; x=1793973951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sv4g/tjxw4E2DDvYaZDqzz0ULZtM+MSYGqR0D5ByUdQ=;
        b=R73Ht7jGbbNuf46pQMJ6CfSsVF3J5IUG1qmzZPyi/KxO2Sdz2pYjO7nPo7Hha6ie1e
         ryr/qUSejW0xtLIgkrJehwcALlzBssa0tQLrd1mRpN6/Wbhiexn47SFwNyIJ5I5dbFtb
         64DtZB1YW4UfPRdvY0t1T7XbHIpOSr30xi78MW0y1MAY8noXv2asiLADT4aq5r81tOfJ
         cEQmpFabmjfm7cLqWsCh5bichGSHD7tVA04E94myct50x9PB8zuhBVmWe01wLKvsOSZh
         rpazaMCAn2i63INgJGgbkZS/5Qg4dxCs7a6sRYpOFHbUNNccXrlgbt8mkbSOQNlhgBbU
         Vt1A==
X-Forwarded-Encrypted: i=1; AKwUvByEsq9YKQwrgtpScdTsDxPrNsDomHYKpVbRsZthiaMYnC4bXc3D/7a5UJTPo1kYKq/A2MFnTzBt5YFSUng=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQXIyAVnv5HLLHOB3SehzkdcGPhhBbnTHR+o3hpdn7+//zyEWW
	1rBgf5kyKJ+cfjgZnzBm6GOqH8kT/gi58n4VcShdYmaZcQOZpKZKnbbX
X-Gm-Gg: AYBFou2HmdWgO7OkFEHHMgXTcrSJYHxDY1ASyJT3SLZJG9I8IbbhuSrkRz016XZ6cQR
	tCAry8EopwviQBcTeQBEe3g6cyNmXqc5BNJZWBGPuyFZ3pOtkQtn+Wu/Ric7O2Zvgs1jU2ClrmA
	yHqbTDbNzXmS/n9uALKrbAbJBWeT9q7eEF1YvxvR4KwZAXCIF0yL9lWqFWws/PgqywHigrcR748
	fW1d3XMaUET62Z5aXI5tV/OqR9hDw/7orZOoB6TkI1MECUhiPER2gtAtNdQECJTrRLCj5hWZSa9
	ucJmmPGfmGuiySxWt7rzvZ1payZ1FScJgbcrWCRCWJbsaALGD1DXNAh5OZSEV1a4xHoy1SiHovJ
	WFvJSSRSnG1YZp9O9wGSHa1SVFpHs6cq0P2tWcaLw63WHEWtBhxSnvwsF37xv3ca8jcxQ51E2rY
	sbe1n9K96d/ek84X8XCL8ZUOtGO+bc2fJ9QkCAwmYoamvkJHMMZ2foFHk85oPS6z76M0s1UnbLv
	nX2iDqtr89gCTr66CyBykRi6pmp1fyaTiyTezWyijQfyxE4PPIzNhmKsmJiQgR6Z0jN5U9m5ckE
	djNnitJB9ym3/ho5iX+DeLjLVYbYN1hXdcE4lA9Zb/d0aMnfl48o60y5qx2d0KfVUDiOnNovZNg
	ygUFcLu53a6zHR244r/HpbU/4PdD78iA+vBpcbFXalQUr4dag6cHLH8J2l1QgzEaGld52kMDDOG
	6nObl9xtZYSsdBHw==
X-Received: by 2002:a05:6a00:b81:b0:886:ead5:6d36 with SMTP id d2e1a72fcca58-8a9be29f1aamr1998231b3a.45.1793369151095;
        Fri, 30 Oct 2026 07:05:51 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fd956sm26043b3a.3.2026.10.30.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:05:50 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com,
	syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2 4/4] udf: don't use eloc after the end of the unallocated space table
Date: Fri, 30 Oct 2026 22:05:37 +0800
Message-ID: <fd9ca4c4ba98c00c012ec861f6c0bc08a3b1d07b.1793349907.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793349907.git.matthias.goergens@gmail.com>
References: <cover.1793349907.git.matthias.goergens@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When udf_next_aext() returns 0, its eloc, elen and etype outputs hold
no defined value.  Two walks of the unallocated space table still use
eloc after the walk has reached the end of the table.

udf_table_prealloc_blocks() looks for a free extent starting at
first_block and decides whether it found one by comparing eloc with
first_block after the walk.  If the table's list ends in a continuation
descriptor that leads to an empty allocation extent, eloc is then the
block of that allocation extent, which is in use, and if that is
first_block, the block is handed out as preallocation.  Once
udf_discard_prealloc() no longer frees the wrong block, this is what
still makes fsx in generic/091 and generic/263 read back bad data on a
table, in about one run in four.  Only take the extent if the walk
stopped at it.

When udf_table_free_blocks() cannot merge the freed blocks into an
existing extent, it appends a new one and sets only its block number,
so the partition reference comes from whatever eloc held after the
walk, and with long allocation descriptors it is written to disk.  For
a table without extents, eloc was never set.  Take the partition
reference from the freed blocks instead.  Short allocation descriptors
do not store the partition reference, which is why this half remains a
latent long-descriptor fix rather than a reproduced failure.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Measured on 2-3 October on the for_next base 4ad934e7a85e by running
fstests generic/075, 091 and 263 as a group, each run on a fresh 2 GiB
"mkudffs --space=unalloctable" test filesystem.  With patch 3 alone, 8
of 34 runs read back bad data in 091 or 263.  In 32 of these runs a
temporary debug message (not part of this series) reported when the
comparison above matched after the walk had reached the end of the
table; it fired in all 7 failing runs among them, each time on a
continuation descriptor (type 3, one block long), and in one passing
run.  With patches 3 and 4, none of 18 runs failed.  The
udf_table_free_blocks() case has not been reproduced.

 fs/udf/balloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/udf/balloc.c b/fs/udf/balloc.c
index 2ec577b..7512418 100644
--- a/fs/udf/balloc.c
+++ b/fs/udf/balloc.c
@@ -457,6 +457,7 @@ static void udf_table_free_blocks(struct super_block *sb,
 
 		int adsize;
 
+		eloc.partitionReferenceNum = bloc->partitionReferenceNum;
 		eloc.logicalBlockNum = start;
 		elen = EXT_RECORDED_ALLOCATED |
 			(count << sb->s_blocksize_bits);
@@ -532,7 +533,7 @@ static int udf_table_prealloc_blocks(struct super_block *sb,
 			  eloc.logicalBlockNum, elen, first_block);
 	}
 
-	if (first_block == eloc.logicalBlockNum) {
+	if (ret > 0 && first_block == eloc.logicalBlockNum) {
 		epos.offset -= adsize;
 
 		alloc_count = (elen >> sb->s_blocksize_bits);
-- 
2.56.0

