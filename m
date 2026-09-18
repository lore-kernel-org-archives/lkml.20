Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E681A3172
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702724; cv=pass; b=fww9Q1l42d75GMqWOYSZdIq/5HI2gkyGl9ytCDZacbQH/fq9N0GOgg8HI4YrgydmZONSrdl1A0zAmcGwxbz5Nesir+vM0cVU/d04ETkeiE6fEx+ym0Yi4VC9kXzDeas8NLsPZiSqiiCR0yCVu0VlLes1if5qCcrA5VX5fKMQ6Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702724; c=relaxed/simple;
	bh=4Ov6aFUtajD2x3CP751AsmHJB4mxaq0LPv9+FA/rt5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDF/jTtnOjUc5j7O1RWRjjIYbBycHmodNdHTkmfPZbUcvX/X6w9rMxLgnTpHchJTcFT2NTdpjiYbRlVnH1qy08PQIfywotqpQmmx8akjmGLvkhXpqpAVbF6FLSQVH43GpEVOQNhB6cyx50unYHFe1b7aegxOKlah/pv89ihSNzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5m849Ho; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5m849Ho"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcc3e14so1406916d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789702722; cv=none;
        d=google.com; s=arc-20260327;
        b=Q3aW4izsnq6Nrcb0QTXhMl6N5crxW5XiWNxVi3JBQnt78ifBBiGuKGDrLKYTX3e09R
         0jJZSB7qdeNRF920ymzzB4K6/52fbZ1es50R3bKVa3X5f5bMm2qxKBVZncz8FM4gVTmY
         B5AYcMRaSPtt7cnGNpcSh3kJ7TrWWmKOlr7go6POdYGAJgfE+8Fe0HcrcUy9EHG3o05U
         Jl0FD8HzyipRw6gjpCTRRQJolhZL/Sv3+fXevpJfY8Rqe5WruOwxxwqmphvj+8S3qifT
         McvJzZMsUbU9m+jZFYQyIm3Qcu6ShmfB5qy+g19AU8ludTo10Id+oumptNSU4Ky5GREG
         B+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4Ov6aFUtajD2x3CP751AsmHJB4mxaq0LPv9+FA/rt5c=;
        fh=YBCQK4gD54rqHDZWNfrum070gcasrhIc4LtjN29/M+0=;
        b=aNxBluNu+2u1IUy/LsaFEh4zyZ27A1TqSwoyKxLMjUQLl5JRrCZPUUewJ0u7OUI6UB
         cUG5uPQ8FLHpUOgvI92o4VUcDz3U+cRhIAu2Yszy1R+3viJ5X2s2msHTE2gE2G5qo9od
         4X05f7/Oiza/6nQtxfJFG9lnkLCFuM0ZWO6Mlxx7rG/yHF/+wVjkZSxaiSgggokVeiqx
         uatnaJpf9+IJrU6xpYRti2ZzVtAdovn6faH3r/TRWaYE91Zl54avBPAB9iooHndpreN3
         TJpei4MUqmWaC+RT5yX/DH3aVduPzUyVhkk4/5ALOL2rSvhwue/n/R+t4Z4sNyhZOguc
         oOQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702722; x=1790307522; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ov6aFUtajD2x3CP751AsmHJB4mxaq0LPv9+FA/rt5c=;
        b=S5m849HoxPpywYzdnLmiJJvx4GdlLkFrjKMDwMvecJiNON2CsQlY95FpZyzqBlKkPG
         VfC4W4LxSpHBMmKViWaSZuGO5DK8iG4qZXxTomsigX5RodiLeVzHOPJbepAaj3PGAn+N
         kotRjNhU8y9XZpJOcQBS+/sIpHR0a9FjowHPUedheRhgWVgW8rY9CnY5IROGbBpJV+wG
         2JiYm5pImA6yH6/dqHgZj8eHvlPxoOgI8H48fvDlCozSWErizMDaulfAbwsEBYwWDfEL
         THTpZrfqfBVuOuCKjuNBTHGtEQhlg01e7xjGVJdMOPfW89FkpgyUFo4sGoee0qB/rRaY
         0g+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702722; x=1790307522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4Ov6aFUtajD2x3CP751AsmHJB4mxaq0LPv9+FA/rt5c=;
        b=2mdtoaL7Mp5p0eyeDyMcOlrQ2VZa1KsEMTQliqaAlu0a1m5OY2XKuK/h17Gxb9229A
         GFFgePkIxRILmBIzCVqn6Ynu2rg1vcsl24mvUtrYfJqYViWlned9J6o0MLNsWXzpxKIl
         rHulqBTlnZg4+waAuqa65T0lNAmjMbE7c0NmVhWA1kvRDcK1E1sfE4e1P3nE7fSzgK7o
         wdTjK7e8xOtPZ2WKGhpE94e+cfqO/Q0Ch71zVQuvKQsxpN/70KNLKsvtrB+YuH3NJhLx
         aEjzNA9xFBT0si/tgdztypYgynyvM30nphVUGhgNFfNJOAQv7KOWDo5TE37DcaR9B0qD
         Q8xg==
X-Forwarded-Encrypted: i=1; AKwUvBwqYqM7t1TSTs9akZREY2mLGkJ/HoKbost5oc7zb6xv8kVYHCLuAcNpNr7/eSlV2YXNF9FDJ6Pdo/QooMg=@vger.kernel.org
X-Gm-Message-State: AFuF++kBItthWYhnfdca4W7Mezcg+nsUNTdTlq9Cz57HxjEjVhtXJrPO
	PS8XZzLvby3+5qz+SgsmIvZMqDh5viU+5vR9WCPAFcV9ZsxkZs9Odk098tV9Z8qpQ03slte4PU2
	5WHxvx95gvg+yNDswlTeOF6k7SqCTvbc=
X-Gm-Gg: AYBFou3nO97mpx/GVp0QubYHg/9IXNI0kgAENaAGkU9NRrLXgJ1A1dKYnfIfd0JqMFl
	kcXki9CY3WE9i8KdpQ79fgmhU7sfW90AshsSTRvE6wH+dIgi9kXCPrnVwWz0chrFc/yH1kLoPR7
	dnHVkapC/rfssMTyrdTxLArb77nDH8nl53gLERc9ayA//Ipr2RTp35dy/wBU+ekj2JaF09jrBRP
	OV/MnXkCf9D8GMC1GyYby2xPimExNnjAFe1NPvAQaI+bTmvROXz8GkAjmEoQSDSwUwgRYCbK7OZ
	YxpZqIvrGBbYP+dyEwmF3cSrDWrHSxncUg90cV3215PtvpeKR04xFWKbXeTJA9JVoRMmHSsjMqj
	FgZo74EecHFAZETe3lHjqHWZrI32GnfYuN1hl4fi1
X-Received: by 2002:a05:620a:272a:b0:939:e129:c348 with SMTP id
 af79cd13be357-93bdbc1d9f4mr157765085a.20.1789702722054; Thu, 17 Sep 2026
 20:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com> <20260909-mmrebase-v1-15-8dd5d4225d2e@nvidia.com>
In-Reply-To: <20260909-mmrebase-v1-15-8dd5d4225d2e@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 18 Sep 2026 13:38:30 +1000
X-Gm-Features: AcwNN1Wm1pTjO8Zn_ZHbQhmgXWGrtTW3gy9lIDVTkxKs3v48NgKYQAqx4Y5iLC8
Message-ID: <CAPM=9tweFRWWjCrkBKvR03BaRVs=N+-qw2ju0g-dgMj+S7Q=ZA@mail.gmail.com>
Subject: Re: [PATCH 15/16] gpu: nova-core: mm: Add BAR1 user interface
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 14:25, Eliot Courtney <ecourtney@nvidia.com> wrote:
>
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Add the BAR1 user interface for CPU access to GPU virtual memory through
> the BAR1 aperture.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [ecourtney: map BAR1 in NovaCore, borrow it in Gpu and BarUser, no Devres]
> [ecourtney: update for the VramAddress raw API and gsp_resources chipset]
> [ecourtney: drop the owned GpuMm, pass it mutably through map and release]
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---

BAR 1 and 2 need to be optionally detected and used. At least on SPARK
there is only BAR0.

I've been playing with John's branch on spark and had to rework this
code to make BAR 1 optional.

Dave.
