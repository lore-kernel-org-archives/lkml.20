Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B504D7D39
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062739; cv=none; b=qw7EZZz2aJRJB/0jNpB1HTMpt8wxovuY/1vd74qWeUoMPXGDGG4FuRhNK+KSm7x+Lg5dGnvCNqLPtYy+jFAEPD7glnaxQXqHkoVX/Bkz/ahhjT4Vt+XjrB3+Xkridtj/7rofm9c1ujgnqMywxkvNbXdXLf4rPBpbFDgb/uoLevo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062739; c=relaxed/simple;
	bh=GfSfulDlANmtg1D1eMp1tdJTvpZbf++7/H8np/gPaKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjFfaqJqREV54D7KiSQCQdOySyVbtWZ3mFzWsu+ae8We8BWaj8uMuK3+97KGc/mnDlMVsOOGPRJgqDhhJeIFHdHr4MSKhjUymCk75Cmj44KJLJdSS/zZdp8zqO3HC58mfU5P1fpTVojCUmVWqV0axvoLXQPQFr0z6cW0BlTgYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzUyr8ga; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzUyr8ga"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so8570617eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062737; x=1792667537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfSfulDlANmtg1D1eMp1tdJTvpZbf++7/H8np/gPaKk=;
        b=JzUyr8gazr1tTMu0P2xNsDtZ0ml0rpJkXqiSB8vP0bxeSSSM4HYIE0yWES6X3NoTVD
         UAfTLJ0LpL0CAc6iDiOp/JftX1cn6SL2B1KuPGSY1kvuIMM4HNAr9YwuVuUyswLhxFCW
         +5IyKykn8FSdtWQ4/nGo8fWAJK5CaavgolBAtu9gNM+Fa/lfkYJr4iJS0HANvV14tjfi
         6nGUeJYtRKzPgbojNV9XZixpQR+hRjKEF4Wh+0W3KBSxfNvg/0Ply/yCfIZMj6Rg2d2Z
         n4b7Zv8wP8kFBmLFwCmjf9NQLKou73+nsO0B1ReRcXi6ob23+I9iOxNDpHk5/7CtVNeV
         cPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062737; x=1792667537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfSfulDlANmtg1D1eMp1tdJTvpZbf++7/H8np/gPaKk=;
        b=j2hPTOJ9aAJM4fpyEENu7lYZihOU/k/QvlgHADf2kCG1M7YLSer0TXMGgNyIYCAQUv
         dyev8ybqX42p9thGL3REJuiEuTygRQ4ZxzDMNyz3+Rzb62+zQVJfMg3wchdJ0efWd7Rn
         khorMxLQ4+UwBmGrTgSV5q0yWqFSrao0QgKmWH38BHZX/xHVPMjgTqEa9e9NMxGb2TUZ
         ZD4qYub3LB0ZDY1O1QV7rN7jVeMPP5CeGZMbAry/1DgBm2mcwltq66ahJG+NKSwTrVvd
         F1++mwwQtIwURz4RwoSGdGb06vIRc0zNbPMHRG+ficTHdAp373VkzL27yGERC0oCKyd0
         YmKg==
X-Forwarded-Encrypted: i=1; AKwUvBxT+Ny/oDazKqIuvBAnydNKZVyRe/qCHCYk3GeKFevyI6/8vp19hOjT5DdK1BXOFrQuBMsy098m7KOYac0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwABacmEqlAS1CcFXS/YIqiU+/v97Y4pfqOe9Os6/FkXV1KGBI
	0v+6thg7G3hH3CfKqhdfJe4cVXO4smpZKvvmlUI2rDjUiBblJD1Sn7jv
X-Gm-Gg: AYBFou0/TzefSCHACekeT5g3VYUe26IhGzNmqeJaykv04oYFc4y6vtIzbf2QQ/JdBec
	OsWrN5eRfmyJ7fR9mkBACqKreqLqfoX994xmceikpLbftZ7Jeg/UqTY+7uvk1AU6vu4azI8Ah+I
	Xm9ds0T85F5Rs5XNYejx+WBmaI7zF+jG8vvmToiSkpXXMzxtzt52uKzGq/YVPOryuLN0il16cGJ
	poA7Iqar2ykOz+x1NUxPNpE77klxGb/u1tgdDPKPvKz+9m/g7gFgrBB8T6XAbNU+Z3agNF9t2qG
	sNPhSN8YarL7wi5gddOy7JOYlGAvkuh4zQ6qHAkYpNc+S1UW6IexiwLlqasNTWRI3q1BXsme4xk
	c1Z8Jyf26xfu6FkLz6b3bj8GNZ9YxzNix6Ca/MfwP/ULy8leXS2FOLPdpDSuqbpKetkzprYK8X/
	kY3Dw3NgjQxBtjDq3fURkK0KGyEAXyGJ5sUlJVqG6e4KtS6NCLsW904FoEvr8vcUqGmoNl79NCa
	13vWeVlMYWlIHB12zHZHtRt7bv4lJOp
X-Received: by 2002:a05:7300:ac81:b0:353:7e33:664c with SMTP id 5a478bee46e88-3537e3369c5mr35858267eec.37.1792062737176;
        Thu, 15 Oct 2026 04:12:17 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm68338413eec.10.2026.10.15.04.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:12:16 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: Re: [PATCH v3] selftests/cgroup: test pids.events notification
Date: Thu, 15 Oct 2026 16:42:56 +0530
Message-ID: <20261015111256.1551933-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <81a8a0d64d269851ce4b48a240aa673c@kernel.org>
References: <20261013064812.875787-1-sahaj123.sc@gmail.com> <81a8a0d64d269851ce4b48a240aa673c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Tejun,

Thanks for the review. All five points are addressed in v4:
https://lore.kernel.org/r/20261015111243.1551387-1-sahaj123.sc@gmail.com

The test is now test_pids_events_notify() in test_pids.c, runs on both
mount types, drops the skip and the duplicate counter check, and cites
1765a153d985. The v1 to v2 note moved to the changelog.

I tested it in QEMU on the cgroup for-7.4 branch. It passes on a default
mount and on a pids_localevents mount, and it fails on a
pids_localevents mount with 1765a153d985 reverted.

Separately, the existing test_pids_events fails on a pids_localevents
mount, with and without this patch. I have not looked into it further.
