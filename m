Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF8048C8D7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356924; cv=none; b=T5tC96S+N+nTUQQLpjMKccwHFH6mCpeBmnq1YIg68uYAEAQRt/zPDkAIfSscnzAVMnh7KaKv5gd4+cBaziejTHE5onnKHy2mP4bYErb3KMIdXpbD/ZUJ7woPjiKsyLOCeF9M0lS3QOCItb29zwFDtgcQJUECOEQHrGKc6rg+iS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356924; c=relaxed/simple;
	bh=YBf/cjrtAqjfwA89wFKBCIBaa8/w9n3rHagvzZRPugM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ROTXphIoaeYkT1aEbS3w0MY0jJgbncO3rkhXRHyP2IqXGB0lZ3IlOYBgCQVVZEIXZePaet2NFF4LwQ7N8Rk916E7QCZsIox1NfxE8iWctc3UvmYOcJCVeXeHDvSCMXlpByfj9UzZZTtwPmXuj3moHcPnpci6MNqu/rVdepoJrk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=nZO8BEvT; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="nZO8BEvT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=58qqfjMVhvSKBno1pG7rNumItbKcnzJgJLj9UyPe5Ps=; b=nZO8BEvTrlQGU9RSC1Gs15aClM
	IN49e3tBEdMvbHrZybWANDpjiyQoNHg8BocuJU8sWkwPtbEWUweHYLWNHi91jzzkwdZ713XX6iikj
	jSkNT4Jkam0pPU2zqpYMIaDVk8C7L6dxfAcRSKBZTXwEvQ868fxOg1OZTPkFeejsdFRj3aBQn17Qj
	EkF2csedkHmH9FGypd2mADsZoD0GfUl5OOQfRiNrmoxPGGMw2E69asm8DhvHnJ4GU5ZU8xdM1WloH
	OFRy1EB1XCk5KyHR3I492GsqyVP4Mvle3KkjxFIeERi3EketeAIQeQZ3Iwp/OBAetJiinLbJlpF1o
	dYXUtpfg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x1lK3-00DcvD-D4; Wed, 02 Sep 2026 15:48:15 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x1lK2-00Fbfl-Gp; Wed, 02 Sep 2026 15:48:15 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x1lK2-00000005efq-1wbk;
	Wed, 02 Sep 2026 15:48:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 10:48:14 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Michael Matz <matz@suse.de>, Borislav Petkov <bp@alien8.de>
Cc: Richard Biener <rguenther@suse.de>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>, Brian Gerst
 <brgerst@gmail.com>, kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
In-Reply-To: <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
Message-ID: <05896397667d66a2969259298bcebb7f@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-02 10:29, Michael Matz wrote:
> Hello,
> 
> On Tue, 1 Sep 2026, Borislav Petkov wrote:
> 
>> On Sat, Aug 22, 2026 at 03:33:17PM -0300, Mauricio Faria de Oliveira wrote:
>> > According to the GCC documentation, conditions in the flags register
>> > (e.g., "=@ccnz") are output operands [1] and the compiler is aware [2].
>> > 
>> > Also, clobbers (e.g., "cc") may not overlap with an output operand [2].
>> > 
>> > Thus, remove the "cc" clobber as it is redudant, and overlaps with, the
>> > "=@ccnz" output operand.
> 
> Strictly speaking, on x86, the '=@ccXY' constraints are register outputs 
> into normal random integer registers (though they are of course 
> initialized in a funny way), while the 'cc' clobber is not a register at 
> all, but rather a fuzzy idea of "state" in old cc0-based compilers (which 
> the x86 backend isn't anymore since, ... well, about forever, 1999).  As 
> such they both really don't conflict and ...
> 
>> But then I'd expect that gcc would enforce that. I know it can't have it 
>> when the clobbers contain input or output regs:
>> 
>> In function ‘__memcmp’,
>>     inlined from ‘main’ at memcmp.c:25:6:
>> memcmp.c:11:9: error: ‘asm’ operand has impossible constraints or there are not enough registers
>>    11 |         asm volatile("test %3, %3\n\t"
>>       |         ^~~
>> 
>> but with "cc" clobbers it works.
> 
> ... hence there's nothing to report.  In fact what an explicit 'cc' 
> clobber once meant in cc0 backends (that indiscriminated flag "state") is 
> manufactured by the non-cc0 backends (all of them now) automatically 
> whenever an asm has no flag output constraints at all.  (On x86 that means 
> it adds the "flags" register (internal name for the collection of flag 
> status bits) to the clobber set automatically when there are no =@ccXY 
> constraints).
> 
> You can regard all 'cc' clobbers as pure source compatibility, they have 
> no meaning anymore.  But as they are so ubiquitous (even in our own docu), 
> they remain recognized.

Michael, thanks for the detailed explanation; that's very nice to know.

Boris, I guess this may be added as clarification in the commit message.
Would you prefer another version with it?

Thanks,

> 
> 
> Ciao,
> Michael.

-- 
Mauricio
