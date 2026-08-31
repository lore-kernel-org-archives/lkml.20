Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6F371D13
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204423; cv=none; b=iaDWYHsw8pLTCL45ElEphFxAtOpOoQgDNm1irDV+lZldi1qprcOAGPtGBID4f+zRDGlyZ5bnMaTqlBoY1aIxwsPmvO2hyZebuBAGWtnrFvPBWEXU1AAERLN6t2xYydAtYwwWhHdpyMsdVNmPDoslyNcrXOt2Kf82X2EORPuVX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204423; c=relaxed/simple;
	bh=m8l2QUXhApjrCsVzfi6W2WccB51qMXqtc/wGQ+hJ4hc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M3ZZDDiW09qUvf67cAOqrpPM+c6GQJbjCiZb+MRCxBDsJZducZjOxPzE51PDUBhEvHoLvon7g0xGUcf+n48O4We9vFlG9Bsy27SOr0eDGrLSTAItly8KGnqj/anp3Q6JFEXvUS5BImsmR1alnV1+fbflyn6AuwP7dV3ffpyEfIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mhK64jr9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mhK64jr9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cede6375caso23605ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788204421; x=1788809221; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qiY4Gs9W/SFQ2HMe/A+IO8vIdD1aF3hD3uNun4m4bw=;
        b=mhK64jr93q+X349t5WlvgWQhIhtnoa7y/VZIu0TrTMXMIWEKPhnSx8KtNJvchj6cC2
         tplFxFMkifYkvyiWtJ7b5LAsuqvhHFomB9RZ0sd29dd67h3g8l0g5uggeSmHhDKyiLPl
         jAyAGd8un8Ey9NDyh624y2wLqhhy9omQp68K0guusx4IPpY9FCUHdsnmm2uS/Al4X0qr
         U/Ah+l8RsmNQNlxnFtP77nMYhdkBe008MBrblQ2Q0oM5W5WuGHaXGrsv/aty8A5QCq8p
         Ho5PfI4pvtjmaCPVp10o8SDWXjnFX9shd3Ypdc24K+ybdaL/3hLvM0l7nOLxO7eEgX5t
         U15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788204421; x=1788809221;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qiY4Gs9W/SFQ2HMe/A+IO8vIdD1aF3hD3uNun4m4bw=;
        b=BmAYdgBhHWEE+Sw2WD1w+nlRxJWfjcchJggGx+RTGyjzMloAnF6y0Y7YvE5oaLXH5o
         AK0Z2T7RIg5P3xrgcnqA87q6pyJigr+2F/FkBW4jxH1Dm/5X4E5aitDnzZY2d3QQdzMY
         Z1PFDC3um+ejBUqZXVMGp9MKd1pEoYA8Zc+eJIJoeTmLm32wKxYD+p6fsaUnJlSKR5b/
         THknCyuRHqzt1w9fYdSwyhe2+feOaHxwaD82MdpVehD5xbg1LEpH/fyFBqfHdlkdHtdK
         J+GAG9Lpi7PFvHBwensRZz8bkprl9D2Jiyp9vWkjJqanczS3hmuYguyNqp4s2aTw7teH
         T2qg==
X-Forwarded-Encrypted: i=1; AKwUvBzsrpWTwWFnRzfMasBECMDL+olDMgd7GoxRkQEIofbqUXe8sLCjeeJ2SA+RnN6cgNq0jXRT4CzpxnmFIos=@vger.kernel.org
X-Gm-Message-State: AFuF++kZsiNTQau0mKyf/UzDLzKrcMO/zQmmna6t3d8DwjRUwlM3akr8
	sXYBG8DOWeaTArItzXQZZCqIh9Agt0Lu19XV/Si2EyciaGNxGJ0+IPqbZyhLgYxZfA==
X-Gm-Gg: AYBFou33FjY8gkUTGJ2zOye1cFVA+GOH8skpGkMR+nybSRcuLIjZXgCqvJkhyqCwV3a
	wJz+A0BzFehwE8ZVtsFy/oBnOvqV1yXSqD5+hKJhA7ZI3LlclShsPhAXdv2fbQe5h/9gJjP34c2
	Z+I4LB0k5b9XMJoFagTPpIzZeYshGeidUswUXrRVIYcIk4WD5AAGRguyHU+i+LWJEWyIRyREm4E
	KWmqr73axe/anDBrKEJZVARnj/5KPneT8nD8fCBVHoFVR/bA7peHz+FrmpyPQOrdD5Y61alDZfg
	ece4IunPNJcyaRliSm6hYwBJcMvDjZynLqAnb0jj1jYGkjzIDE4cs9Ci4jqmZmOy/xeMNK4VHbK
	LQ9CI34Te48w7cgbgwnQUGBAi6WgVTCjMR0/uf6p7i/vk9CkQmoO5c0has3hgZ4i/UDSAuWEyGD
	6ttVrydXwv5ADMimjzKAcHByqFHxI0yGrdtngWcpcyqC+ufS6mR2sOtu48KcD+Poy7wV8aw1ePx
	zbDCkznExLfHXGnnXT2/X04Qmy7fj3kVU7xB1W3oIYjLr/svFI45S7W2LhBnZ8IxBk8uaLHA7Zu
	387ptvaIPPJMwEA=
X-Received: by 2002:a17:902:cf05:b0:2c9:bd54:cf with SMTP id d9443c01a7336-2d95208bd60mr1394265ad.4.1788204420447;
        Mon, 31 Aug 2026 12:27:00 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:ed0b:e40b:2b08:1810] ([2a00:79e0:2eb4:9:ed0b:e40b:2b08:1810])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm1130653a91.16.2026.08.31.12.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:26:59 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:26:58 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
    William Roche <william.roche@oracle.com>, Jiaqi Yan <jiaqiyan@google.com>, 
    linmiaohe@huawei.com, ljs@kernel.org, ziy@nvidia.com, osalvador@kernel.org, 
    harry.yoo@oracle.com, willy@infradead.org, osalvador@suse.de, 
    jackmanb@google.com, hannes@cmpxchg.org, nao.horiguchi@gmail.com, 
    tony.luck@intel.com, wangkefeng.wang@huawei.com, jane.chu@oracle.com, 
    akpm@linux-foundation.org, muchun.song@linux.dev, liam@infradead.org, 
    duenwen@google.com, jthoughton@google.com, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
    surenb@google.com, mhocko@suse.com, boudewijn@delta-utec.com
Subject: Re: Linux MM Alignment Session on hwpoison (was: Re: [PATCH v6 0/5]
 Only free healthy pages in high-order has_hwpoisoned folio)
In-Reply-To: <8f023b9f-53d0-0eb8-6f75-65957761cf40@google.com>
Message-ID: <1bd6206f-fa12-9195-7b57-f8c24e235176@google.com>
References: <20260705180714.3708947-1-jiaqiyan@google.com> <85cb7ea8-8116-4092-8310-69b61eb8602c@kernel.org> <ee6bcc74-0846-43f2-bcca-b1bedff74351@oracle.com> <1dea7b3c-7740-474d-b9d4-cd2baf47f181@kernel.org> <168ad406-f6b5-4623-adac-9f894e410e48@kernel.org>
 <8f787434-5326-4a8f-92d0-467e817a23b4@kernel.org> <8f023b9f-53d0-0eb8-6f75-65957761cf40@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Aug 2026, David Rientjes wrote:

> Following up on this thread and the suggestion from Matthew (thank you!), 
> I think it would be useful to have a hwpoison requirements and roadmap 
> discussion on how its support is currently integrated into the core MM, 
> get an understanding of what the areas to improve are, and get a sense of 
> future work in this area that people are planning.
> 
> This particular patch series is addressing an area of interest to Google, 
> but it's also quite clear from the thread that there are multiple areas to 
> improve for hwpoison in the core MM and it wouldn't hurt to get more 
> insight into what dependencies users have on it.
> 
> I'd propose this for discussion in one of our upcoming Linux MM Alignment 
> Sessions: Wednesday, September 16 9-10am PDT (UTC-7).
> 
> No specific agenda other than to gather core MM developers with hwpoison 
> developers and discuss:
>  - where validation should live, esp with regard to the page allocator, or
>    strict invariants in the page allocator
>    + implications for the fastpath
>  - handling for folios of arbitary orders
>  - handling partial folio poisoning and split failures
>  - race conditions between memory_failure() and concurrent
>    alloc/free/compaction
>  - soft offline for pages in the pcp lists
> 
> We might even want to be bold and discuss a holistic design overhaul if 
> it's warranted.
> 
> I'll invite those on this email thread and anybody else is welcome to 
> attend as well, the announcement email goes out two days ahead of time to 
> linux-mm@kvack.org.
> 
> If the time just doesn't work for somebody who needs to attend, please 
> reach out to me separately and we can discuss other times.
> 

Due to a couple of conflicts that people have, we'll suggest doing this at 
a special time: Wednesday, September 23 9-10am PDT (UTC-7).

Please email me privately if you're essential for the dicussion and can't 
make this time.  Thank you!
