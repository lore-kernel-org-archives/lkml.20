Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445745;
	b=iPFPifV6fXDy9I2pMeMDMVakFgLXRY8taO50chrg1Reb9cBuAS/R0ZvM96ThdgAk9QTl
	 l7nRcosVuYHtxWN06QU8/ZsFWkp2Itjfe+XT+x1Rr1s8e+UKtpMHyWX6/+Dws0qae+cL+
	 wTb18WtDKNbPGHIHO+he7jLCMw4GfCL/XimclYtb+QZ2c/vo/1sbHuJnrOvt76gXroraa
	 /K+SVrsQS3bhSAhTQB+HqMI0lOCne8fpOAtBXuJnQyytS55ffdZ67/9JmvVgxjWV0aQjX
	 NLSjmt+X21IGchIVjIMJlc5y8c+WZxj7rdl1Ea6+1k5AVX99P0bKzapc69Nhc79bctA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445745;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1qEZivztIKOLrsjPrgUw33BYXR9pb4u5TrZ3uAfthG4=;
	b=a91n3f6/TPbIyP64duWA8e8PLEtJl+FmdfZKorMRi9JlnuAUV1WVNKcBTyQmgX7ZGPMA
	 mF+8bTKFPn8973omaOONWsjv4ltYtUOVYAiQwXeFxgm5ijpEXjwhXDZp2udxcXrgjIw5B
	 RFkhsHOPHE+4yshXnoTiFeJbOvvXXsvONukziwsPnf5izdx9YFt6Mn1CQdevP67Snu2QA
	 l6cLd6JcJ8j0pCmhylhjJoFjJ1NTcS56QrEdaHjZgtbttk1yAy341JkcFyu5ZtLG1/Ku6
	 4lW9gQ/VBctMw1wyX7KBWNtuguBphNgI9BO7pWGEhWFXlZEwkKNr5EWYdJH2MUNYdRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEv2Seq5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022D8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEv2Seq5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D90C1F000C4;
	Mon, 19 Oct 2026 21:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445744;
	bh=1qEZivztIKOLrsjPrgUw33BYXR9pb4u5TrZ3uAfthG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEv2Seq51oYnar7BMQy/Nay5mHX5jtbz6S9YMe5P7Z4fpLExSwBITqElFD/ivOW31
	 bVJOVjKZL56+dyU422Jl9WtgvkSANfzj23zmbOE4wNBd/Kst8P4m3NIYLTIpT3GSSb
	 IWTD0FLGGXfA6ruA0UwE8UtHlXoDFeLasPRF+8z5TAeERKZa3LvmUo/QL4kYiE37q/
	 UYllbDjK8d9gzwqZDicvYUmMNN6wn/CbaqMNH16zsO49hf2vZ5iRmMmb9DHWwlUXJI
	 /fcS9bEjXXJbSwSFd0zkeK4HXOBx9iMdie5/uS41w047fJ1rm6RtOtV4WQzaJopGMA
	 MGSppocBrKcBw==
Date: Mon, 19 Oct 2026 16:35:43 -0500
From: Rob Herring <robh@kernel.org>
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel: ethosu: Fix kernel-doc for
 ethosu_gem_cmdstream_create()
Message-ID: <20261019213543.GA4157247-robh@kernel.org>
References: <20261012152118.33548-1-sinha.aryan03@gmail.com>
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
In-Reply-To: <20261012152118.33548-1-sinha.aryan03@gmail.com>

On Mon, Oct 12, 2026 at 08:51:11PM +0530, Aryan Sinha wrote:
> The comment documents an exclusive_vm argument the function never had, and
> leaves out data. Swap the two so the list matches the signature.
> 
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
> ---
>  drivers/accel/ethosu/ethosu_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
