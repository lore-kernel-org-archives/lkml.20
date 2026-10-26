Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997555;
	b=4SWvm61FR31ZMlfWaRm8d6SlDDb/RDnt1BkEHVHDaC0p3g6b+oZLJtvE5e6tqJlcyGIw
	 ii2fvV1TOR5uKBBjfno/WPXAy7flM11tyEb6d33mkIA31Fiq+7ToqC4ofRaBWhiQvVgS8
	 rlbiDcwzOMJEGrLai0GwhWHlMeuIX/eToXOZedHlBIQJfQXVRypdN7nvmwe0+iCjsJvmo
	 +GP0cIIYRwY+1IzjaD5i0A83jIN8KvpOqgpaVxQKYFfxEWOEkGgDOqVpLQw6aJRwfiVr0
	 TM2JIlhdQ8zXguK6oev7wpcE4QPTMi8xEramioncYFvtzBQZsnY39vpmgHvuMYaH8Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yMkHVJrgkXiylHKHm06Xu7QUXMG7Q5NGsbYNWZu/ZwU=;
	b=HZIMm93OfU1gfLQa8YENAT3CIEi/AIQSXJibtvQ7xwfLPEMY4L9dqRFgIG0AnFt7ui5i
	 yRgKdYxdpdPQJDdGpjniFljVXVdmvSWqlkPqja15i+tMcADgKPSrPhufCzeefCJZVJ01G
	 I+WCXXS+vq0xf7nP27SE3pzXwkMAZOT0S+VjF8ATkXR/KElRr4nBenwfTTjIJiDuYt0t7
	 oW4x3AgYcSX9Ugji7LG0Gt94erVDehFmWJtBnu2+GJA2fCOatNvZXys7mLXI+Z6AX06FN
	 pLyKpmJaJ2QHBJNKWM4XBEj0xmprGjP3lVXuPFHylNHIF10MsEdEtqf0eH4wB4XhjaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SxGwUTtV;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A2606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SxGwUTtV
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e4831c028so1044733f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792997554; x=1793602354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMkHVJrgkXiylHKHm06Xu7QUXMG7Q5NGsbYNWZu/ZwU=;
        b=SxGwUTtVzjzbvn4wNNGTDPq2xSbvYvKr8eRUPZz4cOkz9z8oNQcW+IR6ZhHnFmIkae
         eG/pdt9MsQQPKoL1W8rD8E569hqrZ+MMMHIiSimfL/iEBdg3TcnTGnpZuOsXl7O8GUET
         QgsMW+/R0WK6Jl7XDEHj4iQ6d2lhDb3AoIMQzvLwyGeuo2Su5D0hJNL+jKfZSNQ2NLft
         4IEuH9zQhSnEUMDQfGoDcLqs83HICgE3/qzX94HKOygJ7L9MGMKwulIHvAlfcKDB7Zcq
         +Yzn54m2MAos6kAB9civFPyTY/UWq7NyihKqi2jS0oyfELA9NrTn3vM0Tu2NHUtQLicE
         K90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997554; x=1793602354;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMkHVJrgkXiylHKHm06Xu7QUXMG7Q5NGsbYNWZu/ZwU=;
        b=WXGR0wy5xTmju1cwc6PVMisH6Y9Ba+RPljV49uw9KE/1exsZ+H4Rv5P/nP+Oe/cSlS
         6C7WgezzAykhppdz5PYbxpiEAonKWwHdT+sZDSNlaBtGbwpOmSuNSqYkshxybjtw4ltD
         Idx+QqVQxduDknC95Ri4lqIP3x7Z/9ZGX9EFqcyBsnjz+nbJW5cp4ScDC7kljJYM8Kw0
         qDch6pGLOKa35qW+sO/j+++wbvssM8jsWNfYOaWRG2qWXXfAG17iGokPfCbLmsnceZwD
         7343UidVc0zJBeti81noUJ0pS8cOt3vJSdd7nuwR9/UT8ZjtsCkBP6R3/nEGwns7TOcg
         gVLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHKwIJbAugCqLusqV+qi8dfMM27SaIC/4JBc5PHV1nerxfYt2snTlEpwcCrxPq0o4fmefqE+uslocRM7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWjpLFwTSXSeJ5amgv1OXqaCvoOOrVIhtl1uKL2Ml/DCWhE4EF
	mjcbAQrQNZA9YcguXyY4D/A0wGZmdPr8lXS744Giz0JFsNtEiYInOLfrtiJASZk8BaQ=
X-Gm-Gg: AYBFou37dV4uzluHBu7OB2TllXHjT8VMYxnqTXglHylq8wfz7WnASqe9hFKaglyNdrg
	FOHzkGLsMFLAWwH3G0kQUbe14voJHXamVTBF/NUrfTTj1KSmbqdL/7l991GL5OeBw6gvocdvmxY
	3xCnkDxku4eTBlDTDL+HQluIvTU92LOfez7er5ZPiUJC0AJFcpUvbllNFLzz9rQCR85oay2mvQ4
	eRVYG2cFhBs9wcirut8Oq7kGTXqEbEzuFKYW1cnD3OMdkc4Hj3oZ3LvqPhJUXNDnU+HLBWY7rsw
	0YYWaz/Pz/OsgJNI2v5YfynrNTeC9Nk8oSgUQ4ZYk33h75swZMpHlhh8ILhT2N/5nRpmd+abhgu
	0rlTbUKi2DUf2TPPYBq/ncw4CIDHJ8JQdANGfgkXudpm7/mv9iGhUPZ8j5JpqVrVu8b6R4lV78y
	mpkLL5SCAchc403wemSggtv98jz/2jEVVXJYCALR7GNjThSfUxHqLN3WSjuh7SCsfrlATW6npfZ
	DFnmKW8x2Cfbysjst+w/R8Zv+EO0miHAAV/LIhwCx/WOpu87S37tjFeouyqMJrdBSXN6A==
X-Received: by 2002:a05:600c:3114:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a35acc7716mr97917815e9.20.1792997553574;
        Sun, 25 Oct 2026 23:52:33 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb819729sm7049215a91.0.2026.10.25.23.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:52:32 -0700 (PDT)
Message-ID: <96b705a1-81ad-4e89-af71-a27d009333b8@suse.com>
Date: Mon, 26 Oct 2026 17:22:28 +1030
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: return an error for unrepaired RAID56 scrub
 sectors
To: Cheng Yongkang <teel4res@gmail.com>, David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025180304.349254-1-teel4res@gmail.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261025180304.349254-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/26 04:33, Cheng Yongkang 写道:
> scrub_raid56_parity_stripe() returns the leftover value of
> scrub_find_fill_first_stripe() (0 or 1) when it detects unrepaired
> sectors in a data stripe.  Scrub callers only treat negative values as
> errors, so the unrepaired state is masked as success and P/Q
> regeneration is skipped; a device replace can then copy corrupted data.
> 
> Return -EIO so the unrepaired sectors are reported and the corrupt
> stripe is not treated as healthy.
> 
> The masked-success behavior was reproduced 3/3 times: baseline scrub
> returned 0 with "finished ... status: 0", left P/Q unregenerated, and a
> device replace copied corruption.  With this change scrub returns -EIO
> and the replace is canceled; healthy RAID1/RAID5 scrub still succeeds.
> 
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

> ---
>   fs/btrfs/scrub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
> index 479c0e0..ba2e27c 100644
> --- a/fs/btrfs/scrub.c
> +++ b/fs/btrfs/scrub.c
> @@ -2250,7 +2250,7 @@ static int scrub_raid56_parity_stripe(struct scrub_ctx *sctx,
>   "scrub: unrepaired sectors detected, full stripe %llu data stripe %u errors %*pbl",
>   				  full_stripe_start, i, stripe->nr_sectors,
>   				  &error);
> -			return ret;
> +			return -EIO;
>   		}
>   		bitmap_or(&extent_bitmap, &extent_bitmap, &has_extent,
>   			  stripe->nr_sectors);

