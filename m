Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793323EAB4
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185639; cv=none; b=CJRrscFfKLMPQUeD46n5kYkOTaWauS7Jn944DPG0idU0nnErVDgliGSfhfE7oYH4v8krAuozdO6onoXIwBrwDUda6/fjnzVci8s3y3SX2N8C19wG1Lu9hySEDwkAUG6SWM/Ukdt26WD29ijMxcebMG0YgPkyswPaXBGCgUPRL3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185639; c=relaxed/simple;
	bh=1d+Por0bocbSxoFfREuvAYP1b8FEJOSmPRRd6rIACaM=;
	h=From:Message-ID:Date:Subject:To:Cc:MIME-Version:Content-Type; b=NGhAcnhi6n1LpLseRosTpTlv/+xQeHBLU5fjExft4+65UU6ojYKBU7UsakCBE7ihTuloDoDMXsOH57UwjmNVUsHkwmMfmimzW74VbsXS+ac+hO4H0K27jm6tMi4bohEYM/ByRLHqjXs+8O2riX6S8E0SI7o+9ppjCXpSI226nTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=QteBdS5W; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=AGEvaKwb; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="QteBdS5W";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="AGEvaKwb"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789185637; x=1789790437; bh=vFNWlatNp/kTMwArr5
	biADJH//EzTuqYz/PS0urgI60=; b=QteBdS5WsZ0U5Qg4Gwk8SXhJTAKGq4Wz/HMrzqu0cMK6e
	8mm+HGeysxHUalZauzgNcepnTpGvbBKYeLy7bWLcvIRCAE7yGcUao8bcnzMELE2r9vng2ITThWI
	s/VBJ5ZBg6qX8XuTYvuPDrWRGwtufSEs4Hn7ar6KBnQep5/a61VWuAzSEHM7yepwlHVFD0GlOd/
	Yp7YVaUWJ0hublMaTtZRmQ7w5H5nN8rXgTFzrrt2wHzAQmuOhYsRY+TWVIV2ha0lq8MTHTcD3Bv
	xCq2SGJVCon+vSGXi7sz5tp9DVckTDHS49F4a0hEs9/6agzFNTzpikePWQpW8GkP8mOkvoOw==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789185637; x=1789790437; bh=vFNWlatNp/kTMwArr5
	biADJH//EzTuqYz/PS0urgI60=; b=AGEvaKwbICNIRmD4yN2Xi1BrWO0tkr5Tru5p4xZssciXh
	oFMtrGvKsW625qR7qSAe0l2c81rrqzR1nQGwIwl6NEujGYY0RapvbwFpUjwBG9+rVk7hNNHWyDO
	Vk0qviLE+S/x1fkHKXW2mgUKcu5YSQH4BiEEDAYNP6b1BCmmPl1ejNcNlUrMZwncD1cMyF8GD9I
	Y336/NboBjB68tm6EN+aZkZYK4205Conrl5hBWKLYNCNxeQmYUbntAjYaGiSuh1m6Y5wycBBmUp
	sGzUepz5tOh6ewQNObt+ym9OdOQtUZ7yU0XdzTQDY9qq8G62XVpzPcti9m/yO3YUwbRNzJ/Q==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+855929c2df672879@bugs.sh>
Message-ID: <gisnub8aWGLbyZLcDCSc7zWsHonMWGcyRgt5@bugs.sh>
Date: Sat, 12 Sep 2026 04:00:31 +0000
Subject: [BUG] sound/usb: out-of-bounds in usb6fire_pcm_in_urb_handler()
To: linux-sound@vger.kernel.org, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
Cc: "Torsten Schenk" <torsten.schenk@zoho.com>, linux-kernel@vger.kernel.org, co <co+855929c2df672879@bugs.sh>
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

    path    sound/usb/6fire
    crash   out-of-bounds in usb6fire_pcm_in_urb_handler()
    commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you fix this bug, this tag credits the report and lets us
    close it on our side:

Reported-by: co+855929c2df672879@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an unreviewed LLM-generated analysis and candidate
    patch. The same reproducer panics the unpatched kernel and runs
    clean with that patch applied. Use it as a starting point, or ignore
    it and write your own:

        patch.diff  https://bugs.sh/b/855929c2df672879/patch.diff
        report.md   https://bugs.sh/b/855929c2df672879/report.md

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
    VM setup       https://bugs.sh/b/855929c2df672879/run.sh
    config         https://bugs.sh/b/855929c2df672879/config.gz
    poc            https://bugs.sh/b/855929c2df672879/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: out-of-bounds in usb6fire_pcm_in_urb_handler (sound/usb/6fire/p=
cm.c:338 (discriminator 3))
Write of size 18446744073709551456 at addr ffff888029af8000 by task vhci_rx=
/5013
Call Trace:
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
__asan_memset (mm/kasan/shadow.c:84 (discriminator 1))
usb6fire_pcm_in_urb_handler (sound/usb/6fire/pcm.c:338 (discriminator 3))
__usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107 (discriminator 1) drivers/usb=
/usbip/vhci_rx.c:242 (discriminator 1) drivers/usb/usbip/vhci_rx.c:265 (dis=
criminator 1))
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
The buggy address belongs to the object at ffff888029af8000
which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 0 bytes inside of
4832-byte region [ffff888029af8000, ffff888029af92e0)
Kernel panic - not syncing: KASAN: panic_on_warn set ...


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


