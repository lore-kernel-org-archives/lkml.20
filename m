Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504929;
	b=ceW/KPdfBVWcdrnW0u02X/IrRUduPeXdTCc/HOe8eojLA3ZuaI1iXstqk+m0URZPhkdO
	 V5HvCcB+m40flPA6iP1PNTEgYeeAo2IeqNwCuRU6D/g8uroRIqQyvqo6hrmibJ7978XDV
	 rIp/ZSplRW9rs6OaM1YGn5MysemrOtK3qM/9ZJ0QS6+QwePJelFrOE8rIhQmAZdplRY0Y
	 e2IFVuYhQcbk/Ooo5r1JRdcsKyYwQBf1y4xZ4a6eYuCxlyO6LU8GRb2Qs2TLP6KiMQ/tX
	 9EE0+Vo6cIiOvZgk+48VFM36C3nxa6+0N+rLYNQRDUtTwwrA3sfwepbWWHovjR0+RtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=wY/udgzoTMSU7LblXILhhflOgeGfM9mMJ7q98JCWr+4=;
	b=BdLaStH2q0Si83XmB77lNLgFhhU6fDRkN8UK1748eunIanbVAOReYwDxNDm0au05HILN
	 uxYGSZqprk6713VF9WTY6eKiqIg8dLujKha6MmxJRtTLJbda8zFSV29EbNIBqSffaiOz2
	 rzOGALha5B14gUSVu1l/RjUJcsBbvMtOP2tbyY++1uXfDyDA0IRIQioIrZ0yj/zg7bWVT
	 P4kcbReZFykbDdjrLKjHcezWeDExMXaPa1jjZmpr3T0Fr02CTTD9v18Ops0KisuD4JKdO
	 ywC1RgXIdSLHy+L9OjJh7iLmx/xoVPlWZ29W4iGO3pdmgt8TmwbkEG/r3wZfZ4AYr1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=oEs3dmHr;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938C1606A89A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938C1606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=oEs3dmHr
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53669f7b518so45643841cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794504927; x=1795109727; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wY/udgzoTMSU7LblXILhhflOgeGfM9mMJ7q98JCWr+4=;
        b=oEs3dmHrtbo3BJbfZOVEDyiKo84vSz7vME9GeiDQFoQ1j5oKIGWHaLXsA6of593DNi
         LSHuyxe114XTXGNJ1/Y5jCpkW7+pNUmCsJP3ME/2E1iS7aiNUDAMlZgu5frzBx4YzlN7
         LGU9QrbJB4CDwX/JJQi4yBuDTXoPz+0pNuVnbBxJS3Y+zSavZNYfRzlE+02u6FSxVCfG
         5AiyrOfkTxftBPH1gDgLAc4621TOLHFN0EDyYtoQh9nuWdC5b80BG3E4rlAu0JFVdD6S
         Ac+AVCNswFwIvFTGkOL2F1V2xffk16MtyAElYxcTnz4eLh5PrNNOOrZ9e4Pi0Z2PEMrd
         fzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504927; x=1795109727;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wY/udgzoTMSU7LblXILhhflOgeGfM9mMJ7q98JCWr+4=;
        b=qIsv4RHRdX2dzGtuNCt/LBKSrbXssQS5vhrrA9kSnQpfYr8jvMDayAQ8KHca3FepKg
         cgbXKYo+mJIidBE1qqWf4xHnO5v7pG9xqTnVh5wbrzQLEOFFNUeqKCnCF3ZgcULCr5x1
         X5Y2rEn8ZKdqRFQVlui+M6BQh+bTwHA6nowl9UXqIdyDZZwubjMqyFzu4WOFBwXxRqzg
         rbcM1OGMKQg8NA9ir5yRprMqiFMWAkE4tH+dGFCYWmxxdCwMF5+mTwoKTv7uCKPBRpoF
         2zQjyaiE60ojhw1HwFmhSPWIJyMcAv4EdTbRK1NPiKRs3VQS6mz16o4Z/z67qdB/C8uo
         sTKQ==
X-Forwarded-Encrypted: i=1; AL+hErHzqNkqcZuoHp5uY1cV2jYhXPf59fyZULCNRtJpV5tFmjacmV9+X5D3ywDvc78SdbXwTqI/081nlb/OFE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6kgLCUuzXvthuLVyQ0ex4pdaGxaQaa/rBjUjjct5GyKQoaach
	lC/S6G++k0gsn50kOtpjmZJCSdZsapmS6AvWdhOZcQ2QlgJCMxfjfT+refoPSl85p5g=
X-Gm-Gg: AYBFou2ZYcATpBBAxGF8hliFqbsG4lowHLKOoJXZzaZs6tr350YsDHObpuj23+QhNNK
	WZ7d8kC14qC9+kOc8EeNw5v8HH958aqXDfhNgobiWsE49pMdVwWD1u7vyVAZa6yK3hgM8lvoLno
	Aeh+sYx/Q7h2IiV9+RjNr6IZCIwgiH0JXLvvVyqE9j3usQgvvFL0pSalF2rKPI8/c3PVqhdsTV3
	3KzkTYqCugv7/HmLhttMGSLbfMCkpA+0SrPz6JE+U5OTh5Iqavkucfun0Vp/804WyfOO0KRmbBV
	C7alkyydi5D+R8JXimJ5cBvN48BMSBwiQZVsRD/95IDgBC+mYm1SJFroCgRUoFMXrMarDsaRRSD
	354ZHcMnyUC1QJ8LPYyj+GFA3UsZ+M8MkWQ/jIkWEkEvHIYlC2tYvGNJBDuL9zXdEAig0044RO5
	XXYkRuB/ujiAKLbI0MPg9NMVpIDrAjray8zYrXJUaLgqYDIIon29Ue/wiNGqHpznOWyY3IHqfsZ
	F09Xg5LWUHH68SX/D9oMWTp7wSOAU6aSxGFf35PLnKaHJONlWXaYxpaffld8aCRh9hi3p08rCSO
	X/et5ffKOtCQYF0WrsNPOR+K6hNsaRH4F5d6QMLbwTOVydvztivxzr3wyN4HHdpEkc4pBRRXoGE
	CvFIAMQA=
X-Received: by 2002:ac8:5a0f:0:b0:535:a5f9:752c with SMTP id d75a77b69052e-55ac95894d0mr1164321cf.75.1794504927563;
        Thu, 12 Nov 2026 09:35:27 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5e579sm847456d6.17.2026.11.12.09.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:35:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 07/13] mm/migrate_device: look up fault folio after a
 split
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
 Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, 
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 "Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-7-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-7-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 12:35:23 -0500
Message-Id: <179450492332.482102.8905567682196853763.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> migrate_vma_collect_pmd() looks up the folio of migrate->fault_page once,
> when it is entered, at which point the folio is locked.
> 
> The fault folio is assumed not to change after this, however if
> migrate_vma_split_folio() splits a PTE-mapped large folio which contains
> the fault page, the fault page ends up in a different folio.
> 
> Resolve the issue by looking up fault_folio again after each restart of the
> walk.
> 
> Fixes: 022a12deda53 ("mm/migrate_device: handle partially mapped folios during collection")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ ljs: pared down commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Was able to reproduce this, and i think this also reveals (and fixes)
another bug in Nouveau (memory leak).  I think the Nouveau driver still
needs a patch, but this otherwise looks correct.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

