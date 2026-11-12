Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503704;
	b=VQSW1qfV5KMxOKgnUM4cq5VrkWPkGTf03JaEKRN2GP5VbFYzty/Zu3hP9EmOn4hqTxK0
	 97F3163rNE5+ElnN8KOhGyJkhFnT7eX/zLR/9CAm/IHWDVBKWhkRzDh+OFBw9X2J0Dx/M
	 ucF/JfOnbq8REvFYpk1vF5npzMD7aLg82OkJONhhLfats2EcigXjckVZicSIgUmV4yZtA
	 vdm92EyJvV/wWiDbS6Ogj/LeobLDze9V60J348EtDLeKVV1IfUUe+4OtNva72LvNqp7HU
	 DhehSllbecp4LgZ+FJtlNjRhwMRG3/U1HSNMFAxYF3zmisIfDBeccXgSMNmZu+QYEeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=pkUNJy/G/i2yr1NWN9oiSB6swWvpLvuFtnABa0SM57s=;
	b=1EEUhLz4SkIMDFxVRKJFh/+tUtPC8GRJxMzRGOe1wIXoCN6XtYJvfSSTXqp2OEXLoQtg
	 EmLh2r+RTSHpg8QcUAHY7CuYneG3XZYngn7JBqNTLpajdpoOaKWYdNVLlYmpCmbx0FL87
	 PKFEEudIF3SXB3+RknS+IgwYHsiXqsZXHlt6HIqYg8Pv66Y2woHv8e/FCqIn6XuNc46Uk
	 fFVlNfKrJlKtfre9VDXEGCQelBSCMy4XunH7e0VGvNXubNp5q/H6s8dBcep2JUvc2fbjq
	 vA9ggFTyXBDYEc4w38x9CIMKxYfemUIM/P9qcCsdSww5CZXK5vuNgIDhltd2SbrxSPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=pmyoi0DA;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C67606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C67606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=pmyoi0DA
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53669f7b518so45421871cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794503703; x=1795108503; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pkUNJy/G/i2yr1NWN9oiSB6swWvpLvuFtnABa0SM57s=;
        b=pmyoi0DAQQlNFzltCnW5ORgDwnPgssF9tc5Yb41egpqJgqO1bCD46e5CH1aNeekBwW
         zNHDZbnO+IlIj94erHAXPMOAM++MXQqoXuZCMU4A5rLvl3ueWGShLAmTxgxlGbCB3/gG
         ZHjvXlyYIqd6r+/SuPQvrTTCMPGpgZUnR+AgV5/jt45EQ2tyGvJM+kMslERvdjYJbMT1
         9TMAzYgSYsdtz2+/xGf4uEOHM3MHtE71s0/etNjpd1b+uuTHQYTAfstQQM6azn5B8XfM
         Jrp4nZhrib4IHL3HIQOCPoXU85VZDXpBpYjP8UIEY8bs1f3sG0zr3OlkX5wrMUEsI0qf
         ujQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503703; x=1795108503;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkUNJy/G/i2yr1NWN9oiSB6swWvpLvuFtnABa0SM57s=;
        b=sIk6B2nsFQTRjPYVtTsKpaKXARQgABPapg/jnlwE3ol6Ba4+kWsZtkifTcNBEI4RuB
         DRRawCghv+KU2jD1JtvTiJgY2KJN4T9okwekFGcIpi0Gx+gHs+8kMRZO41blVqoquHe8
         YAOzpWFOce1hiJrDyKn8Szvct9j9pqIewnFrdk/XT9+wUvSxPjGpLtqJ+qLwXqmNYmPa
         3RFl+NuFrnEJAtm8VXOWr/KQo0S+szLs3S0GCQXDriPUIBAl4/UPCTihgtRsS6Ev2xDC
         ZtCbvuSN56dcIdfuNhzCjb1NxUmLr1NDWpEf+zNBXIOSmxXOOBKBVPcPQKGi5EU3P7FZ
         dL7w==
X-Forwarded-Encrypted: i=1; AL+hErFI3Xlhcj9Hs1B9Q9jlE8amZrQKcVSr/11UYFLGSnkMw3acc7kB3Lm3Ca4mqx6uTfOiSB1xQ0WwKdCOVtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9trz1UuI1uUrWsUU9wxIbaQqLaTJeRYDvVeSjuJzDZdLz7EVxE
	4vjpoT8jjjPt9dD4P33dlhd650YKPz6CFfjbYMPBGGTxTBBBsFrt7SLQKeERH2BbQww=
X-Gm-Gg: AYBFou0AKIFmadkScmqosk6VR+qKYzU6UK3CzP6TMt/Kw6yfVunmvPfCE0INgZN59Ib
	eaZo1ZWdlnU3D7fCn4+kCQSjBWVh9j/Cterwc/gqMVJZuhh2GI8JARcUc+nQqG6Ix6Vc/TPeDsF
	znTTRyjJqJ4MJ6CCY1Q/2O5eGobgCnDxAEciBuM1rzjdQpjcih32I7dzR+qfKu97PQkGE+c8SMA
	sAlRizA0do7gvWFyioJQg48+yN8+mk+a6F2PY2q5kLYFt70LqeBl3tO8q59jKsko2r888JVJujy
	e4oHgaYa0OFSGlh47QCHNv1k+RYM3PRM/mNvVMcsg//3DXxRrLdV167hkMECmBiIuXY80wMDgVz
	ORLwhM8d1uoj3OUBc+xrgWl/YHsfYT6x66Aty1zHrYvZ1dETCRzsNmiS+a8y85EDy0OzKsH96AM
	fl6Ter1BpzKGuwJq/7rNNeBlcV22Eg2VW8evh0VvYH+3UJ+Btp2b25fFmdJF4+pd/yPYC9zp7ji
	ABnTAEaEIEsdcK6oA63h4PhGcVFsa4nGYxhW9rIYO0lNXnUZV1mUQPYt/CvdSuaHgXl1R1jCReN
	LM7jJbu9vKwxhiaAFPubV8D+OHhFyS5o/0LLgO4yo/GtYSfE3YRlQ4m2+FXh43xeIJy8LYruvpz
	UCQQ1B24=
X-Received: by 2002:a05:622a:5793:b0:54f:863d:92c7 with SMTP id d75a77b69052e-55ac786019emr462181cf.41.1794503702764;
        Thu, 12 Nov 2026 09:15:02 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af5f339sm78250641cf.9.2026.11.12.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:15:02 -0800 (PST)
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
Subject: Re: [PATCH 05/13] mm/migrate_device: don't collect a range twice
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
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-5-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-5-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 12:15:01 -0500
Message-Id: <179450370120.482102.8019443935242743968.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> migrate_vma_collect_pmd() drops the page table lock to split a large folio
> which it finds in the middle of a page table, and then starts over at the
> "again" label. The entries for [start, addr) are in migrate->src[] and
> migrate->dst[] by then.
> 
> While the page table lock is dropped the page table can go away, in which
> case the restarted walk invokes migrate_vma_collect_huge_pmd(). However
> this is passed start rather than addr, so [start, addr) is collected a
> second time.
> 
> This can result in migrate->npages exceeding the number of pages the
> caller asked for, and therefore in writes past the end of the
> migrate->src[] and migrate->dst[] arrays.
> 
> Fix this by only handing over what has not yet been collected,
> page-by-page, and flush the TLB for those entries which have been
> previously replaced, similar to the other returns in the function.
> 
> Fixes: 022a12deda53 ("mm/migrate_device: handle partially mapped folios during collection")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ ljs: cleanup commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reproduced and observed the out of bounds condition with a KASAN kernel.

Fix looks reasonable to me.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

