Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D53B9D9F;
	Mon,  7 Sep 2026 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813807; cv=none; b=Rj5x6+HvjmNZqbV6BUGSs6fJDAQbRye2BW9iefCWtHohN6M701D1th9/1rdrX9qy3WPZprdeqrgZt8iaPWfHEoe8tqgKgz0n2VLcfo0IdkhNbg9O3MP1WWJ9UNM9temxiEARDRCuhbBe1TmJMjD089/3eahMolON2SzW5dAL4oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813807; c=relaxed/simple;
	bh=d0v4wNumbM5Ev4mGoIlgdFtY2GZTSZfY7kiIrh1sC3Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TREEQdnv6SfMPXr6FQrDhgunmCpVb5wvf8BdfwhIqf+CjaQ9+LjBy5Vvdb9V0e2hvNGSFdbLj6VsIEqJB3r2dh11+gdjedJojUueF1S1k/ZhvQ1QyL15lo26mogrjVSBpNP0Ipue9rqnlUR9MZZIuecgoHIwEbXFs358571j8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=LQHU/RfW; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="LQHU/RfW"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 687KgbTG3740479
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 7 Sep 2026 13:42:39 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 687KgbTG3740479
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788813759;
	bh=IQjdC0iJD4PoHDRwS4Fs/NW13yCN/BJoVyqNcrQ5h7M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LQHU/RfWvWQq0t6ryw/KGen1yrxyCUsM8PKPrJiO9DMgcYju6Q9wQJpVaANIJmS+2
	 knxTquj+21oudNnbrK7mYm2KuUFDnnBAzFwyYOqNZqPlkCtDeFuocHMQ0xWMNKP8B+
	 LY7tRhOzegzwXjFtvp7vY9BkTVej78i9QQIiupdzl5/zhCMWg/xL688HikF0UxX+z6
	 4zMLX8kwKO4jAt9W0iOMIji0VsdG7bjyFlGhA2dBGVU0KOuf7Ox2VfM9axnQx2vhl7
	 2KXHsC9xIazxUvl1SCeCr4zpyV4iQ+RBuKCi7Unq/k9/eKsMYaR3gqhwYyynk5cMcN
	 HiEoyonFvBwrg==
Date: Mon, 07 Sep 2026 13:42:32 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Hemanth Selam <hemanth.selam@gmail.com>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Tony Luck <tony.luck@intel.com>
CC: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH 13/14] x86: fix repeated words in comments
User-Agent: K-9 Mail for Android
In-Reply-To: <20260907065816.27878-1-hemanth.selam@gmail.com>
References: <20260907065816.27878-1-hemanth.selam@gmail.com>
Message-ID: <F3B12E57-8FD9-4B68-8565-F643AFE0CEFE@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 6, 2026 11:58:16 PM PDT, Hemanth Selam <hemanth=2Eselam@gmail=
=2Ecom> wrote:
>Drop words accidentally written twice, reported by checkpatch=2Epl as a
>possible repeated word=2E  Only touches comments, no code changes=2E
>
>Assisted-by: Cursor:claude-opus-5
>Signed-off-by: Hemanth Selam <hemanth=2Eselam@gmail=2Ecom>
>---
> arch/x86/entry/entry_64_compat=2ES     | 2 +-
> arch/x86/kernel/cpu/mce/severity=2Ec   | 2 +-
> arch/x86/mm/pgtable=2Ec                | 4 ++--
> arch/x86/realmode/rm/trampoline_64=2ES | 2 +-
> 4 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/arch/x86/entry/entry_64_compat=2ES b/arch/x86/entry/entry_64=
_compat=2ES
>index a45e1125fc6c=2E=2Ee0cda8bfee77 100644
>--- a/arch/x86/entry/entry_64_compat=2ES
>+++ b/arch/x86/entry/entry_64_compat=2ES
>@@ -266,7 +266,7 @@ SYM_INNER_LABEL(entry_SYSRETL_compat_unsafe_stack, SY=
M_L_GLOBAL)
> 	 * The original userspace %rsp (RSP-ORIG_RAX(%rsp)) is stored
> 	 * on the process stack which is not mapped to userspace and
> 	 * not readable after we SWITCH_TO_USER_CR3=2E  Delay the CR3
>-	 * switch until after after the last reference to the process
>+	 * switch until after the last reference to the process
> 	 * stack=2E
> 	 *
> 	 * %r8/%r9 are zeroed before the sysret, thus safe to clobber=2E
>diff --git a/arch/x86/kernel/cpu/mce/severity=2Ec b/arch/x86/kernel/cpu/m=
ce/severity=2Ec
>index 2235a7477436=2E=2Eda4db3c709e2 100644
>--- a/arch/x86/kernel/cpu/mce/severity=2Ec
>+++ b/arch/x86/kernel/cpu/mce/severity=2Ec
>@@ -280,7 +280,7 @@ static bool is_copy_from_user(struct pt_regs *regs)
>  * check hit=2E
>  * If we do have a good "m->cs" (or a faked one in the
>  * case we were executing in VM86 mode) we can use it to
>- * distinguish an exception taken in user from from one
>+ * distinguish an exception taken in user from one
>  * taken in the kernel=2E
>  */
> static noinstr int error_context(struct mce *m, struct pt_regs *regs)
>diff --git a/arch/x86/mm/pgtable=2Ec b/arch/x86/mm/pgtable=2Ec
>index cb03f5a2b243=2E=2E0f127a40f2f2 100644
>--- a/arch/x86/mm/pgtable=2Ec
>+++ b/arch/x86/mm/pgtable=2Ec
>@@ -402,7 +402,7 @@ int pmdp_set_access_flags(struct vm_area_struct *vma,
> 		set_pmd(pmdp, entry);
> 		/*
> 		 * We had a write-protection fault here and changed the pmd
>-		 * to to more permissive=2E No need to flush the TLB for that,
>+		 * to more permissive=2E No need to flush the TLB for that,
> 		 * #PF is architecturally guaranteed to do that and in the
> 		 * worst-case we'll generate a spurious fault=2E
> 		 */
>@@ -422,7 +422,7 @@ int pudp_set_access_flags(struct vm_area_struct *vma,=
 unsigned long address,
> 		set_pud(pudp, entry);
> 		/*
> 		 * We had a write-protection fault here and changed the pud
>-		 * to to more permissive=2E No need to flush the TLB for that,
>+		 * to more permissive=2E No need to flush the TLB for that,
> 		 * #PF is architecturally guaranteed to do that and in the
> 		 * worst-case we'll generate a spurious fault=2E
> 		 */
>diff --git a/arch/x86/realmode/rm/trampoline_64=2ES b/arch/x86/realmode/r=
m/trampoline_64=2ES
>index 14d9c7daf90f=2E=2E213c5119d919 100644
>--- a/arch/x86/realmode/rm/trampoline_64=2ES
>+++ b/arch/x86/realmode/rm/trampoline_64=2ES
>@@ -148,7 +148,7 @@ SYM_CODE_START(startup_32)
>=20
> 	/*
> 	 * Memory encryption is enabled but the SME enable bit for this
>-	 * CPU has has not been set=2E  It is safe to set it, so do so=2E
>+	 * CPU has not been set=2E  It is safe to set it, so do so=2E
> 	 */
> 	wrmsr
> =2ELdone:

Acked-by: H=2E Peter Anvin <hpa@zytor=2Ecom>
