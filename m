Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585576;
	b=ufveFoNBDtjSmG2hbnVtmbGOW+bC/VUsDd5YQUX9pI+iMiz9F6XVQnbShBbiPm3RIG3J
	 4hhCY5eEc0q8uhADX2LC9/V6hefODifPiMfZ+7nQjxCfoH7IioQ0yMv+SXEHNPvhwV4fP
	 CQk6L/ISaJnJU/qtvPH/Hc5otA8ylsbIA1hHNVnbCeR0swrUGIWzuEXSrJD6n+UixZ52Q
	 +r6f0CawBUdRWWlw7+tL58u2xv2la9UmP6GjGfrWhFFB/zMVzx102QcKbdwoNcHbwwt7d
	 guMiY3kCMNgkCaz/ydoKNNYBu/6gEqexT6iImdnwD/UmMbqxvjZX63AEkZNZW8mpKTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=H6i391iVh1dQ0VMmEwYNJCCdz9XRHgnpnKzdqGscyes=;
	b=Ro7tXvthFZR0oanL6i4dr9jrl+xs2RuaRDjNVZYYxPVNH5Nh6dJr75fDrui20ETKNXVr
	 sSPsuteWewnAGk2L0lMr+9JiWNG0kjahAPmZVmxNVktCC+jmQBuk2cMdg/Y11T1C7bAqI
	 t6Ep+9RDH7oDP/pxIzLvLMxPTEZfn41yRePiZs6hqMnQP9qMZv7mrXimDJX+nAjvoRXT5
	 2s4TMcAnP63KQeh4AoKH2SiRgCY93/86LJ4TD4tw9i54ZFXFvK9FTprmDrATIuipk5T6p
	 4o6m3M/v7YLIWz6oEL3ZfO2NZjpc8ENJPMI1bfoxwjD+YFjYIuy9//O/VPQLeovZ5HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=K4Ck6vdU;
	arc=none smtp.remote-ip=209.85.222.199
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D2606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 214D2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=K4Ck6vdU
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso225230385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792585575; x=1793190375; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6i391iVh1dQ0VMmEwYNJCCdz9XRHgnpnKzdqGscyes=;
        b=K4Ck6vdUNoxtGi0Ca3LQSncGupPvh+9yAB0gT2PT7YVyUU44uc06bdqokIR+GrQH1X
         W3llXOTeBIljiJuwOX9Rk39Y8mVtDkCV2a7kWTWfPMLvLDEM+MRwVC+qwH4TLTnBfm86
         fQ3V/WCY4kkQWnv9KayZZJhOwLCh17gq6IiWUYJFqVhErx3f2TeHhwlonjPPri18Joy8
         l9V0Jes6Gui8SVnm0ITOF737tc/HvRCna/BSTXnQSXzPtO6yhL4aAyw2xk7oQ8Djp8E+
         Q1dy1vQUUW/HudcL4Nlo2qHDV/A85ZlQeo3LZwjjtjfLjRvsy2zAM2DzF/9tfUfJnu7v
         ALRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585575; x=1793190375;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6i391iVh1dQ0VMmEwYNJCCdz9XRHgnpnKzdqGscyes=;
        b=xb1CEKOHEKfb0efX4ZmMjcrmSU5YCxiax28Pwsx0HEl1hw8Vt+ShODWSJotEgCFqG2
         Z9iXJA81jy/FA7IWBrmMu1ZOxEMzIs18Z5c10q8I2IQD+y23YJPcvUt1rUKFzfPh/+hF
         zMsHNvyhHWvsh3pIpinnOkJ3FPqQAkuT/uIynRT27igaztKK1FAdC1Ft+Ve0/KHGqEk3
         00eNhIRSkuOXQnuSchEMXrCiIrKxRai0RfgnwJNTRFclr8H6YpwRL/fpz++IZL+b1ams
         iRi3Mp3irJ2ExrQFrzLh6ZQOmVMX6pyXqrumDlsK38HEOsBnEedPSmWtxBR9qoUYT7SQ
         h6RQ==
X-Gm-Message-State: AFq9FYKxgj/Hi7UaMK1VRkBOaVtViSCudpofuVzeyxRwHgC/ZU1xDlx5
	R+72TB0wogcEfuZ+17vDFIkH6FQAKklJUaVFuK+uGU4GFsY1szFhWpPSbDgC91xmfn4QZD4WpDh
	Un5h93nhNTSMajCY0airW40qLJQk0Zbmh7xZLCfUYr7Pm/t+v7YmIl5CsqhC+7PIPkTbyq4pcrC
	JtWhJ3Io6BKmB0mBiLEea2nLu30yb1qDl5ZfCTFUq8ZPfR
X-Received: from qvag18-n2.prod.google.com ([2002:a0c:f092:0:20b0:919:5a9b:414a])
 (user=sadrul job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:4493:b0:93f:22f1:97bc
 with SMTP id af79cd13be357-93f57f639c0mr361670985a.67.1792585574428; Wed, 21
 Oct 2026 05:26:14 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:25:43 +0000
In-Reply-To: <20261021122543.3547778-1-sadrul@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021122543.3547778-1-sadrul@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021122543.3547778-2-sadrul@google.com>
Subject: [PATCH v2 2/2] fs/select: mark select and poll tasks TASK_FREEZABLE
From: Sadrul Chowdhury <sadrul@google.com>
To: linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	linux-pm@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Sadrul Chowdhury <sadrul@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Similar to epoll_wait(), threads sleeping in do_select() and do_poll()
sleep in TASK_INTERRUPTIBLE via poll_schedule_timeout(). During system
suspend and resume, these threads are woken up by the freezer solely to
transition to TASK_FROZEN, and woken again upon thaw only to re-evaluate
file descriptors with no pending activity and sleep again.

A previous attempt to make select() and poll() freezable in commit
9745cdb36da8 ("select: use freezable blocking call") was reverted in
commit 59612d187912 ("Revert "select: use freezable blocking call"")
alongside the epoll revert due to issues caused by the legacy freezer
architecture.

Following the freezer overhaul in commit f5d39b020809 ("freezer,sched:
Rewrite core freezer logic"), tasks in TASK_FREEZABLE are safely frozen
in-place into TASK_FROZEN without running userspace code or experiencing
premature wakeups before resume completes.

Pass TASK_FREEZABLE to poll_schedule_timeout() in do_select() and
do_poll() (TASK_INTERRUPTIBLE | TASK_FREEZABLE) so that polling threads
remain asleep undisturbed across suspend/resume cycles.

Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Sadrul Chowdhury <sadrul@google.com>
---
v1 -> v2:
- Rebased against current mainline (torvalds/linux.git master).
- Collected Reviewed-by from Jan Kara and Acked-by from Rafael J. Wysocki.

 fs/select.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/select.c b/fs/select.c
index 95d76531015a..03318d678187 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -600,7 +600,7 @@ static noinline_for_stack int do_select(int n, fd_set_bits *fds, struct timespec
 			to = &expire;
 		}
 
-		if (!poll_schedule_timeout(&table, TASK_INTERRUPTIBLE,
+		if (!poll_schedule_timeout(&table, TASK_INTERRUPTIBLE | TASK_FREEZABLE,
 					   to, slack))
 			timed_out = 1;
 	}
@@ -962,7 +962,7 @@ static int do_poll(struct poll_list *list, struct poll_wqueues *wait,
 			to = &expire;
 		}
 
-		if (!poll_schedule_timeout(wait, TASK_INTERRUPTIBLE, to, slack))
+		if (!poll_schedule_timeout(wait, TASK_INTERRUPTIBLE | TASK_FREEZABLE, to, slack))
 			timed_out = 1;
 	}
 	return count;
-- 
2.56.0.212.g129ede20d9-goog

