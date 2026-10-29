Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.200
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793261862;
	b=05ypPgB1xSyGV/Iic/iJEPdUF+hb5Tfyp0Ihni8prcCRnL2TFXh4JYB59XPQUTf1LJvQ
	 5j+Ake/BHPJQLnbmjZ/EgqFlNjz/fCEplHgFL4YcMnd+g9XkP57gaVMpLNx8+qageo/eY
	 KpcF3IOCAOSTRKgqFSBRhHHnyXyrYDdlfI4fl6xItbAkvKw30NQoxKoocPZsDb33qzQ+l
	 zNP76fKmTdF73Z8KU6rZbMCS8vCMXsN2/sqnGWbVIcMjlpBYhDBbddsyZAwqJir/CAJD9
	 UsxbfP9XUxZL2ilILhSjv6TWdrAT88D267ulgyy5yBN7qZDL45shAAeYycijNblVxUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iSkrbIstxlkKChRqbas/gx987t4mdbKYwafViP0ImKY=;
	b=Rj2MY4zfc9iBJhajFs+4RbbQJvmYQqBEDUtTgZsZTIEj/s3VKAU2QB6UuvWD2mCpnawT
	 MOxhJJoD4QntrZLCoG7/Qt2qsaWSHBWH8DzPxlUq9QnRdSrfQo7H6fbMuSzBHdzkve9PO
	 TFW4AVy9K/vCnEMHehrwGgDA482hrCtaqunXBLBFZlrYjKt0/zgdDnAsCdiTOwBp3Q+XC
	 pfk/VGWbQs9a705YvYLM/Xdi88zdM5yAIgn37bP3UxJm7cGXm09Y8gi5ti4OdC+SHsTFp
	 ajfmeITPGsVDDUxMRBBNLC4CvtXQXbsnk4pXfSs+qYD0F8CXcwPZilRHcWjs9vImnFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8pszI30;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8pszI30
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-51cddc2451aso705842b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261860; cv=none;
        d=google.com; s=arc-20260327;
        b=pHBKh0HFrkady6hWQchdTTQ94YJ1SR/6xHcjIcx1XWL05v5Cqe4AQhrLnNfsp7w/PI
         lp2SteGCDrn6iM/2qo5lkNre5nhDWFadRdekarcFiO3OVN8colddJG41n3hryZBFNNwH
         Wjy5g0hRhaJ2P4RwGwZGJKnfCDGH/NLO2GcbBSDZef3cwNmNv5822u15vE4a1w89ixBl
         +NhSCTRtdEbXCNMiy8WFVRG+rxNejG6qyrF0M+h87MKFVvahxpvAjYGCzOWOo3Njhxg4
         h+0wZt0aqfJlh8ueDPb8YRwjb7+8qXtgJjsxQrsrImtGfnFJgQaTNctRtzdaswlWeNTG
         HTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iSkrbIstxlkKChRqbas/gx987t4mdbKYwafViP0ImKY=;
        fh=RQ4CNGn9MRzewNuLB7f7sg0UKD5phGKqoIcmURxlUZE=;
        b=F9FhYBo+PBauLh+Ic1UtAvbH65ydD5nWRh3sHABRReWAijXbSkOQYgyyFITMYpIExK
         q/JxfnGjNRdGFnUT+A8TRi9zfpobjvaeisJ/KdanpBR4UqRXC+MFwp4a2r1t8VcXjm7v
         kyy9trsLgNRM1WAzAR2ZXCzus+onGdD7zDYKsMhGG9LdiG1XEiuXTMicB4sphQsR5Azb
         nKXyx5dI+R+Xns6msup/gpUZk77ex/YJSrutU5qXvPoac5cV9LIPOHPfa2vWW8Mscoeq
         kBomVjr6pN4DXPOEAFBTLP4JxoG09gHzUyM9Cai9rmUO3Ra4lLZ1M5CFJ2WJRipA17rD
         b3fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261860; x=1793866660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSkrbIstxlkKChRqbas/gx987t4mdbKYwafViP0ImKY=;
        b=J8pszI30Ao9sGIAOHUXan59+UKcfPex1h+4PJknj07CpqLRXxhEXpE+4IgWrSsZxER
         8waRLfmLBd5fAtTsZbBrkFo5epI0PEC8kX41EzOh6ZEtI1wsG4UI6GepbZuQjIOAu4Uk
         lQaKgx81IQqS9Uo9ZEkfDSRvxFkBWevTadKa/C6jkThz2Gl+Le2+T1RUPnpnlIaqvlye
         a2V4bMonEONQ47kRWbdpgfHg2j3FoIH67lm6/2lNn3avvYnB+82EO3IuaGterv9SKvoN
         XJqlChedzxTNuYS/S/m0r/776KyKA3TG4plfzBqhEEDcdlXBr/8C/7jcNVzu4oDNnVie
         XPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261860; x=1793866660;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iSkrbIstxlkKChRqbas/gx987t4mdbKYwafViP0ImKY=;
        b=tWUAlQl17pFwunNvtVPjb6gcbrtXXzIT+jifMk20b4QGKM6l1kjuG0Mobtm/zb9i49
         0fsmJmSUz85PVlsjw6cxU6unOoWQg1tLA1NgxIcX21KUV2YhDnamjGbDgr2TG9RXS08C
         eeD9iaDiUzr6I2vkt3ZubMs0MczByiZzoAJgsiUZ3iJ0A/dNxokNQMFoPfjvzW/0f9kH
         jBxCRXsl6MiviuXjNWConHvcYv7sjmPMv4yU9V2Zx0CfRdt6CYkcmxCCxKZY+bbKypmm
         uTzEBwGpwLgVXQnpjQmHACRaK+H+DKzmndxI6TBETtxgeBG99j7RtrM0BEbpj3xPeELD
         XfpA==
X-Forwarded-Encrypted: i=1; AKwUvBxBy0m2jFQZp0JHA93logX1JmIWWb61/Kt+Vgnl9pFI2dAfdVBbuiCzZYETT7Ob0uNf5eS5kWFT54ZTIAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlFvZsd+JJ5kzSyWvssksNyNuM1EXGXq523U6koWGT03mc6RbZ
	eHKPQ3wp1lRn1B3PhxNXIeXXaJbeqvVedPx+J+/R8Rm0FubAPRNSz+MM1xIMmYA6k6/c0rSmtdv
	W2V0EFovuXlE4olejyGNC080EKQ9gAQ1g6eFVFQDMkQ==
X-Gm-Gg: AYBFou3GPg152tz03nHp1tydrMYGJalBMfJFiwQDku34Kt/Ve7/7D1sOp3IGyMHv57M
	ezBNfjHEpArocJaX6teKLGlAvnFvbLB04eti5wpg96hiuMaMSPGwBpFWxDFD3OU5pDMTR01NX0W
	Rq51CbYJUQ+y2XvjOGAeE9FBA5ZLTaQe89IWq5Z+ZclrxwHUv0FhC2a3xL6/ZoquB5NVDj/dLiT
	t2yjnJTJY0v2xLqzfnwEYdgXI1khsxViDh9hDRqkNu2527KSogecZ9h1SH/UeKJcm1MCrT9UsPn
	wUAmN1HbucA5J7B5Apt+ix4Pbil8ahBulfLmKG7HM1XGZrhGDNbVxeFbSQhFaJxdzX/ivKvEoCC
	LGzVfRftIJiHmcqQGCxp3nZa43OBKO/mVSA4oKxa71NEtGbGhrhpQlgEjwSoUvOLbWJZ9J2U=
X-Received: by 2002:a05:6808:1686:b0:50a:6fcf:d287 with SMTP id
 5614622812f47-5638328b713mr3288551b6e.37.1793261860445; Thu, 29 Oct 2026
 01:17:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029002052.54117-1-dennylin0707@gmail.com>
 <2026102957-suitable-gesture-be83@gregkh> <CAGEkeHft5gqu1Kq0saC1O0hg+ZE9AEO1tOgeXmd-g10uk2obgQ@mail.gmail.com>
 <2026102930-underwire-manmade-8083@gregkh> <CAGEkeHfTRiRmb-SpLUZeBkUrmRmq-bHLhD=CWnqsrvpbnymuYQ@mail.gmail.com>
 <2026102915-trailside-easiest-08fa@gregkh>
In-Reply-To: <2026102915-trailside-easiest-08fa@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 29 Oct 2026 01:17:29 -0700
X-Gm-Features: AclHuK-WVhUSOg0jZmjo5mGtZ4Ngjdkua4t1GssTsLZaglPf9GZnyVAIGNGOVJg
Message-ID: <CAGEkeHfv5RHfkF9rSXUGBcvoRE-HT-xU8FTFFT6NASA_7HXiyQ@mail.gmail.com>
Subject: Re: [PATCH] tty: n_tty: convert the full VTIME interval to jiffies
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Unless you can prove that this is causing a problem, I would suggest
> leaving this as-is please.  Modifying user-visable behaviour is very
> tricky.

Understood. I'll leave this as-is.

Thanks,
Hungyu
