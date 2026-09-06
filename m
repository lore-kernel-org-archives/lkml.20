Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544825474E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706619; cv=none; b=md9+KO37bziXQbC+GKu7vTueAIMgBzSwZ/MMwCvfeUZdliyHCsLXwhedi8eGHUn0H6KWCg2hgGnGApxwdZZ5dGqlWmIjWNQpX1cw+PunlxGw4e7lrG5+q0oRZYVcwKDRyH1K5+GhFodgRHFhH2Ja5293GKNA8nAAI8bWMQRQTz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706619; c=relaxed/simple;
	bh=VOdJAvm3TkgarLn1XzB1RN4MFQk63VXd09BrpAxzkvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DIN687dcD3AY0jAN/Cd9Fzzzl63y46YBeH07Ag4X2Fo3uv13u2Oh/3yUxvCWhroVn5hX79dqJAHNisAmyfZ1/eVT/7VJItEpbX5DfDOETxOFIBZwDm9rzY2tVkw6UQC6kmSBEFsxYEd3UYGhkNDem5g3Q6gRq2yrjIR/+P1b0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3E3CVgs; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3E3CVgs"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db3305f94fso13867145ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788706618; x=1789311418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWy32RDFiEUCikk0m6EE/IPIz7mmLrlqMEWJVUxd4S8=;
        b=a3E3CVgsyIcXCkWJOCjP/314K1vO0b/vrd7R8x95y8kKey379qlC/49IFBmXzphiw9
         //+R20rLdszL3IWA2vEEePWuIS+JUh/MIRg0pmackJi+gWVC/4zdi/YdMUMTTxOgVbDo
         f5vKuZl/R4wX9Cj+JXLRYbjnPKyCYqw04AjV2Xj/gjlcp/19y/0LtzK7Z+HMDJnbD/C9
         EkhRUAapTHFMM5ue1hz6w/2Rw4W4xpU+6Qdj8FToWfHCu2sf0HEpckj3maAhljwPm6Ym
         MQlzIn8brLzCQhecoByd/uuZfv53eTE5WEdq2leZCf7b9RwPJeAwVtfEsLYJplZpp6UT
         w7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788706618; x=1789311418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWy32RDFiEUCikk0m6EE/IPIz7mmLrlqMEWJVUxd4S8=;
        b=ooYkxZZIENq2JEgBMp+J3rW/OvEMo0jacj4h8vyGHLjt1R0HTTUyvTY/2bkleoPxQe
         BzSBBasU2JhbFQmXFAJTzVQXn0U4ttcMhMFjzEqEnZQ52YJD+/fKmPkWDFU3qd4gElqY
         x3BLvh+GhCiccBn+0ioYW0ML2I26OYSe+6NzLhZZxiICgAtptXyGFycDg54uv2Sxj7f5
         4vbYEa8Vx+ZngX5orsQyeKAol3GmhAkMkcqaT4qX+7ZdpoGvw3ihL+nOPXKAefBlf8+o
         aOeuojwrph3vMcm8SnFQsiddEq9GYoZ6fdtiyHTcCmvUWS+qm3K567euQmI9VOhnlQLq
         vckg==
X-Forwarded-Encrypted: i=1; AKwUvBx59yjWxPA+c6hJ28zwgrh70k2g295XXSqteoJRAWWmaJ9f7s2fBXzqqsCEdwJ51ZXQhbRdxDYpKWQgRWY=@vger.kernel.org
X-Gm-Message-State: AFuF++lTY8l5/i3BX9PyVNW5NZ21DY4PRZVCTbgPLm2KAQU0YjNEttSe
	ztZPyCTqlN6hU3VcP3SwcEyDtmS27lhZ5vQQKCvoAamaX+Xz4iqkTtzZm6dSwdiJc3s=
X-Gm-Gg: AYBFou3KLru0wpPG2X91X826LupAj9PE5s5rEsDIG4kkOFLGAVPEshiQTJAF6LlpPKB
	Srj8dBqcs/IgzfztyDIX+2rBZFf24kmKOQZU7KueL1ZqlvXM3mbYTHJ/fJfRtCEVX+4TwDJd6sX
	uidw+izU175XnjuQsfb8/fO1865elr+GKQfsWt3bi3q8gKRAVo+BeTQJoX8EnnelRDdDzbB7nHz
	BZnDaLERuwtI8ffL8MAMHsXSKJuOqtZ0qv5qfmEpUvxlt/bh2lbadxlp7QeRs2KxYKG/ZC/Y1qB
	M9FrlnNz9caXHVKyuPdaH2grHO56CdYwfSx55HOA87qSzSZ6dpjR81IjagaImjire858QoPT/l5
	VTON8hJIvrbAPW9SDkAE2hCXZwMY0cVRbIrO2TcoFLbCyZdf2K+gilzBvnOhecEldEdidPVNbR2
	YxZG4PTNbhyVnbX2A20lN95ZVoY66gkO0uZjnrx+x/1vjJqoruOtdKNluZPuEI18b8keLNKokyr
	/W+2g40eChya+drGp97xlpVAErK2vpTE6bwGIdsFDl4RCmgVvGSB4G/2Z8sHuk99ZqNAbwbr+s=
X-Received: by 2002:a17:902:f70f:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2db1225b297mr265306895ad.0.1788706617566;
        Sun, 06 Sep 2026 07:56:57 -0700 (PDT)
Received: from codespaces-2362ac.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([207.46.224.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0b2sm32845425ad.28.2026.09.06.07.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:56:57 -0700 (PDT)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>
Subject: [PATCH] f2fs: skip node_change lock for inline data writes
Date: Sun,  6 Sep 2026 14:56:11 +0000
Message-ID: <20260906145614.2749-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node_change lock serializes block reservation in the PRE_AIO path
against checkpoint preparation, since block reservation can create
dirty node pages and update checkpoint accounting.

However, writes that remain within the inline data area return before
the block reservation path. Thus, they do not call
inc_valid_block_count(), change a node mapping from NULL_ADDR to
NEW_ADDR, or create a dirty node page as a result of block reservation.
They also do not update total_valid_block_count or
alloc_valid_block_count.

The inline path only copies the existing inline data to the data folio,
sets FI_DATA_EXIST, and marks the inode folio for deferred inline data
flushing. FI_DATA_EXIST can dirty inode metadata, but it does not
reserve a block or update the node mapping and checkpoint accounting
that node_change is intended to serialize.

Skip f2fs_map_lock() for writes that fit within MAX_INLINE_DATA. Keep
the existing locking for inline conversion, which can update filesystem
metadata and requires checkpoint serialization.

Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
 fs/f2fs/data.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 21f396ebe22c..f2fb5ef3cb7a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3690,10 +3690,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
 	if (f2fs_has_inline_data(inode)) {
-		if (pos + len > MAX_INLINE_DATA(inode))
+		if (pos + len > MAX_INLINE_DATA(inode)) {
 			flag = F2FS_GET_BLOCK_DEFAULT;
-		f2fs_map_lock(sbi, &lc, flag);
-		locked = true;
+			f2fs_map_lock(sbi, &lc, flag);
+			locked = true;
+		}
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
 		f2fs_map_lock(sbi, &lc, flag);
 		locked = true;
-- 
2.53.0

