Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969171;
	b=XZvvbYcK3y0pOL5+ehrPpFdUZ0ZH8+/ReNeB2hMTEC6/UQAXpevmjY0rG4SIcW7LkGCW
	 sCH126BpPQx+MNNJnjhzx8FliqqtmGT0m3oEnfXlCB+h76SDcLw30J8dSoWBB60moCQaX
	 q5lIu7laI36Ocre9xwAfB5eQKpD2O+CmyD+9uOWWJQhGIdfZCA0asx3RhthIwhDyVYnp1
	 s7ADODqQCd8NrOhX+7Pc5+EU9ttbx6W35jk12l4H++vIs0o86PibvMNe9/M1hynQdba+A
	 /jxPpj31KKPWMFQc8oUcXRCFEXjk0PSjcedfiZMitk3cZk2JJggQGr75ypJfi/450NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JNftfiQYVNrVOWb9CroEjxPZDzjxD7afgRSnyOU7AVE=;
	b=gnxX37LI5OH5toxvzzaVP/B9U7Aj4zM8PE6wJ1/9oCy9N4HjHfJhYuWZ9rqM1NEu4rj1
	 qn3ngUOKKiiUTJKElOqOwJumkMCZ7b1Id6c7dB6ndAtURtT8sEnPqQg1DWolHuoXmaa00
	 3WTz9ocUwArYwZwHUur4AAjjaEvWit4SWWcGWFjkJoEZjoeVF7jIBIw8IQgCo0kaeY3+1
	 1wuVUr5A4IRo/XnlyyHJw8tdRxkWMgGKgyassXG+9VknlkCyuaes+KR70fdSVSu+y3k2R
	 Y0a7SmFsaLOWLdU+6YXPEbfE7b4q9nGXNTARPWpNloJpGL1niYM+TO9E6qyaUs57I9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoMcPaAb;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22F0606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C22F0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoMcPaAb
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37000e7234bso1207248eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969170; x=1794573970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNftfiQYVNrVOWb9CroEjxPZDzjxD7afgRSnyOU7AVE=;
        b=KoMcPaAbexCKQpS7dN1txsf8/njskB012eFKiEQpGj3gqecgq5PAIUgUmDia8cSqL8
         C44cb4NnJTdZiSTKt86qJpLxbqUYOV2w792sEsC387W9Ul6vqmayQFme0IZBoDxko10q
         JYhZgKSPsTDKKGJAVix5JGhGgWEjJgx+w3EcwMp6kwk1P2tLWEDOQiH1R+6apRrPM+IA
         DQs4tGERGDkTrBWnofrRQqFNOfma+zcPpmeVNQjJ0uSXNzIhMWw3uvV/Ag+s4rRg6Zrl
         8lTllhb2tSd17+vt4BT/bVvwdYNUkQSgkx8wiJDkB68wS0xTz8fqAmu0Cd0CgGIrL0Ap
         f8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969170; x=1794573970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNftfiQYVNrVOWb9CroEjxPZDzjxD7afgRSnyOU7AVE=;
        b=e4Acj84x4xU8rFOrikfr7zK2ewyNH2nEmGGIID5/P0gBsCV05Zw5DWd/2SRXxCk3q/
         zh2wp8EwYhN7wkpGigUNUIbAjXzCYl5YTrSEOyLDynuj7j/ZfjhaZvg1eyAHiUVr/klu
         qIRoTpipvwp2Dne+oX7QzeT/BQFrhwxzFfMcO8Z//hPYw3ZoqufRRcdd2COC0iL+hFs2
         mQ/2kmvFDHaWowiB35+haQweYymXzGjjPV7myn6tYW8/8MfwjtjUzS2F/tbJ5B1IBBCY
         KP6TgCipC8EkHFdAcP55NP+SX2fRCN32/5jsH8fP2klw24lOCut37a6XprL4pAa8Xdm7
         9MBQ==
X-Forwarded-Encrypted: i=1; AL+hErHVwnSQBsvATywFqd/jF7jx6lUpfoZVMchl9MjAvjg8a0f3iQoxXd5gD5KznFHs24pDSpF4g1C30wyLO08=@vger.kernel.org
X-Gm-Message-State: APuU4Z82dNTx8r6cttlRi4xofeJw2PrhE1biRobdVT4EkdzF19uXdXX0
	LCk0CeUkmcozEMmK+S7Gr9hyF22CMJyXP4MXVw6G1ZDi6DoTAjuy0eotEtP+zK/wZSEZaw==
X-Gm-Gg: AYBFou36/51DozX4WaQdXL6EupsPo37tTJ6fMv0JXJhd3syvciPI4aDmNqSW/Hatljc
	xn77ChhtModVviwmUhzCrhfzLBMlc8IvF/60uA7ZPML+s33hoyCPnYmTwdWmMArrue+A64yKTKn
	weYK7icMRuQm/ebmNnDyqOv4fj4jeLF3fhVPchPL5QPTlGMla0GfFW21tEWBAMKGv5gIs7ol1Oz
	WFy6shFtZDwCvy5x1rLi87uuIymZQCPaaXhqWkAnALBC5wXT07MGfUvi95wG6C49c3oi3jWRSup
	+i1H4Ur8bX5DJs82rTd/83rJr3Ujq1tehv1DaY5vv3B5X33yHylsb/hIMFI8vgFLynk9Mru7wg9
	9BU3ot9ktcY21nbaOrZc1qPZPUdkQXMn3XXMniVur8T5eEey7RcrvAAPkujoeLXlvMVHg0oWL0r
	vMOCe6qlauYGgr36dACcf2t0c+XLJsMZfHfEiEinFd21fawTs2USFb6Cs0Levqoi+a9y0MZnfvz
	myYZFvbAEcbdkSql02s9j3A7I4C92RDSIyEGrBiYVFfiJ1IECQi4/OHTZR6JoGWI6LnlUIHWUqR
	Qkf1Px1hqSCF9GRJkmEL42cUj6BFWrJ1ced8oll4NJ+CcsgRbjhdFHtj+u0tF7DCew==
X-Received: by 2002:a05:7300:10c:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36f771025d2mr3480312eec.36.1793969169592;
        Fri, 06 Nov 2026 04:46:09 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm6802331eec.1.2026.11.06.04.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:46:09 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] ntfs: open the index allocation before reading or writing an index block
Date: Fri,  6 Nov 2026 18:15:52 +0530
Message-ID: <20261106124553.2617026-3-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106124553.2617026-1-wahidzk0091@gmail.com>
References: <20261106124553.2617026-1-wahidzk0091@gmail.com>
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

ntfs_ib_write() and ntfs_ib_read() use icx->ia_ni without checking it.
ntfs_ir_reparent() only opens the index allocation through
ntfs_ia_add() when the root is a small index. For a root that is already
marked as a large index it calls ntfs_ib_write() directly.

The lookup does not open the index allocation either when it ends in the
root. If the last entry of the root has no child node, ia_ni is still
NULL when the root has to be moved into an index block, and the write
dereferences it:

  Oops: general protection fault, KASAN: null-ptr-deref in range
        [0x0000000000000128-0x000000000000012f]
  RIP: 0010:ntfs_inode_attr_pwrite+0x52/0x1600
   ntfs_ir_make_space
   ntfs_ie_add
   ntfs_index_add_filename
   __ntfs_link
   ntfs_link
   vfs_link

A single byte of an image from mkntfs is enough. In a directory that has
one empty index block, clear INDEX_ENTRY_NODE (flags 3 -> 2) of the last
entry of the $INDEX_ROOT and link() a file into the directory.

Commit 9365c4a1357e ("ntfs: fix NULL dereference on index allocation open failure")
covers the case where ntfs_ia_open() fails in the lookup. Here it was
never tried. Open the index allocation on demand in both
helpers and fail with -EIO if that does not work.

ntfs_ia_open() also succeeds for a directory that has no
$INDEX_ALLOCATION attribute. The inode it returns is then an empty resident
stub that does not describe an index allocation, so reject that case too.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/index.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 322cb371d..74716f916 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -99,12 +99,30 @@ static s64 ntfs_ib_pos_to_vcn(struct ntfs_index_context *icx, s64 pos)
 	return pos >> icx->vcn_size_bits;
 }
 
+/* Open the index allocation inode if no earlier step of the operation did. */
+static int ntfs_icx_ia_ensure(struct ntfs_index_context *icx)
+{
+	if (!icx->ia_ni) {
+		icx->ia_ni = ntfs_ia_open(icx, icx->idx_ni);
+		if (!icx->ia_ni)
+			return -EIO;
+	}
+	/* Without $INDEX_ALLOCATION the index inode is an empty resident stub. */
+	if (!NInoNonResident(icx->ia_ni))
+		return -EIO;
+	return 0;
+}
+
 static int ntfs_ib_write(struct ntfs_index_context *icx, struct index_block *ib)
 {
 	s64 ret, vcn = le64_to_cpu(ib->index_block_vcn);
 
 	ntfs_debug("vcn: %lld\n", vcn);
 
+	ret = ntfs_icx_ia_ensure(icx);
+	if (ret)
+		return ret;
+
 	ret = pre_write_mst_fixup((struct ntfs_record *)ib, icx->block_size);
 	if (ret)
 		return -EIO;
@@ -805,6 +823,10 @@ static int ntfs_ib_read(struct ntfs_index_context *icx, s64 vcn, struct index_bl
 
 	ntfs_debug("vcn: %lld\n", vcn);
 
+	ret = ntfs_icx_ia_ensure(icx);
+	if (ret)
+		return ret;
+
 	pos = ntfs_ib_vcn_to_pos(icx, vcn);
 
 	ret = ntfs_inode_attr_pread(VFS_I(icx->ia_ni), pos, icx->block_size, (u8 *)dst);
-- 
2.53.0

