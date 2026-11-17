Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898619;
	b=u/M92X9yVKK38MFUX0ZlPrb9rIQ/E4jkClqQu9uqUzycrSRq+GbHS5eWlgPZpschd1pM
	 aM6ItsKeNKX6xdyazhaoW8yiGaK/L3/OrWDbCov+nPhGR5ie/AGkfs61Nv6ZdvK6IpTJH
	 H6dEgsge/0HEl1jtSH98vrmRrInPhVDvZPpV9cn1h5hK4fqbLqnaJAT1xomy7drgVlspF
	 kc/PpHBZdLqP80Ee23utHHcJYyH8rbz3nK5l61oZJ+n9f0KTCp8TviS9aEtF6ApPGRwa9
	 Mwv2jiY+hPzRhajR/l8NyYQx7Oq9lgzrpoMb91QHc5aPjkFkr9TUPR9uhO87c9kiM3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=woSlXjzZpR6tp0eHsHfki6p/h8n7dESSmA1LzwoZpo0=;
	b=ETikDoopN/i/By6z59fkBtKEfjGnoIOFpCXAb9CkslOa/1VgzMuvYcTn7PwQv5ngjt/X
	 C+tx5g7ZpdUySEuYXpFRjEe14azks+LDKBLawLTDiinhC/nUsx2g2bWT3+ZPq6I7aolOi
	 02Yl+xfffh6UF+bWRKuSpS5EMg264WgMkRiFMBm8RcnWq2PuKWeJQjIcOQ+qrEGAUHGYQ
	 I8sBqba5FNijiTgCj8DJ4uFSzVWCKdF8Pbn0APtda/Lj0otw5ewu0I7j/hTvrQ9gzLZf8
	 MJS3n6/D8+2dOwpC0xfJQlZr/lKqGIzLcUgu+Tk5NT0tWzwmVrAvglVvGGVzWXEMnEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=o9eFq72O;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=cJ9gBH1C;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D34606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=o9eFq72O;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=cJ9gBH1C
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH5ZcxI3371196
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=woSl
	XjzZpR6tp0eHsHfki6p/h8n7dESSmA1LzwoZpo0=; b=o9eFq72O50Xx/R81+5fG
	cl9mSTFutrLh0b2M1i6fZr73CKMKqvzh3AtyaaOsekuJ+HVsllfG3IN3iVWu86/W
	Y7uYtzRm4q81ZECLceGH3nRBIRxmWDXTaDQ6IdW9LcRQgcPSxxZJjv1epxNE/he7
	GYPf+5Yt5JANIjH0rEW8Vi+pbvkBw8Q+Lfobge22IXXTVm2IMtv4KJEzuv40Yipz
	+8gIfu6QEIb4B8loL3Ra9MzLVrbW2heMkaG5bbmdeCFH+CNB7G6PKBBWATVCI+f6
	ZgsWcDRcYl8T0dL4RqDkhUfX93QYj7pJdHb8jX0ZBI9MGNEz8F46XEi73fOPdnfl
	4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0b959pbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:56:57 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5364f562140so12786791cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794898616; x=1795503416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=woSlXjzZpR6tp0eHsHfki6p/h8n7dESSmA1LzwoZpo0=;
        b=cJ9gBH1CTW+EwQN8P+Xo87qBUKljAMawHQKzsAENcuOpwSp2vY4FXTShaRYmUu2VTy
         Q3p/nipjQqEaCJ7mvNTOgNi6tZzkjViqRrsHrCLuUb4jDC2Fy2jbWbfYzateKBeAnnto
         7xys7j5DBUX0w8lGHzk0LNBgLysORF0uVlvC5t62KK699omfVY0czOeJFp5r3GHqLS4w
         x/Ji6em8UOBE60WsMY78o9awDtJ6Z7bd/WUwboeUp7YXmpwU3fId6ztLk/auYPWZPuiN
         2A+XBPOaOklReiGhMAjDTj3brd5VmVX6sWlZvR95omTftRERSwAvSpH+Y4mzPZR50ern
         FI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898616; x=1795503416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woSlXjzZpR6tp0eHsHfki6p/h8n7dESSmA1LzwoZpo0=;
        b=gGE1OFVIJTVv0/6Vw+kkICmZ0J3eVQSTqvuG0wQ8gPCNiXoin7Jltk7cZmkgARxXcp
         4gK7QpxTqPTbB3Dxd3103D8OSMnvM2ZiPlZPONhMGCv6yGjxV9zKjMtRRVem8WWAWTve
         ++3cAImK0B1cvSlwE72ZM3NtHBf4u73JSLpGAzYGb1maCCVJLp9T3H3v6Zi9ypwxn+FP
         GBLT/VEt3qM2xfIZfFCk55Dol4851uYU3MSwVDoHKGQTUwy2A9HBicfXoEfYtYUUPsH3
         OON0P+Qf4MIoP2N1Bx4BZTKNZR7gnQssjDqZfVl14jdis45vZF+ICWwnTu8v6+hREGPC
         HOKA==
X-Forwarded-Encrypted: i=1; AL+hErG0ZVxkk41OIxEjGiYOLzLKrGasJodkCu+OZWF0TuitohOKHgeIKjLHiBgBoZCex7cTm79J/TTNLyJnM3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wHH9LTty6evnLUb0yvcdS/K9ST+6iki71QnVFMR0ivsvc+ezQ
	PblJ2tU8MQ4pL37K+M0NFdkKqKCLESL4st29BgsFvzk7DDJOCe64RxUl3NOqbAKcUMpDsd7sxDl
	34q3m6ale/B9+JtEkfonfpe32sK6hSPHnNt04R/5b53yvCGXukUXZGPIFxog8Ewp49i4hHQ==
X-Gm-Gg: AYBFou21k8ORMrytfZMyB5NfaLUlJFpbcH79Lmq10R47+IK69WJ/Hvwi4l6Yu+E8oJ2
	0CZHqNHo29qlA3izylgoE9Q2FSNVuLVvJNxTLwrGI8syNoLItt3JWUXkEZg3GO8jKvuS2gUD+YM
	/cz5jJzGtnt7pYdUqBRsvJCcNMqwLFs87AA3TqtpihSolC31ReygOtzyaPgFr9XdekFwVg5n4oA
	SpFgCfikm0EUugoNw6VLHYKNr1ewsWNSh1a5WCafVPVG1pM4hRkX8Vbasffdt81zx298gGOvSDz
	ywJezxWBsiJAoqRnIskgwzf9F2/iK0VXFNBWrpTTQtHAjM3yDubojdmL1N75NiaYk0/2fQ15LwW
	iFUeC+He/+0SmkIoyOoW2nYaY9C0WYFjtJl/Q4o1Mq/JOJL6RRROS+JfMyp9aIDK5iEgQrpXEg4
	mZWmuHzbmtRPh0y3jqKw==
X-Received: by 2002:a05:622a:400a:b0:55d:3669:e04a with SMTP id d75a77b69052e-55d493c44e1mr27157161cf.23.1794898616380;
        Mon, 16 Nov 2026 22:56:56 -0800 (PST)
X-Received: by 2002:a05:622a:400a:b0:55d:3669:e04a with SMTP id d75a77b69052e-55d493c44e1mr27157111cf.23.1794898615971;
        Mon, 16 Nov 2026 22:56:55 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2006csm98408871cf.10.2026.11.16.22.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:56:55 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 01:56:16 -0500
Subject: [PATCH 1/3] jfs: stop kmapping metapage folios
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
Message-Id: <20261117-jfs-page-leftovers-v1-1-2722918aacdb@columbia.edu>
References: <20261117-jfs-page-leftovers-v1-0-2722918aacdb@columbia.edu>
In-Reply-To: <20261117-jfs-page-leftovers-v1-0-2722918aacdb@columbia.edu>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794898606; l=4130;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rVeKtxYj0c9LE7OIURnIsmjFGt3aZqCy72ti/WEGVAg=;
 b=uG8EjL4od2JXnDqagK8+IWTksU9f66unu6SUrBx6DlYsXp+tPg8utUonJFcDqe5Lx+H6wr36W
 XgCppMvXUfXDHpivXyPuimAcysDA+eRqgu7RBO5pgNA0i4cbtjkb0p5
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfXxWOQaICDgSgA
 M7UsRAby9CHGHmcfHYYSautQC6vw0DSg2o1n+vK1Z78t301Xz6gFtUAw4KhrIGhW1ShtcK0cKMf
 88wmuhzVqPxIniLTyEYKjWqOMmFEXLIVmtZZT9X7KQD0RRLg5yxlV1cNVkE+sqQX0/fGtqnuodz
 0TpC69aXN2q7Z37B3I2tkhGJyoUyjkPujZfPBYuSPySmIyc285UDj61ghbAgDjQaRjtzriURaqO
 U7NKJIzKCdMR9hcEwR8KVagrGfigdxSQeh6bVh/aqy6bN58HUDRLC/OMo2U/F+ZtLrljVWjsF5j
 d7G6KYpwVQxQ5oQbF9GLGpms5fIPG4ChufXcTWHTud7tbU1T3Z+ztx2YWZfsI8W8kVXojK5foSO
 ywkG4JunmMvHY/KcOd09LIhkYFsGgzwd+JtjfPTDvwTiuReiTl7BIdv4VK6IUCxqodfydJKUBZk
 hjGxFsWqcPTV3/hBiBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfXyuR+9Eo19N6k
 PwB0I3tpz9YzH/xmWfrlUruYoFhuo778uQcQtKRc5XjW6f50rUyZz97l4rU5c9YcD3SNDoJdBgb
 QnENGYD8vR+l0qRYFXWges/9/Lf/8Q6KXEHF05l1kGyEhSwxNehb
X-Proofpoint-GUID: MloA-tPLMGpzC142_EMYWukU-uwTnmC0
X-Proofpoint-ORIG-GUID: MloA-tPLMGpzC142_EMYWukU-uwTnmC0
X-Authority-Analysis: v=2.4 cv=TsBzFzXh c=1 sm=1 tr=0 ts=6afbfab9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=ERgbrWms-dAX4imIfVcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=10 malwarescore=0
 phishscore=0 lowpriorityscore=10 bulkscore=10 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170027

insert_metapage() kmaps the folio for as long as a metapage is attached
to it, but both metadata mappings use GFP_NOFS, so their folios never
come from highmem. __get_metapage() already relies on that by setting
mp->data from folio_address().

Remove the kmap() and kunmap() calls, and add a comment at the two
mapping_set_gfp_mask() calls so the mask doesn't gain __GFP_HIGHMEM
later. This removes the last users of the deprecated kmap() API in jfs.

While at it, fix three comments that refer to pages instead of folios.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/jfs/jfs_imap.c     |  1 +
 fs/jfs/jfs_metapage.c | 11 +++--------
 fs/jfs/jfs_metapage.h |  2 +-
 fs/jfs/super.c        |  1 +
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index b84ba4d7dfb4..aa60437d51af 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -467,6 +467,7 @@ struct inode *diReadSpecial(struct super_block *sb, ino_t inum, int secondary)
 	}
 
 	ip->i_mapping->a_ops = &jfs_metapage_aops;
+	/* Metapages are accessed through folio_address(), so no highmem. */
 	mapping_set_gfp_mask(ip->i_mapping, GFP_NOFS);
 
 	/* Allocations to metadata inodes should not affect quotas */
diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 41fe12e641ce..b483c8d4d999 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -102,7 +102,6 @@ static inline int insert_metapage(struct folio *folio, struct metapage *mp)
 		if (!a)
 			return -ENOMEM;
 		folio_attach_private(folio, a);
-		kmap(&folio->page);
 	}
 
 	if (mp) {
@@ -129,7 +128,6 @@ static inline void remove_metapage(struct folio *folio, struct metapage *mp)
 	if (--a->mp_count == 0) {
 		kfree(a);
 		folio_detach_private(folio);
-		kunmap(&folio->page);
 	}
 }
 
@@ -212,17 +210,14 @@ static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
 
 static inline int insert_metapage(struct folio *folio, struct metapage *mp)
 {
-	if (mp) {
+	if (mp)
 		folio_attach_private(folio, mp);
-		kmap(&folio->page);
-	}
 	return 0;
 }
 
 static inline void remove_metapage(struct folio *folio, struct metapage *mp)
 {
 	folio_detach_private(folio);
-	kunmap(&folio->page);
 }
 
 #define inc_io(folio) do {} while(0)
@@ -405,7 +400,7 @@ static void last_write_complete(struct folio *folio, blk_status_t status)
 		}
 		/*
 		 * I'd like to call drop_metapage here, but I don't think it's
-		 * safe unless I have the page locked
+		 * safe unless I have the folio locked
 		 */
 	}
 	folio_end_writeback(folio);
@@ -652,7 +647,7 @@ static int metapage_migrate_folio(struct address_space *mapping,
 	if (!src->private)
 		return filemap_migrate_folio(mapping, dst, src, mode);
 
-	/* Check whether page does not have extra refs before we do more work */
+	/* Check whether folio does not have extra refs before we do more work */
 	expected_count = folio_expected_ref_count(src) + 1;
 	if (folio_ref_count(src) != expected_count)
 		return -EAGAIN;
diff --git a/fs/jfs/jfs_metapage.h b/fs/jfs/jfs_metapage.h
index 2e5015c2705b..5c1fd9c1a84e 100644
--- a/fs/jfs/jfs_metapage.h
+++ b/fs/jfs/jfs_metapage.h
@@ -62,7 +62,7 @@ extern void grab_metapage(struct metapage *);
 extern void force_metapage(struct metapage *);
 
 /*
- * hold_metapage and put_metapage are used in conjunction.  The page lock
+ * hold_metapage and put_metapage are used in conjunction.  The folio lock
  * is not dropped between the two, so no other threads can get or release
  * the metapage
  */
diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 8180d83d33fe..3cd173e03a38 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -517,6 +517,7 @@ static int jfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	inode->i_size = bdev_nr_bytes(sb->s_bdev);
 	inode->i_mapping->a_ops = &jfs_metapage_aops;
 	inode_fake_hash(inode);
+	/* Metapages are accessed through folio_address(), so no highmem. */
 	mapping_set_gfp_mask(inode->i_mapping, GFP_NOFS);
 
 	sbi->direct_inode = inode;

-- 
2.39.5

