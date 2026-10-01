Received: from gwu.lbox.cz (bck.lbox.cz [193.165.144.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AA433F59C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.165.144.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883938; cv=none; b=cqM9tdqrEzZKEj8nHWo3yMeIJP58vBooFGCb5xpZOq0r6T+gptMLCzQWB1ROyHZtDDxWhoPlbcjXcwuqEBytc/PhtBuXVttIvW5/6mSTYCqRYUw7dN0sS1/U0LjaTKsxZ8ZkyBgqiKblKqbZHBPH/7pi/a9awUGAbVJ2sKevDQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883938; c=relaxed/simple;
	bh=mDHaP2DzNwFRMsfAghG41VRUP8NtBtPPjXmf8oa7gSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6/VhPlewQ2pexPMo5RkJhVqQIbHeH32CPVEHVTP71uaE46bigWhGSNRULCkt7hGR/U3AP52OyRaTze5CAFCSbgSdUhaNac6kmEMnA5EBsoHpBKVJ/58G5uQwjvZnojC0d83ns4YuvhXks8lGbtok9nkG2witI/kVlQPWKoD9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=00COJ5bx; arc=none smtp.client-ip=193.165.144.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="00COJ5bx"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 691Jf4gI3748979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 1 Oct 2026 21:41:04 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 691Jf4gI3748979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1790883665;
	bh=FZMJ3of9h2zjYqREJLmrVh3ELzDIAAnl2juI8l3qEW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=00COJ5bx/dX149M66PbRPeZIKMv9DUGe5n0iVWaFUnGXov7aPz8wukGlwyAM8MxeA
	 /rhU6q6sh4J2z0yr8z0XQrmybCvqjCu000QiodcBcNz6mdcbk4TYTdEES7QyuLCdBm
	 CeV7u4hWAejVLGqIe8SSFPgXYaLrg/T+vGxCohBU=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 691Jf3MV038171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 1 Oct 2026 21:41:03 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 691Jewe32175335
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Oct 2026 21:41:02 +0200
Date: Thu, 1 Oct 2026 21:40:58 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, david@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
 <arZHp8hjYFXE8Rkt@gremlin>
 <arde/t0zQNEkWqi5@pcnci.linuxbox.cz>
 <areOeRwZOez0eHm7@gremlin>
 <arotyz5g6LozSjb1@pcnci.linuxbox.cz>
 <arwNebjYXyGqrp32@pcnci.linuxbox.cz>
 <arzRBv9ceJsxJppI@gremlin>
 <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

Hello again,

the good (?) news is, in the meantime we got another crash on different machine
and I have a kdump including complete vmcore. This one was 6.18.53

here are some details:

Hardware: Supermicro AS-2024US-TRT / H12DSU-iN, BIOS 3.5 (2025-09-22). Dual-socket AMD EPYC 7343 16-Core, 32 CPUs, 1024 GB RAM.

analyzed with crash + matching vmlinux debuginfo:

Oops:
general protection fault, probably for non-canonical address 0xfffffff0c930038
RIP: __d_lookup+0x4a/0xc0
Comm: systemd PID: 1274600 CPU: 23
Call trace:
__d_lookup
lookup_fast
walk_component
link_path_walk
path_openat
do_filp_open
do_sys_openat2
__x64_sys_openat
do_syscall_64

Exception frame registers:
RAX: 0fffffff0c930020 RBX: 0fffffff0c930020 RCX: 000000000000000b
RDX: ffff985ffd223600 RSI: ffffb18962823d70 RDI: ffff989ddf09b5c0
RBP: 000000005560450b R8: 000000007fffffff R9: fefefefefefefeff
R10: 0000000000000000 R11: 93c3d2eb02a31dda R12: ffff989ddf09b5c0
R13: ffff989ddf09b5c0 R14: ffffb18962823d70 R15: 0000000000000000

Faulting instruction (cmp %ebp,0x18(%rbx)) dereferences RBX+0x18. RBX held
the non-canonical value 0x0fffffff0c930020, giving fault address
0x0fffffff0c930038. __d_lookup was walking the d_hash (hlist_bl) bucket;
RBX was the node pointer being dereferenced.

Observations from the vmcore:

The faulting value 0x0fffffff0c930020 is non-canonical and is not a mapped
kernel address:
crash> kmem 0x0fffffff0c930020
kmem: cannot determine page for fffffff0c930020
fffffff0c930020: physical address not found in mem map

The dentry being looked up (RDI/R12/R13 = 0xffff989ddf09b5c0) is intact and
well-formed:
 name "app.slice", len 9, d_name.hash 0xCE973022 (consistent)
 d_op = kernfs_dops; valid d_parent, d_inode, d_sb
 d_hash.next = 0x0 (this node is the end of its bucket chain)

 The target dentry and its hash chain in the dump show no corruption; the
 chain terminates cleanly.

No page migration, compaction, or THP activity was in progress on any CPU
at panic. "bt -a" filtered for migrate*/compact*/khugepaged/kcompactd/
kswapd/split_huge*/folio*/d_move/rename returned nothing.

Automatic NUMA balancing was disabled at crash time (read from kernel memory):
 crash> p sysctl_numa_balancing_mode
 $ = 0

Top-level (PMD) transparent hugepage policy was "never" at crash time:
crash> p/x transparent_hugepage_flags
$ = 0x1c0
Bits set: 6 (DEFRAG_REQ_MADV), 7 (DEFRAG_KHUGEPAGED), 8 (USE_ZERO_PAGE).
Bits 0 (TRANSPARENT_HUGEPAGE_FLAG) and 1 (REQ_MADV_FLAG) are clear, i.e.
sysfs enabled = never. Per-order mTHP controls (huge_anon_orders_*) were not
inspected for this dump, so mTHP state is not asserted here.

No MCE/EDAC/hardware-error records are present in the kernel log for this host.

I can provide the full vmcore and the matching vmlinux/debuginfo on request, and
run further crash queries against it.

not sure if this is of any help?

with regards

nik



On Wed, Sep 30, 2026 at 08:40:23PM +0200, Nikola Ciprich wrote:
> (CC Paolo Bonzini)
> 
> Hello Lorenzo,
> 
> > 
> > Yeah 6.18.15 is expected, I'd not say reverting is really worthwhile honestly,
> > given what you've observed previously.
> yes, I wasn't available at the time he was dealing with that..
> 
> 
> > 
> > Maybe worth checking if commit 26505e1b5b54 ("KVM: SVM: make svm_flush_tlb_gva
> > do a full asid flush if NPT enabled") helps in that case?
> sure, I'll do that.. however, the patch doesn't apply cleanly on top of 6.18.54 at
> all.. what do you guys recommend, is it OK to adjust the patch to this kernel
> (I have to admit I'm able to do that, but without any deep knowledge of the subsystem)
> or do you recommend to apply some of the previous patches?
> 
> tried going through them, but its ~134 commits affecting svm.c between
> v6.18 and 26505e1b5b54
> 
> cheers
> 
> nik
> 
> > 
> > --
> > Cheers, Lorenzo
> > 
> 
> -- 
> Ing. Nikola CIPRICH
> technický ředitel
> 
> +420 591 166 214
> +420 777 093 799
> nikola.ciprich@linuxbox.cz
> 
> www.linuxbox.cz
> 

-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
