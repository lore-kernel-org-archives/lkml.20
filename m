Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85242980B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280608; cv=none; b=J0Gj9VjiEo+4YvOhYmLzII4/llTng+m6PObq7/xJqCD5sbvtik6iJfJti1PYr+h0z4SXxjbncdrYEXd2ithf2ROaFgE8rk5tw0ylV/CwmdfpnFkjP2iM06MQCvU0z/IfqBXNg1DSl7VCiBNm8MRainm7BBeeELS+7NFLRqqEofA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280608; c=relaxed/simple;
	bh=OChYYTzzpvg53eOhMd9lkGbef4e16zmx4kNsXWHY+3k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZlE7glflHXAOvt3CKgUoWuUt5/5DxTL3QUs/gk/jSKTeiikcYTgLXULqZqvHslV5enc3vcHjUaA4dT1anYb3Q98pNGogcuL13pTRGq9ofIFoB5dAd+ZWmt0AqUuhJVFmf33qYwAgVoKRdqch/tweJY3CSyEEzOyxJxl8IyaiP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0I5QH4b; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0I5QH4b"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso308a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280605; x=1788885405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EaYIWIHvKvoOBpgj/nu30SFwaFUp3YGpCnKBsBQBa0c=;
        b=j0I5QH4bm/1R4GTRWAoOnPkLlA7VvdYhdWGDYmGWLaca4bzRr54i5tc3hEVa8t11go
         Z81C63hoZreQbNeZ6BT2vaYYYdBmOWHJnYYnWkfTaGyTNzB7fCB/BDFDQ+rCgpBdoyIV
         Uo4N+C0xyIKl/GmwNmRIst8g9ztcjxJGHMhRtOMEaRojEklrYHrRtad+qEhBaJAwXSVo
         f7iTxqlVnFcZItNiEyJn+AJXQsQl/tYv/0y28Jm8khUqoMkSL409Es2OLtdDW3u4LS7u
         3xzIJKlFFYF0bt5CVGnIswh3opsxQYT6kaxDM68KsXCxkE/1ckdUHdhhAhLC5kNWdsXV
         o7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280605; x=1788885405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaYIWIHvKvoOBpgj/nu30SFwaFUp3YGpCnKBsBQBa0c=;
        b=PU9Y1WrBde2lj45qVKO8PtfsrGmGS+ABTsRWdoUYpaX2wwPccfy7M2i+2jnqDQXUfc
         PiFNP/EVxrZaOiyQrfDYvSp8rx0edljZIeh0y47jVwOejJzvRVA7wM52NFLnhBfzOqpf
         GpnsisAT2t233wueve2RWan2wiQFjSEDujs7ESvkWswR7IxmCKL5+Ju26zzF4BA/A+7r
         MBHJ4XykQhqQg++2VxLMtaZy9pwPzF6NCvovFXnNK1AfEpupVjUOWahKNTEVGkenpi3R
         tyZqydU/8AAa4lCyrqPpzHJyZ/obhGA+BOQ+O6w+K5v2Xf0Olq8QepSzWvQ9Uc3K3H97
         R1aA==
X-Forwarded-Encrypted: i=1; AKwUvBxqQ8FcevYKaOyDQwxth2zAMwmCORkHEPKhU042FMheG1EfDk4WcwCraziHyG8ZfnsrgR9q4jPP6vWZRKk=@vger.kernel.org
X-Gm-Message-State: AFuF++nK+00nAA1MKqRZxiBYVilLXk3soFHoQbEeIZW4RQdFqMoLWkM5
	gsaTKoQeFQA0WxWKtm4YcTLylBjysK/m9co3tauXFW5PDAQlOR9wv0A5
X-Gm-Gg: AYBFou2ErbzODCgCVJSw9z2fzkhedTlEpq/b9LrgC/P1QKO50kwrDb+DIb9umBbn9zh
	iPyvTXS3s6JnHwu0gVQy+0FauvRVL4hJyY+9BhNuDH0QQUVdr1CF5NH0EAdNteWX6puMWhM3jNB
	yzmsI45xbMhwrCQe538P9l/UBsX/NGf/fsOZfGSR19rB7oFw44MCa/0B5aF7Fb4SyyEvQrpaccp
	rplsZjUIncARv+8mjTNl+a5P3Xe8kNSjJOg2i447mlP5Tenw0xVTwMMBBmWtqpexRCLgoUgOx7y
	vuie/tlLzkKQATYS9GNk7W38cV1AtJaUhD1thO9w6a0NrI67vL1s3flBe9gUY88Hyuv7V19zehR
	TKOM1u94o8GnhPawkmBg/+WY8PPdIdZluUgM3HrVE6zyn2Xo+F3p6DvU7Xt5PzsgYsVbj+G+ed2
	atKKy7iBo/qc2P6ia44eW0Vq/f9w==
X-Received: by 2002:a05:6402:24c1:b0:6a6:2419:8539 with SMTP id 4fb4d7f45d1cf-6a624198577mr14712381a12.16.1788280604911;
        Tue, 01 Sep 2026 09:36:44 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8b47f7sm24513a12.9.2026.09.01.09.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:36:44 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 1 Sep 2026 18:36:42 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Ye Liu <ye.liu@linux.dev>, Ye Liu <liuye@kylinos.cn>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-ID: <apb_Grl4I5o2dxKY@milan>
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
 <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>
 <apVPTt9Xw8kSgmTU@milan>
 <20260831184252.15b978678820a94b106640ac@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831184252.15b978678820a94b106640ac@linux-foundation.org>

On Mon, Aug 31, 2026 at 06:42:52PM -0700, Andrew Morton wrote:
> On Mon, 31 Aug 2026 11:54:22 +0200 Uladzislau Rezki <urezki@gmail.com> wrote:
> 
> > But, i think we can overt mutex_lock() into mutex_trylock() just only
> > in the:
> > 
> > static unsigned long
> > vmap_node_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
> > {
> > 	struct vmap_node *vn;
> > 
> > 	guard(mutex)(&vmap_purge_lock);
> > 	for_each_vmap_node(vn)
> > 		decay_va_pool_node(vn, true);
> > 
> > 	return SHRINK_STOP;
> > }
> 
> I *think* that means we can expect a v3.
> 
> Ho hum.  I guess I'll queue v2, under the assumption that my
> assumptions are usually wrong.
>
Yep :) 

--
Uladzislau Rezki
