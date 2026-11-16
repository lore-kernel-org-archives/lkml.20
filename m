Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849762;
	b=cfOeRnmtT9XTzOJfdyKzkveBrE95GpKzuYjnXvAxoxpckgCCVIccdFh+Kfiw3xLqcL6R
	 hRb4HaPwWG1Sx4ZlkWireN6T7rqnIRDqK/4dO/VYULVFfKFljkdbkOvzvtQOa8Y7kSBIf
	 ddT3XeG7Tm/ydCg7OrDtgRrbc5dTRDi7W+ewbyTzYuhPsd3MBR66T6m/lN+X74YpVb+eD
	 mH2zuoFZ9KaI1lrPGzyHvRzwm71qLQVPhusqWRx+VpKYbgdvuAHU+aNLQIEYsy10rWP9V
	 ByfYw5cYKy+CIC0GBXj0/0Ejf7qXr9XPbMd7BtE6iEyK246IfyItot+G+NOPc8OwGCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lmlBXemGnXzGbNAEKUaRqB2tKtWoTT/lBmI1Jxehu0Q=;
	b=pKk/7CG1z744mZvQ4Jv0r5rnMubE8PA4EcHCdyWW4l49p5h/nkjFlAQUaaO/T//iH51e
	 mJZcqKpd92bGBl/33lC2knVq7jQzZ0bzdHQXGx5+xoegw1kqQbBg9NxGGR4Ufos5bnfS5
	 SmDW0EogX+6jN0SPWIM4Va/MhhSddmQ9xKdBSRpBzldBG+XbiDrQvAsxo4Mg6s8a4gSsH
	 oeiuXS4prJeekERC0k9ZRZ3Zl6vmw9OQFHCG/z+SWwBw6HZqLQxQgYuEZIJmNJmhn6T5A
	 0PI0dH2akX/MNn1jRSQSET4GZa15dER0hlPTtVsrtgtvopIBAzjJpblXWAvHvBWBHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YueMNJ/8";
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C64606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C64606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YueMNJ/8
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df7f544919so2790658eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849761; x=1795454561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmlBXemGnXzGbNAEKUaRqB2tKtWoTT/lBmI1Jxehu0Q=;
        b=YueMNJ/8q1IEUA2sIlTOfIykHB5yg7JuOA9aNgmv7vfGPjLJeTvE6IPGutSl8VPNe3
         aDwcKbDn/hzv1f2BRZBJY/tEMIFV/B4lIKKNNlO91a7nVNCY98xaDrD6UKaKQwm2XLw4
         ZZOeKhRqwPaST4JHnrq3HVhmZ4iLzDyzsRaEXqoAjLr9uEnqiiwuFKuwse5xg1i0TQal
         SnpSAVSi74wHw23tE5K3Nawsfu5ax7amPfZXcal2MwiEscY7ekXKgcH9T8fkudVzVhLq
         3F4pQR6jjq5h6fDaaQZnxg0SKNJc2YwRurK62te/T1yzbCbOPrMytfyX4uhKjysrpaTs
         KcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849761; x=1795454561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lmlBXemGnXzGbNAEKUaRqB2tKtWoTT/lBmI1Jxehu0Q=;
        b=t7rtKB29yN+tiumzeab/GMdlNdc4HqrFjuDRxwRFdFpyYgiOOwmdM8hLzwpq7Hm4wB
         Lgsvdc01wGOXlj/h5p5x+g0W6vNlEUK3M+Cs+aOSEBlAtj5fyen8X8vxiDv5Iw27kad8
         SLLOyOYov6dITZuD9qx/QjcOYbmvhVu+YhgxuCgdiEElXb33WOoYHrA2gNCZrjdwXCnr
         gi3EvsKcm2HOnk+VoQoDCFXRp4KRMj0oNxGRwqq2eWiSifRgK9gCJkkCTN1oGmxsjSn6
         XAvhzVQwYHgVaNsA4XNtnDWYqhg6uOzz4lqXsBSumeW4zk073HaM/j3uOHSvx0GRe1+9
         OlcQ==
X-Forwarded-Encrypted: i=1; AL+hErHU/GRpmvcxAbP7rU565ZBbfey3xPFE4cqc5b+v8ll0+Erm15qKJrTazK7wM0k2rNv5TRW2N/wJlRCDulE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B2NPBp15EMf5gWTd8Lp/5qFIy1c6VDTuyhWK6Vk5uSCQvHmPa
	thRUIF5qRHKG+H1sPQp13v2XeMnnuqMy7eN96KSAs+PtKbqB7VFYf/uz
X-Gm-Gg: AYBFou2av0ogRQjC3KrGF2ERu7bJi0YeicoMbAijha0GuxSwZVqfVkzmk6PaeFN5GZb
	KD/PfJIC9l9ozaZA3rNnz2w4lCXOCHHO6Ch85MAtMqGZIz2Z1IC3PQ9Ec264n7MBHCrHHMJHl46
	jxynAbLCRAzVN3uDCxmZ44q8lCHseD+dglv2Uk+MQbh7QxAbBPSzWovogslhAmNA+AIr+oG8Olt
	CIJ/t1Aso+2sE7ArS20Ucoejx9KFDUMvF2AegEj9nwIcQuUZX5F/sFHCM1aR8itp7gvi57lp/SP
	uE3nUeksps/iMuDCVq/YPtWmUzF9xDYI3lpTHJ+6jSoswmsfb715cmhee2XtjH7LH9qNSFmI+mE
	NMuxJhp0PC0ojeuW+4vB6jYluXYAU2fX0P7QLOGCBYfKKbaI2KLccHuHMvn4GAhRfa39/OZWNC3
	Th/oG+ngR96YKeg4Sr88fj6usxjRG5UsMAnlU4rdJxvl0CqIKCVBcgvjC6dKqlyFHsdOmJIzBWJ
	vl69umzIM4TOmRzDjOUlstuBWAr8m+IcKd/Q/XC+3HqvWrOK0PTgfeswrZz9MyZ2JmHohXiPFZl
	HFNKVW9CzT0/ta57sfhjgUr81iDTndWzicOLfrWKr1JCfy75zD6C9d/8WElrPg==
X-Received: by 2002:a05:6820:a516:10b0:71a:fbe2:fca0 with SMTP id 006d021491bc7-71afbe2ffdfmr805254eaf.85.1794849760648;
        Mon, 16 Nov 2026 09:22:40 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:71::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4291ac1sm9184917eaf.3.2026.11.16.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:22:40 -0800 (PST)
Date: Mon, 16 Nov 2026 09:22:39 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH 3/3] mm/vmscan: consolidate promo vs. high watermark
 checks
Message-ID: <avs7i4CqGlEpA4wp@devbig011.atn3.facebook.com>
Mail-Followup-To: SJ Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261113235238.3595412-4-joshua.hahnjy@gmail.com>
 <20261114014917.86531-1-sj@kernel.org>
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
In-Reply-To: <20261114014917.86531-1-sj@kernel.org>

On Fri, Nov 13, 2026 at 05:49:17PM -0800, SJ Park wrote:
> On Fri, 13 Nov 2026 15:52:36 -0800 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> 
> > There are three sites which all check the watermark that kswapd reclaims
> > zones up to, which is the promo watermark when NUMA balancing memory
> > tiering is enabled, and the high watermark otherwise.
> > 
> > Consolidate the patern into a helper function. While at it, remove the
> 
> Nit of nit.  s/patern/pattern/ ?

Thanks for your review on the series, SJ! And yes, thank you for the
catch, totally missed that : -) 

Andrew / David -- could you help me to fix this in the commit message?
I'd be happy to send a new version as well, whichever you prefer!

Thanks! Have a great day SJ,
Joshua

> > include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
> > dependency on sysctl_numa_balancing_mode has been abstracted into
> > vmscan code.
> > 
> > No functional changes intended.
> 
> Looks good to me.
> 
> > 
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> 
> 
> Thanks,
> SJ
> 
> [...]
