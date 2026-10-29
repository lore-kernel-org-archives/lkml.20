Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793278844;
	b=TKX5bbSD2aLQMSUWph+mSaUbnvijRu7eE8Svn/okgykhnmNJ6Yb0GKyY7IdE6tCHWB9a
	 4Eu1gB3mPdmwttIApeZWxTzOmBYhThoI9hxH5ZDGVr/u9AuwPeljhYTA8Aq5Ojq5UhmFr
	 wCclzgED+7pIJSNXn5EBtnxIp0eW9iLxBE/9q94/pTreHJio6dKXFSJwTChh5yE7XkeFf
	 YuSuFQ9VLEW9zHSZw4X2mhR4REdGIHlGc+k63XlZfwlCmfKLyUnyuS4hTbecdgBfe2yy5
	 FrRhCnXwjm5wS0709SuxlLO0ULfYQOzZhvEgbnUrSxxqKZYeydmxqvgJq6fuDf6IMbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
	b=1rVWsqhhc9jbVL7u7FOPqTIRTRrQizRPROD5PUWqJbPmQT9uew0/heVa6qiOhQ5Mf1Nm
	 /SSSIFqZv8m+8J53g3bLJAFeHw6S+SOuA8TZSvWc3QwJ/QSLoizoruH5Zo13N+3YaEpvp
	 T3SMtzqTBN9/x0Cii+LE4CgtfPvGm1+dsmMISDGTktUJRW0z0f+OvqKUB5X8i0n2yCFnt
	 4NoiGhpwJfe5dTq+Wl85pEozymfch4QFHKqyAGWmkLSEy5RhUPqDUdeXfTii/mdxLJdiY
	 Ul4y82j9U9OwcYelHkqFMp3pEFt+Tfdw2/Dhv5IPBkr/Il7Y1k3uvv7ZK3SrVPgSmqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0uVrh4f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA80A606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA80A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x0uVrh4f
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34c522572bfso308677eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278843; cv=none;
        d=google.com; s=arc-20260327;
        b=VMY2G73wggxTYNACKx/FiD8CTClvyRGIQ5dgZsAGFzoWuaOFajM6vv5S2R6Y4FXZrT
         nxAhNuoClGhF145Ds4u7ZERTS2AxenMmkGMFhdEQEXxlBhSdB+qNHvrgo2JyE0JgNuTQ
         XeUu/aWlg9m3+70eZUBFHHvxSnTixamFBmRS4mgLqO/9eY6bVgK92OO/twUlBcZbVHau
         pNMtgnAG028S/U+NHkm+PBysULwj6ilRhGV7DVoJSVgYk1i/7PrwHBSTyoCz5EuCUrBJ
         KO2+vf4mB6ARy+qSBNU6g/z4uCbMdNF6usWN9aWoFtghcYC0npWITTtU/OtR46kM7iJs
         83aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        fh=KhEh//S37QsptdygU+IgOYlpG80VH6yXP3tVNRoziSU=;
        b=o82ux7K1FtMdHnUHIL1H5AsXeXo1iJPe5eFH20mPDqgV22mGKKIRGNNuu/k0vh40+Z
         LJi0qheOyWivxuIAZ7s8cRscpWLU+HWuFqFEr871ZArC/IfBj/jnhHWqJ3+Vs4pIyV9l
         rQWsKKSxfmpedOhNty3iJ7qDjT9X6B3WZHrIJ0yqVkxe7jMey46jr1co5kg2pVhE6zmj
         5H8iccvOwXL9bUhXeR708mtaBSJlg1QV7PZOKaArrE+SBYYwLNw/gNROKhKwH5QbYV/J
         2jT09h7aKbcBOjvbWgYDnWuwNA2pNh9r3TateqvgyUYc9wrkYTByYjZh160Sn0dJAZUM
         LbzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793278843; x=1793883643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        b=x0uVrh4fq8/oKA8pxygRZLoyNCj/LZ2CYi5iiE7sT0F3m4cQTHk58RCDC5/d0tWCh5
         W1iyfyZQ+tDYPgxZjOiiYIGTLc2A+kozS9Vv/msqpzAVXxtjB8rSwN7z9DC7HnMAoE6L
         c4RjCKveI7UzUUlUDqztw3MSHiVYR7D7bWCKBtPLqR+9BlAoUOpcRVZ+6Niby+LPsPOz
         AoFScOS3HjFol8ohqQ24FB6NNqwKWAVtzrhs7It+bUwgK7+s10zlQ6NsbUdhPvQrx1Vo
         x2oVDkCEpkMw2fAJMHjq4yAXeaEikbHKYhcLAJE5P5H6Bt8v0cegiPPjUr9pF5QU8G72
         IB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278843; x=1793883643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        b=Aise59GarM/NFF6vSXM6N/zt2Ww/4lsCU+IBD6B0MsP8dC+4Rofebahjcbg+eI2yOk
         zLcngn6AcDFAuIT2NiknsxaFhM7WvnrZbO64fjGbOy+PBVuotr/E2L7QBt0k1S4dCF3M
         crGU05Vg78+c5xil5P+WxlkZ4F68Y60TYO5huvY92UHzgOTRf1eKZ+1Rx7NpViZtCDMG
         BQCWFWa16GgeObUrxqNYSwucwf+XOP9o0Irmp1JAtHzVzvRnPiaxk4dZ+UGjmNFDgMHL
         WFXfGknRGRxhbXjgx5PBmwFp0uhNP6PaKFEN8OUCP7ky8ayjyshvPOsGXlqZJ7Fk5n07
         vFQg==
X-Forwarded-Encrypted: i=1; AKwUvBw1yd5E9QVfnmb9gwyDbDr3a0Jz7ZE4ml3BqmzDxdV1O5ctZtpeHlCUyIzKPtThj4z8j7I6PZFwXFzuV00=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX23k/8lTBlX8MWrYLgqWjukRAcwMD2PY3aT6t2qsm5HWRu/ip
	BrVyA6gRCtG/VA6RTfaLTjN9VYGIiy33VwyDD22kMbBSOGSUKmKcwch1tBtBCY4sHrAJsniig7K
	5ZZ75CxB0L41jyw7BtFOfB+w9I8oPCnE=
X-Gm-Gg: AYBFou3L9GUTCLlsGfNWLPJqtN+get7LUcR9f4pwqDRSo1EvsQnmwcj3bl2qRspR11S
	l1Et7l3V5H5kQ8OXw1qqG4e2rkE1NPJo1SvP3i9cZlg61DgJDDFBH5dDUUKv94poxALXybM5bFc
	Fw+bz5o2hIOgw/tXd1GLR1PgXUajwgjuan9ZW8yaGxI5FTsqYTaWWFyb1+DhxNEjiEJcD20FTC7
	m+tK7jcYvfb9lfQrtCWLyY+ftO0pIn+jyVFHzFNx/xF2ChLdzvX4rvw7N8KbeRKJ/qTOKuy9caQ
	FsdijUiAtTBLvPB+/FtmrDN0pHMtEdmjo1yZCgxqxp1e6adQLvRDMZSxHbmJSGpZfnUlJa62pt3
	jfAGfWlkEXC+dd5mdVpRrGDfzAjuCkdEaC4rCm4wJnCdznrF+x/WqY9ufdMFPs3gD3Hrd3LnjJA
	TeAqMoH6f5xrGEC/TN/zK5tz3CQd7Pn/pzttZD1xrNPxk6d8wMzTYTHgfk6FCFe3TzRZ2PkszVZ
	dN+i+6Gr2UGbnxvY/0S5LJggVgE4qRHK7MjQA==
X-Received: by 2002:a05:693c:4196:20b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a202cb0e4mr12034617eec.2.1793278841146; Thu, 29 Oct 2026
 06:00:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <5bfdc1491d297b5e98cf42322c790f06481c28c7.1793027261.git.d@ilvokhin.com>
 <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
In-Reply-To: <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 14:00:28 +0100
X-Gm-Features: AclHuK_VOCF7u599iESvOsHhN0DoC1VeK-LagvEMwpUC6WNOUUTl411X-macJoc
Message-ID: <CANiq72mMm75svCqevd8fHtVoczDpvpo4NwL0SC8=bWy030vQuQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/gem: Switch to __nonnull_args() macro
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:32=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Should gem.h now include <linux/compiler_attributes.h> ?

No, it should be included for you (unless you are doing something
custom with the compiler flags etc.).

I hope that helps!

Cheers,
Miguel
