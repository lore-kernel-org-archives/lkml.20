Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3AA3EEACF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532406; cv=none; b=FUDBXiOiSI7b1ILUmuYXwonUzqHNd9LqmUL6reB5sdU3iQFtDBI01F6xSonZwQX/e9fbyQTbmutMhUe/Z1vb1TDzXtXzLBgRBC6JYP6LJeaOGkEEkESRcKKhIlLfEXH7Zyd5iE5/QSQbL+3SseD2aBLViwNsC7hGq+HBXv72+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532406; c=relaxed/simple;
	bh=b5NKuB6SItvoxvfgKvZiKcCoXcf63jX7nGZfWfucc4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6DVQ0gQBKi2EmnnEMFNDnDJnAxonaOFPSX/ImnvcWy6RYr4WqkGds/dtZ8iFdZl4rf2bHAK5uARoxdBsPKP2+9SFuHfQ5/bvSRltAXNKRtPszD5t9+1x1kXkbaEWsFOalBl7hQ85h6yicNATnAw/uw9NtNcXCyqZpX+UMAje5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfMWjjOA; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfMWjjOA"
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3a0cb6b922eso772052a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532404; x=1791137204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sITXU/nnez7G10EQWApisgywwNOD7MhsfavkNvgebls=;
        b=CfMWjjOAXr7qJDLy4p+GU+CiN2W/u3ldlfXjh2NpNUiXPrJuqXEhhTBXvlfnt9PhfQ
         4lbr77F3iQVSDSqYDwJrVto/vDHvdz1kAfKPdHqnvp/nvAgJucJaZ4O1yZYNGcgs8sTh
         tTms1U0zk/NrpFWIFDPhKmcYAkjdT3GwCVzBnlRAKMd5/e/qe/sQ2Dg7gRoG0WKsHNRn
         VGRUcVXIt18uYzaQQfsFxR0mgd0bYFRY39hn8RmWeafhtgFeAjnbCIDFuaCemyI3q/+X
         eyCaJ2+6eupFbf1mm+9JXy45JSDAMaldV3GLuTnfpyGfA4UfYlaZZFCRwvQGCotnasZt
         QnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532404; x=1791137204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sITXU/nnez7G10EQWApisgywwNOD7MhsfavkNvgebls=;
        b=roAm6p/naF+V0dPvmaLjyqPO9lQrbRVDSRVPk4O+kfAaroUZZEqXOpU6lwxoX0b+4b
         /c+31Y/lszwIWsDrZAL2+I8txTZOb9B99YNzu4Ldwl0Gq21HM/BRPhspnou3/FAYB1O5
         RLf9H9WWBX+KrFFeNKH1QT0LtoWduk950XtpN+lEA0LqL/qFYeeBn7jex9Jd4ouzuC6t
         DSSjEVEj3ptYHEu5oPEqsxPFZ/HHlDOnIfDx8gel5EuNImonoiHPspdXBbFhLyI1zAeK
         tpYVn0ikPipr/dSf51PSuID51krmXrmSYNFScJqdfLA7cwVHA5O9LSr4SOyABueZElIf
         898w==
X-Forwarded-Encrypted: i=1; AKwUvBwsCu4Tkzr6fy2+bItG4B8sWYjR9jzPE9KLK35+9O7zMGM1MoJBhwk5B/jdKhKEancQv0Fjn8Ba4uwtC/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCDYCKsBiCoVHGcNSj6xRL1cgbSD7d+08FXe+eqMeMeKUpnhoA
	8g8Ayh/9WMGIDEkXt7k8FvSG+Gj5gHxXp90dGwz+v7ChHSYydHvgpBBv
X-Gm-Gg: AYBFou2FHWTaeLywd/GEtXRXcvgaAZeeDgCOhMvmCtr0a7M5MJp2vzk9Z/ZBFS8JJtc
	LkpibfswjlW0DAyyeFk5dafpwbSXcbi/w+S/h5es4taQriweMKXziIKWrbwr2hcxLpmaxlJudco
	ca0NAP2IJEiQHzN0yn8+BgZjzfBvW35WFcZEefTJ9JVo5JTuvBGX91K7g1h2qyv7+dRFIACPOAf
	gXCiEi5bYp9/uPmh0jus2T84bnIh8RAyJ+3/dZyt3wTrxZ8xy1AvCoOP5pHryiCgYQq5zNc4mig
	gk128xLwgds69PDExHJ0LqgTOsuzfpqWpejvf+23SWxl5JRD+ouMZVLIuvaYWXyANO2nM/85DI9
	wMydmlMu/JqWvuHtVLZMzORkCxllZfjdCsNTHcGzrocF2splTE8Vde61PIzBHoW/Rgh2fnEaIwg
	/5Vx8P8sgh7Z5M6eC3sYYH2CEanGnBpmqBtyuXxQUgC9KNnA==
X-Received: by 2002:a17:90b:254e:b0:39e:4c80:f682 with SMTP id 98e67ed59e1d1-3a098bb640bmr9080747a91.33.1790532403996;
        Sun, 27 Sep 2026 11:06:43 -0700 (PDT)
Received: from huawei-w510 ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm5225385a91.3.2026.09.27.11.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:06:42 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christian Brauner <brauner@kernel.org>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhenyan Wang <maximwang110@gmail.com>
Subject: [PATCH 2/2] fs/ntfs3: keep PrintName not changed when creating symlink
Date: Sun, 27 Sep 2026 18:03:59 +0000
Message-ID: <20260927180359.3867508-3-maximwang110@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927180359.3867508-1-maximwang110@gmail.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When creating a symlink, ntfs3 converts all the '/' to '\' in both
PrintName and SubstituteName.

When reading this symlink, ntfs3 converts all the '\' to '/'. So if you
create a symlink to 'a\b', the result of readlink would be 'a/b'.

Fix this by converting SubstituteName only because SubstituteName is
used by NT kernel to read symlink while PrintName isn't; PrintName is
left unchanged to ensure consistency.

Signed-off-by: Zhenyan Wang <maximwang110@gmail.com>
---
 fs/ntfs3/inode.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 6717563..000ac34 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1091,6 +1091,7 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	int i, err;
 	struct REPARSE_DATA_BUFFER *rp;
 	__le16 *rp_name;
+	__le16 *sub_name;
 	typeof(rp->SymbolicLinkReparseBuffer) *rs;
 	bool is_absolute;
 
@@ -1118,12 +1119,6 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 		goto out;
 	}
 
-	/* Translate Linux '/' into Windows '\'. */
-	for (i = 0; i < err; i++) {
-		if (rp_name[i] == cpu_to_le16('/'))
-			rp_name[i] = cpu_to_le16('\\');
-	}
-
 	rp->ReparseTag = IO_REPARSE_TAG_SYMLINK;
 	rp->ReparseDataLength =
 		cpu_to_le16(*nsize - offsetof(struct REPARSE_DATA_BUFFER,
@@ -1142,9 +1137,16 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	 */
 	rs->Flags = cpu_to_le32(is_absolute ? 0 : SYMLINK_FLAG_RELATIVE);
 
-	memmove(rp_name + err + (is_absolute ? 4 : 0), rp_name,
+	sub_name = rp_name + err + (is_absolute ? 4 : 0);
+	memmove(sub_name, rp_name,
 		sizeof(short) * err);
 
+	/* Translate Linux '/' into Windows '\'. */
+	for (i = 0; i < err; i++) {
+		if (sub_name[i] == cpu_to_le16('/'))
+			sub_name[i] = cpu_to_le16('\\');
+	}
+
 	if (is_absolute) {
 		/* Decorate SubstituteName. */
 		rp_name += err;
@@ -2031,12 +2033,6 @@ static noinline int ntfs_readlink_hlp(const struct dentry *link_de,
 	if (err < 0)
 		goto out;
 
-	/* Translate Windows '\' into Linux '/'. */
-	for (i = 0; i < err; i++) {
-		if (buffer[i] == '\\')
-			buffer[i] = '/';
-	}
-
 	/* Always set last zero. */
 	buffer[err] = 0;
 
-- 
2.53.0

