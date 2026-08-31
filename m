Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422E3E8C4C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168232; cv=none; b=GUyG9LjWe5VLAkt6v99jlm+3MfOUk6I+xbihspk02Ieb1/DUNNfGruRdVjPOb7YT5x7xnDaba/0VsGsJAHEi9m256ZnTHeN7N3doHIlD2MqFrW4nz8AlMk4IuXXXRnDHC5WQNM8Qj8ojEfgnvO0noJt026n9E9BapolHmTn5pXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168232; c=relaxed/simple;
	bh=fdI9y3sylK76iM9oY9DbpTJU8s7hpw7GE1UUBVIND9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oy1mG5idNiuV/Z8KyebSg6yT5u/cV661YZ5sLyvFZL62Pt507xsW+icRPjxBpk79MqXeDo9zNYSCWoxnB/hj7D+XrphdCvqoa5NLHbx+/2EI8+GvneiipGzGubAy04gCc2TjYT6PEQPj3K3UEDsvOjj73icTPs+5oGu4VEsbHw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/oeyLUJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/oeyLUJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso10639275e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168227; x=1788773027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zON5T+icRRTPJe/tuLdlxvvWhTEjuOvsxI3luAAgobA=;
        b=H/oeyLUJpdq9rl4eElOKD4dYR+SUsuEaRqbpQGC3OUERqIuAFjsVE3Y9bUN5c6nwvm
         Ne7+F2nJu9bYIODsWN+wf51R7x9rG2lCIw837k4WLnYBuZdWf43IsuW73KTdgZDnnIHq
         dw3I+vcB7jwMAlfFU7thDucKRTFkJMXaHnBbU4ZLQsYHlQnwVfDi3EZELVaFz65VG+aA
         m8mj/DDeuImB8zq2NEMyhWgjS824ddWL96dXuteEKaMIVnENnPuAmMAA1IdzVLGJjsTR
         itS5hQkooW4mTZrPkKDxvrTRRgFeD8xp2WncTuUxELDilzqxwKhnaAv5Z+0joyKz9tGs
         aVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168227; x=1788773027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zON5T+icRRTPJe/tuLdlxvvWhTEjuOvsxI3luAAgobA=;
        b=J4h6WmPSOz4m8xmEHWeXvAC8VUNVGhbjkZS8uTBlc4t+xFoCu+4ZX2T2zWFlocsLgh
         G3dw+6Hvvkr0nB97VnTGBsFy3QMa9MRZ9nyg/MppLwkcNJIXBOTPF/LMYRofevYSDSIS
         UA2V5hc1j3FUgAPM+Cg8+cdXuKP8bJ6N1UMZtrTlbsoDlthiYIj6hP4CNjkyUnhrTURs
         LHk++ufBumGY91jCAZNXq5OXUStJ7RafyGGWIeSioLOoqQDHbEY7uMIxKmtt9p3bJDM8
         Fk2XqE6qnYp/rp5hZiAsIclfXafi5atPHnpOWDhSz+UItpXiDOFhzzNPO6FvZFHTXXmj
         yoIw==
X-Gm-Message-State: AFuF++mp0XaeErER5hj7a8fqUu8aKdwJvKNZgtJ9cITjAzYv1bBLGbfA
	3eRlgvHXWCIZ5Z89FeA6DlRq+pWu3APi0xzKXv2+2ULGmovrWbwFTkws
X-Gm-Gg: AR+sD12KmmXtlXHPB93/BV/XrXsNxIw6K4hbIhMiTRfzYPPmNAKkeBJP+SnwhBwuAwi
	bKcpiiklHHOPAocq25vsEltCjjFhFjwmCU5THSQ9fveT6jpXHnkbOsO/C2BL6SVsVhzvvRReqRw
	Od/g53979AGvABXnZmeOOrYiWwOJe6e3U3olTMO4i/nlJmBBbkmSuyTzOEK9mZnyss95NDvJC4k
	l98y+wuLJj+V1akx85Zwz6Had6HjpCc/lsJiCmyrljUogaiS58tgfnfOrgytlHXJe3pcGfI+cMo
	RDieKFVybqlH5CrducyJ8TvcsClGkyQZo6ilPndo5T7btU73XUjnsBHUZaFmTJccI21IRIJWcbE
	pazuOLN7PK+QOHaCIx+1noKjfbYdxd5homQjEQrtQ6GQlZYpZwhdvabByDFP06EOxWDzR8fYpBj
	fHVi4cIo+9KR7QS/9dcu6mS+9Y9NZo+3DK2CpqGHTZ1bxZynCHEwtOch4uO2m9f8Z5XJ6O8lNLZ
	g==
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr286995945e9.12.1788168227398;
        Mon, 31 Aug 2026 02:23:47 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm318248155e9.9.2026.08.31.02.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:23:46 -0700 (PDT)
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
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v3 3/7] exec: Clear bprm->mm before dropping its reference
Date: Mon, 31 Aug 2026 12:23:01 +0300
Message-ID: <20260831092305.42062-4-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831092305.42062-1-tasos.papagiannnis@gmail.com>
References: <20260831092305.42062-1-tasos.papagiannnis@gmail.com>
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

This is required for eBPF kfuncs where bprm->mm is either NULL or points
to a live mm_struct to ensure safe access.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
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

