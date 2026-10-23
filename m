Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792790019;
	b=vQJetawKAQI3JyxWLyHlOANmrNgutW+wY7aCh72Jp0HRXHRXs35lZW+JQpTc6+d9DMzT
	 djCUfyTPZP0+hyhZO0MlBATRsqGJkSl8TANDqEIskzNMcNPpFwo7JGaewSOzDzGqxtgDX
	 /ltVGTK9gq1LXaTW/tIPsNmny12fP7t+ctCWaqqeXi9xN91hGZEQ1V936fEqygXQ1xRr4
	 ea2/HglQShL6tAXTsJZxpPDfH2ffXWTMfwrT6ccLELyK2t1e9QyJSzp4we+T7ka2t2rmm
	 Dj7yf7d6O6ZBi3xAliMmWrItP3PmR0zSpvCpmnP+1ji8nQofZ0o3vfA8kdM1R2w8h/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JUnmhWE/6nuKeVluLworAnQepkBWhUtRWFlIO5F95AY=;
	b=Uz9iLNgsoi5kxC6+owuXzIbpklV2osJXflI2bGnplYYsqsIWJdYzkWZUh6CejfHgcTxl
	 qirGIIQumOpWIyU0+CUz3X2PGpqXluMIlvNOFf0G4ro+CnLbWasFVvb+KUr+4WdPkdlz6
	 L/qHcwyMAuVmUEJkw0HUcWpXvNxe0tmctYbxlcvIh65DgsD2//uQ+j25fWjWdnCJPs/lD
	 +tMP/vS2wC9KSsNHmYpH2O2lAxoVe+npVUY0+VJ0+2J0BIfwy7G9FDCLKJjW5kyMqH5uF
	 IikyrGmvVCPQb7P47IGhst6tS0XjEWAKIwp2Zl6GaOKqY5ZykY98l4t2uVv3I0mcmUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AklALPXD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A679606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A679606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AklALPXD
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so11680731fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792790017; cv=none;
        d=google.com; s=arc-20260327;
        b=Zj2gP+7/t7whs8etP418oijhV4e/nJEkNNEf5eUgHOZh12SexS9Z2sOCnY1ct50JAc
         q2UEsL646JDk+SWe3RIj8dy8iKtMpYUzDD2Cw8ghJfarLqAixIUfx+EO7KlYP0EIMfEP
         MoHLAEKT3qBFGOsv8Sqq0LAPO0h0d7HPsTTxplC1HI+pMT3wwbWbA6NxOTJoX5pCur6p
         8zsIl4atpY48VWtXkCxMHZxrC+ecK6UmzV0dWz/QVoKBDxxmS3ie79FZqkqM34Nvb1Jr
         LJII51wS36Euo8LatLAgnyOrOQnkhior8DYWgbXZSnK8S3fmFv8ZxawT/oNEY+gJtDI4
         GsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JUnmhWE/6nuKeVluLworAnQepkBWhUtRWFlIO5F95AY=;
        fh=gYqaaNZzJPc7jGUkfAEYMgIQ+OHWjLoKOIiJyn3pDQ0=;
        b=U5+Ct3CfkBTSWYaVfNwLUkzmLDieCEA5YwqpldZJ6Xrk++2XzU0yIrlia8iJrEfZFA
         BR3A2ZqsAssohloIWoD+XW5Nfhm38DKkKba3K2uX/gIYL6qpmNLmQYawTB05XGhQ4ATu
         6MP83Wpj8ncoPwThdN4iIgTvj5IgOjxd6P49y0py05NN7XCr4nbI/U6Ii3ZFQwY1wZPO
         ak4M2I12T94RTSFkXcsXiUk6XCa7oQralgt12ugjWIemowIV3WOW1F8pf4EaxIIF7d7x
         /RkOrpN57ZSkOcDxldVxwvhOi8V1cH3ARMTp7GdSXbgxVG1Cfd9bW0bFemmfFLzIpTb5
         k5BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790017; x=1793394817; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUnmhWE/6nuKeVluLworAnQepkBWhUtRWFlIO5F95AY=;
        b=AklALPXDFPf7gElKBnhIZiddVz3GosiH/Uj9/xNiBK/w2EZEB4yJ86hkgGXd9TAhem
         7+vrZmCHnVEWAcdfVgWs1NB4J0aXjHSJE8HnSRoh1oiM9jeihvdAd2JQ5SsLZDyY0UFt
         fvt9Et+iR9gB9joPMwHIYb/+JvsL9LFbrAKr6OGcSPIGWL6cLEsCKork61vNLgHzA4Ih
         T17pVTrkjYBbmtGv2axgY9QOwJnAL3pnd7t5+pYSCac6qXMm4/2n6ERmladQLJZPsBP4
         fwMsXSy9Jw2RIEAR5tWxafd5WNNvcPzEnTqlj3s6P6KaL4P0+csnqrFpVS5hjajI0Jq2
         0Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790017; x=1793394817;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JUnmhWE/6nuKeVluLworAnQepkBWhUtRWFlIO5F95AY=;
        b=ULLeoDruBH6Wmme1pr8LF2bZwvzqIKZ3L1OgBpA/UE2EzJguNDRDKxr9dnuALPpijF
         RNAR0zUtSGNpI9NkC/yNY1SRqnKP4rdYnx846BqrKiBzqKbY7GTPiayz3fPK2ZGlMmI+
         rltPoSrZVT4k+/JVgs9phlzojE0WRHpNUuZM4gF3ctZJ3ELnD7ZqJb0+If98vLcV/kIK
         6TGHKguYGiMCQIh8AAyFk8wTjfNnZEQV5uufXhoKr6H26WGiE95oYLGa5YHRrb927MQz
         Mzr3Buj9+jZNEAqL3hDK0Xf2a9rbh9lyryazCq4iAHSXufQa5FgzX3m8L3BjFJ3892P3
         A21A==
X-Forwarded-Encrypted: i=1; AKwUvBypFQSqKOeCSV3iCJiamNTDR5xypwxmo0F0PEZIYN0rDYwXlz3fRRVNpuzaUvHQXyblKmHwCY9KSBSI4n4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0nnzHyhzHLQ/zcHbEcl7oyJIHxpcxKqViiBjd8yQrGfPImTms
	2pw9KbHeVzBytIzMEWSi4qkD4k168cWgGdiM7cqoSdIpf6nn7hJMK9Vpd1igOe00IsgkYT5LTNE
	AGZ9VtMXSLhXYlyC6TV5F1LPdtV2Lp7A=
X-Gm-Gg: AYBFou2r9Sp4xx3Y9rnqzQa+x7VrUT02oyizBs9cGRY1kKVzZVs5eNInqkdZsr9cFy8
	oyOGOlTf4X0ztwFapJ/pr02jtKbBBUxPFF4+YuSizl99qjfkprqnVdmJ6U6lgG7Wf17EzfTM9Dw
	66yFFcZBBfTEv5/FARe9cwkOuiyTS3I8MB3A0E8423zfbLp/76UtupMFBbEwskHS8F3s7riRrj8
	ucERd2DHPg3wNa4QOHP3op8NMbn3m+3GHOsii8F3TThIKdkTWtcvcHXRBgIqwbHwdnW91aVWqkU
	9k0S8OxFJZAnZWA7Ytw66g05+VgX6DnX7MxOdOd8rUtOlmHyan6MTQwzVYjhMbaNfMfWh7dbe/Y
	TJ3vUcFpa5cSul8ITH97T/A8fdtQisG8N2IA=
X-Received: by 2002:a05:651c:31c2:b0:3ab:1dcd:934c with SMTP id
 38308e7fff4ca-3ac6fde7f59mr807181fa.1.1792790017198; Fri, 23 Oct 2026
 14:13:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020053435.1179054-4-oss.patchbox@gmail.com>
 <20261020053435.1179054-5-oss.patchbox@gmail.com> <20261023133546.GK3381610@ziepe.ca>
In-Reply-To: <20261023133546.GK3381610@ziepe.ca>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 23 Oct 2026 17:13:25 -0400
X-Gm-Features: AclHuK-BL1qI8bRaWELf_dQ7T0J3FzJ5N6gMRBUwAUZwcBedJJGHcJxZ4v19rv8
Message-ID: <CAGG=RgB9QziCsSXxqY0ZLYGyWhDhoqhOzxRx-W8Jomw=kCrb9Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] iommu/riscv: Keep page table pages when IOTLB
 invalidation fails
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Fangyu Yu <fangyu.yu@linux.alibaba.com>, Zong Li <zong.li@sifive.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 09:35, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> Invalidation is not allowed to fail. Drivers always have to free the
> pages.
>
> The system is irrecoverably broken if the iommu driver blows up so
> much it cannot invalidate.

Thank you for explaining this, Jason. I'll drop this series.

Thanks,
Yuho
