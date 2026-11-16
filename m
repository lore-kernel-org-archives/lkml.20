Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793514;
	b=PFTqgoG5qk93ZyAjAqWwm72UHySBOfJ7TRbFUQ2VTQXBN8HHMnxhZ0n97yVJnWcU57AQ
	 fBmrq04YXxq7nHzboVKYQW758McMg6JDinJcF2qGg14Uf2NfYx42/XBz/UNWroYYoeHAS
	 iv+2s4SJaHmjhZgUN0IjIUBOZj2LeriPIKx5JBDze4gcrwhfdrsee0XPEcRaVJfx9nxTt
	 LIMk+KWmWVtNCBJb9pD8RH+omwx2BXzXZGvvd/UezuC3Sy85qOgIlMjG/yfsyN8sOTZMX
	 D3u6Kf20t54wORR9hs4KWSUPRBDKawy25wrqHANcxDsmBuikUD3irr5iBhszVjWlE8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793514;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yq4wxP+luLkyU/rw3DaR3hYs/9Ce8Ej9rn0GDWuMrAo=;
	b=umHn89ORDFxEW10wsiPQ7mPvRWP87TE6F77PSvoGzo4+KsaQ52jJDZn/1HAehqgSNSBZ
	 atcXvB9zkii/MxGxjJz0O5mwfRtj6LbbfvGv9PYh5bgKBmDvlEzwrM3Lv+y+uHAokjEzN
	 rgGStR5HeIzgi8HpnBjZwbYzM0uhDf5lfVkvePvrXIsR+SDckjFMAcQI8F5gDfUmCi1hV
	 SdKI+Cjsa0ihPPaRYIsb9qCmlkwb7fddSDskqzCEzwXLY+p1je7hQwQm1mr7GutqylgzX
	 Qp99/aiiebrDrqz2jme4Ai6p2crzBu5R7r8jUhTUEZS9CP/GPf2dF+9O1XhM7wGD6ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=invisiblethingslab.com;
	spf=pass smtp.mailfrom=invisiblethingslab.com;
	dkim=pass header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=gaX8slui;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tyclZ+8K;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1C606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC1C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=gaX8slui;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tyclZ+8K
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6AD77EC0077
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:45:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 20:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1794793513;
	 x=1794879913; bh=yq4wxP+luLkyU/rw3DaR3hYs/9Ce8Ej9rn0GDWuMrAo=; b=
	gaX8sluivpoetoiSiZcm39e3q/ZXW5rVCwk5ho8LglsbLjPnPnjkmsR8R/IeNCe8
	YSIvmaamShG8jsh8QbuAyfv0A1EL4Iqnq4VqroZ6pvAAv0TQPZr9uLTwl5BcPcFe
	3J/wMJHFGF+gBoOD5GHbbirGnzvk8X6+WkoTm+nUJt0HPHsXXsf9jlkV6ebKgQuD
	Y1vOgI+9dqz+HM+9mriHHcH7KFgpNHVskF1nuk+oUZ2h2DSyqNnCXda/S7LsLcQP
	cG2sm2HvD4xOlrSYuI0C9MDVtCGulHpWcADL84h8m0TeypAJ5N4g5AX89ThIt38e
	nSFbiX0IH8ElPDbU1bHHvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794793513; x=1794879913; bh=yq4wxP+luLkyU/rw3DaR3hYs/9Ce8Ej9rn0
	GDWuMrAo=; b=tyclZ+8KpeJuUBI4+cvLrvkR/S6aJUnPTMZ4BhXe1yJq38jWnT5
	QbQOMqpfduNsfS/Zvx2uXlkl1n7urYRyMTydZuLNwmTy83JXySSjSh26maNgpahk
	ohZWuyF0Zr/dbklb69S/8XcGkd3vwcItRrVgIAVRg86f/WpnjYZlcug6ZOjszSfk
	0jyRm2GLbTTWtgz/Si3hkZ0DLK54OPJKbTJDbiPZCQH31I8J7uu9j1qUv1VHdSqh
	qNx6YyzX34vyxWtjn89qgwtmzMRM3FnsppMvC2QxQUOH4L0T1Jn7hGgt3kpcF7NK
	kyqi6q73rUY2rMOT0XSDUSB8Crsno7aQ71g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794793513; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:LF1CUazd3SCQlXXTqT+W84ZlJrFifX7YysVqn6kL6iEhNpD
	uVjgnyyrV+CriA7xac+c/q9wEicMI0lr3i4LionNVa0ZEczjNUHGRafz7haEZKxR
	Cet61hj5N8wC1W/X8Uo2ehsB4qagx4f7lkeBUiHZGWhoVoTKdKB7Vd4g9P/kaWB7
	vBrS0d+eM1KmgnmdgeLlivJid3IuDqVAOHYspB0mO7K1PUMiVkgqHUWcMakJQ1wg
	N9Fp3dqLxTDzOpUlwolC1CAg/AnGhGka3Q0G03bQ0HuoUvhOdBRr7iZbR58TScvu
	iP1DoaZ4PLCvu5DHH8WsweLJMQIJVRW7FkhBDyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:priOex6qlveEWSTQZk/pxA/1wP+4WPYpdhFj+cb7cPg=:PMv6QJFjQPpcqcJpW4curElnaQLLn/3xyTp5+OnF/KA=;
X-ME-Sender: <xms:KWD6argNKiVnt9XfNrvfvsfPvErjqMuXCfbuJ8bUHAWMpIkkWYkz_Q>
    <xme:KWD6aplkiQP5E-9qsGnFYyf2JNR1JUVIOpRohkfuZASdFM2kJIFarllZ-CijuxvMF
    6O-rh0m2kGd4GHPMtwFG4ojbXRAURMYj1IlfKd-hrTUDPlSjtI>
X-ME-Received: <xmr:KWD6aqXhd6NIjxats70sxzwQSqP_O4nXPBVJ3k_u3bsL5W1uQi71zr5xxBvBGTcghyBUtLhrI3F0RB6toGn-FP0NfkebIQhlsPjMXjMQrtE>
X-ME-Proxy-Cause: dmFkZTFSQY9tcM+daSIepXeP8dBZP51mshbofqi8VoYbRnvnqRsWEF5u7g3MgY+hXs6bth
    iBvx3pDIxTze3pKJ8J76umHzDkv9aUOBs547oEK3qwzeA1Gz51xgmlBLNtg/a8WB6EBFw3
    gAZJ2l3OQcy2R2SwkyMD1WFdxll6Izux/eTZIMIL0ggAVsdlYNORR+joQy93pZ/dHsUbqR
    6qbZnqbYR77ScEiHP0+G+yhNLFwZZhwZxpoVv7odmJdbGKiqN8JeQWa0sd86heQmqfQt9C
    uOm6XYQO4WjrNykj8sFXskGrHzvLkGrTG/3ZrflEzGfYpkf04O42ntdP6W/6zncWrNsEID
    X4k3jo8xJlrK0ImWYNWlh5iT1yIuIWfoP21giMWl+vqAYRsn19bKp5DlVj6/jmjpDSRM+s
    n1q+rnH3t2y/UVAWNrstZDvwULlOYuwnLIdwemWRaYraCCwnA3ApB8+YphBPcMPGYILOUP
    DEFr2MT7FqkJVhrQLt44IqOlOkQbquoHRV5DIEBKEK+GJSaLXu0p5Be4uEmAjP+PkhkS/t
    5EebTk02qltVtEKboI3tC7c7oELgtCUV4G/gPQkVRRxX1nFSrj1eT+vagZf+iKEQVPJfY7
    ygALRa26qnC+9Uy9Fbeqzv3DBfsY5cg2zhVLWtZrH6SMeaHdhBTmKLcxAKkw
X-ME-Proxy: <xmx:KWD6ausi4JP0ou5nKTVm-H7MMu-oe598dHAoP_BQ9jonxUrN8cttwg>
    <xmx:KWD6at4NCxpV3eG-mqLMxzEFkbcIpqbV7igphsQuYrtEB_VZuTbQVQ>
    <xmx:KWD6ahTaPKSv9vrLxz_GFTLs4pXCM6qdk8Vk4GnEXcu0_ojspDDcxw>
    <xmx:KWD6agv0Nnk1en1OYzla4F-8IYEHIO-HsOBO7rWLD2Bc8jmAQOyzzg>
    <xmx:KWD6aqmvz-6xlOMbuB4yNuiFV9jqU0JntwyDhJa4OJ4M79rP1V3AwzAv>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Nov 2026 20:45:11 -0500 (EST)
Date: Mon, 16 Nov 2026 02:45:09 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
	Prathyushi Nangia <prathyushi.nangia@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/CPU/AMD: fix booting on Xen PV domU
Message-ID: <avpgJcmTVQcHf8QB@mail-itl>
References: <20261116014057.7409-1-marmarek@invisiblethingslab.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R+rzyDkPwqgN2Waf"
Content-Disposition: inline
In-Reply-To: <20261116014057.7409-1-marmarek@invisiblethingslab.com>

--R+rzyDkPwqgN2Waf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 02:45:09 +0100
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
	Prathyushi Nangia <prathyushi.nangia@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/CPU/AMD: fix booting on Xen PV domU

On Mon, Nov 16, 2026 at 02:40:00AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> Reading the FCH_PM_S5_RESET_STATUS register doesn't make sense in a VM,
> as it's about reporting last hardware reset reason and VM has no access
> to it. On most hypervisors, reading it will simply return all-ones, but
> unfortunately Xen PV domU is (again) special and trying to read not
> allowed MMIO space results in a panic:
>=20
>     1 of 1 multicall(s) failed: cpu 1
>       call  1: op=3D1 arg=3D[ffff88801851b010] result=3D-22
>     BUG: unable to handle page fault for address: ffffc9004002d3c0
>     #PF: supervisor read access in kernel mode
>     #PF: error_code(0x0000) - not-present page
>     PGD 18f1b067 P4D 18f1b067 PUD 3e8f067 PMD 3e90067 PTE 0
>     Oops: Oops: 0000 [#1] SMP NOPTI
>     CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.=
18.62-1.qubes.28.fc41.x86_64 #1 PREEMPT(full)
>     Tainted: [W]=3DWARN
>     RIP: e030:ioread32+0x32/0x60
>     Code: ff 03 00 77 25 48 81 ff 00 00 01 00 76 08 89 fa ed e9 72 04 8c =
00 8b 05 cc 62 88 01 85 c0 75 11 b8 ff ff ff ff e9 5e 04 8c 00 <8b> 07 e9 5=
7 04 8c 00 83 e8 01 48 89 fe 48 c7 c2 67 db 14 82 48 c7
>     RSP: e02b:ffffc9004000be00 EFLAGS: 00010292
>     RAX: 43fa5d3f578e48f3 RBX: 928a59081d78a1d7 RCX: 00000000fed803c3
>     RDX: 00000000039fffff RSI: 00000000fed803c0 RDI: ffffc9004002d3c0
>     RBP: ffffc9004000be38 R08: 0000000000000000 R09: 00000000000fed80
>     R10: 00000000000fed80 R11: 0720072007200720 R12: ffff888005118800
>     R13: ffffc9004002d3c0 R14: 000000000000017a R15: ffffffff832a78cc
>     FS:  0000000000000000(0000) GS:ffff888094f59000(0000) knlGS:000000000=
0000000
>     CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: ffffc9004002d3c0 CR3: 000000000242c000 CR4: 0000000000050660
>     Call Trace:
>      <TASK>
>      print_s5_reset_status_mmio+0x75/0x1c0
>      ? __pfx_print_s5_reset_status_mmio+0x10/0x10
>      do_one_initcall+0x5a/0x310
>      do_initcalls+0x1ef/0x240
>      kernel_init_freeable+0x18a/0x210
>      ? __pfx_kernel_init+0x10/0x10
>      kernel_init+0x1a/0x140
>      ret_from_fork+0x158/0x170
>      ? __pfx_kernel_init+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
>     Modules linked in:
>     CR2: ffffc9004002d3c0
>=20
> Fix this by skipping the read when running in a VM, except Xen dom0
> (which technically is a VM, but does have full access to the hardware).
>=20

I forgot about:
Fixes: ab8131028710 "x86/CPU/AMD: Print the reason for the last reset"

> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
>  arch/x86/kernel/cpu/amd.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> index 15286b71e9bf..fe3fe545608e 100644
> --- a/arch/x86/kernel/cpu/amd.c
> +++ b/arch/x86/kernel/cpu/amd.c
> @@ -26,6 +26,7 @@
>  #include <asm/resctrl.h>
>  #include <asm/msr.h>
>  #include <asm/sev.h>
> +#include <xen/xen.h>
> =20
>  #ifdef CONFIG_X86_64
>  # include <asm/mmconfig.h>
> @@ -1370,6 +1371,10 @@ static __init int print_s5_reset_status_mmio(void)
>  	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>  		return 0;
> =20
> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR) &&
> +	    !xen_initial_domain())
> +		return 0;
> +
>  	addr =3D ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
>  	if (!addr)
>  		return 0;
> --=20
> 2.56.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--R+rzyDkPwqgN2Waf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmr6YCUACgkQ24/THMrX
1yzpawf/Uge3e3qHSEXWvgB3rJohv4p8sj+UikzjyvjDNg3mC1tXVB7/KrkqPR2S
JTYGrsXiADq3B6+7MrRNYG/iRuIoROGp6du2Gar0YmHXCeJqFU+MjqNh3V168uwz
5JkBbbSdalSSWykfew+PYPdb8Z08eTDlVFlZiJoCGKStI3p4bex+h9LdDBHWTPDg
cyUVQtFBNpr333MO4NuJInJdLYo/3ak4MTb3B2awTi+TjzYedLlP83Q8vHRLsyK9
u2gm7mrDgcEjEAoiQN8/zY2otwkhltDHPqZvoFfGnrgJlrz5hyMM8tNAc//yaw+G
K6bHZ8KXi+jvl+jfLuDdJLEP4tZ2Jw==
=Z53i
-----END PGP SIGNATURE-----

--R+rzyDkPwqgN2Waf--
