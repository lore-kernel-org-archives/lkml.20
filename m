Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73139EF2E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459416; cv=none; b=QUUpcdVB53E9IuR+oX6ySyCJzTHoSy1FJGkWKyVd8IO3//T3YJ9JAYD7RJ5Eicfe68y6q3JvuckI+Aq7DiLyDnDkzubfz3LkBg4/AWpOAY4mzHsKgCap3FVhGlWUWZhOVOUsiBT5LfBWfZSo1W7cYUpUrrWn/hUb5wYDqLEnI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459416; c=relaxed/simple;
	bh=oxBm833C8T+jxHgAdbU6D4xcv4E4TYoli1xZPpTW0yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=joSRe4bbjJBL5hTqZ6+5H2z7OIH+PWwdb4lY/07U8IYedekVz7/N9w+9eao24zA1+vwKXUV3N+LDnhVoFpbddY33iSm+73WYDjhbV2OVDklAItFpHFPsDL/Qgo/g2zYEtx10eltRL5f1B2X577ZuRD8kQ5j0VEcLG2tZC581EHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWvY3Oh2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWvY3Oh2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49e6b280cadso36587205e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459411; x=1790064211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcITG13Gvl8i0HA4g724jWVmnWns/ceZ5ECxTEaQlok=;
        b=IWvY3Oh2hOkMZTpQDhBFLKNByCuBv/M1AtXa7HF///XG3qWAO1LqR35wT2PSYQeoQc
         vEY8/T6TtINWfgTX13h1Cz69IoQTyhrgMs/yWzpTgCg+5F98c0Ap+nX0Jg2PLuaFOrK+
         kyqF8IeofK4zWbLMM1jzkq6kx81NW76Y/3EZ6M7Yg9TLAQgD7/RsU3EG+Wx+gWmXtvX8
         lU5Wus++LBDpryNqS+GZnkpWkbv3u+/z0QryXYrmdiKCbcZ+KDKvoZhfTR4xzukVgJXN
         dBEvqEMDXm1ft4qulXaJDm8KopcfZQoiajqFcsrA8qQtDq2AdDGa6VmIy0rAEdPKYCi2
         3PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459412; x=1790064212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcITG13Gvl8i0HA4g724jWVmnWns/ceZ5ECxTEaQlok=;
        b=GAg7ofmYfx0vHs0VYnU/heBPHaaLJ7lIWH+08bY33YZcKonaMsl2KO833SX5nmanGI
         D4dx+G2DrCegyzV/3x9u7obX1Ss+qvk5lAviNtTiWeDoqkk0ON1yblmr8OUQNSrzIWV2
         0jfQV8YVzDfQh5vuCsZaDKv1chmhb1urfBX9glLyW2ir8jCvGDdy/LCezLb8ITfActZm
         XPUEV0BT41ty9Qn3aTLjuaHTz2F4z+jxjnkAExwNfUzsL+kumGWuxAU1497ikWzfhbAk
         YPWSzhBhfDa+Wcw3jWvCuzl6jfe16Y5uVXRBD7g9PvNE3opS4YwSW5mXpAo1Bfl9xQie
         hfSw==
X-Forwarded-Encrypted: i=1; AKwUvBxwIUtEZb3ECFi03muBhIjrspU7blMx6AMuJ1nBRzEysh54qYE2NpA6oryn8hZ3RiGK+TR8vWudLcozPxc=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ66RLEjLTck/ZiyKUemAyOpwE3Fwzn57C0M9vJJCDAxYmySCn
	Cv1cDMws11D4d08q/ojrlrX2Ku1u0McIFCLq1/nfl+iyB7pqqfilhf3C
X-Gm-Gg: AYBFou2rY5aeQ6a1mj0jygtBdf64wRaXVDDoRYV1tHqlmyTpnGcW6FpaDx3kk/v9fuP
	gqBWR8LmnEd3DdRN7I4OMLuGtBTi9aRKDXqak5Gc9Tkp+HA8xPZi4WWzV5aXKNda3YzforL1jvI
	6O8CjuJE9INdX8sZgc0o7qqtAOhxhq8hJVVLnB9yscmDhbc4tghF1dxyJiFEoxvyCdsypTh3UpI
	h7yhIS2lZT9ywdrNxF57fGxUI8X0zSpvWX9RQ5AaoNuOIxwI99dnwFYcclOABHIHk3X5uthfOYK
	yVbSJfjmigVsJC99z5dpmRCEszfttBQ2hdQ6Alh+wWRISNIBjiwH//lOPu5dE684z1bsE8gjSZI
	3TDwIGRv/3A02oG7cl/2ROUq0DqFBo0lc1kJTtD5EBGEd+UEgH+QBkpTLG2dJk9kZRuPSN1O9/i
	kvBT1AlWcxehcGQEJZ7UqCeZincXJv5hgGCGeciuAHCE/b8MkfmwPUnfnoXg26H6frNe9GDs8Sz
	XwQkKCH96rW956973cy8YxVmus=
X-Received: by 2002:adf:e19c:0:b0:487:939:23aa with SMTP id ffacd0b85a97d-487093923e3mr1057036f8f.10.1789459411449;
        Tue, 15 Sep 2026 01:03:31 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b4e:8500:290c:210b:1c76:5710])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35c071sm33764675f8f.33.2026.09.15.01.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:03:31 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	andrii@kernel.org,
	ast@kernel.org,
	brauner@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	kpsingh@kernel.org,
	ljs@kernel.org,
	matt@bobrowski.net,
	memxor@gmail.com,
	song@kernel.org,
	sun.jian.kdev@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v7 2/5] exec: Clear bprm->mm before dropping its reference
Date: Tue, 15 Sep 2026 11:02:52 +0300
Message-ID: <20260915080255.48929-3-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080255.48929-1-tasos.papagiannnis@gmail.com>
References: <20260915080255.48929-1-tasos.papagiannnis@gmail.com>
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
index 745f6eb5279e..4ddd403fd91c 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1456,9 +1456,12 @@ void bprm_drop_loader(struct linux_binprm *bprm)
 
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

