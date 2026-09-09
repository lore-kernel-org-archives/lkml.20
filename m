Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE9A3AB5AC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982697; cv=none; b=XqtBzLXe2nEyU7AZwAZ6hve3Eux80gYIJtqrPQVueZeKrLe1Ie2f1sQZepVs3L2wyCXyN/XrVuO3E1g3Hmm+xZ+trQye7sRyJooDIrSEW4rAQt93aeHwY2DId6cqI7Zd/Xj7gQD6SBCTbF3y8tyQZ+P0kUgJK+cHQYNscQ9ycUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982697; c=relaxed/simple;
	bh=Rd/Pd3Leo+E3YU6ucU4gtKFQXVKmN2yo/RXforbd1n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lTdvRPArUTikW1eEgXvWZpdOxO+7HFFGJd1ASd4VrUpQy8kqMEMAnutSe1BSv5OdSxAtN28aP2jGe7IME2mz9Uvv30pmwdFQk2tVNDGdYvGOuN1+ulkQlnSyM5EOL5PTFKcM4mqdkuB5Q4Dk8w9IuSjJlViPNtZHZRrHxE8NSaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3kK0VBE; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3kK0VBE"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8588583a7c3so67386997b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982693; x=1789587493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=os/pHxblfNO+1KqvqowSwfs/2gIGC0QX3UM4Kl6LzkE=;
        b=H3kK0VBE6GSq1egktkw4gh3qWBPWAIz0pn4FXTJACwpoWKFfEVs4k0mwZWenVfvHBv
         VRcbGOcpogc6z0kwCpop6taSb3Qblqkxve/IBAiyAGkddfSMAZ+Kth82G3udwfQUCJKP
         sI6E2ukVrqoKAVDI2VkPdoGKgoiJVHmnn9qm3Qhy/h9URxHmP5YR2YqSIt3CBi3HrXw1
         Re+hEkQPCr3apnonPNQ9P7d2XDYK3WW4D/UwzIGbMaVsElNvtBRcvjE5rlKInfrcbab8
         tvYd4V5NOITqQRIYjUKWyc2k2U0iVlfrdVIquB3GVeUlIJm6YmimjRCQYBqebUlXt5AL
         Xx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982693; x=1789587493;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=os/pHxblfNO+1KqvqowSwfs/2gIGC0QX3UM4Kl6LzkE=;
        b=lVDsDKIjVUTq4UC9WcOkLfuf8yqx5HdE7msaO94BZEH3aD14YtH1tCCBl8xtG+/Oyy
         jjoGS9qJ5r/XPG6R0UZ8NIiSTfzl8LQtC9QmyqNuo6Io194CoPGTeVD6Ou2DCSXrBOsA
         nDNNptFvWqhOxz+1rGgPuruEp5wj8TMByKa7dvNOtMY1MXfJJKbzeAPFJYNDY38OUtvO
         0XhdIxzVkcarDQ7ZsFxzxMJ2vupOZZ/wZ5rxYkL5HB6FDlfkMBXo+MT2Pl0wFPY7MH0R
         j49AVfE3pn/ttacKCnmD/H5erx6p2PyXihQ3HPHdeWqzaYh671QdV5s9zFLTuHjkVARF
         z4Cw==
X-Forwarded-Encrypted: i=1; AKwUvBywWC1rcgjAORToV6unmSEuL/IP6/sTXLvY8rOzYYnKakmyyeMwM0qW+ZIycAhaeHk+FL3QMfQ0j6Pc2Yo=@vger.kernel.org
X-Gm-Message-State: AFuF++loOUthcBOhfxuMSzUdYDH3upjfeSb7RvvoG7K+PavaapEZrl/c
	jvUPmdp9xKKsecer8RPRAU31d32iYerQduo4tgfgRADZ+oaSSlTZCs11
X-Gm-Gg: AYBFou1ouVpo6eyRtkKUf9mE9eg01sIXWUJXilptoIM3jiICR/hUscrhAoDmPvIPQRv
	z5oEr5k24xgQBqppyVMkGJsyiS0c+WCn9JoWTk+HfEJkpr6/SWyL4R++JLNKlFgz41DuaU1f/Hh
	6iJHPhOJ4lBoD6J0ioNGPOwsKWmu9kwBlXKr3xKbDKA3kx4pQaBaJR79gsbVH8wBFSZjKt+i4Le
	ebzDy9Hfeyuxff/by3ndp7NwfK15A6g26IzzcReHMykeNjdoS6NoyS+yfnJftoK0EP33EnCCSEf
	Wlcjhu3ifJgOCx6LWx9k3yRGfOMz+lyKMA/NjMmqJCqOys4OokZasEB5uOWLaH+VKpjYgAxZur/
	CxB+JyHitl5I7Bg/mVbSaIZFjoqilaDfqhsxscQlPg8mdykbBIKd0sMyZD8v1yfGPQ+GYD6AUkw
	hF98I4Eta/u9SpbQb7vjNxk0kmg1s3hPeiMPpmrIEkl85ZgWHd/aOts9Bcdrj5osk6D6F7QbXud
	8Wk0WiMftVVpTaXFxx95o3d8V3pitQz7Xx3rtL0WrI=
X-Received: by 2002:a05:690c:9:b0:87f:bf8d:3377 with SMTP id 00721157ae682-87fbf8d35efmr29761407b3.63.1788982692601;
        Wed, 09 Sep 2026 12:38:12 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:bae:bfc2:7e96:e5c8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493155d3sm115277577b3.16.2026.09.09.12.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:38:12 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	paul@paul-moore.com,
	mic@digikod.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	kees@kernel.org
Cc: casey@schaufler-ca.com,
	gnoack@google.com,
	jack@suse.cz,
	song@kernel.org,
	yonghong.song@linux.dev,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	jolsa@kernel.org,
	m@maowtm.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH bpf-next v3 10/15] landlock: Expose the ruleset fd lookup to the rest of Landlock
Date: Wed,  9 Sep 2026 15:37:13 -0400
Message-ID: <20260909193719.518517-11-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193719.518517-1-utilityemal77@gmail.com>
References: <20260909193719.518517-1-utilityemal77@gmail.com>
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

Notes:
    v2->v3:
        - No change.

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

