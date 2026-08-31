Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D096E503BEB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188460; cv=none; b=hOMQloEqQJJIYTIWHYsylDHCqK9EEuaP64VT7LFthzP7BKaC/pm4keApIPG9elhuS6DC9ZGHuEjNEKIgoYGhoEZTqYl+SGVLs3Ek15yQuuRPcUGPDRnSUtMsXaqjdb2XuFUHybNpwvRuNf35MsKc2mAZquMLNZ/RFOEu2W6UyaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188460; c=relaxed/simple;
	bh=WptSfOqEMNBmGXPbTwBGhZeeMOjidJMhs+vE6dbvvzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbg21CtLLpU419jrGM+HpnjrhGOH6sv/yLLgydR2ZE4fPrt0CDBYFOErd16CrWdb9yxhoLWpjMDzSR8p9RdgVVCQmjb6TF85SiDYPmzTIITpYorgcmFpo8auLt+bBN/gW1gUBeezGNaP73U64+QSHJA3UxOKyR7/Jev2Jsx55lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdR5VD8i; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdR5VD8i"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-867a943b149so8584547b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188458; x=1788793258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P+ivS8VeeEbj61xzPS0u7NgZI1YqhiDthhnP+E6PAls=;
        b=qdR5VD8iNcuRx462EBfWJeyu9x0tUaxVsaqQz2xAiVhTvDSQIpM7/pmzrnUU8neMFL
         YB4HR3mtnwD/I2GaMDdu6y3tnVwTlP5RgSdsFD5iwnxYHWjz8eZU8XgaMso3ZYlvA4kj
         FsfD014PI8/5djnkc/5jobgKsGtbpz1YZkaQ7PnoqsvguMfecefjNBBZzjC7UxNILmLe
         w+n8IkIHZRmk24UTzXLjBWIXTedT+fdu6JJc6xBbgZyKLDPTnXTP9HuH/x4ERS8jPVHW
         54o/elhfn4l10v0XQv2/TeCrht1jl8WG69jGmgsRqqXXU+yyZniYa3w8OzmgChTiDDoE
         JY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188458; x=1788793258;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+ivS8VeeEbj61xzPS0u7NgZI1YqhiDthhnP+E6PAls=;
        b=tG3aZN+GROOLxgi9QP1ovYf72zmNa1VdBdt9ijzfbMe1Pq5CGJUj1y7+TnWqvupC04
         hX34kiY+nMEdhTFIzWm6Vap+qNkbBTDRqsdzDCbIDyt+QgzfExXNbOrdp0ZRqPXc1BKX
         iGLal5hEm+oMthzIqTv9DCPIi1/naWisqv35aoAge2r4jayCrNBuru4cF4v0cVvvoxP0
         PHGeMga9v4OXjMUgpElF+4Zm4qapwBBKpfqPU1KUvk6mE/qQRQQo4a2eVgQz7fC5QzSw
         +stJNud+QNf21ZoZucG3GJQoOfpqEX8hb3kOKXOyDtJoXSZD3naYI6SiM5l0LBpXYZJ4
         HrfA==
X-Forwarded-Encrypted: i=1; AKwUvBxCQq30jKewCgwX0bh2JEj02m0ROwoPN6k1ZL2R3QIThKAx81ZaSl+FO0TfctvXsx+oisHsNgVAP4588T4=@vger.kernel.org
X-Gm-Message-State: AFuF++kV+BD0WYaiqwLW0eISmglnKJaV8ouqsTp3zyVKlbtpkvBOiPXg
	/bgsm0+ZZTfAVZNApERIcYQi+HLxIIlPiPW2tAJfkuQMz6+wms1INW5c
X-Gm-Gg: AYBFou2Tbke9alngg+HBIEmsx/dcd7Po+Z59h29ZPQm+GCULASD5cczd1DXCkzRvnzI
	neXTnQ7BPw1lCDT9vAeYy0zHR8ra6nhmCt9QYn3XbR4aHBfvZ3ewQNY97R6gl4XSUXBmsgqk2FC
	8Y+pN4irb/fGquth1tcKNK2dFOYcgFrvXc9QEKP091NVXRfJagSSxT1bbNYU9/8zy4LJ5L0OA1p
	KNxwODb89HiBeYe8U+EwhHTFrvJWNma6kKDtA4btMdtFSVvUsJ7YptLBV8okZ3Lz/v2KONsUV0w
	4kFWQukkLJskokpiEegYieysrlSSdcN+IFZcxcXpTALKtXLDf3XvD2yy/KiJBjSRSB3pt/7LW4Z
	+eYgBT+/NZqvO7lpuwDPie8N1xDezO+nJSpxmYxMiwuY1JXok2/2CHi34f7JMshw+EhPD9L1rGV
	VWNOyrO9q+TwFixpG+uwOn6AJYUoWw7WerAJ/AmK8Lla09ayZBqqXK+Ip2H37EaJpbaWZDSdwmN
	mvI6wzGwby17KLiP8iueSs=
X-Received: by 2002:a05:690c:47c5:b0:81d:edf2:dad8 with SMTP id 00721157ae682-868726e607emr7223467b3.22.1788188457650;
        Mon, 31 Aug 2026 08:00:57 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f6fc:b424:b1bb:6ff0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm53903827b3.0.2026.08.31.08.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:56 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	paul@paul-moore.com,
	mic@digikod.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	kees@kernel.org
Cc: gnoack@google.com,
	jack@suse.cz,
	song@kernel.org,
	yonghong.song@linux.dev,
	martin.lau@linux.dev,
	m@maowtm.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v2 15/15] landlock: Document the BPF policy interface
Date: Mon, 31 Aug 2026 10:58:57 -0400
Message-ID: <20260831145858.3869191-16-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831145858.3869191-1-utilityemal77@gmail.com>
References: <20260831145858.3869191-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Describe how the generic LSM policy kfuncs apply to Landlock
rulesets: the program-side flow, the staged restriction and its trace
event, the LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS semantics on an
execution, and why the bprm path carries no no_new_privs/
CAP_SYS_ADMIN precondition.  Note the new emission point in the trace
events overview.

Cc: Mickaël Salaün <mic@digikod.net>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 Documentation/security/landlock.rst     | 38 +++++++++++++++++++++++++
 Documentation/trace/events-landlock.rst |  5 +++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/security/landlock.rst b/Documentation/security/landlock.rst
index 2d6e1076484e..ddc0d149ae8f 100644
--- a/Documentation/security/landlock.rst
+++ b/Documentation/security/landlock.rst
@@ -130,6 +130,44 @@ The reasoning is:
   restrictions, because access within the same scope is already
   allowed based on ``LANDLOCK_ACCESS_FS_RESOLVE_UNIX``.
 
+BPF kfuncs
+==========
+
+BPF programs can apply a userspace-created Landlock ruleset to an
+execution, through the generic LSM policy kfuncs (see
+Documentation/security/lsm-development.rst).  A syscall program
+(``BPF_PROG_TYPE_SYSCALL``), running in the context of the process
+that set the ruleset up, acquires the ruleset with
+``bpf_lsm_policy_from_fd()`` and typically hands it over through a
+map kptr field; a sleepable LSM BPF program attached to the
+``bprm_creds_for_exec`` or ``bprm_creds_from_file`` hooks then
+enforces it on an execution with ``bpf_lsm_policy_apply_bprm()``.
+
+The restriction is staged in the Landlock blob of the credentials
+prepared for the execution and committed past the exec point of no
+return, so a failed execution leaves the calling task untouched.  The
+commitment emits the ``landlock_enforce_domain`` trace event (see
+Documentation/trace/events-landlock.rst).  The kfunc flags take the
+``landlock_restrict_self(2)`` flags with their usual semantics, with
+the exception of ``LANDLOCK_RESTRICT_SELF_TSYNC``, which is rejected:
+the restriction targets the execution, not the calling threads.
+
+``LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS`` makes the executed program
+start with no_new_privs set, binding it and all its descendants.  It
+does not affect the current execution's privilege computation: the
+bprm credentials, including any setuid elevation, are computed before
+the flag is set.
+
+Unlike ``landlock_restrict_self(2)``, the bprm path has no
+no_new_privs/``CAP_SYS_ADMIN`` precondition: a task that is not
+no_new_privs can carry a BPF-applied domain, and its setuid
+executions still elevate while confined.  This is sound because
+attaching the BPF program is itself privileged, granting the same
+power as the syscall's ``CAP_SYS_ADMIN`` carve-out.
+
+Executions may run concurrently: each takes its own reference on
+the shared ruleset with ``bpf_lsm_policy_acquire()``.
+
 Tests
 =====
 
diff --git a/Documentation/trace/events-landlock.rst b/Documentation/trace/events-landlock.rst
index af9267cca47d..6cec3194af0b 100644
--- a/Documentation/trace/events-landlock.rst
+++ b/Documentation/trace/events-landlock.rst
@@ -34,7 +34,10 @@ Landlock trace events are organized in four categories:
 - ``landlock_add_rule_fs``: a filesystem rule is added to a ruleset
 - ``landlock_add_rule_net``: a network port rule is added to a ruleset
 - ``landlock_create_domain``: a new domain is created from a ruleset
-- ``landlock_enforce_domain``: a domain is enforced on a thread
+- ``landlock_enforce_domain``: a domain is enforced on a thread.  Also
+  emitted at ``execve(2)``'s point of no return when a BPF program has
+  staged a policy on the execution (see the BPF kfuncs section of
+  Documentation/security/landlock.rst)
 
 **Denial events** are emitted when an access is denied:
 
-- 
2.55.0

