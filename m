Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A434DF4AC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009316; cv=none; b=BcyytOD5UsKoliaR0b3OwK7SEBph9MUhHFSmuHNVLOKCou+5S2xJ3tIfsIVUCRvamUwyULf5k1mfR7Pk4bTVrZ5dMxCNnnui+xjfShRo0nAYqS8VZvZortohOlLLDLBNneJ6GE+p0g21ivGqAwpriZacFnlbM07UTFtt3vB1esM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009316; c=relaxed/simple;
	bh=Y281zkM/Qmo9OSGui1K8yVeXfs0hDkEf9zNmUTSMONA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAadrIvtxR+JfUwTnpYLNbuMMKcpLYuPPkbuWEvzdD6x6dCWzVyCE7WuN8NJYDpmj2hmvnuwv5r8AZgOjR+5H3tGXJrTOwDquJDEBYmnJcFacryNw+7jYRJ8khn08FWR7U1MgbHV6ltFDtNqCUxDJd6cLIdWcQryhXlgzVzsVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=k0pZWgSj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="k0pZWgSj"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so2789222a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1790009312; x=1790614112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmR+gFnwjwx9HRJSW244xTdy4CpVHKmXxMQ0vpvGnEg=;
        b=k0pZWgSj5sKG9bZvTfwMZ9ah1tW+wASdNOiOGynLNWuCy/qlwhwEoDPNvpIBJk+31s
         u5snlPHJzeXFqmsNseQu9UWqyO/5AB/zsbm43GykQ5GvJuyjgGYWs5Q7YxGH9w9R7yNo
         RI5dkTpy3T55d74wwGyMjNv4FWsyMLSI4OiUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009312; x=1790614112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmR+gFnwjwx9HRJSW244xTdy4CpVHKmXxMQ0vpvGnEg=;
        b=maOh1fIOHlwcoecCJc+Mj7B8k6SuCUBxECv6OadoRgl2kAwbJ0QcLBCt7jlg8syU1H
         RazRNAVn4B03jV7Mae/QcX45fwRnlq/cnmna3tw8f3DkFW9dNCacm3bldzTy12y7HqbJ
         dQPoN7ZWxT/XHdzD41vLCG8pRfUBUWrYCdsbp5+rZIbIW6W3aO8nee4ygsSzKSU5RqkF
         EE7u5PSYnfk0qjBctL970S8mNL69YqewjBRvWBlBLmX+Suc1LYrIniHUNDpoTax6QCC2
         XFulpzZwhPaatBU/t1CVLs9VaPETRjRymNRusuCCayWOBVTlEXiHbVdT5UMTqaQY8f5z
         L6PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfiw/K5Cdb0CkWEmzFRu+cG5T9ilc+D79+UsjuoHWNHUBfTTpmFpRFHMEfOogqDWiJrwqhlzqBlaIYylY=@vger.kernel.org
X-Gm-Message-State: AFuF++loLLDusTiU+IK69D1J88sswppe0kvmNNVFLLh/1N96IHEb55ej
	fbYdnbe5AHoMUAOkP6OGimjMOWvKteaJMKII2AU/qy2NN/CdDnk9e6eSD0t9ReUU36o=
X-Gm-Gg: AYBFou0FlOBtY8FEW1ZARiunS/JCNNBwuVqWOyT9/gTpK6ovXNpT+aljEXWXWXq2Lr3
	SiXWB8Y49LqoE6sROyLrpyigHhoAPSUk1XBRnOS35Ubblu6zvqys+9A84eBOnboFv1hoE6JCKCY
	OwS2LoFhoxqUAJ9axnwXk/jXue6/8DfNQ1GvHcm6WpC2hhMq5BOUU9hdnZWNKrd+ybL1acx5eq2
	p3fWM/LYRlm+VakvRiHN+52pciUEEIcrIVl55WVpE+4igt2ej09dnu3u1BE4IqoYUtwgf51fmhm
	tY+aVPHOWIH3SyZFP67UhWmV55RGcLgnPR4bS1zHxfgvW9nB0vbz2/3Afm1Qum96Nyw4+s/WpIq
	UzgnVRGILWb4kyaX+OBo3eJ9+oMoOhqUFObG6dduoYYmug7WrVT8joTm8Nkd9JSAooIXf8GJn/g
	pPy2bfr+2rhfKnvIIGcjJPtkYhJycGZgSXXOnDebYuNABpwlEO6ox6E8CvUemd8vWEGA==
X-Received: by 2002:a17:90a:d888:b0:39e:4c7f:8b16 with SMTP id 98e67ed59e1d1-39e54cf8bdbmr17750548a91.27.1790009297592;
        Mon, 21 Sep 2026 09:48:17 -0700 (PDT)
Received: from 1c1aead48890 ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0673209b7sm148455a91.16.2026.09.21.09.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:48:16 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:48:10 +0000
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-cxl@vger.kernel.org, driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 09/12] mm/sparse: remove SECTION_MARKED_PRESENT
Message-ID: <vpz5zqg5nwbpolxbkip45vxxdt3lni7j2haal7q42skc3b57tu@uh4cec4x32dq>
References: <20260909-b4-sparsemem_cleanups-v1-0-008fc8d579fe@kernel.org>
 <20260909-b4-sparsemem_cleanups-v1-9-008fc8d579fe@kernel.org>
 <aqK9S1hBpPnujgz9@gremlin>
 <eb5b465b-c256-4454-84de-517aefcd6d59@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb5b465b-c256-4454-84de-517aefcd6d59@kernel.org>

Hi David,

I'm sorry for the delayed response.

On Thu, Sep 10, 2026 at 05:11:36PM +0200, David Hildenbrand (Arm) wrote:
> >> +++ b/scripts/gdb/linux/mm.py
> >> @@ -76,7 +76,7 @@ class x86_page_ops():
> >>              self.SECTION_IS_EARLY = 1 << int(gdb.parse_and_eval('SECTION_IS_EARLY_BIT'))
> >>          except:
> >>              self.SECTION_HAS_MEM_MAP = 1 << 0
> >> -            self.SECTION_IS_EARLY = 1 << 3
> >> +            self.SECTION_IS_EARLY = 1 << 2
> > 
> > Seems a bit strage given the code is:
> > 
> >         try:
> >             self.SECTION_HAS_MEM_MAP = 1 << int(gdb.parse_and_eval('SECTION_HAS_MEM_MAP_BIT'))
> >             self.SECTION_IS_EARLY = 1 << int(gdb.parse_and_eval('SECTION_IS_EARLY_BIT'))
> >         except:
> >             self.SECTION_HAS_MEM_MAP = 1 << 0
> >             self.SECTION_IS_EARLY = 1 << 2
> > 
> > Whereas other variables must be available with no try, e.g.:
> > 
> >         self.PAGE_OFFSET = int(gdb.parse_and_eval("page_offset_base"))
> >         self.VMEMMAP_START = int(gdb.parse_and_eval("vmemmap_base"))
> >         self.PHYS_BASE = int(gdb.parse_and_eval("(unsigned long) phys_base"))
> > 
> > etc.
> > 
> > Is there some weirdness with gdb? Or is it maybe because there are some configs
> > without these symbols maybe?
> 
> TBH, I have absolutely no idea and I was asking myself the same thing (but
> decided that I couldn't care less about a python gdb script).
> 
> This code was added in February:
> 
> commit 55f8b4518d14b7436f70defe27faba4eca0cd4e1
> Author: Seongjun Hong <hsj0512@snu.ac.kr>
> Date:   Mon Feb 2 12:42:41 2026 +0900
> 
>     scripts/gdb: implement x86_page_ops in mm.py
> 
>     Implement all member functions of x86_page_ops strictly following the
>     logic of aarch64_page_ops.
> 
>     This includes full support for SPARSEMEM and standard page translation
>     functions.
> 
>     This fixes compatibility with 'lx-' commands on x86_64, preventing
>     AttributeErrors when using lx-pfn_to_page and others.
> 
> @Seongjun, why are these conditional and the others not? Trying to support older
> kernels?

No. TBH I didn't look at the gdb script carefully at that time and just 
wanted to avoid a symbol lookup failure. 

It would be better if we remove the try statement.

Thanks! :)

--
Best regards,
Seongjun Hong
