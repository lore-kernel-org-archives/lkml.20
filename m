Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589637E5D1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217216; cv=none; b=JVOPOnoDhatkarbZeqpbHPdlVGPjZ1qgiy658KpTwpigw4Ys+/gFZRD513AI4pHvqTir3P4o5VzhnZS+CmHXKD3ZmkXLUnv1bEAVxc9dprpgtvBsPNzfBrExE/39mReejF22YHHEaalNrHR31K4MkBn+Q9ycA5hrAklb8g493Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217216; c=relaxed/simple;
	bh=xXBLpspxCmY0/qr2nv2HtBB1tHjxyYnOC0O5hQyu1VM=;
	h=From:Message-ID:Date:Subject:To:Cc:MIME-Version:Content-Type; b=O7eCQWSFhTAC2biCFyDb2U77SY6rW/hJcPwZUMGlAIRIDZRKSzA1JhXSVpwOLMzMttq2FsY6fvJmYz5FC14hUyO7GAwpVUIyiIvK4GX7cFRsfaHbnAmNrodtQFaxPFIj/EG5FJ3YWeJloleGoCVbYmNwCXlwSOiB+qrSE0o6d70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=JXRUZKAu; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=gZjf33D9; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="JXRUZKAu";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="gZjf33D9"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789217214; x=1789822014; bh=N1RtwAEw5wbVOzpske
	sYBc5K0XlDUFuR4cRahIQmaVs=; b=JXRUZKAuiOJtXaPRNX25zcfDVPRyEsfxfajDW28WVHFL/
	ihp6a5ty1ZI+/NH3d+D/EOE7BAqcqLpkITHYE2jWNoWjakhI59PmTQigwYWDPJyAR5k0jjMGLkL
	oCtoKLnEXSBH4p2l4mjLtID48rdp56Q7ymYCc9BgtWcSbQoJpC12Z1P8qZB4Hfys3holjeXPAhA
	xoeWRdMlANOXKmOlEiZYpRCSfIHleaGka6metXLTegNwA1megCSDeMVMLvKss1pICUa7Go7bIdn
	eCDdiln9UYsiyuYX3GunQON5kcPYqjGCPoFUX2s/gQ/z1tOgj779Xld8rOywsv3WnBQz/5Fg==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789217214; x=1789822014; bh=N1RtwAEw5wbVOzpske
	sYBc5K0XlDUFuR4cRahIQmaVs=; b=gZjf33D95LAWkhyNr102vOBaUcoGodB42vtYwBC2Odn7c
	lQT9Aq17Mh7FqlsntNjXeyYxRAQVZO/2JLyeUy6uJM0mEY+OQQbbXW5Z/tF/0avjjAoUfBQSWVy
	KkaIeGa8JojMn/YNSA6/yvvOiUao3LcNia6VpuK5h6F2Aeg1QqaZAU48fxfiYiP9hlQixB/9tWN
	FEsCmnUg0yw1/ANaO+aH1ZilnXLm1uBQUAApl3axs3iHJ7D+AMgyv6yEYvXmOKsL216JzRac5Xn
	hYA4FF3FaHqpBZx3LHqVw+BTCl2JYEbKbXz5O9wUKn/HbqGM9WRKIbc+Qcpt6S/sORDpoRJA==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+f11f93b386afda5d@bugs.sh>
Message-ID: <rvhsRXzc3FhxUM9cmdzPQshyaGy50iIL9t5p@bugs.sh>
Date: Sat, 12 Sep 2026 12:46:49 +0000
Subject: [BUG] drivers/media: out-of-bounds in usbtv_iso_cb()
To: linux-kernel@vger.kernel.org
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil@kernel.org>, "Lubomir
 Rintel" <lkundrak@v3.sk>, linux-media@vger.kernel.org, co <co+f11f93b386afda5d@bugs.sh>
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

    path    drivers/media/usb/usbtv
    crash   out-of-bounds in usbtv_iso_cb()
    commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you fix this bug, this tag credits the report and lets us
    close it on our side:

Reported-by: co+f11f93b386afda5d@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an unreviewed LLM-generated analysis and candidate
    patch. The same reproducer panics the unpatched kernel and runs
    clean with that patch applied. Use it as a starting point, or ignore
    it and write your own:

        patch.diff  https://bugs.sh/b/f11f93b386afda5d/patch.diff
        report.md   https://bugs.sh/b/f11f93b386afda5d/report.md

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
    VM setup       https://bugs.sh/b/f11f93b386afda5d/run.sh
    config         https://bugs.sh/b/f11f93b386afda5d/config.gz
    poc            https://bugs.sh/b/f11f93b386afda5d/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in usbtv_iso_cb (drivers/media/usb/usbtv/usb=
tv-video.c:390 (discriminator 6) drivers/media/usb/usbtv/usbtv-video.c:435 =
(discriminator 6) drivers/media/usb/usbtv/usbtv-video.c:492 (discriminator =
6))
Read of size 480 at addr ffff88802d529e5c by task vhci_rx/5017
Call Trace:
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
__asan_memcpy (mm/kasan/shadow.c:105 (discriminator 1))
usbtv_iso_cb (drivers/media/usb/usbtv/usbtv-video.c:390 (discriminator 6) d=
rivers/media/usb/usbtv/usbtv-video.c:435 (discriminator 6) drivers/media/us=
b/usbtv/usbtv-video.c:492 (discriminator 6))
__usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107 (discriminator 1) drivers/usb=
/usbip/vhci_rx.c:242 (discriminator 1) drivers/usb/usbip/vhci_rx.c:265 (dis=
criminator 1))
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
Allocated by task 5013:
kasan_save_stack (mm/kasan/common.c:57)
kasan_save_track (mm/kasan/common.c:78)
__kasan_kmalloc (mm/kasan/common.c:398 mm/kasan/common.c:415)
__kmalloc_noprof (./include/linux/kasan.h:263 mm/slub.c:5414 mm/slub.c:5439)
usbtv_start_streaming (./include/linux/slab.h:995 ./include/linux/slab.h:12=
11 drivers/media/usb/usbtv/usbtv-video.c:517 drivers/media/usb/usbtv/usbtv-=
video.c:586 drivers/media/usb/usbtv/usbtv-video.c:771)
vb2_start_streaming (drivers/media/common/videobuf2/videobuf2-core.c:1783 (=
discriminator 1))
vb2_core_streamon (drivers/media/common/videobuf2/videobuf2-core.c:2336)
vb2_ioctl_streamon (drivers/media/common/videobuf2/videobuf2-v4l2.c:862 dri=
vers/media/common/videobuf2/videobuf2-v4l2.c:1105)
__video_do_ioctl (drivers/media/v4l2-core/v4l2-ioctl.c:3135)
video_usercopy (drivers/media/v4l2-core/v4l2-ioctl.c:3477)
v4l2_ioctl (drivers/media/v4l2-core/v4l2-dev.c:366)
__x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:597 fs/ioctl.c:583 fs/ioctl.c:583)
do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:8=
4)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
The buggy address belongs to the object at ffff88802d528000
which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 7772 bytes inside of
allocated 8000-byte region [ffff88802d528000, ffff88802d529f40)


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


