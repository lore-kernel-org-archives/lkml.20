Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B1435502
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788039189; cv=none; b=rAAmyo9skKg5rmcedRc7eWnLgSBN30uEe9WlPGez9/2v1BGAjmPHAFOrJ2ZMiIzClHegszBfe+r9/k/LTR5o30s+D0v3VOM4Rht7UrbCPvmzEu+EHiN3zOvDIfDh/7PRSJM5sLU/wTONs2YKBsiKpEgwxH9YwiHm24p/K/bZ+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788039189; c=relaxed/simple;
	bh=LO1QiG+tuqYXw1xkU6kH+n25tHtzPNegmiTgVWdxIs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RM/49vWDY+JvBkavH5ABLq1G5sBky87ZiAK6973iPFQqVvV3Ug/LZWrEPERDDc6hN+eTzqlszGIXxDJqAKdmE+1C3g1NmCnlqIWxiA66+BEtueZaaU0sksrsXW/l/BLihmhL5f9KF8W38YE9CwpegX1g3uoHnP+QcU/oIHq6QnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5pzNf96; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5pzNf96"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48436216a98so152672f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788039186; x=1788643986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPdTmo/psYzNVIunLzBuzuNQ62GIR7HvuoO8VwCkzsQ=;
        b=l5pzNf96MTYV8/moSN0WI9ZuXaKDZa5UHbuy16V1DyGljLFlTwV1CHBrDnvAO8Qoc6
         e+C1W9+hDhu6kCQH3ubu3UbQZt451RX8Ep+8ULGqms3kUVVwTBHdILpGtJiHJGnZ8pwA
         35c/HQWRfteLGTcX9XtWAkMXAJeeDsJf4Y+UrLVhUm0chhLm/uLoeHpesdV8dIhJj8QB
         c9vj+O7T8JjfDTo050/B90yPDpAuhcXoSR1NbwafUI+pCQDpkYTqCc3vbnMuGgeJ4X7T
         Meekeo+ASAzUBPAG4ShXUu7sVEjvZ50qmnrspoQHEWXGwh07mTlzE68n0o0+atq/FLIK
         oAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788039186; x=1788643986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XPdTmo/psYzNVIunLzBuzuNQ62GIR7HvuoO8VwCkzsQ=;
        b=Lv+6YNgCEEVk9N9aqt51izWTbVdqDz1hgDhlV1B8iXLySRb72oiZKPJcyrDYA96/Xo
         JzfFE+StKDMuBnjvdRp7eskhCptvmUuNVPF5W7jzE2eKl+oPVQwVggayKA235nt4PNzS
         MlMhwsd1BsfzIVgLMmbCRUydiQaj7S/i1yT6eA+QrijlVNvSjFVDjUcI/TbSdBSAoLe1
         h/wjoDdDNKZKTjqB2CkI3C3eTY41qfVjZASA/W3o1hZBB8COKcHrS/HPc3yzB+6ZyVHv
         cPIav2UJekuIWFyq6RTkDf9jzwpoWzs1Dm21/CeZmu3psitpRhhPfM23LwZ7M2tpHQJt
         /hDw==
X-Forwarded-Encrypted: i=1; AKwUvBzCJnJ4HF1ypGkxMYZxMgky3cV8LjBq9Xr8DJVV4wkslC5T9iN93loMEx9/Zr8w27Ax6pIAKkC/YtY3oxk=@vger.kernel.org
X-Gm-Message-State: AFuF++mWYjEPZQTBz/vepTZrnIzO0fo9ONpldrsql+TsMA7fvAPwOYJW
	PPyD52SqCcbWn7CHu2ZFx51m9NHfGwHGroyGHfK+xyRprnw2/b2/xe1U
X-Gm-Gg: AYBFou3uA6LyHeJmIFwYZ6Hch+1aEZTAu2iMCB96rRZR9+3uC9ZLjTDmWu7xBc8Uq15
	j0R6eXmFj+efzFE6SQ+V25MDHfR0R23mWPqPwRiIDaSr/05XJqcQvGDsCcWAQtS9QwGsgXKUJYM
	gzeOxdcqo0DDxu2cXOXf3ifxoED/q/1aUk8e/oBZFcbPXwKfWSHb4oavi+2c5XGxmEHrHHldJPb
	7/70GVQ+0G80w9dt9s0SL3K8cuEnzw9Y9F6Fel69qH0CNZDsbeOHRQRqW6VvrYcrZayjkZgQFWj
	YVkyXsWKFp3q/+bsv7YwQHgdI8Dk7VRjyMYHqhCcqmxEk0PKk1HLQ2Lcz1xm4ziNiBazKCXfRZb
	LMpOqrl7vZcp7l15N3J+U8Q/9CKj/5m5TI4WLGig0k98mw27Bf9vQjXAtQSY9tg1ouYaUWxSyIh
	seFEuhFzCSlY//CyZcZBhiJ3ZhdYXl0hYGxIkP+EaNrIvmJi0xRUTZ7XvoaOlFwq+b3lnqZOtV4
	dLF58OTVFg/OVS493wqQHsgGrkhdRS4/k1RFENTuMDZy+J9JwsFWn5K7owEPM/1QPd1dZAL1l6o
	/Iysqf/8ACZarqAjO/fu4Xi4nHvsLaVphf1kp/ikfzEm7ZFc8K3kXe8Rk01A3OCQNCA=
X-Received: by 2002:a05:6000:41e9:b0:484:3621:6340 with SMTP id ffacd0b85a97d-48436216a9bmr3184979f8f.16.1788039186041;
        Sat, 29 Aug 2026 14:33:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33070sm12540616f8f.36.2026.08.29.14.33.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 14:33:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: selinux@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Baokun Li <libaokun@linux.alibaba.com>,
	linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] selinux: preserve user SID across nested backing files
Date: Sat, 29 Aug 2026 23:32:55 +0200
Message-Id: <20260829213256.51527-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260829213256.51527-1-kmehltretter@gmail.com>
References: <20260829213256.51527-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SELinux saves the user file SID in a backing-file security blob so it
remains available after mmap() replaces vma->vm_file with a backing file.

For nested backing files (overlayfs over overlayfs, or FUSE passthrough
backed by overlayfs), user_file may itself be a backing file.  Its
fsec->sid is the SID of the mounter that opened it, rather than the user
that opened the top-level file.  mprotect() then checks fd { use } against
the mounter SID.  This can incorrectly deny access without a domain
transition, or check the wrong target SID after one.

Copy the saved user SID when user_file is a backing file.  Keep using the
regular file SID for the first backing layer.

With two nested overlayfs mounts and SELinux enforcing,
mprotect(PROT_READ) returns EACCES with an fd { use } denial against the
mounter SID.  With this change, mprotect() succeeds.

Tested on arm64 QEMU with a small BusyBox initramfs and a purpose-built
SELinux policy.  The original test was also repeated with Fedora Cloud
Base 44 userspace and gave the same result.

Fixes: 82544d36b172 ("selinux: fix overlayfs mmap() and mprotect() access checks")
Cc: <stable@vger.kernel.org>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 security/selinux/hooks.c          | 9 ++++++++-
 security/selinux/include/objsec.h | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 035aaf113d1da..232b7e7bfcafd 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3843,13 +3843,20 @@ static int selinux_file_alloc_security(struct file *file)
 	return 0;
 }
 
+static inline u32 selinux_file_user_sid(const struct file *file)
+{
+	if (unlikely(file->f_mode & FMODE_BACKING))
+		return selinux_backing_file(file)->uf_sid;
+	return selinux_file(file)->sid;
+}
+
 static int selinux_backing_file_alloc(struct file *backing_file,
 				      const struct file *user_file)
 {
 	struct backing_file_security_struct *bfsec;
 
 	bfsec = selinux_backing_file(backing_file);
-	bfsec->uf_sid = selinux_file(user_file)->sid;
+	bfsec->uf_sid = selinux_file_user_sid(user_file);
 
 	return 0;
 }
diff --git a/security/selinux/include/objsec.h b/security/selinux/include/objsec.h
index 3c0a16ec978b0..853f7266ed189 100644
--- a/security/selinux/include/objsec.h
+++ b/security/selinux/include/objsec.h
@@ -87,7 +87,7 @@ struct file_security_struct {
 };
 
 struct backing_file_security_struct {
-	u32 uf_sid; /* associated user file fsec->sid */
+	u32 uf_sid; /* top-level user file fsec->sid */
 };
 
 struct superblock_security_struct {
-- 
2.53.0

