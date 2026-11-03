Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730474;
	b=y6kfB+2VyHExrGTxlQrpaWr8sbeb8SnFWWDTrXY0/RVUtVLbpEzSrLYZRGZdlFwb4zSc
	 SAbbVTsASN+3WHcUkwq5mjoDLfv7q4iE5d8PfVqY7yvX2NfCnYqSlfG/e8fM4hBK1Qgsd
	 FTNIQevsfyMvmlDC0zV0KhD3OGUhEYmYq39ippCWV5vMAMb3DaqGUyzaeUVI/P3VZjFFG
	 5C4T0/gQ0kbjhpEbyBqTIs1UCtHVsZ6GBgNSGvJaXLDliva+DJIH3CVwC9qAcQtc0gcae
	 oIQ+3SFCIQWs7XuqsuXyLTtqHg7WUNcbqwmS3bOyETJhW7ficdOP6SYMoGqbO43rKdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2mcfvA7HTlPKCM+/9sf/LvHh4ZPDiuqX0+xFv1eaGJc=;
	b=KDRwProsvQ4eD35/d2G321l2+SjU0pSU1P9sihhTX7HQfqNfZI4ysUmtMc8PkdiEkUmp
	 csevuqYwXiuKOsfPwJGHY1BGvyYBtE7VEOHVfiz4BpAIcQgEtoN/hsGy3SAl1MNmH+AbE
	 FljERuxrxXZInEITdYB3rwJ/NrCsTqU/Nal0P5YlT88FPhIFbVf2liRUMBwy7P3uhFBT0
	 vZdzLNFccmYhFh/qDX6S/MCoisy3cFhhp0+sy5+J3Phv3GpwtPshs5XBkfSr/eqcq2PD3
	 1CV1sbgXG552Cx1FcGDlz2pLBsbkmFrwADdkXBwOSLCmuf/HjpEmDENIotMS18okhQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Uczmp88r;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56787606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56787606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=Uczmp88r
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0dba37a7fso41939977b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793730472; x=1794335272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2mcfvA7HTlPKCM+/9sf/LvHh4ZPDiuqX0+xFv1eaGJc=;
        b=Uczmp88rFlq2l0y4jSm+T5rjvSIp8atOhr9cIV+wkLMj0GM23jW38GeFVUSR48cRLT
         aTqHzTLVCYOhaQUUxhXoB0HkTIslzRIHotLpoX+b5G7TpoTKqhqJeoN6pSP+JY4ArzA0
         7rN3F2yE7FgH70Yz4AmFh9Yq8Hq8wvogQI4WwWTAKON/HTEH0l5WirOAJUsizeKXwH6p
         cXGPsZz+gwfZha/2dUoqzeq+1rIFJZnT3LH6SY1LQ6kHOodjo2WnK/qGHMiZ9uzb/Xzu
         8wXneaV+EjxBpunPIyqy3OGcgibVKZ3tsnpS1e6T1p/d0DDGz3cOh36YbpXYrj2kmNQR
         JGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730472; x=1794335272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mcfvA7HTlPKCM+/9sf/LvHh4ZPDiuqX0+xFv1eaGJc=;
        b=xKKBppR5OkkBVxWs0/QEVsrBgPqSKgBkMfbxGdioJvuqJIlXpIcKVgNgHN1ZdSmFYu
         GSZ9+zwsREXC+phy3TF66dCiu5dOtDt3a4WzAVnkFruja0SYYD1RV6IqYYIfaNcfnQN9
         1lW4XqIysJHK6m9jUTAn9aKik2sUR4u6kNDVFuajifZCQFfJIw2HfwDmY63Ndl5AsuYo
         F65zBJyNQMDev4krxpAKg7tZ4A9n9nvgYoSw6fOCTJ62xZb6/iJJq9wruSS+RGkydEzU
         qPmHYUxYuKD2VkudlxesWDxenv8k1BU6Zde88KSsDBlKw78NH0IraJcRCsuoJY66p19B
         BU+w==
X-Forwarded-Encrypted: i=1; AKwUvByaZ4QT6kN4BO7GgTTNJk6rHnXwyMevRKerpzCdgc2T+P684P8htLY7wghhxbyWyjm/BLXjPxTdZfjWB8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z99L96Mkgu5/v4uY3StrS81LNMMR/tK9FEpkdpv7Q55BhbXjYfM
	Zmkj3KdqbqcJxIAI7RGCSimt3cnp4ruWY+dGgcGytA1xyiymLnGJDUMwofNIGkQeK/xo30MuRq+
	3SJKb
X-Gm-Gg: AYBFou2LRY6IIM5fOGA2vWgozcr6SI4FdG3MXrczVuMbV+qQhiid46uMSydzldNresm
	EL3NAiNR1COQ3l4PBsGZnbryve56wcVMn0ty7PYVQqzIWUbCfmBuK70FEexczV7ORSCA5n75h1g
	3btngP16S+GN2jXIcDc7WSV8PaTCwufvueTH7cVKEFKXXLEvevwVueMJkaoJV3oqfVz3adHpij/
	UEWGvfhERLAQBju0EQIwROULzP1enWTnkioZIWYA3DYV7LrlpKrybRcHGHzoUmwiXOVOcJgemKB
	5Lnz0wTdPqgyGJKWrcmhDn2TTtmbGknV/SuGUhxQ/UaT5b2JddKfbtNYC9QIyomuS4sWHAx/Oik
	DW13OgbACMm0He460YEtntxUSNKaL8cC82+PHhriS51YdT4BfAhP54ettiDd6zZR++64vliWAfO
	WxvGI9IHeLAWV6maCImjuAYLJzH5djsdMrVN1wd+FnwyTfctmEW2GwY3DdvXNoEgKpFycY3GQci
	un4nN5zBUQPuu9CNL7pQJb3NIpxiewWOhC0Su5oVHPMfyZjetA9tBa5vjh0ReniIQkkXjw+hX8T
	H8g0hzMcR0dpGvD3Lk4/shNjAeM=
X-Received: by 2002:a05:690c:dd4:b0:8b0:a37a:b1d with SMTP id 00721157ae682-8b2b66fb17amr85926767b3.24.1793730472207;
        Tue, 03 Nov 2026 10:27:52 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3097117b3sm2529557b3.1.2026.11.03.10.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:27:50 -0800 (PST)
Date: Tue, 3 Nov 2026 13:27:48 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mm/page_alloc: clear ->private of deferred free
 pages
Message-ID: <auonpJVJancOit_c@cmpxchg.org>
References: <20261103-pgalloc-ai-hotfixes-v2-0-e0d2890ab74f@kernel.org>
 <20261103-pgalloc-ai-hotfixes-v2-1-e0d2890ab74f@kernel.org>
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
In-Reply-To: <20261103-pgalloc-ai-hotfixes-v2-1-e0d2890ab74f@kernel.org>

On Tue, Nov 03, 2026 at 05:16:47PM +0100, Vlastimil Babka (SUSE) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> free_pages_nolock() and free_frozen_pages_nolock() put the page on
> zone->trylock_free_pages if they get neither the pcp lock nor zone->lock.
> add_page_to_zone_llist() keeps the order of the page in page->private.
> The next free_one_page() which does get zone->lock passes these pages to
> split_large_buddy() with ->private still set.
> 
> __free_one_page() writes ->private of the head of the resulting free page
> only. If the deferred page is merged with its lower buddy, it becomes a
> tail of that free page and keeps the order in ->private.
> 
> All other free pages which are not the head of a buddy have a ->private
> of zero, and since commit 819bfbd47e49 ("mm/page_alloc: remove
> set_page_private() in prep_compound_tail()") the allocator relies on it.
> When the stale page is allocated again as a tail of a larger page:
> 
>  - prep_compound_tail() hits VM_WARN_ON_ONCE(tail->private);
>  - with the page checks enabled, __free_pages_prepare() reports
>    "BUG: Bad page state", "nonzero private", and leaks the whole page;
>  - without them the value is seen by whoever uses that page next, e.g. as
>    folio->private of a folio which is split off a large folio.
> 
> Only pages of an order above zero are affected. Those can be freed
> through _nolock() by the stack depot (order 2) and by SLUB (a new slab
> which cannot be added to the partial list by kmalloc_nolock()).
> 
> Clear ->private when the page is taken off the list.
> 
> Fixes: 8c57b687e833 ("mm, bpf: Introduce free_pages_nolock()")
> Cc: <stable@vger.kernel.org>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
