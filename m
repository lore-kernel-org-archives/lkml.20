Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9494A8420
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188431; cv=none; b=akVHGEi1LE43T+s0BUC3Ouk/gXylBp6QX1IRjOdQ+v6Lw1rLMJU/cZmP6zL+1HWWZ6BiKnhAOWpN4IiE6bSeOpcyg4LN7SbpI+qZxfF8RCrXz67nkmWHcvOzXLtk71OtAy/Bacbh5lPxSwfmYg7PgaSL65JD+G+ywY4sw/KaEvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188431; c=relaxed/simple;
	bh=T5//L0yJEU3CVN1o5jxNYrK6S5XFuiGgpBvi0jp/cJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1+wE5f4iUUutuA/N2yzjlMKNClxs/q8+dSvGCYmeay8xNMCvw7Vrqg0PFYS+RKH2pT2WVsMuVuh0NnaAXvmZOzvbccvcZwDPCdqN7lEOpeq09vgI78k0QmqLCK7LmTv+FWbys7WF4d/mcM+V5/ofBDva9IttDIWgRXU3p2NFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwHXeLt7; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwHXeLt7"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-861feb6d61bso16008437b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188429; x=1788793229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ewv3B6+QarCZOHtRgYa+vZ91GvJ2yanwE+qIJXxDYtc=;
        b=pwHXeLt7ZqCYDiNGZxJbgDt5S0lrMpY1WNrVPZ0gMBd1EHvN1FRIs2URmTzC1nBftV
         +E/gOXn+4ncnWTvG8OtQQdYIORFurWSOorqvJIfB1syAWYZCCtJIIqWNSk02M3rdt5yf
         fjPFY0vGV3q/gv8qCSd7ipGWPNFwO71BbAd5oW/tv5T/ME6z12EtRHh0pJTJsvotXXGA
         aucCPfztdXwfFGDauZqv+DaWc2/fPPDFpy8EPaZ2EOjEQOL/e0+PNZ9/RFPCdCL4qP1L
         hbjL9deuCwKvQ5OaiCP/sRb4tPnuNy/0mD+n23XaqskXce1Ks1YMyo0KFVrtwBHogOkQ
         a8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188429; x=1788793229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ewv3B6+QarCZOHtRgYa+vZ91GvJ2yanwE+qIJXxDYtc=;
        b=HXIuqWiFNv7PF3IAAHmmWlJ2qbTcbEcdzlCgRfRRjtF97VgXO0ZnO0KvcUCClkzRLE
         9xrf4xErS8u2xLBlMkNK2YObRC6CxEMhGYwdndzS8B8DJd7fcbB2a3F0BxU/a7JPr2pP
         LFRiZUlxP66QyTbg9WHBGb/EuJDpUNf9Qe8g2u8Ej+V3m1fJKkXtT5ZzUYq1XYNmXXK1
         uwgx0SaDXTBH5GPks0rKOlCjoiRLcCo/bF8PRtZQhmWlgkXlADjeKqkze1X7oZsiS50d
         Hv7pbDVlDtvvVfDOBBe7LJUsgsoyuZlqp5I0D12WEJFAL8M2EIETsOkxmEMQh7FtxKvj
         Wq9w==
X-Forwarded-Encrypted: i=1; AKwUvBzlVx8Iagx0GP+36Dc9QrAEN/ZS7fKf2ySx2UJkTM2mCVJIcT4OB/j6vbn0xegwzJOvAZFYJvau2jhdWnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+VsCQbsbAGTVhe7itM8SlLbiXpBuMb0IEfeNBeqM9O3FKQ0a4
	wqm43KQsUzhiGr2MO9Wa3jKBjZKLzQNZizeMmcyFCKEGisJbdaeHF1ky
X-Gm-Gg: AYBFou2hIE4rqe0L3Uk7gqxB/Oy3dMzXAIdHjRmRPHNLBSaTQaRI+C2V3TGLfJ/HEsb
	Htr909F+FuyE4ubR2dPi+/Rsi5bJER1/qDxwCfqFYEswZQ2YWW9edll2fLhITrLmOSCsySJ/ozb
	p9hk6f/aKesZwArXKfeaD4OIkInIW0s79SONNT98GXMoZRW9CvKAXe0Wzm65mvV98em5Sei5ZMI
	vu79L2c8IvPPG0aKDA0YBmOVPYhrEtcEEe4oY1BB2/I6P4EW9Uil10ggNwyYKYoAoRZOSuXX+Lw
	+nsjHO0WoUpwVsrXIOdaup0BO13+wlq+83ISt/OhRQSUN6B22x9wRC4yWpALYF2HwJySK7tpwSe
	BZ+blC11mYT+7w/2xtrbhlVB4BNHRKx2N9AglEpA8U7GjHTv1jVDmOkgzDnCXN+XgXfqD5zliJ6
	ZLIyeF8we24IkHTnBlSR6VrGPADLH6T1Sh4LmtUjPBvk3o3hd5JURC3KG1Cczqz5zhSgRoMv08F
	RSUV6BqvKyyUK66L24NohI=
X-Received: by 2002:a05:690c:a7c2:b0:822:ee08:749 with SMTP id 00721157ae682-8686ed6877emr7079577b3.6.1788188428958;
        Mon, 31 Aug 2026 08:00:28 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:f6fc:b424:b1bb:6ff0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm53903827b3.0.2026.08.31.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:28 -0700 (PDT)
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
Subject: [PATCH v2 10/15] landlock: Expose the ruleset fd lookup to the rest of Landlock
Date: Mon, 31 Aug 2026 10:58:52 -0400
Message-ID: <20260831145858.3869191-11-utilityemal77@gmail.com>
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

Rename get_ruleset_from_fd() to landlock_get_ruleset_from_fd() and
give it external linkage within Landlock, declared in ruleset.h next
to the other ruleset lifetime helpers.

A following commit implements the LSM kfunc policy hooks, which need
to translate a ruleset fd into a landlock_ruleset reference from
outside syscalls.c.  No behavioral change.

Cc: Mickaël Salaün <mic@digikod.net>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 security/landlock/ruleset.h  | 3 +++
 security/landlock/syscalls.c | 9 +++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/security/landlock/ruleset.h b/security/landlock/ruleset.h
index b536fa0425b7..b58e3d9846af 100644
--- a/security/landlock/ruleset.h
+++ b/security/landlock/ruleset.h
@@ -214,6 +214,9 @@ int landlock_store_rule(struct landlock_rules *const rules,
 
 void landlock_free_rules(struct landlock_rules *const rules);
 
+struct landlock_ruleset *landlock_get_ruleset_from_fd(const int fd,
+						      const fmode_t mode);
+
 /**
  * landlock_get_rule_root - Get the root of a rule tree by key type
  *
diff --git a/security/landlock/syscalls.c b/security/landlock/syscalls.c
index 1d02d57f4c48..cb294a3582ae 100644
--- a/security/landlock/syscalls.c
+++ b/security/landlock/syscalls.c
@@ -305,8 +305,8 @@ SYSCALL_DEFINE3(landlock_create_ruleset,
  * Returns an owned ruleset from a FD. It is thus needed to call
  * landlock_put_ruleset() on the return value.
  */
-static struct landlock_ruleset *get_ruleset_from_fd(const int fd,
-						    const fmode_t mode)
+struct landlock_ruleset *landlock_get_ruleset_from_fd(const int fd,
+						      const fmode_t mode)
 {
 	CLASS(fd, ruleset_f)(fd);
 	struct landlock_ruleset *ruleset;
@@ -486,7 +486,7 @@ SYSCALL_DEFINE4(landlock_add_rule, const int, ruleset_fd,
 		return -EINVAL;
 
 	/* Gets and checks the ruleset. */
-	ruleset = get_ruleset_from_fd(ruleset_fd, FMODE_CAN_WRITE);
+	ruleset = landlock_get_ruleset_from_fd(ruleset_fd, FMODE_CAN_WRITE);
 	if (IS_ERR(ruleset))
 		return PTR_ERR(ruleset);
 
@@ -585,7 +585,8 @@ SYSCALL_DEFINE2(landlock_restrict_self, const int, ruleset_fd, const __u32,
 	      (flags & ~LANDLOCK_RESTRICT_SELF_TSYNC) ==
 		      LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF)) {
 		/* Gets and checks the ruleset. */
-		ruleset = get_ruleset_from_fd(ruleset_fd, FMODE_CAN_READ);
+		ruleset = landlock_get_ruleset_from_fd(ruleset_fd,
+						       FMODE_CAN_READ);
 		if (IS_ERR(ruleset))
 			return PTR_ERR(ruleset);
 	}
-- 
2.55.0

