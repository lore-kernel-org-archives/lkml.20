Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFCB49483B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353486; cv=pass; b=ZWvWzpVh0HmK9hBMu7fFswb2lldmuDnJ7qTAto2uVrAVpLcdzpkPxfGNF6dXovLY+Eu9ooNGTGOyjZDaWb3mLl798sTlXG3R+p9rQYGJESI/Cbj9ieVvtOfMFvitgE9OoQaOdfzLGqPniZ5PWfgCb3ha34LoW+nXqKjtJbhilkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353486; c=relaxed/simple;
	bh=K+swk/Ji08AFq0DopEKTbabw+5YxSqNaLFc8HIYssWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8Qhyh1OG0W/F/uhCG4IbiEj6Z38o7St9Ju+3k3KXAc361Vjs35+SwNm8FZBNe0GrqmEhMseqlz4OHRTitmSidAJxl0Vb8NkwQXbAbntki74AFN4/PJEYx1XBR1kZYQsYg+3CW7I89TCpiQkjUJiecafnOS3zXtHPvY0rpHBogc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LIbh+SCH; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LIbh+SCH"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8565d77c277so14066107b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788353483; cv=none;
        d=google.com; s=arc-20260327;
        b=MT1hqieT/p0eTvcyogDTy6pY7ABpNWf1W6xb0B0JewEqfs8vN3GR/LnB4HLfGUh1ej
         AC6bGjNS3syKef0DoEKpUFdg/xxvuaHHc0hJHaEoEwDJvsitnjSUNT4GX3dW0IEClg+m
         chZPEKb6f+G5YHA0YqLR4rwX/4O+DMLm4l/gV7r2C1V04DBcs0tVYLi59fzXkAR/IpSh
         zbh9Vn9lrdfE+kznzNYL3e/xM9ywjI3X4NCtVJfohnbUONh0eJc6om6dvozDl2aV73Lz
         wSy3jYzz6uA/0cC99m0Yjk4MXaqZHnm1/XnfchFrLKGTkMSbwvHDsUDrNcqWqAR6rEPO
         sdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aoJYi83K5jDu2HW69kc7UQzbMHQ0VncPovaw06vhQ9Q=;
        fh=WVfYjTsygc6AawGWkh6UO94PYMhGHCBled8rpaYLVxk=;
        b=SigkYqXJVIzVuA4eG6DlFCsgHyfrx1R1YaKHA+3ciHnJFmIBENQ6j75M2Fu5zCyw7l
         SF2oeWrKRkBlGFzpkMNdgDDdM5l18FCuj0D959ZMulWL9K/3DA7cWiNAiRrcpOpuBPZV
         Syha+OhCr7wQbNLUStvCHY/2lEfDhVDht30mHRMC8HvcFWcXSqHaMFdGDp0/b1WGRgBP
         odHC7wDdXsL69Ixv1US6SZcD00HG5051W1V4DtkqzYqWG9bRd92FAZy7/6rHUcdjdwPR
         +GtZzJudpIYksjE4tqtMZXQXocePy6PdfrNW2nQhUUcBsGrAV/ubONY4uphV5ajX4JD5
         ItKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788353483; x=1788958283; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoJYi83K5jDu2HW69kc7UQzbMHQ0VncPovaw06vhQ9Q=;
        b=LIbh+SCHe7Kztt3Gfwy6XNZRmIF5lVKD4PG+iataVenLJfPDr5z03HhSI04Wr/bCJc
         0t3oxvLMaIZz7StbZVoROXT8P5QTA3rwm2GBXopaD1kSBeMGO8U17Aoy9uyPoTwKkCAf
         B4TBje2UUyztxGNpX6C/Zqp0tNxZ75sQdk/uoC3w6GEf/5ASeSuhypVYMKlAvx1nOwsc
         lE3EQ5kYgnBYsxv6TQpTaH9T5LqSE9Ul+iF2ULn83JDY4S9hdJZ9lRaYRX8me7Q4cvp+
         1j7uTyDSFs6tJs9F+gFRm8p6WGpiuUZm8VNbeiGPHnvA9xfDKnvJ1CvKtUzhTES6r3OP
         /Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353483; x=1788958283;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aoJYi83K5jDu2HW69kc7UQzbMHQ0VncPovaw06vhQ9Q=;
        b=PARQ5OaGhAWBnIYEsV9oJzPqL+yp0phPfe+eoLSogHQi/f2QoMyrY42gMm4wMJwups
         IGSj7IZCZv5Bf9K3Q9QXZglrdgYpobTqvcvL7IJPQDxH16ubmW24UptTZuCpTcWYC4NB
         jPJyt4Rf64HcxcB4R/DE4ywodROGRW0B9fnf8r6KroVsmFmw08VT997CVHQnQ/Pj8cj3
         8KmW+2kaCteZ/OyAGJdqlaLQGHtvIK5ZE6sBLebakZwVa3JBe/FPQ8BjMd8Whcu/kf53
         nZUJVvPlUCp/RopcSVrfQ7+IOU7nvqCCM+4I4nhPhmHtHqHEtiLCdN0zAYgSpFoIdYG7
         X9Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwAqilmFf8n+q4ElzVUfbR9gUrbV8BaiSlYXLquTVvS3PB9R8f3CgLksYP/fdtlmtOEUztEFX8mDraKDB8=@vger.kernel.org
X-Gm-Message-State: AFuF++ki+Sqiw0/MolYvs89VWzt47D/kVbSqbCLfK6NZFiBFIRNxxpNX
	Kh9pCYXqhHDy4g49DePj1h/JcJOqVvFR+0aXqsDw6Fdh5WRSbrFal708NC+1/dSjETXQ+JhhD2X
	7YXNuPKn13jvPHLDR21u6iCvzwVtkrXv9BSOZv7WP
X-Gm-Gg: AYBFou2NLwX+rEcDTom3uYaOiAM2FknD5qk7lH4C/+ODNunRmdqgx19Ok4aYrbsbNec
	hZ48zqp49i5CdyleRQ3EZDEoe/PYtw0raKSGon2LFLjPmW3ICQ8AifbkcMP7fY0j5W6OCwXySMe
	tbfBL0AtIftoEXKp8QNjaBBUQE1/4fphCP0JMb4nw0tsUZnEhSeNKPyJ3Bd2xfUbcQYQTUbMP1e
	uk0nBP7jInTyC8+Y+joxV7ramjwJg0BElLOkcf1nPNuqjtVrBL0R5kOJVXA/lFnUAo1Iu8T5dCO
	xgZSzHL9bhiDS4aco/tZFh6qAgHc4cFoVWj/5QprgGVOAK1nDIdLiRilSdC8ngDTRhpZ28FfjOo
	0oGXtOuyfQc48rkvpo9vKxeh5Pzx72F6k8No=
X-Received: by 2002:a53:ad4e:0:b0:66c:c638:8e88 with SMTP id
 956f58d0204a3-66f9b8b0f42mr1278753d50.2.1788353482983; Wed, 02 Sep 2026
 05:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-2-mike@fireburn.co.uk>
 <20260826220918.GB3382628@google.com> <CAHbf0-H-nZzg=kGkN-yrUdfUUrruyN0x2inQjhXxOy4RAauDOg@mail.gmail.com>
 <20260831170546.GA239479@google.com>
In-Reply-To: <20260831170546.GA239479@google.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 2 Sep 2026 13:51:11 +0100
X-Gm-Features: AcwNN1UyIQqRoEjaX8v-C9V9M526WfqSWSvyF5UWK9e5ESZpZjZxqm_sdht5to4
Message-ID: <CAHbf0-H5pVMz=Vk55K2mNHiA+cYL5Sg3i8aqmqtPR5tYOMjsCA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: crypto: add AES-128, AES-CMAC, SHA-256, and
 HMAC bindings
To: ebiggers@kernel.org, linux-crypto@vger.kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, lyude@redhat.com, gregkh@linuxfoundation.org, 
	lina+kernel@asahilina.net, mmaurer@google.com, ljs@kernel.org, 
	joelagnelf@nvidia.com, bqe@google.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026, Eric Biggers wrote:
> I'm not currently planning to make the crypto library expose AES
> functions that take raw keys, since computing the AES round keys is
> fairly slow and most users use their AES keys multiple times.  So in
> this case I guess keep planning to use the sequence that is already
> supported: aes_prepareenckey() + aes_encrypt() + memzero_explicit().
> For CTR mode, use aes_prepareenckey() + aes_ctr() + memzero_explicit().

I'll drop the rest of the AES from this patch and leave the one
remaining caller, the HDCP 2.2 dKey derivation, a single ECB block on
aes_prepareenckey() + aes_encrypt() + memzero_explicit()

> But if you're using either key multiple times you should call
> aes_prepareenckey() just once and cache the result, as that is what it
> is for.


Thanks for the review.


Mike
