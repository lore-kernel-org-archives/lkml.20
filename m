Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAA41DDEA
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791152474; cv=none; b=XlEBF5Ss0Fsd4FBtJYOhrONL5QqjAnVBDKsrmjzhwFQ395Kx8Zjv6UayUN/TagVnAknGLDc8R+3dit3bLsxQamHYFoCZT+GWgBsvwj332Aeh7E/cuOlp7KzedrcQToty1XHNUFFLgIgtxut9Ud3pJHs9uusbsGxVJYSc+CKrGig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791152474; c=relaxed/simple;
	bh=qC4IzCdjVe1s87vXlnIodDPObpwOPfFiNB2ve5IjDBA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aPNb5SYAQSQNle/Uo42AHw+NL0UXZbm6tbsbMFkJzL09k/KqMZQlQU2Wc8VMd7CTA6zg6rq43tbnU8VIZ/bpe1lJJqMT743VnyyItslr+etNUdIMnyzQ04IFI9yOvWsf60QCIngMCPQ5N2XsJNMpKsK9G8qczn2RVs2EP6kls+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=kzh9Oyez; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="kzh9Oyez"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=wb7gxph3IORTxgMsT1OoGvtue2WX8WwlEpGiimQayxo=; b=kzh9Oy
	ezuKgD1ELQmY59jqiTCXZMO/iaBk882jo9olUCB8W7d22TfzFudo/clSkvsPu0kheA8NYSYce3yGz
	d3IU0U1NB3bUkcUWNL4Fjk21MCStalg72U1ksTe4VBqmK1n0Jtzc2LMfozDZX+Zpqm+LxcNrSD9iB
	S60jStfBnirFrJaF/XHr25I4x6ay8U3NGjMeQyuIIpJiGWzC0NhI6Eaehkuda8frpZTgE58qKuRK9
	UPB0pdkIONsXEnT7xpwbnd/c83OPZxCFIWF3EfIZ5SQQ9AyG82wwHrM/YkEb5Za0vlSCrhhUmOE4e
	RUuNiMPCuQnUmkjyBZflblfnJ2sw==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xDUZf-00000005xhB-2HwS;
	Sun, 04 Oct 2026 22:20:51 +0000
Message-ID: <e31bb97e34de9e37ef27f02ff98f63fb17fc57a0.camel@surriel.com>
Subject: Re: hunting memory corruption bug in 6.18.x
From: Rik van Riel <riel@surriel.com>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 david@kernel.org, 	ljs@kernel.org
Date: Sun, 04 Oct 2026 18:20:50 -0400
In-Reply-To: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
References: <arY1Wq6R9OY20ans@pcnci.linuxbox.cz>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-25 at 10:48 +0200, Nikola Ciprich wrote:
> Hi,
>=20
> I've been hunting a weird memory corruption bug for the last few
> weeks,
> without success so far, so I'd like to report it and kindly ask for
> help.
>=20
> We first hit it after a live VM migration between two KVM hosts:
> suddenly some dynamic libraries in the host appeared to be corrupted:
>=20
> Inconsistency detected by ld.so: ../sysdeps/x86_64/dl-machine.h: 548:
> elf_machine_rela_relative: Assertion `ELFW(R_TYPE) (reloc->r_info) =3D=3D
> R_X86_64_RELATIVE' failed!
>=20
> (Later we also hit this with libcrypto.so.3 etc.) The files on disk
> were OK; the problem seemed to exist only in RAM.
>=20
>=20

> I suspect two subsystems that have seen a lot of changes:
>=20
> - transparent hugepages
> - NUMA balancing
>=20
THP has a recent patch that may be relevant:

https://lore.kernel.org/all/20260903031608.1194238-1-vernon2gm@gmail.com/

> As a safety measure, we've disabled THP and NUMA balancing on all
> hosts.

Does the issue still happen with THP and NUMA balancing disabled?

>=20
> [1924553.414736] Oops: general protection fault, probably for non-
> canonical address 0xfffffff0c930038: 0000 [#1] SMP NOPTI

This is more than a little curious. That does not look
like a normal kernel address.

Documentation/arch/x86/x86_64/mm.rst confirms:

   fffffc0000000000 |   -4    TB | fffffdffffffffff |    2 TB | ...
unused hole
                    |            |                  |         |
vaddr_end for KASLR
   fffffe0000000000 |   -2    TB | fffffe7fffffffff |  0.5 TB |
cpu_entry_area mapping
   fffffe8000000000 |   -1.5  TB | fffffeffffffffff |  0.5 TB | ...
unused hole
   ffffff0000000000 |   -1    TB | ffffff7fffffffff |  0.5 TB | %esp
fixup stacks
   ffffff8000000000 | -512    GB | ffffffeeffffffff |  444 GB | ...
unused hole
   ffffffef00000000 |  -68    GB | fffffffeffffffff |   64 GB | EFI
region mapping space
   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | ...
unused hole
   ffffffff80000000 |   -2    GB | ffffffff9fffffff |  512 MB | kernel
text mapping, mapped to physical address 0
   ffffffff80000000 |-2048    MB |                  |         |
   ffffffffa0000000 |-1536    MB | fffffffffeffffff | 1520 MB | module
mapping space
   ffffffffff000000 |  -16    MB |                  |         |
      FIXADDR_START | ~-11    MB | ffffffffff5fffff | ~0.5 MB | kernel-
internal fixmap range, variable size and offset
   ffffffffff600000 |  -10    MB | ffffffffff600fff |    4 kB | legacy
vsyscall ABI
   ffffffffffe00000 |   -2    MB | ffffffffffffffff |    2 MB | ...
unused hole

That address is in the unused hole between EFI
region mapping space, and kernel text mapping.

That is not an address that should be overly
affected by TLB flushes, since the kernel never
maps anything there, and never has anything to
flush at that address, either.

> [1924553.434800] CPU: 23 UID: 189 PID: 7538 Comm: pacemaker-contr
> Kdump: loaded Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 E=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.18.44lb9.01 #1
> PREEMPT(voluntary)
> [1924553.456934] Tainted: [E]=3DUNSIGNED_MODULE
> [1924553.465551] Hardware name: ASUSTeK COMPUTER INC. RS720A-E12-
> RS12/K14PP-D24 Series, BIOS 2305 11/21/2025
> [1924553.484152] RIP: 0010:__d_lookup+0x4a/0xc0
> [1924553.492878] Code: ff 48 89 c5 c1 e8 07 48 8d 1c c2 e8 60 8f d1
> ff 48 8b 03 48 89 c3 48 83 e3 fe 48 83 f8 01 77 0a eb 2f 48 8b 1b 48
> 85 db 74 27 <39> 6b 18 75 f3 4c 8d 63 78 4c 89 e7 e8
> d5 e1 7c 00 4c 39 6b 10 74
> [1924553.525191] RSP: 0018:ff7532a13699fda0 EFLAGS: 00010212
> [1924553.534986] RAX: 0fffffff0c930020 RBX: 0fffffff0c930020 RCX:
> 0000000000000000

Which suggests it's probably following a bad
pointer in __d_lookup.

The dcache is allocated with kmalloc, and lives
in the kernel linear mapping. That is also not
a range where TLB flushes commonly happen, except
as a side effect of global flushes, or changes in
kernel mapping size (CPA flushes).

The filename lives in kernel stack memory, which
is often allocated with vmalloc. I'm not aware of
any recent vmalloc TLB issues, but maybe somebody
else knows something?

By the time memory is allocated to be used as a
kernel stack, the previous users of those pages
should be long gone.=C2=A0

This does not feel like the INVLPGB bug, which
has a very short race window.

Lorenzo's CPA explanation seems like the most
likely right now.

If it still happens with that fix applied, we
need to do more digging.

--=20
All Rights Reversed.
