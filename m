Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4533D16FC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457715; cv=pass; b=TAvlPLQhkugZlDY49zDRQx/IgmI823CA+q+Ux5MnMJqPmLz5km75SskKsbwx6XNaKmvRZLQANAIdpXQio7x14ed0n6VOVPwfMYWr/NVTApQLs7s9cO5HUi4UAXLsSKMxeWpqMUR1Yzrb1iKAyNNEJqx+IvBdrF515gV36hAeLag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457715; c=relaxed/simple;
	bh=tS8GOr7rQWkYMwitY30VlxqC6IwwevxTL76E8/wWKyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhtuU6+X8dPUl+MQP/chyRIlVNNp5MW3oKFMbVfSqeBN++UqRJDmLuu8Rs/9TnsKFtIaEOLxUesPbX6dELeOlZVZToDdxD28KtJzqHxj/WSv+vw3cour9kW9lx3d0ua/dAtsnzHLVJ/Hk/G8fpVi4zhFB08LqxjI5pKryC/bR28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CK0aaaSS; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CK0aaaSS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2945541a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791457713; cv=none;
        d=google.com; s=arc-20260327;
        b=QREc9kycESI/NOjaeC/DbG4Q4LJccreUFbCCtNDbyCttX3TzMQx526gEsvfFixBp2g
         +FrmN9Dwu/QSE60DTslUkScnhmZ3CNIkOHNXATRkScPBLx5M+AyNYpolFF5NDixDb6N+
         dkcU4ULHn+1MFS33VvBot+nkfG8malBji/G6XLtrVbSWSpdx/PJc+W21FyOXQcZeE1v2
         RHdkJZ4BSCzmx2pgv227MQZR3aTgxFypEJv55QqwIao9yVaYn22Aih8a0OteBHAKK6sl
         W4TSeUBMlv1ncmHltMqoBvOAqOOjR1hz3IvJ3Uzis1jSSfc2WObTtcBj6tOvcU7IRaHv
         VLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B38Tn5bOZ4ypk6OTVOr1ifEvTd0RxYUIpSKcn2uioac=;
        fh=CyivqLSoygnAOvZgSjA84w9IIMrVgsjYvNBGogvFDy0=;
        b=dkijvOTy1ATQsd93+Xes1uujhmfO1Qqv50jpiCxZnCw17rqkjbcjXLyvcJIzG5y19h
         SU+IMdCB6dbMDaMx4gx3OyKBtp+ZstSJmN+3/Y3JE9EJ7MEwGyPeG0e/w4l4KI/PXbJd
         +uNSzrhl4ywxYuk9v0403Ohs/xmWdSWLoRQD0je9X3qww6DigMK6exNWgsrM6dx2TrbM
         10ufVf433WZvVDSe0fNbmINZoEmR8lRHIw06qsrRPmxub9TksKCnQQGQPt4bCVGYEXWe
         wqgvgMHiuLFVLuxB8vysMo4AXS3eSAxcC4Mr2aF8XVF7sVuyG+gmLhnIjuG8Tg13oZaB
         paVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791457713; x=1792062513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B38Tn5bOZ4ypk6OTVOr1ifEvTd0RxYUIpSKcn2uioac=;
        b=CK0aaaSS95cFam8fOvFIAL03LolLwH9M92v2paGpuvzZWVLGifDh5pelUa4fX8M2Vl
         EmGlcUcUI1xtwYtUxU+4W+dLbIOPmIPePnpWkSJ1wNgmStzopQa+Zserq9TXeh+bXQya
         1Urn/ymmiMSIPXlC97tJvP3LRbZKcEaaJd5kAPa/aM6MhnDkLcGqjD4mWiRXH5tPbpr/
         22vNHaBvvj0TNMecngRyslMw2fymouAe9cR7ddFAqSM84UflBxTS9UiRZlmjz1uIugUS
         R2IFl9nzG9sgz6i6fey9cFbklIdM2vLeZ7QpHzyig2iJcAbESUF7gaZMhGS4txGD9IJo
         8+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457713; x=1792062513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B38Tn5bOZ4ypk6OTVOr1ifEvTd0RxYUIpSKcn2uioac=;
        b=L0BCqkGYsf59+jgBizILC5KM9ZuIjET7+WB/cZzr/GGWB5IVB0E+EHXL2vaq2rFbuK
         9OFC9I4iHV4fxynSS1BsVeYvVyS9VOOGqeBQYZLzawdJzLkXLPZyBi/19Tok5jO4148p
         J+C/wJ48QFiiaY2lT4v4+4ILEVG2bS7Axj5X7lKVbBatmvQeHM3P4kf2ayZBV/1Gic9o
         Ela4fIxObOkT0P0vpCV37So5/sO6NMYrbNyCLBaXnA8OWeXaftQUOzX56/mvY5ecpXAT
         TtzIgGQVhR6ZKLbf6ZA1yBKcxcDqsKv9NecjL6zqq7Dnn8a/K4YBVDKhUIyeHcFfxO4i
         Vo6w==
X-Forwarded-Encrypted: i=1; AKwUvBwS3F9qh1XOiXPspvkoJlbnyW5Mq4aTqUxx84kaYArpAtD+BEeAxe3B83GrWe46K2wuvnBDSisJKi3FGo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIlMK/DyONr1DdyeB/EE5LMi6ZP5niyHmpraFVD9yqzz82OEo1
	1GT6+DmAPIn/9+M2AC4BY35yutEyplYWxXsTvJykx5qRvQpZX4UILZ2BK8VPXLpJuARHWRKQ6uQ
	g+iO6NDihbj4hcskorlY8cHVoKvI+a0s=
X-Gm-Gg: AYBFou1DEoNVEOg3B8xzI8H53eyG+n3xc88YVwTIbyQm1mg/q69dXWHWYRuoL35oGZ7
	S8KlWff0Fo1f4f6f0YgGM6oB0PgTPXjrnm6IFPmQlGZsYmpuGrTwtxN9dyvkvaLZZkpCCKazD55
	l7bUxiSFyu8jRal6YJ6ZzX1NS01MZ6bMwnlCghQFKehcZi6vKGGF4p+DaFDUEcQw+jfC/pMFQxh
	plhlDVpRPlujuTZavCuNj9ubdNyTGDddNd1joNYGIppw8a/08EbsfBzDDIlCdK7rAQiWDMgQguS
	a2U6TAsE99bQRoxDLTEe8V+R1WzNd4PPAUiem3+F/j/a1XUtjFyyy2svbKtN+czQBimPTHsZ/g4
	s3nJtS9NmEqeT6eo9DDQZe04ANsUZp7Le1i7JoChsGYDalDlqCQ7llwX4XhkJw9+O5oU=
X-Received: by 2002:a17:90a:282:b0:3a0:d651:3957 with SMTP id
 98e67ed59e1d1-3a8a1c7201dmr2864732a91.35.1791457713546; Thu, 08 Oct 2026
 04:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104847.507776-1-phucduc.bui@gmail.com> <20261007204638.GA785135@bhelgaas>
In-Reply-To: <20261007204638.GA785135@bhelgaas>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 18:08:22 +0700
X-Gm-Features: AclHuK8M_me3PRP7AsYK3GSu3gkXR1O-K2dV5c57zcLYGodZRRQeb5VUpUwH-0g
Message-ID: <CAABR9nGNoaO-CmTcRvXuMMmGbVSWybKZVBRRZmzQCab_N1EzZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: tegra194: use dev_err_probe() for PERST GPIO
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, 
	Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,

>
> For future posts, please match the subject line capitalization style:
>
>   PCI: tegra194: Use ...
>
> And style as "PERST#" in the subject, commit log, and dmesg text to
> match spec usage.
>
> No need to repost just for this; we can tweak these when applying.
>

Thanks for the review and for pointing this out.
I'll keep these style details in mind for future posts.

Best regards,
Phuc
