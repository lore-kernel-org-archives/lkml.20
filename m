Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A43572673
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096822; cv=none; b=RZXLD77skly42k5Ct3KmjjUQlSG+87Tp9k73xRiHv2Y+xhEqJJblO1adn71Ie7ZorOBibwV02wzAI7a2HhkQFCy/+fFbnPL3zAciCgBvj1Rg157VDVcUdsVXmmore43/8fF821qawZEoAWYEkqOYDiGfrkWoheODG1t/goXBeY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096822; c=relaxed/simple;
	bh=4KVFsN/5kuGwpKOa3epF2KYzarXr3UYUxyjwLe7DiVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLcyH5JtCh+PxUrpVj9Z6qBWSkIgj7UHL6kIgnVvQnvV3mrRHFPUVw1IKlr4wGVneL8MSDIrjLpq98/1vZ4hksuYBUxjeX9ZzrMRtE9CxHukjINJdqSwGm3S9Z9sJknoKcWJvgcrI5gPWYKrGI9QXBNWDh07Dwh0Gq8Yyi3MAo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLS0VXYB; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLS0VXYB"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so66021a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790096821; x=1790701621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAvCIMMbEInVUoFLnt1nZ1HEAddfmvLREQFEVinPu5Q=;
        b=CLS0VXYBwCobKG16cZMNhdOp08kyD1sRbA1AMXFXvkyHANnusLmM08Cr18K+qcmPQb
         dFyFsmUuZVmERl4KYtn16ud8gx75w7lLg3py8m/iDPdmYjJCNC2rlva75lLJTWKnAIFj
         Mo49Uesxin3afrT6oiSYWZ8N5fnDazkDaTqrUFeHpX5pPu5xYLrL+2hGglucQuVFBai+
         Xyaj2RC/7iyZPVFDGLjNuw2ixd48ROKfgsIFaQuNWZv9dYDVXfNGFqBF35Fkr7PGXI6d
         nza44yZE1MoSpoCox3NZH9hSTTOxcDf5ri1F2dXjftAQpph70LNITCrAvnj7cgrgHILA
         +lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096821; x=1790701621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAvCIMMbEInVUoFLnt1nZ1HEAddfmvLREQFEVinPu5Q=;
        b=ZIOMKPBHi58UWTgBbzWnF86WRdrwFTssTAPHJ79yzS2vvvKOxWNhWimB4suk/Haqjw
         DxGSMbQS8Zg+Hu4tO9vBj/+sFHHelW/wSae+eyD2Mq8IzLWQw90z8K1gXcYYzXbLq9P6
         1WQNwuKqEkVRU/gi45B0qOHyS4qr0wzd5qFiWgNCIwBv9EXb5rQy8/1RjgsTMQzPEZ2x
         qUGLkHLonMu/A35UV7VAzwMuHXBvdYpPyv4mXEsKw4wojJD6OtOlrn4kN/+4pXm8RY5S
         FN8SnkFhBHREWokp3i0gT4udlojOnktDlec+eAgL+lUNJttejXbjphm1pwaN4zAQzU6L
         IsYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqh8VjqoSm+dE1ePRrwADQG0wrcBtLUKgMOunhGSZg9/xZfXLr4mvQT6WbRx6m3Qy4J9S8cW21qN3ZA1g=@vger.kernel.org
X-Gm-Message-State: AFuF++kADNm/bs891YB3XkMrfFiaYlk+OhkjTToDHc4xg8JrgsPhKlvd
	1X9RNlVNagG3jYFLf41PTTI3xzgKoGbBH9d5WgWZXl10MYzKN73T3ajN
X-Gm-Gg: AYBFou04q5DyAcPnHSrqjC5nak+/H6kRoVBITRqCVX36qPnL3rlSDIgL1sBBh1316ok
	qyIWBXFBe3caU4R9egCVNk6eV2Gvxi1hK5tJ30Gq72pWZgXmHD+D5xIkyUdjXZHHaSHkPKheWDb
	ExVqQhmJgp5yVhjf1YATxTPpI8g7FkdOfv32BhBuJ84hpY2+jflXq5ufGA5pihvEVEIl/OwgUtS
	nIdg470mjS5dPfoxmP5ESLzR5pZsY3CzQzu4Y5AJ3syJbW6+bYdz+AVgmb0uOEpzZ77VRIWszQJ
	2kjC4aOiqXflaGQPdGAgGdkVzbo4+uMiy1f36CfI5UEIaYdJStDpw9Io+VMzWBRCqmXSFsb+XVz
	hgZAHWSFe44eUgQSxWlp9uJa6+kI3r6EudZgXF49i1nXZ/0fzUxp3t1ODOk+LmQlG1dIp5qxtJ0
	dPq4Y9xJWNwitCgFfqw+315i8FMGwYODAiXEBnsPhWTBNYoi6ENMLShZsRp+Wlac9nsZs=
X-Received: by 2002:a17:90a:d886:b0:3a0:295e:6e61 with SMTP id 98e67ed59e1d1-3a07e494968mr77713a91.12.1790096820503;
        Tue, 22 Sep 2026 10:07:00 -0700 (PDT)
Received: from john-p8 ([98.97.43.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbc5451sm369953a91.7.2026.09.22.10.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:06:59 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:06:57 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: zhaogongyi@bytedance.com, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jakub@cloudflare.com, jiayuan.chen@linux.dev, 
	edumazet@google.com, kuniyu@google.com, pabeni@redhat.com, willemb@google.com, 
	davem@davemloft.net, kuba@kernel.org, horms@kernel.org, ast@kernel.org, 
	andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com, 
	yonghong.song@linux.dev, mason@kernel.org, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf] bpf, sockmap: reject max_entries > INT_MAX in
 sock_map_alloc
Message-ID: <arK1CpHjWpmX0S55@john-p8>
References: <20260915071743.29394-1-zhaogongyi@bytedance.com>
 <dc4bd7fb4d98a0066958a4e1582b6a7a407079fd9a284318848909f9594a9295@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <dc4bd7fb4d98a0066958a4e1582b6a7a407079fd9a284318848909f9594a9295@mail.kernel.org>

On Tue, Sep 15, 2026 at 08:13:48AM +0000, bot+bpf-ci@kernel.org wrote:
>> sock_map_alloc() only rejects max_entries == 0 and never caps the upper
>> bound.  sock_map_free() then walks the sks[] array with a signed int
>> iterator:
>>
>> 	int i;
>> 	for (i = 0; i < stab->map.max_entries; i++)
>> 		struct sock **psk = &stab->sks[i];
>>
>> When a SOCKMAP is created with max_entries = 0xffffffff (UINT_MAX), the
>> allocation of 32 GiB can succeed on large-memory hosts.  During free the
>> counter reaches 0x80000000, wraps to INT_MIN, is sign-extended by movslq
>> and turned into a ~16 GiB negative offset from stab->sks, pointing far
>> below the allocation.  On a KASAN kernel the shadow check for that
>> address hits an unmapped shadow page and oopses:

[...]

>> Fixes: 604326b41a6f ("bpf, sockmap: convert to generic sk_msg 
>> interface")
>
>Is 604326b41a6f the commit that introduced this bug?
>
>Looking at that commit, the version of sock_map_alloc() it created did
>cap max_entries:
>
>    /* Make sure page count doesn't overflow. */
>    cost = (u64) stab->map.max_entries * sizeof(struct sock *);
>    if (cost >= U32_MAX - PAGE_SIZE) {
>            err = -EINVAL;
>            goto free_stab;
>    }
>
>This bound limits max_entries to below (U32_MAX - PAGE_SIZE) / 8, about
>536,870,400 entries, which is far under INT_MAX. With that bound the
>signed iterator in sock_map_free() could not overflow.
>
>The check later moved into bpf_map_charge_init() with the same limit.
>The upper bound was actually removed by 0d2c4f964050 ("bpf: Eliminate
>rlimit-based memory accounting for sockmap and sockhash maps", v5.11),
>which deleted the bpf_map_charge_init() call without replacing the size
>check.
>
>Should the Fixes tag be:
>
>    Fixes: 0d2c4f964050 ("bpf: Eliminate rlimit-based memory accounting for sockmap and sockhash maps")

The fix is good, its probably worth getting the Fixes tag correct?

>
>> diff --git a/net/core/sock_map.c b/net/core/sock_map.c
>> index ca49bc7f8687c..38df842843289 100644
>> --- a/net/core/sock_map.c
>> +++ b/net/core/sock_map.c
>> @@ -41,6 +41,7 @@ static struct bpf_map *sock_map_alloc(union bpf_attr *attr)
>>  	struct bpf_stab *stab;
>>
>>  	if (attr->max_entries == 0 ||
>> +	    attr->max_entries > INT_MAX ||
>>  	    attr->key_size    != 4 ||
>>  	    (attr->value_size != sizeof(u32) &&
>>  	     attr->value_size != sizeof(u64)) ||

Otherwise,

Reviewed-by: John Fastabend <john.fastabend@gmail.com>
