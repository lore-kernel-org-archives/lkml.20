Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84753C5848
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492620; cv=pass; b=O/T/uc6pc+5pYB91FSsgbZiVZ2kBkTa0P6uI1Gdp7hxhEWBADkvEhFk2w/priSubzr6JZUQT8icBzkIgtPnKd4fz+yI6GMaV5uoHDyw9A+kN0c92l2ty/doz+hFwgSevyWcvwL3ZJXylbCLbewspFqyfDa7ChkW7BWlZFnobo4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492620; c=relaxed/simple;
	bh=+Ky5C/6RCYoPAglvjbSy+TobFX5nuSe8Upk7a3uWfI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMUBEAnkpuWS6CmRoIvxgK4/ZLSSjlSbkQu7e8zqm+4bXAcw8G/TBpn+TZKuykfd3wbFu3SRKtrxTZWtJ1Hzkc6VOlUk4BSsMpCGS9tuyu01b9+BPZCKQ/2GMfhC/hVObDCAc694rmPqRhNa5xygNuWAh8N1nbTRn4Bbi3dBqGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HstwHEgx; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HstwHEgx"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a6313cb899so26353841fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 13:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791492617; cv=none;
        d=google.com; s=arc-20260327;
        b=JdHrh1jjb92Mz0y8BYYI78IS1TqPCUb2JHhmEM75CUF0q08v1mQZnQSAJduWUXvDEG
         Jo6LtiZZlFmuX/6M2qi9/NW8fMyp4ap0llHaHqdpgS6mgxJF0AM10pf4T7OEuf6lZrIB
         DMFZQSwIo8LX5moaysK4iBU79KIXN6+UUBsFukyGKW2pmnJ70guV3Xt58PvuCExgd11o
         TkiVy6JHYOyAyLr06H0jOIaiuL4OlhfO64Tdu9Dx37Ab9rjxHEp37qS+WtpMYZnDAspl
         rkq+dYx5uWvqxzlg1viD5OHat5lQfXcj9R8UlGIPlpF92SyOzosIExzeZm75hlwrt1/T
         rJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Y+mfJq2Q8N5+Mak2eVOy9R5CAvJC/TP33cET0RSU8E=;
        fh=bXrbEhgRMyqxx2ItHSV1fr/fro8i7qZ8eWKhjCnjHDk=;
        b=OE5ZQn5nzuyHm115VDPlnqRx11NaK120uiom9vBeaaTgh8Uc6hNvr/H+/WMrz847QW
         EMXL8IffJpO7Qz83lSqx2Cqdi3zj1ROvR5qacZZt3ZhVDmyI9PJZTQHa7EosLtUWGQpz
         BIAWobXOLgVSXUVA/lZMFLlLnWsY4qFfx6/KSrYB/5bQUOPhX4FsH154k/n09ssAZp9d
         7Wg/1becy1gWEyLkpYfEOeak5qLRca8UCHbRtwXP6YnNlvTzqAv4WJ0QtSflp1DfrnCr
         RXQvt+D1kMtBl2VvQTJ8Y9jR5Hf/ZFMzGNwOlno4NI0Pr5xZkXlRWgO0t37VxpB8fZSF
         4CIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791492617; x=1792097417; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Y+mfJq2Q8N5+Mak2eVOy9R5CAvJC/TP33cET0RSU8E=;
        b=HstwHEgxtpn/54POm9e8WYzlRdPWAaKusJFF2/MrbEcRB6RvM+STnbNmPlCwM5Os91
         uQRIfUYMVTawq0UckIhH/IBi1YBNEociVs154LcRs2ey+jwoMaPS++RT7KAAImxIR1Vc
         fF8oddW0pfH04D+xrwTcRePA2foc/g1eulEIv+FYO2nJ4eCqR/Xo4zwcLmbNQka0DR9w
         1mvPyNkHgDam5AcxuYQczmcgAvflL5u7Dp45ea9qwPlvMIWJRgcmPZ3R5pMAHCy/j4Va
         wLNh9kepgHLlS3JkY2dvX9VDCu36GOg/tAHtp/LRYIu4NVTBtPCsB8oHyD0ms3rYv0+F
         kPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791492617; x=1792097417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Y+mfJq2Q8N5+Mak2eVOy9R5CAvJC/TP33cET0RSU8E=;
        b=e9vYBjX3/MB37Dk8nwZo4/UhSOj2fEfbe/+2mDpHVJy8ur4JrNtsqsj6Y6QfcVmo3C
         l9PygFvrZzEf3TTsSOwlG+QRN496RnA1lFqp6Hh1XDBI6ROtUCiXeOQYWNktGBVy9T8v
         XTqTkzg/xzyDD14w6tz/horVOsMQ69k9TJxUcoSgzTysn0NBsxL7Bxxu7cKjgWpcW5N3
         SxAi130ge3HnQlugedo+0AEmPvN66Ag9OEOC6D1zs4neBnE3Cj/r17hNiCG9YiaHpKcp
         CsrpFfXaotxhNYXXyQNRWbHI+cGflKInf6zhiQld1rXvDwx7FuLdIWwoYp6UADYfgm8Y
         kYuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2QMQ63f7gR/ISaGRIeFEBbNZi8HdPb9+5UZJiUa6gDYgvu2/pqwRcT40dnlqiVUaSwdFthdcJ/1o+Edc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJhTWY/fepMgzCi3jkCLTnHzZaZEAC28UQK9OUFTB6zBuZA0wy
	pf0HP7Fzm30nWnHnX3+w6zh8ShkNQTLEQtrd0P2yO03aKlz8KMc0oimJw4iztOXmwjstXuBQGJ4
	BtlIxcDA4Yv1NQnh2yXEwLIxdzoC99eM=
X-Gm-Gg: AYBFou30Tq3iLI6r4yOF2xvfRiUDe4OfpDQMwdoBD9b8YPHSBWBoMvJR6XulCgEThlH
	LMilfnT+CdYVZwZHMHdP8on4N65DLtWDgRqyvN2x1gzQ2FubRIalLC9GrqYGUrgY3+QD8T75+C7
	GMDZQbbXp9SdhpY8DJpA3/Ab6U4zL62wZGRDXP6APB4z2gQYxPpJfpjdCZbSBySvRPFfDeKaSl8
	89gYpH8OB3pPmDKicf7eTkZhQH4uiSRikv/n2HieG1M7Dyjecbw4sh10JbG6HESi9kRqgLUts4a
	B42yTAFqwSupnQYz6r31iM3XOZu8HBwAn02lI3wJ80DQUEHD6piyAXcXmaZZlkADtsVRy07IgN6
	sOz6cZYDNIbYLCA==
X-Received: by 2002:a05:651c:54f:b0:3a9:7b12:b35b with SMTP id
 38308e7fff4ca-3a9a2cdce44mr16039891fa.12.1791492616403; Thu, 08 Oct 2026
 13:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219205514.4434-1-linmag7@gmail.com> <20260219205514.4434-2-linmag7@gmail.com>
In-Reply-To: <20260219205514.4434-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 16:50:04 -0400
X-Gm-Features: AclHuK9UPXD6K5FX9DY4hrF5YfgulYHlXuNIz0cKjHqwtO0P0ypylPhzs_uPvgs
Message-ID: <CAEdQ38EQ_yoSHEKF12bfwmQpxDaU76YzKgUw5ipHz=Ux_bB09A@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha: enable DMA CMA support (HAVE_DMA_CONTIGUOUS)
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, glaubitz@physik.fu-berlin.de, macro@orcam.me.uk, 
	macro@redhat.com, mcree@orcon.net.nz, ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 19, 2026 at 9:53 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> +           if (IS_ENABLED(CONFIG_DMA_CMA)) {
> +                   cma_page = dma_alloc_from_contiguous(dev, count, order, gfp);

Two problems here.

cma_alloc() can sleep, and alpha_pci_alloc_coherent() is called with
GFP_ATOMIC by some drivers. This needs a gfpflags_allow_blocking(gfp)
check before going to CMA.

The fourth argument of dma_alloc_from_contiguous() is "bool no_warn",
not a gfp mask, so passing gfp makes it always true.

Also, because the buddy allocator is tried first without __GFP_NOWARN,
a large allocation that then succeeds from CMA still produces a page
allocation failure splat.

I think all three go away, and the patch gets a lot smaller, if you
use the helpers dma-direct uses:

      page = dma_alloc_contiguous(dev, size, gfp);
      if (!page)
              page = alloc_pages(gfp | __GFP_ZERO, order);
      ...
      dma_free_contiguous(dev, virt_to_page(cpu_addr), size);

dma_alloc_contiguous() already refuses non-blocking callers, and
dma_free_contiguous() already falls back to __free_pages() when the
page is not in a CMA area. That removes the hand-rolled
release-or-free logic and both gotos.

> +                           cpu_addr = page_address(cma_page);
> +                           if (!cpu_addr) {

There is no highmem on alpha, so this cannot fail. Please drop it.

> +   /* __GFP_ZERO already did this, but keep the old behavior explicit. */

Either drop the redundant memset in a separate patch or leave the line
alone; the comment does not help.

> +   parse_early_param();

This moves the point at which every early_param() handler runs on
alpha, not only "cma=", from start_kernel() to the middle of
setup_arch(). I think that is fine, but it deserves its own patch and
changelog. The comment is also misleading: parse_early_param() works
on its own copy of boot_command_line, so the strsep() damage to
command_line is not the reason it is needed. It is needed because
dma_contiguous_reserve() now runs before start_kernel() gets to it.

> +#ifdef CONFIG_CMA
> +   dma_contiguous_reserve(0);
> +#endif

The #ifdef is not needed, there is a stub for !CONFIG_DMA_CMA.

About the limit of 0: setup_arch() has already switched memblock to
bottom-up at this point, so the area ends up low rather than at the
top of RAM. Where does it land on your machines? Two cases I would
like to understand:

 - Could a small area (say cma=4M) be placed below 16MB and eat into
   ZONE_DMA?
 - On machines without an IOMMU (mv_pci_tbi == NULL) the area has to
   sit inside the direct-map window to be usable at all. When
   pci_map_single_1() fails on a CMA page, the GFP_DMA retry will get
   the same CMA memory back.

Passing an explicit limit, and skipping CMA on the GFP_DMA retry,
would make both cases well defined.

The Kconfig hunk no longer applies to for-next, and the select should
go in sorted position.

Side note for the changelog: with CONFIG_DMA_CMA=y the default
CMA_SIZE_MBYTES is 16, so it is worth saying that 16MB is reserved
even without "cma=" on the command line.
