Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618296;
	b=YhLljuSnr+GzKHi/3Xz9BCdeNHYolmFwIBVEFXKP+YVoBg28/FB05J/c40RXcJvMtlkq
	 ag/dpFfBdRXXmX/LsTnLcyeWUkVdod2IENo+WzMwyuMUsaHort/VM1vgqoHMlPS9ZqTLJ
	 b6LuCDfhq5cNKps38mU9K7s3JiqFfGRsYREV01Lwpa7hhVNSB74Bph/XCHQf149qWo2OZ
	 a4wySjKuF0Nq1VNrCe+v7/awLzcGc6RD74W8MgqugND4Y86AJeTkPXnddfLXlc6dG5KkL
	 gwjdLyORZqVe3vumBKQ8UKu5WKHDrYo2QG2yNokH91jknv51Qj5gV+NFy8/vlPGSfUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1yynEp54ZHg/bAl3tECuL99Dgvavr9fresZi3o0Y1io=;
	b=L5ApVsnfRDXPRCur4kDvzhnVl1mhj9hqUyA/REty+8kOzLgRAksiDiys9LHyOV78IIOp
	 zfIlbnM/QX9FfSAhAXBGkvm7XAKc2PLdQPkRJUioh5pZtunmDI28n1IhZuhlSfhx9ETkx
	 FXVlb2MUiUeqD5ljEyC5GHgKiQJ63d6sEQe0MXfLiiokUOyFBmq89uY0c4K+GQclZgw11
	 bDw/Usn8Jq1oO84L2RxBYLM1D3/la5KdhhO16qhe/P+/PmV5FZO/gHT07ZloAT3uvLbVk
	 Uw2L3OlWJcSTbNWSuH+Jr88uSXCBO6Vw8mbri4omjD6j6eJRea2pbfS21NIg+4AJvZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLXOpm8E;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63B460A2639
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63B460A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HLXOpm8E
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba328513b9so2720762e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618294; x=1794223094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1yynEp54ZHg/bAl3tECuL99Dgvavr9fresZi3o0Y1io=;
        b=HLXOpm8ENVpkY58LUtPdSmKtWAjb0kBQBWUI9OSY32i0qu+IF4ZGEGl8hOjOUqBPwJ
         qucTFrRAybe/WdWOvtPbOiR3zr+8hSiRo0D2S5QK8cF5RWRjPBVF4R6T74uwLPlEsVVM
         M3R0rOY5sP5zynRjiyNvFXxxqVyQAX8KbW2aEA4Kj6gSaWYc3cwmgu+Ve63x6rVk8Bx0
         fzeSkGIMJDt7Nd06VPOygUrVFuxvgrwQ3y/iplClvGv4nNyisUI58oXnw8xPB4oEP5iL
         oo+WmRiIVTNz7nx4soa4rvaeUAeBf+nZ1MxJEyN2xjM1jKuXKT7Su6H2jP65P+FaAfQM
         xkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618294; x=1794223094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yynEp54ZHg/bAl3tECuL99Dgvavr9fresZi3o0Y1io=;
        b=ujg0+A/yGnSeZJspW2Nmlncv7Dkt2j5fhcAzqcUaoi0GAzPDnm5Zuu6mNV3nNC93gn
         JsliHF86+Qb5GBOMxLkD5mRH1I8iAjcAAiwCHogj7Q7LNpnC2sP8CR1fZKaOzUjI9KMT
         PElPvOq2bG/H5ptxb12eGJ161VVg7TOSeUjIHERKi0IDer5MBJUwH6AFuBFqM4PPxenM
         E7KWCduex79ioS6+plu9pmTgAmhOo1W9XI/n22bbHzNA/0CIS8003BOoAP5RDEZBQo/o
         5vKi4lNMjMXiuaXNkl4hJPjAamDN/5WG7+lgYAm4cV5pie4lmPkXpLsxvTBHZ4QZb7Va
         77qg==
X-Forwarded-Encrypted: i=1; AKwUvBysZGkCqyoman1V+n4hBTLrSspTanIVzVfso7eUMkAST6QGhKecnOPz4KmD1kTFfYzh4hIwnvQ4ajbjpZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C2hXRzcnKXJunpM4fnFYLnRw8MGkJzjKMw/0Zp/gFQqVaqoDx
	/fgFebWGvkzsusMitOLUX9sDsKJIBnw2UiGgPrvDHAWGZl+NdE4N+MQN
X-Gm-Gg: AYBFou1iMonHnwyOVnAiayziqjGSYbZFDJO/TE18u+Zyy5uE37YuKGOJQtVL+Wfgu7l
	0QsDSI9y1+zeaVWkXdpJHLxEpnW3JzTAe+HR3Z7Hm/HeU2NnWPX/Q54dF+nWwm9juABj5MUGBxQ
	gDc4A6Hjrs2XWXY8GdO2sEiGa98Ax+iXzJUnHKV9OAQkHzc8v1N7i1epL850lTLI6lOq1qbqaQp
	/tr4Rk2myRG4OuMCz4d8wA/i5xMKz7tRXycKJaC0xaYXaLb3kl6OtgyyLKO18vaJgDxXsJeeXfv
	S9r4bwLzJDZYLx81wQed2Az6bLWm3P86tzvCZeHEMm/NQTXxb2cpFqxTXHBvMVM1QY+MC4Z81C4
	OhWhQD6xB7Q1K/6XcUJ1az+QcoxmD9HTJjQf61J+fB1BB078X0/KapVEHU1ZC3Rd+zS/47BNqMv
	rtcgAxB0/mbZN49YM3XOZoGNvJNrUVRAuF+SNB0ZBEKZ/aE493GSG0ceim7hlKCNcDbnBomXZfJ
	2TZbUxqjvl8leTUcJ9gmmSULxmSCie/2TF2o327SfaHYuwKXhTmYqhu411VA/o0BjJLpznSBfxP
	EhczeogeJF96TMvMk3DpXVzges1xKm6ID+Yv9ybYTil714chdPfYzQ==
X-Received: by 2002:a05:6512:1392:b0:5bf:c9c7:eae2 with SMTP id 2adb3069b0e04-5bfd9596876mr3227650e87.66.1793618293591;
        Mon, 02 Nov 2026 03:18:13 -0800 (PST)
Received: from pc636 (host-95-203-3-139.mobileonline.telia.com. [95.203.3.139])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074168bsm1622248e87.63.2026.11.02.03.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:18:12 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 2 Nov 2026 12:18:09 +0100
To: Matthew Wilcox <willy@infradead.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"Liam R. Howlett (Google)" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
Message-ID: <auhxcS4rtrPG3tVF@pc636>
References: <20261028154218.1668182-1-liam@infradead.org>
 <20261028154218.1668182-5-liam@infradead.org>
 <auKshDXKQXt1kvjy@gondor.apana.org.au>
 <auMbCuecFeRmBFSK@pc636>
 <jfvq7vkx73vzp2ukq6nwnb3v3g2ezdcyppba4oa5lpzmz6ls6t@akc46gonndgy>
 <auQhkHG6XlgNTdRr@gondor.apana.org.au>
 <auRo5WBj2OlKlWGW@pc636>
 <auTrzlSFCWNJYisW@casper.infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auTrzlSFCWNJYisW@casper.infradead.org>

Hello, Matthew!

> On Fri, Oct 30, 2026 at 10:52:37AM +0100, Uladzislau Rezki wrote:
> > The problem with spin_lock_irqsave() is that vmalloc() path can take
> > time to alloc and map pages. I am not sure this is worth to switch to
> > irq-save locking primitive. So this is the "heaviest" allocator in the
> > kernel. Callers have to be careful how the call vmalloc().
> > 
> > IMO, this caller has to be fixed.
> 
> Which caller, though?  Are you saying rhashtable_insert_rehash()
> needs to call kmalloc() instead of kvmalloc()?
>
The problem is that we used to BUG_ON() in vmalloc if soft-irq or BH
is disabled, i.e. for vmalloc it is incorrect state.

See https://lore.kernel.org/all/69ff8c7c.050a0220.1036b8.000b.GAE@google.com/
Two patches to address this:

1. https://lore.kernel.org/all/20260515153009.2296191-1-urezki@gmail.com/
2. https://lore.kernel.org/all/20261026102503.30860-1-urezki@gmail.com/

second can be updated and resent as it checks if the context does soft
irq processing whereas it allows:

bh-disable;
vmalloc();

forbidding this will address the rhashtable deadlock(discussed here) but
this will just fail allocation because it is incorrect state for vmalloc
and calling kvmalloc() for rhashtable will not succeed.

i.e. rhashtable context should be fixed also. This is what i meant by
saying: this caller has to be fixed.

--
Uladzislau Rezki
