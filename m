Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146119;
	b=XgdY5QwUYQr8k6CaavN++qp5Wzf3WBE8aCe1AnzVZDqvYcOjfrkZ2MjBuzeSrrqzVtpz
	 G+3HjB36H4Kl3UJ3QqtmQ+wlml3T2zjHAx4XohxnzIjQFjjN/aI/uJZvFZQNVJb6epE2O
	 Z6HHU8qxRquln+h6R3SqAGNENGy7huiMDWC67XUBQcgMX/t7JIxXl7n+Wjym9K/kA88jD
	 5vBSrjl19oDrEnUA2UB9HzTK7Y1ewkfmNRJqy3GUbmOkIRtsZbkN5SnDNC/M1wCVkWaTs
	 cmDfOvnaVhz+oUAsPpu/2DKYkbSw2APLnha4Bf235uhGjozGYWRuExrUFNgIWV+6lYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146119;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=iq6M7R2ys4toviMssHWG/g5LBfN4at7BOwqz+T93lcE=;
	b=vqFGyJSOuOa1yUczQNKEyCZbzraVUpO7jlQJAhyf+QR3PLSCTVS/6eJxSUsux7uVxjTA
	 0kZdZCubs1DFQ/E7i2W5CIfji6Uc/jcS7Lya5k0R+1BYHMZ1JZvYbnOcAH6+p1uqHRjO/
	 kPonQQSUn1Oqbkn7z7VQDbsRAL0Y3eCcaylCRTEhF+4zkQQyVoHNEzRMr45GhtcqXziLL
	 aVxpa++s3WFap5WIPQy5V6hehsT3CbGWkjglkuYYE0OfaTsAfLdgF5Y0Q6Vibg33FkrPZ
	 42RmH2LVbbZBXrxERjn6+mF6JXO2AdGHgjH33+xvJLFk1khFB8mNmZimW/DqIqkVHlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mu2zSSPd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971D606A31C;
	Sun,  8 Nov 2026 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mu2zSSPd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C191C1F0089F;
	Sun,  8 Nov 2026 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794146119;
	bh=iq6M7R2ys4toviMssHWG/g5LBfN4at7BOwqz+T93lcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mu2zSSPdWp8VDqLlHAgN8UJUzq6zjiWZUoP//mzvyV/fJHE/SFiF+DtdWsVQUkubi
	 gFghQ+QmBWTwkEjoYPrdWB6CVqGjFgwWLz4ZFP3yH67sdRF1zumcKVRu28ZkuMStTZ
	 BxQpsy80q1Y2iKnMJJ0aE0sShh7lVD36qTbPwvsQ=
Date: Sun, 8 Nov 2026 08:55:16 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: aleszlucero@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Subject: [PATCH v2 0/4] staging: octeon: Clean up
 PHY interfaces and fix race conditions
Message-ID: <2026110822-unbeaten-unraveled-698e@gregkh>
References: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>

On Sat, Nov 07, 2026 at 08:07:54PM -0600, Oscar Alejandro Sánchez Lucero via B4 Relay wrote:
> This series provides a comprehensive clean-up, documentation alignment, and 
> critical bug fixes for the Cavium Octeon staging ethernet PHY interfaces 
> (SGMII, MDIO, RGMII, and SPI).
> 
> - v2: Consolidated the individual floating patches into a single 
>   well-ordered patch series as requested by the maintainer.

Nope, you did not do that at all.

> - Investigation: Patches were identified through manual code analysis of the 
>   staging driver directory, inspecting resource lifetimes on initialization 
>   routines, checking error rollback pathways, and reviewing compliance with 
>   kernel-doc scripting definitions.
> - Testing: All patches in this series were successfully verified and built 
>   via cross-compilation for the MIPS architecture using the mips64-linux-gnu- 
>   toolchain with explicit W=1 compilation flags, ensuring zero compilation 
>   warnings or errors. Style formatting was audited via scripts/checkpatch.pl --strict.

Sorry, I can't take any of these patches from you for these obvious
reasons.  Please go read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

