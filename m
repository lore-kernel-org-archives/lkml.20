Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64D2576E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761314; cv=pass; b=quiShVQc3Gd9Us5XE82jrjjxxz11fV5D1GO6DgpkMpQKqMZLazWYKcQdNBbAP4Zoltj4qIzBlg6O08I/Z/9SS3PRCC16qFcjX/aF0409abkV1s0/WwrLDmsJWEH4AW4d+dzHzlHMdObkmNJG3QR/QRJ6qHRHazUc9q90pJjvmRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761314; c=relaxed/simple;
	bh=D52xDxlcqI/RQ3ynxyqFDlEyKqGQSfoIzfbY99oQqZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2AnFjGWP/OnJo+OxyhlwkaIbFVXJUqymniEe6ZV5r7VzYIb/7QMkNi7JJtD5onKLM6bq2UAk0g++EcPz8kJ3GeW55pf6Y0uPrjd0xEgwy4g8oXo+YRO462Yn6V9+RjbOeWy06eWqzB0bY9RUnaZdshVcx1WljR5dYTOhHU0Qi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oU8RxX+Z; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oU8RxX+Z"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-469d76ce704so2791031fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788761312; cv=none;
        d=google.com; s=arc-20260327;
        b=aifh+w3PZUlKJONC47GUcQDh1Hp8pYBbNaCZpFzk6zV6f9KLeoMRXzPl7UasgMf3vj
         ExMlA7o/44oTbIBl0/RXlO4P2weDEVeucJC3BKfJ2ltgvgtfL4ODBk7o7Oflss7jIpGm
         Kq7S2ggt4uWllgmT49abtwT3j0TuXRjFSnrb14BywW1kgH+moV1/vqiSFemgXKUdeOKf
         URSEQo35l03hCdYiZdCF4/3voqY4Jb2s1lMp2IqTqhoTznkDeJZbZ794r+LvolENKjdI
         Vi8jmiChxEGLmJ4BUf/eXLnffW/RPUfLvH6Y9p/DT2kJg790hflLTRgiwlC28mPnOeUy
         mheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D52xDxlcqI/RQ3ynxyqFDlEyKqGQSfoIzfbY99oQqZY=;
        fh=uhSt7IyCvIAZaS8YV5fMG1gn0QONdTO6pPUOblicXFI=;
        b=C6PZKrhzF8hURuXxOJ8te2+3GIwDGE/UEu4Ha05UO7ebQhk8s+oC8jkau0MVMtkA6a
         ij9PJ1sbJTGwn87oku/aUC3Iy210C9Y3CEQYCcZklAKwjt+7s0LHshdZc1wgUqm+r/oo
         BEJIzk618Oc3L62Bi+mKs8B16omDlEkc7sjirShiLhfPPRP20GNf/S1YSZ/smW0tjRRJ
         neFh70MLRGSFZhOT9icnXqWvdIffPMaivUVAqtQlyuaGPQ7C+UVpjbuOMmFJFd1CTkWg
         bl2RDi7OANjqbca5EYLCh1AdxcezL9dO4UfHvJJu4TqllMHTZ5T1VM13ltFQfOsCtBIV
         eI1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761312; x=1789366112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D52xDxlcqI/RQ3ynxyqFDlEyKqGQSfoIzfbY99oQqZY=;
        b=oU8RxX+Z/79xcCIJo6uGLwYD6wz/miNCy3Rbzuvalaex7yJZt8O7+FM3J65AFO5r90
         hYyi0z5ZEwyBGPiki7u3PIEJNOlJPUnojyVFVKJ8aFhB/KEYy6A5opmr9GCk1hxpx9oQ
         3vND4kGra/xMI81dxqeAZq880XCXMOAvWXPMqHgM8fWVIxo1ZY5anuwGzq4wrMxUQW2+
         6HZDjBgEJRPyNWqkYArxcFY0zQ8sO+dGgHtoZqajlKbUpUESZHWPCWK+lLtHEJ/8olci
         3RghyLIJfXGbFK+bkZGK6pePjN31f0HruQ11XgkD5iyeWt/WcUC31uNQiCIMbyHYvmIs
         C3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761312; x=1789366112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D52xDxlcqI/RQ3ynxyqFDlEyKqGQSfoIzfbY99oQqZY=;
        b=Rg5zj0OuEUSFSN+ga1pfAZ3MxYcAoo1M7z/dKg2IhEnIDZpwZE1yNsPhOKn/Zljm3v
         DIEeJ+O+IKKEH0auePL/jI4SGeNS8frfWC6+JjW7zURQXz+RtOY0yFWEDEzUeQzVxiXT
         BgIytpvxhfknqK9WLNKBjbxrNH6mFLcuBJ6nr9moolgfhJT002FcRFV8blHG1DFSrLHs
         6gTy4rEbnq1gbYgLwUjFABQ9go+nL6vH9Wrnbw3mp5kIpVNdiCVY948UsQE6R5qs5DAJ
         aUoTPOzY8sFnof0SY5fymAQD0mTAhuFgXkRnw68vfSXAXv8cK2g9xjpwNDlrytdW70qs
         4RUw==
X-Forwarded-Encrypted: i=1; AKwUvBzayfB/w8ivMd7G0UouV1ncXKpml+LSIbJbj9cJyHs4RsKWSe4e2mivHPoMAeJ1kdMd27NA3AJUdfAnabY=@vger.kernel.org
X-Gm-Message-State: AFuF++lHkoOnw8fwScVLbBe4eo/qMb0wdYEUsGcWv6T5PILgykKK4GSW
	4CBTVtQG2kl2f2RRVIYsTxVG8ginN+KWbXkikD+jHS74eyhxizEmiyPtdbX05/Fj2AfYEHbObC8
	9WYyY9cQ/4l47bS9nRdtTNFfzrZAaQWI=
X-Gm-Gg: AYBFou3IMpYi3kgUE9ornmHEijh57sDHpPk2yNFAtBQvUBPfa5NIU6cYdrT48HKrmGT
	pSgrulCRNbtRMIegJS72yX6Ma4r91KtMifY+N1VWCpMzPCAm6c77fQivezVVnjmhuOoeS2MEzy0
	lRNG+1QItQjdkDq6YhkVdIfp+4E0X+RhtHmYnrQqWAOSY6uYg3tlXjdb6+Cf0EXxM4vK0dmPWIM
	EXJ3ARVl/NSzpQMyIMFRQbx/9xO5M7kbWAnPThGlyhmJPhkNEFZSJ5qAJNT08OjTZi9bbK8zRQ8
	+XlHbbzoUt4+/0B2cYiqEfPE0EJ1UQf+41KxkDyl9ZIuVA==
X-Received: by 2002:a05:6870:3210:b0:46a:6e07:28a1 with SMTP id
 586e51a60fabf-4755135293dmr15159931fac.12.1788761312125; Sun, 06 Sep 2026
 23:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
 <20260906114049.32912-3-abdelnasserhussein11@gmail.com> <20260906185025.6a0d1240@jic23-huawei>
In-Reply-To: <20260906185025.6a0d1240@jic23-huawei>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Mon, 7 Sep 2026 09:08:21 +0300
X-Gm-Features: AcwNN1WnirY3cqNKZJJwKb645fYo2XIsR3KNHFtMCzd3d6BaT1y3Wiu5R7VGG9s
Message-ID: <CANpqX3Y2njgY4KbJmfa5WgJ6_WpfeC1=xRwnj3LUUiZphMxFLw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] staging: iio: adc: ad7816: Use DMA-safe buffer for
 SPI read
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thanks a lot for the detailed explanation and for taking the time to
explain the underlying architecture. I really appreciate the mentoring
and the pointer to Wolfram Sang's talk; I will definitely watch it.

I will rewrite the commit message to properly explain the cache line
sharing and VMAP_STACK issues, rather than implying stack memory is
magically not cache-coherent. I will also fix the misleading "correct
the sizeof" wording.
I am preparing v5 with these updates and will send it shortly.

Thanks,
Abdelnasser
