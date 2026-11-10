Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297449;
	b=V6kuLLc02D8p4l/w1b40x/TzKMyFIObeoT6/VuhH6uk6lvRZFwBoO+c/0TWs9H+Vi0/y
	 BdSCLS88HzqpPND4sdKywwM5Sx7oN9ekQBqWeYjcleicLqkFjPf2UExrs2OWJgEV7JU9M
	 qABl5s0qvk7jwMHeD/vj+VWfnxieQMtocFQoJgOohYSQWs4VbQTdzhBUIDDEDkTHQBoiy
	 RHNbf7pnIeJ8xjXk7e6fb6UsVonScMutH+wdfohmhywoysS8b1GBva/iAZ5k0ZXO+dRSD
	 VZU3G9f2Jjn9DL5Pdb5XwMRAWIfUKmJOoGXL16K28wzzBxV4/DGBjNfwHDNJIv9/PYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kvgBqQ8Rj9cy9B+tN+4CR0iM/xWv6CD5W2iAULZkH8o=;
	b=R61JtGDd90NqK/UV33fpmMj9Wsc/lG+TowzO8bzFZVxI1gbjqnI3zLOckVnZUYOeA8AE
	 MJa4uJphX0am6Ld5JJZHSAps3kYuXBWazMh/O+AX6u8Q0d+tv21smVwxLzR6RPryNx2Y1
	 SZY6I64fB8+q4T1spYcr+MoWIy24LjQ1fIbCl0jsO+wMhZ9T58E5UBRkJCKWxDmcsw/cE
	 OcECMYRRJiIEusJAqQ3R5Ir1DauEWR/LRyGOQcsYKtfV4UOh/XppMtvCbAJYyiPdncMZd
	 NZAwI85iMJs63NeUYnD5dM7ReQPgZBh9NsPkSFII6XpP1ZSsBXs3OYCYvRFQ//38vWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="L/BCF8fy";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D925606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D925606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L/BCF8fy
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so5724995e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794297448; x=1794902248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvgBqQ8Rj9cy9B+tN+4CR0iM/xWv6CD5W2iAULZkH8o=;
        b=L/BCF8fyao3MnHXE70qVmRX2Chn7ndBuSWiVjcOcZxAA0z8pJVxYEuLBOFG9bNnKYB
         AFvF3izdQb5IpZB5VtqUwsTRD9uCkA7Wieod4M6KXIqSZrPNxbpJ7lv12cAqkSEiQcs3
         jgOlk3eZPDkrz+bef0HHQxbEWU0zMlbm4ofw4EqmjZYOAY0lixa3Ez5jbyHkcD4p62W5
         HMpp+8IBubsxDeQJI/rTbgIhtLRcv7zQAmpo5T+rWbhMZnesIIvaUAAKYZDRM+KFAp06
         Q9tAfSZTY3nBUUu5xDjqxApvJzgkKSSVFFtcO7cJVLubBQY6M8v0eav5zFBBJ8a6iQSD
         byoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297448; x=1794902248;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvgBqQ8Rj9cy9B+tN+4CR0iM/xWv6CD5W2iAULZkH8o=;
        b=nVIOIhj1qVtUu2MznWR03bM427DmU+3PMkY3ox0+/c1mpdaixnq1OHjGyQpNx5IxAi
         ks6CVLtfvgl2+pFJPbwWG3MyR16ymIm5MpTcfhOEq5sSUFwIRSEL91nEVZloy6aA6NkS
         pv6y2kQ4rdHGsxeb+7G6h0TYg0KXuOMC5jwejI1Z3qgaxx8qnLFcrEHfo2511aqSvPt7
         fGAfvxfvsJIf2q8tMXf4iWYXrb8VEU/I/Ne4IdVSyaxslCOvDcSAnj2iFxcpyuGoofyy
         tmecmnAUs5smQcWHi9yHXDBnvzzt11RjstoZKfEQmDtRLFVBdH+RViDLnLlQxtIovnxr
         5/FA==
X-Forwarded-Encrypted: i=1; AL+hErG4mc7xW/1xiThZS2Kwd1lAH6pQIjxP/WIjkF6iIYwyjXrFuimccIKNRtdyeYuHCAxXLxCJs2wtTx57pAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KCUI4pB6LPpVQN1K27bJ1QfTC+QE+8ZRV+ct75BTjR8XsFTxr
	f2si1xzTCQn/CCXx7dzJ/4dVyH8FCZcjvVePH17Lyb633bq90oFfEeStg8bia3aPhII=
X-Gm-Gg: AYBFou0NT6srymD08uMsFRpRG7BVxK3MCn3Bz5WCxVAuqYjjGQzGiaYwG5WxQmOkrvI
	+hiwuED+Uwg1A31TqrBJij2k7ToUd1mZ9TEbSmnYKLZV7ktUdtD+97JCJxkACrCb5GNYXN4wFqU
	oXQQ5cvOaeu0jqhrZabgNnn5qCliBuMXPg765v+G9OFgdNiD5bECHajB6Ljrm0ubwQf/OxYaBR6
	YmPUHO2TtigRxpUtuFYL0dnFJ9J8CcDGjWXJQrMmin6D5RJUU5vE6X7om7PApjtytQwB0939/Ik
	F7SpmSrQIzxSlRZUK3xSOs44hXM7GGshcdNWcRoTlAYUnUP65/tUeW6RDxaXWCGW8qWRRd0WGdQ
	9aF6N7ITUychAYWSl/XOInX/1w1F5B4Wi0pqnyI8axkKFhUf5ZznwK/uxU51DORTlp3dLzUcu51
	NtIQTnq5xKz7PKzeS1+3ovuEnf06P/xlu3tECs7o7m103WCe9I04A+St8SLvVXk7qKE0wP1BUgc
	6RSHGWruLH8PMCkICGXgoJ+bHkX+7T0XEeeG+MLeMfIEJSpAQCsCOAYjuucONAbpt1DOZtr+/wo
	U7wSST4mQVsonpiXPbIP0A==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4ba02341314mr32598395e9.6.1794297447594;
        Mon, 09 Nov 2026 23:57:27 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a412bbsm6129045ad.2.2026.11.09.23.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:57:26 -0800 (PST)
Message-ID: <193ce29f-86f0-41f2-9c32-a2e0f8f4aba1@suse.com>
Date: Tue, 10 Nov 2026 18:27:22 +1030
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
Subject: Re: [PATCH v2 2/2] btrfs: raid56: pass REQ_META to per-device bios
To: Mark Korenberg <socketpair@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-btrfs-sb-read-req-meta-v2-0-71c1afaf5c67@gmail.com>
 <20261106-btrfs-sb-read-req-meta-v2-2-71c1afaf5c67@gmail.com>
 <e29db0cb-2054-4894-958b-800d03ad4d79@suse.com>
 <f05b71b2a735d2b9d018c072f30a0b78@gmail.com>
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
In-Reply-To: <f05b71b2a735d2b9d018c072f30a0b78@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/10 18:05, Mark Korenberg 写道:
> On 2026/11/7 06:56, Qu Wenruo wrote:
>> NACK.
>>
>> One should not even use RAID56 for metadata chunks in the first place.
>> Nor we're any different from other RAID56 implementation.
> 
> Fair enough, I'm dropping this patch.  Thanks for the reviews.
> 
> David, patch 1/2 stands on its own and has Qu's Reviewed-by.  Could
> you take it from this series, or would you prefer a v3 with only that
> patch?

No need to resent. A reviewed-by from any of the known developers is 
enough to get it merged.

The first patch is already pushed to for-next branch.

Thanks,
Qu
