Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5A3F12C4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417251; cv=none; b=QiR3puHo+85In82LlxYB8zIkpUedgKJpThHwCp/U9mJudPLYrUWwZk6sw/uYhbWRde0E92F3JR3JLznvOSFpbAPQv4rBlxAa23V9NMdojd9vYu93u8W8wxtB/tMuFqSea3ht4l/QfNto79w5+WpZcLaL95s7Lqyx3+A92SO6WH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417251; c=relaxed/simple;
	bh=xMIrA9cToFFZxVo5TPqlvEijOMIEoJijBlnQJr7SzHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfsJDC4/6xh0scP0s8740gax7qLcReVPbi0gmkRAAw+ywLbkFeLMxdfaPDF1YZcM7ZM/sIzY+tbfyXiP5A5lT3tUvx9JRtI+X1NBJz89zVNmNmi48AHhKfGHHtrtUyn7gIIBAdEW4G/DSQI1cY2v26IeEK8G1hEkow8vPZtqMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IU5pRoGR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IU5pRoGR"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8687630fso16262065e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788417244; x=1789022044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hYjgbToYjV9xCbE8koKqXdWPOsEFnvvuydih6e5oBw=;
        b=IU5pRoGRLxduZQ+TDcxFAaUrKNvDr+K7rBc7cy9XV4eKWWqFndMrebK3Ouos0D7HMo
         fGh93vNDDfLtIhmr6x3O+JOwRuPzbvz1MNRNuFWvNk9qB3pjy/Pfrys2dR+T+Ttafy5g
         gldf47hDFA7NolK2onW7NNTQagMiJIEBUtuBYzr0AxQWiMLr8GjdlCqYhJWFA1z60kzd
         3dvm8cR+grIyDPBZBKIIZMaUfHRybOKc1G78zi90XwuG7FU5Sm4saMtAoDpXmpUpuZGX
         wJIRF73IgSIpiFuZTznh1ED4jmEWT0ZzUs75bEy5Zp7InzgOSnxqILsROy46zEcbcRCg
         TKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417244; x=1789022044;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hYjgbToYjV9xCbE8koKqXdWPOsEFnvvuydih6e5oBw=;
        b=n1qGrt9Y/y0ksckxT5XhfDVayiqxw2SZpQeSSWR0Q8U1vivuvCue2gltGjjmgZWrkv
         FYchKOf5VPg0UHHIYH/Ld4SWnlw49pRH+buOJu26kr6/NsFZXi/K5XMkjqn6DAcF+7Ik
         uYjpNzBRx9QVcHzNMEusA9rA9W7rM05nuha7NzKJNhXotC8t38g5KlZ5hXG2cqYDwEVa
         8PoUWmQSNZzkVOxvXjBnhHTvAp2y3x6LAYBjPaIhP3tXbM+/ivTiGtdgB5JyGC+br0a7
         W8ED4W6cHntRjHiqGnUtkkqO2sJg/3X2rZMiR3eDlAjk7a3pc2Zr2SJAyuFgDZWBpxWy
         JHlg==
X-Forwarded-Encrypted: i=1; AKwUvBxsTGlcT9mu3qhPPI0L8Am0lMy8kYOdGG77m5JyAGNLCJ1N8jBx35cSUVagM7q2UeHXumeVoHEh9pfDhOs=@vger.kernel.org
X-Gm-Message-State: AFuF++kObKlLiBr60NXDv3qSsQ2HDmDZrDPImFuA2a40GMV8eR1/ySB5
	zl5LAZZu7Culs4ICJIsrLzL2d9EG6tbHIvxJC2GKW/Pvi2v8v7UyJ6G7ZosmMTnEnLQ=
X-Gm-Gg: AYBFou2zzKYXBOde1mKF2cwlblRbr6ddIlLfB6SxcSm1IHFr7E7XK/m8s6XLBhWJdcX
	flDlCvHSPwhZdHI2cyEHTQIM1YqPoYP7EPXf2+/+p39e8jLb1swYyk2aw9bVvwiXiv7yvtHsbAB
	Of3cT0fPe1wvlE5DcyYQpsJIr7ntOlO3OWWfvLQHD3XY/+pHvn7JAKMMiEJjkBG2tUL7wU8SEiS
	JxVrngG7Ij20bGdJSdq94EQF83GJeWBY1MyW3zB7wLPM4boaDYNHgT95zjqRzDTDj4aBlkvRUUN
	C20oDbd+tn/bUbAww59wczq1hh6pK9BkBWBRRoIwrYkvNHz7AAURkURciR3RV8oAyktztBZ3XUj
	RkivxBJoK9955UfF4/lwsjsJqO6rilkNgdSRdAsAWdT/KIv01kyCeLyEWm1Q/uui3w4oHMg/QqR
	OoJ6ff0KRfqvPlrfWZ09vMQY8ESyH2CqSX+n0EKzrl1TkDr54VHCl8
X-Received: by 2002:a7b:c3da:0:b0:49c:d293:70c8 with SMTP id 5b1f17b1804b1-49ced887bfcmr84872295e9.3.1788417243857;
        Wed, 02 Sep 2026 23:34:03 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003a801sm2331943b3a.31.2026.09.02.23.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:34:02 -0700 (PDT)
Message-ID: <a9179480-4f99-407d-b381-5c97a1e85a2d@suse.com>
Date: Thu, 3 Sep 2026 16:03:57 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] btrfs: promote async checksumming out of
 EXPERIMENTAL
To: Daniel Vacek <neelx@suse.com>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903062317.3928665-1-neelx@suse.com>
 <20260903062317.3928665-4-neelx@suse.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20260903062317.3928665-4-neelx@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/3 15:53, Daniel Vacek 写道:
> There was no issue with this feature since it's introduction in
> dd57c78aec398 ("btrfs: introduce btrfs_bio::async_csum").
> No need for hiding it.
> 
> Signed-off-by: Daniel Vacek <neelx@suse.com>

Oh, I was doing this already, and it turns out that we have a lot of 
things to cleanup:

---
  fs/btrfs/bio.c       | 136 +------------------------------------------
  fs/btrfs/disk-io.c   |  20 +------
  fs/btrfs/file-item.c |   6 +-
  fs/btrfs/file-item.h |   2 +-
  fs/btrfs/fs.h        |  10 ----
  fs/btrfs/super.c     |   1 -
  6 files changed, 4 insertions(+), 171 deletions(-)

The main missing part is the should_async_write() now always return 
false (you missed that EXPERIMENTAL flag there).

Then it means the whole async submission part is no longer required, 
resulting the above code removal.

Thanks,
Qu


> ---
> 
> v2: Introduced this change.
> ---
>   fs/btrfs/bio.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
> index 771b7d598aee..db426ee6e587 100644
> --- a/fs/btrfs/bio.c
> +++ b/fs/btrfs/bio.c
> @@ -569,11 +569,7 @@ static int btrfs_bio_csum(struct btrfs_bio *bbio)
>   {
>   	if (bbio->bio.bi_opf & REQ_META)
>   		return btree_csum_one_bio(bbio);
> -#ifdef CONFIG_BTRFS_EXPERIMENTAL
>   	return btrfs_csum_one_bio(bbio, true);
> -#else
> -	return btrfs_csum_one_bio(bbio, false);
> -#endif
>   }
>   
>   /*

