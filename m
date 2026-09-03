Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C948CFC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788395978; cv=none; b=nEw+96yEanyk3U/gv+nEQTeQoI1b7kPLD8rAqWBKw3a80eaEcQ046j+70UpHRp/UXxM9FByrzYOaqEiqpHG8fisyFivF2VqzIWsnEBfBuziJW/lgClPp9XE9rVdoegrXXPmSu3FK6EqkufHWjc5Hjxg7PoFn5MghFsV5e7Yqglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788395978; c=relaxed/simple;
	bh=+oj3TPiacbt9Zv9wO9q5Sg/d1zqPxaVv0DEDNRmDeBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVe1GVSimDs/2RBlGMS+l+YdU/x/g1VTkGp3TTqA0FV+Nwjgmf6Z+n3wS5bEJef1GXALY3xB9ofgx8I6Aqn5I/vsbu0aJxB8tBcT5XJqZ1HSmBJIUg772CMUN8IMmVoQHh/NU5RU+7M1+vXU3Xr9QkBI+nLxY0uBVaSnaQ9XfoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FZhqPAQe; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FZhqPAQe"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B698040E02C2;
	Thu,  3 Sep 2026 00:39:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id udQ5OzAl84YC; Thu,  3 Sep 2026 00:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788395964; bh=kdWp3DhJemViBu8ZFWfs12pKAz2JlnXNo53LRyH7ixI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZhqPAQem8gqk0sXhssM2CHkBmYkNbRfO8skWN2H+rthvuEP6NciEwyl9kdedT6ac
	 4VQ7xyjE+FHpW9sSJom3uHv/j0u6LIJsZTsKxibCAljMQmQvYbyw4wcOcLCicgMplw
	 NqfdSt2v/+tL/P+6rDaKJjRjxmR+GCXrnEsSH10zkmjuolrtPYFBl9YJkI0EBc7AFa
	 j5bRPPcArDsDdRL3C3j3/HUcK8JF0SILGIMzGNqydpx0Khuz4IL6O3qkFkKDMqfGuK
	 8mjdzFW9YQ7XAsRrcVPTd3HAyRS/CgxqKGxpdgIt58Ni4CCYVCmrlrNOgPjxX7X62a
	 1mr9PEw1irlaHIXdNx5Y1KSSC2dOp5lfq5qvAeFumZhpytpDyKuQpkulgh6nrOpvzi
	 BS7wQFdJlo8tLuiHDGxEBmbn5MElWBivNonTDmI8pXUkPLyoMHLxNjI7+x8BFRR9pj
	 ffkR7uYezf5lh4/DeHcXH99eggRPRmTaWrZTDoZmIZIkVDG7w6pBn2E4jt0SKj3zvY
	 sg5MiMBW1qAbVWipTDS9gJo5IcbgBdUWPzP6dBUahLx/uGfCnTCKwadDdG6KNsngaR
	 k5oZ+U9+EHcjnelTbKJFgFtDwDgOJXlnM9Bs5DZwYTVkNOvfRHB14Z6CK7Om07DQm+
	 iOIMxNUOGjiys4M1+sddXZJE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0E48440E016C;
	Thu,  3 Sep 2026 00:39:07 +0000 (UTC)
Date: Wed, 2 Sep 2026 17:39:04 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Michael Matz <matz@suse.de>, Richard Biener <rguenther@suse.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260903003904.GIapjBqOSCSrg1e_tY@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
 <05896397667d66a2969259298bcebb7f@igalia.com>
 <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
 <c9dd5e5de8484285b71ae62b98610911@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9dd5e5de8484285b71ae62b98610911@igalia.com>

On Wed, Sep 02, 2026 at 09:07:07PM -0300, Mauricio Faria de Oliveira wrote:
> The rest of this series is OK to you?
> I can wait for further feedback and combine it with this change.

Please wait - I haven't gone through the rest.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
