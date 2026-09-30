Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5F44F553;
	Wed, 30 Sep 2026 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790802223; cv=none; b=EGA9eREjhxRhy1iURlNDbOp6HTUKo3pTw570+iUKaGZ2XAirYT+HQGZXFymQeA8nyHtsHMG7wxjBnFf67kCanbIGV/aGG+CIotn8kzs6WsSxMKzHP4T5ebIHtqkjqmMhFAtR4QoeEhrfuQEgUCUt9HsaNHPvqsciBXYD3vG0DQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790802223; c=relaxed/simple;
	bh=RKyGrRYFg754kBzRc3UUFsib3css+QEq/ZL24NJ9qLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ac6IVD7kGAOC7prrjnLw0rhcq0AQvX++8Mf+CLEfLWLRQPLgF3wc1zyqmhCJ35xyeocnCRRlwCRWPCv1TO78B3irJ8/pxzharq+PFmvWd/CQLnBGT7tDTKXwmyhnbrAlx7NzkK6FMngBZcmX+Qij4DkV18b+ZTWysCTrqKg632I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDEpMiGK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDEpMiGK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDC71F000FF;
	Wed, 30 Sep 2026 21:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790802222;
	bh=WVuBsQh0bGAg6b3sl6U4sipPK8BPmAIvZtmKuiU5OvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HDEpMiGKX4cBOE1X0KlcXXKLJnccBhJ6Gu0LvRqZydtHCuqNqHf7bVbT1r4+ORrS2
	 remuFVmNKpdev6d7eyozZHefX1vB5gcNWjsizRWdTBvlglsuw06xfedW5ZebH/dCkU
	 k7wQs3NgwDXjjNC5VGM2kEaL8qiHykwrwvKiU919xLBou6XOsRfDsBld35KhAIdabk
	 RCFUxZwAIcWHkOXTMgSvqYXBn58SWUgys87cFm32nFgQUCJl2Au713wJ+EkLAEslFB
	 cA3wkY8GKMPsTRx1IMbA3vSXjRy1vQEHWmWLMLF9zTH6dLg7QAA9LZVo1vnbIcQL+T
	 Hmz2bI/h2xPlg==
Date: Wed, 30 Sep 2026 16:03:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] of: Put coreboot node after compatibility check
Message-ID: <179080221955.253092.2178461123666954664.robh@kernel.org>
References: <20260924011358.734722-1-oss.patchbox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924011358.734722-1-oss.patchbox@gmail.com>


On Wed, 23 Sep 2026 21:13:50 -0400, Yuho Choi wrote:
> of_find_compatible_node() returns a referenced device node, but
> EXCLUDED_DEFAULT_CELLS_PLATFORMS used the result only as a boolean and
> discarded the reference. This leaked a reference each time the
> address-cells or size-cells warning condition was evaluated on a
> coreboot system.
> 
> Use a helper that checks for the coreboot node with a scoped reference,
> so the reference is dropped once the check is done.
> 
> Fixes: 8600058ba28a7 ("of: Add coreboot firmware to excluded default cells list")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Changes in v2:
> - Use __free(device_node) in of_coreboot_present() (Krzysztof Kozlowski)
> - Switch to my oss.patchbox address
> 
> v1: https://lore.kernel.org/all/20260802023821.494178-1-dbgh9129@gmail.com/
> 
>  drivers/of/base.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Applied, thanks!

