Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BCB3A544A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302108; cv=pass; b=ishFFZlzyERZpupay3FRjxLGH9ISqNBWoejBsZw2Ol+BeSRbniQ3AFZjvHTcres6+HMv8g/R+UeN/OJPVCTPGLaGt+NtmAEnwAlvs0MIWXyYyCjzGNWkHVLibaGrU5ic6axNc51omRb4Bm5zaag4Sp1Dc7qgk8yjQvnheOJtKtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302108; c=relaxed/simple;
	bh=ixWhrkDazTQwjsDRgnRpeztncVnCtwPnCq1bA67M6Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNnG76EXw5XTLhvqyM0PuilIJuvQXqwLjiv1oK0nVfd3x7EsX7a8As9l1kxZAuApfaqAH8wiXj1Mod37K/t1kflj23IyBD6RGW5DRb5Z0z46SJDKbXMv9tPxH0OiY/kQ6kGd31Wl1tbcMQSUJf5/V2tyReFH+5aK+GuVAd9s6Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lk+tAFIj; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lk+tAFIj"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a5f968ada7so816819a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788302103; cv=none;
        d=google.com; s=arc-20260327;
        b=Zjyuz+rWtHJZ0be0I5Rv/cerHbo49ps+sdDn39+0CmTHZYfTsEwYONRwjzJT+6W0z2
         9l+1Jv1NLv6wEJ+Ij8mEQGR8ddg4BJIwlQDVtJk0Ris21muPXOnDPs6R9/7hHsFIOTHa
         klksYravF+FbePLMZoOE2TdVtd6trmSsFRhV7drechoYsTAAqm72g2uTz8aQjfNLDMcR
         WTD7r3UUm0ZkcGENmURF4tvWLq0CvodtsL1AF3NEbqYl7UcxG4ct/wqS3WBntO1Ac6Nx
         Q7ZrkaETOtfeipVKC8d/bG/wAVrlMQjL97btf9YF4f8vO4h/dtN8FQ7VmC93gOKXhtr0
         njxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixWhrkDazTQwjsDRgnRpeztncVnCtwPnCq1bA67M6Mc=;
        fh=vCffwOGOmnoAJZGX1XIPih+9INGIabWk+/PNA1bEdw4=;
        b=XSkQzLltTshwjFLdLQMPJTIAVIUZlwucWkmUNenYGOIctAcLAcYqxClzxkrD5IpNTs
         NVkrjyDSoIsfAxAByQusLRO7e3f1okvc/RAvr0QCn9WML6MVDfkVGQTXa1khn73qBlfq
         swrmp7PsUu2oQlyHTSJU6TcEhW8IvR8WQhYLCBN8wFdffTXPJsCnooEKF+u/HEJg/AX0
         jGF6lH9cDU+saYB4ZZbz0DgHsGveP3B5SiAJpAEEA3WKavUJawSVxUA8MnGlBNUCeu5f
         KjtZfHJkrBMGdsvUUgnI7WJ8LXRTPFUozccjQEhrLJaLs0gMSswRVQDUam7idTNLhygr
         x8nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788302103; x=1788906903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixWhrkDazTQwjsDRgnRpeztncVnCtwPnCq1bA67M6Mc=;
        b=lk+tAFIjM+a1/5pbRyFXVJ+KvSqK0v6C7+XKZqh3Kf2IIW23YuByyOHaTz7wmTxdpT
         U4x3udcJj0P5p5qr/7XTY4ChA602DK1vqNJPKqpLAUqr9gm3zE0z0JYjzmCRE6+q2tCf
         B5XkVAo9X4PGj7hteDiWVNWoQNlMik7rv4puAWi7PIphhKUMYS6pIwFmKgLWjbf/iiGC
         z2bGhXPmfBi18tQCpWvd9Sa85mo8HaeSzaWQDStcpKHoInsjTOAdSxzMktWJo365db9S
         wcaDCgyCYzI8pqAISF43f9s6sCZQEtlitigL9x8kAsdYbJQXVOjw5V/xiQIPjvjvbJI/
         AMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302103; x=1788906903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixWhrkDazTQwjsDRgnRpeztncVnCtwPnCq1bA67M6Mc=;
        b=IuySUyg5nGxuBwQeSeA6sjxev/tj/FTaFZl9GWt4+93QhnibaGCC0YqCy00+TTqrSR
         V+8osID3ejneRN1qfZeCZbkR+PMnNoQUsupFWlVOJ0ZMr+dgI0SmqcQMjYvDcuz3Vxbj
         6f18oFGbaTkGKxkCo7qosze5Sb6iWUDu3InFLtpNMHAJpjwBcTd0oDTqUHeSp4v2Lujo
         YgBBXvzLGIzHXquW6giq80WzcuRzXZ/hQEDqc9EwhbYhbIDidbaes8Sv5RVwLn/FzRBQ
         X8kL1DKU7T3KI7xlvN5RpXx6wDgL416+YHMMReA0rItfzFCewlPJoIb1VJ86IqWgq7uA
         sAhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQQjTNzMQNUMnfgF3n8VvtcwBkts7EgeQ/oL1Cc/SMYTweAz3SlGkUELnpkIOHPI1NvCXt3FuySsX8eq4=@vger.kernel.org
X-Gm-Message-State: AFuF++kZkJ2G9w6mvXnUjnuh8j217JfHD4M7K7zAYsjlhh8pwW6xN8LB
	dNZYqDuTB5Gt4QjXrURpfjk6JWTB7oZflu/lXYnLfptIKFt/I/HhK449kY009VhABm3CeE0RVzI
	kEmWnzFISH5pNgcj8ErYKOJhQbRmWjogId+av
X-Gm-Gg: AYBFou0WpzyCGSsuhZ/WJrAeJ9lUWzicX/IsBvPK9/bCh7whFBY5cea3DEd4wvTzhSn
	BJET+ctAPdkmr8kpoakDoZSqWWjH/NzMp5BJuI3DX0aHEgIJpMKGUPRXw5dVmN++V1lWmxFKLby
	gtX/x5ziu3XiOoZdBtmf9WeSGYKOVc425RBMkQSUYXSby32fHTNpQScwGt0TOjc2vKP8dr6vKT0
	lM+79HbJelove+L4UBPOKF8+r0JekQLZMe2OGqK76DxL22OWa12VqP6YvRpeBh6kI/iN1lfTRVH
	lBx3YojkGMSorMWWxnshKRU2F1RGjsqu6r8dIf6cruTQ21/wIJsBV/SY2X6nd0lsbc/RopkuLmE
	zMId+KvDHSkm8Tz7qops7DdlMFTt0iI8=
X-Received: by 2002:a05:6402:5042:b0:6a3:5685:703 with SMTP id
 4fb4d7f45d1cf-6a68527768emr165172a12.3.1788302102525; Tue, 01 Sep 2026
 15:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
In-Reply-To: <61175f9015771b6a6d78624579ecc180f57d17e9.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 2 Sep 2026 00:34:50 +0200
X-Gm-Features: AcwNN1WgbmFzP62nTXwf1sLZrIPpu0y1q4syu1pWxP14aqgN4CoXz9yJQt7B17Y
Message-ID: <CA+=Fv5TYnwcDLPvwScOcGq-7CUSs2bDMqrYEj-Lhf4XfQ=yTzA@mail.gmail.com>
Subject: Re: [PATCH 03/24] alpha: select ARCH_HAS_UBSAN
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> GCC's undefined behavior sanitizer has no architecture-specific runtime
> requirements. Enable it for Alpha to allow UBSAN instrumentation of the
> kernel.
>
I tested this patch on top of my rebased Alpha GENERIC_ENTRY patch on an
AlphaServer ES40. The kernel built and booted successfully with
CONFIG_UBSAN=3Dy, and the UBSAN instrumentation is active.

CONFIG_UBSAN_ALIGNMENT did expose a misaligned struct bucket_table
allocation in lib/rhashtable.c. This appears to be a generic rhashtable
allocation-alignment issue rather than an Alpha UBSAN problem.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
