Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142584;
	b=JYK6XCwCZxPvHQkkhqdZsCihj6KiNctuX6SykEvo8ejEBv/Z7PG/9zI171v9Ocq6ySNv
	 YavJ+mSzGYqumDddKuVQ0N1+smCXy7s3GmtHpRvhtuezoNjC55pZs2r5vM00C/uF/z9W9
	 2lBL0CcDXoyI4AOBCd5zcryhVRuQ7aHNrE94Jtvrr6On9MYfGKDborPLzSzGGILPC0dtj
	 y6d3lQXgWCUgcw2mJHwdJ+UpUvII0bkWQgtM9BuAHVkYEdP/ZLVbF01mR9eTPt6ldulDq
	 XA8YFcKjMV8hOzLE9kH0P1MOHIhGOq343TgM99oMXlKS2rSr6Dg+Zr0q+k+VpQnHAKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=84P1pX4lpO1OaC5mRIJtD7cq9/wTHeywebmO1thFbP4=;
	b=sZdYxsBKvZznvLvE7zbX3l2YatNW2pwR23CwiDLAaEn1RO7pJxph6ksSkvux3o+55x2G
	 7B7WlPMkl6EMat2GW4OBEjFgKhYorPPROdlYcrSYJRx2FHFPiZ/FUSEP9Q1K9ly3iC3Jr
	 4Vz5x98cKdZ+xuIQKobNDfpMmmvDWvb3j4iVMueK3CJ58kNFmEen2Je7w13SzF+PEVtbr
	 n7KCjZff/WT1AOTMdcTMNCbd8F0Jx/Va/DCYKpbdE+UuZpvU+G/pMeuCa4z0m+rJFHGYv
	 zjr9aq1o/IxRvuR0KsHkN1PmtZi2w09DgRG3qED4SDSVWO2Zqdli4JyYJjB0//FAQEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQ3k+R4T;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EBD606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2EBD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQ3k+R4T
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so619385e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142582; x=1794747382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=84P1pX4lpO1OaC5mRIJtD7cq9/wTHeywebmO1thFbP4=;
        b=fQ3k+R4TuSIVy1/ILvvwM/1nQWgb0HmiYPFP30x/5WAe9G30RaXrSD/nAL16Z0KqUg
         mJaqeIkU8lz482fRKlicx39SSzEEYgvFrWkkAkq2q8eI02PSFxCQY9ekK5yew+zaOU8J
         RuBvSGpK1K6UJMR9I3DiyWkCC7UtENOoCFN3DJX09l9LDdFCQbhoKn81m7DG0hyjBws6
         yhD0z74OvTdOuY+hkvfwkgYwtarHtazXr4pMMNJdQ7g1TrA5wVz/7h/brxcH6jUSoRtm
         oy6rwMs+nmz17rXcbcRlNvOJpbFgwT+okYNScssnsVIhr5Zz8ukfZu6N0I9YDZ80ZLad
         OAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142582; x=1794747382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84P1pX4lpO1OaC5mRIJtD7cq9/wTHeywebmO1thFbP4=;
        b=FANdaC9cwqW59ELpPDsExbDh+2WjWpXZ376CpJhU60mCRVYPj/rmaZG1qKJwGbI4N0
         tb4hqW2ufk63U+T7OgJxpKXfri0cm3tx6OXgejPnajEuRPfFVotQi5zClNS8mV4Psa/u
         +oRyTewms12GoI58rrlSVW19Arj6a0NWh7y20h/kOnqqCvSqj7BawVCpRCYMyacHxWU/
         oSB4xs0yoiyC2z3jIG5t71Yrz0ESElPkn+fl93kTi0ER/iznlxwDBLkV2soa54++BH68
         tfcyfEFxC8o1vSfFpkiR8pg2qUG2FHuCqvPzxqkPISAs1c5LwzUJrJKoHKL7uo3i5cKj
         zQmA==
X-Forwarded-Encrypted: i=1; AL+hErHfVO+mpralbfSjrrM6MR9+a0e7TN2WxIPzb9t544LBVuUk6Ogehmpjytlyd81jHrfndtpKcI8VXQfkB6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CicYvIXSxwEEJ/w1zyXxgpptKQX1HrGLSqpw8S/ZLQ8I0czsO
	hCBMbSY/F4IwyhD9gE57rw13aEpotAlGADAXfWziDhTsP0b9c8CKMYH8
X-Gm-Gg: AYBFou0MpxSjMYBV7KOJwQeB3SPXa4V1Bh5VsRca82+QdyhR6YKCAIfkfUZRJ/TwMBO
	O79uowCZ8YXeU8LewPm2+S/t7I/hp0dS50H3S9p8YKlszy7BvvqsVNDJbOWPTk9VvM0siII3xaI
	xY+PdiQhN2IcTa6RjjgRzaQg6weiuAg8rLnp1JI5ZnopYT92mtYaW24EuI4mfMXbYeIdkzdriBj
	WeQAgSdqfQvqq9ngKw2sy+XU73mRykjZDOMhtWyEmv5wNnnvN8m2kcWxITceG0cACY2j8kEHRUo
	gfrWo2YL1OmD4lwVJN3yF/YmWTQD9rc7rALpSIe63GwgUveCO+p+v/fcLWysoU4xZc6e2Hojd5r
	xLqNOfTkMq/k3ed2NHBmMFApRtVYgs+ev/dXQAPJcvLZYvZoEUadymRLSr4iniDpo+0fG7fmbIS
	PtP9BJ6TNSbNEL8tYZh/cZhoKZRoZdGxJ/oQSKUviDkkcpXU2l90GqEVG9GeyHp1usf5S5zwTUX
	hoTXOVlb3FKCviWVXP4S0DZvWnyTQIlHBmfKOZJn9mCg2NwQOGz/Bk4Z9judaMoEjSjNUgyd+68
	t4kgYUBkY3DW2wj04uZLMPENcxzg2KoDVg==
X-Received: by 2002:a05:600c:4f86:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4b960d9b17dmr26242365e9.9.1794142581814;
        Sun, 08 Nov 2026 04:56:21 -0800 (PST)
Received: from LAPTOP-AVI.lan ([147.235.199.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597d0a775sm4114641f8f.55.2026.11.08.04.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:56:21 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] fs/stat: reject invalid flags for empty paths
Date: Sun,  8 Nov 2026 14:56:18 +0200
Message-ID: <20261108125617.2383285-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

vfs_fstatat() and statx() take the file descriptor fast path for empty
paths when AT_EMPTY_PATH is set. These paths bypass the flag validation
in vfs_statx(), allowing unsupported flags such as AT_RECURSIVE to
succeed.

Return -EINVAL for unsupported flags in the vfs_fstatat() fast path,
and validate flags in vfs_statx_fd() as is already done in vfs_statx().

Fixes: e896474fe485 ("getname_maybe_null() - the third variant of pathname copy-in")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
v2:
- return -EINVAL directly for unsupported flags in vfs_fstatat()
- validate flags in vfs_statx_fd() instead of changing statx()
  dispatch (as suggested by Jan Kara)

 fs/stat.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/stat.c b/fs/stat.c
index a2e63c6c45b7..3013e4ece011 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -322,6 +322,11 @@ static int vfs_statx_fd(int fd, int flags, struct kstat *stat,
 			  u32 request_mask)
 {
 	CLASS(fd_raw, f)(fd);
+
+	if (flags & ~(AT_SYMLINK_NOFOLLOW | AT_NO_AUTOMOUNT |
+		      AT_EMPTY_PATH | AT_STATX_SYNC_TYPE))
+		return -EINVAL;
+
 	if (fd_empty(f))
 		return -EBADF;
 	return vfs_statx_path(&fd_file(f)->f_path, flags, stat, request_mask);
@@ -371,8 +376,12 @@ int vfs_fstatat(int dfd, const char __user *filename,
 {
 	CLASS(filename_maybe_null, name)(filename, flags);
 
-	if (!name && dfd >= 0)
+	if (!name && dfd >= 0) {
+		if (flags & ~(AT_SYMLINK_NOFOLLOW | AT_NO_AUTOMOUNT |
+			      AT_EMPTY_PATH | AT_STATX_SYNC_TYPE))
+			return -EINVAL;
 		return vfs_fstat(dfd, stat);
+	}
 
 	return vfs_statx(dfd, name, flags | AT_NO_AUTOMOUNT,
 			 stat, STATX_BASIC_STATS);

base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
-- 
2.43.0

