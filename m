Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F650377A9F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178973; cv=none; b=cxw5nBGy5nLrIaNsz3gy3wxNXRMtpONNla17PeHI/5ok1cSnAJGYWrj8pjHrpq7JMB9bRAropVXVjLN/FzZ1VN6iFZxE4RXHlsI3Te5abvZuzamkwszesiDZsIw9UEQSxC+4aJ8kD8JeSqq/5mzBiblWtPnBUZBhORhiH7jvLu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178973; c=relaxed/simple;
	bh=vN+nF9js0nIim9f0Bq4IXMLRkg5YTl6RTxKipCJKgfw=;
	h=From:Message-ID:Date:Subject:To:Cc:MIME-Version:Content-Type; b=hZ3id+XvWXQSwmDlXMdhc+uVHZ1zQYb6axt/8tmHWW2EopgRWfnT8IhIBwcCeQvm8YE2rO2cfEP5qlMkqzrsgpcRW1kRaHOu4QJXyU988qIaQTQYZdL6Bg27cFwn0gALC27B6ZQKw1Cyh3VaromaIN2IH7zGR7sbNqsWPv+0KqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=DAhUj0PI; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=AbVnAqf2; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="DAhUj0PI";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="AbVnAqf2"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789178970; x=1789783770; bh=8mPvCP6KB88PfMvo3n
	u/NxaHZ9VX0cXbMP5Jp6ibmtw=; b=DAhUj0PIgXfXxXaXWJAgn8w10KcaVpZbGPRnrCjzLi2Pv
	/mLKBzpzZJcQLNnM3+NPQIXefR4Ej1gd3S/yLC/feVva1rI9drw7RRPl/Kqv30Sc3D/9KuG9GPD
	TQf7dexZ/D+5o+a47niQfQLvgJlVAg/fRv+c7EGSKIOzNbS07w8N6N5rQ3cLe5v8+gNv/ZCbcDf
	RnHFOAs/qCLalYq2jngwRS4NufPmTleKu+aOX79eHf97Fk6vQv7fI4xtHx6m1mvccnb2tQYwoWG
	LWrMJXIkLeCtL7sqbXxqfrL34woeWUhH1016sCrbSs2/L0PBd6aDd2lcioO7G/WGvp1nAYYA==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789178970; x=1789783770; bh=8mPvCP6KB88PfMvo3n
	u/NxaHZ9VX0cXbMP5Jp6ibmtw=; b=AbVnAqf2WKZ87EDN//+D4ts+nKYLOq8es/LeKpYJzwbEj
	mAuaRSATBxSrBsuAThEO5FQkuxDAhg57d0+y20yyFT8JjSbr5ME1f/yRhwwMHY6IDSnVybbcaCT
	iS8lj5UzxbO/X9dn0zR3EvnHBARfqNHONfBHewbh9PLZfz47+MYwTTOBoX0HA9Sy6zl0EkUnTUE
	RWAMuIk3Dn0y57OtQ+HspUNeZtpJTOxMhhdAwhgozA8asiyfsZ+K2QluWpXlT0HaU42Vx11+2ek
	lnwwoiPlSM/GC9LMKZHOY//W/Zvw/jIpG4xVwY/T3rYP00l1/HXhLyWTaZQSeAJVOxNaKAdQ==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+8eacd4fa193b1b28@bugs.sh>
Message-ID: <22xPn8drvIUtYgVeQnBiNqXuevOTpBAjepLz@bugs.sh>
Date: Sat, 12 Sep 2026 02:09:23 +0000
Subject: [BUG] sound/usb: out-of-bounds in prepare_playback_urb()
To: linux-sound@vger.kernel.org, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, co <co+8eacd4fa193b1b28@bugs.sh>
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

    path    sound/usb/endpoint.c` (the overwrite) and `sound/usb
    crash   out-of-bounds in prepare_playback_urb()
    commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you fix this bug, this tag credits the report and lets us
    close it on our side:

Reported-by: co+8eacd4fa193b1b28@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an unreviewed LLM-generated analysis and candidate
    patch. The same reproducer panics the unpatched kernel and runs
    clean with that patch applied. Use it as a starting point, or ignore
    it and write your own:

        patch.diff  https://bugs.sh/b/8eacd4fa193b1b28/patch.diff
        report.md   https://bugs.sh/b/8eacd4fa193b1b28/report.md

    A guide to taking it from here to a sendable patch, including the
    trailers to add: https://bugs.sh/patch.html

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
    VM setup       https://bugs.sh/b/8eacd4fa193b1b28/run.sh
    config         https://bugs.sh/b/8eacd4fa193b1b28/config.gz
    poc            https://bugs.sh/b/8eacd4fa193b1b28/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in prepare_playback_urb (sound/usb/pcm.c:156=
0)
Write of size 4 at addr ffff88801e696ad0 by task vhci_rx/178
CPU: 1 UID: 0 PID: 178 Comm: vhci_rx Not tainted 7.2.0-rc7+ #15 PREEMPT(laz=
y)
Call Trace:
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
prepare_playback_urb (sound/usb/pcm.c:1560)
prepare_outbound_urb (sound/usb/endpoint.c:340)
snd_usb_queue_pending_output_urbs (sound/usb/endpoint.c:501)
snd_complete_urb (sound/usb/endpoint.c:1834 sound/usb/endpoint.c:269 sound/=
usb/endpoint.c:587)
__usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107 (discriminator 1) drivers/usb=
/usbip/vhci_rx.c:242 (discriminator 1) drivers/usb/usbip/vhci_rx.c:265 (dis=
criminator 1))
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
Allocated by task 174:
The buggy address belongs to the object at ffff88801e696a00
which belongs to the cache kmalloc-256 of size 256
The buggy address is located 0 bytes to the right of
allocated 208-byte region [ffff88801e696a00, ffff88801e696ad0)
The buggy address belongs to the physical page:
Memory state around the buggy address:
ffff88801e696980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
ffff88801e696a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88801e696a80: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
^
ffff88801e696b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
ffff88801e696b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc


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


