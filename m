Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834279;
	b=J/emRrdoLIpprAiklK3xtx35TtWgr6HhvEikTtpi4FbzOm6ehsUN2ZEMgKcEwaTsNPOs
	 I/C5LKW7egF2VyfjwpOGRxLcv+WpWoHZZi6d1VCgCRhGR5PcxxnhVRne6EqWGf/2xWp8f
	 dON6CW5tHsvusDwaX2g4gKTrmkG7MPfqE+GOcM9YwC8gdZgObm2O8eu3QS0PQeDMibhTY
	 1qOKzDLCL7NVEGA+3D7Fi/1KU0OOLaN69ue++9vllLeuu+jcLlPt1umsGZgZzDtxqytMk
	 riPYIliNpb8DB/CUNNcP8STI7zPToXF2xy+1EaOLFFSZtyjknsEAAxCb8bIAECNu7Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zZNrbK7xCpsX/+SwnMbHs5tGEBVmvI4/q5QJu21ZvLk=;
	b=YB4E9wWtum4kL7Dqe6rkOavzoerDf9ceulZSrRMDSSWjFk3P45zSqesteU3ub/Omb8At
	 siUbn9xnYSWu4lNb6veGb7wDyh8Ug9EB44UwzRJ1E1sKplK4Dtlow9mmHhbJkpJsCH5nw
	 tRbasDfwk2wH77ISHD/EpqclSymcdMvImAd8Nu4BAVfnpz44OAbI1znM8DCgUxKQ5KX2B
	 u8KsdH52ILhb9rqAHqQOqDTo8n+fy1PyGfYqn0GDlucK6H6oA4ZqMr/ZWrPCIZPW6HuUf
	 smAncfBSkx962bmk1GVJixAFc3OQTf+r3s4CNRC9BdS1duYxVLbBJqF2pxjk///tLbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UQhpWG2k;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E097606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E097606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UQhpWG2k
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so10333125e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793834277; x=1794439077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZNrbK7xCpsX/+SwnMbHs5tGEBVmvI4/q5QJu21ZvLk=;
        b=UQhpWG2kUPN2piNKqRd757NuSh9dHcLTPq3T2KiyNmpFj7K2QibCYBs2y/gjI2ei4s
         CyWm2ejNQXb37v75rUhbH3Q2utEiDJahJnyD9FdqtC2ftEilq4Xt956QmBf5spoch8hI
         TX1kYRfDZSHu4FzoKNKw7canlEw741Vb/i8JCg5i3Zy05B7YSQD6pIHborkBLWpjA4jJ
         kGSvefoNKPl0eiT31vln51yRdLeCtxR4KlQL+MjTR4fVYIpY0SnFauCF5NFs4DU8N/uC
         EKVt9EvEvkCtkNgERBMca4asXq632xwimeamoG2uwZLgOYmvwMvoneDuUbrGGqcq2S/d
         /cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793834277; x=1794439077;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZNrbK7xCpsX/+SwnMbHs5tGEBVmvI4/q5QJu21ZvLk=;
        b=ODSsuBL6qdMI3oZ4SDhCT64AcOyUh2HdJ0VI8nVOMP4sWB2Pe+cGLOnxqjmOck1W6C
         U4xtDI0H+WZHb/6dntUNbT3Dt/moPLzGkLPbutIziDnfUOFwZ5H44VCi/pFHWUdQg/l2
         EfpaqsIh0nSEsE2T/wGQzR2x46yCEkeSz2/sp0+wosaEi7ioYg3eOJbUnB9nAPXxW1/R
         SHlLeZS4RFYBE1DSbtecNpz/P8a62XHdVrIrbaaU70+6uZr+L3OYgajSH8Q3kfehM3hk
         MRB5GA48PsQE2ObaLNJ2eTPzhsDNL40fvPHnTzdK8edmGOm2D8nYI3Ljo0bmRkL+SLkX
         hr9A==
X-Forwarded-Encrypted: i=1; AKwUvBw46OOcEcYhjY2I7RLQoKyJv5TLU6coHxVrm4EUMjDrArU7/7V+p1c4HUl9k7iV4JPdTogeW8a5weXS8+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ck1j2S0Jc2L30jTWMIngAhNS/QS/eEpNLnfq3NdiQc+3u3eUC
	wenJIJvXHEGKkZkTXqsZ3QUjH7RhAEb2tcveTIH0UEhbG089Mg5ow4XuQ5+gnYrxbwo=
X-Gm-Gg: AYBFou3nf73HV0neoBye7EbfYYEJcbYgd9hrHeLkDppON5hRq7XzesZvoRleK2dBEJF
	7htGd0QMiq7PdleW6iX/HeqKDErWe3vh5uMgCHzH/50l9FNTMij+NYoNJrOUhpN1OaMWaNgrm9P
	NpRQw7YPYYzdZO1UnTrblrRERkf+r2DU2Kz+/5O1E/85KusqD6fDDHLWrNq+OL3UPx6QEtTzlYG
	29zAPOt3bUErYS5ZTVxSVD+2VoCr9JfZep2eQCpZLNtsXoHg9rRem6n+ZzixttOUTTHssDWMqI4
	pngbmxZYYZEGdArsVsNOnXtLK0SsgMNpKyxpAyne0WXkoUbz3sTL7xACiiJWK2RnYqlUQi7cwfm
	t/swkC/QjTvbzjUU5v+lzB3mcO2kFuNpnO7SLN5dwmGVUr2YvdS08RuLt2ezKBb9lfBO5OnRk3u
	enABkqjpTd7Xa9IARnh/mtt3wdQKvKishG2Dk+2tRYi/B1u1oCtlC2VVoCcLUUAkqQOfRi4J8Go
	4u0o02ZExhbQPcr1zpVikDrT+un0uF275cGbMj5ETZsskwSOzULgn6R37Zr0cHCNuWsxriAW8ep
	I9LKJ9jxZupyPVO01mpVgr8BlNzVeo+PpaiN2tTnjQ==
X-Received: by 2002:a05:600c:46d1:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ac18a88fa6mr403102625e9.32.1793834277013;
        Wed, 04 Nov 2026 15:17:57 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fe477sm9676561eec.17.2026.11.04.15.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:17:55 -0800 (PST)
Message-ID: <761c20ac-4d83-4f00-bec2-b934dde5ed47@suse.com>
Date: Thu, 5 Nov 2026 09:47:50 +1030
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
Subject: Re: [PATCH 0/5] btrfs: owner refs and tree blocks
To: Siddharth Mishra <smish149@asu.edu>, Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: dsterba@suse.com, boris@bur.io, josef@toxicpanda.com, fdmanana@suse.com,
 mason@kernel.org, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104102323.4090290-1-smish149@asu.edu>
 <9de049c9-429b-46f8-90e7-02b30d2e91ee@gmx.com>
 <20261104231622.3492838-1-smish149@asu.edu>
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
In-Reply-To: <20261104231622.3492838-1-smish149@asu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/5 09:46, Siddharth Mishra 写道:
> On Thu, Nov 05, 2026 at 09:20:51AM +1030, Qu Wenruo wrote:
>>> Siddharth Mishra (5):
>>>     btrfs: skip tree blocks in btrfs_get_extent_owner_root()
>>>     btrfs: tree-checker: reject inline refs not matching the extent type
>>>     btrfs: tree-checker: reject keyed refs not matching the extent type
>>>     btrfs-progs: check: count non-skinny tree blocks in simple quotas
>>>     btrfs-progs: tune: do not remove owner refs from tree blocks
>>
>> Please, never mixed progs and kernel patches in one series.
>>
>> Send them out separately.
> 
> Noted, I will send kernel and btrfs-progs patches in separate series
> from next time.
> 
> Should I resend the two btrfs-progs patches as a separate series now?

If there are some changes needed.
