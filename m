Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414BC38E8C3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324920; cv=none; b=X5IhPKkcs2v4p+6DyqpTseQBy1V4knL+f6Ubn7sCFQa9mDxt1H8PxdJx7h6tokkLMkwXd3Dn4DpsHmr+3MPqAE2Jw22cCAT6db4SQ0gFu6s+r67QD4iaNfZdEvcSHpE782xkUqOmk9cJreqvL+8T0fWJqKDJcllLJk4IYfaBxQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324920; c=relaxed/simple;
	bh=ghQ/9xt8DgBORrjhLrSEA9dJjEGaqnSP7BZJgTBYASA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vr/LBuJX2naiXANloUFlqCTFraSJ1XwniBO7G+HevaGBoNJV3F9hA93owrz1v/0NqizwELpmT3YLI9ZvhkLsdLUnBepXBQLGqqtX7naI4DNMd6Kci5vSU9ec9Vyqq0XmPkRzYiQKJDpLfMaRtMoCWHYwpbQX0oGOyefyGoO+LsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=EVYTsYy+; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="EVYTsYy+"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6de1ca1b05aso767578eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791324915; x=1791929715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3b6Jf8//LXq1nt0lrU3uzCZiYGb3bLhSCGzIPeVAOUA=;
        b=EVYTsYy+IV6MkpLIcZQ/qfzqJgIrzF6XDRBpFNlaX5Yo7wWcvJZ3r1EpY/2bO6J/Ih
         zczCuNOmAnzJj/OoFT7CAMa0lDZe9VwLhoPLEd9uxcwN8kYiHPRgAEsyG+z57o5Ctrsj
         /TnRnSbaCqgwAbBRzFgRWA8s3h/4Ao1JYqyoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324915; x=1791929715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3b6Jf8//LXq1nt0lrU3uzCZiYGb3bLhSCGzIPeVAOUA=;
        b=O3o1wLsaPPu8Hck4TQiqQmsI7C+NsVLPEk7UmH+UF2TNFp3IpiJ3zZymAKc0Hi4BHw
         BDSdu/z254poZoc/4NaB3EC5MG3CAcwlcbyHZD5MMIuv3jwubODOmdlaRv6YCqZGiE4u
         OCfj6MIKxIP2W66KegXoKlSaMH0+s9SkBAfsE6XzCWJ5fo7wM6Lasmg5iNmsmcIn8N8J
         OxZ98L4TXIlCLvdU8ni1r4oPMqS/i5i7VRCKd4I+nr3yGPaNeR9Fj5fl4mhN8SM7XQKX
         xigzqHDfmJzN7lFjtKIvyLoCrYIb517RRSc8KkMnBlAx7Cl8Xw211Rx30YEMa+c6ZJJY
         l0ow==
X-Forwarded-Encrypted: i=1; AKwUvBy2f0uaaCCHQdRJStBjPjLB8T7e+1sRq4l3mB3TBaZHjXFt1UfP+Nf5AGGwVmpTGgDSt4ufypfoi4SdQII=@vger.kernel.org
X-Gm-Message-State: AFuF++lcqdCSXybnCsaAdvolZEIMPp3EoCHZXV1QVoKcdS6NV1ftxwav
	Mx6IuSNjZBzIat96yxC+fCDzr9YCrsElzGvv62VcJ2/77PTKW4otII967IhxR5SOY7U=
X-Gm-Gg: AYBFou0NPOW4hm7firI7UWwlBWYaeQZeJFJ79USZvjal2qTp6W0H7siCK+fhcpAv+oK
	xGXxP66C0VL6dbgxrHzLQkbh8+cUhLwYC4s2crg7LzC3ZWnwqCVM3ws3126bfDzjy5vLTtWiicc
	5RQkltx9/6gC3ImCM+kqC5UTzh5VsuKxbKLl40k+HSDobyDq/dXUFmpyjhIllG4i5Z3nhXy6Mpm
	9O0eR+QjrDiesB8XXspjRjCPi0k8Rk8Duwp3XNl0456WBTDVISJpGH0uuBl/LeeBrplwlrQxrCg
	3IodR2TjMR0EGZQy4nmc52c7mLVuK3ppeFMlsCkkH2627pcrBCi/2MJ++f6Stv5M2W8uqw0pF27
	zPtQLBmgqy/06KMRlI2NL0iZB4nBa/DpxxV0p2g8Sv07MLzvTpCFxdTJkRAIFk0+66Wp0Y5A5Eh
	gpcAg7rCfCtDEeeNCR4HUOPO4bvgqwW4K3PgI16geNBeMyoWJ/Xpf2c8p0tqJRL8Z4bxcrCuJFp
	2dGMrCeW+osNYJuA/4YPonkZF83KsrMXUXNcLcVENLSD4nwK4mZtpGnX0gpYSTXWpp5x1shOjh3
	3sPNKPUxpA==
X-Received: by 2002:a05:6820:7090:10b0:6d9:8fed:b732 with SMTP id 006d021491bc7-6e7a8bb924dmr455388eaf.56.1791324915076;
        Tue, 06 Oct 2026 15:15:15 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2571cab91sm565412fac.11.2026.10.06.15.15.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:15:14 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] exec: snapshot the dentry name before setting task comm
Date: Tue,  6 Oct 2026 15:15:11 -0700
Message-ID: <20261006221511.35798-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an empty execveat() pathname, begin_new_exec() passes a live dentry
name to __set_task_comm(). RCU keeps the name allocation alive, but does
not prevent a concurrent rename from changing an inline name.

__set_task_comm() measures the source before copying it. If a rename
replaces a long inline name with a shorter one in between, the copy can
include stale slab bytes after the new NUL. The subsequent padding starts
at the old length, leaving those bytes in task->comm. An unprivileged
task can observe the suffix through a count-only syscall tracepoint
filter such as COMM ~ "*pattern*".

Take a dentry name snapshot before setting comm and release it afterwards.
The snapshot retries concurrent renames and either copies the inline name
or holds a reference to an immutable external name. This gives both the
tracepoint and the length/copy sequence a stable source while preserving
the selected executable and the existing comm truncation and padding.

Fixes: 543841d18060 ("exec: fix up /proc/pid/comm in the execveat(AT_EMPTY_PATH) case")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 fs/exec.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 819643408e6d..34cf557a17f7 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1279,19 +1279,16 @@ int begin_new_exec(struct linux_binprm * bprm)
 	 */
 	if (bprm->comm_from_dentry) {
 		struct file *comm_file = bprm_identity_file(bprm);
+		struct name_snapshot name;
 
 		/*
-		 * Hold RCU lock to keep the name from being freed behind our back.
-		 * Use acquire semantics to make sure the terminating NUL from
-		 * __d_alloc() is seen.
-		 *
-		 * Note, we're deliberately sloppy here. We don't need to care about
-		 * detecting a concurrent rename and just want a terminated name.
+		 * __set_task_comm() measures the name before copying it. Keep
+		 * a rename from shortening the name and exposing stale bytes
+		 * in the inline name buffer.
 		 */
-		rcu_read_lock();
-		__set_task_comm(me, smp_load_acquire(&comm_file->f_path.dentry->d_name.name),
-				true);
-		rcu_read_unlock();
+		take_dentry_name_snapshot(&name, comm_file->f_path.dentry);
+		__set_task_comm(me, name.name.name, true);
+		release_dentry_name_snapshot(&name);
 	} else {
 		__set_task_comm(me, kbasename(bprm->filename), true);
 	}

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
-- 
2.53.0

