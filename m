Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9364D955E;
	Wed, 16 Sep 2026 18:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584171; cv=none; b=burKCfXGqd/ePBTtjRzA2IbAIRhGmHjd9Fah4EOL4RiF4SkCuV5YfXUWAp1+T+AYPZBxYUe3bozqAM29atecXt+dcqPoNXAnnsECIZpPgeTpmxowH2Ij1L5K94etxY0VKCYG0VdvSJmIFtxYuwndDUAbXhFuWD5NwdjqCEhPPAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584171; c=relaxed/simple;
	bh=lPjjtmqnJglUchgaOL4jYsXRBuGjV8Yht5DViIS3aU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdWGGeMLtjIlC6pnj9YXw+fuylE/J4TfFj8mG4ajZIRDYBtATdhtXKrScUjRAtuACvAbOLFHojD/1jJRMJdXUuvB0Hfsa3aYsL9O9c+KXwBqxK/fGaww/GXmFIhIg9LqvuZLA6o2zC+9dk6kO06yHmzGw8ateRyUgVfpZcVtFeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RKHidw4j; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RKHidw4j"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2D2A140E015B;
	Wed, 16 Sep 2026 18:42:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rjjdhYwy2BQ7; Wed, 16 Sep 2026 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789584137; bh=r6nkpkxOOPXc36VIWKOe0kF3ujxsxvFLFZLBKxEyWQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKHidw4jpymLgsz+M6TVKrPwYE0/J9nuZv9vLchNY3cFN91nTBKyrbcmbEOjGvfjJ
	 U7hPDJV2lu3lsZ75IIpq+3o1MhYuWTh8kBp5iVrq4KqEDWfpX0G1vtB4fefPZMULvS
	 KzQ1Mm0uhX+LjjlwIc6nuTybQY0qa6DYzWI/hdDNXCs7z6LmVd0GPDzRoQAzK+k5sY
	 YMj+fvJnfpu/I9UZuy0OQ0S7tnlEHRL6cg7sxRvjXKQgVzR32m2qLNqevEnzTnaSSm
	 C1zSAICr/UtucUQpBh7bBTFrRwuOfwJh2kCg9Mk1p2JZdziCWK6REEHKZkjUZJ5tUa
	 ftF4snyGfBmnbuncTRWLYPkaneQ9CUtWyTj47s+WtpcSv0Ep4LD7HXNOq7N8Aj3nd3
	 e0sB/GTpzqUY+8bnk8FJc7yGO7Jl18B9bpMpIDtIqgneVmrKZUZ4HQuu4Ksj1UYPc4
	 Jv88BrbJ+pv1nhTnErLcG2vsT7RKk4DkmZC7TZ8iuoLZONMz8bJramkTULeyVYz6Gz
	 dHpzt92xaHexO3y+cgQnvdOPSOsW3rcLaOF7SvTS2rx1O58m8uZTC+GBV8d++l2qjj
	 IMpj0hm179z9SFvzl0EA9Zmz7tlCBif4ZAedP+Wxjf3uJDqs7WzouhzG6CWvEL7uns
	 kxg5UVKDwQ/txe/qhJHmR2n8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7F80440E015D;
	Wed, 16 Sep 2026 18:42:12 +0000 (UTC)
Date: Wed, 16 Sep 2026 11:42:08 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] EDAC/e752x: Use managed PCI device enablement
Message-ID: <20260916184208.GCaqrjAMcCatStMI4e@fat_crate.local>
References: <20260915015519.83833-1-mhun512@gmail.com>
 <20260915015519.83833-2-mhun512@gmail.com>
 <20260916012046.GDaqnu7sIhsWbtLCOG@fat_crate.local>
 <SJ1PR11MB6083DD32E4D2ECAB3209D7FCFCB92@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083DD32E4D2ECAB3209D7FCFCB92@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Wed, Sep 16, 2026 at 03:31:18PM +0000, Luck, Tony wrote:
> Agreed. Even if someone is still using these old systems, they aren't going
> to be running v7.x kernels on them.

Yeah, and it's not like we cannot resurrect those drivers. But for some of
them we're simply keeping them in shape and considering how there's no
feedback or anything else showing that at least someone is using them, we're
simply wasting effort.

Lemme mark them as orphaned and queue them - we'll see who cries.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
