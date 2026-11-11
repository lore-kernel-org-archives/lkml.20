Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420382;
	b=hGBMLMNHR/S9pbK2RtpeEGy8gPzzfpQKSt9upF76X5wgzdg6TSFQcZLVrlSwX8fxaxjw
	 p5t/0n0TAGHY9OcEJSV0O0p5wOFHmJ/9sZpYjAV8lVhuwYQQU9UqBHyLYf/YfYBIeLTd3
	 XhoH0eM9bwRilw2QBmO9SJlxCJDJ61nGvc5LrOCyvL60GvOL1OkK0UOUsrkBrpASwrmT1
	 ekYdhIK4OHoW282+aaj5uua3wJVvl3aGN3B7ZcUycfSOgTKorYDJOuo8/8dgBsruV8ayh
	 Q3gJJR1G7MAhH1iL97Rm4bob8G9PWaJYtCi4eWlazKC9hM7geb7I+Y+JeOI3YivkPaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420382;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=D1OTSqM1aaj7HeI5Pigsnqx0xpdjh0swllGDWvL9cL8=;
	b=Owak9JSTiGn84yIeBMqE9jof88+jafHXOWhWMvT1Vzq7dxIIcJlgwF6iB1AMgCW5dd7k
	 OPR1sbo+mHK1SnN+vNHtiuZzIWIp2ZyxVAjyW6QtMY4ILopvzYaUP0TtPGPzc0+6s8dqG
	 tDa+Kn0800z1yBCIUD7peHpL4SbSGRU3B/nPed05elzXJGNpif93sk9r+xoHn+MDg+PQ6
	 cTuFOJVlDq3bbwiwHtaAW2lkodLjEjLxeN93pgh+xSFl8a22ruEf6Qh333OSbuPpiOlv3
	 JZQe/8vtvedJBgd1CXFZ8SXhUDZ1RTq6dxChmm9gVXoYLEwc0cehCXbm5/czo6JGLlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FM/Kr2hF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA61606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FM/Kr2hF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFC81F00A08;
	Wed, 11 Nov 2026 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794420382;
	bh=D1OTSqM1aaj7HeI5Pigsnqx0xpdjh0swllGDWvL9cL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FM/Kr2hFYz5ISM3JPAmfDJIv7LECcokf9DOrUEsL+hOkyWr0EZ+aM/TuNlXsj/Bmm
	 rAyOObaAZ6cTRhW4+Fje4RLjT0SYS8hrwUIJZfco2GShps3zfJ4ppU4nGmXswjEaEx
	 y5FHrA3g9nnFKW1rxVjFS1SoRoR0KqgKSuqeGgJzMciRhz2+B0xQamDQRDfpqnWlUH
	 sEyB755cgNk7vVZj9PDynhNXcGJqFOHDRbZrs6Yx8QZXKooFqF4OzYV1bAGiElBtzz
	 TOuiFVpLStySdIeGuLnlzEt9cewgNlm7WI15gorI5xN6/oflXD5LEr2M+cEhiTc+zy
	 O+RVFZPBLbVJQ==
Date: Wed, 11 Nov 2026 19:06:16 +0100
From: Thorsten Blum <blum@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] x86/mm: Convert printk(KERN_*) to pr_*() in
 initmem_init()
Message-ID: <avSumM_r99FQuaS2@kernel.org>
References: <20261111133635.75044-3-blum@kernel.org>
 <20261111133635.75044-4-blum@kernel.org>
 <avSnG2SVpeyKDAXt@kernel.org>
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
In-Reply-To: <avSnG2SVpeyKDAXt@kernel.org>

On Wed, Nov 11, 2026 at 07:34:19PM +0200, Mike Rapoport wrote:
> On Wed, Nov 11, 2026 at 02:36:35PM +0100, Thorsten Blum wrote:
> > Convert printk(KERN_*) to pr_notice() and pr_info(), use %lu for the
> > unsigned long arguments, and add spaces around the shift operators.
> 
> Heh, there are about 90 printk(KERN_*) in arch/x86/mm and way more in
> arch/x86. 
> 
> Maybe change them in a scripted sweep?

I prefer to convert them when I'm already touching the code rather than
in a broader sweep. The %ld to %lu and the spacing changes modify these
lines anyway, which would trigger multiple checkpatch warnings about the
leftover printk(KERN_*) calls.
