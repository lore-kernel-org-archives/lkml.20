Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5710D3D524C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698664; cv=none; b=HJHqgifZ4Y6alDwSzNj4FztqHJxB7+aixKhjboXkXEg6s6AvW3Zv/nqJuy64Bvwmh90uuGU6hnqX6OyZ7y5cR5sLP6G7LevFr7dJcSpRKsMHnvv7royIlT9l6qQhpbVRw7y+NrQHecj9nRD0g6ej3CMquSlzL3yqf30ichFd9Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698664; c=relaxed/simple;
	bh=5HeemnefTHGpwjHmgTd7E+Qb27iOJN8vFlAkB586Au8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZATVpm0df2M10wMHGA4QCzDgXImiwPdrbe4CzWHT27KX468N4MGa4xPA1xDFnTqDzYYjF2JCXvT5CfR1o9tYdN3uTVM5NtkO3MS9MQZRdkMG8Xg+psK74eRtkIKoWcDYMIF2ACnUr2vieHb6OPVZpkcbfVLKhFHG4GKYqvtAuXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5FFh4FW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5FFh4FW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD0B1F000FF;
	Fri, 18 Sep 2026 02:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789698655;
	bh=LyEuyhMjybdKsrqgNnG3WNcZJLY74KYhr+Yi4PBNvdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X5FFh4FW0+DE8D8u2gfp+SVJDYepLGKxRb6zXmYAK/Rsm16mBGOx9Sp63TeP+sysJ
	 3HgI48/Yrr5x4WzjUu+uJxEUr8Yt5pu04R4i9/bEfGOvsm8wBPjwZ5F18vSws9cfAl
	 wZZ4hAHjYKsiwIFU6sLSxFZgmYumthBB4/QlNjyaXpxRmWKVyskfYNId4syOJGSs8H
	 4hw2BEdJQ9quCxDj9NcbbsMHc1LL4uy2KgLa0Q/xykks4QcPtO+HSrEIJPLIhT0ONS
	 fghKouZiMJNIi5VPcivBoyrKcQsa4uWxDZPtknhSjD/06/UWYo/D/T/PSWQguovrip
	 +qI1vGXa9QgUw==
Date: Thu, 17 Sep 2026 19:30:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/2] ARM: Use type override hacks only in NEON code
Message-ID: <20260918023054.GB1703@sol>
References: <20260909163319.2116279-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909163319.2116279-4-ardb+git@google.com>

On Wed, Sep 09, 2026 at 06:33:20PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Now that the RAID-6 code can no longer be built for user space, we can
> drop the direct dependency on the arm_neon.h system header, and include
> asm/neon-intrinsics.h instead.
> 
> Since asm/neon-intrinsics.h has all the type overrides needed to include
> arm_neon.h without conflicts in the uintXX_t types, those hacks can be
> dropped from asm/types.h, and so the file can be dropped entirely.
> 
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> 
> Ard Biesheuvel (2):
>   lib/raid6: Switch to Linux's NEON intrinsics header
>   ARM: Remove hacked-up asm/types.h header

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric
