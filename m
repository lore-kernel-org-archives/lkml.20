Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879757;
	b=FPl2XRnQ5CW+ed9zYG1NJHEUwcyU3ZIyKjoAg3uCf+l8kJpHWUfSoqpeg/l4RgkpKhbs
	 BW3j3O5p8unLS4OE4EfReAT69q6dzGe331s147WlhPCVukNna1J/z5M9jt7SgCI05hQti
	 tU/ExRwadpWwVjsXAX74aTN4H9aJGsnKICnWHqP0RcJCRABqbTdcA8bS2IDImLu3J632c
	 yksVgZ3IKDVV4fCBS02PD5SjMoMIMxU6NFyarn8I1rYqM0PeVXOaoQxtp7dzMaBD9H588
	 1UCAYXTBBagvSfyaeTXrlKLuj2ppiGrLr78LqK+W/QM79bY+FgDwu5MV4BssjER+VDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879757;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=blv6O4bi3KniNZSZaBAb+qDrJFTIo2ZPaosrvloZpPk=;
	b=Udrfn0c7ugxlXIbgz3Hl+rT30ESMqlRI8WGOTEzf3MmDb79DS/4BP88G6ar2uRDqOYNt
	 w8S0WLjZ1n9wqeupXP4o+gK9EMBIBPO2zA3Ao7uQfnnfaVBa24ubU2/F80Tc8v6i5HCWO
	 LoUW9ESdWPuiQqy/MOS7waTh6nAjc54nbis9nWvAtqDXagaM7uS82ikmxpVLfg/Egajrv
	 Oyead/fJsIk4fA3PRupwObfy/lD/3kpL3NEhhTCaY2yiIQLGd2lIlFTyuujYQ7y70RAtc
	 BsWGOJqeDt51aMFXLg8sdxma7duFdZqvk06GlrRLY4znqnYz5pVZqUFXUInu8mXv8WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oqzVMeGG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D00A606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oqzVMeGG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304871F0093A;
	Thu,  5 Nov 2026 11:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879757;
	bh=blv6O4bi3KniNZSZaBAb+qDrJFTIo2ZPaosrvloZpPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oqzVMeGGZirazQHJMc84rnQz1Gu2mB70FSCvJkBrLvweibXF4wsY/4M0Y2Lhx/JZs
	 qw7Ea0EBOjtlGPPr4kmm6VzfQlHuIWQ/J7i2BbCEbBj2GWIO5bhR80r/ItPo7dpoBI
	 cAgTXtoqj2rNzhKyfF+eQqEAuZRHuk65nwzyBCelmqsImIVl3mA7vc1IHMUj0VRtGV
	 yPkd5BQstmItoEWVyOu6W3oTK7UX1g5q0tbVrJtv6GU3l3gJeLAdeIO5aE/nGJ/w5D
	 2S/Oe0OK9deFRdtX1OKlotSAksqYunR+WoGkm5HO31ndK0dxXtbGl2XJa1jyZ3tPOL
	 7apKaboUlQ19g==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 069A4198003A;
	Thu,  5 Nov 2026 06:55:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 05 Nov 2026 06:55:54 -0500
X-ME-Sender: <xms:xm7sarg6hkHAPeR6qNnjGTgOC0c3MwCRkcRyyDte-v2Nz4AuHE-Ysw>
    <xme:xm7saphsT_LOQ5_t9aQEuRe60HCsp6dNKYCbhW7KxfWQC49PQymdRBbbUn-i5i9sH
    QStLn2jAiEAJRwyCkhmX9Ae7rIOj7T8-vP480JX_RsiCJb1ukBSvOMf>
X-ME-Received: <xmr:xm7sajtbmih0YyaDyMm21NI9mlZlJKu1ERf_jsafuT_wkmX2BV3b6DPUd6U>
X-ME-Proxy-Cause: dmFkZTGlpGWVVjYxBjIq1GW6Bog5Gen4I6Dm00lal7CBkODI1PCEbTquXBXmwJLyHC/Pb0
    hMLtvFsGD3zC1Q9ttsCzhqKULfkv9x8zovlqzN/hdkPtWOD8WUDm+Daf7wKsKNUXKXlpo1
    bFIC6ERf0hO9ea/mtihFTDTyCipqWMJPUwRZGVRWX3+eBSgzzlFuXNMBzbbhxlm/Cl9kVf
    qHHUJaywNb3F4K6tjLmbyevw8rCLxUMHWT/9Cg7vbj68E6lN6xft2IojKQVeQAEiLSZSKx
    lZLMQWm4VlvPjllWVTTLhjTk/9OEr1u49yNsfSP/NsyNB352Y3dF2bwT4gQcnry4plValo
    pLBIrxlGDfR+ywb7rTy1vTBYhNUtZgulKr8/JOC/EmfHBLyljCXxPcnuZybgIU3nR8ttxi
    NiKVBEjcu+cD8pgA1PtU+/LtIQKKOkxMmEkK+2AN27LTuVqJRbL9HjNlKVqR6Vm29IM2Ss
    bW1D/tqn1Qh7RsiFzCWJnWmIGuFgJB8hm5YY9wNsUwbACh+M1Ai8sD5/j0rhKczYofrL27
    aXPtMu+wOfFCKeUYjR/MrD3CrT+5sz59Rxv/1Tg0Q+eOY2Mg2KwKNNAUJXxVMCWR0OVfE1
    bQ7XT+vKIldd2Uz1zKn8/hce34bPrDJtxKm7F4XRZxYtmRPCZ3bkrcCgt+vQ
X-ME-Proxy: <xmx:xm7saqTsbIEzTlIIyfCI0NvMcGCThm014x3v0iWjB-FDRz8L8axO1w>
    <xmx:xm7sasFTrJ6-LeqVH8QtOdfuMUwbHSbYmm9ap3kQlN9bZZLnAFIoIQ>
    <xmx:xm7sashUZrl5LGKDtq38sKALGMetuWkB1zjzVd-gCh8VJKBe5TmQMw>
    <xmx:xm7saqi_fCFvdSbiD3UGPjXEJwWp0mtld2wkwhPL8zMrxF3P2PETsA>
    <xmx:xm7samz0sM-HdoJmBgpTBx5he-nOGHlSFJzl8pION3Xtidy7Mpg2tcSf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:55:49 -0500 (EST)
Date: Thu, 5 Nov 2026 11:55:48 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Hansen, Dave" <dave.hansen@intel.com>, 
	"andrew+kernel@donnellan.id.au" <andrew+kernel@donnellan.id.au>, "luto@kernel.org" <luto@kernel.org>, 
	"pasha.tatashin@soleen.com" <pasha.tatashin@soleen.com>, "rppt@kernel.org" <rppt@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kernel-team@meta.com" <kernel-team@meta.com>, 
	"david@kernel.org" <david@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"peterx@redhat.com" <peterx@redhat.com>, "tj@kernel.org" <tj@kernel.org>, 
	"azpijr@gmail.com" <azpijr@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "rmclure@linux.ibm.com" <rmclure@linux.ibm.com>, 
	"bp@alien8.de" <bp@alien8.de>, "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, 
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/mm: Define the zapped-entry checks only with
 CONFIG_DEBUG_VM
Message-ID: <auxuOzjRJPqsTvfm@thinkstation>
References: <20261102144001.342837-1-kas@kernel.org>
 <b04316eb-a2f8-4587-9392-e673c7bd2fc8@intel.com>
 <aumzjHyJsshPJBUI@thinkstation>
 <b45fe4c2a730a23845a36b5beba4f434c7be7477.camel@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b45fe4c2a730a23845a36b5beba4f434c7be7477.camel@intel.com>

On Tue, Nov 03, 2026 at 03:50:04PM +0000, Edgecombe, Rick P wrote:
> On Tue, 2026-11-03 at 10:13 +0000, Kiryl Shutsemau wrote:
> > On Mon, Nov 02, 2026 at 01:12:47PM -0800, Dave Hansen wrote:
> > > Or, heck, I'm not that attached to these checks. Let's just kill them.
> > 
> > Works for me. x86 is the only architecture with them, although arm64 and
> > riscv have shadow stacks too, and the x86 helpers already keep
> > Write=0,Dirty=1 out of other VMAs. Patch below, without the Fixes: tag.
> > 
> > Rick, any objection?
> 
> Eh, I guess I'm lukewarm on it. These checks only catch the case at zap time, so
> it's not a huge protection that is being pulled out. I thought they were useful.
> At the same time, they have never triggered.

Yeah, I have not find any reports.

So, we can claim that the check served its purpose to stabilize shadow
stack and can be retired now :P

I will post the patch separately.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
