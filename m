Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C73515886
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801343; cv=none; b=jTaV/+rZeii6+b2+mw1IBoGiN0C33CRO4rsAJGHpHyfIGkzD497ogOAK1Lhg6JTXtY+App6b9GmiAK2pVF8SwemCJzf+rCVvUWCe2rPn+waizjxt+KZXj8elwb1ks1jN2zpfONDHlagIuwd1FKbReZKmgrkStMs4GwHCP8Fcyvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801343; c=relaxed/simple;
	bh=7cw+2uirxLu0HD1zySTwhFF6oAhV9dULExV1Z7f8/aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUCnyICicjFLeIIbTWTshtUy1OwhGbRTOaZHyrY+PecXoia6w0jU8T4wkFrPtHmlvnEEsSM8/fppMzsECwkvKLLyusp2Qm9bXQNmt4JUyrB3Ek/i49hqkA3zN0COgkb7jz1IH2n5jJB31KEwlK3HhAIsTYlSsz4q6LE1zJSaFpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Oh9MNxSR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Oh9MNxSR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1901143D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:48:56 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D42393F85F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790801340; bh=7cw+2uirxLu0HD1zySTwhFF6oAhV9dULExV1Z7f8/aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh9MNxSROOG5bjdAAi5KWC16fsF2L0ElsgVkNR5DVic5N/o24dN9YeQfLEzSvOlwa
	 lCzYvZjWeTQDhjijfzrph++2CVx0XNcVmbrkG4oQO8Bvfb8Dao2cgNDbVA8SwPdu4p
	 qgyd1yZxc3lp9cwmnnQ+Mz1gFeDEkNUFlefUR0Og=
Date: Wed, 30 Sep 2026 21:48:51 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: vexpress: fix device_node refcount leak in
 vexpress_flags_set()
Message-ID: <ar11s6PaXaXhiswh@e142607>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
 <20260925173252.933705-2-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925173252.933705-2-geoffreyhe2@gmail.com>

On Sat, Sep 26, 2026 at 03:32:51AM +1000, Weigang He wrote:
> vexpress_flags_set() obtains a reference to the "arm,vexpress-sysreg"
> device node via of_find_compatible_node() and passes it to of_iomap(),
> but never calls of_node_put() on it. of_iomap() only reads the node's
> reg property to create the mapping and does not take ownership, so the
> node reference is leaked. The function runs from the __init SMP prepare
> path and caches the mapping in a static, so this is a one-shot leak of a
> single refcount during boot, with no functional impact.
> 
> The lookup was added to drivers/mfd/vexpress-sysreg.c by the commit
> below and later moved here by commit 9b06fc39084e ("ARM: vexpress: Move
> vexpress_flags_set() into arch code").
> 
> Annotate node with the __free(device_node) cleanup attribute so the
> reference is released when it goes out of scope.
> 
> Found by static analysis tool CodeQL.
> 
> Fixes: 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
> Assisted-by: LLM codeql
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> 
> Notes:
>     Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
>     hardware; I have no Versatile Express board.
>     
>     The CodeQL query behind this report was synthesized with LLM assistance,
>     and the fix and changelog were drafted with LLM assistance; I have
>     reviewed them.
> 
>  arch/arm/mach-versatile/v2m.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-versatile/v2m.c b/arch/arm/mach-versatile/v2m.c
> index 79afdf2a90b6f..c86b38386cf7c 100644
> --- a/arch/arm/mach-versatile/v2m.c
> +++ b/arch/arm/mach-versatile/v2m.c
> @@ -13,8 +13,8 @@ void vexpress_flags_set(u32 data)
>  	static void __iomem *base;
>  
>  	if (!base) {
> -		struct device_node *node = of_find_compatible_node(NULL, NULL,
> -				"arm,vexpress-sysreg");
> +		struct device_node *node __free(device_node) =
> +			of_find_compatible_node(NULL, NULL, "arm,vexpress-sysreg");
>  
>  		base = of_iomap(node, 0);
>  	}
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
