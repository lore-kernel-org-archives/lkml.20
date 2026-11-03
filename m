Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718375;
	b=G55UhDSWZiYkoeXHOc/DJPRD4eQ2oWG88M6npX4ceefKJzBxcJj5+lDDXnIL5lqH1Ep6
	 xgSTOVaq7ZqtaAyYBEPcyTo6pynz5b4zZVq8noHJ2diAHvv5DKXXwZNxrg52v4fjcalxg
	 caE30i1V5HZXe1d8ouQ2Xv8wTPC8padyn2nlBd2CGn/Bda4+GxTtBtjtqfRmTPJK9RQzo
	 o3SCFbkx5/gEDdU6CtU5Abfh4vpaxbsGZQffDtxbad1b+bSxmPGJalFrwhROOyMMOiMdL
	 VwZ+T84M8GRzixwIbx/4Pv1fEoDX3HS4yx/vZKi/D3El3bverIR+lzBwi9zJg3R/I4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WU1/Ti5vxbY29W1twRVtNnFD14T2IhZUCkb7kizaXd4=;
	b=YN/YZDf1cspYmRblBTk2PduhZPt+hLaglcZrTVwP5mERTj8zHqrygqYD0gluTmeJNtlX
	 WCumdJVkDp0o+ibo5qJybtjr1dawy2fT20FDjqDNCAd+DDneTZgjy0rYX94bXfn2wlgCP
	 FXOh9LXpm0ZSveW6MW6mK+kYgkoUcnc9SOyUDscTkly042DROsvqV3sl66MLIB+m7f0jQ
	 OMw6VdxCTSIPWpr0Nt51+SHyffbFcWwpI3AWMKH3lwpYhmK8vTdfYNpHX1NcmFYOSqPDk
	 K+ufrKyHui47egaqk+MntSKh6HhbDZx9SaXWyQd/ytukcxaKurQsn6o000ShMahtEew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VErpi5Rc;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3889606A796
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3889606A796
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VErpi5Rc
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so38654505e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718373; x=1794323173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WU1/Ti5vxbY29W1twRVtNnFD14T2IhZUCkb7kizaXd4=;
        b=VErpi5RcqMq3SW/3qWGD0WYex0zau9GVRc37Ezu3qMLjkAUbCc5dgrUUKCZ+D/+gu7
         l1h09vcIHO+B6fDy0+PlH4JKE5hUQP03OGvOGDPsv/KO+lSwd9Lr71jCpiO9YwkHTEAV
         Adb7zG/+53hfZOchByDb99HjRJC6cJ/WIKoayyd/ru0sdepFScAs6Dy9NhjhQrvUgjaL
         25hSlVOcbhzCWdp2WmSdxbg8V1iNTwG+ST0Fn/rs6OkepuuqBp9Nl1uSsZ68eVz9pCU5
         MaGgqyDSuEOACgRd7194eODVg3LIXnAG3+/9gR72ouRZRfpglT4wuzxdXnvT61ohFXiu
         afXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718373; x=1794323173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WU1/Ti5vxbY29W1twRVtNnFD14T2IhZUCkb7kizaXd4=;
        b=EKonLB43pqwJmzS8gZ+mdUBhUviNjIi24NK4iR6hTmTC9XWjShtOoBC+HiqjdtmqOO
         I1QPoQ0VZbG9u9IR54rwDcaG/1KYD3sAg61100yn/Y6iIr6NPXqPxHrTaNJlTpNk87r8
         AxygjVO8xmO5AYUs/6047p8JpmZk82gS/EXp0ou4NQWF0BLJ1S3t90Z0TfxR0Koy1SO+
         ul9UnzSjz/wy6lUYtJUSH1DSsihF1kRvD/FSbI5O6X8/NVRPchSm31QYYLL6qvAmSIiE
         OA1JsX4Gbg5vbMlEXsLB5Hugo2rY1we9Hg0UEJ9cYkOuajzIJE8xCdK+qLZzy1IpRecp
         r33w==
X-Forwarded-Encrypted: i=1; AKwUvBwhqo1KbKvVfPtK53+EI7SmTyCEAxSlDFSuC+HaJy90LP7+H3RtDYwsVZwnfDmQv42OHRFB1HRn6+684sc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LX4TdvUtKFD2jujrZgySJwjtnlWaIX0/0TvWCcOx9eFG00t2s
	HT6BPPoViveRtxG2rPve3PfIxMTPdOaMWu4gi5yrxbMWwT3K1hMgslo5
X-Gm-Gg: AYBFou0n0l8vWoactraTWkPW+HvZDCByaVb8qKvSxuH5AMcKlFJISlCb2WzxYwIFWM0
	AEyEKGeZo3AQWtBzrFvlbykdEHaAMcWnlgxywMVqKqCxHrCWfAGfKhuVEvo/KBD2c2Ua/VNohlx
	LTCdMCpkdKQnlcOAAT9wtqiaEC5//hsJzNrhL99U8yNEe6XpbbgQGRpSjCxBSPmSrNVe6q9p3dk
	OIeinN+2mPsFY7fRUKZLuH58hdMzkoukOEZpIfn1IsqRU3Ery+5j44qTJWfnyd0WV17Y/xSMKcm
	UEtbn0K516EM1rIwHKwajb8glQEuG2e6QVH3mkQfVEnmgohnvH1P2Hv84ITIsPwnOsUC4GbRyj5
	4X8c9UsFhgvEX7G43X0Xh4Pbh99WTUt2Bg7KuUatw+Dn7/DXTVK0GxQJcuCQpHd6EnsQGSs7p7k
	BiId45zvywlsZJwYRryoxJKsH0bDvwjCcpkMeaD/F00fcpxS3EXgO0OXcSolLddforRTCRksU80
	AOOfdE0UzLMt39MtjgStGkWGYD1CgmiBgpkP5RjG9VJwZ7Bv9rwDK5j6/6905709bTdD5225quq
	fBzYfKJq7tUeEJIc/zYQi7N4OwS8enV5fGEnB39TaOnz/noveUExPJRL+LhBsTMa2SuUkDDq0he
	X
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4ac17b2c396mr294720925e9.26.1793718372761;
        Tue, 03 Nov 2026 07:06:12 -0800 (PST)
Received: from [192.168.1.2] ([31.176.171.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm226623165e9.3.2026.11.03.07.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 07:06:10 -0800 (PST)
Message-ID: <314eaf43-34e0-4a44-8516-ce25220d4758@gmail.com>
Date: Tue, 3 Nov 2026 16:06:08 +0100
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
Subject: Re: [PATCH 1/2] mac80211: move static function from header to
 referenced file
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
 <20261017155509.128114-2-omer.e.idrissi@gmail.com>
 <b60d12eb-dad1-4482-89ca-155dfcb410b9@oss.qualcomm.com>
 <2070cf87-bc38-4237-a58b-6554572a8842@gmail.com>
 <936d7fdc-fd79-4869-b39a-7219d2ce4979@oss.qualcomm.com>
Content-Language: en-US
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
In-Reply-To: <936d7fdc-fd79-4869-b39a-7219d2ce4979@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> On 10/30/2026 6:21 AM, Omer El Idrissi wrote:
>>>> Move static function from header file to only c file it's used in.
>>> why? all the drv_ inlines are in driver-ops.h
>>>
>>> first rule of commit text is to describe the problem you are tying to solve.
>>>
>>> don't add unnecessary churn to the wireless code.
>> i moved it because multiple files include the header and when those are
>> compiled they don't see the tracepoint definition because the next patch
>> ifdef guards it under the same config that enables the only file the
>> static function that uses the tracepoint is called from.
>>
>> this static function was only used in that file and i didn't see any
>> obvious reason for it's existance in that header so i moved it to the
>> file where it's used.
>>
>> commit messages are kept in the git history. should i send a v2 with a
>> better commit message? or is the patch series problematic otherwise?
> I can't speak for Johannes (wireless maintainer) but I would not accept these
> patches. There are thousands of patches active in wireless, many of which
> solve real problems, so the maintainers usually don't have time for "noise"
> patches. I have over 400 patches in my ath.git queue alone.
>
> /jeff

i suggest you take this to your local union. i'm sure they can help you 
negotiate for less inhumane employment conditions.

