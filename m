Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8BD3A6B6A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895914; cv=pass; b=Bl4QRSNzWr4Kvj+WxQKBF3X6yVyhBJ6MqhW55ddR1KnX1diY6RWqR+p34/L6S9N1teY5VD9bglCtCF001EP94t7woxfDgKMDyQ2Cg4N1qBcrwUDkZJ1Cxy8WrKbh6LdoV/tJkHMo6cz8SSnX+r9Qhspll5j/uvMyNV6V1DPJE2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895914; c=relaxed/simple;
	bh=vw2nzUr45rmNtePuF5woJ4YHliw70BsRrsUc60hfEeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sU53DYF9J1FfI71wTDMLT5e5JiChneaZ/txk4d7E+2tNOSUI8nuQ3yD40+ihdqNO1gtAU5Uprqzi83XM0OI3It5+EMi1b/dZYOg4hfP8PD1qE2gFYd7fZMqeCVGe6nsQ/exA8Gfya0dvkewfx0gVg1EvZOxTVMa6byHsVU/MMyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V3YRrcuP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qG8YgM4+; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V3YRrcuP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qG8YgM4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790895910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSOgoIY/XNyZCrjm6JfgZ+KbRhq2HncbGvnq6vOvd/Y=;
	b=V3YRrcuPGJieuohpFwGOEBQyAcfRwraY0mrRPY4ZMQdVNovpMugzn0A0ieCqsfBxp/AWAp
	fTREWpQZ/iK9Hu2JhANKL7um88yA/QX9dBCz3KnqNJ0QW+HY3mxFIWsDeABuVTH3pCzAqi
	XDSHeGIYmH+JD9yNQq8azHBl31grIHU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-ewJTNCbBNWmF-TJIgdyt0Q-1; Thu, 01 Oct 2026 19:05:09 -0400
X-MC-Unique: ewJTNCbBNWmF-TJIgdyt0Q-1
X-Mimecast-MFC-AGG-ID: ewJTNCbBNWmF-TJIgdyt0Q_1790895908
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3a77b1bf482so12214031fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790895908; cv=none;
        d=google.com; s=arc-20260327;
        b=ogQ65pTPMmj0UZuP0QkwbS9mrqdTZfNs9u4YG9bY6xrI94W5YZic7KoT2hdie4PNbo
         0oICKOxiy6P3G9N+F+dI4FENwcnm8ONcwx8SR6nCIx7AfP/zYnU1Cmvqvg+eZMCShtbq
         75mFsQK8Ms/IJM9uSQU4L1duMKaLHYO7u4S7J/QRcxnJgBksFH6RnxLFVcx+ftsuHwir
         JQWrcdec5174Xt7kvMC2frDXKzkVqryKIrJIdo1ST5hC4gFRYV5JPfuOt5YDhMJ8caXY
         CDZ3qxHGQVWK/PcQjkOOFXf/tJC+xZ7YpFLPeQ60nZ5Z+Mu/Ku2H6nK9rfz5i/8z2PO3
         iAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSOgoIY/XNyZCrjm6JfgZ+KbRhq2HncbGvnq6vOvd/Y=;
        fh=pzAYNnDpFA8A/pB7Kk2bTFjERrMze8Y6FhOsjMrCDUM=;
        b=ObBr1k4U9GQRIV0tr8K6q9m3C+5DCCjZXKGnP+bBGwDQ9wt6y1zVlq87Emgq1opSH2
         lgH5McAWjfxlvlxUvrHAPjzxhwxqjh/pAgYqIwn02UG+B4Ko0O+tedTP3vLItYMRE6X9
         elUYZie54yZPrAWOhLvIrcs0xQsw9YKKa8ZIyrsbeZ1o7gSxK9SFiuttD3cxogVAK1YL
         +QzXhQil18oHf3XqjESscz1lcEMZ8zQJjvhwD+e8HOncapKE2QJSzuD9xzz+O/A74PKu
         ou2hNdPShzksz9MveLmXcVuOqF6szitaKPRCZeon7R/3fBc0XKLOBXR70p7LV2l8ZCKo
         jFtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790895908; x=1791500708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSOgoIY/XNyZCrjm6JfgZ+KbRhq2HncbGvnq6vOvd/Y=;
        b=qG8YgM4+lUnSmlfrzGFV75u60glCwrZkdpefaymhVHahqNOkBclJ96AaqSyPuZAer1
         9PgEDyIcVBbjP+M4+R7DowxF5TLqtnBiU2iW+Z2vZHG+6DuD4yrJr9/VYoiyq/GaKTEw
         Kfqc05KGpkXpTQwmuqsNoK9LTUBUJqpKTHfxNlDnSLt4aGE6xQnPoHXrb/7QbEybMkMt
         3gZnppLO1wIbV7y/VW93zqj/EklSVZSNZQ5lyvY7IoxMrBmyko8GgDvK1LGiUSlrxrRH
         e2KOMqDqNt7b7H5/HSXVOmvQlXVNxHns2PfJ5L371XiEaqLsGTP+nX60n+lP5u9mgVWt
         hdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790895908; x=1791500708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSOgoIY/XNyZCrjm6JfgZ+KbRhq2HncbGvnq6vOvd/Y=;
        b=p5W3YnAAQeepmN+91PQBRTrzMOFek5dFxXQRaveFjoqypaK03ehr5/TIFvn4YL7kpg
         uy4sLuqiI0TY12E9A/Nz2EWhtZ92W5xZTzFH/vaRbm0Xq++9GbjzdDNfNBMiqe0ufczZ
         uxb1hPZ9R3QV9IJ6FoHfJEegZn7FS8ThUJTZj2uxBcszK+/1f+DZwmwrOrMsJJKK5lRU
         lRcIKlzjMDU2hhDKN+RWZW8JjbM3bMHgCx5r4wHoPBDVB4VyL649MP0z/UpEhX+/OGO6
         0JrX3W46X7x3TAPiwuJuK4lHtolzYnuX/34vCh5UPbiz8i1rkP+Rva5F1GqlLWx76/4K
         i/VQ==
X-Forwarded-Encrypted: i=1; AKwUvByovVwmYFM7guCGLq2wnTn2S8/VTEqGfriAfkjm54GXbK8wdte0VpxdSHva4p3bA4FIwR4b9nPXR6TYUJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5gqHRct5THvaCsSg792hbkk6wL0SWxT6zs3MhZzgShKyQxZh7
	ix0GeCIPd0se9n4Dcj+b26f+8rnhLm7s0wVhtxJk4HR9N1Pj8TEsNI0hSt3f6u9LYxbWmyvFe2l
	Fq86AOEPGlqi2rKyqID+RKtevRivkDAfCcebQUScgZVEt+kc9GFZrBjAGkadd4v/zCXgHyvSp1p
	Bvp9zeWpHMibLjnz7HY07Qnl6byPlPH237ejPHYKGhNAKzyCPp9+U=
X-Gm-Gg: AYBFou2++Hya/oni/6gL3JZygIgiK9LaG/o2YHb6QVfRPT/5iu1YyryAcl5JRw2VAvH
	NP5xicaMHu7o7BGJOI6HqEdXh758Q2rSNDwLjV3jrGd2NYkoZFenmohfYtgQ4Gki/ruX3nZiTDB
	DUR7AiWewtMec8pP054uzbhGJftUFq5RCjX+2Qzvy4qElfw+RnfbswqdC6
X-Received: by 2002:a05:651c:19a8:b0:3a7:3ad4:943e with SMTP id 38308e7fff4ca-3a887787589mr1664741fa.12.1790895907805;
        Thu, 01 Oct 2026 16:05:07 -0700 (PDT)
X-Received: by 2002:a05:651c:19a8:b0:3a7:3ad4:943e with SMTP id
 38308e7fff4ca-3a887787589mr1664651fa.12.1790895907444; Thu, 01 Oct 2026
 16:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907062157.8474-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907062157.8474-1-hemanth.selam@gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Oct 2026 19:04:56 -0400
X-Gm-Features: AclHuK_0RZo4hr957aP6ijYk-eInWMEECGfCqShXUgsVoVy4JqkmiHVTPtkrqKs
Message-ID: <CAK-6q+gdn5C1uq3Sjig7dO86T5_Ze3Fm1BsZ5XQU72XwJBNrkw@mail.gmail.com>
Subject: Re: [PATCH] dlm: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 7, 2026 at 2:22=E2=80=AFAM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Acked-by: Alexander Aring <aahringo@redhat.com>

- Alex

