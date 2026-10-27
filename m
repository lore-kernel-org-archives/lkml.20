Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072574;
	b=QJ6dlkkdFehFuDtHJt2KBlgHtRFGVeAn67ewTQhUUmiG9m2Hz9CT/ROU1dYS0b2A8Rbp
	 hIki2JW6Txa3e1TPtV8DRkcLBC787FJPf08HiwVjrMHKSQ7hsrhdPQ6iUPvQezlsIAVh6
	 VATl6af0/83e1INQb/LbzWlyNosYSraoGjPxnMIIaIbh4HGBwMNdu2r3d8bGuxWYW1mGK
	 8P0bVmR1DMyx68XNIusfDv80Zya4H7wAEPmUQPq1IQmeBoR6J2jqdpwWRpgvja28RbGml
	 52bTbgX2IuZfj+g4VW6u21cKu1yOKd3oDuCrwBJfh5FTls3McSbY34jzC3lnQ3nRwZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=3AmNHif0hEkmbwEeTcZrwdr+/HB8qgSmoybIARXFX10=;
	b=yvNi3k0LjPYOzboFxyiuSzo3LPXl8PGdFm+zFN5KJCud/55lkrCcfjdpglvavQLD1CMj
	 Sn787cN83xsoyuZS2M9BvfKEVyoawke7g0FLTDLyZUKAnpVILemydDJHHxIF6rQJq+RMw
	 QdmarJ6PiCs0lkn9JoKkHwtA/8xZrpgLmzjwdBHJMa5aMuidQgsFMEjdWv8JXgUEq+aI2
	 4gSldHtqeRs3RkXVIYA5IsS6LSXk8IRQ0fAzi2bhuQkNDJxIJZVpaXEGLotRzh7AXlr0C
	 OBHTAd5+02DLouOElma2C3wjvhcVP5DBEPJ0XGXYobJxKzu797PZaKx0iuGADAboBjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TP6Wb0G9;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06ED606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TP6Wb0G9
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4682977f9aso427190766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793072572; x=1793677372; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3AmNHif0hEkmbwEeTcZrwdr+/HB8qgSmoybIARXFX10=;
        b=TP6Wb0G9zLDqWuDXb4AhwPpwuHlSKdtp7vOXpYDf7eGm1a80xAQ1Kk7a3BAwdBSgbf
         7jIsPCCAndPaIyaXMt1h9L+v3YN04he2Yn/CRRvHVdHgoUlgLlSgwa9hE7a1amSX74cH
         Kwjdvwabbe16pgNJqcLstwt0irlt7+SuIDQSlFjPA8tQknv+O8lFGJzh6gB7RDu1kMgs
         b7Ioo0qZ28U44QqcJ5fTkQnZXkb4QTONZ/A3yzR+1a7MYD/SYCY6zoTd6EcwzJuhItLH
         0B0L6IlHYe4/Vnwr07ZM2/roJJBr1DR/QdSECM7/FpaBVLw/yoke4fT7pykNvEVAzfsJ
         pBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072572; x=1793677372;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AmNHif0hEkmbwEeTcZrwdr+/HB8qgSmoybIARXFX10=;
        b=G7Fda3xNru3M+uuA+b58XzhaeFK6wj2j+OVlfeiKDXIOoRS8WSIs5GL7QpYxF06MNK
         ufoYkfHuUWi/DeT1H0U3U2XIqdgB7ZGwuQOnLyqb/NjiRDixiE+Bm9sXHBoEkR992P7g
         KTjhzcr9MSl/BF4GCaMrX/rMlMHkwpurTpVNnv+2J/Cai5nfZzldmBoKFIS33q5YFlzT
         o5CxvPtprOYgiKK7s3qcoM9laxVs3pXmodjRCnpDIA8cT8DXcnNC0GrbSC255xkO723U
         QyYen4Psvhk0uVXCLYYSxTBEGi3A2z1TcpSpr/xafkW88LAcLmLp+shyZCjztCWZ+81q
         Q7YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG2Rc2v8lhDYm2q2J2ehA9Sxn3VGzwOUouNrJxHDx30uyNQYiuyg8CNwSYSEo+UeTzB5O8U2xxD7TLMiI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvPygagzfe9fW+LAzcr372zmgksVLDMmbkVDfYSMOMHYbXCvgb
	hsQTL7yUV+KbL0kuRkwujxRsTRNus+GBLQyZwlXZ8V+UrrM1E5kBy4MrcxnT35hwmbY=
X-Gm-Gg: AYBFou3pen6NmxDRSM3NN1v5NNun9AOgl02IZepNVp3EJnJ88jI+J2BcMv03BXDrYt/
	/ZsaX+5eOvpjnBk5ClSJDiKgfQJnOJyxCX2qnrcetmtLnT2MwcEWY6bmwDSI4a5A106yYKN7mIJ
	UM72K7H6q61NMOj2O6WZNd3/rdMs7HI76Qw019KD3kBixedHedX1kdlbElh4Fz2hyuybZF/+CNS
	sY+SqRPB+p2YvXc7W1owB8Ae0HKeLcAv1Iw8BYKnMQwjC4NduZDWb7vKekS+Cx2L5sDmN1N9b+K
	KLhn+pVZiX22ItDmzNIo3uqSiT72wcROcKW38mVe/cPn9Dd3Qe72j+NRFBseinD3ZojRgOuwwsX
	bsWVl4ZTxjZNJbr8+Lbhn29W+7/ASboTaCDGo4TWH7tuYzdnHmpn5GzZW2GvcD7YtiN6FiWg03l
	dewjUqI6xa00oYlpQP0TWHQBzV55AbBZfW2+yVDSi53KlDgUNGxRr3FRCLzmNRGTAWdW962tuV9
	SSvVZxo0AI0GMbD/FyYtqUja4qFXpG5mFqbrqvv0IcSUDNvSxVb0eBq2ttY5cxkFQTa
X-Received: by 2002:a17:907:96a4:b0:c42:102f:15d7 with SMTP id a640c23a62f3a-c46bdbf000fmr901757066b.10.1793072572116;
        Mon, 26 Oct 2026 20:42:52 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4a::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd649997sm382056866b.42.2026.10.26.20.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:42:50 -0700 (PDT)
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
Subject: Re: [PATCH 28/46] mm/mmu_notifier: set ->mm only after mmgrab()
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, 
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
 Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
 Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Gregory Price <gourry@gourry.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-cxl@vger.kernel.org, Chris Mason <mason@kernel.org>, 
 stable@vger.kernel.org
In-Reply-To: <20261027-fixes_core-v1-28-6f74bec9a5bb@kernel.org>
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-28-6f74bec9a5bb@kernel.org>
Date: Mon, 26 Oct 2026 20:42:49 -0700
Message-Id: <179307256988.1171062.17835586018092384558.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 00:17 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> Radeon uses a non-NULL notifier->mm to decide whether to call
> mmu_interval_notifier_remove() when freeing a buffer object.
> __mmu_interval_notifier_insert() sets ->mm before validating the range,
> so a wrapping userptr range can leave ->mm set after insertion fails.
> Cleanup then tries to remove an unregistered notifier for which no mm
> reference was acquired.
> 
> Set ->mm only after mmgrab(), once insertion can no longer fail. While
> we could fix radeon's code instead, setting ->mm on success only makes
> the code more robust.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: 3506ff69c3ec ("drm/radeon: use mmu_interval_notifier_insert")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: simplify description ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price <gourry@gourry.net>
