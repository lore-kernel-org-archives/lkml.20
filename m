Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAEB3C8737
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834595; cv=none; b=OXggQidwqMIhk8cccPMamiffwkuQl/ExxzeXNgwkaOXJQbEtcveL273KANZl/3O9PaODbVFFhLIqg9B6q3dfTC2/QgV1Qk94h1fX4EEPh2F7+cxVAhHqPyGa7RxjcPd4wQ6qkJbl6qHdEbGwGzvfi/pWYyQ20Ja+GEW37TL/WWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834595; c=relaxed/simple;
	bh=Z9WWPhST0hlrLitTRphRtM/V0v7qIm2z9Lsrp4GTf88=;
	h=From:Message-ID:Date:Subject:To:MIME-Version:Content-Type; b=CfxingaVPegG/KtQ0YaICvuBE9lZMb3i7mB2yHTluTtllDHggpa+KdXOBLfBwc+GeSojnN8DNdxHwRFCEI7Ahz1EAcKddtZUqt0CQLEmWi+QOPLKMbGxv/5/NrtT4qa9T5TV59jNXRNWHKP6+jzI+FgYHNuMIwhiulnREfiw2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=hMOZzSzj; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=fSHYXEVi; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="hMOZzSzj";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="fSHYXEVi"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=To:Subject:Date:From:Feedback-ID:from:reply-to:cc:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1787834586; x=1788439386; bh=cotsfsblR1DSPJX7et
	zLpHcOzcyhluHcTjEwvPf0RxA=; b=hMOZzSzjnf8XtpgBdcolkiBbtx4mqy8WrKl4Qiij6FCiv
	/wYNenOU/hU9oWFeZrhtVBRiitl0I0LCx1Lp623mna4bhApnMXjDDXD8aEMJGPd3vc/Gmcey8ib
	wlMY+xMQKh4z8qyYj4qD5r+fLd1xPbQJNUYUmVq05adb996NuwVeTIhmtTzIMyxaiILbgJgQfOm
	xW6kMy4RR2kTmUtTRBpaTdS0HQxr8EDpcXILhOpz6kO7IRuKDkhIYJefLy+2hxXDHgrKfA5iGRv
	o0T0sfhJh1zYxPlU+CIk1tztRLD2DMsQG4YpYlqYlyRyboRJPAjbAPd5qE1Gwndz+B9ymuBw==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=To:Subject:Date:From:Feedback-ID:from:reply-to:cc:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1787834586; x=1788439386; bh=cotsfsblR1DSPJX7et
	zLpHcOzcyhluHcTjEwvPf0RxA=; b=fSHYXEViGcibGI62bT4olwkT1nHJVCSeqPRjTVF/YeF3o
	Hdvzv2gQGF1dRoKofLJlLqsAB9zus7NgZ1SFUZTmhuA8tVM+8IL8MbgfgWlbs4gZoiwDPy8xFrS
	3+cuWUwOOpXqcTTJquSWx11vvhm0qlqD6lpM6/bIE9rxGXQIU2N92viJMeubyn1gfgKjI+NWoWi
	0Nz2R2YWfbk5x5itn/O76btJPd2ulS9SQz4ndh8P7qobvJr8PlnlB/U7BrtoADRna2GorwkUznZ
	00mN20vSFRGTLpTp6KG80GSGEza/h0EOb4FJA4iXg4YUYMqqrhWIS7Ngy/3eDsZrfSNX9FSg==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+e5693071d903b832@bugs.sh>
Message-ID: <sQDn678D0YppKseC8dIUC0I6uKmzsrOVtoN1@bugs.sh>
Date: Thu, 27 Aug 2026 12:42:57 +0000
Subject: [BUG] drivers/tty: NULL pointer dereference in paste_selection()
To: speakup@linux-speakup.org, "William Hubbs" <w.d.hubbs@gmail.com>, "Chris
 Brannon" <chris@the-brannons.com>, "Kirk Reiser" <kirk@reisers.ca>, "Samuel
 Thibault" <samuel.thibault@ens-lyon.org>, "Petr Mladek" <pmladek@suse.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Oleg Nesterov" <oleg@redhat.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, "Song
 Liu" <song@kernel.org>, "Greg Kroah-Hartman" <gregkh@suse.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

We found a bug reachable in:

    path    drivers/tty/vt/selection.c` (fault site), `drivers/accessibilit=
y/speakup/main.c` + `drivers/accessibility/speakup
    crash   NULL pointer dereference in paste_selection()
    commit  f5098b6bae76 ("Linux 7.2-rc5")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you patch the bug based on our artifacts, a tag would be
    appreciated:

Reported-by: co+e5693071d903b832@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an LLM-generated root-cause analysis and a candidate
    patch. The patch passes an A/B test: the same reproducer panics the
    unpatched kernel and runs clean on the patched one. Neither has had
    human review, so both still require validation before you send or
    apply them. Available on:

        patch.diff  https://bugs.sh/b/e5693071d903b832/patch.diff
        report.md   https://bugs.sh/b/e5693071d903b832/report.md

    This is an open science project. The code and the full set of PoCs
    are not public at this moment, as we intend to disclose our findings
    in an ethical way.

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  f5098b6bae76 ("Linux 7.2-rc5")
    VM setup       https://bugs.sh/b/e5693071d903b832/run.sh
    config         https://bugs.sh/b/e5693071d903b832/config.gz
    poc            https://bugs.sh/b/e5693071d903b832/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Oops: general protection fault, probably for non-canonical address 0xdffffc=
0000000044: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000220-0x0000000000000227]
CPU: 1 UID: 0 PID: 49 Comm: kworker/1:1 Not tainted 7.2.0-rc5 #10 PREEMPTLA=
ZY
Workqueue: events __speakup_paste_selection
RIP: 0010:paste_selection (drivers/tty/vt/selection.c:393)
Call Trace:
__speakup_paste_selection (drivers/accessibility/speakup/selection.c:112)
process_one_work (kernel/workqueue.c:3322)
worker_thread (kernel/workqueue.c:3405 kernel/workqueue.c:3486)
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


