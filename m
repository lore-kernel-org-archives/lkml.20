Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416839;
	b=asRKxgjjYx33e53QsFK0JAtph2AVwnOtT1SVLw6J3oEVHgv54NuwXt4EHj1yLvnNPELL
	 0zDH6pLa4/lbVMB8TdrDZevnBR5KDjEMa/CoFlv9ujbrgPiFP9se2bmyY3PbG0IX0QvOA
	 8d5yFjQx18jZkH8AVqowhmlJUO01lz3QkOp3HHP5WHwUCVMzL7bgQ/VLE2rIzY13W8e9s
	 QBwX0pMgE+tMdz5xmhY1iOdbWJOeikRFxKaJEmmNSx8QTEnronVIgIsGc8V6w0+zDEA40
	 Mv2bhw7F4BJRo363NOBwnNEtRNyUXxZtMOO/Gtj6h6W8WDrh8SxbYJ+TsIVtyXlBmBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416839;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Klm3BPKegCJLOq8Ks12UtrTpT08D/JxDFOWEzcnuIcA=;
	b=JPGevruSHOhkt2Av1SzGDwK7NujDqIOztXGoHEcI9GqjZ68z9UTPMQ/EhXUOQfc/kVBX
	 ULw4a1KmwtpUWwStWxVC+nsthOB77IIYK+USzoegpAflP3z2gcEspyM+pa913lrSXDX8h
	 3viq+5iOctdQlCw1ZVwcceJ13Ih3p2jtMVuxi0ExPnmpGF9JLUUaz4REgp+zDHhqm7/Eu
	 Za0C8m76u0ghMjQoJc662AnzqRiJLZEPeT/80VWa13izn/sLnNqfVQinMKuJnDTHeEEpd
	 s2P9eVus1f/ZpxqAagpffRfjmEPN+T31s9sxtv+n/cDjoYCWPgMrbhLdpF8Hb7V/cJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jyPzJuiB;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36629606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36629606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jyPzJuiB
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 17F2740E02B7;
	Sat, 31 Oct 2026 03:20:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PLd-mWRMhp0Y; Sat, 31 Oct 2026 03:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793416834; bh=Klm3BPKegCJLOq8Ks12UtrTpT08D/JxDFOWEzcnuIcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyPzJuiBOC2jtFU5He9dgn18qRO9UVk6fLepmpXLRJQxU7rYKKtv2llp/tKzckA2F
	 t7I46KhCAPpwMey1QZ053NtyuecFfTeLBFZAKvIdXftaMJkAbc8cU2inPO260+M7bG
	 5sWeQSqH84YMxJzmnL1epY6A/IXfJFtkxEmD/R4UtEPs82RVSbyjE988Q7nKIl3XFe
	 Jvd7Ob6ArF2kPpNGDvM0f3Xn9mlzTieC9RN/LfmvyBFbgN/Mza13r2+yKjVB/jym8c
	 +zG5SkVTQj5WuSthqdhXOTeqkIIGsPbgo20e7ATjZFFZsJTm91atu5E3LQiufQ6guY
	 jQo3IUvjFRMUjrslP3/FU3l5L0uAj6lmcmH2+X44VJbd1mh6XaVXX/t1LZWulvHOCM
	 zWtucKc4CwOLM84WKnvK0lIsnyXPq+6R4XCKyS+zH5rdIQdB2B4W8exD0s2ylDpB5B
	 ZmT+RDUVVKXX9XNJtXhdctDXxDFam4iyKCOkcrstDsOtiYwneJy+1Jg3w2zhkxjO0N
	 A49UV7WYEnT9I8xFVMbICyEfmHg9Zh7bGkv0MEHfaOwhCWYt6OtHYo9wH5kd14yqPV
	 RjBXouR2RTFygk5l63/E9l8d6hPPbPcm6tgXqiFoxIZNOQWneG1nBNA8zIe0nYYUMy
	 0OmRJUzw0B96jcoPxQWaMtSA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3AD0340E016C;
	Sat, 31 Oct 2026 03:20:13 +0000 (UTC)
Date: Fri, 30 Oct 2026 20:20:09 -0700
From: Borislav Petkov <bp@alien8.de>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Ingo Molnar <mingo@kernel.org>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/paravirt: Add ioremap_verify_range hook and
 implement it for Xen PV
Message-ID: <20261031032009.GIauVeaXTMNHgjYEiM@fat_crate.local>
References: <20261031003309.3751-1-jason.andryuk@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261031003309.3751-1-jason.andryuk@amd.com>

On Fri, Oct 30, 2026 at 08:33:08PM -0400, Jason Andryuk wrote:
> Xen PV guests update page tables via hypercalls, and Xen refuses to let a
> domain map machine frames it does not own, such as chipset MMIO in a domU.
> The set_pte() paths ignore the hypercall result, so ioremap() returns a
> mapping whose PTEs are not present.  Accessing the virtual address then
> faults.  This was seen in print_s5_reset_status_mmio() on Xen PV domUs
> on AMD Zen hosts.  The machine address is not accessible by the domU and
> faults on access.
> 
> Add a pv_mmu_ops hook, ioremap_verify_range, which __ioremap_caller()
> calls after ioremap_page_range().  It defaults to returning success.
> Xen PV implements it by walking the range with lookup_address() and
> failing if any entry is not present, making ioremap() return NULL.
> 
> This also affects a Xen PV dom0: an ioremap() of a range containing any
> page Xen refuses to map (e.g. MMIO Xen reserves for itself) now fails as
> a whole, rather than succeeding and faulting only when the refused page
> is accessed.  Pages Xen forces read-only are still mapped present and
> are unaffected.
> 
> Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset")

That patch is an innocent bystander, if anything - nothing it can do about Xen
being weird about not mapping host physical addresses not owned by the domain.

And TBH, all that gymnastics just to prevent this from running on Xen, is not
something that makes me all happy and so on.

What is more, we try to get rid of PV ops, not add more.

I'm sorry if I've misled you with my comment on the previous thread - I didn't
think someone would even act on it.

And I know Sean doesn't like X86_FEATURE_HYPERVISOR but sorry, nothing beats
a oneliner at the beginning of print_s5_reset_status_mmio() vs this overkill.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
