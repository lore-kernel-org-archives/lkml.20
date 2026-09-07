Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DF45198B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776225; cv=none; b=pddwHW34Pw0h5UPDUKm+hXXkTQrn6rhfUKt+FBf5uIGKzU8yiu8HlaJ6Ow5UAvKOcKEYCJuW1/mk/V2MMKHkn84eo0bvvv0lUtgEWOzsopJWYYv1E1f+kKTwcxZrlEPNx75D8i2KUMGdxAwtnREdLLHJhmYwfi01Ynp/EB20/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776225; c=relaxed/simple;
	bh=LI3EqygWwh3PP+z9HVp9tryyTN47R/PXZcmxwrEwVuA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FO0r03llkWBb597oCRIBNfugT3jDWs17LfFTuk5FIVAxoVpBQrZUQ3L3ZazudocNcUZPYtmkNh9rcoI74W+xLjkPdRCoH8u7RNnM3bZh0VucrPJj8nPaO87Xvx0GB/MJbxN2eP/hWUbUmajv3KuPAJUx5pkk+AOaIS5sGyoWfFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3f6ea03caaa511f19a56ed5b684f684d-20260907
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a5c6de46-ed49-40c0-a0a9-677deddfde51,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.19,REQID:a5c6de46-ed49-40c0-a0a9-677deddfde51,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:7db8b62,CLOUDID:609a6793e62dc0754ca51e8401f7e3a7,BulkI
	D:260907181657802PPLP2,BulkQuantity:0,SF:10|38|66|78|102|127|136|850|865|8
	98,TC:nil,Content:0|15|50|99|100|102|151,EDM:-3|-100,IP:-2,URL:0,File:nil,
	RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,D
	KP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3f6ea03caaa511f19a56ed5b684f684d-20260907
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1300541095; Mon, 07 Sep 2026 18:16:53 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] ntfs: remove unreachable code in load_and_init_attrdef/upcase
Date: Mon,  7 Sep 2026 18:16:23 +0800
Message-Id: <20260907101623.671477-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both load_and_init_attrdef() and load_and_init_upcase() open a system
inode with ntfs_iget() and, on error, run:

	if (IS_ERR(ino)) {
		if (!IS_ERR(ino))
			iput(ino);
		goto failed;
	}

The inner guard is the exact negation of the outer one, so
iput(ino) is dead code.  Drop the unreachable branch and collapse
the error check to a single statement.

No functional change.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 fs/ntfs/super.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 60d43339c590..1b916deb7acc 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -1235,11 +1235,8 @@ static bool load_and_init_attrdef(struct ntfs_volume *vol)
 	ntfs_debug("Entering.");
 	/* Read attrdef table and setup vol->attrdef and vol->attrdef_size. */
 	ino = ntfs_iget(sb, FILE_AttrDef);
-	if (IS_ERR(ino)) {
-		if (!IS_ERR(ino))
-			iput(ino);
+	if (IS_ERR(ino))
 		goto failed;
-	}
 	NInoSetSparseDisabled(NTFS_I(ino));
 	/* FILE_AttrDef must hold at least one entry and fit inside 31 bits. */
 	i_size = i_size_read(ino);
@@ -1301,11 +1298,8 @@ static bool load_and_init_upcase(struct ntfs_volume *vol)
 	ntfs_debug("Entering.");
 	/* Read upcase table and setup vol->upcase and vol->upcase_len. */
 	ino = ntfs_iget(sb, FILE_UpCase);
-	if (IS_ERR(ino)) {
-		if (!IS_ERR(ino))
-			iput(ino);
+	if (IS_ERR(ino))
 		goto upcase_failed;
-	}
 	/*
 	 * The upcase size must not be above 64k Unicode characters, must not
 	 * be zero and must be a multiple of sizeof(__le16).
-- 
2.25.1

