Received: from bg-bec.cloudflare-smtp.org (bg-bec.cloudflare-smtp.org [104.30.16.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A9332ED54
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.30.16.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834549; cv=none; b=PUTNmMdj0stjEoIYaEWMyY9xm1PIG/3RqNEmfgRb8c6nJYzhp5PZ9HyAH0ZmppybG+MyetcbJRIRrn+nO9LrIRVP08OF147RSMlgskvS9eaa9c0e+ClMI+4JvZ+GSXGK4BGNIUIDTF5l0TXZjynuZxPGjuEtjsDH4aprK0JX+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834549; c=relaxed/simple;
	bh=A2+7KxGmZi0u9XnLwqivnwOOMY1iSd18jvonv+28HJY=;
	h=From:Message-ID:Date:Subject:To:MIME-Version:Content-Type; b=C2NfWsyM141LiPA1x3j6G71FXu7m1ft5mToPb9E+OZ/C2w4gLeleNuUonah6Z4zFC+v+utMs/9rTILUenUnJJBz9Jn866NUJa7CGA9A0dZ+tWJpxstXfExoBSI+Mt4W93XRSiow2AW6XyXHa/18a8DdVaOpgx5LjevA+YzrwwpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh; spf=pass smtp.mailfrom=cf-bounce.bugs.sh; dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b=PE2YEXYf; dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b=Et656FQb; arc=none smtp.client-ip=104.30.16.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bugs.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.bugs.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare-smtp.org header.i=@cloudflare-smtp.org header.b="PE2YEXYf";
	dkim=pass (2048-bit key) header.d=bugs.sh header.i=@bugs.sh header.b="Et656FQb"
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.org; c=relaxed/relaxed;
	h=To:Subject:Date:From:Feedback-ID:from:reply-to:cc:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1787834545; x=1788439345; bh=WSnMBOH26cqGE5R86J
	spU+UVduqfAcRYNuDrzj+xhdg=; b=PE2YEXYf4igsC2eBo0/UC/zmbQcwpSs6zrxLk938E9r7Q
	XHAEWbb/GZ8nDR/DTanUDWJ+BxNP1DlhVnZ7gIJVi05V5WVUKqs+Bhehw0wXJ4RcBLGZL8BRuM9
	KU8Om5V5AC53Klt3iEp/Kyull0ur8IyIAJcU16xy/L+krI/y6SnhKB3m09VpQK/qfilUwNTAvSt
	FYZMati31wxeUR5dEvkDZLdPNuXHCpEk6YdYCbY/RrFpVp+dhkkBhgmf0ubNrpl/ZJrvsCtTCEQ
	j2eVUyOHxH+UjJaRd1zp2pmO4sGSxwOTE4NGWIHBqXTaVit+QwvKjK9eJ8OA7JjhVkAE8jGg==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=bugs.sh; c=relaxed/relaxed;
	h=To:Subject:Date:From:Feedback-ID:from:reply-to:cc:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1787834545; x=1788439345; bh=WSnMBOH26cqGE5R86J
	spU+UVduqfAcRYNuDrzj+xhdg=; b=Et656FQbFo+4OH9cHVT7GEoRU3mXKrYkbQtcoSMAkQsgP
	ov6NdxrBI9IyIbOiHy7R52L01Vz9gNhVZG1Q9ZnRKQYv8vcxxs05fTt2fenYi4uCYNvQfL8WnN4
	HIOAoQ9qJofEM2gWhx8WI4XcPo/+6NSP//scJq51yMWH5VR00K5+Q6v4HPK9qOL7b704OFGKDm1
	VfngS+U1lNUeVU9s1aptubf4YSLVYDNU34AIPPENYUMvO/RP7J+KCNcIWg6YzCa6KEBEuvACRdv
	sYEw/QlVPgG04Omf+/LKFu+4DqqC5IK2PmRA+O2rQh6q0RCMuc+y9EzhqYxcXrBU4nlIHdmQ==;
Feedback-ID: bugs.sh:5:6:Cloudflare
From: co <co+46e36dce88fefcb1@bugs.sh>
Message-ID: <xuyIjT8s8MpYkhhzg5iXr7ctaxevT0y0SzfR@bugs.sh>
Date: Thu, 27 Aug 2026 12:42:20 +0000
Subject: [BUG] drivers/nvme: use-after-free in nvmet_auth_expired_work()
To: linux-nvme@lists.infradead.org, "Hannes Reinecke" <hare@suse.de>, "Christoph
 Hellwig" <hch@lst.de>, "Sagi Grimberg" <sagi@grimberg.me>, "Chaitanya
 Kulkarni" <kch@nvidia.com>, "Jens Axboe" <axboe@kernel.dk>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

We found a bug reachable in:

    path    drivers/nvme/target
    crash   use-after-free in nvmet_auth_expired_work()
    commit  26260251022f ("Merge tag 'livepatching-for-7.3' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/livepatching/livepatching")

Config, environment, the sanitizer report and a C reproducer follow.

=3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    If you patch the bug based on our artifacts, a tag would be
    appreciated:

Reported-by: co+46e36dce88fefcb1@bugs.sh

    Everything in this mail is validated by the reproducer below.

    We also hold an LLM-generated root-cause analysis and a candidate
    patch. The patch passes an A/B test: the same reproducer panics the
    unpatched kernel and runs clean on the patched one. Neither has had
    human review, so both still require validation before you send or
    apply them. Available on:

        patch.diff  https://bugs.sh/b/46e36dce88fefcb1/patch.diff
        report.md   https://bugs.sh/b/46e36dce88fefcb1/report.md

    This is an open science project. The code and the full set of PoCs
    are not public at this moment, as we intend to disclose our findings
    in an ethical way.

    Happy to test patches. Complaints and suggestions about our work
    are welcome at:

        cedalion@bugs.sh

=3D=3D Environment =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Reproduced on  26260251022f ("Merge tag 'livepatching-for-7.3' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching")
    VM setup       https://bugs.sh/b/46e36dce88fefcb1/run.sh
    config         https://bugs.sh/b/46e36dce88fefcb1/config.gz
    poc            https://bugs.sh/b/46e36dce88fefcb1/repro.c

=3D=3D Sanitizer Report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-use-after-free in nvmet_auth_expired_work (drivers/nvme/ta=
rget/fabrics-cmd-auth.c:26)
Write of size 1 at addr ffff88800c6cb0cc by task kworker/0:0/9
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Tainted: G        W           7.2.0+=
 #1 PREEMPTLAZY
Workqueue: events nvmet_auth_expired_work
Call Trace:
dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
kasan_report (mm/kasan/report.c:595)
nvmet_auth_expired_work (drivers/nvme/target/fabrics-cmd-auth.c:26)
process_one_work (kernel/workqueue.c:3387)
worker_thread (kernel/workqueue.c:3470 kernel/workqueue.c:3551)
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
Allocated by task 108:
kasan_save_stack (mm/kasan/common.c:57)
kasan_save_track (mm/kasan/common.c:78)
__kasan_kmalloc (mm/kasan/common.c:398 mm/kasan/common.c:415)
__kmalloc_cache_noprof (./include/linux/kasan.h:263 mm/slub.c:5484)
nvmet_tcp_accept_work (./include/linux/slab.h:988 ./include/linux/slab.h:13=
09 drivers/nvme/target/tcp.c:1933 drivers/nvme/target/tcp.c:2049)
process_one_work (kernel/workqueue.c:3387)
worker_thread (kernel/workqueue.c:3470 kernel/workqueue.c:3551)
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
Freed by task 108:
kasan_save_stack (mm/kasan/common.c:57)
kasan_save_track (mm/kasan/common.c:78)
kasan_save_free_info (mm/kasan/generic.c:584)
__kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
kfree (./include/linux/kasan.h:235 mm/slub.c:2678 mm/slub.c:6372 mm/slub.c:=
6687)
process_one_work (kernel/workqueue.c:3387)
worker_thread (kernel/workqueue.c:3470 kernel/workqueue.c:3551)
kthread (kernel/kthread.c:436)
ret_from_fork (arch/x86/kernel/process.c:158)
ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
Last potentially related work creation:
kasan_save_stack (mm/kasan/common.c:57)
kasan_record_aux_stack (mm/kasan/generic.c:556)
insert_work (kernel/workqueue.c:2272)
__queue_work (kernel/workqueue.c:2448)
call_timer_fn (kernel/time/timer.c:1748)
__run_timers (kernel/time/timer.c:1794 kernel/time/timer.c:2374)
run_timer_softirq (kernel/time/timer.c:2386 kernel/time/timer.c:2378 kernel=
/time/timer.c:2395 kernel/time/timer.c:2405)
handle_softirqs (kernel/softirq.c:645)
__irq_exit_rcu (kernel/softirq.c:679 kernel/softirq.c:519 kernel/softirq.c:=
767)
sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 (discriminato=
r 35) arch/x86/kernel/apic/apic.c:1062 (discriminator 35))
asm_sysvec_apic_timer_interrupt (./arch/x86/include/asm/idtentry.h:674)
Second to last potentially related work creation:
kasan_save_stack (mm/kasan/common.c:57)
kasan_record_aux_stack (mm/kasan/generic.c:556)
insert_work (kernel/workqueue.c:2272)
__queue_work (kernel/workqueue.c:2448)
queue_work_on (kernel/workqueue.c:2501)
nvmet_tcp_state_change (./include/linux/workqueue.h:699 drivers/nvme/target=
/tcp.c:1416 ./include/linux/kref.h:65 drivers/nvme/target/tcp.c:1428 driver=
s/nvme/target/tcp.c:1704)
tcp_done_with_error (net/ipv4/tcp_input.c:4877)
tcp_validate_incoming (net/ipv4/tcp_input.c:6472)
tcp_rcv_established (net/ipv4/tcp_input.c:6672)
tcp_v4_do_rcv (net/ipv4/tcp_ipv4.c:1854)
tcp_v4_rcv (net/ipv4/tcp_ipv4.c:2248)
ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207 (discriminator 1))
ip_local_deliver_finish (net/ipv4/ip_input.c:241 (discriminator 1))
ip_local_deliver (./include/linux/netfilter.h:325 ./include/linux/netfilter=
.h:319 net/ipv4/ip_input.c:262)
ip_rcv (./include/net/dst.h:480 (discriminator 6) net/ipv4/ip_input.c:492 (=
discriminator 6) ./include/linux/netfilter.h:325 (discriminator 6) ./includ=
e/linux/netfilter.h:319 (discriminator 6) net/ipv4/ip_input.c:612 (discrimi=
nator 6))
__netif_receive_skb_one_core (net/core/dev.c:6264 (discriminator 4))
process_backlog (net/core/dev.c:6377 net/core/dev.c:6728)
__napi_poll (net/core/dev.c:7787)
net_rx_action (net/core/dev.c:7850 net/core/dev.c:8007)
handle_softirqs (kernel/softirq.c:645)
do_softirq.part.0 (kernel/softirq.c:546 (discriminator 20))
__local_bh_enable_ip (kernel/softirq.c:538 kernel/softirq.c:473)
__dev_queue_xmit (./include/linux/bottom_half.h:33 (discriminator 1) ./incl=
ude/linux/rcupdate.h:914 (discriminator 1) net/core/dev.c:4961 (discriminat=
or 1))
ip_finish_output2 (./include/linux/netdevice.h:3461 ./include/net/neighbour=
.h:544 ./include/net/neighbour.h:558 net/ipv4/ip_output.c:236)
ip_output (./include/linux/netfilter.h:314 net/ipv4/ip_output.c:437)
__ip_queue_xmit (net/ipv4/ip_output.c:533)
__tcp_transmit_skb (net/ipv4/tcp_output.c:1716 (discriminator 4))
tcp_send_active_reset (net/ipv4/tcp_output.c:1734 net/ipv4/tcp_output.c:387=
2)
tcp_disconnect (net/ipv4/tcp.c:3379 (discriminator 1))
__tcp_close (net/ipv4/tcp.c:3188)
tcp_close (net/ipv4/tcp.c:3311)
inet_release (net/ipv4/af_inet.c:442)


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


