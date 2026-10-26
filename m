Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793040753;
	b=gWVaonlUMqbzczMYAI+Jf+uJmbHcBKmp1fVwgv4EDwH3rqCkFIbm4IHCCqzLMsnEtK+W
	 7eipP1vS0wZxVyHC4XczqouYNDP7KGZY1n34ER+uvhp4gL3OPgh0Q3FS1PybxCK+uhHq0
	 HKTgg0qcibB+VCj3Quv21NKK25wzcVmO0uCLOsmaytQw/aLFFtlkXCG7llWp41+sHk9MV
	 dgF/N2yS5vRTfKXfVB5fHd2feCP0z3R3MfCoGbsv3qrPU9OYAxNxKfTKNAlp41ZuWmz8l
	 buwCr/tBHHqkiL1PUHiv675Q9+abCkWMBdrG1swWdTj9yU7ANqBW86CmX2c2DlkoIlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Uc21FeX9ZqBesmDzXUl4Rt+cHhRkHCCJkS37RvmQiP8=;
	b=toRMYrGdvMd6TIegGMHEbIvOsOm+yPskqXyIja4BJAsOTD0KHbqXGvjgf4mC/xNooYJd
	 tJN/3pBSKiCLWpHt7QahyEnqbiUmuf1z78a5U2xRzemZWfBcjZ/ZAbw+PEFxGnuwjAuRQ
	 pg66vWo/SWEUYzapBYq2NoGxWGZ0DW/HC8Zs7Ypef/UUvsnX7CPVmwlozyLPqNESjNV53
	 Epi+Vmd5cQ4BMg+Qpf1opbDT7ll8sFJTWSlUpbwkw1vOMYy1Cm585wmcEK0CV3NE11bFm
	 8yjGFJYZdqQF/giGIa79/8JnAI+qnVtjD3TS3mSYPsLO1Ju9buY+7tM8Mp5LOCGgUjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ec3QAQ1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ec3QAQ1P
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e608cd460eso21445035ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793040752; cv=none;
        d=google.com; s=arc-20260327;
        b=ItF/GpupRkmPj5RsvseEB/xr3DjXIZx0AchgoF1hq9SVlJ14Dip1lqTDYJTl4389qT
         nrmFfb9nCP3NQArmKwbNjwS2dtQXLpXF/JuQ4dn7RHnAPG7vA7bkLP2EQTAtiY5S5dWZ
         rVsOU7VMkEAAGBAoVe2WJmwaE/otdrfykCV6+yh33fnMpy8q5BETDOKCYbO8ET2QDQtv
         1EALxlIU84KFdyV5+zmhM0PMbhA/myUteWWzhoLvyTWkz0+EtnJCowkEmMDmXGR3O4Om
         yXXDRfEWoRhizXRRlq+xaXSkyhaCEtSeqygj/NAhwpkgDCzexW3CIdz56muqqsfzg/Yw
         6kLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uc21FeX9ZqBesmDzXUl4Rt+cHhRkHCCJkS37RvmQiP8=;
        fh=14ivvF94EsxgPSjpT456S78UY+v6TU1SM/UyUH60Kfo=;
        b=a7tvUMKlJsAd4O8XcIXv+EME7O3sROGO8OSkwOR/AeoXgLPPTLEP7Kp/O2c0cGU2yx
         zUc6TN+oCHD9ylvz3mFDuKejbksJCLjsv1MICqePzlZB9x1UvKytt3lrxKwbYYk/ILyJ
         gmLvPZHTUdtmDnfVn/DLa66TMEFjr0FZ+bw3RIhWsHejONj37OJ3YhyWB8LtayTJxvQZ
         3+1r1HonsN1ua3m3q75H3Pyns9ajJeSSiyaS5pDxMtZdtPaCaz/RS7FRhMwpXSLGjLar
         mzmputPtJ5EhRkoe5LTcHdoRalwCnSlS0A8T3u4ueHe4oAc1vPgFMdWfx/tAGaoJhQv7
         8AhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793040752; x=1793645552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uc21FeX9ZqBesmDzXUl4Rt+cHhRkHCCJkS37RvmQiP8=;
        b=ec3QAQ1PtPrAFLDbaViU82ICbrCK79DS15yWl8q4FB6Jk56EctfritFF4phKpbS26y
         swl4L+T3b5GxN92cW22qkWLfHjaYr/goT5QtflszBuTG5GmM7Y2JJRlJLMeGpvLTLzKU
         MH1xpvz6ZxjhqppNhzzFCuOYna9N0/0Na4FR9FB69Gj3XPcgqteBKM5ZeEm2LJ9BYj1p
         TmoNfuz0TO3Xzbip0+WAP16ZRoVAE0k9g9BD14se8p6O1Em1R6lToa6gAI/0FUbRWwR9
         TB5Ivrjcd2TEsbSPbiHhO0a/SlgU1QUkwpyJTts8BcdoyabJliJSepsY4DKo7YWJHcGb
         Z3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040752; x=1793645552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uc21FeX9ZqBesmDzXUl4Rt+cHhRkHCCJkS37RvmQiP8=;
        b=G7OHhNdHkb35+GXuE6WnytvSFQmC0XXaED2UaePbxHhIcDYEcrXLGu6o+LJh6Tua7W
         b9e6Tsngu25T2Gx1LgSqb8ITB19c5HEj0W8eYNIeEl3F6hMlt8oBxF585xiR7qN+0oJI
         w1MeHFswvRMu2XHjiGOWV3IT/TBB+UglnlrpvKwA+kUe/VR5MZ6/aRBYbDT6ee+Oax6K
         JZ54hXq23Qlk/C3Jinc1IwWuq/UaGLRoAV7Y64Th5xh5KrkIZ4qTrCGxhCKUAJfZxW/Q
         PPbgRdJ56+VMD8ew+6IuQd4xeqB2LKjmXuyzFUVBa9Q34yK5Mbr/hx6U9dkiFwOp+Gwy
         3vSg==
X-Forwarded-Encrypted: i=1; AKwUvBx2zyH7rWmW5lGtA52lgK+Sc8wSZlcCAQsQ2dgkTlSSTLDwwZnBx+Sg2+g/Dbw4NorXYfUZIuCD41Zxdlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV/+2x6sH/0Ys4PFs4fHQ6KJTxfPVMBkH3A5oxtWFQqF1ovIyn
	A01D77PdS5/U7pw2GD62VG0y3j32W1khaLOpkC4AAK7OCwdyWyqyWWq2lgpXC3Zt1jbMsr2XY03
	eSrHhoLjYOPIa0w+y64esu+yc9EoXNpmN3OnzgYI=
X-Gm-Gg: AYBFou05QXTZA5e+Lc3ejwVWsod+P20hzsYQavHaxYLsDOGMJ6b6BP0BBgsT7sHlhxD
	f1w/BikxCQdVHovjXMBoCdXBd+T8B9X0P0LVBFGEWBtMdt/38TYKIkxxP1gUZfadusKti15iErC
	v7xX005ce7fwedjxPCOYoFS99C4RN7Z3IUuTWtc1BK3yoB0gxkfMb2dCIClucRW5ErPTEhn7sZt
	8n9hOrrCfXPybhU51VgU+EwG7fA9r4InlWqjPotrBkCQKDLGR0YbPP65hnqw0QgM6as2PoCCHRo
	1r1/CZHgme8Lf6n9Eb5IuArkDW6cV5fd1nFWLUZLG/u7Rb+w5MVbkOiNcNq1aKKmUiN3ocIjG2i
	TxH1qUx7Yie8YYXvQaqpDrpX6B4gRZ2AjbewcYDaSKK4BplIvylFYeGjQMxKXHSO53vrzugjR6I
	Z5YZ6gLnanTMw=
X-Received: by 2002:a17:903:8cc:b0:2e8:f4f:ad04 with SMTP id
 d9443c01a7336-2ea9c5e46eemr62515315ad.12.1793040752191; Mon, 26 Oct 2026
 11:52:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <X-TH#1.20261018222723.43442-1-jengelh@inai.de>
In-Reply-To: <X-TH#1.20261018222723.43442-1-jengelh@inai.de>
From: Tony Rodriguez <unixpro1970@gmail.com>
Date: Mon, 26 Oct 2026 11:52:22 -0700
X-Gm-Features: AclHuK88TVGjuWHanqq9-0CUjSeW2-s8KPRecYqkZ8hv434aCI_euUScKqgqCoA
Message-ID: <CANmkgULrJwKSuwQhZjgL0-zWgMYWgOZLhseDXGtp_XwjcAayow@mail.gmail.com>
Subject: Re: [PATCH] sparc: populate sysfs cache topology information on sun4v
To: Jan Engelhardt <jengelh@inai.de>
Cc: davem@davemloft.net, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stian Halseth <stian@itx.no>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Tony Rodriguez <unixpro1970@gmail.com>

Tested on both SPARC T7-1 and S7-2 systems; the lscpu output is correct on =
both.

A) T7-1:
A1) lscpu
Architecture:          sparc64
  CPU op-mode(s):      32-bit, 64-bit
  Byte Order:          Big Endian
CPU(s):                256
  On-line CPU(s) list: 0-255
Model name:            SPARC-M7
  Thread(s) per core:  8
  Core(s) per socket:  32
  Socket(s):           1
  Flags:               sun4v
Caches (sum of all):
  L1d:                 512 KiB (32 instances)
  L1i:                 512 KiB (32 instances)
  L2d:                 4 MiB (16 instances)
  L2i:                 2 MiB (8 instances)
  L3:                  64 MiB (8 instances)
NUMA:
  NUMA node(s):        1
  NUMA node0 CPU(s):   0-255

A2) lscpu --cache
NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL  SETS PHY-LINE COHERENCY-SIZE
L1d       16K     512K    4 Data            1   128       32
L1i       16K     512K    4 Instruction     1    64       64
L2d      256K       4M    8 Data            2   512       64
L2i      256K       2M    8 Instruction     2   512       64
L3         8M      64M    8 Unified         3 16384       64

B) S7-2:
B1) lscpu
Architecture:          sparc64
  CPU op-mode(s):      32-bit, 64-bit
  Byte Order:          Big Endian
CPU(s):                128
  On-line CPU(s) list: 0-127
Model name:            SPARC-S7 (Sonoma)
  Thread(s) per core:  8
  Core(s) per socket:  8
  Socket(s):           2
  Flags:               sun4v
Caches (sum of all):
  L1d:                 256 KiB (16 instances)
  L1i:                 256 KiB (16 instances)
  L2d:                 2 MiB (8 instances)
  L2i:                 1 MiB (4 instances)
  L3:                  32 MiB (4 instances)
NUMA:
  NUMA node(s):        2
  NUMA node0 CPU(s):   0-63
  NUMA node1 CPU(s):   64-127

B2) lscpu --cache
NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL  SETS PHY-LINE COHERENCY-SIZE
L1d       16K     256K    4 Data            1   128       32
L1i       16K     256K    4 Instruction     1    64       64
L2d      256K       2M    8 Data            2   512       64
L2i      256K       1M    8 Instruction     2   512       64
L3         8M      32M    8 Unified         3 16384       64


On Mon, Oct 26, 2026 at 11:42=E2=80=AFAM Jan Engelhardt <jengelh@inai.de> w=
rote:
>
> The SPARC port does not publish any cache topology information. The
> lscpu utility therefore falls back to assuming the published cache
> sizes are for unshared caches, and as a result, reports way more
> cache than there really is present in the system. On a T5240 machine:
>
> ```
> $ lscpu
> Architecture:          sparc64
>   CPU op-mode(s):      32-bit, 64-bit
>   Byte Order:          Big Endian
> CPU(s):                128
>   On-line CPU(s) list: 0-127
> Model name:            UltraSparc T2 (Niagara2)
>   Thread(s) per core:  4
>   Core(s) per socket:  16
>   Socket(s):           2
>   Flags:               sun4v
> Caches (sum of all):
>   L1d:                 1 MiB (128 instances)
>   L1i:                 2 MiB (128 instances)
>   L2:                  512 MiB (128 instances)
> ```
>
> This patch implements population of the sysfs cacheinfo structures
> for sun4v (systems with mdesc). The proper amount is now reflected in
> lscpu's output:
>
> ```
> Caches (sum of all):
>   L1d:                 128 KiB (16 instances)
>   L1i:                 256 KiB (16 instances)
>   L2:                  8 MiB (2 instances)
> ```
>
> Signed-off-by: Jan Engelhardt <jengelh@inai.de>
> ---
>  arch/sparc/include/asm/cpudata_64.h |  8 +++-
>  arch/sparc/kernel/mdesc.c           | 61 +++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
>
> diff --git a/arch/sparc/include/asm/cpudata_64.h b/arch/sparc/include/asm=
/cpudata_64.h
> index 056b3c0e7ef9..e28b841ffe23 100644
> --- a/arch/sparc/include/asm/cpudata_64.h
> +++ b/arch/sparc/include/asm/cpudata_64.h
> @@ -18,13 +18,19 @@ typedef struct {
>         unsigned int    irq0_irqs;
>         unsigned int    __pad2;
>
> -       /* Dcache line 2, rarely used */
> +       /* Dcache line 2+3, rarely used */
>         unsigned int    dcache_size;
>         unsigned int    dcache_line_size;
> +       unsigned int    dcache_assoc;
> +       unsigned int    dcache_id;
>         unsigned int    icache_size;
>         unsigned int    icache_line_size;
> +       unsigned int    icache_assoc;
> +       unsigned int    icache_id;
>         unsigned int    ecache_size;
>         unsigned int    ecache_line_size;
> +       unsigned int    ecache_assoc;
> +       unsigned int    ecache_id;
>         unsigned short  sock_id;        /* physical package */
>         unsigned short  core_id;
>         unsigned short  max_cache_id;   /* groupings of highest shared ca=
che */
> diff --git a/arch/sparc/kernel/mdesc.c b/arch/sparc/kernel/mdesc.c
> index 23b51a32e96e..029d9d812074 100644
> --- a/arch/sparc/kernel/mdesc.c
> +++ b/arch/sparc/kernel/mdesc.c
> @@ -818,6 +818,7 @@ static void fill_in_one_cache(cpuinfo_sparc *c, struc=
t mdesc_handle *hp, u64 mp)
>         const u64 *level =3D mdesc_get_property(hp, mp, "level", NULL);
>         const u64 *size =3D mdesc_get_property(hp, mp, "size", NULL);
>         const u64 *line_size =3D mdesc_get_property(hp, mp, "line-size", =
NULL);
> +       const u64 *assoc =3D mdesc_get_property(hp, mp, "associativity", =
NULL);
>         const char *type;
>         int type_len;
>
> @@ -828,15 +829,21 @@ static void fill_in_one_cache(cpuinfo_sparc *c, str=
uct mdesc_handle *hp, u64 mp)
>                 if (of_find_in_proplist(type, "instn", type_len)) {
>                         c->icache_size =3D *size;
>                         c->icache_line_size =3D *line_size;
> +                       c->icache_assoc =3D assoc ? *assoc : 0;
> +                       c->icache_id =3D mp;
>                 } else if (of_find_in_proplist(type, "data", type_len)) {
>                         c->dcache_size =3D *size;
>                         c->dcache_line_size =3D *line_size;
> +                       c->dcache_assoc =3D assoc ? *assoc : 0;
> +                       c->dcache_id =3D mp;
>                 }
>                 break;
>
>         case 2:
>                 c->ecache_size =3D *size;
>                 c->ecache_line_size =3D *line_size;
> +               c->ecache_assoc =3D assoc ? *assoc : 0;
> +               c->ecache_id =3D mp;
>                 break;
>
>         default:
> @@ -1251,6 +1258,60 @@ void mdesc_fill_in_cpu_data(cpumask_t *mask)
>         smp_fill_in_sib_core_maps();
>  }
>
> +int init_cache_level(unsigned int cpu)
> +{
> +       struct cpu_cacheinfo *i =3D get_cpu_cacheinfo(cpu);
> +       i->num_levels =3D 2;
> +       i->num_leaves =3D 3;
> +       return 0;
> +}
> +
> +int populate_cache_leaves(unsigned int cpu)
> +{
> +       struct cacheinfo *leaf =3D get_cpu_cacheinfo(cpu)->info_list;
> +       cpuinfo_sparc *cs =3D &cpu_data(cpu);
> +
> +       leaf->id                    =3D cs->icache_id;
> +       leaf->attributes            =3D CACHE_ID;
> +       leaf->level                 =3D 1;
> +       leaf->type                  =3D CACHE_TYPE_INST;
> +       leaf->coherency_line_size   =3D cs->icache_line_size;
> +       leaf->ways_of_associativity =3D cs->icache_assoc;
> +       leaf->size                  =3D cs->icache_size;
> +       leaf->priv                  =3D cs;
> +       if (cs->icache_line_size > 0 && cs->icache_assoc > 0)
> +               leaf->number_of_sets =3D cs->icache_size / cs->icache_lin=
e_size /
> +                                      cs->icache_assoc;
> +       ++leaf;
> +
> +       leaf->id                    =3D cs->dcache_id;
> +       leaf->attributes            =3D CACHE_ID;
> +       leaf->level                 =3D 1;
> +       leaf->type                  =3D CACHE_TYPE_DATA;
> +       leaf->coherency_line_size   =3D cs->dcache_line_size;
> +       leaf->ways_of_associativity =3D cs->dcache_assoc;
> +       leaf->size                  =3D cs->dcache_size;
> +       leaf->priv                  =3D cs;
> +       if (cs->dcache_line_size > 0 && cs->dcache_assoc > 0)
> +               leaf->number_of_sets =3D cs->dcache_size / cs->dcache_lin=
e_size /
> +                                      cs->dcache_assoc;
> +       ++leaf;
> +
> +       leaf->id                    =3D cs->ecache_id;
> +       leaf->attributes            =3D CACHE_ID;
> +       leaf->level                 =3D 2;
> +       leaf->type                  =3D CACHE_TYPE_UNIFIED;
> +       leaf->coherency_line_size   =3D cs->ecache_line_size;
> +       leaf->ways_of_associativity =3D cs->ecache_assoc;
> +       leaf->size                  =3D cs->ecache_size;
> +       leaf->priv                  =3D cs;
> +       if (cs->ecache_line_size > 0 && cs->ecache_assoc > 0)
> +               leaf->number_of_sets =3D cs->ecache_size / cs->ecache_lin=
e_size /
> +                                      cs->ecache_assoc;
> +
> +       return 0;
> +}
> +
>  /* mdesc_open() - Grab a reference to mdesc_handle when /dev/mdesc is
>   * opened. Hold this reference until /dev/mdesc is closed to ensure
>   * mdesc data structure is not released underneath us. Store the
> --
> 2.56.0
>
>
