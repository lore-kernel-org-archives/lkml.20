Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.200
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793733281;
	b=nN9hzEAwZJVmFGQMfwgWbUQxpJeIMK+HIC4QnNN0wQHU8nXqUO790TI2QAeN7pXTvhs3
	 HIa/JS1hOH47cdhcHMnIJxqrXR2+KIjnUC47qRTGkGUDiV80ixJyCY3yzroUJzw+jg4Ic
	 23eqd/3iXSp/76AK1ETltIZd/LUigw6grfFz+bKIyG1MNUiEvR8+lq38ojFspCCyywX2O
	 0tWfRnaN3vpl+hg8z1f3+vMACo3rdvIHfEr8WrZOaJvbPHFtkGjMGODO/XdfrwbJvKfly
	 ZRkk8gFaWhhmJpESywKr6K5ixA2Ar2B49p7AxAMTc6w+LKcloHOSnLKoSC/NVS4AVcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Zc8kDAvAGcUtSSTv1tiJtX+vTgkLMgafaiJRnJ1QVh4=;
	b=kT3bw0lPndBf7vgI11k7+Z7wxBwoBd2QqRIh4JgUxSpmuGVz32s4w9oqfBCZlLPWDELc
	 j2ASqzTMBVgiswDpGzQ4nTov5y6C9yt5CyW0CLmg4VpJ8qWEDAJavkvlAkZUbiiNOrdAL
	 t4/fEmKcWnSx6+/Arx0fbyKGJu4MKFiZGPyG0AYH73QsYVa/OVCsBmAS+xDE+JpOtadg8
	 qVph1qTfMsyX8NxoEX2I3a5kLN3uBR0PrUXrGu00tUJtvqEOQu8NnyUrXADFoTkJuw7mT
	 9jqzzczsMfEq2/NCUHDDOLZwZUYkV1omHo/6lOi3339guQ2Un+XI8Gh/iH6P+zifCsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiydzYN6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D0B606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D0B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiydzYN6
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-539edfadfa9so2040667b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793733280; cv=none;
        d=google.com; s=arc-20260327;
        b=JdY+9lPHriUL4S0fnuHgFJvLuRbZWguJJzHPxOJiLLYXvRtsv1nLwEIvlvkMyOHFCf
         m0ajDMKXz7zrpSD+nSr/rnpFUTDl+vJ9S9ztIsE37wx8YoSrBk8sq0MIGy99ALPawo7U
         vtCmmVXi90NbKsJ9grBiBNKCKrlfgZdMR4FFmnDt9PjZRJ001TD2I3J71DNi2pgL48y+
         APmIKbuI3aTNMGRPLvqXGHZtlY6V4qn5WaTk9MxaGGu4OXyxcGfkPNY9IAYF08yMAbjR
         orjhHrdHRng2Ea5qjPOLdKW/dBrMjnUuV2na7P7v+pP4vJ+4pjfrLy/5mXeXIUX2KnAk
         ZdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zc8kDAvAGcUtSSTv1tiJtX+vTgkLMgafaiJRnJ1QVh4=;
        fh=h7+u+iDR6Q7eMIaTP5OTFRwBASCfBGGJUlSsKVnOIjU=;
        b=RQ7Lq7oX8aLmqxw1S/A4PiKRrt56kaiTY63PEL02DPYb+NmduD7XD0HIf0rwetaxJ7
         Azuaswk9DErhBrHeIwVqhVEFl89Fyyi5xCWX6TWlhWf2FIStMXkOCWU1KGtURK9RRZoF
         TBiJaj7TDPd1/8xmG5AqHnYm92MYXCqtQMcvErY9Ox/C9Es+lyZYBDFHyNGrAbSImjJ/
         b375AJmUno58dSv0X1pPEEYNLfRRKVvG7S3GUfyyT+xj5W/YlnNIffbnOtHHx1UdM2q4
         k2IAqaOvKtm4fdH3NEcRODVdf2ufUGNwON6c89FAugM8Gu6nGj6qgm8tAzHUuk3EMeXw
         VTrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733280; x=1794338080; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zc8kDAvAGcUtSSTv1tiJtX+vTgkLMgafaiJRnJ1QVh4=;
        b=SiydzYN6TtHDWtb4/2fslTv9U9W3eohofdHMi+vgsK8sqM8Xf92PZmLtV6C0q3vEab
         9k40X2VfLvtL5WrgBbwLyiRNacLzRtD+vyj0fo960l9NcebV9zSl43c0Nv7ox2IHkEVH
         U/cylVbXKnS+yxgEgxEAirzs1f4+vb/xrrIM6zzAXeMSgWdiOY+3L5eSBQgHntjdJrQq
         QKAS0GD6ku+vmnPfhqpq54KbPUjrxFp+ih3Oz3L7N9e5jcONjOTIhEvxN/fWpSmdQBq3
         viKiA3Qvd8AVuN+qqcs244S67XX3QcHIHZPFBnB41CGKLr9IcvDwmoUsAMqqnor+J32e
         6W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733280; x=1794338080;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zc8kDAvAGcUtSSTv1tiJtX+vTgkLMgafaiJRnJ1QVh4=;
        b=iz6p+xdElK3DSJPajXZHGIJZIq3u8aNEDXYQUULX/JvFmrNuXWoYESiWa0UVDckbSN
         IYYl8c/UAoiQfnzzPw1j/koQVUUQ9VYb91nYsKhjt9kvGBtF3dDFwY4xx+Qqt7AyP9/t
         tqHOjyyAfwHvhXY4wFXsJqPRZSOWhCUZ87jmNfqjo1EZOAGw/ljH81VJsa0bEWpdVBBm
         36qhy8cPWuEJhrNHSZvAGs2x6LqxzMIUqomb/d8rm94Y2FUYeaF4HdVavBNjAhzQF2oa
         +QsPi3iUct/ucxj63weZxLWfpSzytuHNI6KDVT2f1i52W/eIDgd9IBaIEes1hNpwC4i5
         lVOw==
X-Forwarded-Encrypted: i=1; AKwUvBy3+pcdQSDkIPiKD9ofvyamYRxmGQwkIXjHqPzWE8sfFkJg3acC+1sI+pkmng/zWNXF+ev2oKn35CM/14Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TkjcRWeTj8oWymWvY0AyvFbWk+Q8GxgAS4WAHK8Tg08GTYVXG
	6h4aApBCsuyRdaTWt90mQWiw1bijY738+NqZN8OlgaZwlyorhzkGiAuINzqOjVEVvsbBv9lO/ZQ
	xc7QY/WksNcX6DVu0N+pNcs+DEr8kyLg=
X-Gm-Gg: AYBFou0mH83dOqaWX/tk7F5/P+3uPqXM08F28bd6pK57giRWAGnLXkXZ5nRPoOnguZy
	hWRLLeJP+cGMgYxxetcGR67o3lCQ4u33fxOYD/QogtCYfjIidbqnCS639dO9VogtzyaE9z16KRE
	FRH77DUMlxjDQMOYcbfLDZM3pkuxP8meVYxbOZWFvQtdZ3oMp2/B11vHhSrmkwIGjkWv2DNRuUv
	dSCNDbWD+Aat42xpWvbOib1KyDM2O8Wt0vBa2r8rEhHctKe2XWtfLsZLv55OR5MF9hvLD5CtThX
	2KL5DuTwb1NiZdUSZpMNAzLuoeP3N+sgPZJNnC+BZhoKA8yZWTjrscdcf5ywSsMxHDMS8POYSEf
	Cx/ulneIafTL9qnJuigcm5+c2moQWL4pht0dvsFXwh1OEIJ8KoBzjmjSpNpKnaMtvs5gs
X-Received: by 2002:a05:6808:3203:b0:55c:925:9d5c with SMTP id
 5614622812f47-5640df0b09amr9395153b6e.55.1793733279946; Tue, 03 Nov 2026
 11:14:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164619.89992-1-dennylin0707@gmail.com>
 <at9xXRhD2xZhszEj@thinkstation> <xmp7ni65vbinfj4j2baisrhp6xzro3asbepuq7xp3mvx6maptn@r4dnoj63uw4t>
 <at-XtWBQg3jv3H8Z@thinkstation> <CAGEkeHfq1xZf_jMw9a9cz3iunj6O3UZ4-=iW-65aN2Ss0oT3Uw@mail.gmail.com>
 <rfvf7awrww55bg3hwq4edbz2ioorodlrb3wcmf45wcrof22cda@yduswvswhz2c>
In-Reply-To: <rfvf7awrww55bg3hwq4edbz2ioorodlrb3wcmf45wcrof22cda@yduswvswhz2c>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 3 Nov 2026 11:14:29 -0800
X-Gm-Features: AclHuK_K2i58ZgKI0ZncbiD-FXwtR_64S7t8qdGgihK-Yj_K5O78XEMeQeLdpHo
Message-ID: <CAGEkeHdALf_Pb8m+qUE5ZSqTWNn69rXyy33Sz1-PKJSmGxvYCQ@mail.gmail.com>
Subject: Re: [PATCH] shmem: do not extend i_size when no data was copied
To: Jan Kara <jack@suse.cz>
Cc: Kiryl Shutsemau <kas@kernel.org>, willy@infradead.org, hughd@google.com, 
	baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	dave.hansen@linux.intel.com, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The trouble is that practically any filesystem is going to have these
> issues with 0-length writes starting beyond i_size. So if we can fix it in
> generic code, it would be certainly easier in the grand scheme of things.

Understood. I'll try Kiryl's approach in generic_perform_write() and test
it across the affected filesystems before sending a patch.

Thanks,
Hungyu
