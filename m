Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6B34DBD63
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115257; cv=none; b=J2pVeboATWxEIVniLZcyH6/TD4qjho/jZFDdYVi6tkRqcMUW97pNMmfgPUNMRYz15Ijo1Bk5lViJYydAhe5DYscUeMRTP2j0hKhzoCPKuxQKmsCoMkU9YmYaCzbqpyrZgvqppKHecSW5IEcGiBxJuwPycu4b2t8b4syyJre6jAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115257; c=relaxed/simple;
	bh=WyydwY/U8atKCLyGB+LE/CS+4E8aJoROKnbv71RNPmA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=KNs62hJi+WHeRPDRg2urpII3zhJ+e3FgaQpRD664uAc6Fsmi4seVUuT4b4ZfOW/Bo4/e0xpD1a998MDz813IqXzGVpfBUIkb6NL1U5NuAW6al3RhliNexSmy3hSrkodmrZ/JARgVfOOKOmQYW9TgMxYW5DN5HtJ12hdRwJs4y98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=DtRscbna; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="DtRscbna"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=QrSu8YGOsu2E9jgIjM8USyvJdljVhVLowKN8872lW1E=; b=DtRscbnaZHf4PSBLM2a5VVIE+r
	ap7ZAz4U5sN/ScaRvrzsqpXlYbFfFlBfaJVzgGX9APtb3XHxiRuS6Ab4zpJ+ps1JO93pKQn3tsNS2
	9YDX0uh5LIo//Vb9bSlwrPPMIrx6EoPSKPIWctZSLYHuASjT0RIBhzEVAYIuP4rsDEzLNkEmoLfku
	paInSpSfda95+QQUSHTnU+uRbIZxlF2J1kLW321YhpPNUeMHo+7zvPUV7twbPpq3ScB3mvMWIPGWm
	wU5WxR0JebnjBOM08fiyiacE43HGRqwq61uL2yiHHJSGHpBTWOiOBAiKqYBinXUIytlmMZOy6At+k
	uwEEPSjA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x98k4-005qrI-QL; Wed, 23 Sep 2026 00:13:36 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x98k3-007Hg8-LC; Wed, 23 Sep 2026 00:13:36 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x98k3-00000003pWQ-2v5j;
	Wed, 23 Sep 2026 00:13:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 19:13:35 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
 <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
Message-ID: <3ed7ea3908233ef72660ddfa1f92e914@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-22 00:58, Borislav Petkov wrote:
> On Mon, Sep 21, 2026 at 10:36:31PM -0300, Mauricio Faria de Oliveira wrote:
>> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
>> 
>> Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
>> (but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.
>> 
>> The PVH code is required/supposed not to use the KASAN memory access check
>> in the kernel entry point as KASAN has not yet been setup, or an exception
>> is hit and the boot fails.
>> 
>> This was previously described and addressed with __builtin_mem{cmp,set}():
>> - commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
>> - commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
>> - commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
>> 
>> However, even with __builtin the compiler may decide to use the out of line
>> function instead of the inline implementation. So, that does not really fix
>> the issue unconditionally; see details below.
> 
> So, this whole deal doesn't sound to me like we need to backport it to stable
> - it rather looks more like fixing some configs which want to enable KASAN on
> PVH guests.
> 
> In that case, I'll queue this for 7.4.
> 
> If this needs to go to stable, then there better be a pretty good reason for
> it.
> 
> Right?

I think that is fine, yes. Even though it's a boot failure, actually
hitting it depends on all of: CONFIG_KASAN, CONFIG_PVH, booting from the
PVH entry point, _plus_ a compiler version that triggers it.

Nonetheless, this may be picked up for stable due to the Fixes: tags,
but I can provide backports as needed.

BTW, I just realized that the title of patch 4/4 is missing memset().
Would you mind adding it, please? Or I can send v11.
-x86/cpuid: fix unbootable VMs by really inlining memcmp() in
cpuid_base_hypervisor() and xen_prepare_pvh()
+x86/cpuid: fix unbootable VMs by really inlining memcmp() and memset()
in cpuid_base_hypervisor() and xen_prepare_pvh()

Thanks,

-- 
Mauricio
