Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A568D4D956D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775286; cv=none; b=nTIYLgNJ8Sc+yubhciNpzZC/Cc1akRCkGohawHHtjHcj2WrfHokOnkPcbKgAtSUE9mGuu2/CKbanfio668lmaPQI04h2EQLxmzKcAz8a//ns8/dAah+Odzxiy6HNas/V75dnJkZOFOjiIonNypYf/u6wUJyxCbdlfWqYr6FYQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775286; c=relaxed/simple;
	bh=1lbZl9nkJ82vbkiJlH5OL4e/xaiwFhHCQ+ecAokrDMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tHX4oiFaJ8A4wJ7tE6u2q00ixAOxQCBI/cTP4oBwhc25OMFyCaBzN9A0CI3SlRHyfSIkeKbpBuo78DFpTUivJ38lh2JSRp8HdwMJzEJaG0xy0HPRA3rOs4VwsXl7gpoPTQGceuqqNcLzrp0ZCcaOfEWf+hY85WNYRAoggTwYPH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K8obilNN; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K8obilNN"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a9cdcbe249so7361429a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790775275; x=1791380075; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9SK7+tlKw2iGM3TW7g2rjyMMpGtpW6NrO3ZYW8LWuc=;
        b=K8obilNNF6084QNSAqA69WN7KvjeegT5TLH63n0KjP18nUPX+KqaA0x1X2AW0dR6pp
         dnGJNAct/FPEl4IRNVnLTBw8KsnQGe1o7jefRVjNrmC0f06cMS3SbXLK/b2sfIzslbAl
         BRcpw1Qqd9H57wCC0QDXeO63iK/UzRCqYaEduV1mbuIDbS3rBdAd700VnnDKRX56Hkxi
         LgiphM7XAt9GOoKTVSsHTJUDhu174CC3r2yDNLHIi4cPPnjEZPhTP1Knk64U/MdgLcuj
         Eo9UWraKzpBbfVJ+qBNDOuWEN042UsiOwQi8wGFD8h6yDgs8PZCAItY+ZMxUciRaqVug
         2lUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775275; x=1791380075;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9SK7+tlKw2iGM3TW7g2rjyMMpGtpW6NrO3ZYW8LWuc=;
        b=pMe7OTCdAsSTpuy79bxJ313JVrKj+3FwpAdxCRSlgDeEgIGNbVvAkiNck5s7LlKqtL
         QutVUBP6WTpI1e//049DI8Hxt/4cIJf6gCjqZLzIA/Gd/VKuQ+741a6J7zIU45YP/QKK
         k8wj7AZF6GzsMI/BUJbuliLM4+JUgPAewD+wKutf0ZfH8b7NQkk2nFbbX38u9yji+kL9
         3CVp11Sehp7qrqwj3idJxHYhDMfzW429/3nPKpdimxCNvoggtOavC+c+sM0Oy+OItZ0y
         DAoLuo9cI1EwABUA8KeP0eZdUbTXYGgd08PlYGTyGpwt8LNl0i0INruJRO98SbB6rU3r
         PdLg==
X-Forwarded-Encrypted: i=1; AKwUvBxVvzxooiOCkfaAeeC83vWIHhcKuYrBoW6oOL5/nkdIPF74KuhydoynwB6mLdp/gIUGnnlap7ZrZ23z8Zo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC0S660nsXAjVRwYNK/g4HzUZi+GSzTXJGwLtKFc0wcgVeKT3C
	2pzNviE6V0vibWm/JiGKg5KK9gTt0+RJ2rRWmeI3wD9TqzR4RNxyFaW48vJm9Vn8L52/RH1d1Aq
	Gq6vHQ16T+58B/H+ePQ==
X-Received: from edzg16.prod.google.com ([2002:a05:6402:910:b0:6ae:16f4:b498])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:270d:b0:6aa:9f93:e991 with SMTP id 4fb4d7f45d1cf-6ae1985dfc4mr1066814a12.3.1790775275068;
 Wed, 30 Sep 2026 06:34:35 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:34:34 +0000
In-Reply-To: <20260910165734.80378-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910165734.80378-1-gary@kernel.org>
Message-ID: <ar0P6kAyX5EH6xhy@google.com>
Subject: Re: [PATCH] drm/tyr: use `bitfield!` instead of `register!` for non-registers
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Sep 10, 2026 at 05:57:33PM +0100, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> `SectionFlags` and `MMU_MEMATTR_STAGE1` are not registers themselves. Use
> `bitfield!` directly.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to drm-rust-next. Thanks!
