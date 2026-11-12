Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442696;
	b=UziF9pYybGtPMpxASpliqvDm5Ji+DmEbAc/cjUGM+SH51IfwdxAuXRepDwk04pARx6o9
	 7Jiwb7Gm+ahPni9Zsx/k5ar/Z9WbZ7zaG/CO8NpgWIy2mAbHbHJ3HC1JMdoqB/6OwvLUb
	 AwzQ+zVw86HQXOPLBjrxBTPgJoCJ0laj/YIaMD9/lqZkEFg6ygGs+M2ZWZOTNS+C6cNOM
	 QgIq35mG0hFgqvnYsj4hagl/X23tzJW4vCLboTgYHsNr2vnjtcdSJoykzaY1Zwvu3cRoj
	 H6wRv83Fe3admz5+B18kIv3eCMZZiwmwvibZxh1P7ipSatiMmRD34t3GN/pXx7yq5Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442696;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z3bxrbFKkTpEcIw/694YZcQAAJ2hY4OxEzRQP2+fKzs=;
	b=itBY2W+zsFNtA6++3UNSmvOFlhx3OCno+sbB78YTYKvU486MmzIpCRPCYOb6Se6K3cim
	 HCryow2PzDUK5GQiE6zcUw/y9C/VDzkHS0UKq+f47LQfKbPDvOAPYezdWwEbNSbMCxAFD
	 uia+HE5v/nfOv6OCQmqYbp4PwtVfJ6M4ANePDb6JiZIzRmwK09uBWca/buAAyPVlyVGj3
	 8verijT+ZJur04/tizdpjS85TEZo0YKkHUSJIVbLeoiQJLIFm0hwZDgKWQHOP6wVgKOlV
	 MW6fsmw1revGouPp3x6i2/5pcJVGjIzr+Z8jrBKPUM/8RFjYAsgWgOhHScGAXAXU1DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ZrRhNlrY;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60F606A326;
	Thu, 12 Nov 2026 00:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE60F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ZrRhNlrY
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A6EDB40E0222;
	Thu, 12 Nov 2026 00:18:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JJGyk9gKJ3av; Thu, 12 Nov 2026 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794442690; bh=z3bxrbFKkTpEcIw/694YZcQAAJ2hY4OxEzRQP2+fKzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrRhNlrYInjq8W95c6Wszmwi9s0dscV7SbTx6PBfhuQlvPM+g3g3FcJQBcKN9Mmft
	 bGgQCsyDk2BU/ZmP1FMQctzE0fm/eIF1949yiJeNL6QD84Id+So5ztIHGkePqRMxG2
	 Q6Qe5aHsT3aCLsTDi8elt3HRkbgRGTvxm+l4CAeEjA1qVXxdeQ2HaohYZWlN/3pAhF
	 7OxV8y04OI4WpAVichrFIPl92wfzz+Vqcd4LJ5KbxaiRzaZ3QwwK7spApt+WGGM3yc
	 YM17jXn76MpIosY0fWerrnCno1ONS72eunXlyepBMSQK7PexqGk9zJ6I3YvUR5D+oX
	 0eUetBeCGWeqPdst/0VNG3H91M64/U9nymmUXABbUrJ5jEanZkZS0lzuNdU9K6syRl
	 FiZhqavdQmo76RwoSgmD8Wm3AWEGcaT1MI3fgkxjlwfkntrkBmqWGr0qO0PhYhlPFu
	 DvE3bJioOZ+9c2kZTlw3yZUbTfmINiGaNl8Dtt3rk8EkWIarBjErObyMQCqJ0qy1Xd
	 OvyVXHelsNGfeRW3kcmIeY/ryVO1VdKOuD4hIxuAYSGBtnjjAd8d9uim+BQjmuwRro
	 kldIFzVlFjeNSnw8du4WwSbnI7jmUrzeP35WKUt/+vSWq4UCxKj8uhjc3MuACkaBB5
	 pOUH/S8apA6Q4C5sk+S/q9Dc=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BB26940E0218;
	Thu, 12 Nov 2026 00:18:03 +0000 (UTC)
Date: Wed, 11 Nov 2026 16:17:52 -0800
From: Borislav Petkov <bp@alien8.de>
To: Andrew Luebke <andrew.luebke@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] EDAC/i5000: Fix the slot loop and re-enable the
 driver
Message-ID: <20261112001752.GCavUFsCwZIRkfLI7T@fat_crate.local>
References: <20261111232529.407154-1-andrew.luebke@gmail.com>
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
In-Reply-To: <20261111232529.407154-1-andrew.luebke@gmail.com>

On Wed, Nov 11, 2026 at 03:25:27PM -0800, Andrew Luebke wrote:
> Analysis and test kernels were prepared with LLM help; the tests ran on my
> hardware.

Just out of curiosity, was all the energy you've spent on fixing this
- especially the AI tokens - worth the effort?

This chip is documented on something called the retro web:
https://theretroweb.com/chips/317 and it says it is from 2006 and it sports
DDR2 memory. So that is retro alright.

The HP xw8400 has a whopping quad-core Xeon in it.

But whatever...

Now, if you really wanna do this, can I jot you down as the one who will be
testing any future patches for that driver?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
