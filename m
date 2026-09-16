Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3022E03E4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519979; cv=none; b=GmS+QR9PrkxB5MwjzSvdQbLSSrcGEiihUxPzCZqEL+/YEnhYTrjccioqCh2ueQwHSbY8BlFUtGoXmnHVjbhMlxZDzutx+EQoGnri8n8KiDJ1gdcgaZTKISkrFKb9j0h/OL9vatpk720IdgT2Q1gkURs83sODSEBae45VB4+lUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519979; c=relaxed/simple;
	bh=OPN4DXaBhftvnwg/eHVv/Jd750WtvEfmhpwNuUA73Ps=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XPUwV0ofOPpI+bQ9w0rP2DOIufohbdq0b2MR7ZkneYHRjQ63uFEB68H1mnEjr80vUXG6cF9SOMNP46c0LGPevI4xbBfC3YYa8yVmSKYyCSgMBXJdTSjSqbX4XXNJPoMOD8+eaZAGuiQwm1xIH+qSvhvHmkeajmMh7um3weoOaTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BbWB8poq; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BbWB8poq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=71+5XpzCocajiTsiXQeY++69HYCLAtrxNkPLeB+bShA=; b=BbWB8poqLP8OS5CNwejIh0tZCt
	WbwFW81FEfVr5PrfZvomEx1IQF9+zetaBpiX6cr02wx2nv93e5R73XLzotWF5VBcViKnSPQCsJK3s
	I34X4jHK1Lh4JAT9tgjyz9z2qLExHSpfIImNjAmt4HnzFuRcDEVhrz4hCN4ZXO/kUaZrKSe2Dx/cv
	f8F/eM6voT+vU9lSl6KR5fo7bLdFQFk0lra6qJVcyFIzPI26l7UJLOIZAgCGETREp533wvAGFUhVb
	gflVwxkGWo/m8rlZDr+EvRPLMDcX9VOv9CeYVvsNI4dZ9CuKRn3Tg5rTff1FSm7KMD/Wl15OZHHra
	bTD6PZ/g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6dt7-002hsb-93; Wed, 16 Sep 2026 02:52:37 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x6dt6-0088ZL-81; Wed, 16 Sep 2026 02:52:36 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x6dt6-00000002AJn-1CbL;
	Wed, 16 Sep 2026 02:52:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 21:52:35 -0300
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
In-Reply-To: <20260916000432.GDaqndEGBGiL2IUPrG@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
 <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
 <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
 <20260915154853.GAaqlo5YxQ9ALlhjbF@fat_crate.local>
 <9086138f2dcaffe30622438b7e825ae7@igalia.com>
 <20260916000432.GDaqndEGBGiL2IUPrG@fat_crate.local>
Message-ID: <6092a255f6fd5ccbc7945b4df0ecc88f@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-15 21:04, Borislav Petkov wrote:
> On Tue, Sep 15, 2026 at 08:49:27PM -0300, Mauricio Faria de Oliveira wrote:
>> IMO a fix in the source file is clearer, less obfuscated than in a
>> Makefile (and the source file has to be changed anyway).
> 
> No, with the build option you only need to touch the Makefile which contains
> the build directives for the objects which contain hypervisor_cpuid_base() and
> xen_prepare_pvh().

IIUIC, the source file would also be touched for changing
__builtin_memcmp() into the open-coded comparison suggested earlier, no?
(the 3x u32-based comparisons.) And that is the code which would require
-fno-builtin-memcmp in a Makefile.

>> It also has the potential advantage that, if the Makefile change slips in
>> a future change/refactor, the issue shouldn't reappear.
> 
> Yes, that is possible.
> 
>> Either way, please let me know and I can certainly change the patch.
> 
> Ok, let's do the explicit thing - the difference between the solutions is not
> that earth-shattering.

Ok, I think this closes the feedback and discussion so far; I'll send
v10.

Thanks again,

> 
> Thx.

-- 
Mauricio
