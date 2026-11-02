Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643657;
	b=2myJS5wkD0IvoNjzX5ABkCTnhzGck1TGniR1VjN/NCzQ7/Oce6DGAXNn1M08QU+j+MRI
	 opXJyYWQyKHZc9EafmvR8ppfQgttHod+TcwMkGRKR5OTuzeqYyaNesLiEMRE9beuDe+/B
	 T9nDsV43FRsKwADncVjrDDsa5fH4ZJ5u0GpjAlYdo8W/XNHoUFr75VdV5RmdD1Ti1Jojo
	 bAoUaqGo7zveWVXWiwdQ9OgSDiA7rhEHHOQ1mS66lTYPm0WALcLWiPMJS4kxyNAhvX+d2
	 VLkO8QccHggShJKzErnQHmICqanJ0YdkfVyLeQQ+FbL7UhFNBh02hqG9UuUynst+glw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RT+7IFXxziGze2U8VEflZ1s2rfPZLxwW/lG0rTRv44g=;
	b=eu9XvOR5MtqLrX4/NaD55bERg4hMHQuKfrpQUnv2UTuLsG9WkFH4PYyMdFWZvEnJA17U
	 M0Z2VJ0QwrsLEfPm2uwy2uWRlR3pHz4EQZ4ap4Wv8K50PFaBIFzAZSYdjC89PS9lIPvBM
	 FWlP05FhL0YA6hvw3JAtYN+mcWfbwWJYqaPd4+b5TDWO3uCoIsmNdNK9lyL1icgX8dZlK
	 o3KZcEl0v1yjeBRbQt0dvgiDOtNR0ujbVOfe3BjsnUauvfqwCr1Zt2CKd4d+QkCQVh/Di
	 XT7Gjg/mYVE93KhZSmXqmq4dJEnUgMvT5D58mbIlb7UI/9/lu3A0WLtOaA8mUuXNLWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hbWSqaTY;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE57E606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE57E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hbWSqaTY
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso7045466a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793643655; x=1794248455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RT+7IFXxziGze2U8VEflZ1s2rfPZLxwW/lG0rTRv44g=;
        b=hbWSqaTYLs+ExwKEXjn30jemnSLwP84y+8a5mzqJNFFvD+gs/jCIBNXBXTZUPvY7M+
         9XzDuZvTjrlZsAMzrbT2ZdqgOd9aNZp1NEZfhLoJH5O+zMS4NI2W7457VXPv9OuHsSBj
         XP38XghTLfVNQKBLQWDjGmwxZarhEnajHv/SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643655; x=1794248455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RT+7IFXxziGze2U8VEflZ1s2rfPZLxwW/lG0rTRv44g=;
        b=GuPwRu05+lf+tTFJpDOeRDAjWhD998yq0IR+5ZOeaaugd/h2MNCFKTd44wf2d7cfPO
         NkQFc8uL4iVjG4gHtObiJiGU1dfGKpD7vaIPAZbyolpjIRpJgjLsApqY60OmHEpa+V24
         6hR+6VRGSMNori4NFQLxObind1EodmUmE0BEm4y5kuLWeMS9qsXorF2qVPV69In7Zgj5
         L9tqyaafccby5JrQhZ+mUmq5Swf0QRoTPI63zTfJ57JBBqswA5GxW3l7E1PkW4Mnyy/M
         hPBlWcmJlT4Dc+9Gsznr7j6C88MdVTIdzHSxg3YHoD077kLvAoGcCf6U3hoBlJWYvVW1
         ILqg==
X-Forwarded-Encrypted: i=1; AKwUvBxv67hVNI+NvgC4SIXUsvn8EMObU/96eEFNElub3ePE4V/hrsUY6hnyNzzZ6I8om27H+Hf2Uqwc/ubXtdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q2u6w1IAk5xonBBV0yhJg0KFZ061JRGUxAwhzsiYh/q2LCB4V
	rmjuODkQV2eeKGrUZUQ/wwoN6xMc8EAhSfQx0N+cVL56B5xyqAFwQIeIAjoJJjtmIDD3e1xKS+A
	wXawZ7Sz6mA==
X-Gm-Gg: AYBFou1viI6v56ZoSlSUq2cxz+Uvq+tDkTlorbUIJHhX3LjBSX6qYrHe/PgoUa/yRO8
	rc+KAR3qsdxtFsIKeu6pEcyTwLvG3YuZTPbZ40E/gEBeAihuu1t2fom1awwbC3ZDWx/vwARb8Ht
	tAc7EZWOIxnitkhHGi1Lv6PIMFy80KRzKz+hS1b68DdgPTqiXmaMJgGy3cRwcBLrNu4CZ/tYpI+
	zDbFh+2MbqHFBLVd7Nkpp5cG7GfNlix5SCIXyPWTjUI48rUdwOr/cznQ1e1JTSPVbq0KinhFKnu
	AK0+pRIiAmO200U+CkhDs1j86zvSl8B/Qk60xR35P4o++F8uQLqfg0lCxicUnf2zFdw11851Ls6
	0j2Vp7dYETaM3BB/twD2oePdGNmQOjlv6Q36BFHvIlkr7njylL9MwAVKQnAH1VipQmVNWBDWna4
	fIjpsuq5FT/SbUHBP/ZCaRcc+m4y0xqJVC5wBATzWZ1sYyg4XgzzTSp8Vcvi6S+tv24PoEDGTYX
	nPPhipZfVLDlyQvimGJDvNqfiY4iLC/rxzFVoWyARBZRi1xecy1apAsXBLHeeSOa++CVrVuajzL
	dPW/g7rugXyapKvmTLrFvH0YSMyaE2IcqdecRnjaZJMlIGrxnrcP10OHbXAvlmFivPpwT7INW4N
	T6w==
X-Received: by 2002:a17:907:7f8c:b0:c49:9247:9688 with SMTP id a640c23a62f3a-c49d1285bbcmr1316208866b.7.1793643655016;
        Mon, 02 Nov 2026 10:20:55 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fb9a3sm3490181a12.14.2026.11.02.10.20.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:20:54 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso7045435a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:20:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzaUTcqSEIeQVhvDDiBX8jTAzyT8DO+R2ZgmHOpHh9BbyDt1XgwCIqGG38McXHWOCjhGUIYNKfJ5lT0sms=@vger.kernel.org
X-Received: by 2002:a17:907:7f8c:b0:c49:9247:9688 with SMTP id
 a640c23a62f3a-c49d1285bbcmr1316204266b.7.1793643653874; Mon, 02 Nov 2026
 10:20:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
 <20261102094716.2c8b1cdd@pumpkin>
In-Reply-To: <20261102094716.2c8b1cdd@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 10:20:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjx9EAO50CkadGadOA_ea0D7bBBmMbFfRqyf0OriZP+tQ@mail.gmail.com>
X-Gm-Features: AclHuK-Z4wjS1TnnNvVFXW9ibPlli2MU8fU3Akx6pwhQZSabsXf7hJO81Oq-TFA
Message-ID: <CAHk-=wjx9EAO50CkadGadOA_ea0D7bBBmMbFfRqyf0OriZP+tQ@mail.gmail.com>
Subject: Re: Speed up KConfig - fix hashtable confusion
To: David Laight <david.laight.linux@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Julian Braha <julianbraha@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 01:47, David Laight <david.laight.linux@gmail.com> wrote:
>
> An alternative would be:
>         ((key) * (u64)(size)) >> 32
> which avoids the division when size isn't a constant power of 2.

That's certainly cleaner

Not that it should matter - afaik the size is always a constant (it
comes from 'sizeof()'), and I would actually prefer it if
HASHTABLE_DECLARE and HASHTABLE_DEFINE took the number of *bits* (like
DECLARE_HASHTABLE() does for the kernel proper), and we'd just make it
a rule that it's always a power-of-2.

It already *is* always a power-of-two, and the old code used to make
it a slow modulus operation if it wasn't.

I'd also worry a tiny bit about what the compilers do on 32-bit
targets, although obviously hopefully (a) they'd optimize it to the
right 32-bit code rather than do 64-bit ops and (b) it's not like we
seriously care about 32-bit host builds anyway.

             Linus
