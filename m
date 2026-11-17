Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893933;
	b=U/p0EMANXqElLCuOxd/Yy0TQO7153k+m5IoGbg/dLVObaaoM9qXDpUy25AmP/8e4jeXu
	 pFgRd/4bnGkaAcBmRMpMU5D9YC/AoGHey2goyYVjefK8ScgIWfOXnwYcyBGWP6V9MDOzb
	 WF/vxowwW0Vi+aQgRChrl4lPb4oMdVLWsjWuOlROSaB5xmmedUzy1CkjwvNOqEaaHvj8y
	 zEdnjrNpMSEPa0usa8OiKYjBkk2MCUI5iujjFtdJtGoCj+uUgmu5UvAAPzkIWOaa8WLCE
	 e6QYgG8hJZPKzPUE+h5pvtZYxDbwZ9syC5zo6sGj0PKgetcpEjvzRmrQITiAYRMnB8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i15R/H+wWlGr4uvJa/8sk/uao6pBpjxxY1UfQQh+R/I=;
	b=X5EopiqKg8KbF5S6BYh1P5sTQIx0hvesF3T3/yFY4dmMFB3y3XEi/ZyIkJi04YpUrnUa
	 k6XPqZRkZetpHi2OYuqC6aRz7m8616rmdUSa9V12ovR/FcglwkmXSO6cWpMbGl7c9VKLn
	 UbZrCLvAhzyvr/SwdAdeBHrn9uS4/BBG/MeAHA1i7JpIQZfSyCTkQO09CZ99n6SzB/hAb
	 slu2Gh/937h6vqmUxx6+eu1wpPnjdFNMqOAVek5BBnCfbj5PyTiXCnEQP+PcR0GmGQdD3
	 wk8dShvngyFWzF5RqYe8vbog/YokEUuZ9jrBb8zWkD1o7m1RXTb1LAlMRUIBYFIkNQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JVk2bPKz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F6E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F6E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JVk2bPKz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so50515985e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794893931; x=1795498731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i15R/H+wWlGr4uvJa/8sk/uao6pBpjxxY1UfQQh+R/I=;
        b=JVk2bPKzzm2L+FNyLQRNLRhwhPaAea1yXiiDP4nIasQqxAx5idlF1H/E+K0d2+G2Sr
         Zga3nTm470haf2t6k4++FZBxhe8n1fekXBlAknUDc3GemBbxemMkpeETpWFG+9f3JCSB
         LJLibe7UpupFqbyqO/0h/xuA9PAuQn6O27ob6jC4kPtZlfvsPLH4+xqcwZwUH58YteW8
         9iMwFJPH1nGDVBX8noI/GHKcfqi3+w4B8hJ/YZrLfjHzYYBGSjDb8I8qWdmplxweaeQB
         6mlg6HQ6KqME+sY5n0icsDdZZerPLRttBO+rZGOnkLaHlmOJLR0iRJNfdk3bYd5nmo7V
         eMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893931; x=1795498731;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i15R/H+wWlGr4uvJa/8sk/uao6pBpjxxY1UfQQh+R/I=;
        b=Ltt3AEwQpLQ3caHNA/YKPGTI9wD6wb2EYeR8xtzBhoeOyu7akK9cUvMUsZjJzY9Tmf
         FCKOv2klAxXvQEyyB9+Ku9QrQCJzE06eP6w8kIkW2XyqT6yv8CcAlIuhIW2Lntks6KPm
         G9eCv3jweZcKwhuHRUbdXFjrKw4iGuMnsrSrhAj5APSSi3hD8kEFK0RafDA6Ow0bVokN
         6NVOhx4/wSF0b8a7t5uRMRmYxSRyM3lIMfays2zMqkiIX+EcZ4xrL19E3os3NGfmj8er
         R7kz0flkwlgBMxyQc0LkNSiaUK3Wp6BZSHfV6V9bV8cw7JEwyzg3bdvGOHpSWu+rt1ga
         j8lg==
X-Forwarded-Encrypted: i=1; AL+hErH4x8BUMnT7K+WY27awGFyl6z5tbrvha+u2fT61H7nQiSHAPrYobDIcqB/ZihxONBL89ea7y32nADLNXxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TLksShadfxHTifgt4qgyVyLI87JCwUKD3B+8TfIxnUol/nqEL
	sZ/faPH9oB4rumHvDA4WetYwWuV6nVg2OFAWnzVFhy/4gzfKTsphLEC93OLoJdrNQD0=
X-Gm-Gg: AYBFou3JMT6owvCf52CrriY/3NX6yXTrUpJY3p8fHPISl/IZzsiwhwI6+G+81KjV5mh
	sy4PnB7QgpBQuzhxCQfLIXuB5mPK6Zg6I+drS5r+jbFabL8vkqm7Rjpz982/hyZmGK8ayQWsgOK
	Qb5g/kYyQDeJC2mlsl5iKSeApieq6P4PoxnKtsjOPBt7ZMLfPCVNMbE+untsIycMwakmqXu7rkp
	2JiAaB6iFdo92VZ7wgjVDgeNn76d3FiRszW7P0UHu6QR9MwuEKHovkItBUNLOjn5YjFiLEnIjTD
	2eLUBKbRTuBfnTTPdJNLQVAcJVuUlC9rj2TN+VJq4EWX8mTim3uPAcqJenzUlEM9/a8gRPa/OXD
	VloCsBetTTYNWlY7Iu9PDIk8MkDJrYNzIAZJ2gu8Lu9H7wD1bVsW1vIyznXMK44MTCU2MpXWPsv
	hAOIe2rW3BD2H1cffMr5aiI2uB4TKVogS6UJrLkg1qASw4evB5xPRTOuMJiBtToH9BaAVyvWZ3A
	D0YosXr2xbizyB1QjfHAtt+MhlvTeHocKiL0BTjU1yNrnyyTkmBkZIDZDqRLZDMasrd75ZCYfd3
	bOkLiG2lPJuCQBvC4IUMGA==
X-Received: by 2002:a05:600c:6092:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb55a42ff2mr246747625e9.9.1794893930858;
        Mon, 16 Nov 2026 21:38:50 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b354sm4377244b3a.47.2026.11.16.21.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:38:49 -0800 (PST)
Message-ID: <a6045455-5c90-4a79-85e8-06587f0b65db@suse.com>
Date: Tue, 17 Nov 2026 16:08:45 +1030
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
Subject: Re: [PATCH v3] btrfs: tree-checker: reject file extents with
 oversized disk_num_bytes
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117023841.467366-1-teel4res@gmail.com>
 <35bcaa47-55c5-4b2f-962a-c3168bdf52a5@suse.com>
 <20261117045725.606165-1-teel4res@gmail.com>
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
In-Reply-To: <20261117045725.606165-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/17 15:27, Cheng Yongkang 写道:
> On 2026/11/17 15:01, Qu Wenruo wrote:
>> I don't know which agent you're using, but I have seen several ones (not
>> only from you) doing this linking-to-older-versions behavior.
>>
>> It doesn't make much sense.
> [...]
>> And the full changelog would make more sense, other than letting the
>> reviewer to jump to your previous version for history.
> 
> The links came from Documentation/process/submitting-patches.rst, which
> recommends adding lore links to previous versions after the "---" line.
> Its example also lists the changes of every version, though, and I only
> listed the v3 changes. That was my mistake.
> 
> I'll follow the btrfs style from now on: the full changelog of all
> versions, without links to the older ones.
> 
>> I think the ram bytes check should apply to both compressed and
>> uncompressed extents.
>>
>> For compressed, it's MAX_UNCOMPRESSED, and for uncompressed it's U32_MAX.
> 
> Will do in v4, with max_ram_bytes picked the same way as
> max_disk_num_bytes.

And Sashiko has some reviews too:

  https://sashiko.dev/#/patchset/20261117023841.467366-1-teel4res%40gmail.com

> 
> Thanks,
> Cheng Yongkang

