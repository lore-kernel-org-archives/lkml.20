Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7A562616
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890266; cv=none; b=SDlWPRabvqJ55xdRbCurALx6yzqQTunbm7E/+FidhfuU/KV/Q/SNosZ3zGrukN26Xxj8oKtJiP4uj1MmG1eRstrlZ4kf6BXBXZNVX0ZmQCrCgyD24uKZUoj5pHUMzz0qC4mCaREGZr9jrLgacEoqC2ClUKa642a8CD82O+f5P6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890266; c=relaxed/simple;
	bh=JMytFsLNDFlTZh0HBQ79AzodrB4sFdKnu4zEXPonQkM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=pXqEo/RjZTLEENtlVwbBLy51NILUIHf4v2HqK756pLysWd7Q7kTWrQvpjk1jbG/7OGdOG4482waHB1W08JdpzV4L0DudB7wCDFqF5k+hKzrHZZywk1VFC6hH54H6YWNyQK+01FN1xX7YjxEtrqH9vpFA4iqeWhECEbAeyoU6Ic4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UQ1DZdEW; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UQ1DZdEW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=oSRZzJnAPLDDt/YuSrYjYSdAxN1Qp6X1YLFSuBN6GE8=; b=UQ1DZdEWCGgl5OC/rNxNxZ60eE
	yjcGBcIqiuFAo51PkATaGhWHtJxSvVMFvtKp7MyRCyc34U7A4SOHVQOsFaVGsSuGrzbmZ1DbUZv78
	SYxEBXzm95ONDdcupbJmVj2lIJg627nu4y2IthveO3N7YeY5O+D7GDVr7EjBGKaVLcGuEplae/xC9
	hLMNujvnbhplyP0o9cEqVHqHPMtMmmbtU4Ziql0QZKbFcMiiUfNdHc3qVOOo/zQuIjhTeYthVWIHq
	IUd9eyDjZ7YmAPDBY/q/YWM+nlSlHJOlqftXKram1aC608My7bDNWMtiAFjivRZavT+49XrAOkQsJ
	2txK5O5w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x4047-00Gcpz-4h; Tue, 08 Sep 2026 19:57:03 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x4046-006bwL-A4; Tue, 08 Sep 2026 19:57:03 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x4046-00000007AAD-14In;
	Tue, 08 Sep 2026 19:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 14:57:01 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
In-Reply-To: <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
Message-ID: <4f91e90230e415fb036fbaac86bd5b27@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-06 14:01, Borislav Petkov wrote:
> On Sat, Aug 22, 2026 at 03:33:18PM -0300, Mauricio Faria de Oliveira wrote:
>> Move the inline memcmp function currently only available in 'boot/string.c'
>> into the shared string function header <asm/shared/string.h> to be reused.
>> 
>> This is not done through <asm/string.h> to avoid pulling unnecessary code
>> in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
>> and 'purgatory/purgatory.ro'.
> 
> Please drop those '' quotes - it is perfectly clear that those are .c files.

Ok.

> 
>> No functional changes.
>> 
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> 
>> ---
>> 
>> Thanks to David Laight for noticing the return value difference between
>> inline and regular memcmp().
>> ---
>>  arch/x86/boot/string.c               | 13 ++-----------
>>  arch/x86/include/asm/shared/string.h | 26 ++++++++++++++++++++++++++
>>  2 files changed, 28 insertions(+), 11 deletions(-)
> 
> ...
> 
>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..06c1d5e5013e4d59cfb49866d10e164362d2c4cc
>> --- /dev/null
>> +++ b/arch/x86/include/asm/shared/string.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_X86_SHARED_STRING_H
>> +#define _ASM_X86_SHARED_STRING_H
>> +
>> +/*
>> + * This inline memcmp() returns 0 (equal) or 1 (not equal).
>> + * The regular memcmp() returns <0 (less than), 0 (equal), or >0 (greater than)
>> + * to indicate ordering as well.
> 
> No need to overdo it:
> 
> 	Returns:	0 (equal)
> 			1 (not equal)
> 
> In contrast, the regular memcmp() follows glibc return value semantics.

Ok.

Thanks,

-- 
Mauricio
