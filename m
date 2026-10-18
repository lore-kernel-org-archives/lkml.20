Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CA438010
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333079; cv=none; b=St5DtW6ZOcbZS6LK/SIMU1d9zndSNxFscdA4wFKXF3qR8vvuW2pVaOsMTjE/kilgXmTXCBZ6BYMlheUX8mjeQ4Huyy3myHEp5LYc1iSLK8k07OwOIQfxVKZ4fLhqz0ByCloMB/KErPHI3y9sPE2BIFaTDNHDyLjKvFrSf3179Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333079; c=relaxed/simple;
	bh=sMAGYXfL6F+KPL2Dc1+aS/NnJ49VuStS3WCXoMwzeQw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f3xvchhN6Tfi4sRv0ndkbk95rbyB8+gSn9+WQHYY7h8AoT1pLFy1a+foWP1Zz3SQ21p/9Yl41u1iBQ6u0lO+hZklfaozVeqAnXYOcRFo37vX6fSTSr6jlMc3kiScBNtGnmwgXYsX2v0/XCVlkULBeeXtP/6yT+PTHAyEmxaHETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw23UJch; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw23UJch"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a01933b584so9191765e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333074; x=1792937874; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N5MgBRSHIYkyWj1heAuhLcTUma/UABuoBxMG8V8kVpc=;
        b=Tw23UJchaoZhencz0yPYup55SJcO7dI36KQOCS4BTbwOZdHpJi1pcyEsXxJlcQMPM3
         0C1s5lWDN/SZs4Ft0z7WsO/lPMJg0gxp77LSsS0xQHRjhgBF4ZWHz19ZhXyKsODg4oBR
         fqY0rFNGcWV+N78GC1/Ml3tjvlnSqEOYgFG+aSBIzA+WVJC+EFhipT+93kxyrHwBa22Q
         DfzpkVONx8SKQuvC3pExwe0iyx0iy2gNrieuUoLkZX5KiToRwCsqrKDZ+XhefGUlnzPN
         hPkXyTD6+oXN4SRcpGGwsHXtVvjCuZ1yZJaVQGJ0d1mzxRYNvD4VV1hD+p3K+Ex+KZ3S
         0Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333074; x=1792937874;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5MgBRSHIYkyWj1heAuhLcTUma/UABuoBxMG8V8kVpc=;
        b=NqcHPHwgsDnmdoPzz10IcWWZel6UEtT7s99yIOwz5DJggfa1V2MwnKrVSCq4EnpPGQ
         tsgbvbXjwhnK8xkVBsKBkN+rPbP4D17xmXb0nHN4fVbVMTjCgBiXY2jBJc6yaJblkPdq
         b6+vqATyL8LhkvHf3rUwJsePiXY2+BPj3IZv4Xp/8Jpo9FU8Vq+n5llys3GNJw8dVoY1
         TzWfK2AN5ERGLjaKfeeJ5zdw5TNDz/P1ldE3EjWtx8T6JzzF+TO9ijtQYXwTyGPKPs5u
         8Rwjhrd1GmD+wKOhQAgMDmd2dXTuO9+TmlHq78zH/goBkQ9JNmGGwRcgjnwXqsZowVgn
         oWIg==
X-Forwarded-Encrypted: i=1; AKwUvBwFVC5rShAUxj6YMWUl28BMbquoYLRh5wkvgDA1YF4GWvN5PXy30KyplVg9y0dCXong011IUQuXTODS1Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1IQtQrgKaoFZaLA0DqPkUjoCM1HNps9VENV3zCrFSDAIRjS1e
	Nou650WpsuF/rwMk2iAYeYFLGdWgGpQIjkUZQZB4fIvJQvU2FbX8ksWK
X-Gm-Gg: AYBFou2ehiXY0pzyLWE11Zvy09M2sbEqXXrzXot67HtXOEjTe13LLIQSMPAauGraAJG
	WoSKNOvnlYDRCIyxFNIeEJCNEZlUEWlLrypzN2XOOptvCysvSK5jsfaHsHFIjQLUwIRtvmYQ38I
	pmxtkeno32QR2EV5kKZDaV6XXPXyrRLibVBtaVTCUNyxpVOms06JEYdqbzAkntmhTm8KmYHycfU
	4RfVWJajg9jfBDU+DkVE03BSWekcSHhz3thfn7WVHuhHxzrawriQuQ/lKW4VGtQC7EW8FPNYUV+
	0431jXXyZX7XlNCslGRpv/5CexiPxrKon/9/CNdGn03b6oOUxLacPKw8NPQQ1gqzUZPgwc277lj
	S49GtWa85fWOKlvTEKW63mr9QZeIF+yXMtcyY85rekE2AHeS99tdwajfhDd3V6Pc7+ZrbA+jK4g
	ws1x/dYlqbDO6itRf0GaYZmnvxVBoodJL35IZZNjfE0WzaurHqORaM0WpG8ZP/u4VaLjJce31Bv
	A==
X-Received: by 2002:a05:600c:3b1c:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a1d75f9857mr104356965e9.13.1792333074484;
        Sun, 18 Oct 2026 07:17:54 -0700 (PDT)
Received: from [192.168.0.50] ([102.91.104.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm112503505e9.5.2026.10.18.07.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:17:54 -0700 (PDT)
Message-ID: <8a960200525367f0fadca6b83ca57273e469f225.camel@gmail.com>
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to match
 open parenthesis
From: Comfort Oyewole <coyewole7@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Date: Sun, 18 Oct 2026 15:16:20 +0100
In-Reply-To: <2026101838-factoid-filling-ce0d@gregkh>
References: <atTIKehBxn93Lcix@ubuntu>
	 <2026101838-factoid-filling-ce0d@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>
To: Comfort Oyewole <coyewole7@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: comedi: comedi_fops: fix alignment to
match open parenthesis
Date: 10/18/2026 02:30:05 PM

On Sun, Oct 18, 2026 at 02:22:49PM +0100, Comfort Oyewole wrote:
> Fix the alignment issue in order to adhere to kernel coding style
>=20
> Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
> ---
>  drivers/comedi/comedi_fops.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This is not a staging driver, why is staging in the subject line and the
cc list?
Sorry, I made a mistake while working on my first patch. I just realised th=
e staging drivers are located under drivers/staging dir.
Is there anything I can do to correct this?

thanks,

greg k-h
