Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348044;
	b=SEQcNULi136fVpuH72EV8D+EmhMdAdV+nAiPiCQfQwgDAA2vGeUe06vwI/D2Hm8J6/7S
	 4AdcYYpav3jQrjxKkNnW53Zf6PeK6Hfp7MnL0koAutSwhrYLJORSDb8fobqF8KHKd4P6e
	 UJTrNzXkdg+iVY+1OTlRCxIrQ+pHen0WOF1zfhaZtTlZ4X4DMlpHZoLEPr2hTMOFX1zk1
	 PzRpLDG+d5sPI9I1WdEFMEBIMdwWvmj5HvouxbBBcenHGxgxtk3j0ntRt/RkNHL4VL63o
	 8x5VcHhbNhbEyA54Qqljkyj04ZDyaLMS/+PdhJ4b/POBi0Hr9E/td/swHn84lFWY7LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DYxju/VQ5fD0CRDGztF+VRnW9V9jqdl2dwT7docZvOA=;
	b=E/PknG8VcqCcsvt71HUKAZczg+CM/AiuZNxlpHcyhN3cU0IUYvaPQW9yWvzGIpaHkQwG
	 K5bDQyiIrrIMyoVytrEbxUCwfM+FhZbY1fJPPbBIg8CAY0U6m8fn9GOUkf1tRRdsSVtZN
	 OnsBeNtYIi4WUcbol5myP//mOjNmycVo2wT/Qu9wqZO1VuP+EetIqE8g2xAVo8V3YQi/W
	 4q+IxS3qfs2AYWgwmPdqW6D3YxMFSph3le0WHUrctLX+mtth1zXxFXf9NbTGoVkzaa8BD
	 cG2M+bROIJ5EUw7LYAtT1stJIHyHe9xha1FIcJC8jk3+heioRk9DfBVq4dgyi5XApnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="dMUM/AAE";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCD0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dMUM/AAE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso4135345e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793348041; x=1793952841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYxju/VQ5fD0CRDGztF+VRnW9V9jqdl2dwT7docZvOA=;
        b=dMUM/AAEb/zpU4hslhZubp+oeFpRsZWWA+mSn5j2dhZPTvkhf9/zQtnDh1fA47hb3R
         rLsXHtoRRVqXUgVgDe9SNp5WzFjmOiE0sY+vWKKJ2CfIuQwp5jNZZ8chkRm+gEjYfscX
         qcRmqSzUqckwsfbjYncUPRANG0/E+MMOHGzEwNJjto9tBgnwM8RVFwbJsNElY36Iph/P
         Eyt6Jfud8Q/GXqn5R4igdw7sUciuVaq2E9rqo7HoOqr4bdI1d4CHVP9duXmhfIr98/fx
         Q9nOV7xWBVkZFh8r6BMYZimRFM4Q+yyNA0IJj1Hv3CX1hYit9lhJvH/G8cozi9fzq5Hg
         lsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348041; x=1793952841;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYxju/VQ5fD0CRDGztF+VRnW9V9jqdl2dwT7docZvOA=;
        b=UAPk2oiGkJ0c4HWJOUg1PkcO0vClx/m6qLvG8xMbpnSISFUHBmwGGxaK7kTELZ/wvo
         c4z8gbLv11LaTS15zeg/dK9K/gTTXahOgPOqcWW0xe0/MDVkhG6SZ5rWEl9XkcE3isVz
         U66jSM8mRbWonr2WvQ6LtZUUx1xBL+kIbqXTxcjFnvbqDya/ImlpLWQUTsWlnlTBvYlm
         q18eNpGK1H/8l+BufM8WbRX3CVJ1MmHVIymfRrD/Wg+AJzdNxlbGJVOCwri3r3aglNrg
         RS3Druzxh2eure8HdUytAZ8+ctF+4BMmv72XD5hG47qLmL6+4kxYtFlDBWC9G8/ENLJR
         qE3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwseP5yYhh55fOkvjdW5j6f4hz8FG6urLEyTz7FYzAxkJv0BBFLhvHmdhiB9ZRi70fn+g00zUlIKDSbRwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUSEPGJCBq8VdQdPeg0eVomAu3tHLh5T3+3C6ziNMhDpwWHD5k
	M68S3MuM5YTARfdz4UQuFx0Xu4e7E1nI0l0KJA2GFQ7Nd2rUzjKjBmJkPOxvYt22Mco=
X-Gm-Gg: AYBFou1NlCPzvEUhm9yBlpSerqYeo8D7nlEsY8AUg2renvFFegg2qyacsIdrXJriZek
	VFVpbYj0iaqPvWn6D+reQDfIksTp5twnxTHWvOkMMyyjv+ZhW76nb5UXENQKAM0hyiFRnXo05Pw
	G6/Fa+4T7y4a1OBb+qsBin2qjYDTsH0EYD7SBeEOTT4G0wg2fmlkOm1wWy7XTOrAquSAxxKB0jC
	jtHXs7ePTsDwlQYRF5oZlSpVgxZaz4aiQiyR+7J4lcAglzeYnTbYEWGXKqPJgpGY5nVCGkLlPCl
	v4Tym8VipFT/p9nkr9TnHQlTsHTq4VaGzRm+GZ8QI5B+LVd36E79dxoAw0IcpV/J9Zude9HNpwE
	FtdgZ5XVgSHncS1AUCwY/RCTSo4NYJu2/yn6+I5OqeA7j0TvUI/JfONUeAPBj2nyZ2xbJzfefV2
	ujXcG0TqQxn16SjorJR3e16O7+2ZhkGoohKqfGQ/jWot1mjayQRdlSTr4LmyJNYXlFN06a+2KAr
	W24ciXGtH0akuo4Y7xiwWmhVsLKNJu/6Q7e0LL0r91/OCqS/YZjRwYGTpNe5T9TkDC494aTvpIK
	PEZVnjPd0VrqkySA7E1ltQ==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr29476345e9.27.1793348041366;
        Fri, 30 Oct 2026 01:14:01 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm7446568a91.15.2026.10.30.01.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:14:00 -0700 (PDT)
Message-ID: <d2ee0cc1-674e-4447-88da-d346122a43a4@suse.com>
Date: Fri, 30 Oct 2026 18:43:54 +1030
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
Subject: Re: [PATCH] btrfs: reject zero num_stripes in the system chunk array
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179328314071.648427.12527832319954042748@gmail.com>
 <6ad220fa-d6a0-4b4c-a313-a0cc052b8637@suse.com>
 <179334729054.2353588.12398743988940745859@gmail.com>
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
In-Reply-To: <179334729054.2353588.12398743988940745859@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/30 18:31, Cheng Yongkang 写道:
> Hi Qu,
> 
> Removing the ASSERT alone is not sufficient.  btrfs_chunk_item_size()
> computes
> 
>    sizeof(struct btrfs_chunk) +
>    sizeof(struct btrfs_stripe) * (num_stripes - 1)
> 
> With num_stripes == 0, the (num_stripes - 1) term underflows in the
> unsigned multiplication and the function returns 16 bytes (48 - 32)
> instead of a valid item size.  The system chunk array loop would then
> advance by the wrong size before btrfs_check_chunk_valid() runs.
> 
> So either btrfs_chunk_item_size() has to handle num_stripes == 0 first
> (for example, return sizeof(struct btrfs_chunk) and let
> btrfs_check_chunk_valid() reject it), or the early check has to stay so
> the size calculation is never reached with zero stripes.  I kept the
> early check as the minimal fix; if you prefer centralizing the rejection
> in the tree-checker, I can change btrfs_chunk_item_size() and drop the
> check.

Yes, drop the check and change btrfs_chunk_item_size() to handle zero 
num_stripes is not hard at all, and it's still smaller than your 
original fix:

diff --git a/fs/btrfs/volumes.h b/fs/btrfs/volumes.h
index d5fe5cba0c35..891bc2432870 100644
--- a/fs/btrfs/volumes.h
+++ b/fs/btrfs/volumes.h
@@ -711,9 +711,8 @@ static inline enum btrfs_map_op btrfs_op(const 
struct bio *bio)

  static inline unsigned long btrfs_chunk_item_size(int num_stripes)
  {
-       ASSERT(num_stripes);
-       return sizeof(struct btrfs_chunk) +
-               sizeof(struct btrfs_stripe) * (num_stripes - 1);
+       return offsetof(struct btrfs_chunk, stripe) +
+               sizeof(struct btrfs_stripe) * num_stripes;
  }

  /*


> 
> Thanks,
> Cheng Yongkang

