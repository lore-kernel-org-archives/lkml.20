Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890143;
	b=hrIBuk3wjewdRWjgkP0BAQiWF37E39QydJaUYzThFAaQvhHohvh6D+3IVI5LCE+8k+66
	 po/CjhIrGEsBsILFKx9VRcfaf1MW76dZHC29DJ5vDA8iFh18KIzymbhjafoin61yeBxUn
	 hhGUo1VGeofZsLAY5L2WIbY4ZHvUQzq1kbrtxJwECQyEpXkxe30ubRm6JO8eZRv3Y0Brf
	 kXSanfMj1hFqVUAhKN2084qwyzrg2t2x7mwbBB1t1OXqtmwxtWpUXMT3hEtcQ82ek9bYI
	 2ZCgi+itkmGkz+L6ivdTqB6vbCr2viWtuoVhEnNQnsHyH1VFBEaT6/boniYkX0VttFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=daroT/s6pgatD+xL/C1aynjiNgPs/2jftgYJiHOkg40=;
	b=Bx0pub7MVPw6E/1w6sAXlGer8FxbNF3WNIJ0mVBhew7PU5GFrIwduWg8vIhAVx3cavIp
	 Lj435TawpqDJfCQvOOcwiNj85sQbdGLzU4KW/4p+hXe47um3xcQbPcWwsTKR08wNkZZOa
	 UDtb4Mj8AQo+wuJXJxCuC3lRuhbNEAImGQuVVfeoeeeNQd6m+uFP0f+ZUqEB5dQt6PPDs
	 JVdAjq+mN+rdGRG/yngPr12ISfioU8/0cZsgh6PdbXVRcS1V8n8R5dYzyU2w67qs/qMTF
	 x1KYIQvZ/36FwkvhvGp6tMCpU8KUqi1D4KWEQ6E5MkGi4oMf5IihuXZky5O3ueJ+Y5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FZFX4T7A;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDA8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FDA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FZFX4T7A
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4697404c2bso564081566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794890140; x=1795494940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daroT/s6pgatD+xL/C1aynjiNgPs/2jftgYJiHOkg40=;
        b=FZFX4T7AHlUeo/Awpzyfn7kGCBDJnhrroj11f9bWGSnNN7/gR8KpNwsqHnvlC3LFBw
         vWjNl1xpx/15ye8Luw7sGKOeIJJSZJbQS9BtiE3jp7FCg31bk5bu2NKDdyTesigwQoLS
         9lBDASoZLuL0C6jBLhOe6ew8Hor5DzkzkbyhTjQYzNzDfGA1cvVgC9MtmvGsKv2lFaXd
         Kx92Eu9wpWJs6MSRELWhUsaSCC2kAdMQimgcYKaQaJD+oJE81aeyW5iRZE3odfYSlBAX
         4ewWyC0X0kmlbZEW7harZANz/jcUwiJyY/nbxikwqBQ9txbtmjKNkDqt0Wb5R3J64wws
         Xjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890140; x=1795494940;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=daroT/s6pgatD+xL/C1aynjiNgPs/2jftgYJiHOkg40=;
        b=o7uLHs+RKUd1Co/352Z/MLXnZcH3fakXmm0tsLvaJFhpaYV05HzbEzHFF+t3WElBfQ
         k9xOpbj3WFTu7pn+SZwVpC/Fw6moIhGfhRUr31L8E2XjEVoXNinigz+6RA5dFzLgiW/m
         587DBsUPiy1Opo8Tz0uq9vgL203+qGbDCQFaMZdvQKtA1r5Q4GEJdvEFHhdr2imHw/Uj
         3CIF6Xs+fFtsviB/rnSqBru33MLKCCT5sAwt7wxtzhwed1ltJaINjMO1NZSyYavz4Sld
         R4b2l9mAVhMgbIgE57gY59uH0I6Y5LgaHhYN62rowbMdv//jiuRRrQcfPwbaie3sy6fU
         UQUw==
X-Forwarded-Encrypted: i=1; AL+hErFzvSXiAJUL0Y7WWRQt0OGrj4DmKBLeOQCyW3XkoQ15liQDN/5uGD6K/kFeh2qn14pKQ5QcoSYxyir1txk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AFbohiclObPjMSK3q9iUlffzLzk0lgIRYhGvWNGowxYdzMJ2+
	VAQpE433vSb8UDedtCKu5kjFGpbTc6azRBRAiJadYW5bkG4zKBQfIS+qXvDwACPtkeg=
X-Gm-Gg: AYBFou0t3tUGsYxdiHzskUG2FJGkot6bUbUa/NRT8BtjPaPeGiplCnL2akcekDWQsnJ
	OlCBGJPMhnGgCCpo1PF8d6BzQyvaDAZaS6QqMgRO8JXyl2KhBv6o08HqmdplpGnwIQAKkjk5aFz
	KWmGKCtOAiY6ssGPJRjKcqMewOdfGqPIwgh3fVfTcqxIKlBOiQ22pOb1sNrOIn/UhvUAKnPCG5I
	eDLdTU5g4hPNPcuS4/3zXBsxVH4REO6WuDsmDLtZJ6+iyfnD2kh49NIFC4Ofzm2Z8TcoguCUreh
	pB9gbEMj25aMkQpzgPYqZ0i71qA0I2fNxhTop4QgJXx7vHZvoaZcntouZmT10mK2UR/BMelrb4P
	KpApS/SeqX5oWwPL6vKPvjHNa107AEU9xfCT04tzFmWEwwadhj/WHd3i/kuZENr4IChePzZGUj4
	l/18ginJgbTXSOaBNMjYD1lJwZQFcBdOwHrQcbDdcoNA7G4u6ZL2AqsmhOsPtQFhLGiyzfJqdhh
	Nhbkm2wthFnA6qO/NWvrrYft+obU0HoIy44nNd4//YwNFPPuTWNkKb6AUx9nvESnLU9dNUYQSZE
	bis/NzlT4us1JCFhcuHxJZi9Bwd9lgRqB2r/lXpep/U=
X-Received: by 2002:a17:907:d0a:b0:c2d:d408:5d9c with SMTP id a640c23a62f3a-c509684ba8emr947663266b.48.1794890140325;
        Mon, 16 Nov 2026 20:35:40 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a81e42sm6928845ad.55.2026.11.16.20.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 20:35:39 -0800 (PST)
Message-ID: <1d3c9236-89d0-40c6-adb9-31299a96b6c2@suse.com>
Date: Tue, 17 Nov 2026 15:05:33 +1030
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
Subject: Re: [PATCH] btrfs: tests: zoned: fix NULL check of the active bitmap
To: Yifan Feng <evanfengff@gmail.com>, David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117035155.86323-1-evanfengff@gmail.com>
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
In-Reply-To: <20261117035155.86323-1-evanfengff@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/17 14:21, Yifan Feng 写道:
> test_load_zone_info() allocates the active bitmap with bitmap_zalloc()
> but then tests zone_info, which was already checked a few lines above.
> A failed allocation is not detected, and the NULL bitmap is then used
> by __set_bit() and by btrfs_load_block_group_by_raid_type().
> 
> Check the active bitmap instead.
> 
> Tested in QEMU with the bitmap size temporarily changed to UINT_MAX so
> that the allocation fails. Without this patch the kernel oopses in
> btrfs_test_zoned() with a NULL pointer dereference. With it the test
> prints "cannot allocate active bitmap" and fails cleanly.

Remove testing steps that no one cares.

> 
> Found by searching for a NULL check that tests a different pointer than
> the one just allocated, with the help of an AI coding assistant
> (Claude).

Also no one cares how you found this one, especially it's almost 100% 
generated by LLM.

> 
> Fixes: 1ba19a6ea9f2 ("btrfs: tests: zoned: add tests cases for zoned code")
> Signed-off-by: Yifan Feng <evanfengff@gmail.com>

Although the code looks good to me.

Reviewed-by: <wqu@suse.com>

I'll remove the unnecessary commit messages during merge, so you don't 
need to resend.

> ---
>   fs/btrfs/tests/zoned-tests.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/tests/zoned-tests.c b/fs/btrfs/tests/zoned-tests.c
> index 2bc3b14baa41..bb9969210444 100644
> --- a/fs/btrfs/tests/zoned-tests.c
> +++ b/fs/btrfs/tests/zoned-tests.c
> @@ -65,7 +65,7 @@ static int test_load_zone_info(struct btrfs_fs_info *fs_info,
>   	}
>   
>   	active = bitmap_zalloc(test->num_stripes, GFP_KERNEL);
> -	if (!zone_info) {
> +	if (!active) {
>   		test_err("cannot allocate active bitmap");
>   		return -ENOMEM;
>   	}
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3

