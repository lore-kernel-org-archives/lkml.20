Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279B934B682
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358970; cv=none; b=lB4BXgjwvMMJoXemO8RYCOXkwnYA55yeRubNz6XO2JTECHDAXW5L6Wfh3wmoYzzyNFQaXFCs7TxJouRtbeZruMpTMQEtvZIWFcu1qjK2KabaSOmJfkAy4wY6W73mhr0EJwQ1QGk7mBzU/TS0opnRba0GyfhXgkZCpD/auuDtCHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358970; c=relaxed/simple;
	bh=kHWwMrEotM6IrRJpcqSUfyhD0sPiyKGP+EIxUzLpGxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B41MAIDrWn+hpXw3CH0FhXkLQh/ykt7Vfrl1zXI3eMZPBT3ObiWAnRb18gXJE/S0OCtuFOJBLRoTAkAy8n/nQ3cSGDisSdvzr8ZOQmuTdNGySmaLbEG+SNNKrBk7I56gH4sb29sfk1MIhlW7bBEjhBb2FI001UHDaOzTGXDVfR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQD6H3p0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQD6H3p0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d91ded8174so9562335ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358968; x=1788963768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhg4nFUTwBRfkzvOZ3lYhulq3dN/Jpsw7Gc9lSLlRQY=;
        b=hQD6H3p05owStewpsYUCUQJbLiWKw0N7/xUijdaG6eclJ0Kf/cJubrL/9sHNHCKYqH
         MrLMwOaWykpIypEuye/KkrSieplQno1MeIgcYczX7sHBVJ+KEHJxZ677e9qsnmUO0WTo
         Anb6oAf2fODJX/wOkRPY5DFXlExef2YguF+YnBxKdSjF2pGY3qugVLq44cL/wwC64Dx2
         VSgg7gKPEmww5g5rCv5A2qq33VTv0pU6z2IBlrYaGlETCGnxCCZGTLtKsA4jRpOtTHtW
         voeqZozoSpM/T7dwwkLQeJ67XKU+z7qVYwDne1H8CHbJdk6XeErCRhUJtteVxkbuSA8w
         P/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358968; x=1788963768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhg4nFUTwBRfkzvOZ3lYhulq3dN/Jpsw7Gc9lSLlRQY=;
        b=TltM9kaXUL/bNN9KGD9En6J27Eh/7YdD8uN/pMa6QErU/qFwm0RsNmuEqu/iu6LqXu
         gAUXpsKSxTKSjga3MBqNj7oN9WZe8c8keB3FIpJhkfVsG4lDgWCxUPgAdn1m7rlB1vlP
         dEF5IvIHNW/MsxPDN3p880YesCmWoSE4Q0/X4mymXCW+XxNjIJ8DW4eIoF5cmOqSUz2m
         OSaKwDRF+Jy+Iq9xFkEZbmGrRxvzFILDHgViFX9q8qXyU432XZrMsPqMdU6yueJXoS3U
         NlH6NsdpOAHjPxgTfBXmSygzpV5MAY3KdKL1kGsIRMLzQ5Zg5ZjX+tiLwuun/Tf2Im9w
         ln9A==
X-Forwarded-Encrypted: i=1; AKwUvBy2Vbvp4iUxNtP+GemQAY0jmdPEfqqkRuT7bNlkpx/tqy+pJHJfvTpdUIn90LHNugYwlQx2EaVIfXToYjs=@vger.kernel.org
X-Gm-Message-State: AFuF++l9mjzpG5/zbqxi/oEES4NPpSuFAYoXcXm/iOc1DFMrgE93IbQI
	TTWITiG03ctLXA+7rxvE9h+LsoJDkD7CfsSiulYLp+oI33f4Z5sduawn
X-Gm-Gg: AR+sD13INSjo6WwpAU8HfC77pubx56NnJn47R/FTRWr6d9b6Eo9lwYzAWpB+u+FOTEu
	lq+48x6qOhsnpYP0ZcXWnhIyZFXkZHosBJ0DonxozukVx9At6ke25fHKXOMcROwcEPjpKgiNosT
	qLBBavYqa9eRgXf5r0KPPOiAg58emhQtJTt6fitq3k8x+PZ0kmGr3oYJ2uvACz6tG5WzIE5gCoZ
	0auVBORwYW5Mvap/h457dvis2GG4/qV0ChnRKlvK/kifcaqzUesTS+o1/WREjQ7qQkWKRvaFvLm
	wFGBgAP/NzM1dHV0BGrp6frP6OWzEWBvXsxOo0+dxWRQ9leVr2PObjyFD1HlhpqEnzE9E/VY1tA
	ac4DgIL+89NXHW+EkOd287OkIMh090+wSFtARVmyA7Pk+QpkOGcTPrLlaWj2tOHnDMHeQXqaXp4
	fxglt1vzPffFAuVS+QanN2CNvtAbySfrYOw4XRhrjxd6kVapMuNUUNgMRvHtLwekiIYuyyX/AW2
	6Jw5c3L/h9vw1BF
X-Received: by 2002:a17:902:d491:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2daec74e5e3mr70183145ad.15.1788358968023;
        Wed, 02 Sep 2026 07:22:48 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd383b36sm13853485ad.25.2026.09.02.07.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:22:47 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2.1] mm/damon/core: fix false positive in damos_quota_is_full() when esz is zero
Date: Wed,  2 Sep 2026 22:22:31 +0800
Message-ID: <20260902142254.5328-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902141001.86733-1-sj@kernel.org>
References: <20260902141001.86733-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 07:10:00 -0700 SJ Park <sj@kernel.org> wrote:

> On Wed,  2 Sep 2026 16:44:45 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > When setting goal_tuner to 'temporal', if the goal is achieved,
> > quota->esz_bp will be set to zero.  In this case, damos_quota_is_full()
> > will always return true, even if no regions have been tried to apply at
> > all.  This causes qt_exceeds to increase unexpectedly.
> 
> To me, this looks logically correct.  Could this cause any user issue?

Yes, I think this might cause unnecessary confusion for users, at least
it did for me.

I set quota_ms to 0 and set the target_metric for the quota goal to
user_input (i.e., MemAvailable).  In my use case, this caused
esz_bp to be 0 most of the time.  Also, because the quota->ms clamp
was missing, esz wasn’t set to min_region_sz, it was actually set to
0.

As a result, nr_tried is 0 (because damos_quota_is_full() in
damon_do_apply_scheme() always returns true), but qt_exceeds
increments once per second (likely because reset_interval_ms defaults
to 1000ms / 1s).

Best regards,
Rui Yan
