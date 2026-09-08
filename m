Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF1539A7E7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852955; cv=none; b=u6WsxJgFEcwGzwioVu1TftKHzrxtmUa0kb/wITz7C+hST/TNZGJnLjI4poyMUTNSHAJA5uKAAQ3c2lts7wvd6ipT/EjuBxK1Pdz4zgxPWm4JdqGX7U/duh0xAdNrYHR0lLB89IPHCCCElgU/vuu/bKWon2QTYU/xGVXVw3Attco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852955; c=relaxed/simple;
	bh=w34PiXT9SC+k/0T+RoDd5XeWmlTObvuDaqVPSeS2Q8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZPHjVQQmtu3go5jq2px1A99tk/GgfY1VmOTYA5yTjB/CERFljXtBA/CEaYVt8cbJgug6tCiJ04W5vFL23NesPqGALxCwOu/Pz9itLusPhsSDdiOViH/+jXJOt1mjsoVS1foLhs1wvQXS9ZUecVAWnlf8IrA9rUlHz8baKMEJAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YNB1BV9W; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YNB1BV9W"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd82be878so1850015e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788852952; x=1789457752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElpqtHVC7jMTpwo4iy/7Zs2kCnpT328w0BszAUno6nA=;
        b=YNB1BV9WdXh+MXhWfvffoJKypjIdxDIWooXAPZfsgMgEgneWQ2ucJmmFnvNnFT/AAA
         Xx4gjcDatB9NH1R9TbVyDt/1NVbsDC+ZQOFfc8rV4I0glzWVvfXwQyCYFmRn6DkE4Uq4
         GR3amYkKhPxBU4a6kZr66TDl1zMnIZLsm3CeJ1sMxtlYTt92HDypG8u9m12whMbq5lE1
         deQk9mxnc78mI2NimFXnuYEXAQzbhQ5b0NbKu7yPXjDsbIVcr26X+lqxDrscueF79Ggp
         44LDdrjAON0E7+nIxU7WoNi/a7VrHM4soHkxF0qDlPOv8yNQ4c8yU1hhRClHXCwf0XmF
         +weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852952; x=1789457752;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElpqtHVC7jMTpwo4iy/7Zs2kCnpT328w0BszAUno6nA=;
        b=KtR3/u3TQWRhe3jF6KuJUZYg0fDxnPWfSbDlxvDvp2KoMea7+Q6GzKtawJA1UWgIrH
         3fswRcTtZOm5lwBCmL0tJ3oncavE7yo3IXS7EHsL+XjiOKJ8rp14Y8BJ2B6ZApKO5kG7
         iGodn20FE8/weNfCoswmFjt8ovE2yJ3z1HO3QQD2u1jLq6w/yyL7IROndqLL4pHlhQMX
         eRB4hDh8863vIRw8NGDPTDJ1jC4T14LlniXmC2Hk4HFpfAaQIwJhpSw+AJarobyEPU0z
         xiAafszFuxekn7rYdKlu5+grq0W0oB8w5hlAMSzETwnZBjIGTiMuZ/BrSeEpa6/Y5BFu
         Aqhg==
X-Forwarded-Encrypted: i=1; AKwUvBwHkP/g9rtYLXnEPvPW7KX0i2qMuFd3LrPK91kJDkBDxPA/vgqg/HSGl5efLXglvz2Q1pajOnhFcVCFIwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nCN9HqoKFPPGCS5pDwmyFc/AznwKyxxMzyd0QW0w4m+Fv+jmc3
	yRTUDOfR4Im2vwl2Nm9mr2sfK0FewPteFQj4QiMPsKvJdRjN5ugRFA8q5tyIsye0dfk=
X-Gm-Gg: AYBFou35OP+Ifw+sw0lfPJA/exhZKEGCkSr5BT/AD/ejq2r7CGjvkKKnk8gLM7iAAA3
	bKIFjp5BPUhPv+zZ+6Uv3TrKGfv7LraTDfnsOx76pK25oe0ode6Us1EZ+Q5Ae3BSzEPAW/8AASn
	L4OHvkhUTPUsNfhaXrm7ipGYKCJkdCxpJ3EXCdy4x4BoCfGy8kfMhJn28g7FrZ5Wc5FkSqf2A4y
	xeLzfnbFNXxlK+QrksjW736kEoptpqe4Cr2Cbv8Lzr5EerMvoC8mRu6QJ+MX/auTmfUsfk4f8Nt
	DgF1rQOy5SM3ufBh+sNmB/gLndDpC7G1K9sneF7GdK5EtVRsOl/Sgv1I/fkuCCd1s6krBd9QRJG
	1u1HhdhMy7y456fYPHZ2QlrbQ8sTlSbzoKZPay1gNF6KbY0+j4941WDbVYFY7VwSDGM9W5RmqZV
	nDV6eSuVSxqIGboIrVsG5dPKUlkgup4ZXcltFBKMwlnE+Q2KAG9+0Z0EPMfXuAFPkLnBgUPEUQx
	2PZZPl2OYG3arUb9EoiuBS5WBU86tw=
X-Received: by 2002:a05:600c:530d:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49d01dce86fmr169773115e9.1.1788852951560;
        Tue, 08 Sep 2026 00:35:51 -0700 (PDT)
Received: from [10.20.0.128] (lfbn-ann-1-199-252.w86-200.abo.wanadoo.fr. [86.200.161.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm267934475e9.10.2026.09.08.00.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:35:51 -0700 (PDT)
Message-ID: <a8d64435-2fd8-4e2b-9b48-aea496630e07@suse.com>
Date: Tue, 8 Sep 2026 09:35:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RDMA/rxe: Use validated num_sge in local buffer
To: Zhu Yanjun <yanjun.zhu@linux.dev>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tristan Madani <tristmd@gmail.com>,
 "open list:SOFT-ROCE DRIVER (rxe)" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260907161550.716670-1-nmorey@suse.com>
 <27376486-9cab-4d42-8ed7-36e13231dd91@linux.dev>
 <681ae665-523a-441b-bbd8-dbae51ee64f1@suse.com>
 <4bb04e58-7e69-46bc-9ecf-283605b18340@linux.dev>
Content-Language: fr, en-GB
From: Nicolas Morey <nmorey@suse.com>
Autocrypt: addr=nmorey@suse.com; keydata=
 xsBNBFjZETwBCADEkoe7QWAXzd9xpSiPbQK6P2F4wKdxyTp6r0aN4I0O+4fc8xWXvmwOrCjF
 UsuoGZ3CxJaHgdB/3ueW/IhMO5Ldz7pylhKVlG/moUh4CBK2eRUdaG7mHID01GyJMtR3VQqu
 22hJhHPYy0erpYViyr+I4MzQA9QZLoQhSxn4imjZOZPcj20JE+lRfXppNv9g7vQiRLMcXjTi
 KcnrqG5owOi6Cn1sZ201YfdeztGxKA+jvjWO+6absTTlorIlZNGUf85s2+caGDsqa31u2DPs
 hVv5UUTy1g/5aP2wacSWI3Qm4n2MWl1aCnHN2h737PCXXfBk5iGJsgBUnSQULgdgEAt1ABEB
 AAHNH05pY29sYXMgTW9yZXkgPG5tb3JleUBzdXNlLmNvbT7CwI4EEwEIADgWIQRC0lOFwaHA
 K4sbHG+AG924JZiPZAUCY5G8SAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCAG924
 JZiPZMZiB/9QkcGfH248qvFUWZig3jssK5IgijfOFDKB0YK4e844M5C8LVSuWpu7Z+lM+cql
 3mbrikW6mlZjPEusrQ/KGvT6TdfOM9VCQWjlshMzt7uiRDdzufHGtE5hhk/67UnkEVjmplpD
 k8cb1O0VsBfGym7e0nySHTlDWqr++9EcwgV3uo4psYYEqm6Aon1yKqjbmj+vfl/C5iW3V4lq
 DhBk8w21AvNS+tdEqJzhruxuXkEDZZ07wYFS7m8OxLNb4sMzn/Nz9x/NXeweBWx2ujIERtAq
 1e/hh0ZAcoPVR3CfO2QTmfTfrzVdpZrZ8F54337ze3+BUNnrFGObQhlNe26NqNYWzsBNBFjZ
 ETwBCAC9zAzCRlTgzyO9siVLQYwbRUhcL1TUJU/FiOQWQTmL3uDdBc6MgVBs+hp82RwPbbXT
 v4W4rghBYPKdmFXvRN+jvGDLq1f2hsuCSiE1ckTMzFV+sKoWRIEC12tEpw5ncEFGm+1k/rJR
 Lk9eHxuqn+yRjPryN8CK6tK4+b4tZ2urKlP29XG+T3l/mbUSoqfjqvyeKaW6xw7ku89EX2Xo
 QWP/pm92RxUd6VDU9vpVW/T7qPZRl0wtUnDnO2wePoZmvUfEr5Osh3MNvm1myG+v4EV2Hgva
 NT6pa27IptrUq06cA6dDsIKwPtMuThJQp8/xumgl5Q9A/ErQoJTrB9rclIm7ABEBAAHCwF8E
 GAECAAkFAljZETwCGwwACgkQgBvduCWYj2QwNwf/eOIpFB67cKoUJvcm3JWcvnagZOuyasCw
 xwH9a0o9jORcq+nsJoynS/DpjUKGyZagy7+F7sBrF7Xx0cXF2f5Bo42XNNiQDE5P/VLwvgn9
 62AJ3q0dp4O7oQI8UgNmdsocQhNaBHHCoOabLGrgNobDTaLBeb9zaOZqz8CBuAiZ0bVABEpg
 50hDEYTHp4jCgWpadhAsp/eCgm93Tc+Y+e1fqtE3FmoOLxyhFa6evhn0Q1iX0kCasMZwlzse
 zqLZjTM1Koqn6+UIHXE3QaULyFKD1GDhisXxyolOB6P2TXsyfvitYdIZ3CCtI7PVDxzmX2Xk
 kvEz9bMtStoMpse9qAsmHQ==
In-Reply-To: <4bb04e58-7e69-46bc-9ecf-283605b18340@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026-09-08 05:07, Zhu Yanjun wrote:
> 在 2026/9/7 14:44, Nicolas Morey 写道:
>> On 2026-09-07 23:20, Zhu Yanjun wrote:
>>> 在 2026/9/7 9:15, Nicolas Morey 写道:
>>>> For both SRQ and non-SRQ receive paths, the WQE is copied into a local
>>>> buffer to provide a kernel-owned, validated copy. While calculating the
>>>> memcpy size from the validated num_sge prevents overflow during the
>>>> copy, memcpy() itself still copies num_sge from shared memory.
>>>>
>>>> A concurrent userspace modification before or during memcpy() leaves
>>>> an unvalidated num_sge in the local buffer, leading to potential
>>>> out-of-bounds reads in rxe_resp_check_length() and copy_data().
>>>>
>>>
>>> Hi Nicolas,
>>>
>>> Thanks for the patch. The logic makes total sense to prevent the TOCTOU race condition after memcpy.
>>>
>>> Just out of curiosity, do you happen to have a reproducer or a POC script that demonstrates this race in practice?
>>>
>>> It would be great to know if this can be reliably reproduced or integrated into testing setups (like rdma-core tests, or tools/testing/selftests/rdma) to catch similar double-read issues in the future.
>>>
>>
>> No reproducer or PoC sadly. I haven't tried to make one though.
>> This got caught by one of our AI tools when checking the backport of CVE-2026-74377.
> 
> Hi, Nicolas
> 
> Thanks for sharing this. Could you clarify whether your AI tool detected this purely through static analysis (and provided a suggested fix), or if it actually triggered a runtime bug with a backtrace/calltrace?
> 
> If you have a calltrace, please share it—that would help a lot in understanding the issue. Also, if this was flagged and fixed by a specific AI tool, adding an Assisted-by: tag (or referencing the tool in the commit description) would be appropriate.
> 
> Thanks,
> 
> Zhu Yanjun
> 

Hi Zhu,

The tool is a LLM static analyser that simply detected that d6ab440240a0 ("RDMA/rxe: Copy WQE to local buffer in non-SRQ receive path") was a valid patch but did not fix the whole issue. It did not suggest any breaker PoC nor any fix.
All the rest is human (me) made.
Does that warrant an Assisted-by tag ? 
It seems sashiko picked the same issue for 22b8fbded65b ("RDMA/rxe: Fix TOCTOU heap overflow in get_srq_wqe")
https://sashiko.dev/#/patchset/20260518215040.1598586-1-tristan%40talencesecurity.com

> If a concurrent userspace thread modifies wqe->dma.num_sge after the
> bounds check but before the memcpy completes, doesn't this copy the
> unvalidated value into the kernel heap?

By tweaking the reproducer from Tristan, I have been able to reproduce it once out of sheer luck I think:
==================================================================
BUG: KASAN: slab-out-of-bounds in rxe_receiver+0x8109/0x9ec0 [rdma_rxe]
Read of size 4 at addr ffff88812c4867f8 by task kworker/u9:6/361

CPU: 0 UID: 0 PID: 361 Comm: kworker/u9:6 Tainted: G            E       7.3.0-rc2-00006-g28924df2a08f #3 PREEMPT(full)  318a88bba3045f81bad31a7694727561b4bd4965
Tainted: [E]=UNSIGNED_MODULE
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
Workqueue: rxe_wq do_work [rdma_rxe]
Call Trace:
 <TASK>
 dump_stack_lvl+0x4b/0x70
 print_report+0x153/0x4b5
 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
 ? stack_trace_save+0x93/0xd0
 kasan_report+0xbc/0xf0
 ? rxe_receiver+0x8109/0x9ec0 [rdma_rxe b8d153a5fa9911e345612beff278ac3241bac327]
 ? rxe_receiver+0x8109/0x9ec0 [rdma_rxe b8d153a5fa9911e345612beff278ac3241bac327]
 rxe_receiver+0x8109/0x9ec0 [rdma_rxe b8d153a5fa9911e345612beff278ac3241bac327]
 ? pick_task_fair+0x12e/0x1b50
 ? __pfx_rxe_receiver+0x10/0x10 [rdma_rxe b8d153a5fa9911e345612beff278ac3241bac327]
 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
 ? hrtimer_start_range_ns+0xe7/0x320
 ? ktime_get+0xe3/0x170
 ? _raw_spin_unlock+0xe/0x30
 ? _raw_spin_lock_irqsave+0x8a/0xf0
 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
 ? __pfx_rxe_receiver+0x10/0x10 [rdma_rxe b8d153a5fa9911e345612beff278ac3241bac327]
 do_work+0x149/0x610 [rdma_rxe b8d153a5fa9911e345612beff278ac3241bac327]
 process_one_work+0x726/0x10a0
 ? __pfx___schedule+0x10/0x10
 ? __pfx_process_one_work+0x10/0x10
 ? _raw_spin_lock_irq+0x85/0xe0
 ? __pfx__raw_spin_lock_irq+0x10/0x10
 worker_thread+0x500/0xd70
 ? __kthread_parkme+0x8d/0x170
 ? __pfx_worker_thread+0x10/0x10
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x329/0x410
 ? recalc_sigpending+0x15c/0x200
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x4cf/0x760
 ? __pfx_ret_from_fork+0x10/0x10
 ? __switch_to+0x575/0x11c0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>

Allocated by task 1698:
 kasan_save_stack+0x20/0x40
 kasan_save_track+0x14/0x30
 __kasan_kmalloc+0x9a/0xb0
 __kmalloc_noprof+0x209/0x560
 create_qp.part.0+0x760/0x9d0 [ib_core]
 ib_create_qp_user+0xa2/0x500 [ib_core]
 ib_uverbs_handler_UVERBS_METHOD_QP_CREATE+0x99b/0x12af [ib_uverbs]
 ib_uverbs_cmd_verbs+0x214b/0x32d0 [ib_uverbs]
 ib_uverbs_ioctl+0x131/0x200 [ib_uverbs]
 __x64_sys_ioctl+0x13c/0x1c0
 do_syscall_64+0xba/0x530
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Last potentially related work creation:
 kasan_save_stack+0x20/0x40
 kasan_record_aux_stack+0xb0/0xc0
 __queue_work+0x8c5/0x11f0
 queue_work_on+0x60/0x70
 rxe_sched_task+0x1d2/0x250 [rdma_rxe]
 rxe_rcv+0x847/0x1830 [rdma_rxe]
 rxe_xmit_packet+0x408/0x950 [rdma_rxe]
 rxe_requester+0x1878/0x5460 [rdma_rxe]
 rxe_sender+0x17/0x40 [rdma_rxe]
 do_work+0x149/0x610 [rdma_rxe]
 process_one_work+0x726/0x10a0
 worker_thread+0x500/0xd70
 kthread+0x329/0x410
 ret_from_fork+0x4cf/0x760
 ret_from_fork_asm+0x1a/0x30

The buggy address belongs to the object at ffff88812c486000
 which belongs to the cache kmalloc-part-13-2k of size 2048
The buggy address is located 0 bytes to the right of
 allocated 2040-byte region [ffff88812c486000, ffff88812c4867f8)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88812c480000 pfn:0x12c480
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x17ffffc0000240(workingset|head|node=0|zone=2|lastcpupid=0x1fffff)
page_type: f5(slab)
raw: 0017ffffc0000240 ffff888100059140 ffffea0004499010 ffffea00049a7a10
raw: ffff88812c480000 0000000200080007 00000000f5000000 0000000000000000
head: 0017ffffc0000240 ffff888100059140 ffffea0004499010 ffffea00049a7a10
head: ffff88812c480000 0000000200080007 00000000f5000000 0000000000000000
head: 0017ffffc0000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88812c486680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88812c486700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88812c486780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fc
                                                                ^
 ffff88812c486800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88812c486880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
