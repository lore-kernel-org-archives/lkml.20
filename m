Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E7849BD69
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516201; cv=none; b=RzQMmQZSLeT3suMTKDBdTlhUXd6NkWobFI7Hyx1rCIxHNuksoRoIe7QJTguWDZgnyKlpc65yNo6BXuA2wiy6Tw04VnXgK3fD0Qn1LEks3vyNtr7AvQgQILJB7mmC1v0feHtG1/NyTvbTXkyrmaXhciD86lukNC6RqvSsO7SDm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516201; c=relaxed/simple;
	bh=GaiYKNaeObDwXt4rXtyYijKjBRva7jkAdGWE6C0BFF4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=j4dyRHZMnVV8Cn5p2I1cCV986aOV/lAvHBRiJgup8HwRWp606oKkv7qHF4OZQz+I+7C98VxxrwX8F+sFVHqGDl3U+NkjyU5y2hxB4Ie0xSPVRIdZH3NKRslKjh42vFcg44aAZ20D/Jymz+RRSH+V7Tw1n85cja3XKCwjG2v6Cf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=M5pUMVLa; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="M5pUMVLa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=I8JTmEd44ay2XHHFYotn7CWkmIwj8DNipARBUw7yAXk=; b=M5pUMVLaNCzsLx5LTcydsMeZCN
	s9AKwvruPECFpPUZF4Sj2JVpUooGQ9sb6+TTIpRZXO6oO/v1ub8GxAeHJPKC42fex+gVpEMu2lwig
	DycdC3uIwtmjH+AtyZq9UWde5aWNzst+87vcnj5+9wHX+ef6nMXxlRy8K84AFi1vDkmyEpz0eG2nf
	WYzXWsJ3YK5GVMm9b1DbN14cIno1b42gBgBArBSr50KWsu2lCLz/mvB/qHbfbTSEFTQfRhpKef1b4
	YX9RLKgbecJlt7hBOEASyBl/3+aNSsGiMD7wRMPMChDq24CKPjOtC+P3vy4kKsN5+SuEyL0g15WQq
	wp50ai2g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6cu2-002gmb-8v; Wed, 16 Sep 2026 01:49:30 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x6cu0-00859I-Rj; Wed, 16 Sep 2026 01:49:29 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x6cu0-000000029fQ-3n0E;
	Wed, 16 Sep 2026 01:49:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 20:49:27 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
In-Reply-To: <20260915154853.GAaqlo5YxQ9ALlhjbF@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
 <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
 <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
 <20260915154853.GAaqlo5YxQ9ALlhjbF@fat_crate.local>
Message-ID: <9086138f2dcaffe30622438b7e825ae7@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-15 12:48, Borislav Petkov wrote:
> On Mon, Sep 14, 2026 at 10:11:55PM -0700, Borislav Petkov wrote:
>> Hmm, never heard that before but that doesn't mean anything. Probably should
>> mention it in one of the commit messages so that we know for the future...
> 
> My compiler friends are telling me that gcc doesn't do that now but it might
> in the future, perhaps.
> 
> -fno-builtin-memcmp
> 
> will stop any of that behavior so if, perhaps, building the pvh code with it
> looks better as a solution, we probably could use it.

It looks like clang does [1], but according to an LLM that is also
disabled with -fno-builtin-memcmp.

IMO a fix in the source file is clearer, less obfuscated than in a
Makefile (and the source file has to be changed anyway). It also has the
potential advantage that, if the Makefile change slips in a future
change/refactor, the issue shouldn't reappear.

Either way, please let me know and I can certainly change the patch.

Thanks,

[1]
https://github.com/llvm/llvm-project/commit/9473c01e968bc4ecf5ea7c54ef0c84b687d365ea

-- 
Mauricio
