Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706816;
	b=KXbgGkYoapK+fuU2aj0VGnjEtvFHDkGXRzVB+Qd0lQEwf5bcN/B4eEyUlwUL52tkBY2K
	 62QAcZJD7ovu6lmLbRb/ShgrLwTp/dWXbk45k/8mumbeUvjrKK7q+Dg4pOJq0n87i4Ct5
	 ae7nsdu5DQUVxMpNQYFlXQDCx/GEXPLC5S7yilfvRhCoYOmwWpbK/y8TLwO8QwxI9nktT
	 kVG0swxqVLRq9w8XSMzzBQxUFw6sqgvl4XlK0i38YMk3/h25HE+HYAbNKfpPpiZBE/mMR
	 klEbNRHsmOOdIv+vq449Wq6q/mT43MsGV1BzLw9ROtjsQPNyU8P/9XbBO3TqOOrQyUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G8gLassD0QTh0gr4RAHwdfUGv7dzLS00phLG0gjKAMs=;
	b=A74hB+I50N/CijiUVPVLMp+Z/GAeQHtF8nu02btMBjyvDj8+d6ghAHkVMbflCMqQVEK0
	 QGrN44MzMGi1kYFzFN36wqzpdXGSzj/SXnV9fyHhcwKRmEiXo3Ux2XJpEeAHHVjeAoAT/
	 eZOjWQJJnxFbZnjcvg4s2zIMS5ADlEthR4DlvUVP2DRMDpq4H39oIr/jtlbMofEVwKz16
	 OobAxJPvI06iC7LqplxDB+MompmlXdOx+Nqx4X9uSVIk1awBYKFBa4doROh1KiH2bJa1Q
	 nDh8hiKQ6zOpKOLgvc3+0I+gdY9hv4IyBMfcE1XwGoKLplyJH3O++fkvVxlGhY0GK4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b9axIoSj;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB2C606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB2C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b9axIoSj
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so309527e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792706815; x=1793311615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8gLassD0QTh0gr4RAHwdfUGv7dzLS00phLG0gjKAMs=;
        b=b9axIoSjFEUqmtBYmlJqiWDbkQTqPpI0mIm7xaKj+mrDNJbn+KUcDFs7zfsbuww1D9
         5vt3AZS0r5fUXzr0CpoNNIobFRG2wvIxDlnpSbqfACzzLxXoDahPIa9Ex1nlMA+5Bv+m
         8uPCUr/jGel9H6SXQhwJniyu4oVCNvmTXBsh6+ow4kJ5uDJ6vJ9F3mdFOurmKwrhOedb
         JUmHDBm3DDQ6RXjIYrD0eG7yb5VXVXcQqbFC/D/gae9D+GsYbv3+2wV8C4MsSsI/mjrD
         Xi+QjTUsNZdxDwlBZvtndo7tQaSHKbs2RHc+9ggRyTcbF/k912M9ooShnmX4nk1dhDZg
         1f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706815; x=1793311615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8gLassD0QTh0gr4RAHwdfUGv7dzLS00phLG0gjKAMs=;
        b=dA/u/8XKY9ie3wywVU3zRBb57Xb4ouli4Aq5y9ZWNCi/CzCXh9P1Q8x11c5Rgsk8dm
         mTKxnhcPxGsXZv/8aeIwsUlGP0VlydW98o7/7cJgsfluvmrvz1XqWNrf8db97YiuMPOD
         dd7W4u49hqoxz18BKNQvak1kDPnPaQtMUXkXjDzd/Adv3VgVgPHwRLf1Fc7BVyeEozv/
         UQC1j0K/YyIWeWQtfDY1cf2iIHubqDubzOs+2GXBFtEcy1bZ/TDglY/EjjfZnZdaqw6G
         PsBwn2d3ClfIjujsVpPKyY9uZ2ycoGdSX3HP2Q06se799HYjAZ8/icI8ar52Wg5A4LV0
         cMSA==
X-Forwarded-Encrypted: i=1; AKwUvBz8A+rBTXndaNCDP89SwSMKLS35yHKfcJZ5kTErHN2/OdF+ks1NgLHSX9t4tor2WqxdD7l3Oi4jDA68tvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYJoP8ulDSTT85BAO8CZb/DvBwmfWcRUok68gySAfV81GIhpZk
	1tR1ZgpI9k29jvCSlQoOXOPxGIujQdGeJXEh9IqO8FBamm+gya8bVxwflOxNq4Aj
X-Gm-Gg: AYBFou3MF9r2O8sp0YfOxhLNTSeVlH2Q/Q2p/SMZ9ZxCiT0JjkDIOvPh0uGGdBi77Zf
	Vw8noyoUUeMqzHGbGb6tUMPkxdhcj+ZDnfEoSOnb9AItoBYu/JZs6meWEAtqDIKu4YMsarGYsP9
	YkkDQm/1qVPpr4lhhraWqwZwqKzC+BZ5jWq1bYB+Kt3hPP7t5U04iZq5RCah9XPUHvq7WM3QazD
	SpRmlJKkIPxGQjWaQEVdf1IO74pEZ5CET2HHcNgig1LmvV8jMHejANX4mCxzV2GUW2/KTsKKYAH
	YxBlWOtS9AIgddogUz4dW5QedMUNQsFcLX3YMCtZABoa30H3QcE5BXTZRY5Fvn/wi6J/Flnbt1Z
	d5By2R15Mg9RBhpyxM/2/ERfY+EpiaaoVb4NKGMBQnGrrf24fo6gVqUtJirwK29gn6id0gV64l4
	7PweoPtI0rLi6jEvbtXvU9J47XmyaN8K1W8f06WJj1nZJMOfQlg3zGMsOg+wZXKJeKlqbSH4vB7
	Nz7gDgN01K/DQB5VphJNCLOTzyVZnJIaTZxQlFaG3uoMOptxUdktmo/19L5MUvZQnGh7oqwF0Q8
	QDst/EAfS+vXj8nLavc85ueAyhO/oCZ4LAO1857wUA==
X-Received: by 2002:a05:6102:2922:b0:7a1:f7d2:e82a with SMTP id ada2fe7eead31-7ccc34d7534mr374508137.35.1792706814650;
        Thu, 22 Oct 2026 15:06:54 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ccc20fed4fsm1122753137.7.2026.10.22.15.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:06:54 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Cc: Viacheslav Dubeyko <slava@dubeyko.com>,
	linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH] nilfs2: remove two dead '#if 0' blocks
Date: Thu, 22 Oct 2026 19:06:37 -0300
Message-ID: <20261022220637.89697-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Remove two blocks of code that have been disabled with '#if 0' since
the initial nilfs2 import:

  - inode.c: the code that would have read i_file_acl and i_dir_acl
    from the on-disk inode.  nilfs2 has never implemented ACLs, and
    the i_file_acl/i_dir_acl fields do not exist in struct
    nilfs_inode_info, so this block has never been compiled.

  - super.c: the classic ext2 "maximal mount count reached" check.
    nilfs2 reads and rewrites s_max_mnt_count for on-disk
    compatibility, but the check itself was never enabled.  Removing
    the disabled branch does not change the on-disk format or the
    behaviour of the driver.

No functional changes.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 fs/nilfs2/inode.c | 5 -----
 fs/nilfs2/super.c | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 34e609606..c5b0e9f27 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -422,11 +422,6 @@ int nilfs_read_inode_common(struct inode *inode,
 
 	inode->i_blocks = le64_to_cpu(raw_inode->i_blocks);
 	ii->i_flags = le32_to_cpu(raw_inode->i_flags);
-#if 0
-	ii->i_file_acl = le32_to_cpu(raw_inode->i_file_acl);
-	ii->i_dir_acl = S_ISREG(inode->i_mode) ?
-		0 : le32_to_cpu(raw_inode->i_dir_acl);
-#endif
 	ii->i_dir_start_lookup = 0;
 	inode->i_generation = le32_to_cpu(raw_inode->i_generation);
 
diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index 893a504cb..d0faae49c 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -826,10 +826,6 @@ static int nilfs_setup_super(struct super_block *sb, int is_mount)
 
 	if (nilfs->ns_mount_state & NILFS_ERROR_FS) {
 		nilfs_warn(sb, "mounting fs with errors");
-#if 0
-	} else if (max_mnt_count >= 0 && mnt_count >= max_mnt_count) {
-		nilfs_warn(sb, "maximal mount count reached");
-#endif
 	}
 	if (!max_mnt_count)
 		sbp[0]->s_max_mnt_count = cpu_to_le16(NILFS_DFL_MAX_MNT_COUNT);
-- 
2.56.0

