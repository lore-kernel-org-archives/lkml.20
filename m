Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043C449B35
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834656; cv=none; b=bZiIqoFZZFsFx6DxKTBTsu6MMBTzxfCe/RokG+Bx7JrLDnoynn8SStw4KnA4spsx8SIwCJmR/1n4oyX8K0xjVfoxGAlKTdom3HHEEXezFaMtPGfulzZm08xjAmgB8Vc2mBCKTo4ux01iUnb3xxubOYo3g3Rz4JHaZjTnmfmuDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834656; c=relaxed/simple;
	bh=14T8OveI85rEOKNYcA4C63uM9Z+04kwOq5TRLekMaU8=;
	h=From:Message-ID:Date:Subject:To:MIME-Version:Content-Type; b=J719CMFnNAdYJzXBnIcGQ6CJLI7KkVToc6W8ltJSBlvnHzed1GM8lksoYMdTF/Pgwe2jiDF9f2JL9CaJU6hlf/NWyWArLfuAmHTsyFglrVdK/Oz9reLV1tLb9t5HEA6XvYI8j0W/SLkn9XEeDpdCYXDp5kQ3O7Ntw23xE+Gdx38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=ZVQpdaVJ; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=Xw0YVsaK; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="ZVQpdaVJ";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="Xw0YVsaK"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=To:Subject:Date:From:Feedback-ID:from:reply-to:cc:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1787834648; x=1788439448; bh=aHWHG/lhF0ZHdimx0Y
	6NP7K74OaN0ZNtNynBZeI1nbY=; b=ZVQpdaVJ6ZVfcVBy7aKdlPwTW7hE6lWE9R4orMhAl53rv
	D2T/fVydO59tIX7wBOt4l53d3yL2bEXGWeDXi3xN+qnFLUHK03WA6TX/WYCd5L8boZzmdjBp3q1
	PF+gc93Z72Q+qRmCOuYDQimt418ADBT64dJpLxtGiWDiEsY1HPVZuzLWwicLEX0yUVbyDWG0Smb
	t4qssM2u8MHe8WhFAVUgDuTM+AVcCB8zu5HKB78MGg7NgnGws2jG6/Gq8O0Rr2t+vqX5SwRbJC4
	tWqeMFYYjS+NDPwzjQAOH/4LuPibv3MYZGLpFoYsOrh12/+yrtKJFWWLTKjglUFNCgL1ABZw==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=To:Subject:Date:From:Feedback-ID:from:reply-to:cc:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1787834648; x=1788439448; bh=aHWHG/lhF0ZHdimx0Y
	6NP7K74OaN0ZNtNynBZeI1nbY=; b=Xw0YVsaK+Akccjht4EaOo0fCH3JElKFF1pO+So+8mWrff
	8piz+5cw7PKq9fzVzOANLZ/g2XZveNEnE8VoKS03XXrIkA1Y82/GxMgSLaQxbikiwp4m+aH9q3C
	FF/htqyeHGx5zlYumjkDw+cWvRjux3OY2J5qmF0uP2W0GVto+NuYKtGqqiWAvrbUB0dHScGfadw
	d6srmAZwXDMcuHWF4xIQZFyNDe19iPufUV/WW1wQwgBjpip23mPr1omFTb/lcC6rweu3IzgGjVM
	ch7pLH52mvThI9BYOELD1iSDMiPQNDHt4CO/9coBqh/vZPw2+cGt9v5fpyDONJm5IuXzqROA==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+fd80bc5967eb22c3@bugs.sh>
Message-ID: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh>
Date: Thu, 27 Aug 2026 12:43:58 +0000
Subject: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
To: linux-usb@vger.kernel.org, "Mathias Nyman" <mathias.nyman@intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

We found a bug reachable in:

    path    drivers/usb/host
    crash   out-of-bounds in xhci_queue_bulk_tx()
    commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/=
pub/scm/linux/kernel/git/soc/soc")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you patch the bug based on our artifacts, a tag would be
    appreciated:

Reported-by: co+fd80bc5967eb22c3@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an LLM-generated root-cause analysis and a candidate
    patch. The patch passes an A/B test: the same reproducer panics the
    unpatched kernel and runs clean on the patched one. Neither has had
    human review, so both still require validation before you send or
    apply them. Available on:

        patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
        report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md

    This is an open science project. The code and the full set of PoCs
    are not public at this moment, as we intend to disclose our findings
    in an ethical way.

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kern=
el.org/pub/scm/linux/kernel/git/soc/soc")
    VM setup       https://bugs.sh/b/fd80bc5967eb22c3/run.sh
    config         https://bugs.sh/b/fd80bc5967eb22c3/config.gz
    poc            https://bugs.sh/b/fd80bc5967eb22c3/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in xhci_queue_bulk_tx (drivers/usb/host/xhci=
-ring.c:3564 (discriminator 6) drivers/usb/host/xhci-ring.c:3673 (discrimin=
ator 6))
Write of size 1024 at addr ffff88801489b400 by task exploit/146
CPU: 0 UID: 0 PID: 146 Comm: exploit Not tainted 7.2.0+ #9 PREEMPTLAZY
Call Trace:
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
__asan_memcpy (mm/kasan/shadow.c:106 (discriminator 1))
xhci_queue_bulk_tx (drivers/usb/host/xhci-ring.c:3564 (discriminator 6) dri=
vers/usb/host/xhci-ring.c:3673 (discriminator 6))
xhci_urb_enqueue (drivers/usb/host/xhci.c:1701)
usb_hcd_submit_urb (drivers/usb/core/hcd.c:1542)
proc_do_submiturb (drivers/usb/core/devio.c:1967)
usbdev_ioctl (drivers/usb/core/devio.c:2002 drivers/usb/core/devio.c:2702 d=
rivers/usb/core/devio.c:2826)
__x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:597 fs/ioctl.c:583 fs/ioctl.c:583)
do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:8=
4)
entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
Allocated by task 75:
The buggy address belongs to the object at ffff88801489b400
which belongs to the cache kmalloc-512 of size 512
The buggy address is located 0 bytes inside of
allocated 512-byte region [ffff88801489b400, ffff88801489b600)
The buggy address belongs to the physical page:
Memory state around the buggy address:
ffff88801489b500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ffff88801489b580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88801489b600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
^
ffff88801489b680: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
ffff88801489b700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc


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


