Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500145;
	b=ZXVmTa2TT/FP+RtnAZaVl/OW0wss1e/1BdgbLbebdZf4oFiSOuRhgiEOKuLPVAa0Rk9/
	 YD6LLtL6r6hAx+/CIDdlBCchTVv8LWnN7r680IAnPxN7u4B4p72uQoD0MZEbIofojYYBi
	 HvrM6urMssizfzoMSP/iPYcw2p+5YftOWqLgQzdhCi+BmpWm/uVGIbicDv/CLnSfxVh/P
	 xZL11gp1R+3UxyXtYPtEHmdHHhOn5zlJ1dpg1NoQ6YQO5gQnvqS/R/pr8M5HAFEZQMBxc
	 j5pM8soe++Iul50m7DB57B8U8whREcMCFn3KitoChVBvtknbmzUYssdhpmWAiWGVOQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VnUBdoc3KTMUe7EeR2rhTTEffXeqsYq/yZz8D3wwCd8=;
	b=GKEV+gvB88Bmp4+9RRVbgMjJIW6Jq6mArEfss0ZPLwjjPHlxbRSBa4mBhiZtcmmqaHhR
	 BafcEZOflqZ0SHWzJ7yUzKAj0yVYMdP7ErCbGhE2/Fvri+35BP41fVCycqXDlJ6P708Bq
	 OTSPkWu+1lpuhnzw9A3ushlVgUZUJM7BikfJtZlpGQUJQMi5a2uiqMN2L/vHFFg9rLCGR
	 Vq+b5+Nfprj7KaxRH5T8a3B2eDtHWPpjzq4NgXORlN2TqssxQIpN03bhaPYlJ/iaxzr7w
	 jlmsxsHblr7EMt7D8YUfO6pyvIakN8UOkHRX/fdeqgy9hEqZPpB7NH3WbykOqRczdew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=CIR02JeM;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E905A606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E905A606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=CIR02JeM
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b3a332105bso11202777b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794500144; x=1795104944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnUBdoc3KTMUe7EeR2rhTTEffXeqsYq/yZz8D3wwCd8=;
        b=CIR02JeMUeqiwaNu8adwhYsGO94jwgFq4bTAnht1vJREgKSPzbmZSb2EZd+sWeLUVp
         7nF3EEqCyqWAuRi8HgQEGY5lyD0SPNb6/UBKozHjSVdha6RjiG6JYWwWEL3IKIC7F1/X
         wAJPMJcEDMSck6TcKQEiChSYxGgraYKPQAVb7rQDacU5lZyuqyoBuZrnAbRpzQ5+JP+c
         25ewY62SYqnw4fwQeYGOHEwPM8mA898RdWmCh3SlxFXJBIjIGTZ5gs/7XqdUfDNrlLJR
         2ImpPBJIaEGYOlC28uXL/ZS7iozms9kF1K5tFd+BPM7pgRIw/gYQlgOKW0ucyU4eUb8K
         tiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500144; x=1795104944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnUBdoc3KTMUe7EeR2rhTTEffXeqsYq/yZz8D3wwCd8=;
        b=vBxhPasnkCMbxPSrF3/rama2V1rz4vVBv5VHyu/pV1IxaCYAyPfBWLH97g3EH3CAJ4
         MmLBzdd6/wlKLFN3jtR19Xim0FvHaYmydA2Jz3lAqO7gJ++LW5RKNn0JxUSZYN4ehMCw
         3fp6jbyW7G4jOXzHDFU05nJI1FZwFJpuja/6JIXQkb6YqYBwVFnMx4DuX/69Gov4cUS7
         USZXb8B6uPTR8n8+Wzt+Na+cLq1j1+FsROlW15yI6InzK+OBQeWoeWQDKioPs0M1ny5j
         0XQow4Qe9HGLYtRfE5fFcajCL7/k0EXZFmh5APp6Bgz2afPag42AKh3AdorqSwBD2WKJ
         HbIQ==
X-Forwarded-Encrypted: i=1; AL+hErE4uYTVhE7S2syXziy8sZR+KekT4uk4NVnwo3rfhXR4J9XA8gTrsLCAKUFVYkUX9YrThDopnMaGeTWa2s8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+/ryHa7h4Y8QmAsDNzJdIL5+AvDsv6PCku0H989NnGMBaZOv2
	fyzY1br5GscItnprqvYsbkzWYW6HC/75F+VYR3aArrx9BDuGni1PNW12X3zKuby/Yb8=
X-Gm-Gg: AYBFou38tOS51xA5RjWoc1cZal1HbhI6GiEzngzUWVZftySdjB2V7VOdc08WugR11N0
	DMQu76Pqn5sC11M1Pr6oqSnWShC/m5o6C9sgQTQ19mYrhlt7FO5nIPkbHjfI3z/oK2y/8L06xUW
	4J7YrrjEwihNdQPOWEpLxrF8ZIkRnDP3pnCAnM/XH1YwCcn3NDIfg8Fw8mRnvmN55VEdFrjIkdi
	mAs/c2J3QjvWM0D4mtOoRjhOqUVS5RiQLs8E4rlJI3y0xYkE3DjCadzgHV7QzquHnuo3s/7EKPz
	10R4g1mn9QKuzAfZM5SSN9J92diXyqORaX9qr2McziiYIpir8KVVFKNZzsD0JwhbqDCpJQVk1tr
	1/V/Aqe9Epcw5WyYiRaWytTRCI99Ce8Ir1OjEG/6k9WNoOGpBCJj8StfWYslQyj77CnQ8quWmut
	AH7WSVfYXMGRQZZQs2bqqJf0dEvZTQoJIJ7bjzBsvEJAOTAlsojLs8QmAdNB6h0moNDmMLRiWkV
	YNBFWp15P4aU5irt13vTdsoU6MM6amvmPZ/R0+I2/RKO86j5rLirUO1gsmY2aGPDx9+fURRJnQd
	vT77sAL2a2JJFn8nPJ1zfykihIDD
X-Received: by 2002:a05:690c:97:b0:8aa:e4e7:c5a with SMTP id 00721157ae682-8b3badcc919mr23037017b3.5.1794500143784;
        Thu, 12 Nov 2026 08:15:43 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933d4317sm73615477b3.21.2026.11.12.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:15:42 -0800 (PST)
Date: Thu, 12 Nov 2026 11:15:41 -0500
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
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 03/13] mm: cachestat: restart the walk after each entry
Message-ID: <avXmLaznzWy27g5K@cmpxchg.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-3-3d2454362e8d@kernel.org>
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
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-3-3d2454362e8d@kernel.org>

On Wed, Nov 11, 2026 at 06:13:17PM +0000, Lorenzo Stoakes (ARM) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> cachestat() can leave cached pages out of its counts. This happens if
> the entry that the call has just counted is replaced by a larger folio
> that starts in the same XArray slot.
> 
> The issue is that filemap_cachestat() walks the page cache under the RCU
> read lock, so racing concurrent collapse/split is possible.
> 
> Thus, an entry can be replaced immediately after the walk has returned
> it. When that happens, the next xas_find() skips the sibling entries that
> point to the slot of that entry, since ordinarily they belong to that
> entry.
> 
> However a concurrent collapse_file() or __filemap_add_folio() (when
> replacing a shadow entry) can store a larger folio in the slot, in which
> case the sibling entries belong to the new folio and the walk still skips
> them.
> 
> Consider:
> 
>     cachestat                         collapse
>     =========                         ========
>     count a 64-page folio in slot 8
>                                       store a 512-page folio in slot 8,
>                                       with sibling entries in slots 9-15
>     xas_find() starts at slot 8
>     and skips slots 9-15
>       /* 448 pages are never counted */
> 
> Also consider:
> 
>     filemap_cachestat()                  __filemap_add_folio()
>     ===================                  =====================
>     counts the shadow entry in slot 0
>                                          slot 0: a folio of 32 pages
>                                          slots 1-31: siblings of slot 0
>     xas_find() skips slots 1-31
>       /* 31 pages are never counted */
> 
> Essentially the fact that large folios might be present means we cannot
> safely continue the XArray walk, and must reset the iterator each time.
> 
> Fixes: cf264e1329fb ("cachestat: implement cachestat syscall")
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ ljs: squashed 2 commits, fixed up comment in code, and commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
