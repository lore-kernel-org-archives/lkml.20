Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72863479887
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217913; cv=none; b=CBgcRWpNG/qGKJ7yY6wplp2mBI6NB+qgkJkWUkfJ31KfsLRf0zsgIQ7WiRW35DBM5W9XoN4qaB0k3CAyEAIhA7zk4di6NgyvMHP/O30X/G+uo1XrGYNevMGqX6X7OXvMiONyDW3oyFqKzvsK9MQ8zst6vUl1wEEiq5Up+QgSg0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217913; c=relaxed/simple;
	bh=CiR+odxiVwuzgwSo3ojh+uMzBJIy7yqYBxOC8VZM+1o=;
	h=From:Message-ID:Date:Subject:To:Cc:MIME-Version:Content-Type; b=AHBRACUlWI/wNy0SrYBeE5yiDxRIVZq9JbEY66aMLK1YWaA6DdwQcAKqoryHUX0asMsK3l42HIGpCm07Ss8lOPjW9X2wdnXT1fkorExCqfno30KL2egEDuifIYIeJVXpAFHmnbRK3CMW6XxFuvgpCIE0uF9C52t4BENYFKgtVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=Dcb5CzXA; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=OLbXOyiH; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="Dcb5CzXA";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="OLbXOyiH"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789217911; x=1789822711; bh=sm+60t/kvXHkjPoj/g
	Rh4LpJ8m7VfGdzadTUcCuTxRM=; b=Dcb5CzXAJr8WnSsIaiz2DWQjoDMWTlp4uIqgn5WmU6m/I
	ghKalv0S360IS2/V8s5CtudzxQzwqL0caKaslw6zHlRs+j1z22OTdBTDSfu3WPqiVevOD9W+TwK
	Q6otS8AxPQ3n0ZRhNynrCtopUJFX4zTuRVSeTc3dcq+gz5deTsvuYxM9SabwvXkQjioo/b2zCLu
	e579kK2lIg7/7XtpQxIwkebIF3Cba/4js81yfsd0gqNFcJjPje1HaHzrwG2T1ENQ4PqQVGCDX2l
	RcCcJT6oHXkKT6Svw5x4eRE15B+xk7XMCNIueSnEsv7glXqvPFfTG2olkUQlizufjO7f0+rg==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789217911; x=1789822711; bh=sm+60t/kvXHkjPoj/g
	Rh4LpJ8m7VfGdzadTUcCuTxRM=; b=OLbXOyiHsOBRlaHVxprHulkacxAryToDBP80IJAgfG95z
	DiPePuYDwAloRfzeVlUs+8EUVXIvIb8sKxfrecg+o3lqEC6kA+AGVKF7TMaYhSJSAzCKJp0uKiJ
	fVxJEwFl50x+KuViKI/1NNW+Fb9CLEq1sWpR/eMPqi3KVB9524wW069NkqPdwJUvJvNtxaFMEOz
	aJbynmzap2dQ29+rSO8/q+qik5T1W3R6BkLAUMrDwGhZKqcO+YMIJcGrrVzV6o+eInC5CfiQug/
	2zd7/9CXi/bn7TeUFGMkBI1dGwrOWR4cYlITsWtJgCZZzRJnzWp4NDpxzLhfJuOQMANEJB+w==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+9782320f78c23f40@bugs.sh>
Message-ID: <51lCz4R7QyTUKbh4mhXNaNzX0evpk0siOzbh@bugs.sh>
Date: Sat, 12 Sep 2026 12:58:27 +0000
Subject: [BUG] drivers/media: divide-by-zero in em28xx_audio_init()
To: linux-media@vger.kernel.org, "Mauro Carvalho Chehab" <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, co <co+9782320f78c23f40@bugs.sh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is a bug report, not a patch submission.

We found a bug reachable in:

    path    drivers/media/usb/em28xx
    crash   divide-by-zero in em28xx_audio_init()
    commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you fix this bug, this tag credits the report and lets us
    close it on our side:

Reported-by: co+9782320f78c23f40@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an unreviewed LLM-generated analysis and candidate
    patch. The same reproducer panics the unpatched kernel and runs
    clean with that patch applied. Use it as a starting point, or ignore
    it and write your own:

        patch.diff  https://bugs.sh/b/9782320f78c23f40/patch.diff
        report.md   https://bugs.sh/b/9782320f78c23f40/report.md

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
    VM setup       https://bugs.sh/b/9782320f78c23f40/run.sh
    config         https://bugs.sh/b/9782320f78c23f40/config.gz
    poc            https://bugs.sh/b/9782320f78c23f40/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Oops: divide error: 0000 [#1] SMP NOPTI
CPU: 0 UID: 0 PID: 795 Comm: kworker/0:2 Not tainted 7.3.0-rc1 #1 PREEMPT(f=
ull)
Workqueue: events request_module_async
RIP: 0010:em28xx_audio_init (drivers/media/usb/em28xx/em28xx-audio.c:718 dr=
ivers/media/usb/em28xx/em28xx-audio.c:870)
Call Trace:
em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
process_one_work (kernel/workqueue.c:3396)
worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
Kernel panic - not syncing: Fatal exception


---
The report format is based on syzbot bug report.

This report is generated by a bot. It may contain errors.
See https://github.com/n132/cedalion for more information.

For any issue with this report, reach out to cedalion@bugs.sh

If the report is already addressed, let us know by replying with:
#co fix: <commit hash>

If the report is a duplicate of another one, reply with:
#co dup: <lore link>

If you want to undo deduplication, reply with:
#co undup


