Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0D83D9DB1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386064; cv=none; b=Ga5cIFsuhMyAcwh/6rp2Xz6N7aPIyNXSSRW/yR1Ndn10Yr5c92x6zPNGuy3m4mp5yeErLtDhAa0pdlHZ8EbIZUVzr+BZaGvq8sD5uUx67PfX0GRq/er+24ZOgQMoP3TEPLL475jJRFQmh+w2Hq8NWvOCIvTBTLcOAfv+IwjdXdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386064; c=relaxed/simple;
	bh=tvFm3qPzUXxNI68nIHtT5wsYj5MfD0Kyc9eMvCZexD4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=E/T5rCdltmcwBMeWVd25jGLtmUsUY020NSVONYS0t6IcKkTePeCtMi+tGMONno6VCodJxp0M6vAU1p/yeEFfCNkjJasoQ8N9lCMufIwvVkwEnfccEAGEmG/Af4LBkJUwLa1spc2GropFm1mK+DgOtJ54u+ZdmT38yJVbK8GwluY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JzJ232aV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JzJ232aV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=9CFOHjBOf3yPy/DhHAL3D16IeilqUND+JE3cSijaXso=; b=JzJ232aVCAQkvfcw/WMghan5vq
	08b52hWMOrx42r7WC3jSHoFS1yHhbqL9lKT9J/QPQhqelN2/is/ODfaXEBRdK8XPwz4yTApOZKbZN
	BiUpi0ocDJOOmelexgUaly7bAyOBGChwGSQGNjvK969Z7lJqV6pPyaLef+6Uuf3nmAa2gxtDZ1A7T
	WbAeG6OnHTwb0k8wpO91bY68H49ewXJqnKlHqChvO+zFKagBuk+UfOVXHPirjzmlnZJ5UcBSpJoaM
	unHkgbvEsQ35c3YMnzHFvPUcVGmQ0b8RSWU3EYJ7shFJRnpR9LqH9hBtetoiaLqWP1WjrxmbKiAQb
	Zw5BBrWQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x653A-001rT0-6p; Mon, 14 Sep 2026 13:40:39 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x6539-005UIG-0y; Mon, 14 Sep 2026 13:40:39 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x6539-00000001lUT-0Hp4;
	Mon, 14 Sep 2026 13:40:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:40:38 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 5/5] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
In-Reply-To: <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
 <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
Message-ID: <bdd7ad774e121d5621ad64f9c7147e45@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-11 01:39, Borislav Petkov wrote:
> On Sat, Aug 22, 2026 at 03:33:21PM -0300, Mauricio Faria de Oliveira wrote:
>> Even with __builtin the compiler may decide to use the out of line function
>> instead of the inline implementation.
>> 
>> This particular one (still) generated the inline implementation as expected
>> (at least in these compiler versions) but this is not guaranteed to remain.
>> 
>> Switch the builtin to the inline implementation to address it.
>> 
>> Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>> ---
>>  arch/x86/platform/pvh/enlighten.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
>> index f2053cbe9b0ce3d2178938269607c652ae8f528e..cb442cbd9d828619421babb281bfe9759edbca8a 100644
>> --- a/arch/x86/platform/pvh/enlighten.c
>> +++ b/arch/x86/platform/pvh/enlighten.c
>> @@ -8,6 +8,7 @@
>>  #include <asm/hypervisor.h>
>>  #include <asm/e820/api.h>
>>  #include <asm/x86_init.h>
>> +#include <asm/string.h>
>> 
>>  #include <asm/xen/interface.h>
>> 
>> @@ -129,7 +130,7 @@ void __init xen_prepare_pvh(void)
>>  	 * This must not compile to "call memset" because memset() may be
>>  	 * instrumented.
>>  	 */
>> -	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
>> +	__inline_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
>> 
>>  	hypervisor_specific_init(xen_guest);
>> 
>> 
>> --
> 
> Why is this a separate patch from 4/5 if it is fixing the same thing?

Due to scope and review purposes (4/5 is more generic, 5/5 is specific
to PVH). If there's a strong preference to combine these, please just
let me know.

Thanks,

-- 
Mauricio
