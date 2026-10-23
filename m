Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792789088;
	b=pxgq7X/qXsoOhFLtYjU+gfvl9znZX6tfP9X3Ok9U7AdW4hlNti4FeDxXyIUlnBUv2KzE
	 2vE4JkZLA2kBGJuY0rMzgViQGC5GCE9scEKg0/vlTEkr1cuk3ehZr4a5PMs70j7lb551B
	 1SXVSQYgUdjUrlMVxY0zJPlEOmdaAi8Z8s6XC4TBTWUfuyaI3rJGGtRUVn5r8/8Gb7P/M
	 xe0wVuUQh1wROmAnNnqf0lvhDTqYeSsfo1/dkQ9b9Pvi2SfbOBzo4gfjcZoMLt7baA//8
	 +USFnZhmNeXshEh0tOFoDcEBCa4qhQy650RPdUMLW0p0emiBxLwxi5jwE5SYNDpWDew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nhm0dehbcsFsPmqbJAMad8C0NuNnGI0kqJ2sTQ044bU=;
	b=chu/A2J+HVKQi2qqkE81NAyXT6PskaHF5eefFb9d1oBl6tcfndh/KBYBHoIiuTXtdVTG
	 e2x79cOUytlgSY553Iw+tMIyoZv+8mZ0B5szR2IaCFcd+XsHaPMeEguUzII7rv7P8MUEn
	 iQ1pUF7zO+BSVaTW3cmp48M7YOwvB8qyrUCQHqFqS0dr/1U3f4Ehg/5n32sStU6I8lj2V
	 AB/FPCfXuksvK1EUOEonNrw7hPszzqsatMFUrFFMHCYbEBlVL2whcZOMIY/306bEsQSKk
	 5n5on8iY2kVA35hm4oGylx6RxQ5HoLWowTj1J6Kehqva1wSwJIHIN71FwPv+QBzR1VQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=mp+IjeE7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07393606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07393606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=mp+IjeE7
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53639b8903bso15509951cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792789086; cv=none;
        d=google.com; s=arc-20260327;
        b=HOaYbYPxezHpH23Wyky3p+orxop3bCOEZCrGJAJ3QGvrCz/zb8C0l5zAHOYp5vaB96
         a4GM/z0Q/0+HvDIlWsfbaEnVN3ZQFa0kyHjVXPTjnWO2n2MEA/YfgCTwwowA8goI/ebs
         ornkiyjXD+5QoSQjsJWq/fNyFoaXwKcGrv/fvxw9Wiqu5g+AkDTxEvtksumRlZDutg0r
         +Q9SlzSswhI8eFRsS41+pBdhqwY0CzCb3LvDyE2fIo+C9cFooXm0Km6XNnsANaBMsxZP
         zSaDPgLLgIJ82ThfdeRMKxqOE1npILzv6w/HNDMaFfU6WiPqnTiSmA/Ny6fn/c1GXiy5
         pAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nhm0dehbcsFsPmqbJAMad8C0NuNnGI0kqJ2sTQ044bU=;
        fh=XNGgLbtOhxjuWjS/mngj1wCcq4VA/zvSfBHMFOlCz7Q=;
        b=ogEu6TueQsC9XKIN7Z2G5sURzvmUmxPREh05JbYbwuOWjtURJBmsqi4IAYD2I2YKkH
         CCfMLXZFj6u2UYiRGm4biHHpTOIZKsP//kaZdvfrr6OKgamOl8Pw4YoPM4kcHJ/Cy1gq
         lsUCF6LefcQQFXDTmKPieOiBDKMKLSyjYfSfAdRE5T4UD3pNWWK7C6pUhCNPNlcEXrm0
         T3/cVAq23vnVTM2Si9+SZvbrPywb2IHzTuqSvd9WsPRdziEsfSDikR6bryVEknh3+cOS
         fjhV5UhKOte9S4v/Wtk/F5nI3mCRFbD7UH7CW6dTYa1noboG3MkTNRXkg79laG55ppvg
         EOYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792789086; x=1793393886; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhm0dehbcsFsPmqbJAMad8C0NuNnGI0kqJ2sTQ044bU=;
        b=mp+IjeE734gk7b7a0fXig43h2mQQ6+K9S2xLKpYpahwuij5a8Fm0K5F1sOe2vTQCkc
         ZlaI28DpPrh7DEKge+d2+h5xS4FnpSCWTDZC3mDcwLHnVlcAmt8MpwYyYSaxnt88AAJZ
         e6XYRslyCapLmKh9vZcHEmjMmvyYiqgiSWbqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792789086; x=1793393886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nhm0dehbcsFsPmqbJAMad8C0NuNnGI0kqJ2sTQ044bU=;
        b=Gegr96X+JAPCuIzernFy7PTyLL3lO3NajpQ4w2QeRiZHr1yF2BcFARuZox/v586Ssi
         bTqn7Hp/KrUX091nEa9QH+V8Cd6qL8YR1SxwFu8us7/l9re9oKt3u2G/HODoq4uZLi5N
         fVNzwnJbxGD/bFPozi3EmLYl3RMKNp5SotvGy852nLVS6Q2ReLwmd6D6/NFCZQUD1Umh
         cF7gutnuMrkgwAZlxp++jlFXfdYVg34ZNz+cG0Cno1Q5VaEJmOMIQXKcniU109UFXvc0
         diIFBP1CrcARi7AMQvBem7kXWcVzBpLYml0DkVHMv/vB/ZCHCr/S07D7nrLWL/lyDe1H
         1/VA==
X-Forwarded-Encrypted: i=1; AKwUvBx6HGWx26wGaqxknvSpdPxwwCE/OSe+LkD8zZZw2Qov7wsc3tevwQ3mTqBxPLpTnqO+17TvCjmp5EnxyFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKojwvxcgHtq4XMv+g/fNttv8sFXIxJwSAzxfGZW8cXLBkblfpP
	6ilyH53xvYWdGBj9Co9q60tFzhVP1fTK6fEbL28Ph/IIaPGccI5lhOPWXd9jL8CXfJXjYnG6/Dd
	IhchvypY3IlHgOcgAsOc+fGuYYKSxTODHZWIu2hMzUvdXbKlGdWLB
X-Gm-Gg: AYBFou0gv5pyFmv4pmfgMx73DhmGBTEAaqz0UJe9czmN3kU1KG/AaFpzMSdsInTlCv1
	S3tl7nCM7aaI45fXRGCe8wmpJNgaHkUlbAtbGXKPKgERCNq3HSuAdaggbHA00slgYOxYjNCZ+Xu
	joAfW1pBO6wRW1eBpPNHlIKBdwIn5hJkGPoIMxUAlxlrZXtyptIdsaKuRIv02SKX9/f2EIaSYJ2
	ZX92z4N5ZiluYljZ7R4Yc12JCnBL5zYp/oWNB3JAdcWYdk81XPImh4Nmtco+kSBoumR//gRaquq
	jzEawg/4VOto8T3/msAQZaVulbKWwhB82nqD9pBuDqd52iEBuh21xnKBsHjtnSGKJvZNP0Bxnl5
	+RUP381EL2U60gKlzT6ZySNW9QhaUUFH69raghEi660XdVJiN/pxpeQ3dPGNwO68x+y4FoKUGw3
	nUVbRb+ZDs5Ls8bH2u
X-Received: by 2002:a05:622a:5b9a:b0:537:636d:2f2f with SMTP id
 d75a77b69052e-5383bb192a9mr156221cf.29.1792789085714; Fri, 23 Oct 2026
 13:58:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atqdWUCzGxs3wwXw@groves.net>
In-Reply-To: <atqdWUCzGxs3wwXw@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 23 Oct 2026 22:57:54 +0200
X-Gm-Features: AclHuK_KkNk2plVzgFzI4sjd7Ztsti_roGPlFUeDExwL151cFclpP2FgDKprhXY
Message-ID: <CAJfpegvx9qi9ZcicxdLdmcwqnS0Z4sKQTdNo-OH7=6i=iYmKxg@mail.gmail.com>
Subject: Re: [PATCH] fuse: handle extent map files in fuse_passthrough_fadvise()
To: John Groves <john@groves.net>
Cc: Amir Goldstein <amir73il@gmail.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Shai Barack <shayba@google.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Aravind Ramesh <arramesh@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 01:47, John Groves <john@groves.net> wrote:

> Fall back to generic_fadvise() when there is no backing file, as the
> other passthrough helpers fall back to their extent map or generic
> implementations.  generic_fadvise() already ignores advice on DAX
> inodes while keeping the EINVAL and ESPIPE checks.

Applied, thanks.

Miklos
