Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C0550DC0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085707; cv=none; b=YA/BsDMn7B1DFmEtMpBibYQPASEvz0SFfnjL9BOaOa8u7Srd81KaRGeFfuNq3CLsmfu3CLWGXEX8Ld7vrY9B8QvKV8WeiyoVfMc3yQkc1JhbJPB3U0vVwy8eucvFEuDLppsM9bi5hqJEenhMkYl5h4t6PEbu0cVwq0IqoVhtHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085707; c=relaxed/simple;
	bh=3U4Ql79vVPopRfavLTmA8NqbKhWApnQJ1mkN1HYYhho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tc228kYX1kuQQHJsauRm/Z+/IDHRrh0B51vCfa5l18BmWW0xM2Joe8xeMJoYQZLZAW3SjQ504MxSfl+m2jyb2C6OqhpyfMDMrwHC7jA3PN/RY0CGsyrX4m6dzat1B4hC3v5Q7eAnTsjDwGIgbnRzQRHpHmGymsQNup7j4drdHBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmMr1pwB; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmMr1pwB"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85a4329731cso3312001b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790085705; x=1790690505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoKssft9l1zcAv984LexCRNeW4PIN0qjiBZ2Kra0Bhw=;
        b=AmMr1pwBMOxJAa7hf4+COcophPdnVo/YwXW0KkVgSTjTL45LA20p20uxaR13K6L1lw
         LHIWD5tmt+nN9I0Qhvq8NLuO938+cJEotOErXbv4GPEdI4Vokdjt/KLY5q0aRwLL9S/Y
         5mb3tp8kxaqZABOYftrxp5uRu5KNyDOTbnIbiJ+XqP0NQOLqtZetc8aQDgf4cGjAnnhd
         x45xlm+1vHpSAE8ZnENMWP9gMNCmfiMC7T0PO3hCEZD9qdrDkbDsqjy4ZXVj60GQhjxn
         S2WddrfJBGJLnP9OIBbocs2ifhf1TYp3UD0XjudeSJ/FQSY/oCF6E/vlzKzmO3KobVNS
         E6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085705; x=1790690505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YoKssft9l1zcAv984LexCRNeW4PIN0qjiBZ2Kra0Bhw=;
        b=k/tGQ5GZQs6+BSC2Xlof2bySYJDSfOPb+5e43YYfdJIpaiYcy34dvpYs9wJOHIUac2
         SkVeC0USCwLN9quidznFnGWWXmZwNdf007TiCVkXPJ1JQFd1abDMzXp1hbQFgHyqHaAi
         CvvWty3rjhAdKId4yEb4BpNXlvTLB49Ejqzz1Lzf3cbl5r3G/iKrpAk5w0niUufgGsJ4
         WmgNnhKcB7GahwKs5VHGE23X3UF6v76KUWaAQd5ukk74n8TW6qUPm4Y/VMt6wYKo67SA
         WkS4x5WwhIGFycOTGlZPZ1MACouj6qec8YwQlVNmIflqzh/ELdjSOqwz6TPlxsbzzm/s
         Lj8g==
X-Forwarded-Encrypted: i=1; AKwUvBzO6ahvlVq+oP9s49B5HN12DJTMM1Lsx7YpmLdDUqrxLwrmhk0nmFgF3Ea2P6WNR2PToxBtf+NPqA+ZSkc=@vger.kernel.org
X-Gm-Message-State: AFuF++kj/cutN3OjKU3G4CdaZg5GLcNYLuYHQHt8NtmfXv5dl6JolYXO
	9yaMd3IIFAsFQQ8y7riMOZtl/q9C9owXdtGY/hiOHArlUMUy3MWb5DBl
X-Gm-Gg: AYBFou0PHGQeTH9XibUxK7j8SQog5mlHUFFgXO7UkpeOmeRP6Bn2WFMwus0bRFgg8eJ
	7+jKeJvI1JNTxIuD/tqiiccu7fAKa1dFBWfFEirpgKgfpRwK6fTewcmn25bCa3jmt1tEP0Odxaj
	vYW3z2e7ThP74hEydRtC1BVoK3o7AaOI2U+EXOmYMMoY5+KyOw2govxAqaxcyGregW28enqJLK5
	qMHLPWkt9ZJ9w4g7c6S1XWizqTfiPR/j/jA9XeEF3SuZ87PNQ635q1WtlmtFogJ+fXuaexUPBG9
	lfg89yvmwrQ5xA84rhd6IkUJZuumtHtIW7WZgXhd5+O4Gd7Iv1U9Ix049YfSdS0JYNk57z/TaxQ
	ajnf4u/qCwOtZvBMWLXeZbKc5evaEBtYODp37Hdn4dFKFpROZxp3fp7PXX64tUuT1aF3apu4yqA
	mjP+gqmU/9t51qbrch33rbVucCiBd7cqlVWOnRk1OjNS9yZn4l0LU322rS+7VOnrwSNKNU4sdI/
	10Q51nvQYm1/WogSIITZHNiy1deVw/Usfivp9Fdyl9xv7TaL3XD4A2NtazSVNs+AouPIaABGM0R
	UzB+gd+Wia3gEXPJWi19Pf4P1I5R3UAYmqdw3QKrKvfpjBJmxgfN8llhZUTnJOA=
X-Received: by 2002:a05:6a00:8085:b0:874:708d:b620 with SMTP id d2e1a72fcca58-87c8403d93amr1298947b3a.30.1790085705347;
        Tue, 22 Sep 2026 07:01:45 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c329c813fsm932803b3a.38.2026.09.22.07.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:01:44 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	Yichong Chen <chenyichong@uniontech.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] isofs: drop support for level 3 records straddling blocks
Date: Tue, 22 Sep 2026 22:01:37 +0800
Message-ID: <20260922140137.1768064-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922140137.1768064-1-matthias.goergens@gmail.com>
References: <20260922140137.1768064-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isofs_read_level3_size() is the third copy of the directory record walk
and the last one that still reassembles a record spanning two blocks.
Now that it validates every record with isofs_dir_record_valid(), such a
record is rejected before the copy can run.  ECMA-119 does not allow
directory records to straddle sector boundaries, the same assumption
commit b2eb2e288604 ("isofs: Drop support of directory entries
straddling blocks") relied on when it removed the equivalent code from
readdir and lookup.

Remove it here too, along with the temporary record buffer it needed,
and fold the end-of-block case into the existing zero-length check the
way commit bda8d8d49ca1 ("isofs: Fix handling of directories with tight
blocks") did for the other two walkers.  That check has to cover both
cases.  The code being removed here ran on "offset >= bufsize", so it
was also doing the block advance for a record that ends exactly at the
end of a block, and dropping it without replacing that is what went
wrong last time.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/isofs/inode.c | 38 ++++++--------------------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index c9bc1f479161..70097456b721 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1174,7 +1174,6 @@ static int isofs_read_level3_size(struct inode *inode)
 	unsigned long block, offset, block_saved, offset_saved;
 	int i = 0;
 	int more_entries = 0;
-	struct iso_directory_record *tmpde = NULL;
 	struct iso_inode_info *ei = ISOFS_I(inode);
 
 	inode->i_size = 0;
@@ -1198,9 +1197,12 @@ static int isofs_read_level3_size(struct inode *inode)
 				goto out_noread;
 		}
 		de = (struct iso_directory_record *) (bh->b_data + offset);
-		de_len = *(unsigned char *) de;
 
-		if (de_len == 0) {
+		/*
+		 * If we are at the end of a block (or at its zero-padded
+		 * tail), move on to the next block.
+		 */
+		if (offset >= bufsize || de->length[0] == 0) {
 			brelse(bh);
 			bh = NULL;
 			++block;
@@ -1212,36 +1214,14 @@ static int isofs_read_level3_size(struct inode *inode)
 			printk(KERN_NOTICE "iso9660: Corrupted directory entry in block %lu of inode %llu\n",
 			       block, inode->i_ino);
 			brelse(bh);
-			kfree(tmpde);
 			return -EIO;
 		}
 
+		de_len = de->length[0];
 		block_saved = block;
 		offset_saved = offset;
 		offset += de_len;
 
-		/* Make sure we have a full directory entry */
-		if (offset >= bufsize) {
-			int slop = bufsize - offset + de_len;
-			if (!tmpde) {
-				tmpde = kmalloc(256, GFP_KERNEL);
-				if (!tmpde)
-					goto out_nomem;
-			}
-			memcpy(tmpde, de, slop);
-			offset &= bufsize - 1;
-			block++;
-			brelse(bh);
-			bh = NULL;
-			if (offset) {
-				bh = sb_bread(inode->i_sb, block);
-				if (!bh)
-					goto out_noread;
-				memcpy((void *)tmpde+slop, bh->b_data, offset);
-			}
-			de = tmpde;
-		}
-
 		inode->i_size += isonum_733(de->size);
 		if (i == 1) {
 			ei->i_next_section_block = block_saved;
@@ -1255,17 +1235,11 @@ static int isofs_read_level3_size(struct inode *inode)
 			goto out_toomany;
 	} while (more_entries);
 out:
-	kfree(tmpde);
 	brelse(bh);
 	return 0;
 
-out_nomem:
-	brelse(bh);
-	return -ENOMEM;
-
 out_noread:
 	printk(KERN_INFO "ISOFS: unable to read i-node block %lu\n", block);
-	kfree(tmpde);
 	return -EIO;
 
 out_toomany:
-- 
2.55.0

