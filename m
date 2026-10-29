Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294006;
	b=MXPhVmIm5GzvHkJ8aj51tDBlyIPwBNfgQGufefI8rz7gqXW3hIuZXlmsNX2Sb6Wivylu
	 qcxPZSuIdS/ZpNF8V0v6DD4r013WUbGT35dP5RdvtniHZofYO1Atf8LI9JUa9XEp6m5vj
	 nmtSOYV5NFnomy0ORkK9oakSslb2csLfhVeVSDDnZpAqxX06YFWnvT+j91KNhlg0gt+lw
	 4JStHe5lZQSh2w/4jOBhZ+HQUeNPvaRdGt3hN5L+xXj9ETcIFzjL7sgApF35pbuQcgMTV
	 J21dRu0i/eOqdcphyzIH6LlGNQycHzskG1hBel8ERuVWX6xqcGFqE9Q/K3cBBPK/5uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s5+5N5HGntkmj4RcBUuDntjmqsknb79+6Z4jRjJ1xOM=;
	b=MlGTVx7g9E6kweLyal+fPSE6qFN/3TU6+lSfZeyyCZzU/GJLpJAu549cyDdqA5ZjsLha
	 Y0SPlE7+/Nf6snur1LRf6wni15709eMK83mvG7IDBrvvbnca+0PnoIrIvUh/kYNejhT78
	 M77Yk+PTpeUpskgBbXLqBsUJ6qORmQJvYkQ1xDKbp/ZmrvdfiU0fhtmnMmdmASkkWLt2u
	 bOGHSBtgpIcB2o435qjsu6gNsdzGMADhCiyVuYf7WBEdMoMIQwDd88nxLeOAi0ctzolld
	 JV89UUTaiojN6yneLiGuypeIQVkL7juN5zB3Pyr0cUXb+NNNK9maMbYP2SUsjg2dCTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbdPfDx0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nbdPfDx0
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so1372276b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294006; cv=none;
        d=google.com; s=arc-20260327;
        b=n0BEInMDCIl1eqAYztJwQ3bNCOysz3bkB43TQKyB0sSZNHe/5iA6RM14hG5AQOK3i2
         KVL6N00hZWHnR0YWf4voBZVpgcqM1JotECKsUz475AYf9VrGv5gQ3PPb8nMAzJ67IMJm
         7gNfuYrSI8V8LpqGPyoZ1o56hCC8C+NTziMP75KiOAwQetQtCSzt9JGQvimCT6J3R4hp
         atU4Gk/XIQqaef0IWIXxSHjoBN7qowlxGUCU66cuoIEqulPqs9/B+JAXdHeDctl8mBtW
         PU4VugX6c33yxtkLs4KqD5G2PStX28XEHCzTExQmWm6DofaWeN2Eb1+F/GXdlYICwpUJ
         dMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s5+5N5HGntkmj4RcBUuDntjmqsknb79+6Z4jRjJ1xOM=;
        fh=4vBlydFVslrHfmaiIVPdwaesTsr+TiOnsTT7+HDqsYY=;
        b=iJIx9RN+ceQEht/FNS1tiGI002sm7b+AcwgSByLV00Ivnw/Y7oxuugaGzEVR2DRs79
         g8pK1Y0IAvTb5DXPQygLtkCLq/FH6mXRUiIGbcq/UAB4G3MfMhQbTGaf1zj8EXzNC/Ef
         EEQUvGgXdhUpua7SGsb5FGKK3fCRlf8m50hUIPHkJRtvtI4Vdv6PuFOPgkfkEsyDsi06
         FTJO+Lzi6kfZOe7DV1rMyIzIQq37REcNp+6BQBAF4i2m2fv1X7NJHNoJQYXm/nLLO97c
         CiNrJLE76+0WlCtrRIaHICJLmpnkeceiW26FCXivKiPvosaTfxOMBL80vwRcfen00UkC
         W4WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294006; x=1793898806; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5+5N5HGntkmj4RcBUuDntjmqsknb79+6Z4jRjJ1xOM=;
        b=nbdPfDx0IXFjQq7RSQX3y4BmGTzipwsChuP4gD9bwZQHuCu5OhdLqqcPiUy25jRhvj
         3UItqQHXKWXO97FEqTo18XtZSjxIenYHhv/0u/d+OaZHwkJByvbD7NVP+c62HhGYT+II
         B/pUeoqGRWW4RwYOhpuvWEXv0kE0XV91UjgNXXIpp1/8NuPbq72cDY7/dxAAx6PFvkEH
         GB1cJ42ebyinkO8uRB7JGAIvOr9UjwEMVm51ApyqTinxICRwR/EocWgs7TfqFEP80AGt
         7ce26eHoO80wvvc4nlhvt7t53apKBEgXPaNDMoQbdg5vjKaZRfk9AptY0mpgFMT47Wxx
         +q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294006; x=1793898806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s5+5N5HGntkmj4RcBUuDntjmqsknb79+6Z4jRjJ1xOM=;
        b=kIMsTEOUYHqfvxWpX5Ofuh1ZbchkYkzQIOmxZt2TiyrDaIw3cKcRXBHABqTmXQPveh
         n3fT8NmLHexCJob+e4QULS7vcnt0I4Rn9AkBGOwFPZt2C6X+7SXXBV0+jX/XrkAoWE+e
         SG+mxyj144/B3JGu4o1Dp/2v7eaZ7v1Ca3UwR1DgU0Q7Cg9xt2z7u3U4iRu2ukDGL5k8
         pim/3oCQgSgLsdO9TFuH3bD3rXajjoS7m4odP6ZYPU/LokljbDxBgTWMKEsG7ibjfNN6
         Kx8XMge583FZ/mVK2U+oz/pp5awFriWQQF/ZW+DgY/Fo0EQ2Nzd92v1N3yf7OzeZc8hW
         AjCw==
X-Forwarded-Encrypted: i=1; AKwUvBzNbQFZ3YIPVS26UIZFwqT4zkANic7P8YLvFmZJNpo5bU/rdo81h/iH7y0X4HU2p5YbOGgz+eoaSllVcwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqj7Fuw+ckaf7Y+lVc6tbrJvLcvj79WSWJrq87uCATRn2PXr4R
	aRgevLTNMshb2BKGjsOIyRGlCD39PlX1bUDB2hFekxPxss0fm9jPMthfAWJyE40tjO5vJOcnJu7
	ypPCpx1MB58QjpzJte+3h2s/mN0awtA==
X-Gm-Gg: AYBFou1wfo3yu9WIfab8PCvq0S28LqB+S7ynini/L1Np2Crse5ERMlviAYdP0pR/3qV
	ouMwyfzt+OzG7ouALIkrYBcDsu2o8OVpdK00nbJ3kZZjDMjmGNMTct3ez4rg2eyHN+hTOXsRMc9
	ux0SSuFGH20AXJ7GKFY2lm6CO2j8jQblUPOGi/9iSG4tfKVYX3trigwOCVAHDQvKRZUq2HkqbAu
	Fm52scd0ZcTYStjEzRha7vyYqg4U0PsGPusq7uLSHl6vtsHtgulQQmK7LBE2Yve2XMJVe1lw6ox
	srUpJwqlhjhVoRn2tJXs024vJf/8EIL/Hb0OmsbdtiXO10bLS4nBn/58R8G/+9WsIQQ+2ba2BXQ
	yPLPJZMk9WVl2j4EK9uJ/KKe24vBb+12G8/F5kQ8tW6eyj4xOBudPyE/QRMK5sDcycOQ=
X-Received: by 2002:a05:6a00:4187:b0:886:d769:615 with SMTP id
 d2e1a72fcca58-8a6e4807027mr5553713b3a.1.1793294005838; Thu, 29 Oct 2026
 10:13:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALjTZvYKHWrD5m+RXimjxODvpFPw7Cq_EOEuzRi1PZT9_JxF+g@mail.gmail.com>
 <CALs4sv2vN3+MOzRnK=nQ_uMXbR4Fi8xW9H8LdX79vYA7tHx+2g@mail.gmail.com>
 <CALjTZvbopTcm9P7Hp1ep54R3_7yODg7r4j=OR2y3WOA1X84e2Q@mail.gmail.com>
 <CALs4sv2DgtkcWtMSsMiP9VLW98+5T9hz13j+O3qnqKYce6G+qw@mail.gmail.com>
 <CALjTZvYPsYb8FYsmN+YSO6U4UGPRGJSbVyxCmAfVQ4jSyBSzMg@mail.gmail.com>
 <CALjTZvbs2JP555bT9NGp=WePTP7KVue8qPtisG=P6sYV+HrTWg@mail.gmail.com> <CALs4sv39-Jf0_fivOeXMtF63BinbaZGkYgMPLiSa2u7Z3UxeWQ@mail.gmail.com>
In-Reply-To: <CALs4sv39-Jf0_fivOeXMtF63BinbaZGkYgMPLiSa2u7Z3UxeWQ@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Thu, 29 Oct 2026 17:13:14 +0000
X-Gm-Features: AclHuK_IUF8N0bgiO5KrGEUughNKa1c3HXPerxWihMA4gZWqZN7Ci_8NSv2REkU
Message-ID: <CALjTZvbU2PW1+sxsYbzYHbUm8wSRV2yZ8BXLP__EZjFLqbW23g@mail.gmail.com>
Subject: Re: [REGRESSION] tg3 is broken since 6.13-rc1
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: mchan@broadcom.com, kuba@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Pavan,


On Thu, 29 Oct 2026 at 16:46, Pavan Chebbi <pavan.chebbi@broadcom.com> wrote:
>
[snipped]
> In fact I fed your kconfig to it and looks like there is a probable
> cause in CONFIG_ZONE_DMA not being set.

Good news, that was the issue, actually. It's probably a good idea for
the driver to depend on CONFIG_ZONE_DMA being enabled, then.


Kind regards,

Rui Salvaterra
