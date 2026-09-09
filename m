Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB152378B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950322; cv=none; b=kQht2tok43xAH3FwvqoM46njo8o8DGNSHa/Bq2EJdxa2wL4hohT0k64K+Nms3xmpi1rnP1/1lZrpAQjwvoeh3mj2Mqjim/hctDyqZFRFiTtnAjF3CFWb5NxMI9gSZqw+B8GgKq1X6JvhBd0HTuXFQqhqM/s1U5OhtjFKicvPE7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950322; c=relaxed/simple;
	bh=9cefRvIBAxUBEcSNrG+IlNxHvwdqUg6+a16RnNRBMbA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fL7HUrSo901jbEm08YcMEkTWO+lwualzvwltJuUPPKmH+XwPrGjbMSljmxnvPpGjDI0FsF2iQKy27Nw4MCc8xjDB0d6nRTn0XTZHJ5UUFHIIKjoPMSvzTd8PufZgvdYKmwqxP8gf8YhKeNxbKjG+1MA83uugpmlHxAYkv9oR+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GouuSPZf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GouuSPZf"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441fa5c37so4157400f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950318; x=1789555118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YYq3nS25jNBeYT4d+3FQsk1hbTFGTjZFEKTMaefGWuA=;
        b=GouuSPZfebyyhj/Vdi/Rc/4a7vkJnaEt6A48LN2fSdKdCH1R8VuG2rpZWbF1KY5FYV
         iY4ow+gIvEbJwaxcHvM1Jmw/+w/Yjm7hoCv4F5kU/lWct0V6bMWPPLDbY5wUVeyNYHjO
         UVp0DXMIkpMjs5PWcFMYaST8qEIRDY/Ks+i5bDrqqMtF91guo9hnHTqHiECextTQOBOV
         6fz7guF+MBjoIVRrqj+E6VcfI9pgmVtdybOUxBSXFsLvSp9Kfn8Jl9ACCJV0+1PwP9cF
         ZVaOCAtsU6xl9/9AuC6O46snMwdTDWY4xeawqh5g/yJe7FajM3VuN+tjuzW+YLoEDfHE
         CtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950318; x=1789555118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYq3nS25jNBeYT4d+3FQsk1hbTFGTjZFEKTMaefGWuA=;
        b=qVwB6eB6BVpSKxQ1M0j7Co9PxkpUEB2+BmO+65m6AWZoR3o0kmzUVrP3awObNQscuY
         GmWSNsHPcK38BGZ354JMYPz4fsoLeqGV1WHcD+zw5/9nOFgbf4MTmTvJy4REyFHePwAv
         aFIYYdCfCnMEiG/dI/+auHGVb8Fh2wNSej9dQ0zn9DAY5kd0fLN3jDpcV3I8KaC4C9IM
         pRE1OAbO4LkPsUNhuxdnndLZRkjxu7GFa1H2yeBx+sEV/CA5bctRWlJSAI+NFagxzmwM
         TUhgoXWj5zOHEG9pxTsLc5oVBDBxFCYQVIZNK2RLxrmsw14e0FKBZjX9+junWpNlqlvP
         Yz+g==
X-Forwarded-Encrypted: i=1; AKwUvBw7VBslBFbMcBQxM0tc7Af3B8h3Gc6n+gvqNV/haDPY5KruTnES34m1ynlo/fZhwnKnq/yJL9Htt6Tgyj8=@vger.kernel.org
X-Gm-Message-State: AFuF++lcOrSpItw7UMfkm4UFt3w2eHprquXB6VhBytqM+HQJBY8Yj7zq
	UAujQZiV1jjOetsvxu/wnkZ4j6GLLwVNbICCm5xaBs70mXTRzJfEdtdp
X-Gm-Gg: AYBFou0Lm9Q9qH+ujIHqYBVogQZ9uoNu+cjkiD3/SN1l+ty46R41xgKLbxZfngkD36d
	1HAWc47I8ebo6vKmttLtSfs5+q0G9SRzZnxut90V8U2CR/FW8SoxoHAfl7wU4x589FdKA1xNElC
	X/sDR8orhlu7G1/j6hmoUTN7sx+2mYKoHKZbi0EM57QMlgPYVk+uzTuOrUXcv/XCALuNLanQ//J
	F60bwzmKZcP5nThpZU7gYTJqrWM6miE9kvHevEG4/a4q2V/xJZvEwsp/+WzTFEFxliQhj4bunUf
	T9GTH87rns63IkyWvBqb7J98+7heZGStDviferLymS+eMcctFlEcO9MzZbPaDHWGPGlYn70DyTD
	qpXg+JFbq/lvEe7ocrYKzeuLjQWgTRvN1p+FSkeOD9BS53TmJrcB53QyZqZuES428TjCoiOj2Ws
	gFmsjpbD3V0IvTTALL3FB999sAA3RZxRi0X9V71iQzzfMzW+AgGFIR7MHJkFNtVAa+JQJSDO2Vm
	ptwxKAVnIMzelCgNyp0fwawnrsqaVImq/fMHVOcIsKb4Fs=
X-Received: by 2002:a5d:52cb:0:b0:481:51b7:290b with SMTP id ffacd0b85a97d-485872a7feamr29438228f8f.14.1788950318435;
        Wed, 09 Sep 2026 03:38:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm43514538f8f.29.2026.09.09.03.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:38:38 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:38:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Nimrod Oren
 <noren@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev
 Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang
 <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau
 <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Brendan Jackman
 <brendan.jackman@linux.dev>, Hugh Dickins <hughd@google.com>, Nirmoy Das
 <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <20260909113836.6cbe8d17@pumpkin>
In-Reply-To: <aqEUdmYnnQQRC8yl@gremlin>
References: <20260901190123.3511535-1-noren@nvidia.com>
	<d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org>
	<DL9XL8T6UG93.1T1NSJMI8PISK@nvidia.com>
	<aqBiVp405v2srvSa@cmpxchg.org>
	<aqEUdmYnnQQRC8yl@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 09:11:04 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> On Tue, Sep 08, 2026 at 03:30:30PM -0400, Johannes Weiner wrote:
> > On Tue, Sep 08, 2026 at 08:24:38AM -0400, Zi Yan wrote:  
> > > On Tue Sep 8, 2026 at 7:54 AM EDT, Vlastimil Babka (SUSE) wrote:  
> > > > Given neither of the patchset versions achieved universal acceptance, could
> > > > we try just disabling all the automatic (re)calculations of min_free_kbytes
> > > > the first moment the sysctl gets adjusted from userspace?  
> > >
> > > Sounds good to me. Johannes, WDYT?  
> >
> > +1 That sounds good to me as well.  
> 
> Me also! :>)

You might want some method of restoring the default behaviour.
Maybe setting to 0 can be used (if that is just silly).

David

> 
> --
> Cheers, Lorenzo
> 

