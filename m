Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897357;
	b=NKixppLqRqTcVeHJ2XfrDH/FpWmv2jAkvlV4jB4VUMnzczZT7CDoNHufaZ47WEz9YATn
	 x08XqjVoFjVOxwNdGeYUGcml2arHmWf/wYCdbEAc5zUzRjdf+lBUB76G2qqUZwI0JWU5Y
	 n/6MCBTiyZyqKwrJR6kJ/xKqAXoXb/xMG9o5GOTwbNRSaJJW24vn5/c0T24OaMZfPWj6k
	 DzomE21PeLI03qmNubopdueODbN1CiED/4vS1LVRpYc0jt3A7lAdr69o41tsCH9WRDO73
	 Bnhozp8pY3CAYIncwTLjvDiDQd9wgC79IliOLxvTsJ98hNk2PUWEaUO3rYZKZ9EHKqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gqTrQ7OATcmrAEn19rco0h0DH6w5UCTWYeu8VAqf8sY=;
	b=39O6D+wOSuT7IdDG1stKwNWoZfd1hgfgEdYW9Tp3mWAePKNnsFeSCi0RuA+kQmiVRN/J
	 dt1w51L2fd8GSOEe5mziTvVT0v2uuCuEc3zR9mIumMHZ7KgalQJjcP2q5RNvJdQktx+Sc
	 QYtJtTm1+DcHrqLS4osUli2+Zsa6horEdimV19zSzDmr0CGGXYLjBvqgEzoLUahE+BemK
	 BxokczxOdbOgohcKpCh0Z5nQddnXr0ItSPBBb78738PAHiFfCPRYgIZxrq/37I74Wb+fM
	 z6k7hG+oa4rYCFImR+Fif5wAHYtlPKbBDD7gD0Fm6rRrSnTIOLTdpNE42ZyOedNYGgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkDvoVGQ;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1DA606A33E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1DA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkDvoVGQ
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-943e8d35f74so188548685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897356; x=1794502156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqTrQ7OATcmrAEn19rco0h0DH6w5UCTWYeu8VAqf8sY=;
        b=qkDvoVGQ4U5/km4c1vjOdA85UjU16WON+xFB9+E5Zr+k2u8jw9fJzFwlrFSe5qk1yI
         UnCpDV7hwWXrnMl0+AXjHYdGk2xcQXyV4pxItAcjqM/jwxpjhQt2yFnMNuP5D690uxzl
         4AmKwA/WLy4CckC4LFBVgWXDng/G5MwuH48ll/WcstjbB9HRK65sLIUXo4IMUvMtPOQD
         I9ILNHEO5wPgF+kxV9y0l3nKxowBATAcJ7481CPWhmAOoQhr8TknLKfDsBwgbpVkc6DW
         h7pdkedT4C2VUp8NhzgjNsHRisGBPS3I4nO4/QSq39EF19P8lUev0cnaPcguKHWoh7X1
         FPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897356; x=1794502156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqTrQ7OATcmrAEn19rco0h0DH6w5UCTWYeu8VAqf8sY=;
        b=EmU79/h4kKLO5lCjdpONkQkr+4/N/m0MKFPHMZqNPtGbuoc/R7iQo+OTnOPaRfWFhT
         85rKSBJ5Kd25NrOLX/ABplZ+nahZzcfyusEfprhTPcu3JlhDiErggIYOXiY8EQX9xHi3
         QnGOVW7RKt3c0YHL/Q3xVxNbqK18wM049R+ujvv6Fln2694sIFR3SOL46lHEzgRjD6NY
         jszwre8NOAXFMeepnE3La/QCpYVgYQeeCfT17bdvJyT/2BgvcNUC+OmcEKrSBokIqK9v
         YkNPfeH9X/hTtd2mGK/6z853oXUuSBxfETy6btZFy45B0+dA6RZFLK3nU2mDsqoWh8g5
         G6dg==
X-Forwarded-Encrypted: i=1; AKwUvBzwV9Nn0Q21qXsKlk/pzZubpPge0/BGd346puI8K0r5/r5zW90EBW7g7TEDQvVg5+pO4iZ6foLQ3GIVFpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oNNip+NjrWPHzRG9qfbzli4GTSfba+fbs61LQ29m/+1Bk0ASy
	TjSRdjVJ7/8d/7qOBvaJ2qW5pWvm5VrKY6XDGvBuNAtjzQH+ayPcKD9P
X-Gm-Gg: AYBFou1gCF5U4kbnFZ8ezXAvmJjn7DK97B/r/OadXIhvyPCeo0GWpjzDYW3tq9opl5T
	wRYQxjDUjv0eS9qctyxnD36LZZjFPlr3PvmR7vpgc+Uzwx+0ivXZoL8iN2EWPV6MXoOeOMtaQy3
	+7YqSoV6m4+oYZyfqyAYnjQXXkzlzLDXQj1aa2Zgmq5apwvuPG+tIGnsJQRkR8/08q0AE+gkz8I
	1sK827gTiACluoq71991eLrz+CS71VU+m3EwaPPg/+7L5PN3MtZCbzULzfhgLlmFUOrTQKpWYkQ
	f9i7fjqbVYuhZv/sAZlOcnjCokzaGOey9yuzNypC38xe5TqHjcYM7EbXeFiq1uVUHAlhQHd2dc8
	f+xBfE+b2Lgyn6+NJr/mwmwdW56U0weOw/XIBlqLqw3CzdVL75+w9C1j6UZzfjr5hdS0STkdLVm
	NzRwhbDSrdnJlAb/HEs+fvu679lX11NG6zChe0Kg9M0ZiXatSfpDOwtYIr+J2OYooMawRm5U3I+
	E/rcI9wVKaqsp36MgNLxmc1z0D2mgkn8kzNVJKj6f5jrSXN/F91nQLZTSKomlrNeJc1nkIKCyty
	TRRQQngMCikkIIZcnjb4czQlXz3o+3Etn+gHxi8n74tFvK6f4+p07Pn6XBQ=
X-Received: by 2002:a05:620a:390b:b0:93f:18ba:bf78 with SMTP id af79cd13be357-9442184ae09mr3368191685a.69.1793897355883;
        Thu, 05 Nov 2026 08:49:15 -0800 (PST)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4899dc6sm498814085a.43.2026.11.05.08.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:49:15 -0800 (PST)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
	Georgia Garcia <georgia.garcia@canonical.com>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] apparmor: slab-use-after-free in aa_get_newest_label
Date: Thu,  5 Nov 2026 11:48:36 -0500
Message-ID: <20261105164839.66760-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in aa_get_newest_label

on commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d (7.4.0-rc1)

To help trigger the bug more reliably, I applied a minimal diagnostic patch
that only adds delays and print statements.

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/882f46b65965336e669fd5ce0e1ee964

I am happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>


==================================================================
BUG: KASAN: slab-use-after-free in aa_get_newest_label (security/apparmor/include/label.h:413)
Read of size 8 at addr ffff888107b7f138 by task bash/346

CPU: 1 UID: 0 PID: 346 Comm: bash Not tainted 7.4.0-rc1-g05441d697f7f-dirty #1 PREEMPT(full) 
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
 print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
 kasan_report (mm/kasan/report.c:595)
 aa_get_newest_label (security/apparmor/include/label.h:413)
 find_attach (security/apparmor/include/policy.h:328 security/apparmor/domain.c:516)
 profile_transition (security/apparmor/domain.c:711)
 apparmor_bprm_creds_for_exec (security/apparmor/domain.c:1045)
 security_bprm_creds_for_exec (security/security.c:793)
 bprm_execve (fs/exec.c:1861)
 do_execveat_common (fs/exec.c:1963)
 __x64_sys_execve (fs/exec.c:2036 fs/exec.c:2030 fs/exec.c:2030)
 do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
 entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
RIP: 0033:0x7f6def8a9c07
Code: ff ff 76 e7 f7 d8 64 41 89 00 eb df 0f 1f 80 00 00 00 00 f7 d8 64 41 89 00 eb dc 0f 1f 84 00 00 00 00 00 b8 3b 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 59 62 10 00 f7 d8 64 89 01 48
RSP: 002b:00007ffef478f408 EFLAGS: 00000202 ORIG_RAX: 000000000000003b
RAX: ffffffffffffffda RBX: 00005610067400c0 RCX: 00007f6def8a9c07
RDX: 0000561006743480 RSI: 00005610067430e0 RDI: 00005610067401b0
RBP: 00005610067401b0 R08: 00005610067430e0 R09: 0000000000000000
R10: fffffffffffffd8e R11: 0000000000000202 R12: 00005610067401b0
R13: 00005610067430e0 R14: 0000561006743480 R15: 0000000000000020
 </TASK>

Allocated by task 335 on cpu 1 at 17.192413s:
 kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
 __kasan_kmalloc (mm/kasan/common.c:409 mm/kasan/common.c:426)
 aa_alloc_profile (include/linux/slab.h:991 include/linux/slab.h:1312 security/apparmor/policy.c:388)
 aa_unpack (security/apparmor/policy_unpack.c:1160 security/apparmor/policy_unpack.c:1766)
 aa_replace_profiles (security/apparmor/policy.c:1204)
 policy_update (security/apparmor/apparmorfs.c:673)
 profile_load (security/apparmor/apparmorfs.c:691)
 vfs_write (fs/read_write.c:685)
 ksys_write (fs/read_write.c:739)
 do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
 entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

Freed by task 349 on cpu 1 at 18.415536s:
 kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
 kasan_save_free_info (mm/kasan/generic.c:584)
 __kasan_slab_free (mm/kasan/common.c:264 mm/kasan/common.c:296)
 kfree (include/linux/kasan.h:235 mm/slub.c:2780 mm/slub.c:6630 mm/slub.c:6923)
 rcu_core (kernel/rcu/tree.c:2650 kernel/rcu/tree.c:2919)
 handle_softirqs (kernel/softirq.c:669)
 __irq_exit_rcu (kernel/softirq.c:703 kernel/softirq.c:542 kernel/softirq.c:786)
 sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062)
 asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:674)

Last potentially related work creation:
 kasan_save_stack (mm/kasan/common.c:57)
 kasan_record_aux_stack (mm/kasan/generic.c:556)
 call_rcu (kernel/rcu/tree.c:3287 kernel/rcu/tree.c:3395)
 aa_remove_profiles (include/linux/kref.h:65 security/apparmor/include/policy.h:436 security/apparmor/policy.c:1552)
 profile_remove (security/apparmor/apparmorfs.c:750)
 vfs_write (fs/read_write.c:685)
 ksys_write (fs/read_write.c:739)
 do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
 entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

The buggy address belongs to the object at ffff888107b7f000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 312 bytes inside of
 freed 512-byte region [ffff888107b7f000, ffff888107b7f200)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x107b7c
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100041c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 0200000000000040 ffff888100041c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 0200000000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888107b7f000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888107b7f080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888107b7f100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff888107b7f180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888107b7f200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc

Best,
Shuangpeng
