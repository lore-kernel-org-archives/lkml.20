Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844905;
	b=HGzIxHQ4P555Hu9exuzQtDO+JEzxtMEeEK6WLqXTla3f/xLhbvE+DVf3ROYpwTcYOfsU
	 mSx9Q0s/cg3A+JdQgN5Y8Ghx6qm5LhYdFc9IAsxWW7HoUYzYnnsUKeP+4B9p4mxWHUX9T
	 /q2iwr3e+CHiQ69gxcttMyabDLLuRhKP6QvyeQtMt/g47eQcFrchwwKETgo4b7ImZExqg
	 8YLDB61wCNmKlxbwMb+RQJiykeawQ8Dtgd0pJdAcbKpFw23IxkBKZtvu+LRgBxXavBw4m
	 nkyGN9evt1S0dJfXrMs01qKuhAnmQNILk0Y2GpgabW9K8yrzXk+/5MgR/zRx1h2LT3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844905;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rjt5YYHQyrHnKk2C6dORwel1aYh+XX+d2qSk2l5pIw0=;
	b=zzJKrLoGD1HvHDzZGUOuD9d2N6fXM5qZ+HK/H/yPBnMsNL5jqQspC2UxDgTBfOD3FyDG
	 teBiqaDwYq/XUH1rS/beb80ZNuUA343u1yin5exZmhPkBpshegNh6ZsUohCN1+dglVw3K
	 CmTb6ekFnYtIUV+sUcS25kBj7UUtfY1J+Rq86bzCTdc82qrx8Uog+gOPgOtk0+TDqOBsz
	 X11Y91/afaK3OCeHC5cA6kXE/LYpRot4k2nRv2GFqtMVWfMLu6jEx3jOuI5Sqe0kb9o6c
	 O/mom7NezD6Xy1HNmc8gdt2EhrCJ6bghs9gayzPczW7fE+QUqwCmKZNJwdN5Y+RUSgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="gSwnk/RX";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DEE606A329;
	Thu,  5 Nov 2026 02:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DEE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=gSwnk/RX
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 083EB40E01D2;
	Thu,  5 Nov 2026 02:15:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8kVkP3z-blek; Thu,  5 Nov 2026 02:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793844897; bh=rjt5YYHQyrHnKk2C6dORwel1aYh+XX+d2qSk2l5pIw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSwnk/RXnnG0AkqvY00T3nP/1WPkKzhSPBlgxu6C/w9Qb6PZ/FZ7uZrZBEC4nFtG0
	 +fgIfvtifMcFOYFDEI53bU3yFzbygtGA0+g66Vv+bMxtca9hPAwwFm1LPdKBewA0oh
	 6HDeKP7BwJvfegWBxiTz2g4oas7HrMvhwMVteMC3ShGjtH2KEX90gFrUQFAsFe0u5g
	 Pnrd3rbmDhwYgLZm84tPgCmcbBi1g804eBZDHjISBVJgA7g4fkJap6pwPP9+aFkpcb
	 hOPgFdQVcSWAUxafQk1wmmhKOO+EpXOtVIwZRlWzJ/oJ2ZqoeDqL9IFW6c5eXqcSoS
	 ZvP7PdnxLyEYoIl9LbxrR/x/7f/KceaBNypq8lAtv5IfFXz9mrmoHCa0f/6SzM9PGX
	 9VxDQC7wxzx+Iw9kOZErIQzrFz8rfsrs2yTmpNVzlGad127q5UoRiQfjO1woH1+71k
	 afrzJCEZSYRbG9Hi5ULNnA3+o5AQwtbsxcmhkgpoRbpdY2QFKWNJGNddbJm+XTC/J4
	 I4MkaujLpM/hqg7oP7CaQcoM0Hx/qBqWBOxMsWoX+Tc9/d6AiWwE0dT1jhdEepztPF
	 ToqttauAVdLbLJRRynGtA+hkxL2zrH5fl8C4jNtu3HovCAaOYhc9jh8SVZtQ2gdPhw
	 F5RTDsf/7f7Yp3lHzdm5cfIU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 28A9F40E0140;
	Thu,  5 Nov 2026 02:14:52 +0000 (UTC)
Date: Wed, 4 Nov 2026 18:14:48 -0800
From: Borislav Petkov <bp@alien8.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/amd64: Stop allocating ECC settings separately
Message-ID: <20261105021448.GEauvmmCp0LeSCb7N2@fat_crate.local>
References: <ardZinoPZXbXZvhe@google.com>
 <41de3d396f470cdbb944ef521dfdeb4d@gmail.com>
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
In-Reply-To: <41de3d396f470cdbb944ef521dfdeb4d@gmail.com>

On Wed, Nov 04, 2026 at 05:24:03PM -0800, Dmitry Torokhov wrote:
> Hi Borislav, Tony,
> 
> On Fri, Sep 25, 2026 at 10:35:19PM -0700, Dmitry Torokhov wrote:
> > There is no reason to allocate and manage ECC settings separately when
> > struct ecc_settings can be embedded directly into the driver-private
> > struct amd64_pvt.
> >
> > Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Just a gentle ping on this patch. Could it be picked up?

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
