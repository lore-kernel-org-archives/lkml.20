Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A82B3242D4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527936; cv=none; b=gDovH8mSAXhdF891JQELRmcog8FriNnEX6KGkhixgrDD0dNjUi2PgMH4N3r0sx/3bN/4zp5c0UetVaX+crVkDrPv/euECU4ax2ouCAGDMMKgAGjoQc832t2Z6Ho3Wye4/nzkwhC4CPmzty6OcXBm+dqi85je7B2yuZav1se8eZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527936; c=relaxed/simple;
	bh=GU0dMvnjJmVdWI8qp1aJzesV9/9n+dBn1E0agGdSHQg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PksxzUtjo0gMoP64GHNp6qytAkmZWfrUclQq8QhSRV7BVEi8W21KILtyJtBIsuQs35ra1jDJXPXqlT2t9AapG5cMCI7x9+hV0OOVTB8CoAkhsvpP1SpHm0NArmBfhdU5AhvGzQTREbPininRkANMu3COyxMVWkxOCiv2A6/22Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Ryu00BGP; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Ryu00BGP"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 684DI1oY4190959
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 4 Sep 2026 06:18:02 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 684DI1oY4190959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788527882;
	bh=HRf6PIJRq7582H8j+J/JkZbAl1bagz9/l8bMRF7hUf4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Ryu00BGPJHwNTIr47s6DRaaBKbRWV0KteRTVUOLxXwjZVzESVX1cHzAlBZJJs6VcQ
	 1o3GsObANzidJiP6s486Z46Phc/VvgeeRwv84v65qaptNPP+ErPJdJs7ct4W1sALuG
	 iDD0MWH3EgqLoQtPQj4wNWkFG/CyJS8cseT/cbSyKm+lqcFGF1EiNz42w2ljGK5loa
	 ZK8KEJOMwuCtrfJxJpfSyIvpao8DwtEtQ6NRtgjVTHBXG39aKGjuyG8KFwZIy9lmkB
	 KT7IRSHpdpk24F7O7ZXvKvxXiZWXcCOjO1ged+pGSC9unsWGdmMyEqR7z5q3bQhLuy
	 HiswVxiL17J3w==
Date: Fri, 04 Sep 2026 06:17:56 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_x86/boot=3A_Disable_G?=
 =?US-ASCII?Q?CC_min-pagesize_assumption_in_boot_code?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260904082741.578048-2-ubizjak@gmail.com>
References: <20260904082741.578048-1-ubizjak@gmail.com> <20260904082741.578048-2-ubizjak@gmail.com>
Message-ID: <D7BA2D11-A6C7-4B1D-AD59-BAF85AC7BB58@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 4, 2026 1:25:22 AM PDT, Uros Bizjak <ubizjak@gmail=2Ecom> wrot=
e:
>GCC treats absolute addresses smaller than the min-pagesize param
>(which defaults to 4kB) in the generic address space as presumed
>results of pointer arithmetics from NULL=2E For example, the following
>code, when compiled with -O2 -Warray-bounds (included in -Wall):
>
>  int foo (void) { return *(int *)0x123; }
>
>will emit a rather cryptic warning:
>
>warning: array subscript 0 is outside array bounds of =E2=80=98int[0]=E2=
=80=99 [-Warray-bounds=3D]
>    1 | int foo (void) { return *(int *)0x123; }
>      |                         ^~~~~~~~~~~~~
>cc1: note: source object is likely at address zero
>
>Currently, the warning is supressed by the GCC specific RELOC_HIDE()
>macro that obfuscates arithmetic on a variable address so that GCC
>doesn't recognize the original var, and make assumptions about it=2E
>
>The GCC specific RELOC_HIDE() macro was introduced to work around
>certain ppc64 specific compiler bug in pre-4=2E1 GCC=2E This bug was
>fixed long ago, and replacing GCC specific macro with a generic one
>triggers the above warning in boot and realmode source code=2E
>
>The early boot environment does not guarantee any minimum page size,
>so explicitly setting the minimum page size to zero by adding
>--param=3Dmin-pagesize=3D0 to the compiler flags when building x86 boot
>and realmode code with GCC inhibits warnings for addresses below 4kB=2E
>
>The option is guarded by CONFIG_CC_IS_GCC since it is GCC-specific=2E
>
>Signed-off-by: Uros Bizjak <ubizjak@gmail=2Ecom>
>Cc: Thomas Gleixner <tglx@linutronix=2Ede>
>Cc: Ingo Molnar <mingo@kernel=2Eorg>
>Cc: Borislav Petkov <bp@alien8=2Ede>
>Cc: Dave Hansen <dave=2Ehansen@linux=2Eintel=2Ecom>
>Cc: "H=2E Peter Anvin" <hpa@zytor=2Ecom>
>---
> arch/x86/boot/Makefile        | 3 +++
> arch/x86/realmode/rm/Makefile | 3 +++
> 2 files changed, 6 insertions(+)
>
>diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
>index 3f9fb3698d66=2E=2E372e67d2a855 100644
>--- a/arch/x86/boot/Makefile
>+++ b/arch/x86/boot/Makefile
>@@ -55,6 +55,9 @@ KBUILD_CFLAGS	:=3D $(REALMODE_CFLAGS) -D_SETUP
> KBUILD_AFLAGS	:=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
> KBUILD_CFLAGS	+=3D -fno-asynchronous-unwind-tables
> KBUILD_CFLAGS	+=3D $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
>+ifdef CONFIG_CC_IS_GCC
>+KBUILD_CFLAGS	+=3D $(call cc-option,--param=3Dmin-pagesize=3D0)
>+endif
>=20
> $(obj)/bzImage: asflags-y  :=3D $(SVGA_MODE)
>=20
>diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefil=
e
>index a0fb39abc5c8=2E=2E75058f4dd7c1 100644
>--- a/arch/x86/realmode/rm/Makefile
>+++ b/arch/x86/realmode/rm/Makefile
>@@ -67,3 +67,6 @@ KBUILD_CFLAGS	:=3D $(REALMODE_CFLAGS) -D_SETUP -D_WAKEU=
P \
> 		   -I$(srctree)/arch/x86/boot
> KBUILD_AFLAGS	:=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
> KBUILD_CFLAGS	+=3D -fno-asynchronous-unwind-tables
>+ifdef CONFIG_CC_IS_GCC
>+KBUILD_CFLAGS	+=3D $(call cc-option,--param=3Dmin-pagesize=3D0)
>+endif

That seems like a much better answer than that horrible hack=2E=20

Acked-by: H=2E Peter Anvin <hpa@zytor=2Ecom>
