Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760BF168BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788394065; cv=none; b=twxYQye3nu7ROd10moTq4OZP8cuAQJ9BNLTGLNgv7n5WLaUmuae4TNPw1WiOX0UtAyu7sV7ro4/nmbN/wIgdWVl4iFvRQnqNz1QNmITStZQX+42pnKKeLaEC73I6bw8jLHv1kaI32SLs+vqNqPwigqozt3xe/jaMbYHd5Jfp9as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788394065; c=relaxed/simple;
	bh=klWcWccjlsQzujJnnvFClpN+Yci0vG0vHnlylSzbLOc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HKCN6/kV6izHyKiAC6L51CBLJxZoLnKjl7W0sqBLZbp79AOn5ap8aVHptnHQLPka37B66HAgc4TJ+ZR3q8JNErEPRYcML4STc/b2lkexIsnf0ddSygw5yiaGlqzataSrn8S15oJtFJutw3kpZH7RryXTg+F0B2X0BHjK0dKrjOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Lu3R+Nwe; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Lu3R+Nwe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=cmQEOzLtOK6G3QHIoxlsUO75VfltJ8r34O3qt0LsBwY=; b=Lu3R+Nwe9xNhYiSqjlmIy8VM9n
	xs/JIFHFwMmogdq8SHa/t4oYuVLRDGBgqGYD3CQZAwTMLrDJ50qyUhwkYM/DZ65eoGb2l2LsBHkM0
	dzwK/TXD62oc9glyRER/Q+xxq94qpiLXRNYPSdrYZrmTjQJqCUd0M7DfgkuQLm7aujBmYjaRpGq8z
	eoNAu9gyzQyZ3Jve18b1Ro9whdIdsjptohjZDExoYwt26cC7D+a8qkW9YQby5hynDWRbtvSzxJ93I
	6+dPTx4cxi3Yyajjto+3pJFXeYB9RjyDxolksiSMZO83tKSP7+V0PBomwu0DTaCP+na2cib84j3Qx
	QvlH8vFw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x1uyy-00E6IP-4K; Thu, 03 Sep 2026 02:07:08 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x1uyx-00GOWm-B9; Thu, 03 Sep 2026 02:07:07 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x1uyx-00000005maZ-18xr;
	Thu, 03 Sep 2026 02:07:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 21:07:07 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Michael Matz <matz@suse.de>, Richard Biener <rguenther@suse.de>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
In-Reply-To: <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
 <05896397667d66a2969259298bcebb7f@igalia.com>
 <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
Message-ID: <c9dd5e5de8484285b71ae62b98610911@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-02 21:01, Borislav Petkov wrote:
> On Wed, Sep 02, 2026 at 10:48:14AM -0300, Mauricio Faria de Oliveira wrote:
>> Boris, I guess this may be added as clarification in the commit message.
>> Would you prefer another version with it?
> 
> Yeah, I'd actually prefer it in the code itself so that we can find it easier.
> This file is as good as any.
> 
> Something like this:
> 
> /*
>  * Summarized explanation that "cc" clobbers don't have a meaning
>  *
>  */
>  
> and leave the "cc" clobber there but commented out:
> 
>  /* "cc" ... */
> 
> so that we can grep for it easier later.
> 
> Thanks!

Sure, will do in the next version.

The rest of this series is OK to you?
I can wait for further feedback and combine it with this change.

Thanks!

-- 
Mauricio
