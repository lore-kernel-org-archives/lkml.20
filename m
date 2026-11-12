Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500012;
	b=RGFbv7F0T0KQc83FumkHECw4yp52XyL2zjQq2UF1dRJSrPljs73aAkusiL60Z4DFqO+d
	 VktXmttBRcxxOz56YQ8Yw4CnorJPet3p10kYGWkrDaFm5tgWz7oU0rvT6BmYuC9AwR9tu
	 MsqwbFe1oK71M47uGwwdQpWWHoCYcsMc/T8ZaVY4nF2uJQpwHlwxCnHZCYfe5ZWvH/HIS
	 339BQo2mlY9tT6LyH1UVjlGNYUx+lsQzfmrB8BKWD+B/UQiqBnvbnjUGhtMEHb8Oa4xSB
	 Y+AxEuPC/JOoKFGNL3JAKzC0xsPpfpGdVJrQcSGEWfAg1xVlhHJhLsyOQSCYlbgLBwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/SNlzExwuTi3WbPB+pJy/Rdg9j690l3UVVEipCGae4g=;
	b=B/2kBoHMJnF2z49GJLY6mpDpyPXC+MZujxRh9AObVbijkPbx47qeaJ1oef/bQmGBpb28
	 QIXXlNc2EdL04gkb6pkUVSsNeUafVOm4Pz5AXvR/joyaBwLKTIwbLcg+2HcXMapXkCd2g
	 1lm9ORIaFXRzwYI7R+kDZy+6sp41mOfCDYZsF+vYFUwETtZxUFgcdhavbK+/LJ3wFJcRv
	 PaVErtP3WOXp7GfTO36MW0GsZS1O8VJzjiWoCiBeB+lKt0kCMOZ4t0dgNOT1E7DcbxvVU
	 JUi9Sh+uxIOA/tTD62YF1PfZc1/7TOLRcFI+Nsvg+3+mhMqk82BApQ6zwOLRrqo2JZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b="mscvbfX/";
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D1606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=mscvbfX/
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67d8221074dso715380d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794500010; x=1795104810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/SNlzExwuTi3WbPB+pJy/Rdg9j690l3UVVEipCGae4g=;
        b=mscvbfX/np19cXZfqf03A5JubaZGcQnOdRPEso5ZtATeXHb8C7Bvj23mu7X64g/EN3
         QwAOJlPBVZukq6OpcBrzGmArUgoPeZw2Vt5kYDbU9kFGnmdIW4tgN52NieHN6bY0yI/Y
         8qGXx3lM5/s/FVRkcsAVaU/y70hq1jAH4meA7Z2HjyH023lPYtWE7cG6D4uT4QYoVLru
         9atHvOkISWTpFFYJHw2yLsCEH7KhKFFPJjGjGQiKyY/8mITUKqDsFHtqUfiHayOrFGpy
         HCBf4ccp+/B91i7vol6oNv5MfCIBqxSriklzVvFsQegtN3eVRHj0VXbRiRFTlwXd784N
         RshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500010; x=1795104810;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SNlzExwuTi3WbPB+pJy/Rdg9j690l3UVVEipCGae4g=;
        b=znZIE1Gvxr0gZLsTElxpIVC9nS2IP8FYNUHFK7s+DbJhYMwvUHEG9si/t4b07cn6Ms
         nrlbSIoH7uqs5lLLDuPXhKnuTPm+4X0WNvHv9wGjLlERJ4hwO4CmN9GJ6FqWEXWizvmP
         /JNLqtdcF39zAbKcoK58DPD5mJ0otbpDUa/+Uk9Rtq87DMDFSmSxvyKAykVLqoR2ifZO
         fR5WpDJDs7uCs4IYK3jxYkYrM3OQB7lW6ZivIMI2XN/YJJVONhg0fXDaQ67/CcoBMqn6
         7OvOWm/O6mHBtM9WlwFeYD3DO5Qa0/s16nP1hJ92eBDhnO0Tvrl11e1owbUMHZduJ36S
         /+KA==
X-Forwarded-Encrypted: i=1; AL+hErHxNqtwWgnj6yU3XenIdeqgEsCBCqoLo40CHcW4IxsiA3Jwm4WTAA1CtokXVW1IjmBU4QLLf5DR3b4HCFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pX0x5H347MdcMXb2oQUXTdrxUllxEYcmf3h/QrQV0e5/ShroL
	b6zte92r6+/nahD7lZAt+XsFbZlWe+NLJoC2oqdJsZNqGwl0oD3syqREbwZgrp8vPQ4=
X-Gm-Gg: AYBFou1BycVHq5qIcQrpLdVSi+Sp3uhsIbmM/P0b4NDs7ouIDWxAKxrc2/0OeQCT8HQ
	gEI6el/Tte+pf+/d6qkJvCLUBAYBCJYD4BLUQkxU4L8HF2ri3Ze+iKuF1/ueapsm0IAt/Zs1RB9
	T9uAmTJqWrNXFwW96whY6fp57JPy1pbYfWVkRwpFB066XWSW3k0r2Ulgp/aCiglgXj2czfDIld9
	e04VXgdLwc/czcnB9XTLN+16X/IUv+mtD1KMYAWMYyxKYkhIaTaF29dAiu7WC3Llm24gfRcOkBC
	zECbUARu+t2ThPzd4WyNuUwSloZHo9Wt4wFFzophLewAfUMIBcNBB960XwK7Njc5xMteCtL4uU3
	EnfJi0FPDS4uuDKz1p9Er32bx4653/qd3KmneBBEC2gHlzkvJmNK7d9pmDeqUIalWCRA6kEzZzt
	WDEh2yWq/cV+jVQYyWgs+WaqfYAZMhBDQACmqjM+YdvAVFA1Q4tMtZVWQPTbkF7NyQad1M1bFlf
	eKs7g2ShfcAP97UC0/S7pIiGZFVL/WNiAm42tcX+IEPJypih/rQP0u7zm5G4aypLnZCWQoJrf9o
	HKdqcFdGHpypua1WALw1OhJjHC3A
X-Received: by 2002:a53:d711:0:b0:67c:1557:7b48 with SMTP id 956f58d0204a3-67c67fd9f14mr3153613d50.64.1794500010621;
        Thu, 12 Nov 2026 08:13:30 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393409120sm73138157b3.27.2026.11.12.08.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:13:29 -0800 (PST)
Date: Thu, 12 Nov 2026 11:13:25 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Nhat Pham <nphamcs@gmail.com>,
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Usama Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>,
	Balbir Singh <balbirs@nvidia.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, Peng Fan <peng.fan@nxp.com>,
	Josef Bacik <jbacik@fb.com>, Chris Mason <mason@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Mark Brown <broonie@kernel.org>,
	"Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 02/13] mm: cachestat: count each page only once
Message-ID: <avXlpVZTs5_ytZtV@cmpxchg.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-2-3d2454362e8d@kernel.org>
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
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-2-3d2454362e8d@kernel.org>

On Wed, Nov 11, 2026 at 06:13:16PM +0000, Lorenzo Stoakes (ARM) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> It turns out that filemap_cachestat() can unwittingly return incorrect
> page counts, if large folios are present.
> 
> This can occur due to underflow - nr_cache is nearly 2^64 on a 64-bit
> kernel if the input range starts more than 64 pages into a folio that is
> split during the call.
> 
> It can also occur due to pages after a large folio being skipped if the
> range starts in its second or later XArray slot and the call reschedules at
> that folio.
> 
> Finally it can be caused by pages being counted twice due to folios in the
> range being split or collapsed during the call.
> 
> filemap_cachestat() walks the page cache under the RCU read lock only,
> and for each entry it counts the pages that lie in the range. It does
> not track how far it has counted, so the counts are only right if the
> walk returns each index once.
> 
> But a large folio can be split during the walk, or small folios can be
> collapsed into a large one, and the next entries then cover indices that
> were already counted.
> 
> Resolve the issue by tracking the current index as one past the last index
> in the folio, and explicitly using xas_set() to set the current position in
> the XArray.
> 
> Additionally, add a check for folio_last_index reaching or exceeding
> last_index and break out of the loop if so.
> 
> Fixes: cf264e1329fb ("cachestat: implement cachestat syscall")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: updated to use curr_index, fixed comments, updated commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
