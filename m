Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792508866;
	b=e2K2iqRwrTzFIJYcHEt+1pMOCbPl7RdEbvoPhliND6gDBFLuUiqovgASgN+2SICsIbro
	 oA+EvEzRVIt3mKXRbFfAO4/Vjp0d9YxqjnZdAdqiDy0/YVulgpzb8XRCK0uO5wfIfoaXY
	 IR54SRMj+f6OaJFYPXAl2bWrPAh6F/JJKjBX8pUhKXKREQUnJhchksJfMMn6P2BrKjDyR
	 FU8XcD7A9TjGeVjAJFSw//p+Mqi2GlhX3HA4I4Hx8aT5jcBO8I1tIJyeuWvq+A+o8VPW1
	 r0O09xF76M+7EIfJPZDP8aIf1/yHD12P51aCwKdnxprBhd7dpunoU9HRBeUopw7DnHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=XwwHKZ7ro+tqYYscVQ/EDll6Ci0suGXNa6eCeqEdl0Y=;
	b=ciRZjEttSa9RmUyl4s/EvIuvOoJLP+49aphYHhu3PmTdw+OgiP6IoVP5QGzKGxlGyim+
	 cl26VLJ1WI7KPHzW0ZTDwojjwsFcBLiDQPX6B4wJBZZ9hqtSzC9uu5ROr6yPlTakTfDhe
	 633S3kOdtSL/CzTUSOIxcWuHeLXsZ6rlXx+WZqhbC5a+ZaszsRb+wa6t9Uh9jiAYTPwqb
	 +bD6+i4J+QJjqHgbPnw6ufSjtzkVlWAEF8B7zgOf6BWf+DvNEx1A2KQ2+i5fjuBOKuntC
	 YYRZDLz7lNw9lc7NXKPEyl5ZTkYZi+eSZ6Tr1KVFFHbqow6zX4Agee2PnbFpOyQnitA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=QMCd6zX+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5AF606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C5AF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=QMCd6zX+
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so4609921eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792508864; cv=none;
        d=google.com; s=arc-20260327;
        b=N47zK40xqFD0+y97l3Z1Cord3J2RoVNlfD8XpgOglO1rEr3WYRWAnjwFH7SnVT+tg/
         Q6j4qxnpzKwVEdzG4bVERUsqX0ptG3zri8SNrit+2kCSTI/O+UIkTFMvFD4ovro8vNTs
         dogrw550gqYucptvqZS5Ynm1TEQ3FEDUAFKu6Q1cj2ELLfwJFqlwHCzynOjr7E17OwyX
         I/9oQb5ArvjN7tsMxgUgNUZmBp4jMjHLr15bT5w9VWWRrOprppoemOZjnjzMD0ZHxdAx
         cpwYi5vEcQ1GQjNDXSupvUsRRyogJ1/DzzEHiPyvtmkrcLpC7URiz00ky+D0hC4ODWWq
         tQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XwwHKZ7ro+tqYYscVQ/EDll6Ci0suGXNa6eCeqEdl0Y=;
        fh=WM+94fFarLl2UOel5aXO0bYnjbA1NJap588sBrP46QY=;
        b=exHnPqVcYt3r9a+4Ykshe7k82GW+O/3La232BWCyiIZwBijgqZnwiTxa2KcW3mylRd
         qlwvVFGUYsSdn4as1cB754jnY5jKrqENB+vrx9PBsgQcItnM4aHZHm8oe6a61cD1lbXO
         5wqBUSn7cnvzmER5w7fObqGB1WwN4tm3zPhi2DUXtjZJDrojlpXvDGUMKjXpGllf0S8g
         eMQDDZV9i0IsmhrzUMA57DvxD2krTeV2sFhgboZ7j7rnazsxAgqHxXrFgroIMBGE4nSo
         jusarxoYc7QzkHh3BMmJrrK8AF56fJu4CMFMwSspQIsfoIuJFXOWrGmaucJqTLvR27/9
         6kmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792508864; x=1793113664; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwwHKZ7ro+tqYYscVQ/EDll6Ci0suGXNa6eCeqEdl0Y=;
        b=QMCd6zX+rxmZMkYXPSupJ+X7sgMAgrEbALc/M7fVNnob0g4l6rDArk29CwPOZW75rK
         2Rfd9r6BNPcZoEchiU2ls3EsVQmwQAcavDdM1WqgS2I+33Zt3jJLiklKexv8glILmrCM
         QQCNY7geCZsAH14op3RMab9OYk+5DbO2GX1yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508864; x=1793113664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XwwHKZ7ro+tqYYscVQ/EDll6Ci0suGXNa6eCeqEdl0Y=;
        b=1cWAp+lv7gSJWY1B/AG/gR+jRMsp1dwazW1a6FloN6q21qFVm72ki51kKmpJziaHjQ
         rn3U6CwEK0dyTYAA8Gs5kZ76uAR7A7yrIw2NWayGirMQB2Bg9z8y+TlZM9dubv92SlBz
         h5lfZWqYAZgrHGpb3YErBIWajholmrE1oXDjdU45s2TcnAycvXCSKO1yGi/aXdL/TXvk
         3ECkKVaG+1/5sPs79L8KaEGCeHQj/0EmI9f8+7Tgh4+ZOXpXMYN+V1loVQ1rtwq0gaaE
         j6n24QM/j+2MipxVhZ3YS0IWpUVnipvGnIgdYlEI9+gagAcjWdcu3SH95Ba7d9z+z6ko
         V4Mg==
X-Gm-Message-State: AFq9FYJ9YZk6vGmm0l4rk4lzEUW+ceyHt/miVCuKIU/15p/jW95J+/6k
	6/Y23qgkh8zWGRNHaG3nHGxw23iH4TFdwNobwgOtHmgSLmitcUaaZnicb5dn77fj010P8ItjZDM
	XQzmUf8rzBa1Mzlxdb1Dch1fSQGOctvHn1sBnqBJEuw==
X-Gm-Gg: AYBFou0s6Ik+zFLUbZlMV6mWjANn7xbs/6kstVnIyj2x558MHMLu8i+arqibxo45YrT
	TF4Nftg2QoxPOVrDrPKlJ3RNJkClZ6CdjiDi2TdklEDGB6z3wM+Q7mFo+LO7zd0gWa4+UUKpk/x
	fCBcmekftcLhf0a/a9vorezDx1YvEQrgrjvmBB7n7qM1PolpN86XSbX1pcnt9TO1jEPwdHt3RXV
	WBdSaoBXahpAPkcZj/vHJJKVjMm7xL7jMgM/M9fVG6qcWb8Q+QbXOocebbcIuiJJeyOpoAESlrr
	+gFmC7Rnj0c6TiwLMuXRuUMWXjjU0INvf5+eYSzocQlH9jzfjFYGt0hUfk22nZzJepK5g6J7Sqr
	GaVNwpmCBJvVj
X-Received: by 2002:a05:7300:80c6:b0:328:7033:9b8c with SMTP id
 5a478bee46e88-361a12718d4mr21242527eec.6.1792508864209; Tue, 20 Oct 2026
 08:07:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atYKkjN0WgEhpACL@sirena.co.uk> <atZq0WW6UqnzbVx2@sirena.co.uk>
In-Reply-To: <atZq0WW6UqnzbVx2@sirena.co.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 20 Oct 2026 17:07:19 +0200
X-Gm-Features: AclHuK9-35ga97_nmD-ywPr1hnQmMO5FBjMOCS93Gv0o2oR3ZoUlqwq2_3NPfD4
Message-ID: <CAJfpegvnAXoEotjBFn_KXRLmW6eukPo78HpbN7fL+2uG_iB06w@mail.gmail.com>
Subject: Re: Missing signoff in the fuse tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 21:09, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Oct 19, 2026 at 01:18:26PM +0100, Mark Brown wrote:
> > Commit
> >
> >   5fda61d42e762 ("dax: add fsdev_dax_from_file()")
> >
> > is missing a Signed-off-by from its author
>
> This is still present today.

Fixed now.  Thanks.

Miklos
