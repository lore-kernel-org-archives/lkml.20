Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB73446CA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789825483; cv=none; b=DCv/w93YkSil7w5cV7D7iFA3G9fKW5MERPq7V0mVEYCVzweV4FjFeGMWdjFa/JPlV+RcG2B9Ybess4WsfiOGG9R1L+cAuHHtx8UhYWdSVNJM7vo7hKbLWclXUxc7aS143C8n860SbMhz3OhiTV5TOqPY0LYhaOGyighXYvLEsF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789825483; c=relaxed/simple;
	bh=oD8a4Oh23fwRqYM8icbyCfjZPiFtqIJMWmGbfEJq+j4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yhrt4QdWtqA44fFKTzWMVe8bIKfjMLG1tb/WyZgak7u7wvEzg7KAVgZwsHWnSUI3TrE6CEpxCoDnaWXNMiCPKCucPPbpD9prjp4/XZ5VJlh8p4kodAksIWtpiEBetOk9ZV7d0b8lsuH4jcJN88o13KZwBZxXUoJP5XUMISbgjC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=golasch18@web.de header.b=VbYwgVuw; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=golasch18@web.de header.b="VbYwgVuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1789825472; x=1790430272; i=golasch18@web.de;
	bh=QtrZgwhnFhiyTC+VLEr1PfW58DpfOSTZUn5dJfOEuhk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VbYwgVuwBBM/yAh8rsHM5h3RNSz280ihWqDGEC+uCj+654Z4HkkQS9dZ/yPGx/VA
	 zZNUpSmhpAiAjYf3bcVIf5ElYvjWuYebt+2DJpHpIt2ijGjGB1iAhC5Uwy99IhVm2
	 i9VJl8aK+9WzU0lEE1S6+vyffJ2KYZk+STNsPq/8w8wHvBFsaXyeaMTgtjIjAvJup
	 epM/Fkij0p8C2DRQ+1+5nSC3mk7yZJjc4GjzQMAY3j1EESxdh5rSYvOMw2Ag77xos
	 7aSyZjPbzx488ZHW/6Dj132oS1YJC32CvOeYZhbo1Z4gAuv79btT9kGIfJjPTNF7Z
	 e/pmCZ5SMK3H3W3Ctw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2Pda-1x45cM0S6g-00FGYL; Sat, 19
 Sep 2026 15:44:32 +0200
From: golasch18@web.de
To: Jan Kara <jack@suse.com>
Cc: linux-kernel@vger.kernel.org,
	Lukas Blesser <golasch18@web.de>,
	syzbot+de2fef01040748da6822@syzkaller.appspotmail.com
Subject: [PATCH] udf: fix WARN_ON_ONCE in udf_map_block on concurrent expand failure
Date: Sat, 19 Sep 2026 15:44:31 +0200
Message-ID: <20260919134431.83785-1-golasch18@web.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YIQuGzTwhHDXgBLz3BM//SB6iCVkHLPiZgokTPCXnXdNJaQOqWs
 Y/AOuVSh+UrR/yaALSf7tPKPHR3tXmfuG2FTEtRw8eWbcr6aI9527ZFVD4nNY16U0wp6QYK
 QkkEk/LeBbpW3iIvCVcgMHOQ4y72pFgQfeOw01A+cfL/yWH5ibo7c/Yq7tJHLwPNQgTSI7b
 2In5/LZfuG/26gVP5RBHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4758inf56xk=;1wuo882YapNKr7ThqDYVNJFK0Qd
 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
 Qvgo9KdetKLLMC3t6NGDom

From: Lukas Blesser <golasch18@web.de>

udf_direct_IO() falls back to buffered I/O for in-ICB files, but it
checks i_alloc_type without holding i_data_sem. If a concurrent write
fails to expand the file, udf_expand_file_adinicb() restores inline
allocation, so udf_map_block() can observe ICBTAG_FLAG_AD_IN_ICB after
the caller checked and hit the WARN_ON_ONCE() for a transient state.

Move the allocation-type check under the down_read() udf_map_block()
already takes on the lookup path and return -EFSCORRUPTED gracefully
instead of warning.

Reported-by: syzbot+de2fef01040748da6822@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3Dde2fef01040748da6822
Signed-off-by: Lukas Blesser <golasch18@web.de>
=2D--
 fs/udf/inode.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index e45e546a7..cea8d5c4d 100644
=2D-- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -352,9 +352,6 @@ static int udf_map_block(struct inode *inode, struct u=
df_map_rq *map)
 	int ret;
 	struct udf_inode_info *iinfo =3D UDF_I(inode);
=20
-	if (WARN_ON_ONCE(iinfo->i_alloc_type =3D=3D ICBTAG_FLAG_AD_IN_ICB))
-		return -EFSCORRUPTED;
-
 	map->oflags =3D 0;
 	if (!(map->iflags & UDF_MAP_CREATE)) {
 		struct kernel_lb_addr eloc;
@@ -364,6 +361,18 @@ static int udf_map_block(struct inode *inode, struct =
udf_map_rq *map)
 		int8_t etype;
=20
 		down_read(&iinfo->i_data_sem);
+		/*
+		 * The allocation type may have changed back to in-ICB
+		 * after a caller checked it without holding i_data_sem:
+		 * e.g. a concurrent expand failure restores inline
+		 * allocation in udf_expand_file_adinicb(). Recheck here
+		 * under i_data_sem and fail gracefully instead of
+		 * warning about a transient state.
+		 */
+		if (iinfo->i_alloc_type =3D=3D ICBTAG_FLAG_AD_IN_ICB) {
+			ret =3D -EFSCORRUPTED;
+			goto out_read;
+		}
 		ret =3D inode_bmap(inode, map->lblk, &epos, &eloc, &elen, &offset,
 				 &etype);
 		if (ret < 0)
=2D-=20
2.55.0

