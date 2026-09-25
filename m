Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55C3442373
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327737; cv=none; b=bXS5UcqDFjjU5twF+l1Tx15kkpNbLa1HRgZDPcJNrEAs1m/ukUdx6IpszxJ+FKWVWVUgE09sRJ/iHDh7nwmXIHismukEbLvU8dYXyAAtejASmhb2N5jJYZZsKI/prrFvscTN6XCWQ3PqAPkcLkuKJsPLgD6ZEiVNm17hBdpOvQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327737; c=relaxed/simple;
	bh=BsAxhpvNWBYkwsgxLIteUiTaDFL9w5dgw2GQL24YC2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhzsoX4NfgyDZUSZqSmGwXJFPh5b/MKbWhfURkqiBXWZ9tj7fAr10Ak300IYx1Jb0OQN1TpZwdy2FyFu8n/67J/624/dFe32JPRxIowXYWiH9TLG/zBM7B5h5z1IC+qD251cePAwY4X0GK6HAjRj00mgVEZxI3u2w4v48uTBrCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=LlgkgILF; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="LlgkgILF"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 68P8mUvO2944311
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 25 Sep 2026 10:48:30 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 68P8mUvO2944311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1790326110;
	bh=A50e+YgdNLkM4nQFJoNYZfD+GUb7IwX8nYRhcaDLAX8=;
	h=Date:From:To:Cc:Subject:From;
	b=LlgkgILFSJnaa3lUS/f0dgMDBP2AsVOBxiJ17PyQ9hY8YKFZ2wQK0BNaNo/444d8C
	 1bxr9GcbqfIbtVf7frJOfT+eIWAyHnwEQdtWdkCqS4JfbAY2l+mo1DXr/NgXNKMsRu
	 6vO4o2yiv3e8aSEQRN6bCYeDP6M8HVKTr60pUUsk=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 68P8mTuQ044319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 25 Sep 2026 10:48:29 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 68P8mQQp1861687
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 10:48:29 +0200
Date: Fri, 25 Sep 2026 10:48:26 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org,
        ljs@kernel.org, nikola.ciprich@linuxbox.cz
Subject: hunting memory corruption bug in 6.18.x
Message-ID: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

Hi,

I've been hunting a weird memory corruption bug for the last few weeks,
without success so far, so I'd like to report it and kindly ask for help.

We first hit it after a live VM migration between two KVM hosts:
suddenly some dynamic libraries in the host appeared to be corrupted:

Inconsistency detected by ld.so: ../sysdeps/x86_64/dl-machine.h: 548: elf_machine_rela_relative: Assertion `ELFW(R_TYPE) (reloc->r_info) == R_X86_64_RELATIVE' failed!

(Later we also hit this with libcrypto.so.3 etc.) The files on disk
were OK; the problem seemed to exist only in RAM.

I'm fairly sure this is not hardware related: there were no ECC errors,
and we have since hit this (and similar issues, more on that below) on
multiple machines.

The problems started after we moved from 5.15.x to 6.18.x kernels.

Since then I've spent a lot of time trying to reproduce it on a lab
cluster, and we were able to trigger some corruption after days of
migrating VMs back and forth. At first I suspected the Intel ice driver,
for which I found similar reports, but we saw new problems even after
backporting fixes (and also with Mellanox cards).

So far we've hit three different kinds of problems, which may or may
not be related:

- .so library corruption right after VM migration
- VM crashes (or process crashes inside VMs), possibly related to
  migration (those always happened during migration)
- host crashes due to kernel structure corruption (these happened
  without any VM migration)

We first hit these problems with 6.18.31; the last crash I saw was
with 6.18.44.

All affected machines use AMD EPYC CPUs and act as KVM hosts; the OS
is AlmaLinux 9.

I suspect two subsystems that have seen a lot of changes:

- transparent hugepages
- NUMA balancing

(but those are just my guesses)

As a safety measure, we've disabled THP and NUMA balancing on all hosts.

I'm aware this is still a very vague report with a lot of guessing,
but my question is: has anybody hit similar problems with 6.18 or
newer kernels?

I see a lot of patches in every stable release, but simply trying
newer kernels doesn't seem efficient here. Deploying them is also
risky, since the hosts have to be emptied by migrating VMs off them
before reboot, and that migration itself may trigger more crashes.
None of the released or queued fixes for 6.18 seem to be directly
related.

I tried running my migration tests on hosts with KASAN enabled, and
also with SLUB debugging, but was never able to reproduce the problem
with those enabled (without them, I was able to hit issues within
days).

I'll start another round of migration tests in the lab, now with
6.18.54-rc1, but I still thought it would be good to report this and
ask here.

last but not least, here's kdump from last crash (this was not related
to any VM migration, but is very similar to another few crashes
we got):

[1924553.414736] Oops: general protection fault, probably for non-canonical address 0xfffffff0c930038: 0000 [#1] SMP NOPTI
[1924553.434800] CPU: 23 UID: 189 PID: 7538 Comm: pacemaker-contr Kdump: loaded Tainted: G            E       6.18.44lb9.01 #1 PREEMPT(voluntary)
[1924553.456934] Tainted: [E]=UNSIGNED_MODULE
[1924553.465551] Hardware name: ASUSTeK COMPUTER INC. RS720A-E12-RS12/K14PP-D24 Series, BIOS 2305 11/21/2025
[1924553.484152] RIP: 0010:__d_lookup+0x4a/0xc0
[1924553.492878] Code: ff 48 89 c5 c1 e8 07 48 8d 1c c2 e8 60 8f d1 ff 48 8b 03 48 89 c3 48 83 e3 fe 48 83 f8 01 77 0a eb 2f 48 8b 1b 48 85 db 74 27 <39> 6b 18 75 f3 4c 8d 63 78 4c 89 e7 e8
d5 e1 7c 00 4c 39 6b 10 74
[1924553.525191] RSP: 0018:ff7532a13699fda0 EFLAGS: 00010212
[1924553.534986] RAX: 0fffffff0c930020 RBX: 0fffffff0c930020 RCX: 0000000000000000
[1924553.546679] RDX: ff2e6dbe0d9b6000 RSI: ff7532a13699fe60 RDI: ff2e6d1e4e630d80
[1924553.558367] RBP: 000000000b654440 R08: 0000000000002403 R09: 0000000000000179
[1924553.570026] R10: 000000000000000d R11: 0000000000000000 R12: 0000000001876e5c
[1924553.581601] R13: ff2e6d1e4e630d80 R14: ff7532a13699fe60 R15: 0000000000000000
[1924553.593115] FS:  00007ff8743aaa80(0000) GS:ff2e6e5e94c45000(0000) knlGS:0000000000000000
[1924553.605576] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[1924553.615611] CR2: 00007ffcd63a5000 CR3: 00000003ee840001 CR4: 0000000000771ef0
[1924553.627022] PKRU: 55555554
[1924553.633869] Call Trace:
[1924553.640353]  <TASK>
[1924553.646369]  d_lookup+0x27/0x50
[1924553.653366]  lookup_dcache+0x1f/0x80
[1924553.660713]  lookup_one_qstr_excl+0x1e/0xe0
[1924553.668589]  ? preempt_schedule_common+0x2c/0x70
[1924553.676837]  filename_create+0xc4/0x160
[1924553.684209]  do_mkdirat+0x5a/0x190
[1924553.691050]  __x64_sys_mkdir+0x42/0x60
[1924553.698163]  do_syscall_64+0x64/0xbf0
[1924553.705145]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[1924553.713533] RIP: 0033:0x7ff8754ff08b
[1924553.720358] Code: 8b 05 91 bd 0f 00 41 bc ff ff ff ff 64 c7 00 16 00 00 00 e9 4f ff ff ff e8 12 f7 01 00 66 90 f3 0f 1e fa b8 53 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 5d
bd 0f 00 f7 d8 64 89 01 48
[1924553.748552] RSP: 002b:00007ffc05e5c148 EFLAGS: 00000246 ORIG_RAX: 0000000000000053
[1924553.759401] RAX: ffffffffffffffda RBX: 00005623cc0bd513 RCX: 00007ff8754ff08b
[1924553.769760] RDX: 000000000fde421b RSI: 00000000000001c0 RDI: 00005623cc0bd4f4
[1924553.780083] RBP: f49998db0aa753ff R08: 0000000000000004 R09: 0000000000000001
[1924553.790348] R10: 00007ff87587d000 R11: 0000000000000246 R12: 8421084210842109
[1924553.800604] R13: 00005623cc0bd513 R14: 00007ff8755bd740 R15: 000000000fde421b
[1924553.810819]  </TASK>

I'll be very very gratefull for any hints here..

with best regards

nikola ciprich

PS: I tried to CC maintainers of suspected subsystems, but those are just my guesses,
so I hope I won't offend anyone.

