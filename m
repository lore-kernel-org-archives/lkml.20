Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117B37F32F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852638; cv=pass; b=M7y1E5QCGo7g4bNIXCUxgx5sZeTARDMW4aQCMfmhze/3hX6LLv46Ug/V/gsmUTqpwWAUmNlfMHgNJp930+EvWEn3cyQAFXz5sGFATc9UKTO8+c/2KAxUbgwAD4Yx2B+rLj5hW5iEGMvaKAzeXmK/ZjmaKD6g+ryz1V3l9/pe/VE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852638; c=relaxed/simple;
	bh=4i2SR7f2g7WojHVXlIh+MHMjOE6RNdaClrU3jFaCNYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpfQ202IsAMKSUNfyygvrIM23ZOVAOSF7Ez1UAsS9+uN18Ehz9x5837htKQydFN8wiRblEuE5hkPgYJ2DpswcalSlCRq6TTQ3me+J4Lx0mtkw0iIEkzkO3PrdrouGJ+q0+naMOCD2rmRo3W5AlmTf0JELyOpiEYbHvQrSxRqph8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4zakMqg; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4zakMqg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso17727266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852635; cv=none;
        d=google.com; s=arc-20260327;
        b=Dgp3kiPvy18JKR9Q0lba7/h/piLrwihPuhROCa0jEGGIoy1pezqgHdVHKjlO78wDre
         29kAncaUQQA2Y+SC5jREtgHzqO4z/sLGxgUQSKfpfnJQx5eMMdqvIiq2Nu/AktzqLOc8
         SVg2KAIotaC56aA5+hUGb+hZQj0URKIZAon64+0bCc13r+mNhPR2lIYjUSFPLYJ8Hl3Z
         ucm/oDYTJyda2ezTPIpdnXYX/U+KRcQkuUjlqyz+RKFZ4kV8ua1Ts3BnrKQxajEd4AKQ
         p1QVkw7Iv+TKvCgpPjsBnaACS4QtXkYxakfR0bjRZuQz/T/tp1lHNfr83CkhQzGoOwqJ
         Z6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4i2SR7f2g7WojHVXlIh+MHMjOE6RNdaClrU3jFaCNYs=;
        fh=QdriBt3fMccmdqmiJXJVEE2MKvb5wWIRb3dx0KZM60Q=;
        b=MoL1/Kd3YWcTcWBcnb4tOa9lXeHwSapfs0nz5+R0aDlgS49DpBozKtUBbOjQmwlMJH
         ttvp2c5U8D4jxT2TnEY5C1KD9uX608WEjFoYg0hTIAJOMP5ByP3wiwe44B3WG4xs+ryn
         Zshjw8A8VwiZxL4J9NUDw31wUqJRtC1EFB+Q6+QHEAPHZJrzqCQE++TFUTUsCVFE1Kba
         wbQK4ij1NF96PCRyCOElAQ/0beGfG6/nQICpJXkkwb6wfgikPKdWWVDuoCicYFOKl+qs
         XDtPwG31coTqnPbvMWxpOJP4xxKwzAltOyJALhRMTcwMq3mNWuRiMJxw0LIY7OpFwsIp
         HIag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787852635; x=1788457435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4i2SR7f2g7WojHVXlIh+MHMjOE6RNdaClrU3jFaCNYs=;
        b=q4zakMqgl5PWE3EhWYzU1PZX6tHjM/w1M+PZpfmT3nucVbCOEEB875t9ZQjnxnuPCn
         9qI17f6bHs8Qt0NSJ1kqgI86hxfRyeevCkJOTeKdOkYuzhaC9QoloXMnDHTKwmlPv/tH
         K+HV4ctDesBeVrJT5C4wDPDhOxAgsXExSnFgEvGaPS5CHAsrIqH8i4StsHShxjKN3ER3
         BYVwm1RuQWgL5w19NxjUMlDbJTX4gh8TQHTOrpG54WXIGLRqZo4iYhKfjJ4fm5097bVB
         i8/ks8oPqKNN/aHxEnRAwUlFqsCbA2l44tY4TftAAgmmV6BVRLFW2cgLpFURBflu+WKN
         zImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852635; x=1788457435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i2SR7f2g7WojHVXlIh+MHMjOE6RNdaClrU3jFaCNYs=;
        b=dXzo5y0fbplWSrIh8REmucclUWlBa1O81jP2XSShQIREeqR2T3uYdBBw6JoBZ8AK3h
         106C0ZqoAT7E/uvNDFQU0jUmir3TYI26aKBDIfh/X9qg2BgI5FqCdTgXsIaBD3VJRkwL
         XovmuMgK3DvDvrFnGM+Tj73QiSZhSLfqzh15oelwkbbX3u7g7zIFGxunmkx7GOh9+x9O
         wf8GeIa5KUyTIUw8O3ZgCYIuB7muqi4to1hfO/yfRV9M+NBfzFuitgGMvP8OGyrpBZpg
         B5tqI9YUV4PCWWEft4msqcC1Db6e2fDbwamC3wLslT2X/1xyAHijAVfpY8Oi3J2R+bfO
         1x6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqVOutuZb25Q26fo2cJwf5FRjd0Hrv4FRyMiJpDSOVjcQMpL0ZQy5OR4vOfHN82kIO2qC4ip2GSuaYtvwc=@vger.kernel.org
X-Gm-Message-State: AFuF++l4mT1Uac1sEs8Qic0sk4k5p4i1SDvJvpHfl2Dnym+dJh/PzC2+
	DCPvbtQ5ShcYxQV6MViMyFkAxAGbH6tO2wyyMACAmNQ9/p2nQBBLwSQk/P23zS4ct1JObuHFonc
	2dJIO8QdgdWxmPmzxietj4JUAw7+Q1VAdN1MXvSE=
X-Gm-Gg: AR+sD13JBIbti0EvjtqoQ8KK2UmpUr43sI0ofHFNgK1/uDr7Ns1L7Se23RjwDTcEeVr
	8Q03+kl0Nr4QiI3Ja/042da43OEeiAl5zkyImfFcbDGsH+MiLHrXWPHx+HK3JdZDRicTowWdFe/
	JJWfmX/JhqUU8dfDBNcM7KdeNtaDrvtrwMM6S+GP63fwbNOeQE/+yrURvm3hl+qZ2T1nLICNRnn
	+yUGFPdShE3XkF4ltwgSn8qgALUJa4rw+F+YxXwqIesOy95Br/ER9l3ATuOEmNxpZtsHMObaZ0r
	cy7CeQBTsMonM85nS2QHekx9yaLPNEozmB/d9tN3T+ttGxhmqfZTT1ePrVXUrhyzmS43v0Xl0ak
	d
X-Received: by 2002:a17:907:d0a:b0:c25:32b0:e56c with SMTP id
 a640c23a62f3a-c2556bc8abfmr42528766b.4.1787852635390; Thu, 27 Aug 2026
 10:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-12-9b43f5163238@tencent.com> <60908273-aeb8-41fe-b7d9-d35c80e950ca@kernel.org>
In-Reply-To: <60908273-aeb8-41fe-b7d9-d35c80e950ca@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:43:18 +0800
X-Gm-Features: AcwNN1Xii1DElQxgbinEAbRld_DdPsEeFSRZ1LYyW8zHIqr8BqfOJ4o6uENGKYY
Message-ID: <CAMgjq7BaJzPggVSt-F+7Xch+EkC3Lci249TOw9=Tes5+7nEZ7Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] mm/huge_memory: add kerneldoc for the split helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:45=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/20/26 20:55, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Document __folio_split_unmap_and_freeze() and
> > __folio_split_unmap_and_freeze_file(), and rename the file split
> > helper's definition to match its call site.
>
> We don't really write kerneldoc for internal helpers.
>
> If you need excessive documentation for internal helpers, it could be tha=
t the
> function semantics are not clear enough to be expressed by a descriptive
> function name + variable names.
>
> Sometimes taking a step back and questioning how the code could be rework=
ed to
> be more self-documenting helps.

Sure, I don't mind dropping these; they were added during mid-review.
