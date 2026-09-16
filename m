Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85364EBAEB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556813; cv=none; b=B3xA60NKo1kL8DjyAbPrZHMhwoOy8YKmZ+pW48hwvyF9UIYnUs3YFsAhfNa9l141OlYpLRU/Vl6KLn9e2YLiDl5wfzqqsp+z7zTXxjMVWMNtvNPa9n2OsOgyB0EKPKrjq+/zDoe2NCYCw4nkgpHwzWyeRB+1d3HseYKBpqH2pic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556813; c=relaxed/simple;
	bh=gwIUkktuidCGPHldmjcD3ZAPK4UHd/SoWIdHNcjBeL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgV4QG9CYKhrBET+cTShCG/R1PsWUgXzwBtV35QOWhUbInobf90Tb3W9ux8w7c2ae+ZafRGW33LsBeJKzIxXlFRlz8CnWIfMSLtZ4dgLYP0tVC9PlZn8mop6sjjs9FLFUrRuZvYKxePOuX9kkzJV0SNst+zHiDSB5WF8M1j8jyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jPCfSzTH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aPwM1F4r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jPCfSzTH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aPwM1F4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789556803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wa6WV+kYrjlESTUxvQTqQFxS+ZtQm6NsZYg9SHCkmJo=;
	b=jPCfSzTH+6qFwOvcnBBrT6XkaxPkTPREnlURF/Z9Rx9CaAO5WXt86C63m3bS+lnYbS7OS4
	0y4t/+dNu/BEXIWOJ+oi+5zpuSWYGwLPpDtwOO4DoCIkhqWAQjQAt4C3sY6Kk52T89QwLh
	WItEeceWfSkLzWurWhgMEIlvzox33OM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-EHkTmSGKPra2WhRJ8sZDFA-1; Wed, 16 Sep 2026 07:06:42 -0400
X-MC-Unique: EHkTmSGKPra2WhRJ8sZDFA-1
X-Mimecast-MFC-AGG-ID: EHkTmSGKPra2WhRJ8sZDFA_1789556801
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4870487e33aso685625f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789556801; x=1790161601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wa6WV+kYrjlESTUxvQTqQFxS+ZtQm6NsZYg9SHCkmJo=;
        b=aPwM1F4r+wFcBT7vPigfABem/suoi+ZucBPIxwi0Oh0y/Y7YoE6cznoAjFFi5Sw9lP
         EeflKXYdtKEw4EocO5Kp0dgv8X9Y4t6vsE8Uus7rNOzZOQWaNwOPbfeB7WeyQBGhA8OI
         BvUodwbaARR9tWFPI/JNlqL/3rTMno+zheMR5p49NqFnKEQEWR3zNkKObAm2Bj2aPuuS
         sn52FeMQEbtSoiQjKxJ3qyqVvOiLs1NeacRiL/w9mwwc7jTGdpqm0WKO7K53skYr9gAV
         kqIIFrY3MSAuHvlr7vaQVJtAkHcnci4HdFNbWpX1rYgDdlpKbB1GWfNDwTvL91m57yiW
         Ms8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556801; x=1790161601;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wa6WV+kYrjlESTUxvQTqQFxS+ZtQm6NsZYg9SHCkmJo=;
        b=kmFMOEsGJ2yniLvkeW1va75vlsZTwVCSIDL2Q5npZtJ9AwpiAQVJmDjuGuc88EiPww
         mQBtviUrwAZX8QjDviNYPXf8EvSWFvfLg0KJeObqZqdFU+bn9j4EThkKzHZbHxMq0N2r
         cUPm7EL9+DhFbhalrwhdPp0Uy7oSxmyAxkWio3kXBiTNGOsqOeMXYyQxxwva4geQOkW3
         4rWNWmifb36XmLTRndFW2JjlGq8h5N5EyiIRa+RVI91ssw7O7+mGUVxfrFI8pQFjRxYC
         ZCjZazJQV+BAQhk+XTuehk5kc1Yq67Yv4TDqzcYBaKxJA4SCI9HPru0fvhFBFNCiJvQW
         u0pQ==
X-Forwarded-Encrypted: i=1; AKwUvBycbp6G/8Aa8NZS1I/EJ7nqLtS170in0vQO2SkIdJSEUXWeHugeYHkhpzwGcQisfa5vMtPLahWwtV3C6Us=@vger.kernel.org
X-Gm-Message-State: AFuF++kdxpOOdo/IiJORNs8F9w/MzcvqejEtaFk/sGFUUwQDeeLhTrNN
	LoWIs8O/YhWTz/fCtuoqLIZQaNw8PzliolHJYqTsFjBa1A79wTvUJmkMYFFgEADZIQ+6yRyUp5B
	uf9Pck+KJKyAPoH1unI/vgBkE+1jJXrtyFraYO6Ado0aaPTcMhvhiL9Qj9gcTLLLAVA==
X-Gm-Gg: AYBFou1p+Zg6HJCAwAPCABcc0nfDzg1lhAjXYuI7TOz42uixWNECuPIZ6PbE9JJaF3d
	99Iz6fhZS4IZKo3NnLCtFHyK25/73p9405C9ZMWyg3p4LQZpki8hVmbZPDholYJ6cyQnXUUfHzO
	CJCyANF9Lu9kLI03+R50qfOFB9c9rtI095vKeE360l9Ov7A0ezoxVpltnDrDIBnxubUlfEFoTeL
	QhE358B3YdVbHNyhghz0P8XJUVzOF8y+O5Vdueh3UWWl9IKtWjl/hDxg0U9PI4GJ/dE4D2O22EU
	QAz0gA+lXsdBqulvE3xdKHF+ncvpMradB0C8HU718U5FimfOJIMbekYtsiEH9hF8ChJUpcTKrpA
	lGcsDZrc8CHE4bPHlF4Vv9VwFEOFb
X-Received: by 2002:a05:6000:60e:b0:486:e901:e59 with SMTP id ffacd0b85a97d-4870d05a86emr2951051f8f.31.1789556800610;
        Wed, 16 Sep 2026 04:06:40 -0700 (PDT)
X-Received: by 2002:a05:6000:60e:b0:486:e901:e59 with SMTP id ffacd0b85a97d-4870d05a86emr2951010f8f.31.1789556800204;
        Wed, 16 Sep 2026 04:06:40 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-41-176-3.web.vodafone.de. [109.41.176.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7659sm6964448f8f.3.2026.09.16.04.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:06:39 -0700 (PDT)
Message-ID: <4fb988c5-3dc7-49b2-aca8-45f23e71bad3@redhat.com>
Date: Wed, 16 Sep 2026 13:06:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: host1x: Allow entries in BO caches to be freed
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Simona Vetter <simona@ffwll.ch>,
 Herbert Xu <herbert@gondor.apana.org.au>, Akhil R <akhilrajeev@nvidia.com>
References: <20260515-host1x-bocache-leak-v1-0-a0375f68aeab@nvidia.com>
 <20260515-host1x-bocache-leak-v1-1-a0375f68aeab@nvidia.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260515-host1x-bocache-leak-v1-1-a0375f68aeab@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/2026 04.34, Mikko Perttunen wrote:
> When a buffer object is pinned via host1x_bo_pin() with a cache, the
> resulting mapping is kept in the cache so it can be reused on subsequent
> pins. Each mapping held a reference to the underlying host1x_bo (taken
> in tegra_bo_pin / gather_bo_pin), so as long as a mapping was cached,
> the bo itself could not be freed.
> 
> However, the only way to remove the cached mapping was through the free
> path of the buffer object. This meant that if a bo got cached, it could
> never get freed again.
> 
> Resolve the circularity by holding a weak reference to the bo from the
> cache side. This is done by having the .pin callbacks not bump the bo's
> refcount -- instead the common Host1x bo code does so, except for the
> cache reference.
> 
> Also move the remove-cache-mapping-on-free code into a common function
> inside Host1x code. This is only called from the TegraDRM GEM buffers
> since those are the only ones that can be cached at the moment.
> 
> Reported-by: Aaron Kling <webgeek1234@gmail.com>
> Fixes: 1f39b1dfa53c ("drm/tegra: Implement buffer object cache")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
...
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 5e7a63143a4a..d8f052a85b75 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -143,6 +143,12 @@ static inline struct host1x_bo_mapping *to_host1x_bo_mapping(struct kref *ref)
>   	return container_of(ref, struct host1x_bo_mapping, ref);
>   }
>   
> +/**
> + * struct host1x_bo_ops - operations implemented by a host1x_bo provider
> + *
> + * @pin: create a DMA mapping. Implementation must not touch the bo's refcount.
> + * @unpin: destroy a DMA mapping. Implementation must not touch the bo's refcount.
> + */
>   struct host1x_bo_ops {
>   	struct host1x_bo *(*get)(struct host1x_bo *bo);
>   	void (*put)(struct host1x_bo *bo);

  Hi Mikko!

FYI, this now causes some warnings during "make htmldocs":

WARNING: .../linux/include/linux/host1x.h:159 struct member 'get' not 
described in 'host1x_bo_ops'
WARNING: .../linux/include/linux/host1x.h:159 struct member 'put' not 
described in 'host1x_bo_ops'
WARNING: .../linux/include/linux/host1x.h:159 struct member 'mmap' not 
described in 'host1x_bo_ops'
WARNING: .../linux/include/linux/host1x.h:159 struct member 'munmap' not 
described in 'host1x_bo_ops'

If you've got some spare time, could you maybe send a patch to fix it?

  Thanks,
   Thomas

