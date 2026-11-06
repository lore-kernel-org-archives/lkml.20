Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969168;
	b=mVQVYxq9HBDJHFbkgu4iMMh6pAfbCUfrxRXltJbMCLJ/XbxiuFOvaiKlkOXFuFRENGXL
	 /akByME/XUo/TAmGi2J75RjS058ZuL+765YMcNIc7fgm9yUR4LZ9FMZP1XpCzumggKQQ/
	 eIUTdRACrvIVwH/9dF2faXvPQYXaflNXacVwngsSLwm9E55MNKhnUBJ/gtTpw8q9ULueY
	 KsrtRbeOrL2Dpw1Pb54KELz2UJG0Tnjeuiyu8Hu7MtfCQwvN3L9ByDxdsGIms/49D6IX7
	 hqt3Sf2lrymn2LWUjaY06M8mhX3jFTlijn7zs3/ofc1i3jryztIr5JbW+ZCbPeG7MzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
	b=qDFZ2uDAw4uXiQydqJ6cT2gT4veUmrdzt2tONj3MrRtZEO+MoTcWd/3BvfT5xXH8R1cm
	 1MpsmO4/yUlKXDBfGLuZODi4fPrA0pfFKRMBbFp6IyvFmpE5ZN+JxsCflb+L5PpShHqUB
	 /1fFKcvFUcQR5t3Eap2QyQyJcnhyELI5PvWhyR0+rjh5TZNW0sNlHFhWnHqxnoyMj0Y4q
	 P5j2wifZ5FYeznC+ZcACHZyHkoXBDN7odqfG5EVfLIiQv1bFFHsExCTNF3T0kmeC1eK5d
	 45bhnJS/2T4uv+W9XD7WoPKs2hvfb/GIEh6h7s21wTt7DVWQjFYVnSN6w4/rL2HdDIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKMrIy2t;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4FE606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4FE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKMrIy2t
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso173862eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969167; x=1794573967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
        b=ZKMrIy2tc7o01+01zW+B6xXvNtwD1DjIQVLY++gLeXaXPOpnhp7nOsCBvxXiWojgv+
         3HJmPEJpyHZARyLx+czkHayTQEvNs6rWHsm5SnG2M+t+2v0HEhp73a+71EOUB9EGSuR6
         NmffL8RA+Wy9xrdBvjdecpWgYBSsD/ahJ79dsS3a35olzO5mvoPjx5VThkn4IU3x17hQ
         1Xl0r9INRI6M7qYJ9UFfR5jyGgggFADXIHOnpRCuU0T29LGF3M7hq/L2+wguPA0HvqIt
         hVemwfnh9vy+XRjDaHkj6vXjSQpRC1W+eaSCmDkU3dcwf2Q+iq4/c0U75rPQQye7Yf52
         +Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969167; x=1794573967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
        b=ozY4Y9jP++0bejURDdcBPn6grdSAosHIXdhu50yiEOUrRdhgr/2zSs3YB4zP3sZXGM
         2ch87l5REtbhbK6rYkaCsevlElLVo1HMsphfJaXIj7AjtIf6Pex7KFSWi5g+221+AtsB
         0ELlQOTVTdbU76xeLHU7FGPq9cOjX+yVkL7E+dg8FjMF4xLrwYH2TqE4sx9eB6LhMnYy
         EoG4O7NRp1KI3CaxmvMjhWWymEqm83Xlufm34jTzXilUJRlkoRXESRPR5CVNfw3NEdC6
         mfO39agLwRXalFwEOarU50UU7GfsIuVzSTx+qP076XuEdaIdYUYDY1fSNLitkKXIfQu5
         oTiA==
X-Forwarded-Encrypted: i=1; AL+hErEJ5moz8Jv4Aaqaf1M8LGVR2h7EGV/utIMod3Ru7F9KmjjYbPsmXozSZjZHdULfy8+lAlp3Ct29TZdnoXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R8AVKMTzTUTBwOzBpQsoUke8TamQ6fM35gFBbdOs9iLvgoMPM
	TUhrcKD5iqyesm6f3TUH49dIJi2+6CbQzcDaLsHFtsx1Fm/FRwSKBhxp
X-Gm-Gg: AYBFou0lIB1ysPRFkDrFG1zwvwq/XhwB84cm14sfvh1HLiWlddP1Xqc+Ik1yOc4ebSO
	tNapVXUUU2x589BCW6WQKuU6lUcDTUijgQc6a1oDAPEFwIGAxTqRdcUF7X/CcpdTve1x8kFXR6R
	SGl2qKeS33CNL1F64Fs8zmBYjQGTEk59um/AJFNewKgqbvQBNQajdAKaAXFgIwOOhb0T3uL/Orl
	OX5BNm7BwdLGiXLBB5Q4q0yWjqtFRYdrGEJgizexob6UcBuAIXf0YI6QV3pG0NjjPAAmb1d2QAK
	zQrzMw+nsmWeoMt2eu5v4nv9jGmjou2ag9X2FHbLM9QdvYWfeDyj3TGGmj8IKZ1SUchIysG1H94
	WyWflZ2lWLe0QxJA6kvIGFPCbF8Q28j2qW1jnf4HTSXHo/W7R/iR9ZGGrjEHpqLbDlD82wY8nDE
	9RWfdBE1zs2yJ401k1y5aL91+upNJOjZ35SMnQCMw40n39NkDmyC15g595qTwPWCC9h2BMu6dVn
	/p3V0qwuzmU2ujshCWU6YeJWvrlPc1qmokYHBCw0Ib77yuhR+eWh7m11rFdzMXCkbiJCPfDPQUg
	/JYH8MAeVbPprl/5npS3D+R66jeHBFwM2aSa6BNm103ToZ75eM3X/rW4tqYiwaeruw==
X-Received: by 2002:a05:7301:9a81:b0:369:38e3:5363 with SMTP id 5a478bee46e88-36f7494cfb5mr3376030eec.7.1793969166328;
        Fri, 06 Nov 2026 04:46:06 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651eccdsm6802331eec.1.2026.11.06.04.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:46:05 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] ntfs: do not read an index block outside $INDEX_ALLOCATION
Date: Fri,  6 Nov 2026 18:15:51 +0530
Message-ID: <20261106124553.2617026-2-wahidzk0091@gmail.com>
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

A directory whose $INDEX_ROOT has a child node but whose
$INDEX_ALLOCATION is missing or damaged gets an empty index inode from
ntfs_read_locked_index_inode(): size 0 and not non-resident.
ntfs_lookup_inode_by_name() still follows the child node and reads a
folio from that inode while it holds the mft record lock of the
directory.

Since the resident iomap read started to take base_ni->mrec_lock, that
read waits for a lock the caller already holds:

  INFO: task init:1 is blocked on a mutex likely owned by task init:1.
   __mutex_lock
   __ntfs_read_iomap_begin
   ntfs_read_iomap_next
   iomap_read_folio
   ntfs_read_folio
   ntfs_lookup_inode_by_name
   ntfs_lookup

The task never returns, and neither does anything else that needs the
directory's mft record.

It takes one corrupted byte on an image from mkntfs: change the first
byte of the type of the $INDEX_ALLOCATION attribute header of a
directory with index blocks from 0xa0 to 0x00. The first lookup in that
directory hangs.

Check that the index inode is non-resident and that the vcn lies inside
it before every index block read, and fail with -EIO otherwise. This
also rejects a negative vcn, which was only checked on later descents.

Fixes: d9e00c457d4a ("ntfs: serialize resident iomap reads with mrec_lock")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/dir.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index fce10baa2..9fb5bb3d3 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -308,6 +308,20 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 
 	ia_mapping = ia_vi->i_mapping;
 descend_into_child_node:
+	/*
+	 * The child node has to be inside $INDEX_ALLOCATION. A directory that
+	 * lacks the attribute gets an empty index inode that is not
+	 * non-resident, and reading a folio from it locks the mft record that
+	 * is already locked here.
+	 */
+	if (!NInoNonResident(NTFS_I(ia_vi)) || vcn < 0 ||
+	    (u64)vcn >= (u64)i_size_read(ia_vi) >> dir_ni->itype.index.vcn_size_bits) {
+		ntfs_error(sb,
+			"Child node vcn %lld is outside $INDEX_ALLOCATION in directory inode 0x%llx.",
+			vcn, dir_ni->mft_no);
+		err = -EIO;
+		goto err_out;
+	}
 	/*
 	 * Convert vcn to index into the index allocation attribute in units
 	 * of PAGE_SIZE and map the page cache page, reading it from
-- 
2.53.0

