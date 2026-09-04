Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E1151FCA0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546979; cv=pass; b=mSwGXq7IQImhm4ow9R/F1x5AVnudeJbRTt/AatIDbSSnO62wA3z4AFnn5O7cEqObY5h9/j/pZk3e9L+F0pIMesiM6iEU+ugNEOu24FPNifEl+WvoMbaQCMR1PaGATcNQ1NofwyLYq/TEi0rCf8O+n3nP3iJBqHd2aQJTBQTJWSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546979; c=relaxed/simple;
	bh=L+kEvddOAYt+2p4d1QGytEK36KNFtDsH3dz0SJzHKNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9vlFusZUPsjqxcYWvUfKt5fQsCTMI8VV9H/+GWoAn8M8KngXISN5ooQb9zFVL5up6hKUOTBoRh5zVYLEQQKvGNAu3Gp7IE47k4I1eoJqaX/VBFQJzTeg37XYgCSq6GDBjcXKbpvVCL6TzE7WHB4Qv8ix7ikPhsitd5LIiSVVSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ButpDVyu; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ButpDVyu"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so2017941a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788546975; cv=none;
        d=google.com; s=arc-20260327;
        b=f/ho+jkaFM23tSniJx7QhhyBsIJ250g7wuyMtKXZP4wdxNpbcydYx6RBoySWRs6/Qq
         1gQ7IcERn/TTG9iGTZs7AEPIl3q9zBOHKVK64T4trjYmgimftF8cJ/hYhZvORrWFhz47
         rDG+GvveCJvLeS1PlelCDG+/8F3s405640SJmIbxTIyT0iSabnq6qJ2JbphURJrYwfAz
         eyRqTwHw3ve9tCgrTV+RQWtdLSGLMbMgP5323Wje3L/x1IVCQ2Jd3zpSCsNNAIJxYfvq
         DMj5ncUD9C3iNFnTiy59G5b+Q3/QSI7iXV7nzoGkMQFRciOF5fG7sgeYJoJGfcGJl18b
         Q9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gOkqG6TuNgAD5h74emORdEhCfU9eyK97BAx9wxJ6SUQ=;
        fh=TZ6H5eGgFKiY5iX8nAYgJGSa/2S6SyCMAUfAISAUW+w=;
        b=f65B+3U/dvebAjclhRYw9J7dZASq16f6Wofx3wIxfTgnFd1o4NAKehA1uUEnf8ve4N
         Mmut0rHn53AJPM3zNAmhKPqP9hG+fuCpyvJd+YL9iFVlvPqvhhCNEapR+ebsMOK21vdN
         JcJzWoCC7rT4srh/H8bx5QTTEaCcE2RLInqjWPFmj3T5mUuJQNlUoldW3wM1NWf4sBa6
         KBFe34BYMvWRYAFsaOHYi78xwdw+ATMiwVbVSvbKmJ5zHzXeaHVPMeBZ7WRIi/Y/1yna
         0iU0q/A1WfTnpLdlW8+ijUnP4mC0UgHv1gD5BaSVwusiWhc3MN1qPHJfnSzj9rd4oTas
         8bbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788546975; x=1789151775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gOkqG6TuNgAD5h74emORdEhCfU9eyK97BAx9wxJ6SUQ=;
        b=ButpDVyu1dZw7dqnMkU/XikTgVfwgYOEVGG801mbk2jZ4AJqnaKFrARMqqLFu3QK2H
         q3reNMrkCH2AXolkBZ5XvcIyCpj4sOsPVwf5b3mYI234dgdA9TNeVZb3JfW/rOYjAwD4
         mpQVnw8EN0rOH4t1ZxzbTUIWA2RE5aiFXImtPd6KhjlyJDpJ/Sg2N+i6rTsAN9Neszpv
         knt/6OoBufFU1c5ZZqziC5Uzph9q0ezeRbnHJGUwEKagcFCqSFwCyE1UEuzDc+2Rlgbf
         Aze8gxVye/i/9Of8R6meKFPEhvXpvBaSvwVQoeEIaJf6WAd/ZXz3HSZY9QFhpjdOul1N
         NZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546975; x=1789151775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOkqG6TuNgAD5h74emORdEhCfU9eyK97BAx9wxJ6SUQ=;
        b=qTUvq7/EdhjMw9ERvV892vAkyEHolyqPj39eFgzDfnje1VZrYJbDgR23fyKEDtqVuo
         nActsGoI56la0pecs3rIxoHsSXa5ugUi++X83Yllh+bpTGTw8H6zm7xyXuf7sG7Y5JLX
         K7Ba5hDuwjjRI6Q0RWYkCIVyS1ilmAqMQPx0ZMQ3DcvnwzqN8FJenCc4D/eLWD1zTv6B
         SrCuS37jIj2NZJ9nynN8+Zp9eGvslGA2uhbR9ZsuNgDSWtjRbko6TQb56olSGoxTHcr1
         z9dk9oZE+dvU2VXtAsYhzNVhb1Tuv+3iC0OAqVtY5lUit13SBSVTN5W2WNo4IZn+oCwd
         073Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMG3wYCDNfpndBXK4B7jsibr473R6rt1X5gjRDXuUIyQTy6nhpn2BVHZWLjzetV7Y4+yoGWU2pcMOjROc=@vger.kernel.org
X-Gm-Message-State: AFuF++nc90nVTZPYhQBvBE2ju4WeOItPeBD1yBunGYeDhwLhhcrTZKpN
	B8LXlQHCH4VEAN4JjD18kKDp2RBmCX8jCOO3pxXATWumXFGT+Jy/StkevJhvRNEYPlIkUqOSKcx
	oo7Myd6izj2ZFahdh4qiy4SZjFw6f31k=
X-Gm-Gg: AYBFou0PcRP2UaOshkdUAzvRFv5yhd0Cq3WoJkTLKEjl4iDKmbwOuNnDt/xV2wFKh6e
	BeS0v8wkP3qAtrxa3xKw7axn6M6QZ5/ptYaR+ApQqdikFnhvgqh53h2t+3XJsGEi8TEAtR/M4eY
	AxpA8wlriI5GfwzKFWWUkRRXH16vCgctvwl3qh8X5j2D6gFWR5QXRz19Cf1FXh585VZ3xkdMj9g
	wMSO06/mXu2lNE7l5VXEhQjt44FcumRHMS/+BK9hDd1NdOzW3ts9u+BkPUuJIamggCJomVnXU9x
	b8sJzhLjhgvK94I9JyDmt6bJgI4HSWU16cY8H2YA0kBn3EBtN3lvwh9ozqKJ01QFcmqGZnEL+D+
	UCLv9leoR794og98IPbxCMwhi9of9c3uMA/XVqk+GrCFANGX3JTxZbhtW0fi/iw8NV+yHSJhqLS
	haAcNa5jWynkzYq7DW98foRVUeKRwhBKKxKBrYylFCDl3wNFlRzuO/2W+MMm3xo6rrFw==
X-Received: by 2002:a05:6402:270c:b0:6a6:b2b9:61f9 with SMTP id
 4fb4d7f45d1cf-6a7e9520211mr2501315a12.13.1788546975225; Fri, 04 Sep 2026
 11:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812185747.79173-1-rosenp@gmail.com> <apqPiw_Oar-BaAtv@gondor.apana.org.au>
In-Reply-To: <apqPiw_Oar-BaAtv@gondor.apana.org.au>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Sep 2026 11:36:03 -0700
X-Gm-Features: AcwNN1VP2B8NfhJAXVOMzia2qg2zEOCOf_CklIrufd2iLP7DY1YOBJrTMm_wENQ
Message-ID: <CAKxU2N8ytLFpf_dCR_ymi6MmOqNDj+4XdxyPttYnr_pgrmyuVg@mail.gmail.com>
Subject: Re: [PATCH] crypto: amcc: trng: use devm_of_iomap()
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 2:29=E2=80=AFAM Herbert Xu <herbert@gondor.apana.org=
.au> wrote:
>
> On Wed, Aug 12, 2026 at 11:57:47AM -0700, Rosen Penev wrote:
> > Convert of_iomap() to devm_of_iomap() so that the TRNG register
> > mapping is automatically unmapped on driver detach, eliminating
> > the need for manual iounmap() calls in the error and remove paths.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/crypto/amcc/crypto4xx_trng.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
>
> Please check Sashiko:
>
> https://sashiko.dev/#/patchset/20260812185747.79173-1-rosenp%40gmail.com
>
> Thanks,
So I guess conversion from void to int is needed beforehand.
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
