Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC64E1C73
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672705; cv=none; b=OTds0iD6MR6b+lYCeaQBvoaXTyaSOL2EqybfKksLZgvUDy3Hyp2Vvpb4JavRkIRuDaypr4wo/NfsQnG+m+0URSVW3/3UJlIjQBIUpd4uqLH9bE9sujPK6OiX44ajVSMKRMZV7sBZvnBjNAle3yZq555FDpCQU4M2+bJ9/u2th24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672705; c=relaxed/simple;
	bh=FiEp6acjtn9ALhNmIcpqBLTXpX9E8ix+zetdX0cVGG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jK9LnP2cdYMtqT9WoqEX5MUWazbDi3eZ0Bj2Wh+MunGHgzBCVciUgez3lEYd4Gi3zQdgCNAUfYK6M7CsdqmkO33LqMWMnQ1dI2/VUo9T8rorJHLtGN/anj4pA6vcwu1xCDbIKfuTIQBD1xtxN2wgGWs8r5JfUQaKrbGrFNqmQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/NytqnV; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/NytqnV"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so1875534b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672699; x=1791277499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csdBaSA1RBXlbCQfI6nEWA/gudC+45f46pCBbw4ADqA=;
        b=H/NytqnV37v1pXbwL1uqu2CkGRvQS3Xa8EzojC3Q3hOnai5koet7Xay+rfOH7FLvDa
         sfpqIbPYErDu8b5bkIqIpBhfUzCHeNlMeWiVyfx741p9hwUKox3zF5RtXFQrrYBE1o/W
         lQlsXWCNgfN42ZKVhoN2EhOkQ2w6MR1z9izR85u8HO7zSFrNwzr6QBQbjjCgUZxjQw2M
         zOuS83xehUkE8i0z2a76041w0tt789G7RLHZCxIUhN7w1f8TmObCdmtYe3F4D5jvNVmO
         J5rp9I3CITVH+wPgGsx45n7IYdyIxxcafwp/OhWo5HSvujhlg8c/5KNe1INuyLhez/So
         utGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672699; x=1791277499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csdBaSA1RBXlbCQfI6nEWA/gudC+45f46pCBbw4ADqA=;
        b=hdja77Z1GpMJXgtFB8NPz5W3IaEyyL5rsqinau0KnHtY2vOWXkDm594vLCddZd8H39
         DkbOKfe3XX8lfQLYS54+ZX4GpIzaC6QX2RgOwxoy5x0XvQldOBLGYFsIvyx/7ZR6G7tq
         rvSjgx/CKT848Hv8AJG9WeiipXQ8Nww0K7d4FrNCj9/yLXk6ki/7aqDUVA7VMLLpKkkp
         RyNE2GFx2ajB3jAedfps/zVwq0Q6MzK+jP66aOCd7EzroJJLySdk45pOitRe1EVe3m/5
         KQaVxF9s7yvJ6PpHBfiWW2o6zRkeAs0CocwA5FZ7ZonDDny85+5EQT+YeGcCNDExQEJR
         QKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYbRZgQlcRagkzMJ/Gk+MlyHT/nGaG2qS5L7QJ/52FuyCBvorFd3dRRVxnCRPIogdoZjmc0Z/J4lXOg3c=@vger.kernel.org
X-Gm-Message-State: AFuF++lFr29XvGUAWPo9kfQihu1FCltC0tRn8+s3TqbYQ9ktBbzIDRzy
	HlbXMWXLUrgohISUWj40/e2lm5U2lWlT5Alk9esPbeCA0vLu137flu4l
X-Gm-Gg: AYBFou1Ja6KUWnbDuydUP90A7Yl6lJN4LYl3kOoKFnG4SAyfj9tGjWje8dMh95Pa4qI
	3rhdYnGEpbAEAIMNA/seOkITrz/zJqjNKnJq3PrIwd74w7VSUbX+vOD6HbrFvVxsxMFE3uPeU8b
	/VIztsuFrlYkpzLyVDcJ+Wdj0Wdq5bTDcptjGUzS0klijLZxzCFiuWFfHQTG+vHmnS0l4VWN9mh
	21agqldaGLMIxc52mDEp95U8hDUzyptIB1T1iQYA7/ubrptYZUgrGbqojyoRmXB2KwP3i/zw+ZE
	l1PHdwqJuYpKU0WzLCzCY/D8UidS7cSkdE6XhML1577JiiEkpMe+Ysi4LygoH80dLtyMO3Bu/Ye
	H2LuE9y/XdYnYlzBJTA5scDKEnrHGHeIQWMO65tKeODjkYvDQcqdw0oCRloSxywD2C6XanV3aJp
	/yxcgeAVN1gKu0RV4hHFbZSjZTiOlVvjO+ticrX0IA4cQDtUANbpPnvwmW1A+ice5seeC3
X-Received: by 2002:a05:6a00:b44:b0:885:153:c3e9 with SMTP id d2e1a72fcca58-8850153d764mr2838568b3a.50.1790672699503;
        Tue, 29 Sep 2026 02:04:59 -0700 (PDT)
Received: from gmail.com ([111.55.96.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e163d39bsm460270b3a.21.2026.09.29.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:04:59 -0700 (PDT)
From: Xue Boyang <fuchen.dust@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xue Boyang <fuchen.dust@gmail.com>
Subject: [PATCH ntfs] fs/ntfs3: fix out-of-bounds write in UpdateFileName replay
Date: Tue, 29 Sep 2026 04:04:52 -0500
Message-ID: <20260929090452.224281-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During $LogFile replay, do_action()'s UpdateFileNameRoot and
UpdateFileNameAllocation cases write sizeof(NTFS_DUP_INFO) = 0x38 bytes
into the ATTR_FILE_NAME structure that follows the target index entry:

	e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
	fname = (struct ATTR_FILE_NAME *)(e + 1);
	memmove(&fname->dup, data, sizeof(fname->dup));

The gates that run before the write (check_if_index_root and
check_if_root_index) only validate that the record and entry offsets
land on boundaries.  Neither checks that the entry's key_size is large
enough to hold a struct ATTR_FILE_NAME, whose minimum size is
SIZEOF_ATTRIBUTE_FILENAME (0x44).  de_get_fname() applies exactly this
check at every other call site; the replay path omits it.

With a crafted $LogFile whose UpdateFileNameRoot record points at a
16-byte entry with key_size = 0 placed at the end of a crafted $I30
INDEX_ROOT, the write lands past the end of the kmalloc(record_size)
MFT record allocation:

  BUG: KASAN: slab-out-of-bounds in do_action+0x14af/0x1d35
  Write of size 56 at addr ffff888004046be8 by task mount/71
   ...
   __asan_memmove+0x3c/0x60
   do_action+0x14af/0x1d35
   log_replay (fs/ntfs3/fslog.c)
   ntfs_loadlog_and_replay+0x2cb/0x300
   ntfs_fill_super+0x1375/0x22d0
   ...

The write content is fully attacker-controlled (redo data from the log
record) and the trigger is deterministic on every rw mount, no race.

Reject the operation when key_size is below SIZEOF_ATTRIBUTE_FILENAME
in both cases, matching de_get_fname().

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS3 filesystem")
Assisted-by: GLM:zhipu-coding-plan/glm-5.3
Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
---
 fs/ntfs3/fslog.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 498f63da2b96..ba61767cab3f 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3557,8 +3557,10 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		}
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
+		if (le16_to_cpu(e->key_size) < SIZEOF_ATTRIBUTE_FILENAME)
+			goto dirty_vol;
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
-		memmove(&fname->dup, data, sizeof(fname->dup)); //
+		memmove(&fname->dup, data, sizeof(fname->dup));
 		mi->dirty = true;
 		break;
 
@@ -3742,6 +3744,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			goto dirty_vol;
 		}
 
+		if (le16_to_cpu(e->key_size) < SIZEOF_ATTRIBUTE_FILENAME)
+			goto dirty_vol;
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
 		memmove(&fname->dup, data, sizeof(fname->dup));
 
-- 
2.53.0

