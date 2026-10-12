Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DDB36D51D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811997; cv=none; b=RHI8Ox+/J0LsFLUdHg3KLGJWNG50Ry8o/ZvDWdgwoNb0UQUf6ukzO2I3f61uSBuTXoxHK80rfAAtubvEMLXqtNGhJW27rd09RDNqO0bYM28P7PUhCOhGnfi4qKHLcMDmC8sCu3M5VN9S7HVne/vIl+9+PSEuvsYSEwXO0LfRbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811997; c=relaxed/simple;
	bh=cHzl7FzJ5bKfvExuy7XSeAssV3YNifniwUfmFkaHd2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWRd0QmAG//TqQhI+va+zUg9vjTl6LiHVhS1pXhkS8gh4aPAZTySlhS2/NN+eg7HR75jssEPyrd77VKcwzf4Lo1I5+HhntwLm8G8HFy6QBi0edqgd0jPkLMrWOHAVAvlhLG4W4Cuym4wXQubB+H/YfDTc6OSNaSWcRTwD5Jwg28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=quO8M0Ld; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="quO8M0Ld"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e51d8d400so132743285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791811995; x=1792416795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yx58x2by4kjrlCwmqxXIEZOCdo8Oo9z3g4a/nl9RyYY=;
        b=quO8M0LdaQknRUdeL3gcv1tF/Rr2y7TghVC9nw1x4SQnCuSoKkf388XHoZxvr2lZBn
         ITga3kvcmSJriMKJZkIoBdDDImiZwGFB1RIieAFai2CpVJ80svkkO4INNlGU75pEAaDx
         pbmCOjj9I5Y3GypBHvkVnzWwNcetaJXwUelrHW3Clijnwi5Y0nJCxUg9ZhN36UbSd2cx
         Qxj+WW3EYt4n5VH4Fv4NFSvvMXJyZDFNrGPNTdCzovLibTdO2fbizZ6lzBViEj8xl945
         hpYPKDIXPYfzKo203sIUgB2e0nd7ojt1O2fJNVvgfWr16bcHYCKkLoCmMkpr8Z/22PLQ
         hZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811995; x=1792416795;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yx58x2by4kjrlCwmqxXIEZOCdo8Oo9z3g4a/nl9RyYY=;
        b=Q5P4O3Lrz1+6upUEgqqKi8OSMfiyjhKoEOJyBqf/MRD9hqQ/uAAi5+UPhSGfQ7sLIr
         HwuYQDw2F/VAWV6TdV+A5lT/heZ+HsKtHPDyG2eiy57SGwDgfGd2oyI66/I+mmhzRmkE
         wEejg8msW6UiFAbrMA+ShXlZvH8vO+V0ngdyUxknGBGyH6HV6Hze6iH75F3bRId4WZQj
         zOEpePf/MsrIbeNv2ugl52eabPc+OJrihWpInGB6f9aom4FeEb5Ums+0Q6anumLhyr7B
         wzTnwlh2kMHWl9bDZJfP7cSUCNnC9WJ3f0cixfeTHv+n1L64QpJE/1KOOs6FefPGzXtE
         OlOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWCsKwq8rhACu5sgIdl5YD4EEvXYxH7u0cFw7k6nwiEDXIaIzKOy59FnvRLIl1oCj45lrY7lwlZyAS+4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9Zr20RAaWcZuDmWCsIpFdz7ReCMzxkvtky41bsjdrCEuR3WFb
	I5F2OHQcbTpNlWQbvWYFnXib1u7Sg9rT5mgFPO7VBOaJ0u8lcvNX+RSZENvLsjsmIGU=
X-Gm-Gg: AYBFou0WUCfkKsLIQYSwknm1U5rzdN/snDoZW7Hj6MFz4Of6PQZUpK3+5gal9hTyOCc
	AHZXaJpATXFFm39u2bQsZt07lttjgzjPeP7S6o6mie+DHZIoe+ULjypAG7NU4EMtCrNJhPuqxKm
	aXLgTfChOtg070yRLMo4lJhBH2kB92Qaj4J3iz5ypK0pLMtt5TVPR7qTI73EwJOAMZD0Ehe99Us
	lLTtc3eqUwfgS51sUUgo7vNXY1spNrVkhtWk9m5D86ttL+7i8Bvyky45K4+oZadlObBq+Z8Pjte
	DJyEK7M3a/IBAAh15XcDfbR2jiOIReoymc69zsx3+X6kHmU+wLWLm7YbPP6aZCRd8Ygc30uBSu7
	Zc5uYGpeaYhEs2pZfVk1OmDTq2oGP8bdElHu2ROU2Elu1E/GYctjd9aVQkUjjAH53c/4umfnfNC
	XcCxS3LDJd4gtYvOwADISO1DLWG8XMIht4LQNqaBZgj8fyLXRPdlW2Z51nCxxmCN+WJGxRI+LcS
	aBUBxYerl4wEh25Ga37QsV7jRcQBWv3tBIkt+xvfQ3HDBV3ArmNxl8=
X-Received: by 2002:a05:620a:170d:b0:93e:653e:6981 with SMTP id af79cd13be357-93ebd0cbff2mr1628926385a.11.1791811994577;
        Mon, 12 Oct 2026 06:33:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98488aasm855431885a.7.2026.10.12.06.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:13 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:33:12 -0400
From: Gregory Price <gourry@gourry.net>
To: albin_yang@163.com
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	david@kernel.org, vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH] mm/madvise: add cond_resched() in THP branch of
 madvise_cold_or_pageout_pte_range()
Message-ID: <aszhdUV9M8RVZlx3@gourry-fedora-PF4VCD3F>
References: <20261010024042.4070048-1-albin_yang@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010024042.4070048-1-albin_yang@163.com>

On Sat, Oct 10, 2026 at 10:40:42AM +0800, albin_yang@163.com wrote:
> 
> During stress testing with stress-ng on a 256-CPU system, a softlockup
> was observed when madvise(MADV_COLD) was called on a 31GB memory region
> backed by transparent hugepages. The region contains 15935 THP PMD
> entries, and the softlockup was triggered after 14485 of them had been
> processed.
> 
...
> 
> Signed-off-by: Wei Yang <albinwyang@tencent.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

