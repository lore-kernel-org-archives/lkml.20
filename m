Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31285CA6F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227437; cv=none; b=KS8GdKPC0iqicb9itMMJVRtpFPzFlDt7MqvVtceFqaqemkBVbpNrYP3NwcZ9YzFdRkFRq1mTkFq2dNh5Z+yek5vsBMMU0hTG/2mCung8Gy4rUYMKHvFTj9aR1e4p2w1yYyqPVL+GBu3noZySSHNCPokSv0BYxJINaZCQzPkN2wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227437; c=relaxed/simple;
	bh=9D5/4FORv72k+5rN2KBqHXPWNG6InAm6xGxG/0ZvL5Y=;
	h=From:Message-ID:Date:Subject:To:Cc:MIME-Version:Content-Type; b=Qcmm51BmBviGly0XgFn/9toCD76vbFq740Shv9oTplT529orlkrepcnl2Pe3N/S5/qDEftdeb2yEogfK3IWTOCGttIFpMOB0aelyfd1ZyMDuVtmvRFO2iaq8Qo+WAdUnwmRubNt3M6fycVo5DcFsrSwxFEXpRG3ZCatMKVU9Zhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=Hy2J03wD; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=YvEQGghR; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="Hy2J03wD";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="YvEQGghR"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789227435; x=1789832235; bh=pw7BzzxvhimaajakrJ
	3z6za2n8++20QAAsxZ657rXWE=; b=Hy2J03wDFGELY689Sy7uvBdHR621pGS3fhHXKYdHwu1B4
	mgTHKcPGeJMDbRpNoqChkyWstReGAJ0IzHg1Mp/zeLT9Au0MeCIEWKQkbjw7VXEyK80M3eqDzHd
	03llQDKL7qEbQqdpVBDKFEaO+TqaH8oGYbQWLQeIuyjNvEZD4qzEHxOBF5GA2v85a+bxiZPCgoX
	Txz2nqUFW14NR+Bk+P0vAkTQQoQOugcennOS0XNW/6b1t0tqGCyVshyIBqB3gSG1YANIiHk+eSP
	KNxZqdFM+UFMKxGoyTU3IIWuy1294kDsmOR/TIxHGKSrQ+7lBgd8VrTjyPHHkSGBcF9wE0xQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=Cc:To:Subject:Date:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1789227435; x=1789832235; bh=pw7BzzxvhimaajakrJ
	3z6za2n8++20QAAsxZ657rXWE=; b=YvEQGghRpcdTaULFGhwwnaY95CuRyC5CjEnjJT0m++y1Z
	mH0w/jYsfRaE+3+5FeSrhxBkBPO1VfrQ4vGQZUAjauTmHOsS3xdK4vzSis0MaPd0lcvWgA6LMZQ
	QmhHDSeHpKZp3q361qrjAdqvK8yIoSxCsRS+vdYKBA2GMCvmPaxCnF2PHbCsxCwlNayziMs1IOQ
	elIBcMT2Q6q9MuMGNBb3YNpe4QUml9w6TWrWgmwahWU7XqxtcU+UZIVJUUyVXGaEevBAnpRUpx7
	qV7FHlLVAQK2cAHySfX68hYCNKTzpL38KY52bZtAWxzMYJaxZi1+We2AKUg+h4F6gD0/EGOg==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+77553a7fc66ac133@bugs.sh>
Message-ID: <Ah6QavQXwvshtqyUcYD1P1R7XE0ND9fB7lbV@bugs.sh>
Date: Sat, 12 Sep 2026 15:37:09 +0000
Subject: [BUG] drivers/nvme: out-of-bounds in nvmet_execute_auth_receive()
To: linux-nvme@lists.infradead.org, "Hannes Reinecke" <hare@suse.de>, "Christoph
 Hellwig" <hch@lst.de>, "Sagi Grimberg" <sagi@grimberg.me>, "Chaitanya
 Kulkarni" <kch@nvidia.com>
Cc: "Jens Axboe" <axboe@kernel.dk>, linux-kernel@vger.kernel.org, co <co+77553a7fc66ac133@bugs.sh>
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

    path    drivers/nvme/target
    crash   out-of-bounds in nvmet_execute_auth_receive()
    commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you fix this bug, this tag credits the report and lets us
    close it on our side:

Reported-by: co+77553a7fc66ac133@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an unreviewed LLM-generated analysis and candidate
    patch. The same reproducer panics the unpatched kernel and runs
    clean with that patch applied. Use it as a starting point, or ignore
    it and write your own:

        patch.diff  https://bugs.sh/b/77553a7fc66ac133/patch.diff
        report.md   https://bugs.sh/b/77553a7fc66ac133/report.md

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
    VM setup       https://bugs.sh/b/77553a7fc66ac133/run.sh
    config         https://bugs.sh/b/77553a7fc66ac133/config.gz
    poc            https://bugs.sh/b/77553a7fc66ac133/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in nvmet_execute_auth_receive (drivers/nvme/=
target/fabrics-cmd-auth.c:451 drivers/nvme/target/fabrics-cmd-auth.c:578)
Write of size 32 at addr ffff88802363c790 by task kworker/1:0H/26
CPU: 1 UID: 0 PID: 26 Comm: kworker/1:0H Not tainted 7.3.0-rc1 #2 PREEMPT(f=
ull)
Workqueue: nvmet_tcp_wq nvmet_tcp_io_work
Call Trace:
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
__asan_memcpy (mm/kasan/shadow.c:106 (discriminator 1))
nvmet_execute_auth_receive (drivers/nvme/target/fabrics-cmd-auth.c:451 driv=
ers/nvme/target/fabrics-cmd-auth.c:578)
nvmet_tcp_try_recv_pdu (drivers/nvme/target/tcp.c:1134 drivers/nvme/target/=
tcp.c:1258)
nvmet_tcp_io_work (drivers/nvme/target/tcp.c:1365 drivers/nvme/target/tcp.c=
:1397 drivers/nvme/target/tcp.c:1460)
process_one_work (kernel/workqueue.c:3396)
worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
Allocated by task 26:
kasan_save_stack (mm/kasan/common.c:57)
kasan_save_track (mm/kasan/common.c:78)
__kasan_kmalloc (mm/kasan/common.c:398 mm/kasan/common.c:415)
__kmalloc_noprof (./include/linux/kasan.h:263 mm/slub.c:5414 mm/slub.c:5439)
nvmet_execute_auth_receive (./include/linux/slab.h:995 ./include/linux/slab=
.h:1312 drivers/nvme/target/fabrics-cmd-auth.c:569)
nvmet_tcp_try_recv_pdu (drivers/nvme/target/tcp.c:1134 drivers/nvme/target/=
tcp.c:1258)
nvmet_tcp_io_work (drivers/nvme/target/tcp.c:1365 drivers/nvme/target/tcp.c=
:1397 drivers/nvme/target/tcp.c:1460)
process_one_work (kernel/workqueue.c:3396)
worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
The buggy address belongs to the object at ffff88802363c780
which belongs to the cache kmalloc-64 of size 64
The buggy address is located 16 bytes inside of
allocated 33-byte region [ffff88802363c780, ffff88802363c7a1)


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


