Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612327;
	b=0bIJUqClmyyoluwl3pmlPQr1fhQQkU1osfi188d/VsmBMFAM/CqufV9S0OXw8EMFCrxK
	 uJNTWRndG/KlnccfgxlnF5bsHx3SdDoqNepuDSVowSLdkQsGO/P/GKI2iUNQCrE5nGckP
	 kw29txRA4KFaL0/2WGoirOoZJEwg7WLzFSul4ZUD8OghInVdPk1ZARCH26uAtEcgwzbv4
	 BHFtZQ+QFQx5x4HoybIX8scE1Uxfi+K+h6i8KTp6cpvUx1bM3bdfff6gcgP7XFYG4oeQp
	 jg5SHbWArPFJNAa2yNHWwrcRPflvDQQUnrOnWwkCjua6DbYRZRZwaeMMRfCvk9I4ZXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612327;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/gTJQbZWPXuukNhpxnhsiQoF377JbkV8BMf46VNa8zs=;
	b=089vq1UXC3AnNGzBO5EtL/kom2Ncaj8I/rDj5AO9buT10WfNxmydu+K32zdaubMG6OZD
	 LiE19mbLig99gzbNuhK3ElaeCDt9dsLpBOxDdKKzIdfrcngYUT86+/tXgbuxKEvkfPNFe
	 0cKnz5+wjPuAJ6BKx6aPFVUkJTMbnZIvEc9b7Y1mm34CdSBBWZd6MJYcJfaKSiZ5E4PBF
	 zVjMrjoSmUXa9cYLnWNE/N97S+/M4fYeOFa/s/0hUtONXELRP07Y+uQOOYQzLQL0+Ki6a
	 8kY2HvjgMPJmXc3CcU4ZoxhYftJ2k4DiuR4QIv0gSCyeCVrB97G9ITsThiOYTgDlzTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA86606A324;
	Mon,  2 Nov 2026 09:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA86606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2ad7dd0ad6a111f19a56ed5b684f684d-20261102
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5187ac7a-33cd-413b-aec7-efaaa935b386,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:df488f2e91aaeb5c2279f1e5acd87788,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2ad7dd0ad6a111f19a56ed5b684f684d-20261102
X-User: weilixiang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <weilixiang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 910925608; Mon, 02 Nov 2026 17:38:32 +0800
From: Wei Lixiang <weilixiang@kylinos.cn>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	fuse-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: fuse: fix spelling of 'successfully'
Date: Mon,  2 Nov 2026 17:38:27 +0800
Message-Id: <20261102093827.6-1-weilixiang@kylinos.cn>
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

Fix two misspellings of 'successfully' in the FUSE dentry cache
documentation. No functional change.

Signed-off-by: Wei Lixiang <weilixiang@kylinos.cn>
---
 Documentation/filesystems/fuse/fuse-caches.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
index 0778dd3d357f..de1a452fdd31 100644
--- a/Documentation/filesystems/fuse/fuse-caches.rst
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -156,8 +156,8 @@ in several occasions:
 
 - When a new file system object is created (e.g. ``FUSE_CREATE``,
   ``FUSE_MKDIR``, etc).
-- When a lookup is sucessfully performed.
-- When a dentry is sucessfully revalidated (``->d_revalidate()``).
+- When a lookup is successfully performed.
+- When a dentry is successfully revalidated (``->d_revalidate()``).
 
 A dentry expiry time can be set to 0, indicating that it is stale. This means
 that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be
-- 
2.25.1

