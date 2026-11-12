Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501475;
	b=LXoZ5/o8XauZTr6QH8I2Q393Wt9R9AeNRLYwjt19FnFwpOEYRcy6iSkX9JWHNLD6R8yC
	 QlCSn7ImZyBSf1GQqCKDPXcYPbTtFjCOi2x3oDTpWYDXEwiaPEhU7Y9qd+kGZi6x6fYWK
	 g633dbH68mGTHtV436fliv9PZcsH1Y3vbJcEXw1+tyvKotcM4mDFD1R8Fb1qZ/FXvmJRP
	 MPJ4TDAgV/b9HPX73Ze3IjURa1kLG0wfJY/6ms7hyK+7UqIdXZuE0OWGMMoE24YR/6+uj
	 xXnMT8ZUp9JQxl4SNqlp+im8xREonkJh8wdaPav1dZa5dv+ECtrtb0Fhnr8vKDa5vDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=nvjirMgHIxC88ZUFqPd+mUQ9zs5Wq4hvPV8uQmDh82Q=;
	b=1L/t14cFkObjvt4+Ikr19hqaDZtLD/YiOUPfAWrFbxwwcHolGJOXQC7RMa7sePF/DVHv
	 BpmCPhQ78pHNcnvuobZ8azy0lsYb9etS+zPRj4PhBxx2DgwyoyQ3kB2OqajJjRQ3DTSzs
	 w9DBdYWPvcdmXuAVDGNlRYE+GdJcWa8pu9ekfG5HXgIwHw5kFldwWU/EOVwfWoirHxiXU
	 WXsc4uqScT1eXZV5Tot4GfnCAPiMkuOn4Ffkhn99+AhesLHcRRCEFGXtXyLDAxwAbMXqo
	 H4NTD22TnMp/nMYPhSPPEbHs6TNlipducthz2j2QjdjjBP+XV+nxJNCwZ5oNQcHKG2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EcWg5X0n;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129DB606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 129DB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EcWg5X0n
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-945e6d9ceeaso382880785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794501474; x=1795106274; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nvjirMgHIxC88ZUFqPd+mUQ9zs5Wq4hvPV8uQmDh82Q=;
        b=EcWg5X0nzGoNsJ0lB6GPdQ16HEXrDhDFvoQsS0VrzVleAIoPDVqS/h2acM8q0TQYfu
         dFvoIUBys6Phs9cm9/zUsvGd4XXiUFUgl2Vvh3DVjvMRwzUYK9Q41zDGwVwWXB0/n9cw
         dMU8taq7vFkwnnEXKmC9KIXbeUMyYq40IdG0OPHGeX7lvePvlpnmLRTcmVqFwecD6gPO
         jcjjBvWRzbqYTQEOYNjHIngi9klLayXp1nffRLMV2zEQTxslQf78Eyf+TpWKysHmuy3J
         4JKN5sNVVBr3UPxXRJclimCFmHmsOm3RQFiy8w08BBtCyPXwzXvbPbyunw60CSaGFLTm
         yKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501474; x=1795106274;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvjirMgHIxC88ZUFqPd+mUQ9zs5Wq4hvPV8uQmDh82Q=;
        b=HOwyGJZe45F/AI7OgPbyWrPaLoLfAey27dgDNP5rQQmaHTko1F00LzFoftCklXoM3S
         XZaMP1Xph9I2xe1xGg4kVGRPKKZ7qF2C5I1J39izLXkyOUS/KmzfT1QseqPIhj9RSxXZ
         O/SXpKFLrwzQQ//SAs8ebFBmXObBPDzSaut+NXF3TFgVyL6Mr+w4A/B2rDfzjAYbWhVM
         4yvUDy9u4ThsMd+s3b1niU/SP7VAV1FopS0D65ZsfWaG5Docb2VlKd9SFNepqqKrtw+X
         9tijLQuj7WCkZEItWwC46ujpuvCUeyiPsbS0CCAmIM9yVaN78im62K23lEtEplB2qhmo
         dShQ==
X-Forwarded-Encrypted: i=1; AL+hErFw3QCMswtiC/svwj4h63kKY8yEKfXw9/4DgCpCKn/ztja34yRt6G25ll0YvgwTjEuTYVSv+7J+FiLm8Ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SINBhrSa7gwZSV7x3WngUTj4L7cTGPNpW4sY0TtF6hhahqE2J
	5xCplucZ9v9uzKtlcdnatdLGsiyD5TxlnTprO2Lz1D3I9VCIg9NqcamMdt9akaJ8kSE=
X-Gm-Gg: AYBFou1bClmr7I8eDg0muwuRrD2PCpVKg3OKXgdv/kLkrKh1Zv7uJTPrHENaU4pqLhL
	irAvjmpLKtWUfPwNIDeM0ON8hk9gBacojy4Dpm7mC/1j+M0VgZqaAsSeWGpfNo7Z/i7wQ6byBiz
	kjBfouYlg7Bj73wTngeRSW4+BvYgFnUxICeN7XpkPQYFXRJ45mea8rb6bb/CdOZ0zCPUMODqxDg
	+iFMynL41U6Axl0NIFYKNQ86LncoB6E592nJ27dw4gMeuO14oTaY+M/Np9LvO5kRag+3KWaDb3Z
	InD62nRjcoOFu3phcyhRcuSyuNSrYuddlnIrPX7dIxZpju1gqfPmFhNkel5Ta7AeWqte8XTrwDM
	UsFQ0g53n16fFdO2RGRfDlxi/FWHS8FxBoqNCvylo+wYh3CS3JTUzWhO6T5Hv7GbkAw4w5WyQ1c
	wOsVdGXPZnRuMT8N2+a45Iu6AIgO2XHRaPi5fs9eECEPRUMySdfGxnPx4wH+OGfpnLMNKX2z1ut
	2NCjEZ7azsqayTUG8WVfcT/zvAUb33vgi/Wfd6YwCB+sdvqDlJdgBNe2d6fFtVkfEEkdvmO5jLI
	/ZR+RaQYazl2dfUQCqxjwvqzq+4T5GYn/ZcAToAhzUPhLqp7Kvg3zrNfUoCQBt+Ggb7L6RG9eT5
	dydzDfeU=
X-Received: by 2002:a05:620a:28d0:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-947aff8c925mr1038556485a.46.1794501473963;
        Thu, 12 Nov 2026 08:37:53 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f02df0333sm51261056d6.27.2026.11.12.08.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:37:53 -0800 (PST)
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
Subject: Re: [PATCH 02/13] mm: cachestat: count each page only once
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, stable@vger.kernel.org
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-2-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-2-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 11:37:52 -0500
Message-Id: <179450147215.482102.15685424149106944496.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
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

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

