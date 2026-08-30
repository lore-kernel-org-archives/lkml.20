Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B48C2BD11
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788108661; cv=none; b=QMaVf+7Lxs3tpaCvZvoBH7ZB5FQpttdCbrda5fLJ/Zkc7MVXGUW3sq/0FMxZRizt/qvFaL2CXAat2JT0L4RV4Lyx34j5CHgVR0WZzx97qMM0h5+xDaMHktWAfQZxtsOyal3eyseORkrt833j5ig9k2aAiHtH45qQrhKaIwqWPZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788108661; c=relaxed/simple;
	bh=o7ZXtBE+NaOGj7jhMKUByUeYnxXFgFiN7XGThgfiEyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlCd/r2V3OxJTaOTQ9HhzXPdOiW+aWHXFItHqlcyMDj+L8GS2GC80aMLw7CygyLZSSeau7AfuzaDBDu2l3DbfRp2d2bk7QFDny13CRpN+YilLQYRcd5CmEeTUwe+kbK4qI13QNPdZNXPKPEtoMmtdwN4ZWdhWYgJl6/zcbsWXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mj36gTPs; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mj36gTPs"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90e7d9c747eso14526826d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788108659; x=1788713459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNKyczvWqNAkly1A3l3hEKTWoLpnZErs8PHY6+e1IAQ=;
        b=mj36gTPsj31qcVBGmPIpFbofxa7zhvHH/xFKVxzKSn7mEKqvRuFvN0u4pxu6Du9ujH
         HKShM/jCQ4C7Yy0i6YcoyDMRWo5FsEw6jP3ptznpMMsNSl8QENLLEYxNBHjKEiGEOS/C
         WwLlfelCjFS8yDuJzVAcgdECNY/fnCUfH7I9h7UBbY1W0jVT8rkkB2UqBmAuhq/HXSMO
         2DCieaZLxJOEj8cV2h/110h917QFchHkc7+0YdUAIk7CFkP8XFXskFrxWEmTYAf4dkEV
         bs8rk9ocK88jfrbPudi4jDQiv3nVrKqWKYDdESevE6m6k2OXuBAZAopZ9+KS+9x42gau
         9J8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788108659; x=1788713459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNKyczvWqNAkly1A3l3hEKTWoLpnZErs8PHY6+e1IAQ=;
        b=Gu/hpNrdhnnZchXlDB9J5A22mkMICXFyFGASmfgfpAasMGIUH+Tq+svnDgESnWxS31
         OlhfA+hA8/i15DSrVdtpdE1ioGqxZauTjeLWRcsKbtiwP/byHJ0mmt//7g9Y+KXxucLi
         ZgX/cTQuWpg4jIWKhqe9RPJ+7S02rin/hOs3cJ44f6VSyme5ZO1P4nf46CaKkGg1p/sj
         lWK2N+TAQ/GVfu7oUB2vD2HAHvt+aeIs8TJwHApTHhj98VkL5RQFUuLY/cpQCqmZygHI
         odDM4CQJdmjZFIOUzvR0A/UIC0XBgNmCYHtqS1/h0xyJHF47Xkin1BTG89Ub4BsvoZrV
         3IiA==
X-Forwarded-Encrypted: i=1; AKwUvBy5SPjJC5HeL0Oq9xvl/XZwlV17XDktyvA8nxJLBy4nD/H3ze86vw2OlC/sfgxrxEPR9p5EaRG0ZI6UdRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nakw9DXuGvu0C3IVIUfstRNG1y/ubiwcnDGdsuAL2yoE5rlpH4
	BI1uy8N1EPymoOkoMfXiY9/LW0wbVw8BwPrDxip3Mihqi9NGfmMAoAHh0zkFv1AkYEs=
X-Gm-Gg: AYBFou211/E2UNIIv8iV7P2Q6vLhOaXWkrQ/4K3SM9Zhf4CSsEIVJQ0DDQb+2qWGIDU
	pCBdHgOlqYkZaaHuiVhNS19OGbcUOkMB/D0TJHHLteTBAv2KtKytrssQtTzflbzE3sysjArlnhk
	wXWpvaTMzy3m5Krb7Rt8FOzo0RzPR+i2on8okD8MFOvRIg1ha6RSA1ygCu9jVqTfWFQgJu3XlNW
	PixDpZL9K3AvY31vaGaviaqQ+Yqn7BQWLqNlA7DHTu0AkahsLFa3X8fEzUtyoEKhkWXPNz702/X
	NNiauMp9LFMWQN3MOJDjFsOjrKTmmGfbZXfhze2fW5W7hduQf72Ybh2Bpr06AZlZ9/3QoP6ovgg
	b/lboJVfgiSwUhyBUNyJwihJcDyD+rxUMSKi6jszvH9oW2kWNIrzldvfNnPMz6Ke1v8J7xWHJoI
	RfvvOokDtxrEYTmGNPvErC3jYKBeh8gKsseOXPnfvKI9Q5/chZe/NywDl835I26L407r3IeZHkg
	wYTSdbRE7iXToebYgnLnZtKEWEf/OucfpS9gOX21ChO
X-Received: by 2002:a05:6214:1310:b0:90c:bcd4:e27 with SMTP id 6a1803df08f44-90ce0c5cba1mr282798086d6.7.1788108658494;
        Sun, 30 Aug 2026 09:50:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4512dcasm64404836d6.34.2026.08.30.09.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:50:57 -0700 (PDT)
Date: Sun, 30 Aug 2026 12:50:55 -0400
From: Gregory Price <gourry@gourry.net>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, david@kernel.org, ljs@kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, jannh@google.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, balbirs@nvidia.com
Subject: Re: [PATCH v2 0/3] mm: reject zone device folios in more folio
 walkers
Message-ID: <apRd6_7kzBO8aTQi@gourry-fedora-PF4VCD3F>
References: <c2577ec5-acf6-466b-ba66-0b3bcabbef7d@linux.dev>
 <20260830074751.25370-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830074751.25370-1-lance.yang@linux.dev>

On Sun, Aug 30, 2026 at 03:47:51PM +0800, Lance Yang wrote:
> 
> If folks think it's worth having, I can send it as a follow-up :)
> 
> ---8<---
> Subject: [PATCH] mm/huge_memory: don't split device-coherent folios
> 

First - thank you for testing, I was struggling to figure out a way to
test this and I somehow missed your email where you managed it.

Second - I think the split checks are worth it.  As I've worked through
my private node series, I've learned there are at least a handful of
missing zone device hooks throughout mm - but there is a lot of nuance
between the modes that is frustrating to keep straight.

Every zone device patch helps clarify how coherent-link accelerators
might manage its memory as a numa node, so at the very least I
appreciate it.

~Gregory
