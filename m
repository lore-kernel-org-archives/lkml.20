Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7240733AD88
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789191641; cv=none; b=DDqu8obhHP0G/7s6+Oli2rjNMj+lnr87VRqA2UgHvQw/rF21nIira9Y5FIU4eSOCK2uMj/OIYnHpDLnVUz4XngJlvkkR3lyJqpv6rJGudR3gEpPzenlvJe+rfxvybMtHlN/uYDm+betBQSPDFr6PWKIGObFRSC1e/slGBQBjHYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789191641; c=relaxed/simple;
	bh=AVFTtRNF3h7s9IW7PSnoIBm7DbhIh0gOiCqVQ/5um5Q=;
	h=From:Message-ID:Date:Subject:To:Cc:MIME-Version:Content-Type; b=q+h02XgQmmHn7zckr4KgsufSvWzpqnvLtzOpfx9eHjnf8bovzMXK9e+/CRSaw1BMmVy7bBua7ZcbXrdlXJmAy+ywGcUg5xn+6nMxxy9mHo7hzdA89no4USq4D4CKZvGr4m9z8KgL8Gm9hlTS37QiyFsJwHS6zuMbl/WQOFVKvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=OT817POt; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=NhRsWway; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="OT817POt";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="NhRsWway"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789191639; x=1789796439; bh=0skql6IxB9Cx5z7fbO
	/hUts1ldZLaqznB9PxRbUjB3A=; b=OT817POt5SeXJTZR6NBRWgXQdMnNgKLKaLkpAlO0Ov1IB
	ZsL/u6FuMDfwrealcanhFfo6SYnONVPHYetkns4e7ZueUTfOo8koOvVcTKBJacPw8bR1mhRa2C7
	MpjlDQYY1yTkwj58zTEKTbwLZqeU/QgNdY0jd5OtRu/Q/1rpkO9oS1VAb3rNkD4RqSrGzlt0fIV
	JKNATdkC0JlE8v4x5DFYHNS989t1UdOi/QVMKb0sfVaHyo8qgN8bULi5y7hIk2orweoAxDt1clz
	CB21cT9QIAtk8X1dwe9S0Mlqh4PhG6M4DBzhKNLSVCfFbUnw8+/aOw7LMAzf6ebc5ZtYp/Qg==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789191639; x=1789796439; bh=0skql6IxB9Cx5z7fbO
	/hUts1ldZLaqznB9PxRbUjB3A=; b=NhRsWwaydeeu+cpfI99ktzoTx16tN8GjDWqAIhoMvT0pi
	rgfg7Y4RyHCLcOUlLkxwZmfN8kyTo6yHouCwL7goiVUUUzvmHfbgF1C2J6hcScdSf2HqT1lD3dk
	JSKEFPeqwOipQm899DOLApEqgYa29HN5JXHPgh3S6rWI8D+OX+Mm7u2QKKnqI5ZgJI//IDwCnxZ
	mgYYSG3XcZ046s6sHMIejAHtijqOdmKW+wmYCEdLGC4sy6/g0J3N2bBFJePmEA2v5iJv0mEbRh6
	gcKVVf2OSG3huXOc5M+orgQ7QlyFAY8fSWvVdgo71hdFKl5HOHPYMZO87DC9dQIu2LoyAPlA==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+24304d323d28f156@bugs.sh>
Message-ID: <NsHiC1aDlk3ubZhtmWTOpc86mDwYEy9nkk6V@bugs.sh>
Date: Sat, 12 Sep 2026 05:40:34 +0000
Subject: [BUG] sound/usb: out-of-bounds in start_usb_playback()
To: linux-sound@vger.kernel.org, "Clemens Ladisch" <clemens@ladisch.de>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, co <co+24304d323d28f156@bugs.sh>
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

    path    sound/usb/misc
    crash   out-of-bounds in start_usb_playback()
    commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you fix this bug, this tag credits the report and lets us
    close it on our side:

Reported-by: co+24304d323d28f156@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an unreviewed LLM-generated analysis and candidate
    patch. The same reproducer panics the unpatched kernel and runs
    clean with that patch applied. Use it as a starting point, or ignore
    it and write your own:

        patch.diff  https://bugs.sh/b/24304d323d28f156/patch.diff
        report.md   https://bugs.sh/b/24304d323d28f156/report.md

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
    VM setup       https://bugs.sh/b/24304d323d28f156/run.sh
    config         https://bugs.sh/b/24304d323d28f156/config.gz
    poc            https://bugs.sh/b/24304d323d28f156/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in start_usb_playback (sound/usb/misc/ua101.=
c:586 (discriminator 3))
Write of size 2048 at addr ffff88802322f700 by task exploit/5017
CPU: 1 UID: 0 PID: 5017 Comm: exploit Not tainted 7.2.0-rc7 #1 PREEMPT(full)
Call Trace:
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
__asan_memset (mm/kasan/shadow.c:84 (discriminator 1))
start_usb_playback (sound/usb/misc/ua101.c:586 (discriminator 3))
playback_pcm_open (sound/usb/misc/ua101.c:679)
snd_pcm_open_substream (sound/core/pcm_native.c:2827)
snd_pcm_open (sound/core/pcm_native.c:2863 sound/core/pcm_native.c:2928)
snd_pcm_playback_open (sound/core/pcm_native.c:2888 sound/core/pcm_native.c=
:2880)
snd_open (sound/core/sound.c:166)
chrdev_open (fs/char_dev.c:411)
do_dentry_open (fs/open.c:947)
vfs_open (fs/open.c:1052)
path_openat (fs/namei.c:4700 fs/namei.c:4863)
do_file_open (fs/namei.c:4892)
do_sys_openat2 (fs/open.c:1368 (discriminator 1))
__x64_sys_openat (fs/open.c:1374 fs/open.c:1390 fs/open.c:1385 fs/open.c:13=
85)
do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:9=
4)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
Allocated by task 10:
__kmalloc_noprof (./include/linux/kasan.h:263 mm/slub.c:5334 mm/slub.c:5359)
hcd_buffer_alloc (./include/linux/slab.h:992 drivers/usb/core/buffer.c:134)
usb_alloc_coherent (drivers/usb/core/usb.c:1011)
alloc_stream_buffers (sound/usb/misc/ua101.c:1031)
ua101_probe (sound/usb/misc/ua101.c:1244)
usb_probe_interface (drivers/usb/core/driver.c:396)
The buggy address belongs to the object at ffff88802322f700
which belongs to the cache kmalloc-192 of size 192
The buggy address is located 0 bytes inside of


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


