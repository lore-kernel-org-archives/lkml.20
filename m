Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665352;
	b=WkkHuZThK8AoS5xFM584BpDWa9i/CGcIUysi/SL3DURFL0HTconG3kkTmdhiwKxNsvHz
	 BsP8w/yfTRo8iB2PDz52F0MA48sBkR/UmHdJSEsgnsy2aADpHitCVr/rFDlUp9GOW/kTy
	 P/Oe9SYvDBb0WrhAmsmsXRPaqPR5BEVoXgzcjUhmu5Nma+HTr84uJ9dqdFXU5SFsA7Gmy
	 r0y5fbaFQGFO76eyiR+uq/VZ55CMUNoqM6t3O7MZ89EyujOPYyeeyPG7EJywzjo8NiY99
	 ytPuqVX3L472VD07vfu3qBH2BUHMfAlN7MVljALLS1Njv+TbBifvmnkrMQHJ8n3YPkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gDbE7ZuFqAKZjgxEyRxAPTBHYtB2q95PfpD2xmbuaDw=;
	b=1FOfk3E3BO8pQdrC/HhwHPRe/D7IroQCnlTKPlV6tkt/QpL5+4VooxhnO76jXzvW8UvA
	 KBQM3D14FW38mhB/SJJZ4mCm5nOpqHt7si7TixChy4ZhKkYwescyBR0bw0QBTGWHpdtct
	 s4fb5NGXMtySPy+HfKRaOKRbvESIGUeEJu0zp8Ww53PTwJL7eWgUZEVhUGIbaRIxl4y/A
	 3oMAea6YF1A9BvgtQ79eXgqRTrY19OtzHYgamXBQTNUnEXNMaKOX+jhEQJIpVY+X81E5Y
	 nRZaqb/lAHs0ucffxmtDVFGr7kItgzPeRpSzJ1Frb73IJcoaCchk4WykTFNDy+ZlVUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFpHnvk7;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE9606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAE9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFpHnvk7
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cb6dc850c7so849159137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793665350; x=1794270150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDbE7ZuFqAKZjgxEyRxAPTBHYtB2q95PfpD2xmbuaDw=;
        b=uFpHnvk7ZYtJnUT37Bcn58M77cje5/IRts7xsei3sjEKc8ph3NBOCnbgIgu0Te6Vge
         VNNgndgC3x4mZ0gfWVu50lmyMMdd5u2WKrBEXdu0B3tKXXEEKS6An/jd3HoNkx3OeSuI
         YZGhA+vW5bctEc3ooRa7yRimxXGylv7z3nG0xL2yyhSjAgVg7MXx7UTeUlloyFam/4hq
         r/aSyh5HhRg63iB+95oCIB9nsEAASuSKYcH+VSchz0IAxRkjbIumnPZwuEuS4ZlNoah4
         OWp7e+DonWN0laoS5cQw1kaNAi/rsW8P8dnUmHs+fDNZy5mX/GmU+odE++88mgi2+RUA
         YaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665350; x=1794270150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDbE7ZuFqAKZjgxEyRxAPTBHYtB2q95PfpD2xmbuaDw=;
        b=xEjw+uFZl1+AEqR15HTRpRhY3FNaS0rIVDh0PpDZcybReHtMOaJK9KPy+/7EJ3U075
         mlCoRbRqOLQApD8y4W72pt7Rvwbe9ADYAEezNU2gMI+Ta7h1o/mC2+KLadOZz5UjMgqr
         O48Nsw5Etr9ez34VxWOSO9MhRKE7xWCE2HdTmLpQOGtpU7GOvtIK0olFHWLEWJ2EtDz2
         RIyGQXisvsRwi9sGn7ie4acgo5Hs6j86RkIJr9LCC2szi5y2WB9W9TArnP55TmPO8EIR
         +x7A9KFY5kLLcMfK5fjjXG20DQ5Ztb+8ufimueQw/focsarbvPMOWIgnvdxCYtQD/daK
         Oiog==
X-Forwarded-Encrypted: i=1; AKwUvBzWJli5IAxbieyrm2LabWQBS3wvJW46q8ELxQzTVXY4NHG1+HZkl+GYyPI/6eFSmAN6bJDTXRlcWOpTsws=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vytC8e+QgNQiUwwRv/mfU/ZkfK47O5WBe6+dJlTvgTpGgz6nC
	Ey40fCC+QqOCtAHzdmTFYU9e1jyDUY5pqBqish6GHfBeK+QD5lcAdimi
X-Gm-Gg: AYBFou3fSwo3SLrQ0tS4s5qY+niOro1IJz/EhaS/SEQq3OxQD+mAYP5oAz9Qa4V3YCH
	5NrAisW2T48npsf9JkvCclXThktttEVlXj+bJVzTWdb8STB4QnSrmAlh3uxng4yOpjcPny78oMx
	0kpuIRO9ChVPy3L+LEdWwb8GD5hpFuFDxE8xTM2XuvxyeQiPB5NwIw7UyLzOm4qJI24DpbXtAJP
	roz71/8kVJ9ZdqCCfVyEqZQz/NQr1PS/V1Q4pPrOsJklWjb48ZkHOgnY+jtQ4a6udPY7VOmz3GD
	usoIthrVaVSVSHVmB4Mv4detpYVUmBX3uoT9aciAjgIXcwvFBCDcW8KVkXg8An+1knTYjRNWgPJ
	Hc65ZTG2X3WCaSnT2EwtJgXjXXG62SSes7yvhxDIQdD2kV/PFwRrTeM9gbYL8OLLQYoSQnHvFZx
	bVbUaogvU0ynvJR3pvyCS0DA77+W5nbLDUvggFfqXmO5grSfsYBsT0At2ZpEulWHGbmuGHbNjqy
	Q2F4DCmFUH0lCCiFh9cjogNiGeFVylerjU5SqlsX6QJ4CRftNR5HmCSXSi9j/fxmaehivJNBgHN
	NhNop1sKxRzbG5UtIlXNWGA8lh8v+7nn7MN3yHI=
X-Received: by 2002:a05:6102:3e84:b0:7c3:9daf:f949 with SMTP id ada2fe7eead31-7d072658ceamr4113731137.30.1793665350135;
        Mon, 02 Nov 2026 16:22:30 -0800 (PST)
Received: from bridge.. ([2804:14d:ba6b:8339:ade5:3173:4b5f:f40d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec76ec2e49sm8580338e0c.2.2026.11.02.16.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:22:29 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Jann Horn <jannh@google.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Subject: [PATCH] fork: Don't let copy_exec_state() fail before rt_mutex_init_task()
Date: Mon,  2 Nov 2026 21:21:57 -0300
Message-ID: <20261103002157.219277-1-christian.aurichzm@gmail.com>
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

Since commit 6b1c66c9cca9 ("exec_state: relocate dumpable information"),
copy_exec_state() can fail before rt_mutex_init_task() has reset the PI
state that dup_task_struct() copied from the parent. If the allocation
fails while the parent owns an rt_mutex with waiters, such as a
contended PI futex, free_task() finds the parent's waiters in the child
and warns with CONFIG_DEBUG_RT_MUTEXES=y:

  DEBUG_LOCKS_WARN_ON(!RB_EMPTY_ROOT(&task->pi_waiters.rb_root))
  WARNING: kernel/locking/rtmutex_api.c:538 at rt_mutex_debug_task_free+0x7c/0xa0, CPU#0: repro/75
  Call Trace:
   free_task+0x34/0x80
   copy_process+0x5e6/0x2550
   kernel_clone+0xd7/0x420

This also turns lock debugging off until reboot, or panics with
panic_on_warn.

Commit 08cacffeef8f ("ftrace: fork: Initialize function graph state
before copy_exec_state()") fixed the same problem for the function graph
stack. Move copy_exec_state() down to just before copy_creds(). That
restores the order from before 6b1c66c9cca9, where copy_creds() was the
first step that could fail.

Fixes: 6b1c66c9cca9 ("exec_state: relocate dumpable information")
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Reproduced in QEMU with failslab on the task_exec_state cache while the
    forking thread holds a PI futex another thread is waiting on. With this
    patch the fork just fails with -ENOMEM.
    
    Based on v7.4-rc1.

 kernel/fork.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 8b108ed37152..fc12100e24d6 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2147,9 +2147,6 @@ __latent_entropy struct task_struct *copy_process(
 	 * free the parent's ret_stack.
 	 */
 	ftrace_graph_init_task(p);
-	retval = copy_exec_state(clone_flags, p);
-	if (retval)
-		goto bad_fork_free;
 	p->flags &= ~PF_KTHREAD;
 	if (args->kthread)
 		p->flags |= PF_KTHREAD;
@@ -2177,6 +2174,13 @@ __latent_entropy struct task_struct *copy_process(
 #ifdef CONFIG_PROVE_LOCKING
 	DEBUG_LOCKS_WARN_ON(!p->softirqs_enabled);
 #endif
+	/*
+	 * First fallible op. Must run after rt_mutex_init_task(), so error
+	 * paths never see the parent's PI waiters.
+	 */
+	retval = copy_exec_state(clone_flags, p);
+	if (retval)
+		goto bad_fork_free;
 	retval = copy_creds(p, clone_flags);
 	if (retval < 0)
 		goto bad_fork_free;
-- 
2.43.0

