Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587125;
	b=OLMoL2LIPPIzaqlHE6HPMeTKLoc5BcqkY49W/fT8FFqfBJwel3kl4iJYPb7weKhqhNC4
	 VghS0HS1MQa1dmxRwhF0CFFkv+STTl0C3ppEg/WCXgt2k1zkzd0O39VliIOVcyoED4B7+
	 S0LwgNjaP7jOGjGTouM3LaCY3stxzvuq2yR+SQIqXCHEo4Iz9tFMoCtFQvIHXPJyPIwI1
	 DgdRQIuZ4eMQ7/tbAOBvh1Njjl5c8NtqWxyHwNEPWyxwUnzLaJCeB6UGJRA3gINE6m4uJ
	 zwJsSr2EjPYvULsOT/5YR1vB5xvXu9wG6O+AtT5dTfufYFGSm8moFxSN5RM8Iyiw97A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mn8oXMgO7ys8gs1NirtIayuQ3LSb5RT+jR9DaBN+G6Q=;
	b=wqAc8e2qgvtFh41m5NaByu1Aa3352L6Hh11rspV4pOhbfS3A4j2pzdeAxmGnlCeU/G/F
	 mFHlfIoxlnr7QGgmTd0M0WvAveMJ9MHcLiZfk+2AMR4+F5kSRZU7kec5K/7jo9g4MzaA5
	 3n5rpDHLI5eaFZ0JHiWTxwlzB0Bp6EBzv+Hh2q2sQonhZ7ZItLVP+bVUHluK3xKrWOovt
	 1Nec97pyz0eIbjDimxitaFbQEXwo1VqCEjhoGPazv6YNHmWIYqn3M9dalyZlJEXVU9mml
	 EAIvj7+GCaROeiAwjf38JYEK0yPmTulDq2H+sGnBQ/kIAVe8ohFYYGeRh0e1Hckfm1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cG6uo9BE;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A1606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3A1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cG6uo9BE
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso97932266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587118; x=1793191918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mn8oXMgO7ys8gs1NirtIayuQ3LSb5RT+jR9DaBN+G6Q=;
        b=cG6uo9BEELzaoqgbe11mFN6vTx1fa06/lNMCeAqI5ThvD52TIVBlyPaI/QS/zP5cj9
         rsEWQebXUX6m4fBiYDoZXhb2PcgNDZwixWaus0ieF8GTUvVLCDg9TlrxbZcqTLasiCpt
         xRFmwOAWYI4+lyJwIc1+qQGi50PtAnu2ULaE3nAfQndJz4auQmhDUR4otzAcBUfy+QDE
         sVDyW8oHUOWXSvsswUPm+og9ZzPpUqrcZqfABBeI502ZA6bSjCaDu89akza/TTmRfWTs
         GxKiz9C1DD4Gz08F4B8JAEvvVVY0Msvpi+eP8y1e7PteaV6i6MRasSpEKoW96ykirHED
         ZOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587118; x=1793191918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mn8oXMgO7ys8gs1NirtIayuQ3LSb5RT+jR9DaBN+G6Q=;
        b=ASRtYHbA9GP4bP3+4M/zTbJyaakGTpFbi5J8k+vpMrhnzxWbhcu5ADmhqqsLp+lt6o
         OPKaNKOuHAgWK0aQWX/qeFllJOmSXExH5lwzXXRY1rfgp/affj0E5ap+PiisSB41N9zG
         VpG6J8fk1Y0HAc6pYDxPQVfMKKZ6PtU5fTc9Lkl99HVBQh+1/wcic1sqR6q4xGC91FE7
         sLHJBk7lfDut/8XeWg1WAFl3V9ePZBxYShAt1/Of2HzukrYjuyYyio5bRIxjTyJ1Z+/C
         FRd7Wp/lNt57TKK2IPemJGi7GZ73O6eKuOpCkCv9wauHVfNwo9kQVnVDXHIuv0y72221
         cL0A==
X-Forwarded-Encrypted: i=1; AKwUvBxo2tyJlSiMo6DkAUCrG+fjPhYZMaey/wTYEMJoD7RZ/R0R+Rjadp7x5s4/Q/TCQNQW0FJrDKU7Af0/wPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmTsdGw0/dgBWd2dN7ztLmvEOwGIXhHmQPhboP74U8c4j0Ne2q
	2CKS87pT4tEevFbHWGeInqVTHyIvCoZcieQFHZFZa2P7o9KX0JplqDbg
X-Gm-Gg: AYBFou1vwS8QWFNVsbU1kJ+mTQVbDJIRr+/acKAMYWppmzy6sB0gpOsHWV0ZE4MR/kM
	Wa0W7ByyETJ7ryzmv/p0gpPVFPDT7LH35Bagm/lSg51AbJbARNjrNCHdyv87KBDSLpmpwVJbT+z
	2l9Wxi09IKUsMaEX44R4vfi/xwA7iysryi503+X4CmnqZhjATgjqp2VgYqkE+rwLn7eX3hP1/qe
	v3VCidrnNQi+5cGlKUGXUDNZVz7Ro8MUDO4bxK4aKGLucgehkfT9eSa4UDOso470pH+uLcmK0vu
	IrHbLYq8L5iCvzZgpZnHeWzJDI9RGVeFMEFbcnPC/VetRCmLT9I0TLvOCYHWF2BC8sFQlqPiu5g
	Q/h2v7hmLi7+16KCfp1UFwm72eqZ5ghpQwwqEMNFbVTCFGkFvsnr7Ki5t1jn4k8hJoX/+vXifug
	tQYwBlgtFCl8zForr7GtoXq+KGNBX0alVoSFTA79XLHYf/bDWrHLckZm1QTDeUNGeY+f62ZIUHa
	YjUR62GSslTnBjLMth5TTleyag5MERNE11L0J1t+MybsEO9dG9+XHqDP/0EMoZo0d5sgwdL9wBr
	1IRGFJdGkYA0L65lGPsyfLghR17e+tvYgLPbCnlHzdpC0YQ8PJGsHLLm9k19ztu9k50j58cWNCR
	7sdddzHZyEyx6HvlKCGLmlZ4ssq7Jv35oL7WyDifOX9YI34uBdAbFsE4ksVydZitKK/d5xF+4bi
	iW3ugAB/1igwsp4j3XHLXQCZgn
X-Received: by 2002:a17:906:99ca:b0:c40:9839:c892 with SMTP id a640c23a62f3a-c4679594c9bmr175067366b.19.1792587118009;
        Wed, 21 Oct 2026 05:51:58 -0700 (PDT)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679004464sm73128366b.67.2026.10.21.05.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:51:56 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Kent <raven@themaw.net>
Cc: Tejun Heo <tj@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	driver-core@lists.linux.dev,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH 0/2] kernfs, autofs: fix pipe lock cycles through sysfs stores
Date: Wed, 21 Oct 2026 14:51:48 +0200
Message-ID: <cover.1792577179.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
References: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
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

syzbot reports a lockdep cycle &pipe->mutex --> &of->mutex -->
&sbi->pipe_mutex. splice holds a pipe mutex while it calls the write or
read handler of a kernfs file, kernfs takes of->mutex there, and a write
to /sys/power/resume looks up a path that can make autofs write a request
into its daemon pipe and wait for the daemon.

Patch 1 stops holding of->mutex around the ->store() callback of regular
sysfs attributes, which do not get the open file and already run
concurrently for separate opens.

Patch 2 handles the case that patch 1 leaves. A store called from splice
still runs with the pipe locked. autofs no longer sends or waits for a
request in that context and returns -EAGAIN instead. A new mount is
refused before it is marked pending, so no other lookup sends the request
in its place. This also removes a deadlock in which the spliced pipe is
the autofs daemon pipe itself.

Patch 2 changes behavior for one narrow case. A lookup from a splice
callback that needs an automount fails with -EAGAIN instead of waiting.

The series was tested in QEMU with lockdep using the original C and syz
reproducers and focused splice and autofs cases. The target reports were
not reproduced with the series applied, and the paired functional cases
matched the unpatched baseline.

Krystian Kaniewski (2):
  kernfs: do not hold of->mutex across sysfs ->store()
  autofs: do not wait for the daemon while splice holds a pipe

 fs/autofs/expire.c     |  6 +++++
 fs/autofs/root.c       | 28 +++++++++++++++++++++--
 fs/kernfs/file.c       | 52 +++++++++++++++++++++++++++---------------
 fs/splice.c            | 13 ++++++++++-
 fs/sysfs/file.c        | 18 ++++++++++++++-
 include/linux/kernfs.h | 11 +++++++++
 include/linux/sched.h  |  2 ++
 kernel/fork.c          |  1 +
 8 files changed, 109 insertions(+), 22 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

