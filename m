Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858365;
	b=ey0s0fA9J1+zP8reBp/ctJU0kgoQiDjSugdMFTDrxm8LPNN280RbmygysMr2Law70fn5
	 k1CX+H21NwqE09j1Ytf3VzZXqZ1E0xXbIRznLovYcySU8UmLMQhe59/n4EpQQtWatQqiu
	 i9yDlsmdv9tCt+f2EDRQBCIGSjjk9b5xwrIxyGjO0TehhCHFFoBpO0jy+daNU99K3nW4Y
	 2yU+Ye47BqcPD9uFlCJba7dkHjjscVcL2YLYJ18WlrsyC98txPIAByiQmHJYRbW00cnCh
	 8ED7wQwMLuUU7+8vpcXgnKaBCXSgsJtd+yN3K9nsq7UUXKE/oMfK0l9v7shcaHfgyqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858365;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Zth0Y6oSyHMC+KMbtHEQCSeMMwH12xJ7JeHMhVyP3EM=;
	b=HAS50QlOCIDyXbn8nedThYfGBdSGQzCwNFiWAM3BDSt35GjqR14bfcCpPFBqP1BUMaKM
	 8ZdAMGsJpd7CBLDNB5hS+tkfcGXqAPkyw6G4TUqyZ0CQn97LT8bvxNgqoPzRzV+XW66Px
	 bo0f5OH7f+Q7T8SzK6YVr0SEG/DWG9/cKMHeuzssoh4Eas+WzRvuxE5mGTTsNLXt/frxC
	 T0zb0semeZ6QGN8v7i1GMT6FyqFg0nUFsuMMrw0WfIuVjfOK1jv1optfseI9GWrATaAbI
	 mVKNAXUfiUFBmxYnINJoBKja9a4NXpLEosmHhiQ2PoxhVrRp1Et96A0qwch7ffUsPVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ay4xwc/U";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 93E07606A31C;
	Mon, 16 Nov 2026 19:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ay4xwc/U
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9205E1F000C4;
	Mon, 16 Nov 2026 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794858365;
	bh=Zth0Y6oSyHMC+KMbtHEQCSeMMwH12xJ7JeHMhVyP3EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ay4xwc/UvqfWEsw3VsBIkMmWMZ9Jq+4o4kDUtj5+DkOGNPrhcCT8M6iVc+9iRHjLr
	 AJnvztMdBQJjVh2WEosqf8CZJf/9xKgkB0AXAmvgqM7vFPpTrkrJmwi5ECW1FLvIVA
	 fPtYXB4wBCzOT5AN1rSBaVs6ZX+A0XN12DIDkZkwS7AaleBs5ccpJQhEHXG6spCYcz
	 /p9TWdGFPPsM760Cf5klfPNcuOYiJD4KhhpdaDzfoRx3p1Pxx09/hjEsec4WuQn7IW
	 7xyU1XO/FnWU83TCxyNKwp0Hz24410XuZKgO7/zbMm22bpsSlZ6Dkm9hq+Nxm4G0Ce
	 3bDG5UnD/vn8A==
Date: Mon, 16 Nov 2026 21:46:01 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Daehyeon Ko <4ncienth@gmail.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tpmdd-keys tree with the
 mm-fixes,rxarray tree
Message-ID: <avtdedZFfQQXbm9f@kernel.org>
References: <avtYu0Ze50s_CtFu@sirena.org.uk>
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
In-Reply-To: <avtYu0Ze50s_CtFu@sirena.org.uk>

On Mon, Nov 16, 2026 at 07:25:47PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the tpmdd-keys tree got a conflict in:
> 
>   lib/Kconfig
> 
> between commits:
> 
>   37ff457ec4679 ("assoc_array: discard shortcut when collapsing a leaf-only node")
>   29f1617aa1dbd ("rust: rxarray: add rust xarray support")
> 
> from the mm-fixes,rxarray tree and commit:
> 
>   1dbbde3bc4b80 ("lib: Remove assoc_array")
> 
> from the tpmdd-keys tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, I'll resolve this.

Br, Jarkko
