Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859612;
	b=w/ffp4WBmBbGRYVO16xBW03pFwBwUqP8JP4+goPdI2C9VLWk7pWC0qAOLkOa2u0EseM5
	 wckDFxTnPv2aHMpYuMTSt3cHQO6k0I5ACL5V4OWQq8mhB64G7xUs/UvcJAj9EUl8tVyqj
	 M3niY05KOmqBcpGRTu3Meh/9efPtVjZc2jWC97AaHoOrkoTo6pSImNU5lScGfhl7ox3ui
	 Hy7FVoBab58XPx+TxjKwO3j6RNfl1BTC3aEXUg6JZ0WgDx4Z1iGymb3JGKQt0M4Zb1Kvg
	 5g1E8MC1k4D61XWwNNUtFCkpmC8B2ikhcgBzTdP/7WEBHiB3RWZA8xNb8vX3XuwRuQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WS3SIbAjQ99dz8XPsd+erMN3YcHpcAqp19dH18JDaKw=;
	b=ARoiY/Id9YCpVy3aE7orcwYjV7WtV8zkh0BClYx6OgBCO32k88BcOqOsa0CBDEWeSakQ
	 cez1Xze1U8yVBs0+KKET8BSgfMSV2UkWZuPLySLJEMWSfKcXhHGzNmI4gbZ/teWvjk/Bq
	 gOCMAYOLUd39S9YGDeK9DJJGPfNw5tNQdpfDMdWBK5BgetVguUTsI6jzHp4WwIWW6E1xo
	 ZxxQfSRYA6kriNAHOP5UeRoNwoIEVnAo5h8dXRf8LE+xlEgElk14eiCXGX+MFOSaYbGbb
	 qTyxEaRARELyhl7eOeJutDNl3vyB7kEIQErs0f4l1jf7pZBfmsX6DQTIhkndkbhQg6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CSQx8Wh8;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB951606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB951606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CSQx8Wh8
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so13135185e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793859610; x=1794464410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WS3SIbAjQ99dz8XPsd+erMN3YcHpcAqp19dH18JDaKw=;
        b=CSQx8Wh8TfNl7SGoqVtHcqsq8PsiFxWxfkOnHd+TaEyg28sNrNiVICGMa8MtQz/iiT
         /WK0QhqCA0fKIxqJ/W1D3vGd6GwN+axsQLKJkE2B32X/JZAqeELwO5liY2EfUi0C2/2D
         AkMVg8CUB2154GQx/N98N3L553DNJbfXFcfN9++RfFt4v1wdLvCkF0r+FnNxUnbvRsuG
         Yl7ylOSBt4ulUuDdbOEp9U9hgE9royvbz9XtP8KptjvnSQs8PkjyKqiaGWl5b5CbYUh7
         w3ShAujrBY3SlxPI37vdAgKPmQOuHb6PKpKRulB434LPuGfW5dpI9trKa88ArTh0qLPr
         LqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859610; x=1794464410;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WS3SIbAjQ99dz8XPsd+erMN3YcHpcAqp19dH18JDaKw=;
        b=FdLDTWoEB5NUt+XPA0B3TF+9rHbFE9IKWIREzBzXhyZrihdfOvThysEqvVH1s/Svv2
         rbjpnz+1fODBgJWTiLuPt8YOne8FTSkhQWzhs8SwCkJ9wQNZMdhgklKInEB86JTDKdFY
         C70tjHiUWNNcown8/hinKUIfGi27ea+SFnDpKYTzq465Z3m5GsA+fjMA/hpACKst7sGM
         frUUMSa0oke4qIOVzPaVJeXUALTS8l2YDw8peRdVh7O12drYYQAEYV5/IX/iNq3Er2R1
         8qj0XjKDcZ/Wjva7o5dztwZ7Bp3TmmAzzr2z57P+lPIyG8TPj5F/Fh4Xd9ug8x6GDg4i
         /4ow==
X-Forwarded-Encrypted: i=1; AKwUvBxVqdOUvqLLvJAHo4FLhUz/3DUU7I0++2lxOMZkFRnQU+1QpVju3Y2hnLJgYTt9vs/juMv88PQaGNyFo6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qpqHLtSiAeHZxTnbRtPCjOD4LxbnILdWq/whXzNo6ky75Gidn
	LXggwtUmHwmjMoJhmLVt8oiGZK38wCpUgf+9JGe1lIk4wR1R4G5cMJw8djv2An69k6A=
X-Gm-Gg: AYBFou0CNJRkbwq86qwk/7jPRbcefzihsdCXcp9UsA0KQuiiVM39cURJlmRUXT0kH9V
	J1YiuinGzt0rIWpGn9wDOBszyHSwQBEcERgxYLvgCfpNFtcOhWPO+X8l8c8+mGRoF/OTK4c5C/V
	1ODw8X6OTcXPqv6m24h26MIk2qEFipnunACehz75I0MXSB2bf0BgOYRSXJnjmcemi5EhZ8wcFCr
	tALOmQOdKFMIqXw2ZAjFwtGlt0uX2zpMgkSrFhtBvHmL+9815tZ4kbjwaHg8oXkfYicnNAm4dVP
	5cNcHoXv2Sx8wATIAAnMIkAo0yf7e2kW63rRFOR3IzeNyDicY9uboZrFphrw0FEzYx8jklG0MGY
	8xrcOaEGh0RYUYnzZaZKgBREuAgY79EXGuvcj5l75JoHZDeFVe+lRo3RQulDKQQehzpODGDYXwg
	bNfZo/4eAtPMLj8xC5kTZUqFdiam+4o8ArU233Y1kyF3lu87l02h2PqL4QDPTv2tTli07+TKK97
	elnZxCw2elC8SYskWvrp69zjSe++P7lgrerBqdnTyP2FcMrr5OrXQqj4EJH7vfobzvmu/vJxHoc
	8E3kdPNJ9P3N1Ai5TgfW
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ac1228978cmr375296395e9.0.1793859609978;
        Wed, 04 Nov 2026 22:20:09 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm2077495a91.4.2026.11.04.22.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 22:20:09 -0800 (PST)
Message-ID: <0313641d-567c-4615-ba14-7662a533b793@suse.com>
Date: Thu, 5 Nov 2026 16:50:04 +1030
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
Subject: Re: [BUG] btrfs: WARNING in invalidate_and_check_btree_folios, during
 unmount on 7.4-rc1
To: =?UTF-8?B?6ZOu?= <fengaojigui88@gmail.com>, dsterba@suse.com
Cc: mason@kernel.org, linux-btrfs@vger.kernel.org,
 syzkaller@googlegroups.com, linux-kernel@vger.kernel.org
References: <CAO-4RZ0mqFEU8z44B+biaMw5Ee4ogCjs80Uws9YY8LMV7J685w@mail.gmail.com>
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
In-Reply-To: <CAO-4RZ0mqFEU8z44B+biaMw5Ee4ogCjs80Uws9YY8LMV7J685w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/5 16:12, 铮 写道:
> Hi Btrfs maintainers,
> 
[...]
> 
> We also reproduced the warning with panic_on_warn=0, allowing the
> kernel to print the extent buffer diagnostics following the WARN.
> 
> Four instances were captured:
> 
>      BTRFS warning (device loop4 state I): unable to release extent
> buffer 6881280 owner 5 gen 9 refs 2 flags 0xd

0xd means UPTODATE | TREE_REF | STALE.

Meaning the eb is already being released, so this means there are some 
races.

>      BTRFS warning (device loop0 state I): unable to release extent
> buffer 6885376 owner 5 gen 9 refs 2 flags 0x1d

This is UPTODATE | TREE_REF | STALE | WRITEBACK, which is also stale but 
also under writeback.

Exactly what the check is supposed to catch.

>      BTRFS warning (device loop8 state I): unable to release extent
> buffer 6885376 owner 5 gen 9 refs 2 flags 0x1d
>      BTRFS warning (device loop1 state I): unable to release extent
> buffer 6885376 owner 5 gen 9 refs 2 flags 0x5

This is UPTODATE | TREE_REF.

Combined with the 0xd one, I guess someone else is holding the eb, not 
yet reached the releasing part.

I guess you have already passed all the info into an LLM, and no obvious 
cause can be pinned down.

So far I'd say finding a minimal reproducer would be the best way to 
continue.

No human will be happy waiting over 1000s just for one single triggering.

> 
> In all four instances, the recorded reference count was 2,
> corresponding to the expected baseline references described in
> invalidate_and_check_btree_folios().
> 
> Two instances had EXTENT_BUFFER_WRITEBACK set (flags 0x1d), indicating
> that the extent buffer was marked as under writeback when its flags
> were printed.
> 
> The other two instances (flags 0xd and 0x5) did not have
> EXTENT_BUFFER_DIRTY or EXTENT_BUFFER_WRITEBACK set at print time.
> 
> Since WARN_ON_ONCE() is executed before the diagnostic message and the
> flags are read later, these observations may reflect changes in the
> extent buffer state between the initial condition check and the
> diagnostic print.

This is definitely something we can improve.
We should ensure the message is before WARNING/ASSERT/BUG_ON to make 
sure syzbot can catch the problem.

I can easily craft a patch re-ordering those call sites.

Thanks,
Qu
