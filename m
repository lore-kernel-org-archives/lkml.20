Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845623;
	b=oUdNW79b5UovR9h77B8UQFf/fT/+wTAnf8FIzDcMwkXmjyC0Hz2UqJwbk8SrmXwUAfbJ
	 BXpCV+Up3YSNN2luOJOFEhULBHEjD9CwBMi0Q9CC0t2G9SADdYo8rPMJJhG9vLklZMtnA
	 kX4jvz6ap90JYnJHziPHpV1LZ9t0+4jcXG0fLG1Qrc5Pwm4k33ErJVixRfX1VivXdLfpb
	 4XuUxoZeBwKpSL6Vss7lmcPxTYvhaWZ2r3pKlB1gu46ljcOUnBY9mACeMKHEmGvAl6R4K
	 VtYsj0rxuEvuThRJlebQZfI+XEVDsnYHb2P/tiVZ7zX6GKV5FJEoxncf95lrBs633pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=ZxHOUEDwJr8Ec59nGL6gXnjQrpofiX9HS0TRBVLwZm8=;
	b=b414bsKJ6f41CCmZQ9qtKbFdummXG2pgckx63yL1h+4KboMCoA0SIDQvD7jZqGH8wNK2
	 wnfdupzHwtc1ZBroc+H5qMgh6ElrdAN7lVyfo/EG3KDNaVDpJahFyQ1Hkaeh33XrmNIRI
	 kj+IRBfGXSeuh7BZ5kmUrCs+QD9RPVOVhgxDJFLtj456QcKYGKUNNf2p3QuOmMal7Hrab
	 WUq0hf+BMT0WTu0qaSFwGyUwze9r9WY4xKwPxX6Of5MY4vZx/dx1+CtmFv5jlateBrJtn
	 iGJSBBPf59AGTY4DCR0pSBjW9BmPidhCoU/E4+3DXkVU7Q3WVxoLKqkKPZR+vg0eR1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DfyLCbzv;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84690606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84690606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DfyLCbzv
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53644b28706so29472691cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794845622; x=1795450422; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZxHOUEDwJr8Ec59nGL6gXnjQrpofiX9HS0TRBVLwZm8=;
        b=DfyLCbzv97E8Hk1ejG7+FaD+1xL/uA/0hg5ayQHlJWr1PsZHS44gSfOgCfQB9U6h/z
         s/Hwfhv3gnVCvz/8vnnEwN/2zHeJpSnfMR7nbcXpYlzMU2Cb4Bqc1TgDV4esmkwnC2pV
         vHdJ6HEDYotF3Q+8IVJKE3NTwEqOUrQsvnX0eKdbg8d3V5soKfpN6IGm4Ug2l3ymu6KJ
         xyq3AgTy4XM8UU3LZRR+L1pyLINbLgGk/R8gqRZFwtd+49oCRL0A+KeGkJR8PSh0Rzi6
         jtbP4Loc8pcq/4xL1hv34RP9MdS/4tbBgNMQ3gsThS7p3n64LXZ8ZJ7QryxGdNrHwCVJ
         wYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845622; x=1795450422;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxHOUEDwJr8Ec59nGL6gXnjQrpofiX9HS0TRBVLwZm8=;
        b=QxbI7iVQVZlkBd/8INsG19dYGa9WW/HXnFnGxGLz7V9FimcN1shXi3n3XOgcWlzIvd
         IFufLF7ALyCmSKpeUXdMxqwp20arBTWZXsyO5N68Km+afdY4D1oylkKgTpOOSszKTApP
         jzx3PvcwsL39awgL9TKI/Pzl7ptsXm9fsceca8Otch94Ccctfrk7N1/FfKojCb1xNtIT
         /b08dL9yDNb1L87Hb1ngRLfeFVfcFNyElA9Y/TxMNU07T2NNOCuDxKL9k+NkjEzMBhUF
         ulxABKO/GWoHrljYg6nz9qaAbMDo7Jm+OZQ4D7SDnVbUn7FsNsMBNKrTnxDf1dTMVQOh
         BkzA==
X-Forwarded-Encrypted: i=1; AL+hErEwac0S09SODgmdFeqy8ewIIKZvw/8+CbatYP1Ue7wuL49/NMUbs9FGVpEmo8ynhuqnWOM13LDpoC9m0Qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5O1zpN1739xlonM8PmGtqhjHX+li8231bGr9KQ/SECxpxyslU
	zwVJhnFUMZKeeGrQgQtbs5MFNWTaBPYHWIFKddFocY1bHk+btBE3C2gCqfK5TiMkqlk=
X-Gm-Gg: AYBFou1Q5qjTlNLSpHZV6GwpTrC2jPWjrLJ8e0pSLrInirZKxGws3ezcXEa4MSFMqde
	pRhduTzG1oOmrl97lMfSbiAMj0IESGF7mNsgpnA0rAfsoWkaEKAMh+4hoIHO3/1Ch3cGGP+MYJD
	p1vwumYYEAmuHsyP63vWQEuZut5xfyxWF7EwXj1LGLaoKB7q5RkycPYLaQoY5znDSmamMsdpmgF
	B46U0YWzG++ybtteVHmcwVVYKQpJCfeLEBK8oZLRhz9ALFqqAkQKl7lKEOMcq6DyKL9xr7MhwsV
	UqvUKzOJ/1Fv2kW6Qa+0ZYWSzY4ucO73l2g9/nA3Q4S3SGym+0uTASzZbYN4QIYDTh80LNypT4u
	+69oVFG1Jz6kf2LnPtD5iTNlShsopkvgVW88b5vzbscqMVI5Kgbt3rJVkQ1DdJoyJEGbWLIVaHw
	tkw6vBxlSNp2UQQzeXscQ1iP1Fdtb/Ok+JXXSFT9ztQV5R/xSooNwXvIzK+cee0aJ2PHtOALy7Q
	73FHlEOmVbCWv6YZ52C+d4kGGns9mnEqF/f89Nl46klFFnu+f4eN8qZwtXOsqokD6c6LQCb0Gha
	3HjILIVlZLUJf5Sj3qfv4YVc6NxfzefrcazYyYTDm9gHlx7wBPYfOgP6a95fby2qi1YpxMcx9cp
	wUYuaTv+1j4444B7WQRu3+hkcQLhA
X-Received: by 2002:a05:622a:4d98:b0:55c:e8b1:3349 with SMTP id d75a77b69052e-55ce8b169c1mr107785991cf.25.1794845622539;
        Mon, 16 Nov 2026 08:13:42 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm868661285a.5.2026.11.16.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:13:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] mm/mempolicy: limit shared policy ranges per inode
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <76fc4555-b458-491b-ba2c-ec030879dafe@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
 <179467808112.482102.13365594235443107281.b4-reply@b4>
 <70740a32-92f5-4425-8676-68863f3e44c3@kernel.org>
 <179468794889.482102.14066028910704780583.b4-reply@b4>
 <76fc4555-b458-491b-ba2c-ec030879dafe@kernel.org>
Date: Mon, 16 Nov 2026 11:13:41 -0500
Message-Id: <179484562114.482102.7068121367282977254.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-15 17:40 +0100, David Hildenbrand (Arm) wrote:
> On 11/14/26 21:25, Gregory Price (Meta) wrote:
> > On 2026-11-14 21:16 +0100, David Hildenbrand (Arm) wrote:
> >> On 11/14/26 18:41, Gregory Price (Meta) wrote:
> >>>
> >>> Multi-task mappers were previously unlimited, but that seems like more
> >>> of a nasty unintended corner case - not a real feature.
> >>>
> >>> A single process is already limited on the number of vmas/policies based
> >>> on `max_map_count`, so it seems natural to just use max_map_count
> >>> directly, but I took a brief look at some distros and most seem to
> >>> ship a raised `max_map_count` (>1 million) by default).
> >>>
> >>> I tested that and even 1 million can cause a soft lockup.
> >>>
> >>> Not sure there's an easy solution here, we might have to rework the shm
> >>> policy locks.
> >>
> >> Do you know a single valid use case that's not solved by patch #1 and would
> >> trigger that many policies?
> >>
> >> Ai was not able to come up with anything for me.
> > 
> > Just want to make sure the bases are covered.
> > 
> 
> Yes, and I'd be very happy to learn about use cases.
> 
> Maybe we can let this stay in -next for a while before moving forward with this?
> 

Seems reasonable, although just kind of delaying the inevitable.

I suppose the mitigation for it causing issues is backporting an
increase to the default size.

Eh, if the concern here isn't a big deal, I'd just say ship it.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

