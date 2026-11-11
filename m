Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371742;
	b=1TgqvMqIPLiU4p/C35ghNxN3wvyl5U2YfQXEC8Y9TkLUO/Set5R30BQHcL2/m85Ny9cm
	 bVBlcFguzBDYEW5fgM0puFKWNi7GfJLfpSfEgpmu7PV6jAqIGVE7w5gBtlZGz09odVmr0
	 tfaVDYH2vk2U1DsY+Ao8K/fyEsnjuxo+0bPXelPG/xIKD4sqhHhYEHKB3yhcdfgLhZQUc
	 P02MuTYWwDvTBdFSUU5AsE8ZJxzlGLsF2rUY41NoOnkMeqH5xfyOZMiYgnbmuWfuSKWil
	 te7baWQvXMOcyvVGZr+XbYjPzh9L3Ek6cWCVgYWfiWNoeOFhWKssT4BqRpPWWkPagIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=d+2K1wGIVnYOeoOARc9NS/daCrePUls7APEF5NmFi9U=;
	b=nPeH7L5yr5ZkcNomllpHydSF3Y6ENpXN4kn6y00RvDdnXlpVusjDYfiWCOWJ8lfFBw+X
	 Fx263uc4frFChZg+VikdEFfBRkzukXXm0Y7iLirTz88YXpQ+4JH38YUBSot5Bf0COYFWY
	 rMJrQR8u2/UqLCW9EXDmCRIRid2TACiwBhuqzxtuGxtJHf0mRaVFWIn0Faf3gtr45nQyr
	 zly5FWnLoGt6dbw/RzI+GoYh97nx066UmRq8DicNqgRKd4swxpBF1DEB6qdz/m3QvyAss
	 zo7sr53GZjbCwQMP7MXISDYZpCAOoIu35ZsImdOesFV3NEco16+nDoult3a3ekQs7BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="a/f/9JBF";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a/f/9JBF
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e940d5d2beso10806575ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794371741; x=1794976541; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+2K1wGIVnYOeoOARc9NS/daCrePUls7APEF5NmFi9U=;
        b=a/f/9JBFKhzhjWBd+7eDHscvciCAcbHSbGpi/0zqZZzJWio09+N9JN2zsfJWNHlITO
         vIri1uEFc3iY14F4xttSMDwiKA8PTRkbBWwYe2FxvuYzNTfVOciwiJD6z4QkEwoGzvb6
         auqwJQ9sKlkonPEYeAK+CR/qrzeibqO//Vt/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371741; x=1794976541;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d+2K1wGIVnYOeoOARc9NS/daCrePUls7APEF5NmFi9U=;
        b=2DNvMJGA3hKL+eEO4fHzSCv+SmAn9cG9y0sgVUcYeVsPAHYPcG27dd5x9sH48fPksq
         oLEsFFGWtUG8E6ZROLSxdl3zAYNil+Po+soJaYJnzsRZVA75PSbx7+GMtctmOzC/wSvh
         A152KzVtS4sjcRwngeUzX8iWvxlFiDXj5L5GzKWa2lBWrRDF1lmWr9lGKH6r//budB4K
         gu0y5QInLkkMY/SD7Zl8EnqkUrGhXBGvb0bIq+V8K3LvEdPTJzBj//teVHh0nk99Wcqq
         LnUvP8/hsybXvJOamTL9xXjXE2tQJl+CfLqK0LIGrZB4A4xCJyl2GZYzFkdxa/mNyCsX
         IH4w==
X-Forwarded-Encrypted: i=1; AL+hErEBH9KVr8+t3Iq7g9lSqoUShS41Xs4dNbn/+E9M/+ub8YCDNgA3Y0msEhlm4jHfPiuTpPWDarbWmnfPdIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ck64noQEqrnshFPempEcLmOA7z+KFglQKEOOWVrR0fKtrSJbF
	ZTnC+lWfhIZpcCuosYbW3C+37ZdvLykketlJzri7Zb6ySKwwAS/AiLR2+BODKe5TpA==
X-Gm-Gg: AYBFou1SC8lwKLNS+WuRF9YsXdSNvXjLbIU35lzdjsrNrbhiL1fHPgtJopPUTR3j4na
	1ajQ4XA/ocBwl3EDE8LVATNMWLv8gNQtspghu5mJvzChsmdJBSTMKQzGdZHq2IV+b9uiZmSTwfF
	NOhup9nGoiEdsz7oQIB1KAWRWlUpLSVoprg1V0OT/GuCqI0QL5RbZbJbZXN3xTyJX+0VEnE/hq2
	bhqZaFbmI1xlI/kFryjq0W3HIfd6UQBGH0pMtVxe5jUGU/J2B2YxgJu3gG5S6pQIxqeCsAZaG7k
	sLbqTIPj8d6Y2raW1Jhc1obt7uNCWTVpcYYLyw7lBCt7gtYQTmthLB3TqxAogZ8ipV5m2AOG65o
	jp+lZRWBJPw0eaA5jMOUuNcv4od3jX5z3MwBuGZKv4w1ZsHmBCME1P/Omwm3l7SktHkixzCmo6O
	TqVq4ASiSvZ+TCpxC6JC5FhgVg3xyr3DWx006E8oMzPPrewkQ2qWbw9CX3lCIsV5KxFjILFFehA
	gGLxrNAaSEWX/eaX8iBST8WNAFyBsnkb8bj/rZpNQDOUKYxFkzd6dcxVzuLDZ0XUU5OTMO9Vos/
	qSG92mpQixa5bdB4OPGbw2KkSibqrUj/bN8vf0NQRc70xiDqziNqXbpaf7WKnjBMXEbZyA==
X-Received: by 2002:a17:903:1b27:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2edd7b85ea9mr12903415ad.74.1794371740975;
        Tue, 10 Nov 2026 20:35:40 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dd2225sm16527065ad.56.2026.11.10.20.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:35:40 -0800 (PST)
Date: Wed, 11 Nov 2026 13:35:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
Message-ID: <avPwLHMalD_kzD-z@google.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-1-caee41684aba@gmail.com>
 <CAKEwX=M6dJMccGcDqp2S-66cbegdivnB6MqQRj6tQ2u18UH62g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=M6dJMccGcDqp2S-66cbegdivnB6MqQRj6tQ2u18UH62g@mail.gmail.com>

On (26/11/10 08:00), Nhat Pham wrote:
> On Mon, Nov 9, 2026 at 5:59 AM Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
> >
> > CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> > counters are updated regardless of this option.
> >
> > Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> > stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> > debugfs is unavailable.
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  mm/zsmalloc.c | 33 ++-------------------------------
> >  1 file changed, 2 insertions(+), 31 deletions(-)
> 
> FWIW, LGTM:
> 
> Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> 
> But I come from the perspective of large(r) server machines - I'd wait
> for the feedback of embedded folks too :)
> 
> Sergey, how do you feel about this direction? We've run the stats
> collection (even before we select CONFIG_ZSMALLOC_STAT to expose the
> stats to userspace) for eons, and it was never a bottleneck AFAICS in
> our fleet...  And the stats files seem trivial, relatively speaking?

Yeah I guess I'm fine with this change.
I think this can be just one patch.
