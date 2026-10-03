Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE82334B1B0
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049602; cv=none; b=TZeAt+kYTkDc6mr5ukFgkLC1xWbXDKtbArqcI2BH397ZxLqeZyrDyxDFDBcR2yF2I1mmYxDREzsA98E077IXTTEO892M7CxkY9/bX0hS+TqtfTydLCu+XZk7tZ8+unmiuVhfRVSUMcrVYhVIsfm9t77D5urHh/c6lwxW2WNWaIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049602; c=relaxed/simple;
	bh=kGwbGAS53FdH0sXmbn3xnwx4Ym7V3BLVw8M55PwAbOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k12aKYUn5tTJc06b+EcahM1jrt71mRIfePWtqdTk/YGJUk73ChRsXcUqFYuNzp7xednipEJKoaSmJAUMVWU2XwcITEu/onIL1BrNTY38eG1K5y5+lqYwzrQqLfa6whc+Y3hTdms/vG8Jl/A55mSSdBwD6MOgqcKlpfcL3BbjXoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVxUak9e; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVxUak9e"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso68606166b.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049599; x=1791654399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98g+KQuWq0F2GGahW0f/vDtlyZeObmh8xnn+HTlcro8=;
        b=gVxUak9e0jD8OJXHJdTk0UyEM2s+ddTgQmB411fNGKiC7hVi/D/rb9qZLYdGuE60JG
         NtLQkQDmvi6d25S85M5EwbChVVy7eYflfT0TC//aB/nt+L0jyjNYZYX/6MuimY6I478E
         Jr1UlK+jxyldAJke8CnnvJ7U10bQd21big/IKsNzMCApyGke+6i+ix36ciLLlHECF3VW
         IOtXWy60tznIPcQjt9AizW7VpCA234T3AaSFlv2VwtV5EjINRVjc5Dd97tA8ox3keyyY
         BGHcbzYHo2dvwf9Y4COBHR/+zTqGmvKkxdhhKnAdC0CXAA/UCZmUVBhLHFdi6By7S9jr
         RTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049599; x=1791654399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98g+KQuWq0F2GGahW0f/vDtlyZeObmh8xnn+HTlcro8=;
        b=aRI9IKeyb+EV3psArye6pmoSsDVnwJ3Rb2DKd/T7K3kZJQGnj++pDLDI0fZDBqRwLu
         xcakPA8Hmy3zrZsk8eRpPTBsWvUFLgzu+De5Lt0k1PIJ7IXCazXvuQaU2L/QD1UZwIIu
         06bVJQbjqx4ASs5cGQcQAeWkwxSgbnq17PS2AHWMWTZcomRmXi6Cei5GWfH+1Bey2RCK
         CWi9KnvNll71orGgJBUiUIkD72x/dH913cP2P+dzWzwivltEW+C4jSdI1mBRiVDay4jQ
         5Snxm2IlR8VU7f0yWXPL8fjDoBd4mvV9y21kZarKJKkzwc26HMCIKMoJpRMMpNu/rbSq
         /1Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwM89OMFzHJPqDU4QJSbTmmb8M098vwqHWPbaNIfcDOedTjNLMkbYAvpNXz9Sp7zg34lFrb7uM9wmZLVEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrX0+nXhrYwWUOd1uhF28Pzp2CvDe5TzK5gMyPeeTLTuakmuRo
	CDdRKlh1O8i3IEek6qLaEvm9DdOX7VfuwRJJ9oS2g3dYf15QyimVM2Hx
X-Gm-Gg: AYBFou1XZdN6DbJp98eNQOZ7Ugu/ZJ4ngJxyezVTaV1kBcP6Utf2vT3ya0Xl/WliW9O
	Xwj6gq5olfU+N3+0J7CsFXIxZ1jtFJ+EDuG68pkipyjlbvnRBXC9cxUmuipv9t0y8zo4WSxKp1v
	yi5JRzdXKWquO30DqMwjSYFnp4m0B4G9ZGraeEpi0HQBC363SdFPPW8vexiURGxph3avjtggNuP
	0UjLuzdzUq3vQZ9Ym6A/1jbhMN2Cya3iLhlo5d9s1fqR0O58G90mcZTPie9zEuALhIb/SyV2myU
	P84NQ5Fmh7L/LqdH3Fs268Pd8VF6BXYMGQGMu9f9MHNEfZ0q8HZKyDjilBaQL09PNYD7qKyjduD
	c85+lbl8QczDpD5qJ9sE7XuTrsWinAxVv5Ts4w2wZPijaXQFF3IyQNdYbDIdl1DVI47FsFdAP1z
	e0TNLoZ5KhHXMD92RhFdKz2SNp/HQ/HYiXtHwMqYJvF6OFmDloCeJU4cZHh8rXSzHgaaYlSB6V7
	755KkNrR/XqM630
X-Received: by 2002:a17:906:f586:b0:c2d:c8be:4e71 with SMTP id a640c23a62f3a-c2e6ed46571mr232518966b.19.1791049599021;
        Sat, 03 Oct 2026 10:46:39 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd25986sm224625066b.27.2026.10.03.10.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:46:38 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: code@tyhicks.com
Cc: blum@kernel.org,
	chenyichong@uniontech.com,
	liubaolin@kylinos.cn,
	slark_xiao@163.com,
	eilaimemedsnaimel@gmail.com,
	ebiggers@kernel.org,
	a.velichayshiy@ispras.ru,
	brauner@kernel.org,
	ardb@kernel.org,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>,
	syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com
Subject: [PATCH v1] ecryptfs: validate key payload size and session key length
Date: Sat,  3 Oct 2026 20:46:08 +0300
Message-ID: <20261003174609.2834-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller reported an out-of-bounds read, which sometimes manifests as a
slab-use-after-free, in ecryptfs_write_tag_70_packet(). This is caused by
two structural validation failures when handling malformed user keys.

First, eCryptfs blindly casts the user key payload into a
`struct ecryptfs_auth_tok` without verifying the physical size of the
allocation. If a user provides a key that is significantly smaller than
sizeof(struct ecryptfs_auth_tok), accessing struct fields located deep
within the memory layout (such as `session_key_encryption_key_bytes`)
forces the kernel to read past the end of the allocated slab object. If
the adjacent slab object was recently freed, KASAN reports this as a
use-after-free.

Second, eCryptfs does not validate the internal length field
`session_key_encryption_key_bytes` before passing it to md5().
A maliciously large value causes md5() to read out of bounds.

Fix this by explicitly checking the user_key_payload `datalen` to ensure
the physical memory is large enough to hold the expected structure, and
subsequently bounding `session_key_encryption_key_bytes` to the actual
size of the `session_key_encryption_key` array.

Reported-by: syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=46bbbe175b7eea8036b8
Tested-by: syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com
Fixes: 0bbb838f385a ("ecryptfs: Use MD5 library instead of crypto_shash")
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 fs/ecryptfs/keystore.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..b2fd238bcd97 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -621,6 +621,7 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
 {
 	struct ecryptfs_write_tag_70_packet_silly_stack *s;
 	struct key *auth_tok_key = NULL;
+	struct user_key_payload *ukp;
 	int rc = 0;
 
 	s = kzalloc_obj(*s);
@@ -738,6 +739,20 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
 		goto out_free_unlock;
 	}
 
+	ukp = user_key_payload_locked(auth_tok_key);
+	if (!ukp || ukp->datalen < sizeof(struct ecryptfs_auth_tok)) {
+		printk(KERN_ERR "Error key payload too small\n");
+		rc = -EINVAL;
+		goto out_free_unlock;
+	}
+
+	if (s->auth_tok->token.password.session_key_encryption_key_bytes >
+			sizeof(s->auth_tok->token.password.session_key_encryption_key)) {
+		printk(KERN_ERR "Error FNEK key size too large\n");
+		rc = -EINVAL;
+		goto out_free_unlock;
+	}
+
 	md5(s->auth_tok->token.password.session_key_encryption_key,
 	    s->auth_tok->token.password.session_key_encryption_key_bytes,
 	    s->hash);
-- 
2.47.3

