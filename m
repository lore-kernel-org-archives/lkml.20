Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE931A807
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011522; cv=none; b=aXTi0YLZzLD1sFoaGt5/qkhFZK6hYdh+PT61gXEAkvZWkPzzSC8bRyzEmj/5K5d2K3hxuWssuoqGiCSdgyW5g0yaaziqetA7ddSthiZv/hSO2VLw6h1bRBPnSGFGiM8QuTIMUfFLvBba7bd2HkKG1Ti3mEqASdEPG1dj6/J5ilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011522; c=relaxed/simple;
	bh=PQRs3l34l3Krk5k53+4W6iJX+nixjCUCvwWuudhV4s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K61paN7NWc7lwwQPy3j/LOoJOSul6/CiCihR3KLL9d7/ZthMhPcua3R1Q0ln0ccZ74quzS9n9bQuV+0G2RH5U4RFckDDkiU9xANCOsX7WrH7FmDnUdqnp9sCnhcKjL8sSkVw9czffZqA8HDeQG8Kd8yamkotau9nO1gyoDxeWu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DRVn8+E1; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DRVn8+E1"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4973640E02DA;
	Thu, 10 Sep 2026 03:38:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DgxUcYTwl7IG; Thu, 10 Sep 2026 03:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789011508; bh=56esme3wXZzA28wrdzVrMK053H2QTxOeMLqIu/NG3Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRVn8+E1wzobwfUIvffLigaTfD/SQPfkWwOp01/4UpBFVPp41n6e4eLpNABn+J/Z7
	 YSayQr1sO7A0Vbv1omE5ki9NMfGZ7qyUt7zWVv+lQXRiF+wDrTcmV0GbxRGGbRiG/I
	 MYo4XuPDfuiL9oqA1+TRF3MovHk0ENv6ZGFWbWSpD8Oe7mZ/mxfqTJgqyI8YZ9ZbRk
	 d+jIgHx7SfsXfrJ7wa+Lrw75EAU+7LSp+fCdsLIbmG1gU+8c/0Boh3xjoz/JKwcXqO
	 nHeWvB6SK2u5JiapAUTymNccX9Iu6m8KFpjCdxbdU7QAQZOMrdi4EiG+tPItT11p8h
	 eQ2HfwY29+dzimYjiMfTv85EsrSYwux/Rvf8Ac3R7tk5GOi22DCFnqfsTd+RRRE4d/
	 Tv3NVi1bRA3WO7ZiTZupPOuDmfohylcdWSAfwzt65vGyeP9zRwO9GqQnYGqDTtS1yK
	 E6iOfH564Pf4kZWeE1sozVDbOCNA0TGPx6/7scnQngsTCx/LHNYx2ETPp+F/VsJDpj
	 RXp4/3YBRAFi4AIjhx2zCMV8jSfMAhFY3qM+/XdwQ23u+cPYGbzSMyVwvze8LR0cnM
	 izR0TdiZ18N6qehBtfOc525L8UaYPw31ZEGgUMp/nbChY4enOCxAjfVc9sFRGde8Aw
	 KNbgm0ZepzF5joHLu0mrIF9M=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B712E40E00B9;
	Thu, 10 Sep 2026 03:38:13 +0000 (UTC)
Date: Wed, 9 Sep 2026 20:38:10 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
 <c955deded411defba0de3a1f6daa78b0@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c955deded411defba0de3a1f6daa78b0@igalia.com>

On Tue, Sep 08, 2026 at 06:06:21PM -0300, Mauricio Faria de Oliveira wrote:
> Ack, and to confirm: not rename the existing one, either?

Nah, concentrate only on what you're trying to achieve.

hpa can send a patch ontop since he cares so much.

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
