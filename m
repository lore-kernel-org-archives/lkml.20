Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498349;
	b=MGvZ1kiVIu6TOm9IOZwoYhQMSlW6XDjqygak9DBZ73ErmuvEZ9t4LOL5xKQahPigCH84
	 mGbS/L/TrtqkTETzQzEuGDJ5qaYf9644vy9a8RMmSkwJDoYU8mNJ3noL/TRar3Eqr0w0U
	 r8BRlAacZyaHeTyAIrgQf8OgOgpBabnhH30ZhUKc9AXjQJE5UlvhFqKv7xPqH8n0J22fW
	 rhXTFcx04lXMGKjui6raYJbtgya2ROgAghq4YPHp9wtzuuQ639ERk7wPIGakbKvDyBFIH
	 dRD8Ol/RSSvre/tAOKPhG6uvz7mKC4K4dxe36JeyuetJCaIbFaSmMqFgBE6aI+ecELQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kA9f5sjuaRG2vzctzCp8dttJKbGRMLmrAhhg35dIa8A=;
	b=jlVCm1jTq8Yl1t1su7KqbRMy/DiQwDCeEdJYY5FJIu0qLdjDDN4x0Wj+Nbb8hUnHErGI
	 0rkNPfAU1sISyKFyrcS4IaqNH6ESslayacyoMhv15PbP8tCGUz8wHbOrvU0iEXyKHXnXJ
	 4nkj8zXJkFmfOZQEvgtKmRHgaI062UqETv+btzdSMjI5+gwZrxGu7pBmBiN6J+b0loO3Z
	 xGXQ+RnArWzYXebxlVQ7p+yeUG5vqv9+thDDAM5xA948tnRRiftTfJ5cR8Lh/RT6jlEt0
	 VEBdIG65NigWnrUJdDiFODyiB1uTUdtYhlbVm9UuYWyIYBcSp9MlT5iXtjPPU5ThQ9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5IAeqLQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893D606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0893D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5IAeqLQ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49a92144733so732247f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:45:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794498347; cv=none;
        d=google.com; s=arc-20260327;
        b=GoLYU1S+Zjh6IO/TpmDaoP1Z2VsjPu7rL1yW04/wFwk75ryaDstRG0LFKYVQ6WOzRD
         m7lsB17U6HRHDW+Ya6OCP6JDUhsfNGCDaUJmbBspiuR5EHk/WCzhxGn8MLQkuyDWxMto
         pzLE6ZreHXXqvwqwNOrosIxMDrqrw/5ESclx8XXevnqMoX/01t2yuUBiCwRF+dWMLcX0
         xa5eWMsdjsSNhY16P6P9qI2Sg0LPj1LIBejz46IpRqSplkJHqMgnt1ninVal1qBXk5Z7
         uF0d+IVwsNQHAvJ3emJdKlCrpMAqG9A+DihTfASe5fPt2bemuWOUr7s9KwjG/lMWzAsu
         ihdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kA9f5sjuaRG2vzctzCp8dttJKbGRMLmrAhhg35dIa8A=;
        fh=htvEEUpHDtk2QlMAU++y3A8XIg2wFFB4FT4cjDPjVKM=;
        b=SZK0dYSTa4Szd+tafFs+BeYTEbLzOnHvVFUY6UvNgT6UCoLGF+l32PM+c9UCKR7BQP
         hxddANRzYpXPs96988alCqkAC3w/cwLHc5pE4rOAnTKRvg/XvFiGqfRL6e85UqWdDLva
         i2oQ2h9ilg7A8dfdrqBxlCfk5A6uVYCmtpvb3lhilKQkDaqBJM+HCn7pfH631dl6IwrA
         Ay66UZDEiJ0WAGkDq/fdDkenN9oW+mJruXTH2dq6+8UKDbQnc0D6G+mSVR/GF2l9HcmM
         e4m69mnVe+Ms5ZZt2cNERaie5y4OIXxWFo+Sm8Qt3wGwM7tIjJ9qfu6WmI+TRdDidv/i
         M0lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498347; x=1795103147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kA9f5sjuaRG2vzctzCp8dttJKbGRMLmrAhhg35dIa8A=;
        b=t5IAeqLQr9OcHYi8yhMFHhoseNHSIfksSOPQzSaawIg5iGhwqBaIMRcFuPa3Gnqs9c
         KWukp4xG7jDNeBEGoHt6R7U+ONdyuVkFP1gp1WXElW+hb/h28JMjMSdKuFkknOiz44nZ
         ybH0dhS7SYOkJ74wvVginP3x47g32Ylcswl51n2b3oU/ME6V/CkJ9Youba4Xjt5pQiXg
         /yBG9eRep4q01kfLVLJF8cTYFmXXNxJAXedGxNQvDsihb/w2j9fEgFSoPbaCxjwC+fcJ
         7vapEoboNwU+ernq4iLWgpDUl299l+KVASTIyQMUbTohCjjjvstkQuOo0kgw4Wcp+WF0
         xEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498347; x=1795103147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kA9f5sjuaRG2vzctzCp8dttJKbGRMLmrAhhg35dIa8A=;
        b=wINpsCgR8SZqU4qCCAVjTZa9Vtn/gv3qEHRh7BoBc2VmmTkPXvCwsUE4EOxN7Ht6/O
         yveXwG6futaWxtPEK92b/CUozmN9jIGuOD/899vBms5PTJjdZfpdiyVNCvCP/7VKZTQT
         uUGU+edWO9z8hmhiRBJxPRn+XwYzpk7tRNSZfwqHlauzR7cpfDAMjjyEbuHxPh0LLhGv
         UR1TimVJS9KGJAUcFCDjGcyDMfg7A+kHFclO9ioIq78FeCAVG1XIU1WCUDXWHFu/yqsq
         7coD2pnJuVRFT8IVbtbbFnY/E7U9Xulhhs8zq5J3MScViGkQ8/cIh3n6wD4wL210TUOs
         eENQ==
X-Forwarded-Encrypted: i=1; AL+hErF6kSBs5NB2mi69L4kJK6/ZeVkw/JZWoCa9KOc2Nu1/SjgDkOa1A0TMYZDT9pLmM3+P0sYTa1z+7BVGqIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N4VMfKwv+/f6kRF7h3Xui/KVY01sVBiZo3xN4DYJs5g+ef0AQ
	vhTIXTrmVmPSjMfqhWeWvepTJqXZNgUeaNZ2N3Lnsh8fk97HgRLvPmIoF39X4BM1BEj39yHQSht
	UpT24LQuWa+AcW5BU6mUWxkWqYPtK370=
X-Gm-Gg: AYBFou0sjYRyiNzwOdah5tlP54Mpm8NQjGkTWzyLpTcdVJ0KE8SNAMyvndIwxQznH3/
	q/qqlpf0dIlw+/tbAMck+HLapCgWGuT4r1QIhiYFg/cjV3MtxnqzqaD/vnXiG9is+2ICgBz9VBP
	dEe/WYXdSHbHqMWXj2iK+jKVkervdjUTHd8mjne3PW8H3yQ5RD8LUpCvVR86h1uG8wI29FJElOP
	gPR3lomVf8JTz0SN1bnVcyFK/CS3/ichwD8KyR6DvBdwZ0RGB+k+tpjGC+zNDEBDoDUNI44h/lE
	vo3gzVivYBwq83OaPZR09isWmTotL5DKyed/FY3FZXiClC6B0jbG4tJaYOgxQzlyRAbQEYr8dmM
	fya41qfnyJ01bR24JuYA9NIJJzy4veZu2YFX8Ue0G6VvQmVaNawp6XbFNyYv7P6tI93q8PXYDUX
	Z+1udqOfEGEJVbHeY60jt/jfv3xxkT7FIPkcqmOnrqtlEJZumcnnrP
X-Received: by 2002:a05:6000:2308:b0:48c:5304:5e50 with SMTP id
 ffacd0b85a97d-499c0781a7bmr11850028f8f.0.1794498347231; Thu, 12 Nov 2026
 07:45:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-zswap-zero-limit-v1-1-19f33081b09e@perfloop.ai>
 <CAO9r8zP1o+L-akRDJx80bgGj8bf9rdN09t5upPfkduSmNKwpKQ@mail.gmail.com> <CAEEBa3VA2vycMaRCe4K-qnO3SGCuvAqhECmjmk6PQC3xxERiLw@mail.gmail.com>
In-Reply-To: <CAEEBa3VA2vycMaRCe4K-qnO3SGCuvAqhECmjmk6PQC3xxERiLw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 12 Nov 2026 08:45:35 -0700
X-Gm-Features: AclHuK9YTgclXVDvcKdpOmhHB6JA7-MrKBIZCLI9W7C--1NSD0gtJgLIGYRP7cw
Message-ID: <CAKEwX=NVox_NYML-5Gg6W_gDt-j6gquk3sba9hmbvz-U+t=ehA@mail.gmail.com>
Subject: Re: [PATCH] mm: zswap: honor zero cgroup limits after successful reclaim
To: =?UTF-8?Q?Tom=C3=A1s_Senart?= <ts@perfloop.ai>
Cc: yosry@kernel.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	roman.gushchin@linux.dev, tj@kernel.org, chengming.zhou@linux.dev, 
	mkoutny@suse.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@kernel.org, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	cerasuolodomenico@gmail.com, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:55=E2=80=AFPM Tom=C3=A1s Senart <ts@perfloop.ai> =
wrote:
>
> On Thu, Nov 12, 2026 at 12:28 AM Yosry Ahmed <yosry@kernel.org> wrote:
> > Why is that a problem? Setting memory.zswap.max to 0 while the cgroup
> > has active swapping processes is naturally racy. The limit can be set
> > to 0 right after we check it again anyway?
>
> Agreed on the race, this doesn't try to fix it.
>
> The case here is different: with the limit already at 0, every store
> writes back an old entry and then stores the new page anyway, until
> the pool drains. It's bounded, so if it's not worth a special case,
> happy to drop it.

Yeah I don't think zswap.max =3D 0 is special here. We can violate the
limit by changing zswap.max to a value lower than zswap.current. In
future zswap_store() attempt, we will let it proceed if it shrinks at
least one page.

The hope is that in the long run, the violation is bounded and
self-correcting, because the number of objects in zswap will decrease
or remain unchanged after every zswap_store() call.
