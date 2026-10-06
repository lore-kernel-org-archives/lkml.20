Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4137757C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261584; cv=none; b=Qh3BW8KBrOuq5Vr10AUngXcfYRf8pUqVqIXFtv9dF7sBftJ8L7uKuizmHj0RGOtZKS94OQKT9n5Y+lxyRnTBzy48m0JIEnotwQgpXt+tz1eRK1USPsspQiK698IRopvDkusRN2TvSUVMoTwJLLXzhcJotD4PlR+yFHVqIxXcMMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261584; c=relaxed/simple;
	bh=RCnWkqLEl9N57ql9V/Xk7Pcb/7984IZaCMasgW9VyEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j23ZPwRWuJdfoETSdmAtjZ1udeolnIZ3P6O/6hloL8demvETTiVgapNPwRWlQ48EbAuBigrrHzI7GCIQgH1SRfbNyoJBBiVpAI+wKF3TGkA5qx7aQSl9ZumN/2u+wQA29qH7Kv00WTDptdateRvwZSCE61anYbwE4D9Sy/bU05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cr1ERm19; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr1ERm19"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so3245305e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261581; x=1791866381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQFJVOeQWH/dUEdqrozbevZ9AdUQ52aXCjTZt8hK/iI=;
        b=Cr1ERm19TyysU/3QJBL+8syvzAzytI6jIYwILz2+NnHI8/XXqsLd4EOJPMN0kR3gct
         B949AgPgumD63zZGQBXqMtE03ESfoxO8aQuSxhaEyoZC0mXoO5A7UyYax8d3dbE3101N
         OkhdkGlK0gkmwhog+V567bvvcQOvkbhY4xBzwGvaBBXQ84UbAjdpqejD3aVREcKdO7WD
         yISA1ioPWuNhpnIbnTRkHB4hlVlQOWxoBgas1H7jhKrPELwTn04o8DEB0gF0A9UnDmYT
         fKB+HoHAZTUyQshH1HkNymtXZ/ShzjEd6sEIlNlwVB1NmzabOztAFzcyDUvlSwv4GqLI
         hFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261581; x=1791866381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQFJVOeQWH/dUEdqrozbevZ9AdUQ52aXCjTZt8hK/iI=;
        b=Z7Up+5z9G3FjlDrxF3FpX7OhbHksiy3HtDe3/X1GbVsPjxWKVQFquv9rkLeNNZD1pA
         2Vc3teO7wdvac1QTETYk4ulbBwZHGWqKUIy4SUpxUIv6Bix7kwga0FJUE40Xkq1a2CCE
         mi4jcX+JAAE1XVD+JlH9nmMVv8vkCLIcfMIoGa4e+oVaqLhpoYN6EB1KciEYL7RjM49D
         Bl+ZNVjUXcqmi4ZjzIRov5krD+p+pK21L3uFWSEAmhzvRYvCHjlEZWmHfQ+INPqFXQs6
         rNzXhaQ1B9So3pYRVOpHGkFeY0+09eEZqIZ5QLy9zV2veQeZPC+56f6WY9hTB8Lruiwj
         FB6g==
X-Forwarded-Encrypted: i=1; AKwUvBwltxNleN38SiaNWfzv8Blk3JJ215xxzdyAKsib8cpJpFgBDkIM0jwyEc2YEE9MaM/kRNE4HSW/WzTAVsA=@vger.kernel.org
X-Gm-Message-State: AFuF++lcvVRH0v2UAfvjWu6wxK1j0c2Iim6k9I2S1O04wyzIp37briA5
	B4UcJRwOJ8NEJgBSu8tsXbTyVywLO1VMF8MOWnAM8VqBFEOuXael7SM8
X-Gm-Gg: AYBFou2m3/wXDlOYZF/EPk5ZEWTCpMtGs3YhvOH7AzHVztcBomXptscc2rMqTyc3TII
	4ARVGVZfo4eqjY94kUszey2hNm3AqcJ/n4fwuQQ+PTBo0WSAcTyNauLD8KdtydhiejimBbm9pE6
	Qa4FNyNGVYvEm7jxCBO5QOSxLMfMKAWHOk26qk0o6NWfkHYqQ1srTDtg9NgdfhtrHmAP+H05Joh
	CI6VO7aPz8Rr7HXL+7QCO0QoKcJmS6hml0c2tbGHcG432skjfywffAsvQvPMzsePn024Jp1SCwG
	zf9e0DYHntqzkoOMHsoJM1fv8XaAGqcb60cKFORkecESvCiwpwNXXfGQ2b8c0SmNs8Xp7qKGwZ0
	0SyirtXlFrsoReFLp0fbFLlyMaJ05nRdCmNy2KI9B2jCP8eEMisNKKPUqSJSLHHkGYBSA341yn5
	/QAnh7WD8MeJxKITfl80dhXhbqZwvD7R78mwCQC0Igon2gEK3VkJFSBfWaJn38CJcEGGiDaX/V6
	4O+9ziw37fPzOJbhp0/FXV0J0VKdJEi+3uzYN/X0VAGlwQdRFt7ZAf4623ZJ1HfkBUovRRDLSc4
	J72qAdQL5AZtlRq3x7QxOKgTv7WKHh83uHo=
X-Received: by 2002:a05:600c:1c08:b0:4a1:70ed:882b with SMTP id 5b1f17b1804b1-4a17b536678mr3932625e9.8.1791261580590;
        Mon, 05 Oct 2026 21:39:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm62744995e9.14.2026.10.05.21.39.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 21:39:40 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ntfs: map each LogFile page once in ntfs_check_logfile()
Date: Tue,  6 Oct 2026 06:38:10 +0200
Message-Id: <20261006043810.5393-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261006043810.5393-1-kmehltretter@gmail.com>
References: <20261006043810.5393-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_check_logfile() calls kmap_local_folio() on every iteration of its
search loop but calls kunmap_local() only when it moves on to the next
folio. With 4 KiB pages the positions 0, 512, 1024 and 2048 are all in
the first page, so every mount leaves three entries on the kmap_local
stack of the mounting task.

64-bit kernels do not notice, kmap_local_folio() does not touch the
stack there. 32-bit kernels with HIGHMEM return from mount(2) with the
mappings in place. With the generic entry code that is a warning:

  DEBUG_LOCKS_WARN_ON(current->kmap_ctrl.idx)
  WARNING: include/linux/highmem-internal.h:17 at __do_fast_syscall_32+0x21e/0x550

The stack has 16 slots, so a process that mounts ntfs volumes five
times hits the BUG_ON() in kmap_local_idx_push() during the fifth
mount:

  kernel BUG at mm/highmem.c:480!

Map each page once, when it is read, and unmap that address.

Fixes: 5218cd102aec ("ntfs: update misc operations")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on top of patch 1 in QEMU with a fresh mkntfs volume and a small
program that calls mount(2) and umount(2) eight times in one process:
- 32-bit ARM (multi_v7_defconfig plus KCOV, virt, 1 GiB RAM, 256 MiB
  highmem) and x86-32 (i386_defconfig plus HIGHMEM4G, 2 GiB RAM): without
  this patch mounts one to four succeed and the fifth hits the BUG_ON()
  in kmap_local_idx_push() on both. With it all eight complete.
- x86-32 no longer warns when mount(2) returns. Three mounts in a row
  with mount(8) are clean on both.
The other kmap_local_folio() loops in fs/ntfs (lcnalloc.c, mft.c,
bitmap.c, compress.c) unmap on every path before they map again.

 fs/ntfs/logfile.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs/logfile.c b/fs/ntfs/logfile.c
index 1404664dacc0..ce38ce87f8fc 100644
--- a/fs/ntfs/logfile.c
+++ b/fs/ntfs/logfile.c
@@ -457,7 +457,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 	struct ntfs_volume *vol = NTFS_SB(log_vi->i_sb);
 	struct address_space *mapping = log_vi->i_mapping;
 	struct folio *folio = NULL;
-	u8 *kaddr = NULL;
+	u8 *kaddr = NULL, *kbase = NULL;
 	struct restart_page_header *rstr1_ph = NULL;
 	struct restart_page_header *rstr2_ph = NULL;
 	int log_page_size, err;
@@ -511,7 +511,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 
 		if (!folio || folio->index != idx) {
 			if (folio) {
-				kunmap_local(kaddr);
+				kunmap_local(kbase);
 				folio_put(folio);
 			}
 			folio = read_mapping_folio(mapping, idx, NULL);
@@ -520,8 +520,9 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 						idx);
 				goto err_out;
 			}
+			kbase = kmap_local_folio(folio, 0);
 		}
-		kaddr = (u8 *)kmap_local_folio(folio, 0) + (pos & ~PAGE_MASK);
+		kaddr = kbase + (pos & ~PAGE_MASK);
 		/*
 		 * A non-empty block means the logfile is not empty while an
 		 * empty block after a non-empty block has been encountered
@@ -574,7 +575,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 		 * find a valid one further in the file.
 		 */
 		if (err != -EINVAL) {
-			kunmap_local(kaddr);
+			kunmap_local(kbase);
 			folio_put(folio);
 			goto err_out;
 		}
@@ -583,7 +584,7 @@ bool ntfs_check_logfile(struct inode *log_vi, struct restart_page_header **rp)
 			pos = NTFS_BLOCK_SIZE >> 1;
 	}
 	if (folio) {
-		kunmap_local(kaddr);
+		kunmap_local(kbase);
 		folio_put(folio);
 	}
 	if (logfile_is_empty) {
-- 
2.53.0

