Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8274367B87;
	Tue, 15 Sep 2026 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481509; cv=none; b=lOGHTSLmTjJOUPdH7VpuDBjYtRB/InDJhFnIDHsg2NvMvj9OhBrFjPzw3kQkSYeU5OBPsmFhGPaKMmlbFPPiVkGJWIH6bECyZ+ErsjZqEM0Y82bgxsmdmn8b1FkFgKonYGbcMRLfLZso/YmxDiNeOYh+LQe/MFr609QI0gNFFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481509; c=relaxed/simple;
	bh=tmdHITjgEFNV095eLRhh/jEwEBgW9Ixffqv/5FYxY18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuRzeb2yEBpI2I5fWZoJ5MR8E/azWG0nFH0F/eFa7BRA04xkhl9pYT4hn5z2ehHxhClw5S/FJd/33zQ62/rTq0Ifv2I/QbiUIxPZToHGxkWBOE2a0o3QRG1KxVe2QpceBKHI9+O5CtCGMhr9itiL+d5tX0CMdZx5gFCcmjsl7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaCoWtWv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaCoWtWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3972B1F00893;
	Tue, 15 Sep 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789481508;
	bh=qCkQz/iUXwREshp+HAcTgLNTl6UZe32TCH/dioKDq4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MaCoWtWvfMVCgAM5dwhCVTSqJI2ATERg+tM8rCm/jM3vBxA6cKIIrI4P7XohGzVKH
	 LTy0jvdXjUFiTf7JaCf6bKsG4j3ouZzqr3KlKcC4zENlexLvSPfPmqPuExlql42Uoo
	 +nQK0/A6NMBxvtIidoN2EdWjn7Ok+ZIWA4Qz8J7G9R5Mrq2T4kpjxYVk3r4vRZ9qWY
	 J94zWo62vcHQviPP+L4Z6DBZwugzVpG0/faCcEHNtzSVLsHQnAzxOZol43syMNkZJA
	 uEliLsvOK2BNXVrSCvyRWNMAcYwLQncHLRdu8XZRxkF15qNmIEymLcvYQLn/T6bO7o
	 2qbcBUAXGnL2A==
Date: Tue, 15 Sep 2026 09:11:46 -0500
From: Rob Herring <robh@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: fdt: fix "Cound" typo in fdt_translate_address()
Message-ID: <20260915141146.GA2864544-robh@kernel.org>
References: <20260909123501.215711-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909123501.215711-1-hemanth.selam@gmail.com>

On Wed, Sep 09, 2026 at 06:05:01PM +0530, Hemanth Selam wrote:
> The comment above the count_cells() call reads "Cound address cells"
> where it should read "Count address cells", which is what the call below
> it does.
> 
> Comment only, no functional change.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/of/fdt_address.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Rob
