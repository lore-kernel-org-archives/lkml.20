Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7013B9618
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791287334; cv=pass; b=t5qeJAL6Uy4ZfEzvaAltBwpG7qNl/cfBSrfgW7nMzKM7CKshiKo81wltUhv1NmYBU49ehvAQVNF85nzxD4J0ZUBCBRXus5bldQN4tcRsuGWfd1Fia3/pmHe8hrTEY/5Rfd6kF/5AUA7vOqicr7IYJlT66OPK1an8TOmBDl5zw94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791287334; c=relaxed/simple;
	bh=jYJ3IdQnPrGlZkney67DWpSuVjwOBnDlJr0yOA4BAXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6NdOuqswBrFMfcKrVTLhM+rGpeT/Wb5oiixQpFPE0ah1gkKsVAhdHa0SDr0XGySKmT5JXJnv7AcGbB+oCayqPaWZjbF22iqBpeqZCz5Svw3RC0XohDdJX+BDJe0Lo1NjQITUwSn3ERtSEYI6Og6bz9MSk1ocDH6uede5sfQJ3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/S3AV4W; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/S3AV4W"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd9cbb661bso5016305ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791287332; cv=none;
        d=google.com; s=arc-20260327;
        b=kLo+pfnhosj/rRORnSMxZnUNArJVG0Lc877m4VDuhA88uDLLEHeNV+Pi9DihQdRyOW
         SYlDUgaauIVPf5PnLLZ0im6sAjFf0RfZzc3U5zBCVYmFNIlltehJbEY+kVB00vvE7Fb9
         dNKgy2PCq0noXqbM61wIMyi8JihFhS4tdxWrlnSLhbl8IDWfbd77fzdcJs3liLNkBFxU
         FwitPX8SVyjHEpYY5E/Y0VqBtXbCoLLXnzwH5nl53IcpTzFg839uY1s7aODHDe9nkTQa
         U7LUFuOpZ5oR3OGM4+sKBrulrdmsLXkDadCWPmqqfJqSlEShWqnB3vQDpGrzIOCK3cb3
         IPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jYJ3IdQnPrGlZkney67DWpSuVjwOBnDlJr0yOA4BAXA=;
        fh=4w4GpGO0/CSIepGtFTHlb0NcF8IYhZzxmnnaCcyPjak=;
        b=EKNazVUp1pGdv4BrKn/6BGBP/G7UNn6uRrvS5phaFLekz5ymchCaiRsEgd76fJV/zs
         8ToKm4Pphq6pDI4V2QSaU6XDPFSNjwVNAEO+7b+6cs8B3o3N5JuGBZ+t1cFBfLqy5Yop
         9sgr9VrO8SGSgnbtJA/ggiQ5fgkMBLFOHueg5QSAbiOxyy74He2z3ePlEUTumk2wJzzw
         5vOyO8pRA+3zPZL4GtTrWyD2pkBvusauPDUpVBUDZh4rJoeVq/Jfepg5wUxFFeehNgdG
         Mo2ekalAUmGsIJFk8jvC20hvcinESaS7vFgXVlzFSu3h6Pb+CbcRvcn8VVqBkilUC9tP
         HAVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791287332; x=1791892132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYJ3IdQnPrGlZkney67DWpSuVjwOBnDlJr0yOA4BAXA=;
        b=S/S3AV4Wb/6L+uQ1KRumjH7w+tNlWIs3J7jc0gd7dz2RltFveeFx8NA0NC2mY5+7iC
         zOPdBQc/1qMLLZe0ER1yWSC9jCOT6xVztDvYRhjZmiadCkMRBZks6v3psAxctwDy2CUD
         oI8bWhLLSerOQ4BZEV+BNP53sYCUKpFru1OWrboVFzY4DQaTX5KGLmGCltZ2YaiE49zo
         KEkU1sODQh7Sr9QxWRaeEuKiUkrx2wA9VmLljpc+ujVKgxfYMPy6AIsQ3D8V2qIb823H
         DqlahuOJu+GhhrCR+LG5zd0/YBXCUC/bKHoOXoFcqRCCqn/M1B0nChNRT9BvsR81o7qd
         ux5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791287332; x=1791892132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jYJ3IdQnPrGlZkney67DWpSuVjwOBnDlJr0yOA4BAXA=;
        b=X2MlCTx1kYEsYhdgXBTmNsgk4wZ19xCLp5NZgertwLAB7pj2C2mIdWzqL7dairtLN8
         QsADac7RrnBfYDgGiZc+bL4WRozGPGi+fwccRnuo/4mFVhKEUOrpgFDxJGD7jUYQeGCH
         k83Fjo80bZdogUqiH78t2cj4RbVUMSG2cEbFW/NrBlwkpFHIqWuv3Kvm256gm3sDw5Ff
         mHMwkSxsZ6tFX7GHk6cUta2/BUCiLmglhV1/bO30C6rrdRs0VWCgyyx2DnENMlnBSr4k
         vdzpkl9GmwO1t2A/BnbeIA0cmFFEolqT53SypUghASn+OzQN29R3viW209SaVh+FFwAc
         Wqqw==
X-Forwarded-Encrypted: i=1; AKwUvBw5G7VblzpE1CKLRuEbFxcERBhpOLTPVgBubTPZopCYSyuNZuPXBTfykint89GtPRVTNZab8Uz1nyGMDao=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfg5HieS2E8sgdTW2In3SThj0qm8b4o5FhRnyZBNtMj/7Uetho
	o/BxkKQ3qkLyvQub7vUqRU6WyAy+LQeXfoh7OqjzC9AnR9sQFLgF5wUkuE7RX5SEb9i1Awbpd1q
	YVm+jGG1qK4um9tB3lO/1kMDi9gKM+YrtV2VVHTQ=
X-Gm-Gg: AYBFou3/httjdu5HVs6GY+RU97Fh8iBAmF1s5698B187haZ9H5SFsmKOoB98uI7Yh4P
	Gk5IV9dY0LTLnuJoHKr5AGQCZVnsSg7wvZTHxhZTrQlmmFLLH8sFCfNvWwwhAVO4ShiPlwDO9H2
	j+aiYgly5ypOmfzQI3W96/CmWSs6WgnrTyogWrHqbWh1D4YLaFvtGBj5ZC1Q7QaITVj4oGfAwsa
	AiNfTOPd3IHQnyO/EqP9v+JDeeYAKv0qWxYp6NSG5fF/R6h7Cdv4PxWtMOyeZQhWixNobihu33K
	H9zGbU+HlreeSJ+ezFKwG78lNNzMrqwvmR5cCAzo0TWcjEvmlTLifgWiATuHCxwTdgWwZaJY9bg
	F6mSbxpEeIg2eVnEZPIo=
X-Received: by 2002:a17:903:244e:b0:2dd:ad74:ac7f with SMTP id
 d9443c01a7336-2e5dcda375bmr8786655ad.26.1791287332318; Tue, 06 Oct 2026
 04:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com>
In-Reply-To: <20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 6 Oct 2026 13:48:40 +0200
X-Gm-Features: AclHuK8vZ3ZZc1eQpcjpnegkwDCbrJBuk7gokOoEYOfEz1Xn_OmcqrH8tPcCuB8
Message-ID: <CAB95QASjtm0sUOSjr70+SNi2qGsCSMJKFh3D1intNKdmK5UHcw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
To: mdlayher@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Matt,

On Sun, 4 Oct 2026 at 16:26, Matt Layher via B4 Relay
<devnull+mdlayher.gmail.com@kernel.org> wrote:
>
> From: Matt Layher <mdlayher@gmail.com>
>
> Enable the CPU_Opt fan sensor for ROG STRIX X570-E GAMING.

Can we have a laconic description for this more or less trivial change, please?

Cheers,
Eugene
