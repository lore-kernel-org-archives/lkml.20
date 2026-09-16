Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073B337F742
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535085; cv=none; b=U4uD8l/pzqqgxfBeXCAxQwcMGSdCG4ppX767RX+g3stOVeRt0pb4PscWuR5AZgKq2cs3rWdASBKpXd4HcJ5B59rg4TSdiw4WZdHXq5uIYRQyaerXySxaIHiURG7Qr53WYXUtfwAajvmN+fZNZ47Vr/US7FqwiD7+m2hvaq76ARQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535085; c=relaxed/simple;
	bh=rn/8q9InG+VhLfH0A/e3sk2fAb7dfuGR1Rw5Zadp070=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2cLL2bFixdVQIQ9lAgX1gfU3qsb1xIMsY3e/1a2IXl8PbVsr0cYy1ahBZnVa1eRhonazSkOXTamEr3+U+TN9iphx/8CyqZtFQUiuJ/Mt/qVXtHIn5NBCoTcTStEIh3m0/hrEtMoeXEJiMs/nVQ2Gf4ivkhf5tw0RYkhA0yRWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ho4yOlQl; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ho4yOlQl"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso562144b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535083; x=1790139883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDJS5DFeVTVtny+nVZ5eyJn66Zw4xkQyysEKwAXUmnY=;
        b=Ho4yOlQleEVK5FoQ9EAIVbIiUIWcSTzxXymBLmR9AXGlmT3dX2RTww59oDM3hkBPYo
         BMsgdORX1EjplV+XUU124ICHRK1ah7NAsuynTgXBX2zhuWOSWbowIgC9VmvkbY4RVJc/
         lqiRmgWuVuGee+YEA7BXSq49Fc8CEZWWp3LZ4rwwJrFUTifu7wTCMWSNjqAe2Xv+Wo+R
         79GUpLKJQoUXozM9e/9pH42uSKLHhASLksX7JlFnj2W0jT/rlxfi60LkfPWbjkyHup1m
         /ojJYCr63TtlYKOmy4z+Vh9re2DlYco6PphmzulIeiCqzfakvXD3tPAqBzm/33Ddc+nI
         9ccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535083; x=1790139883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDJS5DFeVTVtny+nVZ5eyJn66Zw4xkQyysEKwAXUmnY=;
        b=IKqhndHYDE+r3QCbdthv43fyarTnDB/BNvJbGzeHwfYwEG2EcWL/WYTYE3lnJBaYUU
         TaKf3XtkSlft35BbA/Y422Q7TY1+vFADAmm0D5s6IoaxVpS8O20yR+ma1h0Xmta+dyMc
         i7srEYwxI6jf4GJNF4ncIK4yevniZLKyv1Q4pnRCDoj0NlvLAn0xnT/VEpcljuPBbGhB
         oCRU3R535BjegPebT3udDxJGFlQ7Skd5XTbmwAQvajORkVzdfX2TSBZmHlZ9FW+8XqBh
         20vHTBYHN7pfSSrMK9lNoOprf6BbSmnBo2KV/olzQRZdy8oEejrNqGRE0fVWa2iQU97Y
         0qnA==
X-Forwarded-Encrypted: i=1; AKwUvBw+SxHfu72rGQiuXoTYcBdgRfOvyO/il4eOMPDLYrnjP9IcXNNTxIYBoMhZLglPu31pr8vl0NnlhXLvOvE=@vger.kernel.org
X-Gm-Message-State: AFuF++l8Hiaydpls2Z9byTquMJWhfslMMZHU65Aw7B8c3pWKD8bbqxSv
	Jn9OrNcUORbk32GYNdw0wWcu1J9n5ULG9FCKBTcXhcNoe0HnpxIUcUsp
X-Gm-Gg: AYBFou0kl0xk+1ETxL2gxVJrHrjjUwEXu96XS54VvltevZJGJ5YklDyYQRTVnDYCRq9
	4yFj8RhZ6Vbl1yNDa7+XtUTilfAaUgr+02JVWOZCeCvxF7o/fcmka2uKT+ffBggIPBlefdkN3aI
	bpH8AarWZIIhK0NB8uooGxU/77PuUvjFb+4ZjBHbb0/VbGUZzdSrrp83NP/0HN4tAdRYQGqzgSB
	j9yCP8sHo57ZSagEh0DuLxp/PMmXYdMJ6ypZFJgvjrwERTOAJfRktT2G51a+B4EHhL0XWJMo4kW
	onUgW//nrroPH+Rm7bX44dopcEZV+zESAUqrDcndfDupjpdXO+WxNJffYI1kaBDyc9JVAY07pd7
	hg+/FkXAiWBJZ1/FPz/N3e9mmhE1Icq73OrNZmCrSBRp87KT+LsTmusbCZR10b8ZafrSiveU48f
	RXJCd2izy0hru99k+GnzDEfFyEfw0EPoAs8pZhoUt+HdP+GVsiiu8zHrmByjG4zbV10InAUXgwy
	MlmByxeQRL3iImMT/7rSQnHk5aZ
X-Received: by 2002:a05:6a21:6da4:b0:3da:e50c:5039 with SMTP id adf61e73a8af0-3dd5f732f0emr2967834637.15.1789535083045;
        Tue, 15 Sep 2026 22:04:43 -0700 (PDT)
Received: from kernel ([45.251.35.123])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5af6593sm3823746eec.25.2026.09.15.22.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:04:42 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:34:36 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: bhelgaas@google.com
Cc: robh@kernel.org, gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Fix unmasked value in pci_generic_config_write32()
Message-ID: <aqojZEJDp3wHIW6e@kernel>
References: <20260727080643.4949-1-raizudeen.kerneldev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727080643.4949-1-raizudeen.kerneldev@gmail.com>

On Mon, Jul 27, 2026 at 01:36:43PM +0530, Mohamad Raizudeen wrote:
> When writing less than 4 bytes, pci_generic_config_write32() uses a
> read-modify-write sequence to protect adjacent bytes. The code comment
> states the goal is to "merge in the <size> bits we intend to write".
> 
> However the code does not mask the incoming 'val' before shifting it.
> Since the function 'pci_generic_config_write32()' accepts a 'u32', a
> caller could pass a value with extra bits set outside the intended write
> size, those extra bits will shift into the adjacent bytes and corrupt them.
> 
> Fix this my masking 'val' before the shift so only the target bytes are
> written. This makes the code do what the comment says and matches the
> read function, pci_generic_config_read32().
> 
> Fixes: 1f94a94f67e10 ("PCI: Add generic config accessors")
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
>  drivers/pci/access.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index b123da16b63b..47b38d01694c 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -176,7 +176,7 @@ int pci_generic_config_write32(struct pci_bus *bus, unsigned int devfn,
>  
>  	mask = ~(((1 << (size * 8)) - 1) << ((where & 0x3) * 8));
>  	tmp = readl(addr) & mask;
> -	tmp |= val << ((where & 0x3) * 8);
> +	tmp |= (val & ((1 << (size * 8)) - 1)) << ((where & 0x3) * 8);
>  	writel(tmp, addr);
>  
>  	return PCIBIOS_SUCCESSFUL;
> -- 
> 2.53.0
>
Hi Bjorn,

Just following up on this patch. Please let me know if you have any
feedback or if further changes are needed.

Thanks,
Mohamad Raizudeen
