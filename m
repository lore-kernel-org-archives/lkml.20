Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AAC1A3A80
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804860; cv=none; b=dQT92gFn0XHtd1ON3ckLbHuzB0ZyO3lfOYeZHHVHJ7oO0Wd/mbeKAhjoFsNWkFYDa7WMBplHNoSyZXirUdXnyJX0TubkdDIbqSbI6NUwoEQmhM3Yvlcxx3p73qPSiKmX21ffKesyYQwWD3v7c5ureswNl658ZXbyFUSbBEYcCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804860; c=relaxed/simple;
	bh=Vld0YZFMQv2DScUht5PLSH+ObPRiMoUbQEi+3IeApQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhb2EJCWMzfqxtjtfZuUtMYdgGLfjIMVweXDSbYGJVC+SDqjecHmixzwdmzDxQkKC/pyAOi+xOpSKWbzwelH56v+nxdBDpOqs+p6MrswDRVvTMbQA8elye9xBvgyoft+C51uHLcL9m4TqxWk6fr9C29RczWiFjezzILGkxUvF1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O455z1O1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O455z1O1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso12741615e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789804857; x=1790409657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KAQVumWq+31x1qLZdih23QpZgQOdhcS6BODfuZt06y4=;
        b=O455z1O12Bk1xP+3hjQGv7x/ZuUD2q1oKUQtpthdNCD0JJOSgP/QNzobsFHS+wdy9I
         Gm1EoG9duaLPzdLBm/SI+xCyoe93pVtO31UFCR4qJRhTYqcvLZxIR2Z9gS5qU4d13Oij
         +6xhx4jEnRYv1VxeYw2wGbYIL4aWFU1zcLTXRJuyin1k8vZLE3C8FX0+AQsU5LhJ13G2
         y2iw6JzYrl0L4qxWQX575RypgwumulrjOmFEk9o7Tua4jsLP3ACaPvyPxiRrZ+s4LAGp
         wYUnCxmbBIXol+qoQH+1olFjo5ykZh46wL8g9pqLNNMtd9teLB4VBqmQ6cuMcbHcJgD+
         SNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789804857; x=1790409657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAQVumWq+31x1qLZdih23QpZgQOdhcS6BODfuZt06y4=;
        b=GmkMEq5plsnS/rfgZmMZMBi2+dHIF0RORBX1mhXK+32CQ9cMuJoTnxJUO3N5arXV+P
         wpSoCAh1VB1ao5Ko8+UjHqmbtFQ9JqRfw/0YzUvQTyhdPBJNs9m5uHcczk9D9sXWvMWL
         L+Lf5KQTuZtq13H/6m+you2X5cLRRM33TF5A8lOuxvMgf+H6IO0cSVlYs89tgbqQ4iu7
         moRCTYtb7/zL7llCV/qlBqXwS7oGsh18ZVkiKjwVfc+JmIKN8jwLOz1BXdOJylGVCGWL
         xmyxH9ZEnxhOrrLKLTRU+54Cj4TR3wSSv+F/Vk8kQUFtR8I7xFEYIgA7kPTSQVUV01pi
         uf3w==
X-Forwarded-Encrypted: i=1; AKwUvByUKW3sTU1847wAecaJzhIw8Fr93wXgs3lX9cojf2G5lP7102RJyyDUcmnGtB6Hm6AmlHadXoH1sd6RiuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nLQs7bO0an2jmlzpgDWgUfvi010hCsoogdaAnJH5HmqYtko4Jp
	okxP5wAC2/MoU/VEK7xTlkN0zUesfBZv6BPAmTbRo8bQd74+sUgtHIgwpbCyNgkb
X-Gm-Gg: AYBFou3IHhBMGYuDOilGkiaOiLb4X3SUY49w/tZD5uyraVQmbAnS4JzzzzVFil65bn4
	LxmfNFEGtzdYCCqvsPoEb2da7o3AuE8R9JwJbEfIX5+wWwVJ4a2zQAWdMehiN44Rxi7CUA05jCz
	wSEssmjV4hiCHgJ4rSI15eW732ybUqXRVN/EHxxEFKgzav1JDkTVcY/QaABHL/v0aIuq1GVPOy6
	yWUc2X3X4SHn6xgGwUGItowvkgfkpqYL9HPfm8O/ZjxpZwfUhQF5H/08rcHAUBSGaI7+FhXR3Lg
	/vuu+QEznL69AdRZehhbZecGA3rvQ+xJCj9qePOZ0dZ6axJdc2M6hc4PLicSBYcwN7t4xhUlFaI
	3uFMI0Wqtc1HoFudxkLxWjGBwxfEUcO+oePiKfpii1yo7HFIEPDNaZnuwOCoz3ijvRClOwxQX59
	R3T6M/P+FwUAMes1XXHpgomQd6XITomBPqRwjSHnSgSzAKKZRa0nPKkz85q8WvkGL99jzQ9TugT
	3WcT3e7uAjGc8HOoL+js4adthjQWdoTc5pktXXM3+mzq71a85WTj2FiRFpC81lEzVYugo7eJljy
	DVizH6+mYIXWmOCl9g+hurlLh24jfHSqhZvYcIIGqiRFBc5CeYLAWLMza5kKLvyh3qcIyXTP3Lg
	Ne9h6VUVA8A==
X-Received: by 2002:a05:600c:6212:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49fc56f8327mr55591515e9.15.1789804856813;
        Sat, 19 Sep 2026 01:00:56 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd103325sm64149215e9.9.2026.09.19.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:00:56 -0700 (PDT)
Date: Sat, 19 Sep 2026 10:00:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, 
	Bradley Morgan <include@grrlz.net>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kcov: report the first spurious PC in the interrupt
 selftest
Message-ID: <aq44VWaVBpRvWtmF@gmail.com>
References: <20260724192122.73080-1-kmehltretter@gmail.com>
 <CAG_fn=VTpkAUHUqWgcqigQ8UaLDtikZJmOE-VozemA+RbyJVnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG_fn=VTpkAUHUqWgcqigQ8UaLDtikZJmOE-VozemA+RbyJVnw@mail.gmail.com>

On Mon, Sep 14, 2026 at 12:21:38PM +0100, Alexander Potapenko wrote:
> What do you think of increasing the buffer size to, say, 16 elements?
> This way we'll be able to detect more than one spurious coverage event
> without needing to rebuild the kernel.

Good idea. v3 uses 16 elements, the count plus up to 15 PCs, and no
longer stops at the first PC: KCOV stays enabled for the full 300 ms,
then is disabled. If any PCs were recorded, it prints them all and
panics.

> > +       if (selftest_area[0]) {
> > +               ip = decanonicalize_ip(selftest_area[1]);
> > +               pr_err("spurious coverage detected during interrupt selftest: %pS\n",
> 
> Nit: should this be %pB?

Agreed. KCOV records return addresses, so %pB handles function-boundary
cases. I'll also change the trailer to the new Assisted-by: LLM.

Thanks for the review!

Karl
