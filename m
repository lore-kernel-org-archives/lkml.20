Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C1510F2
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677028; cv=none; b=duJJaI/zVXD7tAKmNNoAUxTijvuI3/mNM+fOsqFT648e0qEdMXTkiXAH7iafc1dMoYatoS2xPP1ljMWxWEyqHesPxv0YrrLoLJ8A+yjGDKz0ZzD2SHFNnFcuXY2hXr9uzH+lyM7CHs4sQpehKMC2Tqtt0nhT3SzdeSwxnx5Lctk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677028; c=relaxed/simple;
	bh=UcgDT3FMEdJhmQfMSACeCceXHPSHR+l37gsF8j7bF+k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U6xSySfkR6OlcbMLsvHNOD/jIU3pUY+nCsK3idR+iRttZ1jKIKhWSi30J+Kx+JcrEd01WydqBM75sGQfF2sd5mHS+gP1siAiYLe8ytzlPlRx15sKK3474aompCBtMi+zQvBBAmuwGkL6roSNE2Fxn7iCa4AoL0p9VPEbhwxVTnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=dKSg7pnR; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="dKSg7pnR"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd1e069cb19so520021a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1791677024; x=1792281824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=objlwlXqLfhn7bnwkYZYoUou5W7yYJ4uvUiF5eB54LY=;
        b=dKSg7pnRdoUt6ybhVYVkp51VG06KAtMcaJONLOV1FrM5zUxgyVR9RjFUbAvazWSw8Z
         LRab3Ie9/68Vs5DxxU14Y7w5ZDqcpBlXr75szgfkpIVocxfRAlfpc/BY0KEPlMbVR1go
         9gESwEvJKrMRugqJ20X63ACAeCDltXVAZcbxw8Rb1ji4Q1sNYaTKpzokK8WEwwMLQzVF
         /cOAupQf9ECcXogCSVyXsoKyGWC2J3PsCH0o3hUHwumIW/edW76VMpLLcNK8GjMqFYdw
         qGzVCCmOXfSVa7Cp0Qh8vhxZRjSsW5lBImXr3nrDWEluG0cdV9SF5rOE+jUoonq8mE1R
         Jq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677024; x=1792281824;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=objlwlXqLfhn7bnwkYZYoUou5W7yYJ4uvUiF5eB54LY=;
        b=u1HbBZSZ57LZcB0I1IZczfjK6kz21grrtm0pvWSKs40OXZT+6ugVEq291BGEmrDQOQ
         CD/eiwqA4Q5x9pnnJi6NYklTwBe0rjEi0KWaWupsM4IftXgk2vZkwRXd6J5Fxn86+9XZ
         QNcvbNCDrXUcbWUoRSNnMMTugAOQs9Nme51DRbubdsCZLRAglVYmINVKsaQtQ1x6kpNE
         d9wxl05tDrTD+JTMtUgGHtPz21lM/S7uKjmU6Yrxm3g9Qg1KMhaLVzl/+YG3XqOAn9U/
         PLWHEUTBK24MvnkrcCNTuFENWTRkmXPjC8fWL65gf9amAyEjtchd+MSqyKpEggszCoRc
         BQRw==
X-Forwarded-Encrypted: i=1; AKwUvBy1YGmrFhVONTjgvvrhXAklSR6PWSP6UReajjxjgFEzupz3uDZf5hWmNNkIFsbkqjrB5IKoc6TJOYUsOAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkAXpMhIZ9DhXCOh+b6/itK5zc/j8B75aN7Oc7m+3uJT3FFFcf
	GqsfY/ep07fmlnRKHfeejQDYr5gzY9AnegaXlit5qtHSia7XQNARubbjXdTZakOezHg=
X-Gm-Gg: AYBFou04DEnn3rtGYHzXtQetosKRuBAfegPXjyhQ2InY7r4NwKT2/3cvfrck3rUiMcD
	KGjQEPF/fYChM932CVL+7ZIyltGtJAXMYa6+cYrBVAywzEowzz28Ju0Sxth7YfusG2G08Qm9WQp
	SWA88TMp8LstHWLqdqGvF6v4MhsptJtiYAX35uPy3F73G7ciKdN4xgWK16YGjh02ZvAnCXtZ84L
	MmSQkRzTtnHVCnzb+9Kj5HGA6835h4Gb2NXEeCBvIGOE+80zScOQAoeUYUxV7ZR1qqHah4AF+fY
	x1Cel/4TBZLjIYk+y8IgfRSPI/XoLDMcTyTyz2vZGFOi6zGdLxTWjr3jHEhjAtcbbYe9Y6BbiX4
	iXtkdkOOWzY8I8QrOBEZfjj02o+GunwXWTKFqOYpoh3bdoJ9/bu0XehLCtD/5oqJZg2m3QUPs/X
	uv+VPc+gjIp5z/EGW8NVtx5iNsXXNvA4CL/Uq1ig9EvaVhbMAfTKCWFII5Z3Y84qBxcwmSTWJxW
	OkSSiKJLDKuuwL/9mmPGlZv8nQRz3moeLNM8eB2
X-Received: by 2002:a17:90b:1dd0:b0:3ab:1ad0:db41 with SMTP id 98e67ed59e1d1-3ab3a9a4f3bmr5100943a91.62.1791677024091;
        Sat, 10 Oct 2026 17:03:44 -0700 (PDT)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm9885524a91.13.2026.10.10.17.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:03:43 -0700 (PDT)
Date: Sat, 10 Oct 2026 17:03:41 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Bui Viet Dung <dungvn2345@gmail.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] net/sched: sch_netem: prevent packet length underflow
 with negative overhead
Message-ID: <20261010170341.251cf390@phoenix.local>
In-Reply-To: <20261008035656.330667-1-dungvn2345@gmail.com>
References: <20261008035656.330667-1-dungvn2345@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  8 Oct 2026 10:56:56 +0700
Bui Viet Dung <dungvn2345@gmail.com> wrote:

> packet_time_ns() calculates transmission time for netem rate shaping.
> It adds q->packet_overhead (signed 32-bit int) to len (unsigned
> 64-bit int).
> 
> When userspace configures a negative packet overhead (via
> TCA_NETEM_RATE packet_overhead attribute) and an enqueued packet's
> length is smaller than the absolute overhead, (s64)len +
> q->packet_overhead is negative. Because len is u64, the addition wraps
> into an astronomical value (~2^64 - 1). When multiplied by NSEC_PER_SEC
> and divided by q->rate, the calculated delay spans hours or days,
> causing enqueued packets to be frozen in the qdisc indefinitely and
> stalling transmission.
> 
> A similar underflow can occur in cell length calculation when
> (q->cell_size + q->cell_overhead) is non-positive.
> 
> Clamp the effective packet length to 0 if the overhead adjustment
> would underflow, and return 0 delay if effective cell length is
> non-positive, matching the behavior in sch_cake and sch_tbf.
> 
> Fixes: 7bc0f28c7a0c ("netem: rate extension")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bui Viet Dung <dungvn2345@gmail.com>
> ---

I would rather cover this corner case in two ways:
