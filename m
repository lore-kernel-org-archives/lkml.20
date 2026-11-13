Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597363;
	b=s7HWWn2TkQBiSrDoDvdz9uEmybzaLTeXR0xBJfzAoJ8V8lGfg7F+k0xPyt7XYZOj16PH
	 nYc7T81ae+BAnmfPen+0w8ORVvYs1uCLmjvbVkNA7crNu2jC5d8W+W850GN4ZgFFthuUy
	 Hvz1uUNWjm6RpfE0wJKU3IQ5rCQaU9t9dKmGthCw1ISnGCzAKNN9zTAl/J5SV0ERhm78F
	 /1HN96/V2DxjZ0z+3IJNNE1wsMs84UHoLnpMeDpXY0PyVNWq0Ecw44rnJw3i2J9bEVxre
	 bRDQ/39VW4vgFfC/lZFFLs6NPbW+a2ii0rXfpOIc7emZ717+1232yYDdWCJwAPLFVvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=smnu7VD9Pz1vXy8ma2OlP4P/s5o4CZDhpsXj1YzIp78=;
	b=2yYCdh1Hj0hlSMnnQIeMPTdjM8AGPLuJXpgoaUqXmd//o1Ojnz3q/DI2f/8NUdLTbo3O
	 uTQC0281FszadDcYNK2C1Ii2As0bQmFK1Jl3p6yx6DZpbqUnCK8bkVk6JpYqS6URjF+75
	 D3eWbjUnnqZYPKF43Keqz6MQuj3IsTjIM+0tB22Or2YL4v0bsVb1Qepusm1qmY68ZerMN
	 xAUhin9ZfqcfpOg4kho3LgbOjNREU3Ls8vCRkG16EECBF6IsQ9KcIf1PnrXFpAtL3K7kW
	 3dlVf9oTXFZPTRw1kNpVKBYkV9TZ8uOPCSczwHZC6L9AsgHN0LgrhmXTZNi/VGMCEug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MJ96ANHU;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072D2606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072D2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MJ96ANHU
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b335eeb340so13034487b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794597362; x=1795202162; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smnu7VD9Pz1vXy8ma2OlP4P/s5o4CZDhpsXj1YzIp78=;
        b=MJ96ANHUD31SsK/+X3IbvX/qJUeo2NwA9VYta5uaqCSNpDt1S38ccpMLpbOkxUpwkN
         mIMsQvL2tMtHFJCbVAbwmrvEhr0Iajg1hzk4kH1g1emsQwOs/8o8qYnbGsW9KIw0IeKt
         TUB819w185X/mwZRZOPKBO4CXxv60/xkleUO1lhqHJVhFHzTOmSiBbtf8U13Jf95I+qe
         70GnRjd8e2Tu7xWT0Qpqc7fsI/58Obhzer+jgFenwi3bkbkD6unxPWQoC9UFpA0DReWd
         cA1CkmeWcaGREsXQ/YJW32yn9M0B9FDAxNjp+JMeRdwXkxpaXNlkBJELJUjPdVMbq8Au
         sVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597362; x=1795202162;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=smnu7VD9Pz1vXy8ma2OlP4P/s5o4CZDhpsXj1YzIp78=;
        b=s1mk5e+tCrS01vsVTknaHgQKnKR/E87Rpm3UB++BnI+nJlnA5VD+ZbMwZcV3tHH70L
         PMGTei6zDUl04uUHu8Z1f4flUZNQvrWq0OppAJRBx6Yj+bLYOubtOETFFeKzad9DorGy
         u3el63M6ahqJ5uOBe/5wvwTeOR/acd9hauvzWL4TsfbBaJx5XsIcnjgOP5dBzkJB2gd7
         J/stP1NbkMaqk8k8JPfqOICE2tGdU1CYLXdaGU658giZayvMxOXvJFKPltd4sVYSfykA
         TRlLxHxPhdsm0V6VoacWUiKkRUKYuBusDj+yCsG6aDMiZhEUW88cay7vWbhjvcW2xxXI
         +FeQ==
X-Forwarded-Encrypted: i=1; AL+hErESyxGNOgh153ngA9GPu7oTK3gFNV/8WpSC+lZUzu9VWaxLFOgo3y7/VooLBPs6QOmSsWwII+gYvm6+UuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t2+7rA2A9NSFPp9REY6nVeATXPCGzLLpqEvcGP/zBp8KlT7G6
	xg7kfTk3xEJPnyyCOc0bKjZGBd5ucxAH34Sw/x9MwKI46UuntASAFT4YLMCeUVU/xu7OQDQyvlr
	9h61WCYg=
X-Gm-Gg: AYBFou2H5VtKabcpSoSvJkExkrBQy5QGCMm076nMVlTC6Bm5LR5+xP/pyjLx5k9WQWb
	S+PpHYmS6Ved7JWmmEu3/qrWvtJth00ZR/77sOxoZLA/IxyyUzkLreBujb3+z/ire4SSu725msv
	YPMYvYlHrwnBlhilpP6y9zbDEBLBTtvDXYAf2aCrbLaD5eDBAA4HR4sgE7oF1BEGYUS/xUAxaSU
	T63QLFbli6+upvIqVzm7VEuPXGeT7DjmNNBq8jV3OjsL9CAi8rBEYZo5yEMVwcNmJbKCOV9NjDl
	FnVmXxGzAmqXwo2kC0UhCprzsWQv10MJRo9j81I+hEC6tMdy6ew9FfNB/DbOicUJpbczMu+mG/N
	3Din2p51H24Hprek85tfNQtDEwev3jQk5nRakP6uJs39axgVQiALcEEhLjuAByBWyOOEcl3PNgr
	gauTlO39esRLiJ9cw6KtbmLo7U9qI+w0nSQl631lbKaFLZ9CeMRenYFUvhQ03mvf/pdDkEmInp1
	zUvm/HEYWLx/P3I0P/mtoMKFwxXrZY6kh76RO0d0zPywSX8Z+nC5Iavku3Vo+MnKdS6yxSMJLQa
	04PtRgZQH2fff335ySV+ZTUaXRfT5/Yyzm9K9S2ZKrnRn6yyIijuUPtypc91sMtQKE3O4M8bdFA
	RI3BIJBrzgj+Jf0SEYqrlmVb4g0Scgfy1akoOsHpdRuIYJOwVM0+353NXdbvOlUitEco6jJXs6x
	O3qoyJugCGsFNHWewvNU4=
X-Received: by 2002:a05:690c:c18e:b0:8b3:38f3:8655 with SMTP id 00721157ae682-8b4aa2c1ef8mr16008637b3.75.1794597361992;
        Fri, 13 Nov 2026 11:16:01 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:93fe:5aa0:2dc4:7807? ([2600:1700:6476:1430:93fe:5aa0:2dc4:7807])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7eeaf9sm27417987b3.4.2026.11.13.11.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:16:01 -0800 (PST)
Message-ID: <ac65982941adb490a5a953557fdd76c649872d97.camel@dubeyko.com>
Subject: Re: [Bug report] hfsplus: extents-tree search_key buffer is 24
 bytes but hfs_bnode_read_key() bounds key reads against 518 - slab OOB
 write on fsync
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Guikun Yang <yangguikun19@qq.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li
	 <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 11:16:00 -0800
In-Reply-To: <tencent_F85118A9AFDF9B230D4E8FA672510A3E2F08@qq.com>
References: <tencent_F85118A9AFDF9B230D4E8FA672510A3E2F08@qq.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 22:00 +0800, Guikun Yang wrote:
> Hi,
>=20
> Appending to a file on a crafted HFS+ image ends in a
> slab-out-of-bounds write into a 24-byte allocation. The extents tree
> sizes its search key buffer from max_key_len, but
> hfs_bnode_read_key() bounds the copy against the generic union size
> (518), so any on-disk key length between 10 and 516 passes the bound
> check and overflows the extents-tree buffer - and the reject path
> itself memsets 518 bytes into the same 24-byte allocation.
>=20
> =C2=A0 BUG: KASAN: slab-out-of-bounds in hfsplus_bnode_read+0x30/0x5f0
> =C2=A0 Write of size 502 at addr ffff888005fb4100 by task init/1
> =C2=A0=C2=A0 hfsplus_bnode_read -> hfs_bnode_read_key
> =C2=A0=C2=A0 hfs_brec_insert -> __hfsplus_ext_write_extent
> =C2=A0=C2=A0 hfsplus_ext_write_extent -> hfsplus_write_inode
> =C2=A0=C2=A0 hfsplus_file_fsync -> do_fsync
> =C2=A0 Allocated by task 1:
> =C2=A0=C2=A0 hfsplus_find_init (kzalloc 24) -> hfsplus_ext_write_extent
> =C2=A0 The buggy address is located 0 bytes inside of
> =C2=A0=C2=A0 allocated 24-byte region, cache kmalloc-32
>=20
> ## The size mismatch
>=20
> hfs_find_init() sizes the search key per tree
> (fs/hfsplus/bfind.c:22):
>=20
> =C2=A0 ptr =3D kzalloc(tree->max_key_len * 2 + 4, GFP_KERNEL);
>=20
> The extents tree's max_key_len is validated at mount to
> HFSPLUS_EXT_KEYLEN - 2 =3D 10 (fs/hfsplus/btree.c:318), so its search
> key is 24 bytes. The catalog tree's is 516*2+4 =3D 1036.
>=20
> hfs_bnode_read_key() bounds the read with the generic key union
> (fs/hfsplus/bnode.c):
>=20
> =C2=A0 if (node->type =3D=3D HFS_NODE_LEAF || ...)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key_len =3D hfs_bn=
ode_read_u16(node, off) + 2;=C2=A0=C2=A0 /* raw disk
> u16 */
> =C2=A0 else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 key_len =3D tree->=
max_key_len + 2;
>=20
> =C2=A0 if (key_len > sizeof(hfsplus_btree_key) || key_len < 1) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(key, 0, siz=
eof(hfsplus_btree_key));=C2=A0=C2=A0=C2=A0=C2=A0 /* 518 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("hfsplus: I=
nvalid key length: %u\n", key_len);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0 }
> =C2=A0 hfs_bnode_read(node, key, off, key_len);
>=20
> sizeof(hfsplus_btree_key) is the union of cat (518), attr (268) and
> ext (12) keys - 518. That bound is correct only where the buffer is
> the catalog one. For the extents tree it means:
>=20
> - key_len 10..516 passes the check and memcpy writes key_len bytes
> =C2=A0 into a 24-byte allocation (502 with a crafted key length of 500)
> - key_len 517..65535, or any odd value, takes the reject path, which
> =C2=A0 memsets 518 bytes into the same 24-byte allocation
>=20
> Both paths are out-of-bounds writes; the second one fires even for a
> "rejected" key.
>=20
> ## Why the disk value reaches this point
>=20
> The bnode loader validates key_size only against the record entry
> size (fs/hfsplus/bnode.c:601):
>=20
> =C2=A0 key_size =3D hfs_bnode_read_u16(node, off) + 2;
> =C2=A0 if (key_size >=3D entry_size || key_size & 1)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto node_error;
>=20
> A record with key length 500 in a 3814-byte slot passes: 502 < 3814
> and even. The binary-search path that does check against
> max_key_len (hfs_brec_keylen(), fs/hfsplus/brec.c:71) only runs for
> the records it probes; placing the crafted record's cnid above the
> search key keeps the search converging past it without ever probing
> it. When an insert then forces a node split, hfs_bnode_split() moves
> records verbatim into the new node, and brec.c:169 calls
>=20
> =C2=A0 hfs_bnode_read_key(new_node, fd->search_key, 14);
>=20
> on the new node's first record - the crafted one - with no
> max_key_len bound in between.
>=20
> ## Reproducer
>=20
> The trigger is write(2) + fsync on a file whose data fork has 8
> extents followed by a non-contiguous allocation, forcing
> hfsplus_ext_write_extent() to insert into the extents tree and split
> the crafted leaf:
>=20
> =C2=A0 # positive: ext leaf rec2 key_len =3D 500
> =C2=A0 python3 mk_hfsplus_ext.py base_file.img run.img
> =C2=A0 python3 trigger_write.py run.img pos.log=C2=A0=C2=A0=C2=A0=C2=A0 #=
 KASAN OOB write 502
>=20
> =C2=A0 # negative: same image, only that field differs
> =C2=A0 python3 mk_hfsplus_ext.py base_file.img run.img neg=C2=A0=C2=A0 # =
key_len =3D
> 10
> =C2=A0 python3 trigger_write.py run.img neg.log=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 # clean, write
> returns 4096
>=20
> The negative control differs from the positive image in exactly one
> field - the crafted key length - and parses normally, printing
> "vda1 <lv...>"-equivalent extents output with no KASAN report.
> Positive 4/4, negative 3/3. Each run regenerates from the base image
> (the mount consumes it by writing the real extents tree back).
>=20
> ## Relation to the existing fixes
>=20
> bb5e07cb92 ("hfs/hfsplus: fix slab-out-of-bounds in
> hfs_bnode_read_key", 2024) added the 518 bound and the memset reject
> path after syzbot hit the same function through fs/hfs and the
> catalog tree, where the buffer is 1036 bytes and the bound holds.
> The extents tree's buffer (24 bytes) was never covered by that fix -
> the bound is larger than the buffer it protects, so the check is
> inert there and the reject path is itself an overflow.
>=20
> ## Suggested fix
>=20
> Bound against the actual buffer, not the union:
>=20
> =C2=A0 if (key_len > tree->max_key_len + 2 || key_len < 1) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(key, 0, tre=
e->max_key_len + 2);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("hfsplus: I=
nvalid key length: %u\n", key_len);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0 }
>=20
> This covers both the memcpy and the reject-path memset for every
> tree with one change. The extents tree additionally can never see
> a key_len above 12 on a well-formed volume (HFSPLUS_EXT_KEYLEN),
> so max_key_len + 2 is the natural bound.
>=20
> The reproducer (image builder for positive and negative cases,
> serial logs) is available on request.
>=20
> Tested on 7.3.0; fs/hfsplus/bnode.c is unchanged in current
> mainline as of 2026-11-12.
>=20


Please, send the formal patch for review and testing.

Thanks,
Slava.
