Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2BA3E0C75
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343390; cv=none; b=aFr09ftp5PbRcSdsbd5AyRl77NZmksyPbItuEuh4iW8BX9w8MMpj+NRgyNV4YTN4ql6pZ33WD/vFwqVP4OOsocn0tOJgXGVqzUxuR8c8doGYqs9Jp1U2qB1sAlsY21vrrMnUkbzlzVqDsxArQSfBk1r5PKrQLP7V6KDewOKeHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343390; c=relaxed/simple;
	bh=CfbJxL0seVaW2ual+KpU++Lsco1r/Gt6o8LUUyW0Vrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEPmFYQT0HFBwvDVh8Ksi5PuYIUt0oBccTzwFOQFlASovHd1eQdWoM2nqs88+QwSltNu2SzcSFp/w6qvsCim+it9WxF1tHQujdQKEe20nA9RnsCM2OByDtGXl4Wg2AwHgtIYI07YzDEhrvRYR0jJfvGUJT4ZBNvdZG1mjA3A2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=UcdT/DaL; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="UcdT/DaL"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20e86cffso163245d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1789343387; x=1789948187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69rR4iPRVLq+d7o+AdolZJ1RPsh1sWljW/ZuvUgaQfs=;
        b=UcdT/DaLPgOwrJ+DoFt0LpXSokqQaFpVRtrvYH9/P8rhpbokbiSoabk0TNjP86HEik
         bkhMcFfBeWa1mtiZjjciQF3W/sAcSkA5EazLzKVT8MD4LbIOY3/xDTuQ3i8vnciJ2E8h
         vhKVKhbeCy1CtxSyeFoCBcpnJ0TxJssHF57lqWt8Q6w1MCYLk5bDvPCfN4Z8/84FLU/m
         7M8xtXt0x8DzgkrWq3Z/tHR50o/CugYfTHtUcVNfZ3tu1wvzfqx64u+6QxRNJvcaWQqB
         RSHhmpOEpFhKODXoBwhrbS8KKdlY4eiUC6CgeIyWxkUrySKQhrtKxGiNKYckFgIljR4a
         lrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343387; x=1789948187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=69rR4iPRVLq+d7o+AdolZJ1RPsh1sWljW/ZuvUgaQfs=;
        b=hrs9yl3/1EMlkTeRagJH+7J5kUbgA9hJwuQP94rSGwj5LF5hfujaD5R3m1AhOC1OHN
         WikFSfjb4GQVNEtWjHuPpR3I4uTp5TYnxBng4ODAVA2ymiMtzrmM85bbm5SY0VKG1bBm
         u4pVgXsXHaPSAyKAsGizEYFkt3ycsqXv8lch5PpJBtbo3vHyj2WXKOY4JMjza8NScD+n
         rbJhLRJV2I4wbgIZLCgpA/GjenJMFIKQeqBt8FXQPUT8eXcKL3kZ7wPYc2xAgqno8JCB
         zEXLBKO8X1TQsKatJnYLc64onxQP+8GAXVShxCYZJJREc4B/fGGMhd7jjZnsdxh82PwM
         AU/g==
X-Forwarded-Encrypted: i=1; AKwUvBz4OyeWs5nqGH0GDWSY2Al2JF9X7NSJ1uLs3tpBniETuQa1987HXEVZ1M21HEqpi7GlXY7vLIYCE5Vx508=@vger.kernel.org
X-Gm-Message-State: AFuF++mXDE1sy51YVqWrfL4C4dk09rZMsVILtP6aqFiuL9GghcVwz9su
	o/CndLh46wcKFCTCwWw0az4P6+wuXJxCdWKaZVQo3xuGGp1YRJe3cQ3Fi8Hrs+b5tC6u
X-Gm-Gg: AYBFou0/eGn9O0wyev7TTj4S+gugls0GM9ImofHRBo0Wj7SaZTsqAumcuBULG1ljbjJ
	+/yL7EAyfKXhAAYUtnz6vyduylC8n3kDmGoaIiMrTv61fToL8VrdmnBHi7lLTYX2O+1lHMumw4s
	LaSbgOhrE6iH7gg/26/MuBdBDi/J6SjevQ5Xds0ey1p6quAKRk7L1u6adhfsiZIpvUuvH7NUJGW
	77TMgtmyBDviJseDIgnhaOfNqUBJ5uKW/CFmLY6H5jJirUmu2rGicWpsd+zcXfJ2VutxdbVYrDj
	PobweKmH5+6v4vx5ggYczqEVLgBwctysvBUwpxR4MZMd90qKt6aCBxAWHjNXu4Et7dfeTVewzi5
	HqsejRaoVWg5SpCmLrXEMpEyup+m6MhhkS+mCHmZnJsHnZLOy1WsA0k4rZZLWbX4iOYFcZwvb3+
	unLKzDQDE26e+fWqUqqhMsKhl2lH/e5LIy0C2CF+Xrtz0qa6iGjW+HA30MYxj0BvCQzguS+ooNs
	/eKbcZElUPQih8RW3ABrYlbEvUegIUt3ggiZ8w=
X-Received: by 2002:a53:e792:0:b0:671:2093:b5ab with SMTP id 956f58d0204a3-67124801eb9mr3901527d50.5.1789343386962;
        Sun, 13 Sep 2026 16:49:46 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125db3459sm3819481d50.6.2026.09.13.16.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:49:46 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tahera Fahimi <fahimitahera@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johansen@canonical.com>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] tty: mediate TIOCSIG through task_kill LSM hooks
Date: Sun, 13 Sep 2026 19:49:30 -0400
Message-ID: <20260913234930.901567-1-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913221958.839429-2-clusk@northecho.dev>
References: <20260913221958.839429-1-clusk@northecho.dev> <20260913221958.839429-2-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bot's finding is correct, and this is a regression this patch
introduces, so I want to flag it and the v2 direction up front.

kill_pgrp_lsm() calls security_task_kill() with __si_special(priv), i.e.
SEND_SIG_PRIV ((void *)1).  On the ordinary paths,
check_kill_permission() returns early via si_fromuser() before the hook,
so security_task_kill() never receives that sentinel.  This patch reaches
the hook directly and breaks that invariant.  The in-tree C LSMs do not
dereference info, but task_kill is a trusted BPF LSM hook.  An attached BPF
LSM program is therefore allowed to dereference info and can fault when it
receives (void *)1.

v2 will synthesize a valid kernel_siginfo for the LSM check
(user-attributed, since TIOCSIG is user-triggered) and keep the privileged
delivery unchanged, so the hook always sees a valid pointer.

This does not change the two questions the RFC is really asking (whether
TIOCSIG should be mediated at all, and task_kill versus a dedicated TTY
signal hook).  If the answer is a dedicated hook, the siginfo concern goes
away with it.
