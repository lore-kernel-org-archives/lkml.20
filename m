Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06533030F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790475328; cv=none; b=FeObaF0A9eTStzJYcEdeVcdIfHYHi/L3+IXQToToKYCO5UPggp/apWCSA6MnoNG4FGOFCisL8Wi46RD58OtUx+9KThqZ13fOGidDsGL/sihKh0ZTa/F/3S1UVhWjcCbKjOz6JpKCs1v2ly2nAre33GP25LldU1LHy27R7zKSpic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790475328; c=relaxed/simple;
	bh=1TqcNzihamCzIKkgqFL5yhacEz1Pe3q8TEk+dS7wIB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjPlwtT7+sibWhtKxG2VskyjvHdwhvdFkIbZQGWo79+HHq+oIBqxF26mj72zJQS6ueqrM1imieErXzpn5p23MRYSVd3eRBsy60vqp6+RuRHPK4orFMQ10ebEZg7OSxuZngjOsjnxNGqxSSgMf4sptzH7KM2JBqo/F1YDRqbsF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOKzt/JP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOKzt/JP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D45B1F000FF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790475325;
	bh=O664zFz0JEjkMvJ5y4wsHFWGuPuvL4lla3LtnBqOgwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XOKzt/JPz9GbCzba9SpRgavTgwT/wENLQUWINncBdu+u6/TtlXFakSWe6VWgqNYYS
	 gd9YymA2vIzavnNdIM/5zs9p5x3qCI6H12i6H7kh15fDYVYAfPzu5ANjnGTVWIw0cN
	 0BVtyZo8AC4e7E/TDiBF7kUd7nSl7OQe/SOh3bHT0S2Ll1lm6yaDsP2b7o6KJlWafW
	 8ToVNUXbfPMAf16m4TCLhi0xky72oQR2Q4zMoi0Z+flzciUArpxwfbULbbRoUi6l/0
	 5bVnoBRLfvwAQKfySjDCboc7VzBSTHhnwkBhon2l11Vo1EIFWrhh58qm5ioSDvU888
	 AS3w6Zmeqjfcw==
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877902c99so1816923f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFI87A3s0zL0emK1kgk5VmXX7DhAHf4Tbc6kZd8Le1+dDemx7+kc+KgOE5avjQUES8XRWTzweJaAMsgCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMzRG6dr8vnETAVPbmOf+SrTq92XY236HDAslNzqcsntdWPErl
	ah9sjVoLyp2wvRNahR5aG7XVWqzUqPHO7KJkxJrDoeysdXCZ+pKM3sqLUJrz9HHUOYjvUENeDhr
	Cx167JfrU3C8zlt1HqVfWN6MufDt02Yw=
X-Received: by 2002:a05:6000:4808:b0:488:8568:bb02 with SMTP id
 ffacd0b85a97d-4888568bd1dmr6200290f8f.23.1790475324198; Sat, 26 Sep 2026
 19:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925115128.362186-1-elver@google.com>
In-Reply-To: <20260925115128.362186-1-elver@google.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 27 Sep 2026 10:15:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRr2pouJoj=NtofkCW1OgU08Jqoh2B8Guu=FheJMzEGyg@mail.gmail.com>
X-Gm-Features: AclHuK-zb0cQz4v0ljhPr4_-ItgQMT7BFiotF8YL8ggEhscXRlvydmuZ9NPvu_Y
Message-ID: <CAJF2gTRr2pouJoj=NtofkCW1OgU08Jqoh2B8Guu=FheJMzEGyg@mail.gmail.com>
Subject: Re: [PATCH] csky: Implement _THIS_IP_ using inline asm
To: Marco Elver <elver@google.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 7:51=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
> be broken:
>
>         #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&=
__here; })
>
> In particular, the address of a label is only expected to be used with a
> computed goto.
>
> While the generic version more or less works today, it is known to be
> brittle and may break with current and future optimizations. For
> example, Clang -O2 always returns 1 when this function is inlined:
>
>         static inline unsigned long get_ip(void)
>         { return ({ __label__ __here; __here: (unsigned long)&&__here; })=
; }
>
> Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
> <linux/instruction_pointer.h>) using an architecture-specific inline asm
> version.
>
> This also fixes this GCC ICE [3]:
>
> sound/core/oss/mixer_oss.c: In function 'snd_mixer_oss_proc_write':
> sound/core/oss/mixer_oss.c:1202:1: error: could not split insn
>  1202 | }
>       | ^
> (insn 183 400 184 (set (reg:SI 0 a0 [orig:307 _55 ] [307])
>         (xor:SI (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [308])
>             (const:SI (plus:SI (symbol_ref:SI ("*.LANCHOR0") [flags 0x182=
])
>                     (const_int 132 [0x84]))))) "include/linux/slab.h":759=
:52 288 {cskyv2_xorsi3}
>      (expr_list:REG_DEAD (reg:SI 3 a3 [orig:308 random_kmalloc_seed ] [30=
8])
>         (nil)))
> during RTL pass: final
> sound/core/oss/mixer_oss.c:1202:1: internal compiler error: in final_scan=
_insn_1, at final.cc:2813
> 0x779b51e2a1c9 __libc_start_call_main
>         ../sysdeps/nptl/libc_start_call_main.h:58
> 0x779b51e2a28a __libc_start_main_impl
>         ../csu/libc-start.c:360
>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120071 [1]
> Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> Link: https://lore.kernel.org/all/6106aefa-47c7-4bda-a51f-8a2fba3bf715@ro=
eck-us.net/ [3]
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/csky/include/asm/linkage.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 arch/csky/include/asm/linkage.h
>
> diff --git a/arch/csky/include/asm/linkage.h b/arch/csky/include/asm/link=
age.h
> new file mode 100644
> index 000000000000..04afd3583e25
> --- /dev/null
> +++ b/arch/csky/include/asm/linkage.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_CSKY_LINKAGE_H
> +#define __ASM_CSKY_LINKAGE_H
> +
> +#define _THIS_IP_ ({ unsigned long __ip; asm volatile("grs %0, ." : "=3D=
r" (__ip)); __ip; })

Yes, this is the right fix.

csky has always used the generic label-address _THIS_IP_.  That is
brittle, and on csky the compiler now crashes when that address is
folded into an immediate.  `grs rz, .` materializes the current
instruction address, so it is the correct replacement.

Acked-by: GUO Ren (XuanTie) <guoren@kernel.org>


> +
> +#endif /* __ASM_CSKY_LINKAGE_H */
> --
> 2.56.0.rc1.315.gc6ed9934b7-goog
>


--=20
Best Regards
 Guo Ren
