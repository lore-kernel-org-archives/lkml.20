Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975311;
	b=zFYrmc2LrnpH7We/DiHDE3sxgGiUK9vIDibcnVqHYDgrGMs3Z7toDem4zVPU3Gl4msor
	 lwpfQBIj9cAqG707zgxgj+pjB2XfPsFOVxC7wt5BlhQ5jpDAvBECiqCZL8+6yJZjVxyYF
	 p2OGokGzmTytUNKb0jZtVT7DbtNLS018TUkQvD9sD52rRjnvk+e7ncONgXsuJjNcP/HCp
	 0kw62m/jtGSXGF+dJJ5pctPuBWZhiF1HD4fgAVfnUmu8lnUyjN/m8bIKfng0gxTVuE8E1
	 YmzsEo4ohn+GKegQXdbakiFL2at8vIUwj6qGkAuKiWYOpESO2EvrqMit0hM4GsUKlYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xi81y1XZW609wk/sWs6sIq2iQGR+N/bC4UAGbPKuq4A=;
	b=4mStUjEa/aLi581CJUpmgGZQIZ845x3yD56QcqzENJcrcCIo31XPw203t3NtiePwxdE0
	 KhL612HSVWng0N5yMazn4ho8pECRWxEYmSyDilWUa+LAPy0lVeaXJqaDfTi131OAj12LI
	 NpZIa66QTidPi3J2rhQhFoIIGdUJuntjB+ksN9Ag4yNROheOwAdSkU+xihoTD0rnVJC8W
	 0eCD2M5IzOlgG3debKKmPM27xzeo8PzVMVgd1eUfGUdzLxHXN96z/RKygIuj93z8JecZ5
	 /Xh+/GgFbzjDkM3ftvxNQY7Xp07fDS8MNvhTKrVnNwFdvwuK5eZJslQ+uX/GtrS0n5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNYKqIju;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9912606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9912606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNYKqIju
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a089dfee18so1037403b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793975310; x=1794580110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xi81y1XZW609wk/sWs6sIq2iQGR+N/bC4UAGbPKuq4A=;
        b=nNYKqIjuEjYDx86pC7gLB0wWbCMP9LeWFfMYAVHzNUuU/cQ05fgm3jn6d3knZMEAkl
         6NeW6BaecfNO0mrlQFVYHb2m8dLyginJlZRTPDeWO/3W7JSr6GW6dJzXIAei90z5+J6e
         wLcCS701vrX7XfCit1mIWsChOnsLt+tHikk+Q6H74y38mcnbwavdihXJC/hHGxsIzmIq
         Ubr5W59mPIf3aszrbISHaFrfuTBna8uTy/N7xhWyKhCA1D0U4WDHqGuPOQY5dN19rFC6
         wI1WoDriOvIRhlvKhVkjOAYVeuO2qENksJtYhO9JWB5ashZE6mUENfRa0VMER/Tj0pmp
         gx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975310; x=1794580110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xi81y1XZW609wk/sWs6sIq2iQGR+N/bC4UAGbPKuq4A=;
        b=mKiyNMYrIGnLAepL/QTZY3Rv8Q/0L8rP65apHXqVYRxe2VCQKtIgMF6/fNGtx93tyI
         /bT9ey+r7rvrzXoOuT9bsytTJ4ZoB4a03GaPDeEhze8QngOQRxCDpH3JvCKTfqInBOzE
         vChFsNDt9XoTKxBzi82BUuCeBhD/3+VZv/ZYMrocJYbPh6ougOBDWFwrRxPsYXYUCvtv
         F5CBWwlArFP25Nf7pThzS1CveUVKqQMJKv+EI6v8E9ls21BYJ8LaNRuyMkz0KC5Jxx7l
         Vs9NbF9leB6t0pOw8Ug4qm9XdR/5PGmI1QrstyahnNKzeZuHl6i0VFUJ00KUhvMRpMPM
         5HlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4A1RrUXOp0FNvxJXqkhfzObx9FXc9CDF7iSfTO+OhSrN1WXiB0mZKxWRKwescyBX6n1ipqUeP5gXEwBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7owD9rMjmuJ1ok6RyA22wUkveH87IE6UpsD1H5C4ZTuRXxl5c
	DIJTdPRMZjVyFeNFiFg0/p/Fur2A8jz+2prSNf4y3/KZOttTeBq/ZCBV
X-Gm-Gg: AYBFou0JOrUESWQg5jRKuh3oqXnmrTfgkYNSEyUXjIk9R1OaiXZhQscvIawmppt255D
	uAwwASFnkWop8iQJtowOR4BGF3dIHK4sU5oJww+CtOn1ZGD0S0J4hqWIqbbpYZZnA0eqhBIgBgQ
	ut2c1FuQJ6ngTat9H+kA47nc/40lOWxnQMqGNkRdr9NYib9W7fnHQd3WO6IS2mRsv1OZpD8BFPf
	3YNiOM0yK3oI9zWs/nmXPe4nImYWaVfS6ItF/bwKi/y828xYsdcoKFDHMtdy/qdz9j2nGbhy+cC
	e/rHyB3ejVeoEnILRzLxjMKuOI3LJS9pjtEj3/wIIF7hQWMJgaJJzdOnm3ZcOnaJmymWcKCHcmy
	a64Z12ID01iqUaJZ8xrNSssXfLktMUI4gojQeDiwCGsCMhLZyUB+6Zy9pPcpLz4iu84QaobAxSx
	LTwBp85TVnRv9sxtzAnxrqRhmp0A/tRU0GSQQTz123BcK3ZTG5coYUsG6DopJryhgYJuNwu3yY3
	XK7y60Qgr8Q0pkX2qKEhjo5R09pR15vKEHUTVq+Aj0QhsO+Zo67ypLH2GeY7ZxSK3+EawYYJEjX
	JXDoDW9isa+6wLGznfCrJnpYmHtB+otPhF8oCqrl7bpK5kkLVx6d
X-Received: by 2002:a05:6a21:4ead:b0:3de:2fbc:c391 with SMTP id adf61e73a8af0-3eb9830cb5cmr4470055637.7.1793975309829;
        Fri, 06 Nov 2026 06:28:29 -0800 (PST)
Received: from DESKTOP-31QBR7C ([103.120.166.86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6878sm634384a12.28.2026.11.06.06.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:28:29 -0800 (PST)
From: Rahad Bhuiya <rahadbhuiya2021@gmail.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com
Cc: sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Rahad Bhuiya <rahadbhuiya2021@gmail.com>
Subject: [PATCH bpf-next] sched_ext: Reset task fields on exit of an SCX_TASK_READY task
Date: Fri,  6 Nov 2026 20:28:18 +0600
Message-ID: <20261106142818.1475-1-rahadbhuiya2021@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

Commit a298fd5f4ee8 ("sched_ext: Fix use-after-free of a NONE rescuee
leaving its sched while running") moved the reset of SCX-managed fields
out of scx_disable_task() into scx_reset_task_fields() so that it can be
invoked on every path where a task leaves its scheduler's control,
including tasks in SCX_TASK_NONE.

However, in __scx_disable_and_exit_task(), an exiting task in state
SCX_TASK_READY (e.g., a forked task that was initialized via
ops.init_task() but never enabled under an ext_sched_class before exiting,
or a disabled task) currently breaks out of the state switch without
calling scx_reset_task_fields().

Consequently, its managed fields (vtime, slice, reenqueue flags, and
watchdog runnable_at reset) are not reset, violating the invariant that a
task leaving its scheduler's control starts clean.

Call scx_reset_task_fields() in the SCX_TASK_READY case of
__scx_disable_and_exit_task() to ensure consistent cleanup across all exit
paths.

Fixes: a298fd5f4ee8 ("sched_ext: Fix use-after-free of a NONE rescuee leaving its sched while running")
Signed-off-by: Rahad Bhuiya <rahadbhuiya2021@gmail.com>
---
 kernel/sched/ext/ext.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index f74ffb3b1aca..b57a7989f304 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -4728,6 +4728,7 @@ void __scx_disable_and_exit_task(struct scx_sched *sch, struct task_struct *p)
 		args.cancelled = true;
 		break;
 	case SCX_TASK_READY:
+		scx_reset_task_fields(task_rq(p), p);
 		break;
 	case SCX_TASK_ENABLED:
 		scx_disable_task(sch, p);
-- 
2.55.0.windows.3

