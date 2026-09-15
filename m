Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472936AB6B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496754; cv=none; b=Ef6SkE0SFRpxaOm7EwPqG9whPDZXrdJhHesfrHEsqWgub1KgWUed9Fxcz0Gt8oOFHmHDv9wtPYOdHtzOtWaivFt2s41GS38ZwF6JISL7qSJCTysJ8lvOBGnp5TlpQeBbmfr5r73LKPX6zFY6pUz2rhSiaR7XC7yLwa63/uFCE8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496754; c=relaxed/simple;
	bh=kKyWYIcgxcf6kiNW3ZoFFM/fwXUnaHyPcNMr7gqpDPw=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=uI1QDozGJnppO3hBKJlPyFNlpVrSvUw8B+rhCHALtk7SGamN+gQrss/xTUxEZvtwiWpoxX6HVG+jRvUekQEdjWAJ+S61d7yqThgpc7dkG3JjERomdp8FwnajVZRw2AezpDUkGsOYcslElf6velQ9Wl3wxUJ2POXAiGsXHnHqS58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cE6zLHlL; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sIm3aACv; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cE6zLHlL";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sIm3aACv"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789496735; bh=bo9N4ceUt7SzcpTRkiZbLmg
	s1rzhY+NEfFp3p7TdIBw=; b=cE6zLHlLjbftFVrCzSLiMZLtgOgjrh41yIoEZL0E9DsvhtG0MV
	2Dc0fU66UxIPMvtczwZA4NZ7C3XOhiYgLKhCAQDS6sYmtgs4iUPzmms/qsZiWNpmAP26GsTxU1n
	VcKqMiuMHDY+Ir5LNpazlF/iDoED7ZGAZQyTT4D6gJ22/27q2cnDG2QRF+zONSwea2rriJLXrOY
	tYZVQqm04ZhBTwiBYm2ScQPntcX7oB+ecUZu0dI7PUOEcSkOrh07oPorVjhqfrQiW/ZOiPyLNME
	HpjJmkIICogJ8k/EX8diJnb1WfJR0AAdqIwMhwIuVQ2wfGKDtauGU4dXUg+CJb+Kz1w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789496735; bh=bo9N4ceUt7SzcpTRkiZbLmg
	s1rzhY+NEfFp3p7TdIBw=; b=sIm3aACvqwXrEwbWxLU3PD1JytosPmxiA4a2oKX4SAoFvX5USp
	v3a7c4h/6ys218IHPJqz8+E/iiDLMpDI29Ag==;
Date: Tue, 15 Sep 2026 19:25:33 +0100
From: Bradley Morgan <brads@mainlining.org>
To: andriy.shevchenko@linux.intel.com
CC: akpm@linux-foundation.org, andy@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] resource: Replace open coded resource_overlaps()
In-Reply-To: <20260915085353.3518153-1-andriy.shevchenko@linux.intel.com>
Message-ID: <0D81679D-B746-405C-8333-CF0FF69E094E@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 15 September 2026 09:53:53 BST, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>In iomem_map_sanity_check() a piece of code resembles the content of
>the resource_overlaps(). Replace open coded piece with the call to
>the existing helper.
>
>Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>---
> kernel/resource.c | 14 ++++++--------
> 1 file changed, 6 insertions(+), 8 deletions(-)
>
>diff --git a/kernel/resource.c b/kernel/resource.c
>index 54d7199695fb..cfc1a00e86aa 100644
>--- a/kernel/resource.c
>+++ b/kernel/resource.c
>@@ -1833,7 +1833,7 @@ __setup("reserve=", reserve_setup);
>  */
> int iomem_map_sanity_check(resource_size_t addr, unsigned long size)
> {
>-	resource_size_t end = addr + size - 1;
>+	struct resource mem = DEFINE_RES_MEM(addr, size);
> 	struct resource *p;
> 	int err = 0;
> 
>@@ -1843,12 +1843,10 @@ int iomem_map_sanity_check(resource_size_t addr, unsigned long size)
> 		 * We can probably skip the resources without
> 		 * IORESOURCE_IO attribute?
> 		 */
>-		if (p->start > end)
>+		if (!resource_overlaps(p, &mem))
> 			continue;
>-		if (p->end < addr)
>-			continue;
>-		if (PFN_DOWN(p->start) <= PFN_DOWN(addr) &&
>-		    PFN_DOWN(p->end) >= PFN_DOWN(end))
>+		if (PFN_DOWN(p->start) <= PFN_DOWN(mem.start) &&
>+		    PFN_DOWN(p->end) >= PFN_DOWN(mem.end))
> 			continue;
> 		/*
> 		 * if a resource is "BUSY", it's not a hardware resource
>@@ -1859,8 +1857,8 @@ int iomem_map_sanity_check(resource_size_t addr, unsigned long size)
> 		if (p->flags & IORESOURCE_BUSY)
> 			continue;
> 
>-		pr_debug("resource sanity check: requesting [mem %pa-%pa], which spans more than %s %pR\n",
>-			&addr, &end, p->name, p);
>+		pr_debug("resource sanity check: requesting %pR, which spans more than %s %pR\n",
>+			 &mem, p->name, p);


This swap is not mentioned in the changelog and it does change the
output a bit: %pa prints 0x1000, %pR pads the numbers to 10 hex digits,
so the debug line gains a bunch of zeros. Debug only, so I don't care
much, but a line in the changelog saying the print changed with it
would be good?

Other than that, LGTM

Reviewed-by: Bradley Morgan <brads@mainlining.org>


> 		err = -1;
> 		break;
> 	}
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
