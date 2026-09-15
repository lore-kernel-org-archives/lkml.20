Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821240802B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450032; cv=none; b=AV4+ohCnQzZCh7C3ZF+eyxO3oXqFm230l5bPfsZVFkDgLxSHeG0ay4WC6wQTH5yiyeWRoMBRVvvyIQEJJTk98d+YHzMNH9IaTUTnPc83NTFLrjfnlv0GXb767SnG8em8Z0B3nAgCCX8mA9OxAOabxfEJP0aiKGVIAvEAKproREA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450032; c=relaxed/simple;
	bh=A0PlotdD5k4zvvt0j9IgbEZSNlcGriK4gpHajOjK7UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D89tc02IiROHPakFvNi28hH5qMV67Huy1vgpnyxzeRAtfl5nHvQ32o3X0En6KdK4R1T9cY4K5RnZUvJ1Lqi+jwTPd143+cfboct4gxYl4WBF6LfbIVvw0BpULVwjuEb38pDbqxAboEOKDtmgHx2yb6a00rvWF8ZHsRBljlKSsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hrozHNR9; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hrozHNR9"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9482D40E0173;
	Tue, 15 Sep 2026 05:27:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NJEJj1msCFG2; Tue, 15 Sep 2026 05:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789450023; bh=HKvxq+Jm0VlS/M6lbhcuyNDa0aYnnNuCZTGWrmh5kJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hrozHNR9PBjD1a2ru5GC60dfZdnUwMfS7jMZLilty/gPY0WAbaefo5To+XQxBpxPj
	 U1rj8n0/pOYYhARENy6aREWflM3W3eG/WmN0RAQ1QMjEfA7RXk7wZwxGMGLjzykjCg
	 4zazX0ZxGprOgPjSN49BICmFplN6q1pHdPRT8Lv3z0lyV3YM4NgXzndP9OoEsI96Nd
	 QETLQZgfh59duUsjxuhbUc9mJBSVjypRinKeWQViOiO3g6KQcDIx3f2ghgHM6EZWq7
	 6jHYxgaA6cNib6L3Bd0ShoMuXDfR/0vWhSf7qnoPi7T7cVZk8n/X+EGBk4grf/S0xK
	 /uotGQZ1FML+DVaNWOpJ7kprEmqUTrPZ2BKeiW4JhTMuJKMlPboxsLsZJc4M8M1Jqu
	 ZDdNCxUnndm6HA6urqVFy2mjw9gRMxRwES4ZuHmIBbAu9vD6f3XxPI4vjGGp24D5ia
	 HLrnwdRDs96sTGfDjalAKwYUqWL5QpHY1pVetYTx/Xodsqqq1C2adPM8cCZOOjeanC
	 E6gykAT1C9LiM14xOXTx93970kTYv8CG4qmGbIGHD/hw9Q3QPWUz6q23G3UEYCtPu3
	 os7ivZBfp2YqyjGl93c9sbb0qHLDeTTBLLQT7Nt5U+/br8Gmg2pytPOhefIKbbrTuF
	 LT0agOuvPqMBStJwpukqCInk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F340240E00B9;
	Tue, 15 Sep 2026 05:26:48 +0000 (UTC)
Date: Mon, 14 Sep 2026 22:26:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 5/5] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
Message-ID: <20260915052646.GIaqjXFkXBkWfvt3tP@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
 <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
 <bdd7ad774e121d5621ad64f9c7147e45@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdd7ad774e121d5621ad64f9c7147e45@igalia.com>

On Mon, Sep 14, 2026 at 08:40:38AM -0300, Mauricio Faria de Oliveira wrote:
> Due to scope and review purposes (4/5 is more generic, 5/5 is specific
> to PVH). If there's a strong preference to combine these, please just
> let me know.

But they sound like they're fixing the same thing:

"vmlinux no longer boots with CONFIG_PVH if CONFIG_KASAN_GENERIC is set."

and this one's commit message:

"This particular one (still) generated the inline implementation as expected
(at least in these compiler versions)"

sounds like it is referring to the previous patch. Or I don't know what you
mean with "these compiler versions"?

Bottom line: if someone needs to apply both to fix unbootable PVH VMs due to
mis-inlining of the compiler, then someone can simply apply one and be done
with it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
