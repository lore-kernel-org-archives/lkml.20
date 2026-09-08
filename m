Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811035CBC3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890718; cv=none; b=E+FaOxBBZjysEKyIjLrfBLt45z9MtRVXTA4K8aAFdcbyJXXYgA55O3F+/jX0DpUa4eho8sfmazVRj1J7WH8lPZmG1Cfx5qfn0Pqe9WuyPsGKGge11rSnQbljYCLlbKQBlANvbTnAcGdIBMWTmO6tqyYej2MSbkMHO6obiPgmf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890718; c=relaxed/simple;
	bh=6EzuY4AFlBG488QUlLPsM16GnrliOD0RFotIt6SiTgM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=LjWb+LJq1pj3HzpfHM+3Isv6jkI/jdRWWqXI2K+VmrrKxbyjhxaXvFuwRVRJfKEhPuoEHSzzE4S3UcjTUELz3PxwQGEeqNSUlr7/e1F2Vz3REnHK2hHf3/o0arGzDb6sOzccr6H+B689vqTVh7niKA5jMpOIv+ppwTKUOKHRmFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PcSRrgve; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PcSRrgve"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=vp63UVaxTdJB+T//K0HyE8/U9OGm3JAcHr89i9lbZwo=; b=PcSRrgveRmq44kFUJ6/suRcHNj
	jE4yYchg++9GF1E4naqI/IwTOm+LKLpqOYaHgbSD4INDiAbCX+wX772SaHygl6iOWoWEYtEqHpuRA
	miA/IrtAq3HJPmEHwW5QtH1WFtwjhPgC/FMFBCBWfC2hKwnGJPbtwddVwVJ1c1V6yAaM/T11UEkZU
	9sXTOR3kTslOmlanM2crHTWCT91IwZU1AEzBjXPouiZUyCz4gaEkLzjvdM1yunF70c4EKMKtxzC4J
	g/4wqu7UySpgDH2SlRDPcM4ghFH+CQ1lILUuzPLYZYBaXx8bIKas+wVhTrB3NpL6+CheEYmDuB4tO
	uEn+Tu9w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x40Bi-00GcyI-N0; Tue, 08 Sep 2026 20:04:54 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x40Bh-006cMp-P2; Tue, 08 Sep 2026 20:04:54 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x40Bh-00000007AFC-2x4D;
	Tue, 08 Sep 2026 20:04:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 15:04:53 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>, Brian Gerst
 <brgerst@gmail.com>, kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
In-Reply-To: <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
Message-ID: <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-06 15:15, H. Peter Anvin wrote:
> On September 6, 2026 10:01:16 AM PDT, Borislav Petkov <bp@alien8.de> wrote:
>>On Sat, Aug 22, 2026 at 03:33:18PM -0300, Mauricio Faria de Oliveira wrote:
>>> Move the inline memcmp function currently only available in 'boot/string.c'
>>> into the shared string function header <asm/shared/string.h> to be reused.
>>> 
>>> This is not done through <asm/string.h> to avoid pulling unnecessary code
>>> in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
>>> and 'purgatory/purgatory.ro'.
>>
>>Please drop those '' quotes - it is perfectly clear that those are .c files.
>>
>>> No functional changes.
>>> 
>>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>>> 
>>> ---
>>> 
>>> Thanks to David Laight for noticing the return value difference between
>>> inline and regular memcmp().
>>> ---
>>>  arch/x86/boot/string.c               | 13 ++-----------
>>>  arch/x86/include/asm/shared/string.h | 26 ++++++++++++++++++++++++++
>>>  2 files changed, 28 insertions(+), 11 deletions(-)
>>
>>...
>>
>>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..06c1d5e5013e4d59cfb49866d10e164362d2c4cc
>>> --- /dev/null
>>> +++ b/arch/x86/include/asm/shared/string.h
>>> @@ -0,0 +1,26 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_X86_SHARED_STRING_H
>>> +#define _ASM_X86_SHARED_STRING_H
>>> +
>>> +/*
>>> + * This inline memcmp() returns 0 (equal) or 1 (not equal).
>>> + * The regular memcmp() returns <0 (less than), 0 (equal), or >0 (greater than)
>>> + * to indicate ordering as well.
>>
>>No need to overdo it:
>>
>>	Returns:	0 (equal)
>>			1 (not equal)
>>
>>In contrast, the regular memcmp() follows glibc return value semantics.
>>
>>
> 
> Worth noting that memeq() and streq() are becoming used in other contexts, e.g. glibc.

Thanks for mentioning.

Boris, perhaps the approach here could be changed to add an actual
memcmp()-like inline implementation (e.g., as provided in a previous
revision, without return value differences), or continue with the
memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?

-- 
Mauricio
