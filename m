Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96844E50A4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732696; cv=none; b=AjS3EXclB7Pvm8ZNdBGe31+gegqDpDpuaaRAGeQB1eZ1K3zewAsr/E4CYgHPVQnCsWQCARKZWJnBjqjb4HGAYacrywFopszP1URloVZe0l6tsnhQdLZK/ZeVZ5DRefE8vaie37nOIbs+SSsmNyWsF94Qm8HkQj2rm185T0WmkNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732696; c=relaxed/simple;
	bh=PAT0aN3YevvdX1jj8vC2WBnSaBYHY5sQF4GNjjjw2I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bS8JKl/2D9VDDjrpC5whhnxHenWsjpwI9A8i8029o+5gas6i2nLeqpg/hxETZ18Q8JoiFmhSke83ta1MQTh7wWafcjcyIcF2QOA0IsscPD4a6PDyKexRjj3Yc2NNy0VQuX+96q+O7fhQBYjOvIr5Sy7WyFOtoB0+ku8w/ExG3dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxGKVFpU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxGKVFpU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so461732f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732693; x=1790337493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPJuKezU+0LGqyieR7K4QMTdZgLRjpBWSmFo8vmzfNc=;
        b=rxGKVFpUJbAkMUNfsC9R9xrx7Dw4yz52rY4i2o0yYQvVRU0mXRqmbQ2UntUPEtbHVM
         XS/NKQMoOwyKE4BBcny/N/h8H1m19B4hVF3WLQj9Kb44jDZ7SB8Aenb+XHl8KiLIJB4y
         9L3YCmDaoBEwgN2jEnAIaq/ty+NISa+kqPf0h+PMRw9yezRV+e2QY7O0IQgVZEZ3tqEX
         Uw/JGZ2sB8QsiUgLBJZSB+T7sxsCchx2GrRIjIhg7CcMBq+Mlel7PBMKM6+zUvH47vtd
         9VR2Q85ShmUclm9hKJ1o+Wi0XaCUE4uAnUsvnPITrPIfV4c28OWWVNx8I7qKjTlml0LU
         YmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732693; x=1790337493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPJuKezU+0LGqyieR7K4QMTdZgLRjpBWSmFo8vmzfNc=;
        b=tQypDcEW7UBFDYdYhvNaSt1UgCoCjrXnAsWcuzUFkB6HsFbkQCgB7GmipHFjwrFXOQ
         HkkwguQnI0R3854KJjEmnPLdpBEbOlaM5ThwnihLaMfQ9VzuYChe16Pd8dO+WmfOtDGw
         CKh4G/pWBTagXOaaMkmbPBzz+UayHub1q5/jfm3czOuDYuvQ38nvFHph31yp8g/K+6zE
         FMlasVBFXZ/lPXRyYpu/NAl8RPB/V5kNwodspWYhAF8skE8dS4bf8iStM3v8jEfM7KXj
         R8DBOAaGcr4+WKvTiskb50WLKyB5Zpeaek9e/LbotQaGCFybv7QuEtlNmgmnZlUn/Ygv
         O/fA==
X-Forwarded-Encrypted: i=1; AKwUvBwvMiUCr5Q6gHBzNf22yAZTBhOkveH9iyFxZiyz775VobQXvWjNnh+H2dmG7fZbcDjzKFD06zAZK4cSTi0=@vger.kernel.org
X-Gm-Message-State: AFuF++kS7DyA+dvUmh1S6w1+qvcOXbAHwpEmoJ9XJbN7zT9ELHi80p8E
	4nUH6WJ+6sYVWL8q4lGN2/XHBiiw1A9h3pmsJ5FNIumKAndCMhma8tok
X-Gm-Gg: AYBFou0yoYqjxqg6UB7xpGfi1b7ztH1OE2Kgb6gZjzis3TMFDujJxLRlOR8g0rR4WYB
	4U6xq3rX4MeJsf3PmJdgTeMJ3vhmIWqBaYyM5zRy/6N2lQ0HdXPmpPMYg3zLjFKUF1Og2LHxFji
	HteoKYyYUaESkUsu+HcQ7M7uivHoMMah1wJBi2HV5cKwvl2EKlzdzLBFVF36X3dAdFlfAKLw37p
	gM40bQIKZi2wUFxrI2RhWUtqrks+KLINX422iYqx/TJsnZzwyM6yZQ7IbxWIx7LMG1iyttBynWb
	O0pJv++NJKifg49Fn9WBhAErYwKhDdDTS502IWbUrS/48qg/phn9QiD6M5Y187di1FsXDUgZaVQ
	5h1fzadtQuWoGQ+Td7PxiHGFiMtO1inyN2XlHwSiD182k3Sh1NGhUEBXnhXKxQViosZOJAk3ANQ
	rSnvoizMDG5O+bqfdqtlDp9w/QwEwKjf7s+Yw6bKujUk6mKzluAuN4YzFkzp4Rjuyanp9G1IYC8
	XEzBOotF2/KLSIhkKDrU3MbkwQ3yZd+JRPYcLQARNQZbpanfp/IyG328eqPytbH5CRaoiYe
X-Received: by 2002:a05:6000:184a:b0:486:e300:a0c3 with SMTP id ffacd0b85a97d-4871e212306mr3249545f8f.12.1789732692470;
        Fri, 18 Sep 2026 04:58:12 -0700 (PDT)
Received: from localhost (pat-125-254.wlan.net.ed.ac.uk. [192.41.125.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487203f077fsm3145025f8f.26.2026.09.18.04.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:58:12 -0700 (PDT)
Date: Fri, 18 Sep 2026 12:58:03 +0100
From: Karim Manaouil <kmanaouil.dev@gmail.com>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org,
	surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev,
	hannes@cmpxchg.org, ziy@nvidia.com, ljs@kernel.org,
	liam@infradead.org, rppt@kernel.org, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
	zhaonanzhe@xiaomi.com, lipengfei28@xiaomi.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/4] mm: adjust free_pages to make
 __zone_watermark_ok() mTHP-aware
Message-ID: <20260918115803.55bfl7whbvc5q25u@wrangler>
References: <20260917171642.b4pkhqmvjwnq3vmq@wrangler>
 <20260918024238.31128-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918024238.31128-1-zhangbo56@xiaomi.com>

On Fri, Sep 18, 2026 at 10:42:38AM +0800, Bo Zhang wrote:
> On Thu, Sep 17, 2026 at 06:16:42PM +0100, Karim Manaouil wrote:
> > > +	if (READ_ONCE(huge_anon_orders_always) && order == compact_hpage_order()) {
> > > +		unsigned long free_pages = 0;
> > > +
> > > +		for (int o = order; o < NR_PAGE_ORDERS; o++)
> > > +			free_pages += zone->free_area[o].nr_free << o;
> >
> > I understand that you don't need a precise value here, but in every
> > instance in the kernel source tree where nr_free is accessed, it's
> > accessed under the zone lock. Do we need to use READ_ONCE()?
> 
> Good point, thanks. The nr_free read here is an intentional lockless
> estimate. I'll annotate it with data_race(), matching how
> fill_contig_page_info() in mm/vmstat.c reads the same
> zone->free_area[].nr_free field without the zone lock:
> 
> 	free_pages += data_race(zone->free_area[o].nr_free) << o;
> 
> data_race() documents the intended racy read and keeps KCSAN quiet.
> Happy to use READ_ONCE() instead if you'd prefer.

Yeah, data_race() is probably a good starting point. Thanks!

> Bo

-- 
~karim
