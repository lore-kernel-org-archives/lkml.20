Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02372C21EE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830385; cv=none; b=KuSH83xeSbi+Q935NBfYxyZ5KnhjuGnqwFhPxEeCmI2ZubGni07F6vJeHm8U71I/PAvpvxo5gD1w4eBKrBs5sV5jtaPO4YripLFeyDhInKw1BLT53X8kkoK3evR7XnlBgZo6LRZnpc5+v2YAuIwKpXKb6ULmsWVkcwgbHXDWQ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830385; c=relaxed/simple;
	bh=PK/rwgSf0AY+1TSx4wx+jvG6IFsaQdqkhts9XFU40Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHLmeGDjFE4Psu/XCSx4jv20I6oBiamM4XfU0Rtc8IPYEZu08CuEaOJr6SIAevGH4M89StcASmWrQgFSpg5lE70Um0yu713CKu5yggGbAmKNEcTSfuhk1ChIPCXfHufEZp+49lTnmPAKbWxfPUI8Qhhg48VQGGNehW7gEFi0FQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3SVJ9vI; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3SVJ9vI"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a451915d8aso3747374b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788830376; x=1789435176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4iTZNJwexeZeeHQj3UOdA9eylxa0Qsx4P1q2zIlRJc=;
        b=B3SVJ9vIyJ/sVE6cMpLMoTP1/S14xbJeD80WguTchJqSs7luafbHUJyszbCZMXVvt8
         7WNfkW600Dc+FMOiPRpU4ubbYnXmkAWP7f4fgBJ0n40RZLInsXf59mi2GcpVvqGfhVQf
         Alc0aZnH1vbA1p35tWgcoL5Oxbqj8ZFgDJGgWwPHGyJ2PK92nTbcJRGqcHFUFrEazCnC
         R9FWxJLGdK3HCTpbfZ8y3Tw26K9WDbmmykFD7RFfQuSENZeqNAP2SrI5Wr6HDLtyq1HO
         i5cMztIRhQfNj/heKkRTuDwCsCy1051T5hXvXUjwlwmLius7yuboqS20Js7udaymjpC0
         TWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830376; x=1789435176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4iTZNJwexeZeeHQj3UOdA9eylxa0Qsx4P1q2zIlRJc=;
        b=OGh60XVynHXPOZTxxWyCX/HU3wz2TTXsmnm96W7lQ1NAzxmYLOVdCe5gCQVipY/PEj
         sPZzMrDFNb7bIsE9GMhil9rb5jbyBJlG6ovt4qbprxTsAdxPDypiQcTzBt5nOyPyiebG
         57fnW4necVVPLtombDboDC9LRgfzZWJn7+jHmz3Ge3xk44Fa51dMeaoIhyCJnXCciNlo
         9vLKwnNx2VsAaDOGvEhwVM9NSbWJZNA+1HunE88F5MqANtjsjTeujAd8vXT64Ef6mDeL
         GBNEsBTVslyJNkc/pc1b7a3I/5U8b8bOtZ+nvOnrQtY+WKifsnQK/MH36HbcTPquNZze
         1kKA==
X-Forwarded-Encrypted: i=1; AKwUvBwOEQMN4S40TQxRjQ6h6fxQfOj1B+Dpr9UkApQB2nN7/c/1fFOtviyA7pmVJNIowtE04cixgu3nYjcDapc=@vger.kernel.org
X-Gm-Message-State: AFuF++lcBPs0sNb6lNzSjd3YhnemIMhcQ12hXZNM0R9PS0p2L1U73mK6
	fKxmSnbxiSZ6FaAmfMHmoxtU6s3JX/RV4tnwTWpe6XquS9xdRIMs7s2Z
X-Gm-Gg: AYBFou04OWphHLaq9QKEEc8tjQT7SrECDqK+JFVxEJQaUwM+fjeWat39o5jyYYT7Joo
	W+9swLSJccMbBI8lkvjHngoUk0AzR10DZnGk7CN/Pu4fVyzNb4eqmJowqo8mOKIugovgJ4v3Ns3
	f0FJM3mrMBGYB6ztacbn+rjDB2H3ioxogbBLwSJ59jevSR7cYBrs3IVXDyImoVqT5H5ZgkkrqRg
	awmTQD85AVu1FLWoIz3IqdDF7KyE624mKNbmaIvcL+zT86kWIG3+H6DmG8LCvmpCgikjn1U91gM
	XCbflHWwK3Q7nW9CbpUG9jbNBvKcUIr+IC9PN611+y4f19/4CorTViVY6WRRtQxOfQmdCu9VRIk
	Aj7ik8UpELjQu+B6wjrtgQGaHMoJ303M0hpKNnm1jLy2DnBCtukCi7xNnWgJAZHE+GKOnzc1n6M
	6GFnYf8bJHsuoYBfL3zEZg+L6UAMdyMR8f4tEF4iz7okh2lsP3R5LFN8gK9C+9GYnrzrGdDs59V
	qi4nvy++8LjScBXLw==
X-Received: by 2002:a05:6820:168f:b0:6b7:83c5:fdef with SMTP id 006d021491bc7-6b783c66750mr12147449eaf.48.1788830376431;
        Mon, 07 Sep 2026 18:19:36 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dea11aeasm14793941eaf.14.2026.09.07.18.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:35 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	dev@lankhorst.se,
	mripard@kernel.org,
	nat@pixelcluster.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	osalvador@suse.de,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel-team@meta.com
Subject: Re: [PATCH v5 5/7] mm/page_counter: introduce an asynchronous drainer
Date: Mon,  7 Sep 2026 18:19:34 -0700
Message-ID: <20260908011934.1737458-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ap9HiQv7_9cyIe2e@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 7 Sep 2026 16:25:31 -0700 Shakeel Butt <shakeel.butt@linux.dev> wrote:

Hi Shakeel,

Thanks for your review on the series!

> On Mon, Aug 31, 2026 at 09:37:49AM -0700, Joshua Hahn wrote:
> > The existing percpu memcg stock drainer schedules a stock drain worker
> > per-cpu, one for every CPU containing the target memcg's stock.
> 
> But you are introducing remote draining. Why do you need async drainer at all?
> Just always drain synchronously.

I was trying to match parity with the existing code as much as possible.
But I see now that this series is a bit complicated because I'm trying
to do two things at once and mixing up the page_counter migration
and the scalable draining together.

In the next version I'll keep parity and only migrate to page_counter
and in a follow-up I'll address the drainers separately.

Thanks again!
Joshua
