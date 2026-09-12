Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7929CB52
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178786; cv=none; b=t94tMcBwI0RbcOi9n/6IXlNJIC5mquLP/0hfexV0GsqDDQSpAEjMkxJQJh46l0THdV22fVHjIumUbbgofWlB4wm+45DkDQLEkII8wku5VPh9hZxEgYs2VOUVmEE9+hH1HGfttYR1WHfbhwHWt1CoczRVw2+0qCcnO0lBM66gRes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178786; c=relaxed/simple;
	bh=td6GyIwImmGhWT4VTkMW5JClIDoxxRF1qhS/u1XDUec=;
	h=From:Message-ID:Date:Subject:To:Cc:MIME-Version:Content-Type; b=UBtBy96K9UAF+JnPaw6++6MZ1S4vrPZjUVdCzC3AN8SVzJE6fvMCthgjf72qmbhn490cG8minCU/hQ42jqOv/z23LLsVGrv/XchMFqCrJJO9CJXkDibVtoQFHzpqVprdrBEuVo3Xp5qyVttgxcIwuZ5DEfjlIRE2SfX8zfrRScg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=S303c/yK; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=EakDEQAO; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="S303c/yK";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="EakDEQAO"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789178784; x=1789783584; bh=s7cEpNPauqEJbdAtq7
	FQ1mkywOGre6KQOPStKQvdeMU=; b=S303c/yK5numhk9Ketkjo1fzdhophJh7wXa09ZehEfLVO
	csEkgwNxjvzGmkPMPqivRnLGKPREIRESZsoZ3pAvDEw+cm59hZjQQqXIWdPxTjmhrmXDrqwCl8S
	C1T6598+bwDlak/Wil14M45LF4ig25l5eYGc+HBvEc+PFnpldZRwMpzg057cc8CBGR3WH+5+5lk
	YBLlYv3U67UaKpbS/4+VLl/ECKwsjmBy91X4ly51VvAslMmPgg5KrZsDErKtYCDpxzJHEirgbBF
	pg6nUHzb3w/c4Fa/s6ET9O3outgbCfv1IhhPS23sGTyOPTdFo4oMHlqbUs1RcCmvJVZa9MHA==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789178784; x=1789783584; bh=s7cEpNPauqEJbdAtq7
	FQ1mkywOGre6KQOPStKQvdeMU=; b=EakDEQAOzK5YSMGZup5C9elImljMagPIZA6/IJ+vxjpxq
	Dq8zf4zEIRfEDUE8Je6W3GWT2vpGWrZscsrNWe0IYouN2kZ/oRF+De4LmeK4IOWXz6+L5hg8UnR
	OKgM1tiTTZHdPFvicN/9zbMvC3x4vNsAkAu1jiJe+WPD0mad8x9sevuGzUvcZCeurO4DL92+MPD
	7DY/42KrZI45NV3Hp+sYOfnkYzfoNhpNfC3b0QyQViPzrJjsoXP6dMr/VSJkMhE8fHdYWEbrdNo
	EnD2lZtD/sdgOrI+25Q7I6CzwJWw4zaIVKNu965pGuGbU9H6GijwpFFhDZruOvVKK5UOj12A==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+66c3f58096d0bde8@bugs.sh>
Message-ID: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh>
Date: Sat, 12 Sep 2026 02:06:13 +0000
Subject: [BUG] drivers/usb: NULL pointer dereference in
 stub_recv_cmd_submit()
To: linux-usb@vger.kernel.org, "Valentina Manea" <valentina.manea.m@gmail.com>, "Shuah
 Khan" <shuah@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Hongren Zheng" <i@zenithal.me>, "Suwan Kim" <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org, co <co+66c3f58096d0bde8@bugs.sh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is a bug report, not a patch submission. See
https://bugs.sh/reporting.html

We found a bug reachable in:

    path    drivers/usb/usbip
    crash   NULL pointer dereference in stub_recv_cmd_submit()
    commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you fix this bug, this tag credits the report and lets us
    close it on our side:

Reported-by: co+66c3f58096d0bde8@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an unreviewed LLM-generated analysis and candidate
    patch. The same reproducer panics the unpatched kernel and runs
    clean with that patch applied. Use it as a starting point, or ignore
    it and write your own:

        patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.diff
        report.md   https://bugs.sh/b/66c3f58096d0bde8/report.md

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
    VM setup       https://bugs.sh/b/66c3f58096d0bde8/run.sh
    config         https://bugs.sh/b/66c3f58096d0bde8/config.gz
    poc            https://bugs.sh/b/66c3f58096d0bde8/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Oops: general protection fault, probably for non-canonical address 0xdffffc=
0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 83 Comm: kworker/u8:5 Not tainted 7.2.0 #1 PREEMPT(full)
Workqueue: usbip_event event_handler
RIP: 0010:stub_device_cleanup_urbs (drivers/usb/usbip/stub_main.c:356)
Call Trace:
stub_shutdown_connection (drivers/usb/usbip/stub_dev.c:191)
event_handler (drivers/usb/usbip/usbip_event.c:79)
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


