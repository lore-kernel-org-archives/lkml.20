Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442349;
	b=uVUgprduFHqVHKaND1m7S+poTCKD6LcwzHB+3m6Xt/d8e+od50IeNQcnYA2BfsQerAX0
	 gFr2tF4I8CoUzsWs2M3w7cCLKSqo0ZfF45i2SObpU7xDowrVr2qoJT2QYydxQScVoCzZk
	 OPknxwVIEw2AEYMkhcT+FHii6vV/VipZAYfJZdKk0HLyKVL4ovi+llSF0uqz3pAIu1MyV
	 tEa1aufJKiuRbMtykxmIKWPE7DgNvaMcNh7UIoAGCr6QIEM8UehEoM3VUeI1X3oWUiU+N
	 eiKK+mmfl9iMIhbrsmsEx4o4H9uAC8RLI51JUtKjUUyF2hTbtDKdXemD7kbNcIHBtIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7yVmIuop4gnsPfbSLW6KTepFf/okMUAMYmN1g1+o1FQ=;
	b=HcXR3rhPgRPHkVhPRQgCnPLFWQ5zaXiUxbCkuI0YhWPL7vKpdaHyw5J7oiwUq6NbMTaf
	 Fx1Ffrd8BYuMGFlHjf6AsjDldzLHdmVbvevOnp3+JSOeGE0mnOfTQYdvsQb6bFw+bpMkf
	 QhtRsor7itCiJOBQU9Df84WjUu6Q43yhrJITMLrlyJLE7PoP9pYd2ei0snJLu04lERLyN
	 EclGJOgbP1h03U19G4S5c5wDRNMM972VdUZGfzyZWWWY2Gbsht8SnUlKVjFExELS/PHe5
	 RNh1pBWuieO9uO4LQ5yrHHu6rT1qx6f85U8bhDvGhbR00uTCvYZpYTWA73mlN2Q217Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDrysK9X;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6AF606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDrysK9X
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so8794025e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442347; x=1794047147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yVmIuop4gnsPfbSLW6KTepFf/okMUAMYmN1g1+o1FQ=;
        b=aDrysK9XtMByDqlPYhyjkKCi2TLyC2moFntn4CYFUbAnVC2HRTL2JAU0qZmvPZYyKL
         r+hfeQ4QebXQg9U00GN5jkoBvFjaherbdm8zE8hcyRpZonXsCuIaKNkZXBPV0W3Wq+ZQ
         k7n4SRMb3Idy1ZG7SeFaYQGB2tMmF9J9LeUv7C837LqeNeXJ495njbegamdStcUVh/jd
         rydSv6oDaW5UO+po/BN3ha6JR49sndZBtLsAJG5920zKndYytYxKrUdjpbZjZ/q6a1lU
         QWvp1szLr1vCSuiHv/lyd/oLnTs8dDexjSWyWj2uJ1psf0qachRPL5038Q8JbNlTX4c3
         NpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442347; x=1794047147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yVmIuop4gnsPfbSLW6KTepFf/okMUAMYmN1g1+o1FQ=;
        b=1YhqWQba0urPO/c8jv3u9yG+FpyBtReFoHVWJjpIyqK6WsRsdWABjomDrMIQ7M9fYt
         nL0zMXD4qKJvVBre9eXXiLDVXzAU7mZcHYMq/alcz6G6nzhFLeftME9lCXPKr4iRuXpk
         Km7gYZei0xc5pqNXG0e2BZ1RZt276VyMSXW3SpDZbAWKG/HTjCLt/I8C2KaRz0JzRoDe
         AoHnpTgm52p6QCvOjIgx7KLLOM5hUiUe72HFhe4F5o4pT1qXASA+nl6fxORyFNVJty5Z
         61c+qieUUKDVOd4SDzTWXAP02269sdEs/JxJuRK8t4dpwbbycsrMSW+V28qD8CLrUOph
         qz3A==
X-Forwarded-Encrypted: i=1; AKwUvBw46tfCf+0Do3oitkceHVKzufG8Rdb47k9ZK9Q+f3eqjeLyOTtKCg5jIO4cJC+PPYh4f2oh7BuN2uwyBaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIITan4Zg50H5DZ98aP2B75zb4d2VVnNQbJtV08JvKjWPH9IGin
	iozi/LnHcczjlBbAtvPnisYmuBLI3/4hIZ6XMx6DfgpJEhzxxyI+SJ3cyicEkj5BTAlvdw==
X-Gm-Gg: AYBFou18NAKInATjI8bEikZxHrXMHdmV5h4a4OutzxxILy+jTQ405qFhRTXSky8eQl2
	FUw9VayWdIENuCfbfvETOA+8JYe2MKMhxqLn14Q3DCHrlpqQNsILNVI11j93dgl07Ei79pSua3i
	1qp8PvlL5qUey72wfYcp5Xx9hipvPigAAU+SzwyrYhuk1F+lCFGmmP0WRsiR89rEpKvi2Ix+OV/
	e+zmruWnh19+pUkkstf/GxcFfFTFD5ukYssNCU80dmNJo8mnKUhz0TI5Lv4m5gQ81lDlwoDWuYu
	Zcq2Xjz4uzFN1w4hMxn3rZSM2H1P8uOw8gYvrZuQyg3PZOI4KD4X87jWVnpqj3m/FJWsNkF2Ti7
	p3YFiR/eWIfU8KAONRbnGAbEaLQwkmWnAZQWP4AQJoybjv2XaxKNMZTtASMfw1Vd3YvJw6md7g+
	PAjD3FICO2WIIDPdT23FJSkrMO7hMF+q1v6JRTG9jBUhVzhLJqSe79BaQYUHLHm7nmfe4/0dgO8
	3vVXFvH04udsMghYqtDZcV71MhKUv7Bb6D8HotRL50FxwS6T7wTous2TPK7cBK3gqv2hSsERkjo
	3VqDeuEkHfYIJ1VQptnMXlMcpywygygagljzLB8Uqi6QOpbo5Nwmk+VrR6UQ8bDK8hkBrCbIaIp
	g9bSJwf9KYQq3CnrU1yWBFaaxzU6lIo2ghITXZgvT3dNNVWlPBy4Wpn0Wzw5mDBlGOhwsmWKa3H
	t3hE4HhSFcf4+mv3kM30cftJJNNRcMdIsjp08caGtqq9aCZ++eX38x+xxG/A==
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr108040225e9.27.1793442347043;
        Sat, 31 Oct 2026 03:25:47 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-994c-f615-42f0-2afb.rev.sfr.net. [2a02:8434:fda5:4201:994c:f615:42f0:2afb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm195363135e9.1.2026.10.31.03.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:25:46 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] tools/bootconfig: Preserve tracing settings during export
Date: Sat, 31 Oct 2026 11:25:30 +0100
Message-ID: <cover.1793442331.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793364709.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com>
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

Hi Masami,

Thanks for the review. I've updated the event-filter patch to use the
explicit delimiter pattern you suggested. It now warns and skips filters
that contain delimiters and both quote types, since bootconfig cannot
represent them. The other three patches are unchanged.

Changes in v2:
- Patch 1: use explicit escapes in *[,\;\#\}]* for the delimiter check.
  The semicolon also needs escaping for the shell to parse the pattern.
- Patch 1: detect both quote types, warn on stderr and skip the filter.
- Patches 2-4: no changes.

The series keeps event filters, generic trigger counts, histogram
variable ordering and paused histogram state during export. It is still
based on bootconfig/fixes, including the two fixes you picked up earlier.

I retested the filter change in a temporary tracefs instance on my Ubuntu
machine, running kernel 7.0.0-38-generic, with recording disabled. I also
checked the mixed-quote cases against real tracefs filters and added
regression checks for both quote orders and all four delimiters. The
fixture checks cover each fix and the full series.

Feedback is welcome.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (4):
  tools/bootconfig: Quote event filters in ftrace2bconf.sh
  tools/bootconfig: Export replayable event trigger counts
  tools/bootconfig: Reset histogram variable tracking for each instance
  tools/bootconfig: Preserve paused histograms in ftrace2bconf.sh

 tools/bootconfig/scripts/ftrace2bconf.sh | 29 +++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)


base-commit: 1dc6d173c43e10a1d0ee36b43d0d2f371f4d262a
-- 
2.53.0

