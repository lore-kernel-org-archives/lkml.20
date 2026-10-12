Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEB830DECB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814256; cv=none; b=dqLqsjJ0UBWNjBLAatYFjK2f2d9xZUW5SBii9jc/2oDbFWHW12D4M+klP/pIMYtTEcFVVBSFGuj0pj9Qzgdp5NBLhCpHsAhvvonNgk9wsEOWphZd/pAgPiiV3R9lp6LraR0c3i+IUQD9qQqrITWGTLVYFHaoV51MYfya6H8bMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814256; c=relaxed/simple;
	bh=RzWtGxRI7enkyFHgOOKeEKGzebQirNlDhOqQkcVTU1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UC7Leg0jyErDxnNgT+VmGkOvtw86NLzx1T2uKc4+iC71yJAe+OeYNXzmO86KFnsMJsugeE1RA01DovY+OimartvenJ05zRLgXj++9cmnStUQCp61At/p+Euf0jxyBaP933gJDzzUei7yJed0AsLNEpFhaub5vzrc7emrx44mMvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=KuJxVbeW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="KuJxVbeW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16d39964bso1400645e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1791814252; x=1792419052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BgJmGRDGYBFo9MgRXfSxesRkMyo6aaxaTRmpaShbz20=;
        b=KuJxVbeWEudzPHzLn3sgzEHZcYfgT7tRXfnjwc2C94oyi97asWZs+OGlqA6uYBS9vV
         vetWHE6CD1bKQ0Y/vhUKRdMMDmBfFBDLil/kjLwm4PkcF2IZSxBGF550rx7J3KHD8o3z
         +p6G7VkBEC0oo2NPfG2ZJ7kkSAJzpNL7v/yCipuNHtLl2VRoeqHVIrmfp/Wh1C/oY+eT
         bbzOggJas+XNok3+OOpRU0o92odpaL4N3EoSAB9yEDczV1sSyk+243lDi+ekaiEuv5Vr
         GXokRyFDVqxF8s1oPCWH7UfqllVXmrc3kjAZihegi9zVH5uJ8esy5pj1qFcE4goG4Iiw
         WemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814252; x=1792419052;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BgJmGRDGYBFo9MgRXfSxesRkMyo6aaxaTRmpaShbz20=;
        b=UhlH0b7lxi2cwE9zCGrUlrkGEJSzpH4/VoR2ERtzDlkEB/EFoiYwtsFyK8+6rhAjMY
         WKh1o8nJdCIYjXpRgmmnJuzawxXLht12rMt299NNkz/L7ZSS/VydabdBgq+O/q2KeNKG
         FFWfks9VutLAJTJbFA/W1fDkHgMz9alUWTQ6MiwecjzX9kYChz8R9x2WpxsInmXUAIgB
         hU1vsDUmSpgnHmJ3ZhsXXxloLPmxi+kOrprr70GyeSz9vFeCncHo8Iyq5IwlqFVvwj2S
         OaYcOBOIE0OpVgBLLvZUYHqoZto/Oh9e3ZqkGC2ZpO6o5nunghT0bKvA1GmCdg/ocNE8
         OY0Q==
X-Gm-Message-State: AFq9FYJjKQZjhIP3ZL06GDb1xv12H7I6GsIw+e+5A9tYRArHgtZtxlLJ
	Ra9AmEkNvCLlEy9t5jW903xBeJnhHNZ0/zBVHmOG6YhyQX5UHHKp2n6iMwfsWkN8o1E=
X-Gm-Gg: AYBFou1JvQ4j59JltPmoQQj85bcVK7oefN2s9xvEXxyxsKK41QYLzjSwdCcn6i9K1De
	xJ0ArprSHJhE6qI2rc0qCV1c13HH33pAtEIzfifQc6AnJBwaFqbIgaRQB9v+q4BFxTi9wZG/hM2
	LWdLdqgdiJMWvzl8HJagGYdYqr0eWVjLlfdrkMhm5IkxXonPVJP6iJNLXa6CkA23Man3xIjR5Kq
	zSQX3Z77RqEu0ySV7hsjnytClDtqSgYOsOYZZ1PBl6SV++FDnjYQtLfVHx+b1JTVKkBpwOkihHe
	Nti0PuNCsXj+qkVu+QGy2HOghX9cxAmwTaeBASPmshx3cINtxq7Eec4RtX0kUUsCGrUxuZtGwxo
	0kwqlIKGtVHsvFaX9OXD5es7xwKPb0+cf0JUOIztriWfJ3qel8H8/8ID7YHs8vlARQHXTVyUEfC
	fuS3ljPQbVQeSMAO4km7q4JGOhVFKde7rOgPgZ/hmJfekUca/RydRHb4xmeinaqgJIxKDvHmM03
	VSQnNnpfRFwqOjOQdkwnY6UMuldVBdZt2pbSy3vr+vxt5QPD9E=
X-Received: by 2002:a05:600c:1912:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a18e3ee97dmr155446265e9.0.1791814252026;
        Mon, 12 Oct 2026 07:10:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm295619005e9.4.2026.10.12.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:10:51 -0700 (PDT)
Message-ID: <893fef96-e6a2-4cad-8100-5b2865aa7605@6wind.com>
Date: Mon, 12 Oct 2026 16:10:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH] xfrm: account XFRMA_IF_ID and XFRMA_OFFLOAD_DEV in
 msgsize helpers
To: Adrian Martinez Garcia <adrimg3196@gmail.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <CACO1+RRid9tJq81weX-UHj6111gGZ_H1RMnxk66dtGZfwxoXRw@mail.gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <CACO1+RRid9tJq81weX-UHj6111gGZ_H1RMnxk66dtGZfwxoXRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 11/10/2026 à 10:06, Adrian Martinez Garcia a écrit :
> Hi,
> 
> The xfrm_acquire_msgsize(), xfrm_polexpire_msgsize() and xfrm_expire_msgsize()
> helpers do not account for the XFRMA_IF_ID (8 B) and XFRMA_OFFLOAD_DEV
> (12 B) attributes that their sibling builders emit. The deficit of up to
> 20 B can trigger BUG_ON(err < 0) in the callers -> latent kernel panic.
> 
> This is a sibling of CVE-2026-43107 (fix 7081d46d32 only corrected the
> aevent pair; these three pairs were left unfixed).
> 
> Fixes: 7e6526404ade
> Signed-off-by: Adrian Martinez <adrimg3196@gmail.com>
> 
> I used Claude Code to help with the audit.
Please, don't use attachments.

Here is the doc about the process:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n278

Regards,
Nicolas
