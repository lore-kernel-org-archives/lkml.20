Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B884A68A0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150100; cv=pass; b=WpHS21kLFoBcJ7nbruRLgu20KgozGAWEOepvxW3+Kby8X0LqG1sVCC83OipUY87ok41YL8FdW4Qq+nya1bc8qntq6i4oU2zAVi5VIIrwlpK4faf+QOnroUFDUQsm1gyfqecN0vqI0qnpRYn7Gl4jwFVmDXsMY6htoJzz66kOkYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150100; c=relaxed/simple;
	bh=Vhnjxh1HDobVuiEJYIJm79PAu7Y1XNjwuISN/rF7iDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnigH2OB6qj+imjtIyUm7AC0ADqVrDBAvEoKsRb9LoLTWPjW7qQSisup82ekVuf2CbPJ3wJa0f6lM7RoEd+NZsy618H+4TlERk1UAVrl7RYnw9xF/dU+uNH9pStEn+ZbT8squzbSZFvwUJ199FiGVr9Jc0RxdQhA7qP4oO4n3ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0qPQ/g/; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0qPQ/g/"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a5a0703ae7so7524911fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150096; cv=none;
        d=google.com; s=arc-20260327;
        b=Tx1guK/IaBsJdfWbUzMILHC3/fkW+NeMRS53DbsUYo7UisavqYfydnDgd2JUhEVz34
         7IhmDsNtPAsPAu+RcOgQcl6TOAn/Uj6go62Vw7boJ3YTAOPS3ckyW0CY7Sh+Uq+jsjpk
         0sQgNwPUDnzsAYga3PNav4zLab2hpHGEMx7n3eFZdRStY7ZCsMcsjfe+mRAh+yxEZX5T
         5aND4tN7DqLssAnTqHrETATEQvc4RzGJSkWW644+b7S09pMq1ueyr3BM6bQtMJyHuzWn
         kHCm5BEZ4oSGrNPs5/l3IxBlUeyAHwn9CYeA1/2aoHMrQMC/8IHDAJpzXj+a8CxvODLC
         cYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        fh=GOGQbxhQX8RPp7Bd8/rH42AhhxHjvMLfttjvxCmJKhU=;
        b=j5Rni970O2WHZ1DYFlt6lVuQLQUAg1QxpXRdfwEcW0WFVZw18/cbNk5TbofebcMmA7
         RXy76L5RAVHVjaVBJ2PeyV/4v2LutsNn3poEGQxRv+afs9BtGryK5CFcT0s7SpoYxvYf
         jdNUAX2RaZR07asUjaqF5Cs6UFUGn9drsxXH4RWNZAEAGyK3XRWxtxMIs2fyOfRMyDcB
         6ikgTI4WQV0i4CZj5VJZ2Y3M4iAPOLTeJIDau1af3Bd/jUCOLXOrtfmxdNVp1yxHElCC
         WBMK8opUsccm4H2akpLK5w/ClHFsuGcFb5h7Ux/qVXwimkDArhhzeNLioJ+gSYhXVFHt
         dJ9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150096; x=1789754896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        b=l0qPQ/g/9zteRf65RiOvlykq67P8LZojf6F7srr+GxW/54c6ya0LMwC+JFGKXATtak
         dN8oRvm2KhXDNlep6q6U5Es6JPOed7l8DGhuD1OUKLtNUFnq9qQhwpqqvf2oSjGdTN0R
         g0TDYyp/3MxYhE+6c82CddRUnOr/350/xZEZAOGMcC3vBWL/YvmVpN9xwfM4UMzs5rQJ
         4om9UOT3SsfQykIIu9lBa5xQWYdAyVuxBSec9m/VFunbJw/GdyaJcg+PVNCCoLe2iRv4
         ZZSejNEFGvBQC8wLkadmN2ms6lL7OzJ47qtgqte+yn8249T3Mu79zqPO370w7p+idzUM
         zUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150096; x=1789754896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        b=hMc1n0aFgLLiv12SgVFrfY7IQ5wf/ikpDszxq0CCMo3pyL/9HdEf5KUSg1zuj5nFpt
         njcqBnHAtsD82vUIJP4guo9y1FTAo7YMFmY8mVUkWR3xelMcTSatrYrAZ7faVYt81yD2
         /FH/ajTUJBI1rQqebs9ATROXiles/cMyseF3LMaEqxvJuvkTIglTIQ1M2fWU5eLCG/Co
         HZt8AkVZoMPpOWHQ42HqfnlS8Q7HSDKqk7w0/1WzBfORrDvym5qfGU4e+G5R1Oujg3nZ
         GpFAXc/ApCgbiKurgx2EaJ/Nb3/wpWpsuwAz4wmAu17fc6MGi7C+pZa7gEKKJO7G6qx8
         lp0g==
X-Forwarded-Encrypted: i=1; AKwUvBzefZlZDxNiIXBfomDEaa2ZTPWj1qxvVkG17H6sHZIwjw9yfW+jnxsEDcx2ovywQwu8hvc9gJVI6GdHfuE=@vger.kernel.org
X-Gm-Message-State: AFuF++mC8opURLMx1hxs8lXfKLp02TN+23T4WGDztPJKytsV0ICSEnRb
	aI2AVKpkQ0iPwwR2Ygf0YTsSCx8/vwLvYOQqelgUf8CTMZ0gfBc9YCLVcz7hDTdPwqZSmDQybE3
	FtM3+Z/BqJLbuiSrWiS6BETBBZtYZn1E=
X-Gm-Gg: AYBFou2wDCQ9EmlB2TZJ00g/VowQM8OYiUEVyjoUfdWo7VS7Jce9yYL0eWUcuHF44xn
	DGs+121+IQJrxYP5y9pbPAxuA/esoEHEejYTP1dgKCR+25LxPeRKHUuGRXcAmd9ecbRn0hlI+ue
	asIfjiNCTKUm23Vj1SClTrk8TAH9UbKmjYLPZfBhTFEbwCObCW8mN1Cm/kObltx9D04rzi9976i
	yGOB5kXF8CvE1LRZuAPsPgL0kGTX4HfB5U7NqI0UyzPqWgaguKAtLEKGQ6aSQgHPa4J/xynMHav
	KW/Yvq93IyO3YvTgI94GFHRg7anoakUKNLzRVq6xFc4W6h5g0QIzoAofMuYf/KuP5iNPVANaDFl
	fuXdS5PZ2gpBfbPo4KYnDNg81glC88ZKO6KmhFlMNUiQQm4NUcG+BKQ==
X-Received: by 2002:a05:651c:4cb:b0:3a3:3fa3:25a6 with SMTP id
 38308e7fff4ca-3a591060d33mr13539661fa.3.1789150096131; Fri, 11 Sep 2026
 11:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
In-Reply-To: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 11 Sep 2026 13:08:04 -0500
X-Gm-Features: AcwNN1UL3Y1nd704u2MCWStPUxYAt0AKVH-AFaP-s9fmNKYucXoG44JF7P_CHrE
Message-ID: <CALHNRZ_i+yBeYqGnp8PGfpYdT8cU8ah+8qm3O2vpoTtEmUx-=w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] soc/tegra: pmc: Add Tegra210B01 support
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Hamamdjian <azkali.limited@gmail.com>, 
	Thomas Makin <halorocker89@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 9:00=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This series adds support for the Tegra210B01 SoC to the Tegra PMC driver
> and documents the new compatible.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v4:
> - Add venc to powergate list in patch 2
> - Link to v3: https://lore.kernel.org/r/20260722-t210b01-pmc-v3-0-1c5b970=
788f2@gmail.com
>
> Changes in v3:
> - Update patch 2 commit author and sign-off tag as requested off list by
>   author
> - Update patch 2 commit message to describe the powergate differences
>   compared to t210
> - Drop sata powergate in patch 2
> - Fix has_io_pad_wren value in patch 2
> - Link to v2: https://lore.kernel.org/r/20260720-t210b01-pmc-v2-0-ca5317f=
8507b@gmail.com
>
> Changes in v2:
> - Address sashiko report and drop duplicated structs
> - Link to v1: https://lore.kernel.org/r/20260717-t210b01-pmc-v1-0-bf776be=
8b3a7@gmail.com
>
> ---
> Aaron Kling (1):
>       dt-bindings: soc: tegra: pmc: Document Tegra210B01
>
> Alexandre Hamamdjian (1):
>       soc/tegra: pmc: Add Tegra210B01 support
>
>  .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     |  5 +-
>  drivers/soc/tegra/pmc.c                            | 62 ++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+), 1 deletion(-)
> ---
> base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
> change-id: 20260713-t210b01-pmc-1a3f8b908044
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Thierry,

I see other things going in currently, can you pick up this series please?

Aaron
