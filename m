Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE054414429
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330720; cv=none; b=OmHnrIIcXKJ9l8xSoOpAjvmU0XOze7Drf+UtDOd7iTglPBUnDlrstRwjerXbG/rhMCvvOcaOMlxY583/gWAUCSiKPwa+EGLXdtQZr+29iawE0Mwp5V5hNCuutcMaVMC9pH8vF/++EYMTptNTCaVC+TqFABFLbGWDz+geBz/7Idg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330720; c=relaxed/simple;
	bh=EY3L5WX/VC8o+dAFwMrc/QFfZ5WQRzZpM+Fkrnxl5kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQ3EkrchRXYrTPI5+MZti5XFNZsn+QLugtnQNVHJYtGRwlxd58sO7OIFlbnSAVRPaq3aUV0Jz1fNPBzUT1hFL3Hy9IrBtgISluwVKKoGSkTYrETZnjei8EnWpL/BgJ/E9uvB32eLZZyg/NsdjUDcNgBrwFQuQjp+R/b+FCYqOUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTeHMOUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTeHMOUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DA91F000FF;
	Fri, 25 Sep 2026 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790330716;
	bh=9QKjH4Zvw7ev86vKtZhIFLG3BXwtK9MVvLnMAi8UATs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WTeHMOUwXwTJ8poXqhdaFC7osKWvuD6E+tMTvnkmbLE21spynI63Qf1dkqrXgxIhG
	 0ucJjmyhM4yfHrVA4EqNHT8erDaatzbduNQjSBYMiU8CcxTFzm98bFD+fYMjkKUGvs
	 WtBv/i4AGt7bLZ+omreQoFXV4/j+EyC5cidTIlf/nRygMjbwPYh6Okq7CcKufVg28U
	 Cm1mEliTe0jbN/n4AkiGHlFKu+AxVvoIWKQHErZC27hzeEHtPMnIQ2Lw7QZJ12jqkg
	 1ARTHV64k4dTJ73HajEoSaQ4TK63hm8jTV6jCekTt9LJH6CgSiLsdBliu2Mf37Xz5I
	 O828rA5dnjLbQ==
Date: Fri, 25 Sep 2026 11:05:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Mike Rapoport <rppt@kernel.org>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <arZFQef9TywPval2@gremlin>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>

+cc Dave, Mike


On Fri, Sep 25, 2026 at 10:48:26AM +0200, Nikola Ciprich wrote:
> Hi,
>
> I've been hunting a weird memory corruption bug for the last few weeks,
> without success so far, so I'd like to report it and kindly ask for help.
>
> We first hit it after a live VM migration between two KVM hosts:
> suddenly some dynamic libraries in the host appeared to be corrupted:
>
> Inconsistency detected by ld.so: ../sysdeps/x86_64/dl-machine.h: 548: elf_machine_rela_relative: Assertion `ELFW(R_TYPE) (reloc->r_info) == R_X86_64_RELATIVE' failed!
>
> (Later we also hit this with libcrypto.so.3 etc.) The files on disk
> were OK; the problem seemed to exist only in RAM.
>
> I'm fairly sure this is not hardware related: there were no ECC errors,
> and we have since hit this (and similar issues, more on that below) on
> multiple machines.
>
> The problems started after we moved from 5.15.x to 6.18.x kernels.

I had an AI dig into this.

And to give a quick response before trying to wrangle/check what it said
into a coherent analysis, the TL;DR is it seems to be caused by some CPA
bugs we fixed recently in x86.

This should be fixed in 6.18.53+ could you test again with everything
re-enabled?

I'll reply again with something more detailed.

>
> Since then I've spent a lot of time trying to reproduce it on a lab
> cluster, and we were able to trigger some corruption after days of
> migrating VMs back and forth. At first I suspected the Intel ice driver,
> for which I found similar reports, but we saw new problems even after
> backporting fixes (and also with Mellanox cards).
>
> So far we've hit three different kinds of problems, which may or may
> not be related:
>
> - .so library corruption right after VM migration
> - VM crashes (or process crashes inside VMs), possibly related to
>   migration (those always happened during migration)
> - host crashes due to kernel structure corruption (these happened
>   without any VM migration)
>
> We first hit these problems with 6.18.31; the last crash I saw was
> with 6.18.44.
>
> All affected machines use AMD EPYC CPUs and act as KVM hosts; the OS
> is AlmaLinux 9.
>
> I suspect two subsystems that have seen a lot of changes:
>
> - transparent hugepages
> - NUMA balancing
>
> (but those are just my guesses)
>
> As a safety measure, we've disabled THP and NUMA balancing on all hosts.
>
> I'm aware this is still a very vague report with a lot of guessing,
> but my question is: has anybody hit similar problems with 6.18 or
> newer kernels?
>
> I see a lot of patches in every stable release, but simply trying
> newer kernels doesn't seem efficient here. Deploying them is also
> risky, since the hosts have to be emptied by migrating VMs off them
> before reboot, and that migration itself may trigger more crashes.
> None of the released or queued fixes for 6.18 seem to be directly
> related.
>
> I tried running my migration tests on hosts with KASAN enabled, and
> also with SLUB debugging, but was never able to reproduce the problem
> with those enabled (without them, I was able to hit issues within
> days).
>
> I'll start another round of migration tests in the lab, now with
> 6.18.54-rc1, but I still thought it would be good to report this and
> ask here.
>
> last but not least, here's kdump from last crash (this was not related
> to any VM migration, but is very similar to another few crashes
> we got):
>
> [1924553.414736] Oops: general protection fault, probably for non-canonical address 0xfffffff0c930038: 0000 [#1] SMP NOPTI
> [1924553.434800] CPU: 23 UID: 189 PID: 7538 Comm: pacemaker-contr Kdump: loaded Tainted: G            E       6.18.44lb9.01 #1 PREEMPT(voluntary)
> [1924553.456934] Tainted: [E]=UNSIGNED_MODULE
> [1924553.465551] Hardware name: ASUSTeK COMPUTER INC. RS720A-E12-RS12/K14PP-D24 Series, BIOS 2305 11/21/2025
> [1924553.484152] RIP: 0010:__d_lookup+0x4a/0xc0
> [1924553.492878] Code: ff 48 89 c5 c1 e8 07 48 8d 1c c2 e8 60 8f d1 ff 48 8b 03 48 89 c3 48 83 e3 fe 48 83 f8 01 77 0a eb 2f 48 8b 1b 48 85 db 74 27 <39> 6b 18 75 f3 4c 8d 63 78 4c 89 e7 e8
> d5 e1 7c 00 4c 39 6b 10 74
> [1924553.525191] RSP: 0018:ff7532a13699fda0 EFLAGS: 00010212
> [1924553.534986] RAX: 0fffffff0c930020 RBX: 0fffffff0c930020 RCX: 0000000000000000
> [1924553.546679] RDX: ff2e6dbe0d9b6000 RSI: ff7532a13699fe60 RDI: ff2e6d1e4e630d80
> [1924553.558367] RBP: 000000000b654440 R08: 0000000000002403 R09: 0000000000000179
> [1924553.570026] R10: 000000000000000d R11: 0000000000000000 R12: 0000000001876e5c
> [1924553.581601] R13: ff2e6d1e4e630d80 R14: ff7532a13699fe60 R15: 0000000000000000
> [1924553.593115] FS:  00007ff8743aaa80(0000) GS:ff2e6e5e94c45000(0000) knlGS:0000000000000000
> [1924553.605576] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [1924553.615611] CR2: 00007ffcd63a5000 CR3: 00000003ee840001 CR4: 0000000000771ef0
> [1924553.627022] PKRU: 55555554
> [1924553.633869] Call Trace:
> [1924553.640353]  <TASK>
> [1924553.646369]  d_lookup+0x27/0x50
> [1924553.653366]  lookup_dcache+0x1f/0x80
> [1924553.660713]  lookup_one_qstr_excl+0x1e/0xe0
> [1924553.668589]  ? preempt_schedule_common+0x2c/0x70
> [1924553.676837]  filename_create+0xc4/0x160
> [1924553.684209]  do_mkdirat+0x5a/0x190
> [1924553.691050]  __x64_sys_mkdir+0x42/0x60
> [1924553.698163]  do_syscall_64+0x64/0xbf0
> [1924553.705145]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [1924553.713533] RIP: 0033:0x7ff8754ff08b
> [1924553.720358] Code: 8b 05 91 bd 0f 00 41 bc ff ff ff ff 64 c7 00 16 00 00 00 e9 4f ff ff ff e8 12 f7 01 00 66 90 f3 0f 1e fa b8 53 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 5d
> bd 0f 00 f7 d8 64 89 01 48
> [1924553.748552] RSP: 002b:00007ffc05e5c148 EFLAGS: 00000246 ORIG_RAX: 0000000000000053
> [1924553.759401] RAX: ffffffffffffffda RBX: 00005623cc0bd513 RCX: 00007ff8754ff08b
> [1924553.769760] RDX: 000000000fde421b RSI: 00000000000001c0 RDI: 00005623cc0bd4f4
> [1924553.780083] RBP: f49998db0aa753ff R08: 0000000000000004 R09: 0000000000000001
> [1924553.790348] R10: 00007ff87587d000 R11: 0000000000000246 R12: 8421084210842109
> [1924553.800604] R13: 00005623cc0bd513 R14: 00007ff8755bd740 R15: 000000000fde421b
> [1924553.810819]  </TASK>
>
> I'll be very very gratefull for any hints here..

Hi, I had a

>
> with best regards
>
> nikola ciprich
>
> PS: I tried to CC maintainers of suspected subsystems, but those are just my guesses,
> so I hope I won't offend anyone.
>

--
Cheers, Lorenzo
