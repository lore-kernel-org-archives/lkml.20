Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5341440B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790893287; cv=none; b=qv2sgRlRaaC4/O36mI6iaUl9py7hvrbQNHQw5n9UZC0ywijTPxFpbRNHnzCvHe7TVaB15vp5em1NV9zSdE1hj21eypztR0ArEG3rftrF6aOPd4XITBTDMNlZt4UCe9hxfFy88p7AWmhJ+7kRE2EdlhsvPR1Vt6/CWG4N7m8RGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790893287; c=relaxed/simple;
	bh=NkfkZJjwBf2oFaNeVT08X/QBIxemg6RmqGbBVvxi/d8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PgUZB3fsrwiW3CemUHgAxkO5swRv3tUAVKto7e9EmkiHDUyHoSaTPgqs+/IMM3YQIZsQetavr9hX0UCgawqitQ8VWC9JuHWeSl2PTuWmPPVU5MWObwn2WWJnQw963Th1TxQxLU12xCjxoMFMOB/rKetAkYzWBxsCo1mD+B4rg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwGDpSjX; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwGDpSjX"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b09f6bbe8so753425f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790893283; x=1791498083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mALVOgiCxDIxJdJ6U8iXiJsvHp+DzhgFCGAE0EkhNn0=;
        b=MwGDpSjXmHdL7pOTS1q6m4vaaigdVg6kCi7gWEwxBGwGq+pHIFZux+SoIMM72UYhk7
         X5XlxW+eVvmB+a/51AH0L9cJA04C7EmF/S16cwF+0yT/eGfW/6vOl9PrEei1ePFYpgqg
         PP5Sq0nGm2zb0F+WA6J7h5mwQLxzACM5+tAjmiALLb+tUMMOJY2zNB8d7q8wkDnjGM0a
         ORYOvoMUs9JPSTho0m5Q4HboLgVQsPRoSeXrih7wVKGurwMwqwTPr/LYBUbrFGobqI+J
         HLHaso41OrIbiQ4lqamQcER7zcsGgS7fUn+kn9xSXAIUEJp/9y937xHYMcUlaCeU9rEc
         mlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790893283; x=1791498083;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mALVOgiCxDIxJdJ6U8iXiJsvHp+DzhgFCGAE0EkhNn0=;
        b=YMT8JZZspCjEk4+IGJCMibqAk2E4C+qWzQ1dY8F8suMEJPlX9+zq4jd1GuKHJoLmlj
         ewTmioSL8Y8v8ADSad5cZJez7JxDjIQZoUmUoI9v5gm7u9ynZNW1clRbuMRrZllYozNO
         D4wJwyVfVFf/H7lLpnOgTHgHyroEIgjpwjQIEDXIS8x1jLlHrYngGNa28dwn/htQOAKv
         vtM6thUU7v0BIZvbDZFMcybXL435AVR2KG0tSLEXd+sCV0PJBcB8KQfrtS0RBH1HUEPu
         oWE1JvG02cWaFkRG11Jsl2ZlqPGum0F2e3N1UEx6pQeQq+DDGIqwCRYo5f35D8Oty7Cg
         l1pQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3IdUflrWP7V8uLdcEHDf2ZzxY1myCeWvEdq8nCCr+Hr8gWPfeW8gBcetJ8EwfU+sdobdSU/6IqPsuxf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYV0rWK3xbxBoaWnfKQbWH9VWBecx4Qr/WxuxcFVHT7cIDHLNh
	35SkXmRzOrF2MfiUaWJDFi5tqjqxlUBRy7OuAWDWIiihKSscERz5SkCJ
X-Gm-Gg: AYBFou14XxfnpypmZsYuVfMgCS8aIEbSO7wQ/1UtfDkNi/Xk+69yANcxazDRhrL5bjn
	CLY1XpOpnOxdvnifMvP9As8aw03DhDZuYukIqFCBxsgmdgdTBcDOWDfw+qVR6BqGbLby0uT/+HO
	gdx20NCk0O/O+cHHVVjziCAZEiUPWZcE/RRV6q2tHZ9RdIj7cLML4ReNsbaqe5AY+vPB+Z6VCdb
	4bt2a/O7QgQnBc7odDiNaTIu664SZ+FZ0WsEH6fuGJgCDHBrRriv/BsHQ1n1bdlIyhLcFiTKpU1
	HbcRXiOztCRzdkiBbWforYPhp45OB4pzlJn9BoqOx8kUJ0ES+w5BNuSu2zh+JumFnWSUfVDUV25
	IwUH+G5UutWZJ3tHG+dYMoaKUMgJX1rgs2iq4etZNIWLiHBSR+PEtiM+Z+j6vxIBfsRGc9mpY2m
	qpnGIL4DHwQlrX+ipWdiL50oNf7l6zTWWk0cA++VUoHm0EhbFHzorbnSNF6EsVWyfUU8c041x6M
	iOvYza1uWs96rG5jL7ZtvddvxdRLHlRAK0=
X-Received: by 2002:a05:6000:4b06:b0:48a:f318:ac02 with SMTP id ffacd0b85a97d-48b1270e876mr1613511f8f.19.1790893283205;
        Thu, 01 Oct 2026 15:21:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382fe9cesm1315755f8f.42.2026.10.01.15.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 15:21:22 -0700 (PDT)
Date: Thu, 1 Oct 2026 23:21:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org,
 Mike Rapoport <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
 luizcap@redhat.com, pbonzini@redhat.com
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261001232121.65c54816@pumpkin>
In-Reply-To: <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
	<arZHp8hjYFXE8Rkt@gremlin>
	<arde/t0zQNEkWqi5@pcnci.linuxbox.cz>
	<areOeRwZOez0eHm7@gremlin>
	<arotyz5g6LozSjb1@pcnci.linuxbox.cz>
	<arwNebjYXyGqrp32@pcnci.linuxbox.cz>
	<arzRBv9ceJsxJppI@gremlin>
	<ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
	<ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Oct 2026 21:40:58 +0200
Nikola Ciprich <nikola.ciprich@linuxbox.cz> wrote:

> Hello again,
>=20
> the good (?) news is, in the meantime we got another crash on different m=
achine
> and I have a kdump including complete vmcore. This one was 6.18.53
>=20
> here are some details:
>=20
> Hardware: Supermicro AS-2024US-TRT / H12DSU-iN, BIOS 3.5 (2025-09-22). Du=
al-socket AMD EPYC 7343 16-Core, 32 CPUs, 1024 GB RAM.
>=20
> analyzed with crash + matching vmlinux debuginfo:
>=20
> Oops:
> general protection fault, probably for non-canonical address 0xfffffff0c9=
30038
> RIP: __d_lookup+0x4a/0xc0
> Comm: systemd PID: 1274600 CPU: 23
> Call trace:
> __d_lookup
> lookup_fast
> walk_component
> link_path_walk
> path_openat
> do_filp_open
> do_sys_openat2
> __x64_sys_openat
> do_syscall_64
>=20
> Exception frame registers:
> RAX: 0fffffff0c930020 RBX: 0fffffff0c930020 RCX: 000000000000000b
> RDX: ffff985ffd223600 RSI: ffffb18962823d70 RDI: ffff989ddf09b5c0
> RBP: 000000005560450b R8: 000000007fffffff R9: fefefefefefefeff
> R10: 0000000000000000 R11: 93c3d2eb02a31dda R12: ffff989ddf09b5c0
> R13: ffff989ddf09b5c0 R14: ffffb18962823d70 R15: 0000000000000000
>=20
> Faulting instruction (cmp %ebp,0x18(%rbx)) dereferences RBX+0x18. RBX held
> the non-canonical value 0x0fffffff0c930020, giving fault address
> 0x0fffffff0c930038. __d_lookup was walking the d_hash (hlist_bl) bucket;
> RBX was the node pointer being dereferenced.

Surprisingly it looks like your compile matches the one I built from head.
The crash seems to be from the 'if (dentry->d_name.hash !=3D hash) read.
Annoyingly the list is followed with 'mov (%rbx),%rbx' so you don't get the
address of the previous item.
However the same bad address is in %rax.
That would rather imply that it is the first time around the loop and
the 'bad address' came from the hash table itself.
(Unless the exception code manages to corrupt %rax.)

The list being corrupt would have to be memory reuse (for something else)
and the rcu protection not working.

I've just noticed that the RAX and RBX values (and the code RPC offset)
exactly match those in your original report from 25-sep.
That can't be a coincidence.
Has to be some kind of 'smoking gun'.
Possibly scanning the entire dump for 0x0c930020 might show it being
used somewhere?

David



>=20
> Observations from the vmcore:
>=20
> The faulting value 0x0fffffff0c930020 is non-canonical and is not a mapped
> kernel address:
> crash> kmem 0x0fffffff0c930020 =20
> kmem: cannot determine page for fffffff0c930020
> fffffff0c930020: physical address not found in mem map
>=20
> The dentry being looked up (RDI/R12/R13 =3D 0xffff989ddf09b5c0) is intact=
 and
> well-formed:
>  name "app.slice", len 9, d_name.hash 0xCE973022 (consistent)
>  d_op =3D kernfs_dops; valid d_parent, d_inode, d_sb
>  d_hash.next =3D 0x0 (this node is the end of its bucket chain)
>=20
>  The target dentry and its hash chain in the dump show no corruption; the
>  chain terminates cleanly.
>=20
> No page migration, compaction, or THP activity was in progress on any CPU
> at panic. "bt -a" filtered for migrate*/compact*/khugepaged/kcompactd/
> kswapd/split_huge*/folio*/d_move/rename returned nothing.
>=20
> Automatic NUMA balancing was disabled at crash time (read from kernel mem=
ory):
>  crash> p sysctl_numa_balancing_mode =20
>  $ =3D 0
>=20
> Top-level (PMD) transparent hugepage policy was "never" at crash time:
> crash> p/x transparent_hugepage_flags =20
> $ =3D 0x1c0
> Bits set: 6 (DEFRAG_REQ_MADV), 7 (DEFRAG_KHUGEPAGED), 8 (USE_ZERO_PAGE).
> Bits 0 (TRANSPARENT_HUGEPAGE_FLAG) and 1 (REQ_MADV_FLAG) are clear, i.e.
> sysfs enabled =3D never. Per-order mTHP controls (huge_anon_orders_*) wer=
e not
> inspected for this dump, so mTHP state is not asserted here.
>=20
> No MCE/EDAC/hardware-error records are present in the kernel log for this=
 host.
>=20
> I can provide the full vmcore and the matching vmlinux/debuginfo on reque=
st, and
> run further crash queries against it.
>=20
> not sure if this is of any help?
>=20
> with regards
>=20
> nik
>=20
>=20
>=20
> On Wed, Sep 30, 2026 at 08:40:23PM +0200, Nikola Ciprich wrote:
> > (CC Paolo Bonzini)
> >=20
> > Hello Lorenzo,
> >  =20
> > >=20
> > > Yeah 6.18.15 is expected, I'd not say reverting is really worthwhile =
honestly,
> > > given what you've observed previously. =20
> > yes, I wasn't available at the time he was dealing with that..
> >=20
> >  =20
> > >=20
> > > Maybe worth checking if commit 26505e1b5b54 ("KVM: SVM: make svm_flus=
h_tlb_gva
> > > do a full asid flush if NPT enabled") helps in that case? =20
> > sure, I'll do that.. however, the patch doesn't apply cleanly on top of=
 6.18.54 at
> > all.. what do you guys recommend, is it OK to adjust the patch to this =
kernel
> > (I have to admit I'm able to do that, but without any deep knowledge of=
 the subsystem)
> > or do you recommend to apply some of the previous patches?
> >=20
> > tried going through them, but its ~134 commits affecting svm.c between
> > v6.18 and 26505e1b5b54
> >=20
> > cheers
> >=20
> > nik
> >  =20
> > >=20
> > > --
> > > Cheers, Lorenzo
> > >  =20
> >=20
> > --=20
> > Ing. Nikola CIPRICH
> > technick=C3=BD =C5=99editel
> >=20
> > +420 591 166 214
> > +420 777 093 799
> > nikola.ciprich@linuxbox.cz
> >=20
> > www.linuxbox.cz
> >  =20
>=20

