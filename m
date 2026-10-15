Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47924A2617
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055496; cv=none; b=o+cHKj8sjP+kCD66Au6IXInuOYuIuJcbsk3E4qBYIupqCAsFGSXl3h63uyGHSjyzSDks63Bkqdzl/P98SpiaXH8qrIY6sePK3jIDvQhNKv6U9LSfqBJj9oexEwpy02W3JjHtoHU1E0tB0YpzNuimk0UN2DVYXBdzwM7EVHYkmfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055496; c=relaxed/simple;
	bh=GV6+dn970X4zWkmdQ28kBFK+YgI6K79Hl2xM6pk8U+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFNU4PB4hfwhBqK8/y8UbaidwwS0CRXv5O0524e+rGI3w4IxtAosHQDO8AUlf+7ld/sCGdx9RzNqHjdK0mNYRaAWX+0vldTMMb61ks+DImQAL3ZqGFDP3YjfYpokUI5igjbDew35OJjt/birq6ktB7q/mFgvDwSmxf1M4h72cpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=MwM5/UV8; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="MwM5/UV8"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 69F9ASlD679298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 Oct 2026 11:10:28 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 69F9ASlD679298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1792055429;
	bh=v9swHdog926y+MPZnHCnKOnpW099M4JImcRy3PrIb7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwM5/UV8VhrTY/5NfRMboGmdWcQhM8hzONiWKHbpeWbmuRojASJkPVviMTQ+e5oSM
	 PGgmMJxcM0fglrbNc4fsqkVhg3VrbHYeJLQ76uJABQm1Xg38yxCHVoj4b2jNDrFp0v
	 Pz0F6+COr8r6124nwrIA8tjZ/yy224xk+Pe3nG8U=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 69F9ARuX003316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 Oct 2026 11:10:28 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 69F9AOwi2934395
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 11:10:27 +0200
Date: Thu, 15 Oct 2026 11:10:24 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: Borislav Petkov <bp@alien8.de>
Cc: David Laight <david.laight.linux@gmail.com>,
        Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        david@kernel.org, Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Tal Zussman <tz2294@columbia.edu>,
        Matt Fleming <matt@readmodwrite.com>,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <atCYcsfB4s5Anf1m@pcnci.linuxbox.cz>
References: <asAE3kLFDUx5v0Nw@gremlin>
 <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235356.GBatAWFNsWaIA2HQ4M@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261014235356.GBatAWFNsWaIA2HQ4M@fat_crate.local>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

>=20
> So I took a look. The one you added the sources for is this: 20261008-lbx=
v1f
> and below is what I could decipher it to.
>=20
> Long story short, I *think* that dentry pointer becomes funky:
>=20
>         hlist_bl_for_each_entry_rcu(dentry, node, b, d_hash) {
>                 unsigned seq;
>=20
>                 /*
>                  * The dentry sequence count protects us from concurrent
>                  * renames, and thus protects parent and name fields.
>                  *
>                  * The caller must perform a seqcount check in order
>                  * to do anything useful with the returned dentry.
>                  *
>                  * NOTE! We do a "raw" seqcount_begin here. That means th=
at
>                  * we don't wait for the sequence count to stabilize if it
>                  * is in the middle of a sequence change. If we do the sl=
ow
>                  * dentry compare, we will do seqretries until it is stab=
le,
>                  * and if we end up with a successful lookup, we actually
>                  * want to exit RCU lookup anyway.
>                  *
>                  * Note that raw_seqcount_begin still *does* smp_rmb(), so
>                  * we are still guaranteed NUL-termination of ->d_name.na=
me.
>                  */
>                 seq =3D raw_seqcount_begin(&dentry->d_seq);
> 					 ^^^^^^^^^^^^^^
>=20
> Now, the $10^6 question is, do you have the crash dump still and if so, c=
an
> you figure out what the real address of that dentry is?
>=20
> The wrong one is: 0xffffffff0c930020 so I'm guessing that 0 after the fff=
f's
> should actually be 81-something as that's kernel memory.

I don=E2=80=99t have the vmcore for 20261008-lbxv1f (that box got fenced), =
but I have
a full vmcore for 20260930-flev1c, which is the same bug: same crash in the
dcache hash walk, and the same bad value =E2=80=94 flev1c has 0x0fffffff0c9=
30020
(top byte sheared), lbxv1f has 0xffffffff0c930020 (canonical). Identical low
48 bits (...0c930020). flev1c is __d_lookup (6.18.53), lbxv1f is
__d_lookup_rcu (6.18.55), so they may surface at slightly different points =
in
the walk =E2=80=94 mapping what I see on flev1c onto lbxv1f is for you to j=
udge.

What I can show from the flev1c dump:

The bad value is NOT a sheared dentry pointer =E2=80=94 it=E2=80=99s the ha=
sh bucket head
that=E2=80=99s corrupt. __d_lookup computed the bucket from the hash
(dentry_hashtable=3D0xffffb18900a00000, d_hash_shift=3D7) as
0xffffb18905f60450 and loaded the first node from it: crash> rd -64 0xffffb=
18905f60450 1
ffffb18905f60450: 0fffffff0c930020 i.e. the garbage was already sitting in =
the bucket slot; the walk
dereferenced it as node->d_name.hash (+0x18) and took the GP fault.
The dentry the lookup was actually for (=E2=80=9Capp.slice=E2=80=9D,
0xffff989ddf09b5c0) is fully intact, and its seqcount is even/stable: crash=
> struct dentry.d_seq 0xffff989ddf09b5c0
d_seq =3D { seqcount =3D { sequence =3D 2 } } So no rename/update was in pr=
ogress =E2=80=94 this doesn=E2=80=99t look like a d_seq /
raw_seqcount_begin race on flev1c; the bucket head itself holds foreign
data.
On the real address question: on this box page_offset_base =3D
0xffff985a80000000 (not 0xffff81=E2=80=A6), so a direct-map dentry would be
0xffff985a=E2=80=A6=E2=80=A6, and 0x=E2=80=A60c930020 doesn=E2=80=99t recon=
struct to a valid dentry
under that base. That=E2=80=99s because the value isn=E2=80=99t a corrupted=
 pointer at
all =E2=80=94 it appears to be foreign structured data written into the buc=
ket: crash> search -p 0x0fffffff0c930020
finds this exact value in ~10 physically-scattered frames, always at page
offsets 0x400/0x420/0x430/0x440/0x450 (relative to a 0x400 base:
+0x00/+0x20/+0x30/+0x40/+0x50; none at +0x10). Those frames all hold the
same fixed-format record: constant header 0x00ff00ff00100010 /
0xbdcc802700060042, a couple of varying address/length-looking fields,
and 0xcc padding. The frames=E2=80=99 struct page also carries stale page_p=
ool
metadata (pp_magic set, pp_ref_count=3D0) while in use elsewhere.

So on flev1c it looks less like =E2=80=9Ca dentry pointer went funky=E2=80=
=9D and more like
=E2=80=9Csome other structure=E2=80=99s content got written into dcache (an=
d other) frames,
one copy landing in a hash bucket.=E2=80=9D Does that header signature
(0x00ff00ff00100010 / 0xbdcc802700060042) ring a bell for any structure?

Happy to run anything else against this vmcore =E2=80=94 struct page dumps =
for the
affected frames, the full record contents, the physical-search hit list, et=
c.

BR

nik




>=20
> Hmmm?
>=20
> Thx.
>=20
> [11402.940943] BUG: unable to handle page fault for address: ffffffff0c93=
001c
> [11402.942273] #PF: supervisor read access in kernel mode
> [11402.943629] #PF: error_code(0x0000) - not-present page
> [11402.945025] PGD 6d6f83a067 P4D 6d6f83b067 PUD 0=20
> [11402.946469] Oops: Oops: 0000 [#1] SMP NOPTI
> [11402.947950] CPU: 23 UID: 0 PID: 704950 Comm: servercare-moni Kdump: lo=
aded Tainted: G            E       6.18.55lb9.01 #1 PREEMPT(voluntary)=20
> [11402.951254] Tainted: [E]=3DUNSIGNED_MODULE
> [11402.952913] Hardware name: ASUSTeK COMPUTER INC. RS720A-E12-RS12/K14PP=
-D24 Series, BIOS 1201 08/25/2023
> [11402.956569] RIP: 0010:__d_lookup_rcu+0x4d/0xe0
>=20
> ffffffff8165ae30 <__d_lookup_rcu>
> 		+0x4d =3D 0xffffffff8165ae7d
>=20
> [11402.958452] Code: 48 8d 04 c2 f6 07 02 0f 85 a0 00 00 00 48 8b 10 48 8=
9 d0 48 83 e0 fe 48 83 fa 01 77 0d e9 80 00 00 00 48 8b 00 48 85 c0 74 78 <=
44> 8b 58 fc 48 39 78 10 75 ee 48 83 78 08 00 74 e7 48 39 58 18 75
>=20
> [11402.958452] Code: 48 8d 04 c2 f6 07 02 0f 85 a0 00 00 00 48 8b 10 48 8=
9 d0 48 83 e0 fe 48 83 fa 01 77 0d e9 80 00 00 00 48 8b 00 48 85 c0 74 78 <=
44> 8b 58 fc 48 39 78 10 75 ee 48 83 78 08 00 74 e7 48 39 58 18 75
>=20
> ffffffff8165ae6e:       77 0d                   ja     ffffffff8165ae7d <=
__d_lookup_rcu+0x4d>
> ffffffff8165ae70:       e9 80 00 00 00          jmp    ffffffff8165aef5 <=
__d_lookup_rcu+0xc5>
> ffffffff8165ae75:       48 8b 00                mov    (%rax),%rax
> ffffffff8165ae78:       48 85 c0                test   %rax,%rax
> ffffffff8165ae7b:       74 78                   je     ffffffff8165aef5 <=
__d_lookup_rcu+0xc5>
> ffffffff8165ae7d:       44 8b 58 fc             mov    -0x4(%rax),%r11d
>=20
> <--- here
>=20
> that looks like:
>=20
> struct dentry *__d_lookup_rcu(const struct dentry *parent,
> ...
>=20
> 	                seq =3D raw_seqcount_begin(&dentry->d_seq);
> 			...
>=20
> 			#define raw_read_seqcount(s)                                          =
  \
> ({                                                                      \
>         unsigned __seq =3D seqprop_sequence(s);                          =
 \
>=20
> which is that unreadable gunk:
>=20
> # ./include/linux/seqlock.h:227: SEQCOUNT_LOCKNAME(spinlock,     spinlock=
_t,      __SEQ_RT, spin)
> #NO_APP
> 	movl	-4(%rax), %r11d	# MEM[(const volatile unsigned int *)node_49 + -4B]=
, _25
> # ./include/linux/seqlock.h:227: SEQCOUNT_LOCKNAME(spinlock,     spinlock=
_t,      __SEQ_RT, spin)
>=20
> i.e., that dentry->d_seq _Generic selector pointer thing:
>=20
>   seq =3D ({ ({ unsigned __seq =3D
>=20
>         _Generic(*(&dentry->d_seq), seqcount_t:
>                 __seqprop_sequence, seqcount_raw_spinlock_t:
>                 __seqprop_raw_spinlock_sequence, seqcount_spinlock_t:
>                 __seqprop_spinlock_sequence, seqcount_rwlock_t:
>                 __seqprop_rwlock_sequence,  seqcount_mutex_t:
>                 __seqprop_mutex_sequence)(&dentry->d_seq);
>   kcsan_atomic_next(1000); __seq; }) & ~1; });
>=20
>=20
> ffffffff8165ae81:       48 39 78 10             cmp    %rdi,0x10(%rax)
> ffffffff8165ae85:       75 ee                   jne    ffffffff8165ae75 <=
__d_lookup_rcu+0x45>
> ffffffff8165ae87:       48 83 78 08 00          cmpq   $0x0,0x8(%rax)
> ffffffff8165ae8c:       74 e7                   je     ffffffff8165ae75 <=
__d_lookup_rcu+0x45>
> ffffffff8165ae8e:       48 39 58 18             cmp    %rbx,0x18(%rax)
> ffffffff8165ae92:       75 e1                   jne    ffffffff8165ae75 <=
__d_lookup_rcu+0x45
>=20
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   48 8d 04 c2             lea    (%rdx,%rax,8),%rax
>    4:   f6 07 02                testb  $0x2,(%rdi)
>    7:   0f 85 a0 00 00 00       jne    0xad
>    d:   48 8b 10                mov    (%rax),%rdx
>   10:   48 89 d0                mov    %rdx,%rax
>   13:   48 83 e0 fe             and    $0xfffffffffffffffe,%rax
>   17:   48 83 fa 01             cmp    $0x1,%rdx
>   1b:   77 0d                   ja     0x2a
>   1d:   e9 80 00 00 00          jmp    0xa2
>   22:   48 8b 00                mov    (%rax),%rax
>   25:   48 85 c0                test   %rax,%rax
>   28:   74 78                   je     0xa2
>   2a:*  44 8b 58 fc             mov    -0x4(%rax),%r11d         <-- trapp=
ing instruction
>=20
> rax =3D ffffffff0c930020
>=20
>   2e:   48 39 78 10             cmp    %rdi,0x10(%rax)
>   32:   75 ee                   jne    0x22
>   34:   48 83 78 08 00          cmpq   $0x0,0x8(%rax)
>   39:   74 e7                   je     0x22
>   3b:   48 39 58 18             cmp    %rbx,0x18(%rax)
>   3f:   75                      .byte 0x75
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   44 8b 58 fc             mov    -0x4(%rax),%r11d
>    4:   48 39 78 10             cmp    %rdi,0x10(%rax)
>    8:   75 ee                   jne    0xfffffffffffffff8
>    a:   48 83 78 08 00          cmpq   $0x0,0x8(%rax)
>    f:   74 e7                   je     0xfffffffffffffff8
>   11:   48 39 58 18             cmp    %rbx,0x18(%rax)
>   15:   75                      .byte 0x75
>=20
>=20
> [11402.964498] RSP: 0018:ff3eefdafcacfc40 EFLAGS: 00010292
> [11402.966642] RAX: ffffffff0c930020 RBX: 000000061356452c RCX: 000000000=
0000006
> [11402.968884] RDX: ffffffff0c930020 RSI: ff3eefdafcacfd70 RDI: ff2d1acd0=
0409140
> [11402.971167] RBP: ff3eefdafcacfda4 R08: 8080808080808080 R09: fefefefef=
efefeff
> [11402.973512] R10: 0000303539343037 R11: 0000000000000004 R12: ff2d1acd8=
cb0b7e0
> [11402.975915] R13: ff3eefdafcacfd70 R14: 0000000000000000 R15: 000000000=
0000000
> [11402.978356] FS:  00007f757eaed640(0000) GS:ff2d1b89b5a42000(0000) knlG=
S:0000000000000000
> [11402.980842] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [11402.983374] CR2: ffffffff0c93001c CR3: 00000004ba18e002 CR4: 000000000=
0771ef0
> [11402.986004] PKRU: 55555554
> [11402.988640] Call Trace:
> [11402.991231]  <TASK>
> [11402.993831]  lookup_fast+0x2b/0x100
> [11402.996468]  walk_component+0x1f/0x150
> [11402.999080]  link_path_walk+0x105/0x2a0
> [11403.001714]  path_openat+0x99/0x2b0
> [11403.004319]  ? srso_alias_return_thunk+0x5/0xfbef5
> [11403.006983]  ? up_read+0x5a/0x90
> [11403.009610]  ? srso_alias_return_thunk+0x5/0xfbef5
> [11403.012250]  ? do_user_addr_fault+0x190/0x6a0
> [11403.014927]  do_filp_open+0xd3/0x180
> [11403.017635]  ? __pfx_kfree_link+0x10/0x10
> [11403.020383]  ? srso_alias_return_thunk+0x5/0xfbef5
> [11403.023097]  do_sys_openat2+0x8a/0xe0
> [11403.025765]  __x64_sys_openat+0x69/0xa0
> [11403.028424]  do_syscall_64+0x64/0xba0
> [11403.031066]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [11403.033733] RIP: 0033:0x7f75816ff1e4
> [11403.036336] Code: 24 20 eb 8f 66 90 44 89 54 24 0c e8 26 8c f8 ff 44 8=
b 54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 34 44 89 c7 89 44 24 0c e8 78 8c f8 ff 8b 44
> [11403.044367] RSP: 002b:00007f757eaeb870 EFLAGS: 00000293 ORIG_RAX: 0000=
000000000101
> [11403.047072] RAX: ffffffffffffffda RBX: 00007f757eaed5e0 RCX: 00007f758=
16ff1e4
> [11403.049795] RDX: 0000000000080000 RSI: 00007f757edd90e2 RDI: 00000000f=
fffff9c
> [11403.052470] RBP: 00007f757edd90e2 R08: 0000000000000000 R09: 000000000=
0000000
> [11403.055070] R10: 0000000000000000 R11: 0000000000000293 R12: 000000000=
0080000
> [11403.057594] R13: 00007f758187fe50 R14: 00007f75818e5040 R15: 000000000=
0000001
> [11403.060096]  </TASK>
> [11403.062521] Modules linked in: vhost_net(E) vhost(E) vhost_iotlb(E) ta=
p(E) tun(E) ceph(E) libceph(E) cts(E) krb5enc(E) authenc(E) camellia_aesni_=
avx2(E) camellia_aesni_avx_x86_64(E) camellia_x86_64(E) camellia_generic(E)=
 cmac(E) krb5(E) dns_resolver(E) netfs(E) nf_tables(E) tcp_diag(E) udp_diag=
(E) inet_diag(E) netconsole(E) sctp(E) ip6_udp_tunnel(E) udp_tunnel(E) rfki=
ll(E) nfnetlink_cttimeout(E) nfnetlink(E) openvswitch(E) nf_conncount(E) nf=
_nat(E) nsh(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) sunrpc(E=
) kvm_amd(E) sr_mod(E) kvm(E) irqbypass(E) amd_atl(E) cdrom(E) sd_mod(E) am=
d64_edac(E) wmi_bmof(E) cdc_ether(E) acpi_ipmi(E) sg(E) edac_mce_amd(E) acp=
i_cpufreq(E) usbnet(E) pcspkr(E) ipmi_si(E) mii(E) ipmi_ssif(E) i2c_piix4(E=
) ipmi_devintf(E) vfat(E) i2c_smbus(E) k10temp(E) ipmi_msghandler(E) wmi(E)=
 fat(E) i2c_core(E) sch_fq_codel(E) fuse(E) ext4(E) crc16(E) mbcache(E) jbd=
2(E) raid1(E) usb_storage(E) nvme(E) ahci(E) libahci(E) mpt3sas(E) raid_cla=
ss(E) xhci_pci(E) nvme_core(E) ghash_clmulni_intel(E) libata(E)
> [11403.062611]  scsi_transport_sas(E) i40e(E) nvme_keyring(E) libie(E) nv=
me_auth(E) xhci_hcd(E) sp5100_tco(E) libie_adminq(E) hkdf(E) dm_mod(E) dax(=
E) aesni_intel(E)
> [11403.100478] CR2: ffffffff0c93001c
>=20
>=20
> --=20
> Regards/Gruss,
>     Boris.
>=20
> https://people.kernel.org/tglx/notes-about-netiquette
>=20

--=20
Ing. Nikola CIPRICH
technick=C3=BD =C5=99editel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
