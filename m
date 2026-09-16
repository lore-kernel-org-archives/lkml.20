Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D48DFC0A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789517102; cv=none; b=HJIsxITTw6zVw8Rg7BL70KGLQqff84nH7MJ6Etl0iuXqMIIbw+36hnJOPtuW8Y41NKuJ8/Gb1zfiRsihe5B7HfrWGw698OWSuubhZnJe1qHVd3l+5U298jgRd5REHsZDTo+oTSkYbjguZa+tZ7RvpUuyiX4ZvDoSCYw89nQQs1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789517102; c=relaxed/simple;
	bh=qh/1FvhzwebykRfuGebrE4eY8VEMp2fFEURlD7s+jSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDymXzS0XPfS07CHCwsAwJTwrO/Z99qJsw36irxrGBSIVOxOcmPI0G2r19A6kb0hp5F/KRgRfCdrvXpbTGc36RQAYTHctpK1+O26jua9Ofj3Stx1LTyHAxhnInEmp1Fut/j5udFvxuJdBxRT5grWpG8kZWCyM2fhWxrYHslTPWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kPVnzKMK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kPVnzKMK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B396640E01F9;
	Wed, 16 Sep 2026 00:04:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7oU5wfVy674d; Wed, 16 Sep 2026 00:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789517091; bh=WkVYQ3OsJCAsU+bmA69lZz2EHCVpfFuTnaOAkdJMBTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPVnzKMKNTszNOxzT8EmeyXvqDOq1+TdT9uNBmyPgAR4Q8+WlJ/GgzgE1SgoF+0wa
	 C8+fa14EYhk2d8Gd811+MKAdsG/n/yBm/vGthLfj0GZXDQNtm3yp4gztrsvaD9xvlu
	 9iH4tlnS8m6njgnKNfWs2KDjQPRyh7cBiZ9pzga/vIoVCiViUSZzGcvjN8HrQJdx46
	 Gmz1RE0C3lgocziKN5XCOMIGGYIPuFsmwwZYXoqfZmpSSKa/UkqJI2CSQ7Wz3aBATq
	 3K7u0/JRzejAJjhUX4NFelbnq6yZF0ekoiyZW6m5wXypcI8AoeNg7X2LBXIYkU+bqr
	 8JI5Vo+PWDutoemX6Ax0lw9QxGE79C6mkDBujxRrlTfEGKcnDrOHFEGBRNGwpFbIE7
	 9xI4YWR+eq/MXpMIB3lBUEKiv1fyjZeKpY0uAf8iG/GiwanL34g6d3DqJc+f1bZAgM
	 NiJfy/GaOt2OoGnxWG35CT9h7EfOKNbBxjUN/2m2Xbj8v+UfOoZzsKN98Plred/4SF
	 tFE73SA/mjm0ABRdPVhXZz0H+JUqgOX47gZNT4FhJ7PRcEl7EB5yTBwYbYFbNagOBd
	 Fi2YKI8t3KsXMzR0TQ4ug28ifNYFJbdurHHZ5cUgWOSy6ALy5WIz8LLn99Kl4sw0tI
	 NxIfFiGJk1BoehWZY13rOvrk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6659940E015B;
	Wed, 16 Sep 2026 00:04:36 +0000 (UTC)
Date: Tue, 15 Sep 2026 17:04:32 -0700
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
Message-ID: <20260916000432.GDaqndEGBGiL2IUPrG@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
 <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
 <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
 <20260915154853.GAaqlo5YxQ9ALlhjbF@fat_crate.local>
 <9086138f2dcaffe30622438b7e825ae7@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9086138f2dcaffe30622438b7e825ae7@igalia.com>

On Tue, Sep 15, 2026 at 08:49:27PM -0300, Mauricio Faria de Oliveira wrote:
> IMO a fix in the source file is clearer, less obfuscated than in a
> Makefile (and the source file has to be changed anyway).

No, with the build option you only need to touch the Makefile which contains
the build directives for the objects which contain hypervisor_cpuid_base() and
xen_prepare_pvh().

> It also has the potential advantage that, if the Makefile change slips in
> a future change/refactor, the issue shouldn't reappear.

Yes, that is possible.

> Either way, please let me know and I can certainly change the patch.

Ok, let's do the explicit thing - the difference between the solutions is not
that earth-shattering.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
