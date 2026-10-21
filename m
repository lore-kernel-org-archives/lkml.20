Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617923;
	b=2vH9npOBhAR6nQjafxVFdy4gJVOLgMmos+SaeHhavS9PpVL4XJc+Q73tcuyZM6EpzDW6
	 Pn3EUbPRgMbLlwhedVpBu+Hizx81e/W+bV43Yzksy8Mv98zW3qw+rZAnjOwVGIr0jn8kw
	 1UfvWX+rhTW3q4R1hs7J93m5yffFE2j1TppmYpQZpK7763m8qGHODyXcIh91kaVPCbHf0
	 gmeBBNfQPfc3TIC4Sa1Qmz+nQShw8mP0y1TNoi8GpUwlwmT9ilfzeYrFF3K8xRAG0hNBI
	 6FZgMrpwqx+1kf9fAWX1Wd86Eg5CCUdJutg7+XCDRWsoty09Js2WmhvtFfZamwV3+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ACRfzynGelllT77etLsakTD4rjTJm7eeOZSx/UN6ohs=;
	b=OEPydy6kLQePopN+B56qmCH7iMOn4lV7uf1juyPVE+YSaNJTQ05kpgbnk+h0JcYhmff4
	 HKK3s4BD61aOi54zfW3WQgPVnQvZ41dSV03B3Fi2XxmpQXIw7fmtQaruzjQpkukJbWYfA
	 aD07HiigOz8rIB0dMHOKniZuakjQtdiGYxHLPjNfvXfoyhwie9D4Q8iHe4vUQs05Lm/TD
	 cmarAeVrY0VvMzTvSZq3MhO/Y9mMfz3DaQAxPWn4VdDtBLeHTvBHAQ/pyRc93mGQgIxvF
	 flFhdHps1/EGNbZlkGH20B/6aaAVob7ZQZrqpLfMwnPGP4jojvGnL9FG1Ju5X1+DbTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=grsecurity.net;
	spf=pass smtp.mailfrom=opensrcsec.com;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DEE606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7DEE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b042c0759so875570f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1792617914; x=1793222714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACRfzynGelllT77etLsakTD4rjTJm7eeOZSx/UN6ohs=;
        b=G3hXgeJmHnHsg7HJF1z8o1Ip7YCRJVYKpWgy89whmtbjA/wKvGK3WFih60brVXSAB3
         BZxgalQ04wlI2vpqTVcfUF7bFM37C4j6A2IeIqs2It3OZ3MHZCW8CX5lBzl9s23BihmR
         6I62CXqTqZry+xrIL1pyDolzUvz7oJvQwxeRVyrj7PWa2FJnT0mb/i1Gs1rqaoKcvIOd
         lJduth6D9DubAx4+41Nv6qMSR8M1JnFSKOy+MnD16nLuFCEEfLM15M0u6IxdUhPfl8jr
         gchiyqw0f6oUfFxoBHmGHZfWCeEVdm8jMcxlLED4qgZMyYPJ+TPNVGCPazKd+rSrTKDB
         q+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617914; x=1793222714;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACRfzynGelllT77etLsakTD4rjTJm7eeOZSx/UN6ohs=;
        b=rNEnfjHwK/vaYIB7WhsQ3U6USokmY0x7HrWaJ1zvXuUfm72P4mqus6hbqNgf0Nk2MO
         fMF8DvomA0BxDn+JnvAEzdYOvcq6WQ2qLiiQ8ULgqt3PvEpfdOJ7J3YLhiefadd/+jnY
         xhxo3WJBTZ9uPu8UhoaGvjmdwM7JCcnOvhYabnpYvaV4HOCi0RfeXLfEU6afcuUMG/HD
         dAts0hrEr04+b3yHPxIrfh8geH5Yxdo+SSpJzxDr6IThKv6kvGRKbeitP84XrWltIFlq
         xjR3c6667zCHQebugWSzMeQELOCvs6gh1BZWFs3WQ3w0tEdsbXM/5y0BBWhU88yWmS0K
         g3qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxynJFr0TDbu+BSjEYFgCH4N9CPBrZoLEsW4ux0R63Q/26h7u7Sffm1YTWXkLIB9SmJNfJTg8NuSrYje1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4DAUkJgq9A5apPz87mPWZt5a5ORcjz+0I19xSugH1jadeGWrb
	MNQ5VMRc16CVLMNviK7JMuyZeFuLV3u+ywSJAWJlXAz0GeixMKJX8uSk0OC9kY3hn/uU8y8gMjn
	Lhc+G
X-Gm-Gg: AYBFou393n+X8SVvg3hyo3pQk7GHcIKVgyz41VS3+TGDzuCFVQIz5a6iKvMdXvbBz2d
	eXKIIGpbWXTUhfFNP5uLMGQcclXj2cQQiK37VYis7yf9yGVFcKtNXpZhakk7K948h/oJA3Y4x2D
	Ar0ePZbH3fdSh6rQeu60rjh3u5PBnAIG8Ii6YxdkjG1rf6WFZOouuwbmvzypKj+qnGqRHVShBLB
	q9AKY9SFemDkzywTcXk9f1vhEUJgKolqa7eKYrHTvNNeoKrOHscALjAn/Amu2v4Vhs6jj7+utDA
	9TrlEt1MhM2rQUTMXrm2frYE66FXohhkC+/18oqDVYXpTz7PaVktswewd7wyYj4RZoKsn5O5hea
	7NsTpF2v3IHQceLJyvnHBlBOCnPq8pHBMHZm2O1H9XTedfpG2EEGNC1TOVB6l32vlgpXB14Hki8
	f7JxJEsSG5kUXkijCe9Hie2uUVxoPatblTHNJEtGVBZ2loxKV7DZ0EpnLTLEX6HOcJ61K/UFuNs
	MSd8GhPJqVfN1Ay/j33cnUgOBO95icIpdrfqUuY4UHmLik5Zdndkgbj1Q4Mry+4YKZv9bi/thGJ
	yY9u2EtkchLYsgUKUvvtLKYV/3CjOi9MkDWp4gUckBFbsyiDBQrHxFg8HJOUgjPSOaPsqgy2nQb
	+Xc3vd+IpIhFY
X-Received: by 2002:a05:6000:4b0f:b0:48d:f7f0:327d with SMTP id ffacd0b85a97d-48e264bdb23mr7395870f8f.29.1792617914014;
        Wed, 21 Oct 2026 14:25:14 -0700 (PDT)
Received: from ?IPV6:2003:fa:af11:b900:8855:f04:e797:81cf? (p200300faaf11b90088550f04e79781cf.dip0.t-ipconnect.de. [2003:fa:af11:b900:8855:f04:e797:81cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm8383009f8f.24.2026.10.21.14.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:25:13 -0700 (PDT)
Message-ID: <aad229bb-27c2-4c5f-bfce-73d2a0d04996@grsecurity.net>
Date: Wed, 21 Oct 2026 23:25:13 +0200
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
Subject: Re: [PATCH] kbuild: prevent building single targets twice
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923123936.2227924-1-minipli@grsecurity.net>
 <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>
 <atjwobCk-mdeIlkd@levanger> <20261021190311.GB2611266@ax162>
Content-Language: en-US, de-DE
From: Mathias Krause <minipli@grsecurity.net>
Autocrypt: addr=minipli@grsecurity.net; keydata=
 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
 RzDVkdgPJkL/NFTKZHo5foFXNi89kA==
In-Reply-To: <20261021190311.GB2611266@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.10.26 21:03, Nathan Chancellor wrote:
> On Wed, Oct 21, 2026 at 07:04:33PM +0200, Nicolas Schier wrote:
>> On Wed, Oct 21, 2026 at 08:53:56AM +0200, Mathias Krause wrote:
>>> Ping! I know, it's the merge window but this patch may have fallen
>>> through the cracks as there was no response so far. Just trying to take
>>> care it doesn't get lost.
>>
>> thanks for the ping.  The patch is in my review queue for the upcoming
>> cycle.
> 
> Same, I will try to review it this week or next once I clear my tip of
> tree clang regressions backlog and Kbuild merge window madness.
> 

Thanks, guys!
