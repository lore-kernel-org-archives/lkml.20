Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A05335B7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956861; cv=none; b=QzHUlBwVbDZKZo8TxYzTbKXu8LYpI21WrJzhH7F/wzgi5QiT7tz75NlJNWrpYusM+fbs7meGeyqCnU0AJzVc2eghS49hFV/TpRU6o/nsEQ/X2TJlWw7aBiC8aPIi1sGPTlOn/H0/xuMODHwqLN7RO5iuQI9u474fFE/leMZHhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956861; c=relaxed/simple;
	bh=cXtcNvW+hHjgE+kBCwrETYZSKk11SoOD59Xl9Jci4TI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEfEkU2KYaMW796mFXZEFqkPxBdSt+nkvdAu7p4O5ORU5jQZtEfxeNSOGBP7G1AvnbeEmU5WYgPurbTbyWfpta7r7P4KL2Zisv34s9iyx+0nEvDYbCiJoN1dGr2MB5AdBfVCcofybdXY/deLDTdxLtcCqZkQHuRGJzXVQEsaHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdYNE2cE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdYNE2cE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482dd6ee390so6442144f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788956858; x=1789561658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fNb37xWCW/T188cHOe2lrBK44SN8Frxj8JBix8SU6qI=;
        b=mdYNE2cE7w+ECGxOeMY0tNk47DpQ+31GpfqucF2KY1ZIMcqWGcOah7GiRtUVIWZiO9
         RUBXeeZViwvL/OfpgyfLCIdVyPuZWJ/wM4tWKMv4ksdLVgzVM1F8VVBVxNPQBEs3VYJ0
         ytjtW6rrXvfSBOq+O6aY+KcWdLcS+iJ9ue7j2iuJuK15RH645UHIiWzCwBymgjOTTqYt
         95ZSgG2AFaM9UyzU33GEnxv9a9VtI+IXetzAwf8v7smd+Rmp3awCbWw4LmJVIvGQEEHj
         O8B5Z7oa0qEW3IhTyqtlytr/tFaibs0Ab15AY+MyVcFLfQxyTUnlcCHHM+c2gmeCkLZ6
         knFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956858; x=1789561658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNb37xWCW/T188cHOe2lrBK44SN8Frxj8JBix8SU6qI=;
        b=ZuCdBwh72YQrI/Qpw/3gaVZqD2gEWqpWpx13n3Afnw/p9KZ3Ohu9eu/Fn2Ph5CyIiz
         joFGDjrtgJ+y0o31rV497bggeI2BclwFHetup8KKYCfNsww4hu1hlpLU4qArfaUQCnb5
         uOL76ejCNj6+njpOi6usA2w1ulkqrqKzGnmGdl8E4eIaL2w2Lj6MephsIq/nEV+SLxTe
         bexcxcwplTcneMdnUMVcF1gbJJPGo5EFoVAtjC/aEe7wl7AYptaL9UTKbKtEHw97Cvdb
         X0QYrOVaODf+ARnkx5E5SsI34CPaLP9qQolCPL+i/DOB3qg9UGsAenIlYFUqajKhYuMw
         VOpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6Rx3lBCT8FKzGBoy1hbCj/AEtELnBuzruAG9Wpjc2ruOXMV76tq0TRDnzdWwjfpJImha4OgSsF5jK3Ec=@vger.kernel.org
X-Gm-Message-State: AFuF++l8bbk/qnl8PR+UmtfUx5Zq1FvqUkGZM+WSVR7GZqCRUy1EWiO7
	i88UdWwNLQ2OtHr1+NTkf/mijRTlIuskkWWM9RawhSUkLbQIMglTq475
X-Gm-Gg: AYBFou0yB5n6Mi5j1Cv5YpdYqcMhSdTihpQE3FV/EhZji6W3WXUwe2WH1kRuURh07Ix
	KaHiKdCTKbY+/d7cpKl5PPLsAuR6N+UuEkbxILUTRD2xxdquP41WGO9by32hKjNiBgSMLH/f9hy
	yDgO8C+aVYSGDHg/opZ1fdDpuHFEcqyYjuaLdR/y1N/jIANyL3aWXGa9WaOzrSelT2OqXRwVwNy
	34tPhSTMZ6vi1fKAeqNxLAV/ZrNBWD0HoF+vpFsWHxXJ0fEb9brsojinAdcBIeDK++WVQuodzrS
	iAyt30LzlMptD+TJDM9GfV9Mv9orBpO6VdeJQjdLGS05tHWiVJEgC+PQArDc6Bqzt/CDevxGtWe
	tMEC1yqQg3E3xNWv8rpZGaR0XBlwyBKoF1Jnwyyss+rg2dCgfXOI4+Hv8guFhNukqPFp2gCK28l
	t6JhOk/YagfZkmXGbRnZX/iIIlQpSjLfVm7GjFy9Q/4bUd3p57bgZyQhrnMMkQU/hs5m8s6E1Fn
	F4JDY8BY1Gd4w6rXH5dYw+YA10ajqT2nLoI
X-Received: by 2002:a05:6000:715:b0:485:8c16:a343 with SMTP id ffacd0b85a97d-4858c16a5e3mr30064053f8f.56.1788956857427;
        Wed, 09 Sep 2026 05:27:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bc74298sm39687472f8f.6.2026.09.09.05.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:27:36 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:27:35 +0100
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
Message-ID: <20260909132735.1fc1a309@pumpkin>
In-Reply-To: <aqFAOLrybtyo6dd1@gremlin>
References: <20260901190123.3511535-1-noren@nvidia.com>
	<d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org>
	<DL9XL8T6UG93.1T1NSJMI8PISK@nvidia.com>
	<aqBiVp405v2srvSa@cmpxchg.org>
	<aqEUdmYnnQQRC8yl@gremlin>
	<20260909113836.6cbe8d17@pumpkin>
	<aqFAOLrybtyo6dd1@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 12:18:03 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> On Wed, Sep 09, 2026 at 11:38:36AM +0100, David Laight wrote:
> > On Wed, 9 Sep 2026 09:11:04 +0100
> > "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> >  
> > > On Tue, Sep 08, 2026 at 03:30:30PM -0400, Johannes Weiner wrote:  
> > > > On Tue, Sep 08, 2026 at 08:24:38AM -0400, Zi Yan wrote:  
> > > > > On Tue Sep 8, 2026 at 7:54 AM EDT, Vlastimil Babka (SUSE) wrote:  
> > > > > > Given neither of the patchset versions achieved universal acceptance, could
> > > > > > we try just disabling all the automatic (re)calculations of min_free_kbytes
> > > > > > the first moment the sysctl gets adjusted from userspace?  
> > > > >
> > > > > Sounds good to me. Johannes, WDYT?  
> > > >
> > > > +1 That sounds good to me as well.  
> > >
> > > Me also! :>)  
> >
> > You might want some method of restoring the default behaviour.
> > Maybe setting to 0 can be used (if that is just silly).  
> 
> I suppose the concern would be an embedded user for some reason enabling
> CONFIG_TRANSPARENT_HUGEPAGE and then defaulting to THP ->madvise and getting the
> bigger reserves before somehow disabling it after boot.

Or just testing whether it makes any difference to a workload.

David

> 
> But I'm not sure if this is something we really need to worry about?
> 
> >
> > David
> >  
> > >
> > > --
> > > Cheers, Lorenzo
> > >  
> >  
> 
> --
> Cheers, Lorenzo

