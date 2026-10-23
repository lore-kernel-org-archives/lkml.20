Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750727;
	b=TJDz2WHhvW2mJBW4FtFpKUYsdU0B/hK5oUhOo2cpxz9annErtKgBuXQyM8btDUBJDoFx
	 tLeJKhBDjCf1L4ol1/4E+AlVoWMyL9MoP2KpMGZVBGvVOly/wckT/+5aVBMzg/B0Wg1nS
	 DVgwY2pGHrzl62+/KTqgaM1txCIFE7RNT43Eo7B3DNrfCrnUjfphPcfwEMiaF0krahoEp
	 WE33+1RZsk71+sDw3wYq70M7sbH0VvisUAjyzMDCfIv/uIAlnKOGrghjIPMXFUchaFnPh
	 UCu8AxpA1esMtdsd16mdeYFQ6xJdUFeWfAWYsLT+frEZDbziTRJJJko7ywLZEtwidug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9bxByH0D1K6wGDtk79VrVN4/d3/kh7LLNLXD7fzdbok=;
	b=fNKg5YN83yIgfWaU1YraLmUYQlOz9KTKjyUX39y47jm+dKUp36bBeB7/J8rtGBxrN6Ai
	 c/2XZIiqbsKiFEjBfCDBUOMJBTkLGLzduKBi89EAzRU082TTsz4bSaDDWJfG2KAvpEwCt
	 IrmeuFVBpKx0LGxaLY7R0T5vfCkaTKFoVA+91kFzhQQkfZQUfvE6n2PxaXFK05hwvVbO8
	 F6lGXRu0HBDWm7o9cjMuztzUPUhUIC6NnLt5muQNLHpkuPTxct95HXIJpCGPNamd1hvm2
	 BEt8zSwYSKq8SClnMWTyvPySigLgIkBIIrI+LTM4zFPMlm9BgQ1XZ2pYmhdGgxdjmOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="bHm/kBpf";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95255606A335
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95255606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bHm/kBpf
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so3816635e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750725; x=1793355525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bxByH0D1K6wGDtk79VrVN4/d3/kh7LLNLXD7fzdbok=;
        b=bHm/kBpfR17t1ztV1jlFbMNbkKFVC4QjAheDlHdG/jsJ1gkajidX2ESlITxICWdtTb
         cOCXovWR4++l29Z5nIHvaHT4qhQbNof6nmeY5+tCzOgTl8Oo7w/EmpwmULbRo0IknWEJ
         Toe5/SxdSKlnBUmaPFy91nW0FG5klHl51Gl+hTnD6q3DrqjtzkWzhl5g2EXIoGlMPT55
         mu7Iv6mtHHMjiqtr6YMDeMYq2hY/bLb62+x2zryhcjyo7evn548llk7W2F37Pswhcfsz
         z+WYQF84MNv1I+qJBkExbHeEXGhQQWI29Ks991lvnIqi08qSXL8Y+FALI/V6j0B97xkJ
         xWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750725; x=1793355525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bxByH0D1K6wGDtk79VrVN4/d3/kh7LLNLXD7fzdbok=;
        b=wF71arNOiqeEK6yyw+bcZpryRfGpKFlxmSWDxyF8L4rXkBwpiZhhNNSHcKLycr10Pz
         uWZkMvMshklhyMJTjprt03yeiu5JWO7XF30mQKddLfD/lnfi1dPfAVxouXgWeDKYkAwv
         4gutOISQEtk5/JUHqLvFaDl/wG4laQQfyamB6wJ9Uw8231pLVk2FTIFpkIM8W+oWZjhZ
         dAFYCdXaTFY+kITiQ5RpRWJnpktc74c9YRw5FCET0SBIWvw/+WbMxeT6IwEwU72A5CK1
         j+gx+x6y3Kh41XFS4Ek8AaZ+tWwrIsm2kS1FlHIE3bohzPkAJPVLEh69IcBAhGVgpx3g
         91/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4DeDxxiI/yVraAnNY+3wTFbX/5NOCi/+GsZiF1RrOL/LunlsfmyzRDp5qcE0j21W0CFuXwzaRek7egRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB1tYg9W3iPJQbmmXgklrGwXc5Rk2xwBrv8J3h2fJtVG125Xl+
	GM2JdUNk9sWeQgBNkLHRcQKf8dvw8cIK8Eo4w4OO4vGWca4e7d6sRS8q
X-Gm-Gg: AYBFou0ISCDSFIIMFNVQOc2QbDBsoiOMFKeqFwdRbSD4mUSSWmPGJsmz5sUhMKl1Qwa
	7g4BOgklfApSU23k8oSSv09fwyHTj3ApfE9RcjSz6I6UzHrAqqcHzZjKjNGrqoFHt/yKAAskKhO
	YOlE7owCjnc5MnQq/GOVco3epANZEACVKxgk0kEUndTc5CkoLwIf93fszF0sHDuuxyQHfCjAuMB
	aeWC5OaExgaHfoaMynOCg60cgKRSRk4JVh7zQutydjbJbMgQx3RRlNa31hOw5LMKXEeK6dPozOy
	KbTA/yzBVT3JgqkufiKP3Ej52RNNfu36voxs9ZxzTVvtS5NYwSd/YjZ5LxN3LS954DR+0XR5Cmi
	orMuT6zZ7FlVluBDSpTDuoCB4wn5hcNt6EOVY6SrdbIUE5KyOfE4/uYbY/AaJ0wss+uA8xNZ6Gv
	4YxHnEfJnZC56Hd3Wny9HNmTVaN3Bbkg96mwY8op6oVP5xHDAgZ3g/apOVsXxWeqWzzCihx5rx/
	RTyCGoxWxlSFMeo/cInPuYh5nOBYeCa6yXejNYrWFMKq8cKfoMJvv+DqA==
X-Received: by 2002:a05:600c:1389:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a211cac456mr28283135e9.17.1792750725077;
        Fri, 23 Oct 2026 03:18:45 -0700 (PDT)
Received: from localhost ([205.147.201.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211bda212sm53656575e9.12.2026.10.23.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:18:44 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: agruenba@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>,
	syzbot+ab91b239b20ae188b9cb@syzkaller.appspotmail.com
Subject: [PATCH] gfs2: keep glocks alive while AIL entries exist
Date: Fri, 23 Oct 2026 12:18:30 +0200
Message-ID: <20261023101830.139094-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
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

A buffer on a glock AIL list can outlive the glock reference held by its
inode. During withdrawal, gfs2_ail_drain() later removes the buffer from
gl_ail_list, which dereferences the freed glock.

Hold one glock reference while its AIL count is nonzero. Acquire the
reference for the first AIL entry and release it asynchronously when the
last entry is removed, since AIL removal runs under sd_ail_lock.

Build-tested: x86-64 GFS2 objects with W=1; arm64 GFS2 objects
also compile.
The syzbot report has no usable reproducer on current HEAD, so a runtime
test was not possible.

Fixes: 864174f97647 ("gfs2: Don't cache unreferenced glocks")
Reported-by: syzbot+ab91b239b20ae188b9cb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ab91b239b20ae188b9cb
Assisted-by: LLM
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 fs/gfs2/log.c  | 5 ++++-
 fs/gfs2/lops.c | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index b55daf1e638..aa5f2a9a94f 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -74,10 +74,13 @@ unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, unsigned int nstruct)
 
 static void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
 {
+	struct gfs2_glock *gl = bd->bd_gl;
+
 	bd->bd_tr = NULL;
 	list_del_init(&bd->bd_ail_st_list);
 	list_del_init(&bd->bd_ail_gl_list);
-	atomic_dec(&bd->bd_gl->gl_ail_count);
+	if (atomic_dec_and_test(&gl->gl_ail_count))
+		gfs2_glock_put_async(gl);
 	brelse(bd->bd_bh);
 }
 
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 341f5bb844b..c4e63fb375b 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -120,8 +120,9 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, struct buffer_head *bh,
 		brelse(bh);
 	} else {
 		struct gfs2_glock *gl = bd->bd_gl;
+		if (atomic_inc_return(&gl->gl_ail_count) == 1)
+			gfs2_glock_hold(gl);
 		list_add(&bd->bd_ail_gl_list, &gl->gl_ail_list);
-		atomic_inc(&gl->gl_ail_count);
 	}
 	bd->bd_tr = tr;
 	list_add(&bd->bd_ail_st_list, &tr->tr_ail1_list);
-- 
2.55.0

