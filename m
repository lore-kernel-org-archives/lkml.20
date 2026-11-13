Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600213;
	b=dfT3JLLCGk+zIC3ImyLlA4Nr/Pwb+P/td7eXs0Qr5iMdO0UTP1dDt7C1iSOokGJ4rQJ4
	 IXUtZvkgQPqCRSs0UthLenVREH023aLDwTRjWOSevF9HOP7I7wq0Lx6jp5LL0QxGDez2D
	 qehSB1WCxEYAPpwL7sO3nqN8Fn83+tYttOSjupp987gTFUIgEYxcodLZaVS+ba+XebgLj
	 DwBSwokwtJ8DCkA5suNDSSEib7jTzBHC+Pi5X4vwPS+y5IkqQwskZ1yfGBpswzs3wvr6G
	 233csVgoxc7OZ13jZLM1XHbDQhndKOnEuvaGGVGVdnhjlbxlI0iwRZnwF/Px7CF+PfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
	b=pmpSvwUjK6Recnt5J3ri7Fb5Dfy+rCCEm/8Z/Z/7jJvkOQ1VDKdMesR+55X6AgHGOid2
	 5s+Y3jG6mg3KXCPe542W2C2zq+3DzV0CZkNZ8bPqIWp0zehnuMqdYDPC+yJBP6D6xcAtM
	 Awrm+u98TDjPecJVK5go/zFhUc4sfRsE4V+qpkcJ9h2kQr8Qmw7u5Y+RJhFMCeV0fxyux
	 22ucn3qzA1HvmJjKKTE6LZhIDZj8whjATSyYcchxmgMXD2kfyIX/eSD5OD+EOy4S5KWIV
	 q/uSNa0vgfQYaCNT+ux5lsGWBuqb1WB7iaQ0/twf1fKMAAXLdnrwH0UJR2+aptPwLZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z9P/LEaz";
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3390606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3390606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9P/LEaz
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-717028b412bso511886eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600212; x=1795205012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=Z9P/LEazFr6KVed6bhtpiLAGhPrXtfYhM2lV6DlzRTRiqS7mbJew5QySGoG1DM5DBg
         w/Qb+/GpGCjNrQHB8Bc3EIuAAxGD3zwav8las1IxrGyj5VzP1iW7ZAhBN1QRSZQkPxyD
         yeioWvEr5SI4P3Vq4TSb1WYol3vNnYv9cUW7YFHwShUpU6KqQIsl2AJxNiA2iaEqv29I
         wGAR5gThxr1VOyq5sfocJ4qmcx3g7NKpIcUi1cyujjclHNzEbhFA5CWvNFkgXOupYv/3
         WY8gMlrYVWAdAQ2/57OJ+l5D3YANZ/sL/zsFE1SpwiFdmO3DWke+LLQoS/jzS2JOFDa9
         SKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600212; x=1795205012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=nMdQo8gmwxjdVIb+XSOacHquRB8/KWYKNwKfzib/8r+EEjWMjuIzJCvXVfgyVdmOcR
         nunY07a+mApbmKLkn40wc36lFQhd+PpiWRLfdUtSYZ9dbbYvpmWnhHWC5rF4vRMAsTDC
         DERSIrLbCAGp2K9r3/V4yCOc7D8Qyt0WSdbeQs8HSGFBBT9KkwfPMBYkSTcCQJqmEqQc
         Rs5BUL1HyGisFgP14jzHS2HqpsriQ5t+s/+3cKUM3xvnxql4ynAzTxN9Ksk1ulg2ZnfM
         bQbxJKBPqE6IB3X5WFdVJAMfjyFZ1YdlYvwKWPHf4uHi4Ld1lQQwIEm3nk/GZPwBdgAk
         k5aQ==
X-Forwarded-Encrypted: i=1; AL+hErE8O1JS4sGXmEZO+Ds3eFTFnsp9i/J9x0RRpE2mL93e0L/jdMNUJdpGy1NaJIJ4Of9V1roEEZVAIfzfBLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XnSDGOaH9kw3lSi/BCtSzz2zNWQ0g2/BzUKtVpkwBUUPJ91om
	bCJ4TwOk6Zu713cXQndoS+YK6MDW+/ybM4xLQoviKQmQD8jGAaCaETO+
X-Gm-Gg: AYBFou1Bs5q3dwZvUxHOVkOBYYS93viWl6zc2JYF8XHaBDBqOQwvqRyrpgAUjqw1Ee4
	iKuZHbbwbY16DlFHixKy2W+KHJL1bbxI2JNbSc+skNS5X+xdXD9UHrCY9k5GN2O0ibWiVY3jSMx
	kHXmLQcaawH2BMSBUv53lOwbQlBOwdVhcaFJXj/daoTcw2HqTust2qp+ssUWuii7HwXt1v29n2X
	knVDeMaVHNbpdCvfMKfwlmulzTPE6LsvE5bYbArQUYeP9kmj5HsLrwiMRou42D7JrhaK/YQLX7K
	+rstksfWANnix8IWI92sptlBet83us0sX7V03TX9ZKhd9DVm1SPgYEfeIrQfBSBU6wHTereF6xw
	xOw/OeAA61mH/ugh4aiOvVU0EdpyLko5V200g4nqLCHFzUlbaMgFnUWxamPBcFbHUTd6yTxhAjY
	LFZDpIbim4RtdJC1o/ObBICbVLJPDsU/0lR6mPbaKjY0l/kt/tbTyzYBxRpfHFIPGELp9hnAhZA
	VcE+5RyMHPARoU8EpD3VinvK98i1Qiv4UwA0b+NZBc8lk++4XlTIwGQlU65840cJHKKRWwVJy/I
	fjEdqalN5Wj05pj6XtIifRRYJMlkaSW68KXXTiecHhh3mK1boS0T+K4A09gI8MVrnhVzCCJMZAo
	HI+5mM5krRGoKRiOfPKKWnO+//d0l3VY74hJqTxA0
X-Received: by 2002:a05:6820:f025:b0:71a:ce4f:4a86 with SMTP id 006d021491bc7-71ace4f7613mr375277eaf.56.1794600211873;
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4335912sm2485972eaf.13.2026.11.13.12.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Message-ID: <a6bc9228-8e81-4f16-bd26-2d9c72e9998b@gmail.com>
Date: Fri, 13 Nov 2026 14:03:29 -0600
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
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
To: Lee Jones <lee@kernel.org>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pm@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:50 PM, Lee Jones wrote:
> On Sun, 01 Nov 2026, Ryan Brue wrote:
>
>>   
>>   struct mtk_rtc_data {
>>   	u32                     wrtgr;
>> +	u32                     con;
> These are terrible variable names.
>
> The nomenclature should be self-describing.

Hi Lee, two things:

1. I have a v2 out [1] from early November that fixed a null pointer 
dereference that Sashiko found. I can spin a v3 or resend v2 depending 
on the response to (2).

2. would you like me to update wrtgr as well? I can add a patch to a v3 
that changes that name in addition to con.

[1] 
https://lore.kernel.org/all/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com/

Thanks for the review,
Ryan Brue
