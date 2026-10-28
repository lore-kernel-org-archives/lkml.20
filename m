Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174830;
	b=DE1R757aVx5IhP/xQlbzaScZzFc8K2Ooo4R8zjG6JuZORcCcIlHVGj9JaliyAylPS9c5
	 fRZHybMLX1qGnXx8SZXB2aeSbpjX0+KbNuWbCwXUECgZZAagN27E622NGV6q63MCLALrS
	 7LWMXTzXQBYuCPwQ9HPhJXMS+4qSej/jMgnqbq/bRTTPIBT4geiBXOTDbR89rwmLGc18d
	 gQFJGupCMpQfpC8kHb7Nyfr5xcZP/FR3JcZKEHOWKUgNJjdT+Zlq0XBprocCr5sfoXjE6
	 6ms3KYmA6JKUz6FAly6Pjopkz49aoSOfvFicgfyJ2zTy1Dbh42w7f5wPiH7fCLUkV4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174830;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uN//U6fNaSCGxuuwZCqjExmTgMh6aYpdlR4p/jLbEeo=;
	b=sMEw3t0upwpZsF/ivOvklrbRgBi2WO2DpoUo+arTjoV0us6tdnRqT4qN44Q7482xbJKc
	 c7w3nNW9V5OrVVuqBaSzKELj8MxX9Pj3ZZ81FiS22afLUvKDAz3oBN1WLkGwfnBnp3sQe
	 8P0vGIJegYWb2t/vgxkms2qpGu6bNg1fwh6XxMbGShpYPei37OhnvFV6SQ8CX47+YK2rQ
	 Hj71LiNt8KsQMrrfceDdB7owrtt2qY1SG/9fP3z2vqmhLsaqDu+sspNkoXip9OKC3vZ7M
	 v9F63N4OdOZ/pBTmD/g2Ql/E3uBsGQdVfSzAsZNNXpIeRBuJ0LvVXzsG+ApowUwdcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46405606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46405606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8d48e01ed2a611f19a56ed5b684f684d-20261028
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4e23c3a1-597a-4e39-8353-ce32cba52248,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:01797ad0175a58478b9f4426142abb31,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	2|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8d48e01ed2a611f19a56ed5b684f684d-20261028
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1853876311; Wed, 28 Oct 2026 16:07:00 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH 1/2] ntfs: keep the file size on a failed initialized-size extension
Date: Wed, 28 Oct 2026 16:06:55 +0800
Message-Id: <20261028080656.1027283-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

ntfs_extend_initialized_size() only extends the initialized size and
never changes the data size, but on a failure it calls
truncate_setsize() with the old initialized size, which shrinks the
VFS size down to it and drops the page cache beyond that point.

None of the callers rolls the shrunk size back.  A buffered write
into a hole has nothing to roll back - the data size never changed -
so the file keeps the shrunk size even though the data size on disk
is intact.  The mmap and named stream callers return without any
rollback either.

The sizes did not change, so nothing needs the shrink.  Remove it.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 fs/ntfs/inode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 206db4e99ef1..ac13e8776909 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2599,8 +2599,6 @@ int ntfs_extend_initialized_size(struct inode *vi, const loff_t offset,
 	mutex_lock(&mrec_ni->mrec_lock);
 	err = ntfs_attr_set_initialized_size(ni, new_size);
 	mutex_unlock(&mrec_ni->mrec_lock);
-	if (err)
-		truncate_setsize(vi, old_init_size);
 out:
 	filemap_invalidate_unlock(vi->i_mapping);
 	return err;
-- 
2.25.1

