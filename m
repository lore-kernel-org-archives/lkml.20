Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792795035;
	b=obVwGB2EEXLKqk3gBf/3OA61c6oFx8b1i9XR24pVSyA9Hi5zSkUScfgFmLxwGt+50A1+
	 xaYt2rKOQSJKBom2wcJP+OBlNxjYb8GdL7DvR4d6dgiEEL4TX5JR2UqzedONhKG1RtnZq
	 ayIQhbdCNG43IE4lT4uqnziMpJkqnvEgF77CFfFUiwchVih/wWvvUxDCDD68+5RAnudss
	 DE5K0foUKjMGLftIv45/p9417kdwcWuLwBccSVN1aHHMchGwUC3V8IHI6ICIQNnO4+wRf
	 J8Y6CA+5OdjnnDU0s44sflR62KSWiHhgSS4IuL/WpfjXmRkDNo7XNt182uw7ltyN90g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cJoRqfaV2dmK7samaJuoXpWgrgrZZWBwrjmheHlVWq4=;
	b=ivoSNPGt1T7NzBpP1d9TjV+uAea/NWIcFhZYjxQy0VYvQQaiL3Eq0UnQKuSjwE8skln1
	 DGhefe5TN+I5c99+MdaUGPLHMtqj+tRROh2xJpdsAiN6vjZtgF5u6nQ4SRRg2gqi5bzaD
	 U6K9cogPbG4wGh4beJ0UD1i4FiHima7de80WkBC3atu1j+YIKk5GFw2/MTd/QyKQ1INlL
	 Og3UrlLiaazDdNzpvk6BIbMRbAayjJb7Kaff6ji3BF29hW1R2gzO651B6Svgh0yFxtRfz
	 2urB7sxcXanBLBTiElJXnAZsRBjZt+V5AHzuBg0n1ASZaNoX8bicVttv1SqaMHwSUnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mbmnH1qb;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED218606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED218606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mbmnH1qb
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9906870a9baso747168241.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792795034; x=1793399834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJoRqfaV2dmK7samaJuoXpWgrgrZZWBwrjmheHlVWq4=;
        b=mbmnH1qbYVwCYFpyydrG0X9joHgkK+ABW/XVCB30GK86StJp7M7EqjnyDckHEGw2/f
         2Q5v82+1EssuXmGOJvqGJTNoieYhCzCCvI7KbKQJn3bCv0x1qZSzWEr0O0sicPQj8Y7J
         QVTUx6kX1Q7rmsokgCqqJ7Qb2/CSt2jBivX9xIWSHELZJOU3S5NK4vjUpxKQlRGJTlqR
         HmJTjyu3wDvTcMb02IZfSHfIh6nMt4MnSWdO48WNTrWGWToankaa/0IgeoIQ0/gtdEIX
         c30oXvlscKgz2x0pnND8PxGXnVoCCBas2oNMlXbm6R/y73D5qpK4z7U3Mt9mAKbNkb/8
         u4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795034; x=1793399834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJoRqfaV2dmK7samaJuoXpWgrgrZZWBwrjmheHlVWq4=;
        b=lSwrySaGmTCSYVHvv4v9nHa53UjsSIx6J/lss9/dSyBLN4GXaPx75D5ZjkbVmhlzAk
         nN4tWbPR/zKl7afTUxjexccmBUWcQ9zyvPfDMmTtl9SJIas/SQClOqu0a1xGcRL20zmg
         L/oTS0gbApWMqS0jNlzAb/VFxbuerHDwTcDTBCUZtieAl7A9j/B496/z05IYOkjKJK2W
         sGCHrt+ONH6Qf20UFClDL5SfWBf2KvMz7X+nHVwoQCsMDrB79E7jN7GEVk+jK5jJFX4a
         IU//hlGdLl9CF649q1cuLAA+PUhTRlRkE7WY3fPS2QBd0V73rJQmUkPm7JmjWdHhcs6J
         xerQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyevaZN6JzOyN51pg0cMvzPVP73tBu14zL6eHcRmKCkITPPl+bT8rfiQTsXJj3ueIpAc9MYSFo5DSkY+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfx3WI6AnjumVr/+shQ5v2ROR54qMJRFQNvZjZaIjn44TSxXhH
	rZYLFWlpa62DLiRBfbxf6Tt0uHbjjvAFrP2t33sF3pT+8VMQt0x2KTnB0UG43g0F
X-Gm-Gg: AYBFou10wxT6Sadcveo9JE+dBVTjaPSkJBWl2uefU5krz9dhZGhpTCeHVY7xFgUp455
	JDjgHtDsXQ6jfKBFbXCKBrkFvu3z+MFYhco7QW4sOQA9vAQa4gcH201Au71SnZk2NfLHTT+pmSo
	XSd2t+gQMh25AEtt31tguhHeo1OY7w3ng23BtXLC+N6IGxZtNBqb12uqbEm03D+KpqZ0PN/DOvi
	8/uH2djR9MRXHTelmPfolsI4ge7eqooGfOQI+bjMaqZjBEVFigbHQ5n6HySV4gLXdapPOO2i2Rv
	l3pScTbgnW1OdxGr+bGrEbpL93llibEGTTwYLT6oF+ZpznuUXxK28HNCDz7Ujx/8ievca0KFlxl
	NeDFxnrxML9LV9kq7bl9lU+hL1QjXCMKEI2+BsmEqyytaUVf9tHjmkU/uh9jyugmqj3MdTENG+4
	q2bMR+YJs0wlGgyDWCSR1PfTBtxedT16lbJUQo4CI4ciBjX1ZvdbBDb8UuAjydiMkCfHqXFBLDR
	+8hrqwFQcqdjSTBTuRFqi9/xXuY3USGPPVC2HUCR7kta4RtXrUgOIAgs2lNkN9ML7SqbSj+6fI2
	2mVdUz8=
X-Received: by 2002:a05:6102:604e:b0:7cc:cb56:bf83 with SMTP id ada2fe7eead31-7ce5cc30470mr211202137.12.1792795033895;
        Fri, 23 Oct 2026 15:37:13 -0700 (PDT)
Received: from bridge.. (deps54-26.deps.ufsc.br. [150.162.54.26])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm817532241.5.2026.10.23.15.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:37:12 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yun.zhou@windriver.com,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
Date: Fri, 23 Oct 2026 19:35:33 -0300
Message-ID: <20261023223533.686085-1-christian.aurichzm@gmail.com>
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

Commit da4391c496fe ("ntfs3: release ni_lock before dir_emit in
ntfs_readdir to fix deadlocks") drops ni_lock before calling
ntfs_read_hdr() in ntfs_readdir(). If either call returns non-zero,
execution jumps to out, which calls ni_unlock() even though the lock
is no longer held.

This also happens when getdents64() fills the supplied buffer,
triggering a lockdep "bad unlock balance" warning.

Jump to out_free instead to avoid unlocking an already released lock.

Reported-by: syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5c0ed4f2974a8b100ed4
Fixes: da4391c496fe ("ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix deadlocks")
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---
Based on Paragon's ntfs3 master (da4391c496fe), also in linux-next.

Tested in QEMU with lockdep. A 128-byte getdents64() buffer
reproduced the warning before the fix. After the fix, no warning
occurred when reading root-only and 700-entry directories,
including four concurrent readers and a writer.

 fs/ntfs3/dir.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index b54828735d55..45d6a41a7222 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -563,7 +563,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 		 */
 		err = ntfs_read_hdr(sbi, ni, &root->ihdr, 0, pos, name, ctx);
 		if (err)
-			goto out;
+			goto out_free;

 		ni_lock(ni);
 		bit = 0;
@@ -607,7 +607,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 				    ((u64)bit << index_bits) + sbi->record_size,
 				    pos, name, ctx);
 		if (err)
-			goto out;
+			goto out_free;

 		ni_lock(ni);
 	}
@@ -615,6 +615,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 out:
 	ni_unlock(ni);

+out_free:
 	kfree(name);
 	put_indx_node(node);

base-commit: da4391c496fedc1ca78a99907712f2256ce8fb80
