Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7436F8EE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788209434; cv=none; b=T9Hs7UDd/78VypqtPwat3XSab7c6r41U40DhMTZFvLuPQCzXNKVZpVhBfHdaA+YzngCbIK/XTlhHOpRMdVYC76/u0MptVfo+++0OObXZN4Pc72uwvu4nwXIwg7OdHsyt6O2IJiFuqZw0dXSIUYH9Bxf0/mPzkIBGb0NVFh/OSd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788209434; c=relaxed/simple;
	bh=/uiZ6RobyXM2peiqPXOickKHBsj1UjHJtCPSrbeJwnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldiRVzgxQ/+VU5PUFYs5WJNn4E9SnUQeHc/LZyhmdCz50njEcEgJAU3LtQ6rOzYBIfzb903gKwVf1DKzX/QPMfhcPf8GgDBRWfylEl0OV81VkMmyM9MRYS6pK1dfAHC+i0E4yUAY0aktKBKdVqAX8ZbiZkVuT3P4qUdqM0qp0OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV8CJneH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV8CJneH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE8A1F000E9;
	Mon, 31 Aug 2026 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788209432;
	bh=o9izLyMp/5i2KVR8HOm1zZ4f9E3YGtMOgojviQ95lSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CV8CJneHdMj4Q16XsW4JGLt17n4ejprHffEe/4jovFLmTVdNKI9G3tCosk828bLMf
	 USoCxIqNNKXexEwK4llgOF6FHg0eyHr/uhrKdnbGHRRiSz14/XyreIDy10VJXpbM7Z
	 hkE7LYGFVbdSvJfSO14YDPtkgWDpSWAQ7avTDEag62tXd1h3sockqMhN7gL/pgubqy
	 l99o6j9LJ+EaVd1/9GUA7Hv233BD8ngMq+7sJRCw3ez4Hed3tGWg3OSnyG+Fd4ZZNo
	 qo+tN0dLTq/bAGPcZFztGOcWhN/nb1D2Q5dWpecf3e790Mlvh8iVQrVJZdb78txmQR
	 hbtOKeL6PMKvg==
Message-ID: <2b5dd31e-396d-400c-aae4-4d476f7ca880@kernel.org>
Date: Mon, 31 Aug 2026 15:50:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: socfpga: select the PL310 erratum 753970 workaround
Content-Language: en-US
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260830142244.37216-1-pengpeng@iscas.ac.cn>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260830142244.37216-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/30/26 22:22, Pengpeng Hou wrote:
> ARCH_INTEL_SOCFPGA selects CACHE_L2X0 and several PL310 erratum
> workarounds. The 753970 workaround is still conditioned on PL310, but that
> Kconfig symbol no longer exists, so this one selection is always disabled.
> 
> Select PL310_ERRATA_753970 directly, consistently with the other PL310
> workarounds required by the platform.
> 
> Fixes: fbc125afdc50 ("ARM: socfpga: Turn on ARM errata for L2 cache")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   arch/arm/mach-socfpga/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Applied!

Thanks,
Dinh
