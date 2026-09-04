Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188C34CC272
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533663; cv=none; b=Lh4yyqqQMcF0OXHKUpqv80HmkoK8zyIyD9paTUipUJBjHHIdMAXyL+Bop88+a2VZ5LUbBlknmBubL2q7MyIuai4fF5tOkF9YYkadVC2pT4NFhvdVDK0DefIsGzdI12SVKlJafaM+jyiMuQYWYQpjhvCFAt8fmvxkXxGSwqjzLF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533663; c=relaxed/simple;
	bh=H0PjCPTa3w7wilyel1zRSrNHGZqgVebyP6uA3RW6oM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HcSlJOpLxdr28GQx561JKzHd/yOL/d/hJiWXNn/DPkL1NZ2f5iNrk2y+nOsIo0L9o+szNO7jaNNuGb/Enb31n7FjAYfdadRyOLk38KDRFxCQpvEyFkHs8yvO+Huj6fRae/5RMpNUDxnLPe0GnApPLZLZ72Kp2Ux4pByMVNlsBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G14j6431; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G14j6431"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso8919835e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533658; x=1789138458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZ+Ou2H8lPx1TAAGkvNkr9pKRWk8vksitXFvIwQOCbY=;
        b=G14j6431mqz4DH/V6fLP/ifE9EnEVFaEfHlZ/TYMxgQAanNEZh3NoGFfgvHP7ELxN1
         0RKebuZ//BgOBb05xpqX+5IwL+yl7enc+EkkivO+XKXd/t/NUm+cxzD6OLO5MKQpBwjw
         m/x7sE0yQ/k3TZSkHTD2d5j5o6Z5WSXR1Mg0alFmHomBmkNVBs78REEK9soOXubiWJhd
         IwYH58/KQEjnQNHbU5ff3dWpIFijQR+jjpL2C+kb5bPMlma0Atygl/8Xc3VVbcvZCLb6
         nmcryAivqFz1/T3th74mCr7rCnrXPpADzjrkYzIXwFqP0F2iSAOKnFH4+EQemUyGGkhB
         ggAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533658; x=1789138458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZ+Ou2H8lPx1TAAGkvNkr9pKRWk8vksitXFvIwQOCbY=;
        b=RDPtXAZOhyEhXn0EyTuqvxM0mjGrX2UXbg1o1t+l7VbEkHAzJf4t8013pTNqNxGJos
         rYJq/RSVKJEdJifAJPnzIPcXHq2K8gCk7r5t4u0H1VKx7G+qD6lkSA5bMH3pkQ+ryWkF
         adu7fAIo5gc05g3TvXct53PfDZbmEax165XboFcCSFSdaWIpzfE9NJ1eTyVB0VYBtHLr
         DMdQInho8PX8Hl4jyTe0vJ9M6jY63Cm47QOr/7MzJjZxK4tKhSOATQQLzr4DrhtTBH2I
         EtVOQObUNk2WP+cNdc5p5r2Z1bQ56p7zOU540+9aPKZ40RLjCNToz2x++8wDG4tO0ara
         vf8A==
X-Gm-Message-State: AFuF++ll8TCxsTiFflMET0yNXmTFrAhs3bQHJ9bjDHl/s84/L4kLoYQq
	GT4gXRHFvj8SmG/Fxz1RgyRE7iMbk80qu90a9T1xvNOtX9KR6ry5y1Md
X-Gm-Gg: AYBFou0KdK+6462BzTNO+NvjxF+MeTH4jatSPLeTxyl4x2tFeAh+yO9lOyoZX4imdWC
	54ttaWMnady1M8RrioxsN5yLYm/676dyLSeDkA1Pe+rzYKPw2tTPnfGTJvilyi1hf0wQkr8sh0o
	qFiDUXQzKegaSOgKpOLFfg1meUAUdMXmvRVHERqvmbV/X5WkfJPg7UDtwXHd2/iwBC7tFvRudSE
	jJJ86JSVPMONojaXd+QvZySCnYawsPLTDuJd+jEk0815bza02H+0+CyynJNPA09X8ACdgAa+QJV
	yHCImmcIxrtlxAtF727LBmF0cTb4GD/uyGuAwLNlJiL43x9xBIMzdY13Q3h68HUjtJQm8M4wL9g
	11EA6ZrFfQ8bjnOIaNqkVkt+s3O18T+mpGACdh5T8hp/qQh3ahG+l+Ki+oY3kQYu/57VrK+RD7A
	xhltZyuT46v89q3/DigdNvJ+eDsbl4MlFdIUgOTNrrWKHa+t9dtv6LS/nL0hTMudLmXK2qLuPdI
	A==
X-Received: by 2002:a05:600c:310d:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cf81e5449mr69837005e9.3.1788533658417;
        Fri, 04 Sep 2026 07:54:18 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885cb03asm6802799f8f.37.2026.09.04.07.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:54:17 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	song@kernel.org,
	utilityemal77@gmail.com,
	sun.jian.kdev@gmail.com,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v4 2/7] exec: Clear bprm->mm before dropping its reference
Date: Fri,  4 Sep 2026 17:53:35 +0300
Message-ID: <20260904145340.40212-3-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904145340.40212-1-tasos.papagiannnis@gmail.com>
References: <20260904145340.40212-1-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once mmput() drops the final reference to bprm->mm, the pointer must no
longer remain accessible through struct linux_binprm.

The successful exec path and the bprm initialization error path already
clear bprm->mm when ownership is transferred or released. Do the same in
free_bprm() before calling mmput().

This is required for BPF kfuncs where bprm->mm is either NULL or points
to a live mm_struct to ensure safe access.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 fs/exec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index a14f28b15607..4b4d8f0627a7 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1453,9 +1453,12 @@ void bprm_drop_loader(struct linux_binprm *bprm)
 
 static void free_bprm(struct linux_binprm *bprm)
 {
-	if (bprm->mm) {
+	struct mm_struct *mm = bprm->mm;
+
+	if (mm) {
 		acct_arg_size(bprm, 0);
-		mmput(bprm->mm);
+		bprm->mm = NULL;
+		mmput(mm);
 	}
 	if (bprm->user_ns)
 		put_user_ns(bprm->user_ns);
-- 
2.55.0

