Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EB03FC5C9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512505; cv=none; b=Mb9/Rz4Agl6ea9xblRwHd9mhS2oMe5XuP0wlZefqXzvp5zLKGC3ec8t2DUkBTCcxBGKNq/MOCA86y9WhOlRIrFgdN5vTFEd4U7R+dlIPlDS9mjwBYofI38hfdhUyyu3mmdhh+4j4ZOhX+lFDS+7pDKxquk63s/bXE4dv1rtkFbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512505; c=relaxed/simple;
	bh=9uBlqEjiAXyypijmEOGf0qaPPewJUOcsaqPql5duWsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvGH2ohc4YV/TGcEITJWvgIQ47MoAQ2HxMiTMB8TBN7Vx0neuxZJxwt+2FNJIxSGOKwSXNLhmLLHHLJTNtpB64qvlgReydhyF2Y2byDvV2HmXdGrq1+0tsNMalk+i5J6ZfkxpLydb3RBoS2lZr8dO50N5IGZfDEgZ79xqG44GNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FAu47L+M; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FAu47L+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jR
	n1xiWbbjvW1QMlGXZTnpr3hkMo6O3/2pu4o6mX07U=; b=FAu47L+M97h+jIwzTh
	3AgJrv8UYyEALapQvqomWmLOVLFHR61bWfWmK0tbn0Zv5hwhokmahliCml3USiJC
	01BQTvxygjOVMNEwG8cmMWenp2XNTRzTrrnlPT8ImWu94LkF00e12NmJyDeeilI7
	kIVmYbJvTGEZitao697FK0Svc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAHU97ViJpqDNWCAg--.41284S3;
	Fri, 04 Sep 2026 17:01:13 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v2 1/5] ntfs: return -EINVAL from ntfs_collate_ntofs_ulongs() on bad length
Date: Fri,  4 Sep 2026 17:00:50 +0800
Message-ID: <20260904090054.3365538-2-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260904090054.3365538-1-liubaolin12138@163.com>
References: <20260904090054.3365538-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHU97ViJpqDNWCAg--.41284S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyfZFWkGFWruw4DtF1UWrg_yoW8JFW3pF
	9rCFn7Ga1kJr12yrs2yr43GayavwnrGr47t390gw1xX3sYqF1rtr1FqF1I9r4IvaykZw4r
	Xr10q3y3ZrykZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMWl9UUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RqZZGqaiNqvVQAA3W

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_collate_ntofs_ulongs() returns -1 when the key lengths differ or are
not a multiple of 4. But -1 is also what cmp_int() returns for "collates
before", so the error is indistinguishable from an ordinary result.

ntfs_ie_lookup() acts on that difference: it maps -EINVAL to -ERANGE, but
treats -1 as a tree-descent hint and breaks out of the loop. A malformed
entry in $Reparse/$R or $ObjId/$O is therefore silently taken as a lookup
miss.

Return -EINVAL, as the sibling ntfs_collate_ntofs_ulong() already does.
Well-formed keys are unaffected; both indexes use key sizes that are
multiples of 4.

Fixes: 5218cd102aec ("ntfs: update misc operations")
Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/collate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/collate.c b/fs/ntfs/collate.c
index 77e34038902d..744fdfd7bf58 100644
--- a/fs/ntfs/collate.c
+++ b/fs/ntfs/collate.c
@@ -73,7 +73,7 @@ static int ntfs_collate_ntofs_ulongs(struct ntfs_volume *vol,
 
 	if (data1_len != data2_len || data1_len & 3) {
 		ntfs_error(vol->sb, "data1_len or data2_len not valid\n");
-		return -1;
+		return -EINVAL;
 	}
 
 	len = data1_len;
-- 
2.51.0

