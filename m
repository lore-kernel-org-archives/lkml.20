Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C451B195
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167345; cv=none; b=L3PQTj0JimL1XOOZPJX1NMjScY6R7rcRz9nljAoZdCKgf/3ElpsCwlPrXN9TS7V2aSoHVqivBE0k9uu/ZYuRr6KFZXkoYcE9B88ahfjNshPlTo8hqN/8xWHcm4g4T+XDbFn2tYNYy25BXGew0J1f9zR8fJ8Opn3ftSGTiZ6Ky70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167345; c=relaxed/simple;
	bh=Zc4KRMVnHj1eSSVRqH86Mb2oIgBngbHTSlUMZJ/63KU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BNrKpFrWh1olMaR91sPPQBjaXiUxfJKU9k67mkINOJCJU//n9Q+gbAYxJ58eOOb3jkzDHbct+MYDPi++mLEoOE2uVLcfROT6qSYrgyaOT7quJQfsKbZyT/K+iwZeq2vH4MMcgjxlGtARz7roxBlBye4KoKCanSaUqwHTlmDueJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=I1KHWuoq; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="I1KHWuoq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=g9B2VaeeRiExoRvqu5OhmbVwC5+5bS3UNUKe+fIyEUo=; b=I1KHWuoqWH71gb7QuhhwJvbB7B
	stuwG2ZQ1gEXCknmr0LlbVOX2Sn92AHnY67LFjl4iy/+q/PAoC4XAOiuqCyiOhZFAVdqyi2xSjR3D
	CBVRECGZeJ/n6E0w4Uh9sUOTOLGqqr/3Ez5aJx0+1hhC2zl5EuhLOGqz/VM/4WrY83oubYIcfT/RP
	JkNVY53mWlRS1267DJd7Ii5wQAe32cwT1PxBairv9PkIl7HulU9j/PPaYBlCl2s8DKcxJntNvps04
	hSZ3sky0F5+s2o1bX+CsF6E8ovGUdjIcnIWhNL4zm7eD+DZFOObgFdPZpq6dj/Kma7QAR4xks9QHc
	cDSvavpg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x9MIN-0068Yz-Pt; Wed, 23 Sep 2026 14:41:55 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x9MIL-008BYe-T3; Wed, 23 Sep 2026 14:41:55 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x9MIL-00000003yOG-3zlc;
	Wed, 23 Sep 2026 14:41:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 09:41:53 -0300
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
In-Reply-To: <20260923011232.GBarMngDiylzal41XI@fat_crate.local>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
 <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
 <3ed7ea3908233ef72660ddfa1f92e914@igalia.com>
 <20260923011232.GBarMngDiylzal41XI@fat_crate.local>
Message-ID: <4d7b03a55ea3d8633828229d3c3c988e@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-22 22:12, Borislav Petkov wrote:
> On Tue, Sep 22, 2026 at 07:13:35PM -0300, Mauricio Faria de Oliveira wrote:
>> I think that is fine, yes. Even though it's a boot failure, actually
>> hitting it depends on all of: CONFIG_KASAN, CONFIG_PVH, booting from the
>> PVH entry point, _plus_ a compiler version that triggers it.
>> 
>> Nonetheless, this may be picked up for stable due to the Fixes: tags,
>> but I can provide backports as needed.
> 
> Right, just consider all the bandwidth of the folks involved downstream:
> stable team and all distros backporting stuff every day. This sounds like an
> exotic thing so let's be conservative here pls.

Absolutely. I worked for a long time with distro kernels and
backporting. I just mentioned that it is possible for this to be picked
up, and that if it is, then I can help with it if needed; not pushing.
:)

>> BTW, I just realized that the title of patch 4/4 is missing memset().
>> Would you mind adding it, please? Or I can send v11.
>> -x86/cpuid: fix unbootable VMs by really inlining memcmp() in
>> cpuid_base_hypervisor() and xen_prepare_pvh()
>> +x86/cpuid: fix unbootable VMs by really inlining memcmp() and memset()
>> in cpuid_base_hypervisor() and xen_prepare_pvh()
> 
> Sure, np.

Thanks!

> 
> Thx.

-- 
Mauricio
