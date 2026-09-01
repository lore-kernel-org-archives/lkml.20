Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30A64248C6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277634; cv=none; b=ULJiqoiu42cV28nQ04hsHMujCgvfrwEJLJBMFsH9IOpOs4nN68NtikZur/cWoBz3Co9zJ3Rm2buZH4PoLpY1M+dRFtKNjQJYs0HubP+zwb3EEEDRetzfCpMPUGsO1KlfnWz8qypRzdje0qTRJ78EbHJuiK9yy0PCAjVJ6RBV3cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277634; c=relaxed/simple;
	bh=Fo+cyOSZ390VpvGi96sorBSWtjIbA/jriibM1HSiSKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imn7Rqxe8I4IaMe8buEPq7nkpFbyDeq+gEDCNXvX4RvvG+LZmv811cIeJfieKmy0vEd5r8Wj8j9MHuBppuBix+KrqslmCvXLayY2NUeLpzbd9QsqZcO0rg2swLiMLVYM2rpUe2ZODzUGAHo7n7D3+FASD53Iz4cGp6mv4dEfaRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0AGABNU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0AGABNU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so106155ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788277631; x=1788882431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bbKL83syu/qRRZNv+72ALzl67/XZ/emAL3qXRHrx7cY=;
        b=T0AGABNUubLN0L6f6rijN8GiywRdx5+PXxTSEr4zQc01USLIEQOSHtprIexRD9A4Fx
         jvM/TrjYVmtM9/uH4eUn7ryuvlN6DHdolW9HEqmAUwe8hMIC7Zy9YZETlYLY1VVOcBdN
         aRIZWgwKKUEeBstpmYDaq1EObOLvyAw9BscGOoHIY5KeG6h24mFIAZ8bGSDZjh2v4FfQ
         T7WcpQ51iz0CnFYLY2XX1Mgdb0GhWrqwmeTdKgWlNip9K+UOCcVInmTElfhDybeVT7Dg
         cxsV2SrWJTU10WNWJ9mkOdLrLoaM2Pc6iwSC8Dse5LZ6wumGTSzGLTZZyGezD5Fj/tjW
         ksUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277631; x=1788882431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbKL83syu/qRRZNv+72ALzl67/XZ/emAL3qXRHrx7cY=;
        b=bRVpetMJ6RHeTKB+lyBeLD+Nv5wcUDVY9lT73dLeqGx+ZGmI+OoTVV6u9X/M1LH9dN
         9b87bkpmD801roIdsdeemfCJ5bbAE8EKE4UuVDTYTcHD03dzG3uFIHcgtsGm+39kqX35
         8uRw5FR+WhTqZaoF/GjOkS+ym+dr+rwsyyMULleoMKyMVAQliw4TXbYmOv5Peg6bEi3T
         wQUAj6MjjSj48hZtrqB8yAK0jj2/rBoQ3Uz1D+v8WrQ67ltJtPqHWVjsEmdcsq5fhkUV
         8qdHaEQw2UaYEpBFROoTlzEKoUCPolbnqadGK6Q7ey6J5NHLAAyZ1JmeF/9EQLJwXg3a
         em9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuZd3DL+A3JoaZYBRWPqKd6fR2sttPNnmWvxCG+n190eL9A37HyHh1/IpQ1nEwDPOyY9ExB6DpgB9oNzk=@vger.kernel.org
X-Gm-Message-State: AFuF++mFd8LnmKM1qGLO3hv/GOWgLIaPN9qL9QPlOh3Jvlmo8VTuOaZ5
	H3ouhXXrkALkHI773I5Lhp6BQcHoRXiQ2szf1/UZB9CFvBTFnvct2mNK0BDm7z6L3g==
X-Gm-Gg: AYBFou1ZBuknY+Dn7nO9hPirzkiwPQR1PX5tRwniOtEMa7NP5ZhixfmlGCco2QrO0x1
	pPetWGghBwm93rXjNP8Ftq+ruxluAwmKfUTBqxCCKkY9CRAN4O7E0K/tjjCYivKDtsF0Fy/urkL
	e3Ra5MiP6fLut0Ddv/rydUpiRInnwq/56+al4ex9h5rGXc18IJMHdr9eynzJMX0i4oMMFbcBAVu
	AsQpQ/dsFpzm4Bg0hLg98Uh2Q1zUNiY9xRryDpydApj/voN0/XDnbXF3rxBQNBU3Bpk7T9Mc4ya
	54NzsVK6iSxw0uSK24FtXYlGD2j/B3cLYLETl51zfo3FO+TPgJeYR3uwOInA9xGuJaXAqIl/PLw
	t3K40/D/Gg+e/O0B49koyCSYoKxZMAtiOARqT4E3y+ucwx926bX4PS/rWZA5hrmhSUvQLOOl4Xs
	VNUamOLlC86/KWa5YPfHbgIFsuFLjDnYxN6mqztrfTzp1e/+fU4Gols62jEPgACcsPWfii8lUR6
	oOBJ4uizwGQYONzZ718FwL2XMxccZHOBQdNxI8uCso4ktkCXGPIqLE05ECjme9FJBPkN/wOV9T9
	OFymk78=
X-Received: by 2002:a17:903:1a10:b0:2d8:d88f:cbe7 with SMTP id d9443c01a7336-2d9521694a1mr8105305ad.16.1788277630425;
        Tue, 01 Sep 2026 08:47:10 -0700 (PDT)
Received: from google.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c1f03esm242850a91.14.2026.09.01.08.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:47:09 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:47:05 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>, kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 3/5] binder: check vma->vm_start in binder_vma_close()
Message-ID: <apbzeSGFM2XtZbuK@google.com>
References: <20260901030419.470246-1-cmllamas@google.com>
 <20260901030419.470246-4-cmllamas@google.com>
 <apabb4vGhNfcXMnY@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apabb4vGhNfcXMnY@google.com>

On Tue, Sep 01, 2026 at 09:31:27AM +0000, Alice Ryhl wrote:
> On Tue, Sep 01, 2026 at 03:04:14AM +0000, Carlos Llamas wrote:
> > Certain operations like a failed mremap() might trigger vm_ops->close()
> > on temporary mappings. To avoid tearing-down the main binder mapping on
> > these, let's verify that the VMA matches the expected starting address.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas%40google.com?part=1
> > Signed-off-by: Carlos Llamas <cmllamas@google.com>
> 
> I don't quite understand this. You explicitly made sure mremap() can't
> happen to begin with, so when is this called?

The issue is mremap() first clones the old vma and then calls ->mremap()
but we return -EINVAL. So it now starts to tear-down the cloned vma and
it calls ->close() as part of it.

The idea was to avoid shutting down our IPC when this happens.

However, sashiko pointed out a second issue with a tail split. I need to
expand this check to allow the ->close() on anything within the range of
the original VMA.

I'll have to send a v3.
