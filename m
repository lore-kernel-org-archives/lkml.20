Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8854B1B56
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487368; cv=none; b=prmkiLLyJPjYl7h0reAnZwXX+vT9Hdm5PELc5Zq9I9q2/h3y0qVwoiNhBxydIww2+HB6pVxotGJdG0ftko4ni4TMKTxGEqzhiBvWZ3XL6Kr0tkCmSun73KYwrhtqA8HaJej2FTZOaYeshblGGfG2CrgG86oVfvq3WEm58Q3UK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487368; c=relaxed/simple;
	bh=Y+lcsD0ECsId9xdheuzJIKWNsRg1peXcNuE5qp+HKuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwIJP4WrvtosgRqqTbQfget81x/y0f2gevsjo6CFhLfEqm++C7PDrBiqBWft5j14UrsNmTliiK5gaPs4pQpRv9sKUHxXjOQFPv972fJzYm3pR8jKoLLwuo5un2UDJwsq8Z5/pVn6Xy63eRmG0xc2mhaKdG8zx5BEpmUW56e2zFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BmrQ8O97; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BmrQ8O97"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BE48340E0173;
	Tue, 15 Sep 2026 15:49:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id d06NG9gSV47R; Tue, 15 Sep 2026 15:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789487350; bh=fCN5qSYaL57eT0UM8WiuWb5l8tYcx6z/BpUC5JNlUb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmrQ8O97V62IdGr2cPLY4/94bh4q4aGkqLolGjSKVWl2G02JdCoWNFDYZnvaNhGZ0
	 Yq+Tuwe1BjVum7MHvi8IdJSDn4UsN/tPQQaR2GKfyWqK0fsjtBGAanpudTypZcYyHs
	 a73TB9hmEFZz5DTr1FbnmNfndFVMYFPfRs5jsaCbY1SFTYKuZt2yvsivm+RwwAD8TI
	 7DgGeXGCC/atNDJQAqDGzNf283pZqtgiHpBxAB2j4qZafZFlZM9G/Tqz4EaeJilQmD
	 AQZnB9aBbPazCB5w+8CBOz+OCYTEvyOTVVmXl5IvpnHvwaT9dZCmtfL5Ryns0jTK+m
	 r+Nl9yb3eBYVB0TpU9oko4owZgIQoGXDUGPAm4jQ4sni/mohatEUcttY5aIlouxEdA
	 /RAJ5/t0JLAtB2Aav3vv3spktUmxk+x6gpHnDzwoss6isvj7FV0lXuB0iZ4FHMEh4w
	 D/AcBxBiIq1iAKuJg6vFN7YkJZhvjkzjis0nsC7FTBfQA4RHfs9rowT8jq5DxM7V7Z
	 DpQ6yPUgJo/aXjydiCA5cAVpyBMHsURX3UQ2lLZoNypWfpyFhJeSA7Pf6nQXCB+AbV
	 FuR+ChyPBoI3A28duw3kRaLwjECYxxs34Pi/4geFpjxfa8qsdRDY3mEATj3v8DZwi0
	 N0JSLieIrbyRTWf9HRJY5oqU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 461FC40E015D;
	Tue, 15 Sep 2026 15:48:56 +0000 (UTC)
Date: Tue, 15 Sep 2026 08:48:53 -0700
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
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
Message-ID: <20260915154853.GAaqlo5YxQ9ALlhjbF@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
 <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
 <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>

On Mon, Sep 14, 2026 at 10:11:55PM -0700, Borislav Petkov wrote:
> Hmm, never heard that before but that doesn't mean anything. Probably should
> mention it in one of the commit messages so that we know for the future...

My compiler friends are telling me that gcc doesn't do that now but it might
in the future, perhaps.

-fno-builtin-memcmp

will stop any of that behavior so if, perhaps, building the pvh code with it
looks better as a solution, we probably could use it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
