Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EFB39F17F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090552; cv=none; b=hcaQQn69AoX12Alcn39u1JNJR7SolB0YZHS/6zUU4jnUgkYVcRB8oezOmDWgkyN9O+FmKQwmGKRVnuxDMKkxVM7htEwiY/ycRvAH1crRus+OAo9fZCmbEcL6Ke7uwnL4hbab6ujBYSH/qNSo0qEQ91mdKFixGMFySjOsrC7lGQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090552; c=relaxed/simple;
	bh=tGcXrBtsOi9ErAV0pqEKLxwBX3gqpMOXxrG6oKEh2Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3jqs1eTdoUho4xnoK6jDd9Ir7IwLpC4oalZNYitp0l1nRQ1ewsRdpmCMpZQPxNeYfuoQHJZ4ZDiW5zO+bWfvwJVfqoTXzbgnaVI6c982o3Uwxa4anOwa1Tqq8jwWA0yF7A7sG+DncwoOOMg8wJBU1wZf2ekIv7ihtzEBo3hD+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=K9t96BAp; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="K9t96BAp"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104e54b1abso105436d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790090549; x=1790695349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+asX9Eo6V++D4JgVVikE/NaNyUA8WkaRzRJh4cn4hpM=;
        b=K9t96BApnERLu6oHY1opqgFks85DvplnkenLF5koaXhyNVundptE1XhSo1sO+tSPUL
         pv35TZxs4L96Hk5fL+43xi7lsLjSPTnwgcvcaYXY1UjDSyE/06T2EEpXlPmZzuOMMe34
         B9n5Y8OLV+b/lG2MEtBNUHH/+NYmBHpqYeci8KPv03qJ+xD+oQeC2RdlY8X0xCpjFbUL
         dcSnh+HXiKD+/+wm9Ti0Gv7CpvC8VR9TqIR6p5p1chPkDMmZxbPZE3ysO+T6ZYTTHaff
         97XPFaCpfrKZkyZILQysQFtJjglxi3Fk5eU7FqGMuQiQWdJmS74UOyvfctc8QhfoLgln
         0DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090549; x=1790695349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+asX9Eo6V++D4JgVVikE/NaNyUA8WkaRzRJh4cn4hpM=;
        b=gTmjFlp3xFL2k98wmajsBzlEIcQQ2QtIau6fxkcU2GT3xMuxYJ0nQVVcFVJzMVQbFZ
         XRH+IguT1dFU52R6WdaJGfvnnbhfmorNmRglXN35mPqkzNtqW555vgRrp5MtH5IBRNwT
         eifBXiWxBKJQcpXaYIv4VssBO76MXBAAmxnWm9exYBiFFp25q7t/5ls0AXexJxQr3faq
         LRBKQmtfM8cVwQhRcLAxPaAjWZsAucCMX+XNNW7F+uHE7L5OsSqWCdA+3q8dXzhY56OL
         hsonAu2/cGZ4tcYF1+6nbo/HnqxgolBouXilIxd3lab+otzhBLGe8FeHFE2fcmuL7Nae
         YVAg==
X-Forwarded-Encrypted: i=1; AKwUvBxUS3c6fSg+rB04jieVunD9y0Rb6+cJsEsI7FKoyZMR6qQGFXwUFQjsO4FsF47s9FILArxp5gQiwLfG8bo=@vger.kernel.org
X-Gm-Message-State: AFuF++m1+n70xHTmS0hDQ+fc9iRin/Xu3cek210L6qJH+1GnEnszKiHp
	l33Xw0C47XxEP58A0IOpLjDabfn2rDoFQjsCnuO+dvvdegAR+FbJusNFPjjcZ6iAUcQ=
X-Gm-Gg: AYBFou0Y0cmLdMqBqyirimY09L+EElBU6+Qcv+GT5nvXbKzWib4qUXQqdDPHrm5FyHr
	xezEiKFoNWY5QRpf9V1+LyzStHWR0C/ZKZ3qnH8NTtHDkiGq8GOVcSrHCFYN4FH/Csh6/IbWpOb
	P8yBbhnCVYGsu/LoA7f7XFueX3Lq05fbbpe9rgm7BOBDePmfJkh4nG33BTmLD62ZwGeXDY8/YnW
	Y1oWPn65NajpLT4cysACdSpgsSbeAkyr5HkXCgXuoCVjyQyQDQXODHPnZhvHDl66M1kEunWDY2U
	UOCAl354bkVGqPMKrVn96BLHkq3gD05F6pHM/m8xuXlZbl7HrlIqQcjNZrq7A1Pgc+3q6Umwk8T
	F21LEOe0rDtrAPT9dzi1KxETXWhodqoBnA3U5X26o//qfRQheuZxT9rj+qzXd6bIAzYcIpRvVLA
	1zR7gKZ3686NvmYuHNGNW5vUp2rMNE+x5BnY1t67HaFT6o0cxEb8ALndBc7NXmzEn2hBeM37pIm
	28JUqrw7e1V4jK9Q83CXcNV71djKHuaHtxhyYcNAgx22MdsyGD1SYLeeLqKVYt2bg==
X-Received: by 2002:a05:6214:8501:10b0:913:ffb2:e8da with SMTP id 6a1803df08f44-913ffb2eda8mr33729806d6.36.1790090549126;
        Tue, 22 Sep 2026 08:22:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250d233sm18031886d6.41.2026.09.22.08.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:22:28 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:22:26 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, 
	willy@infradead.org, jack@suse.cz, liam@infradead.org, david@kernel.org, 
	vbabka@kernel.org, jannh@google.com, chrisl@kernel.org, kasong@tencent.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, yosry@kernel.org, chengming.zhou@linux.dev, kunwu.chan@gmail.com, 
	tz2294@columbia.edu, hch@lst.de, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: drop MADV_PAGEOUT folios at swap writeback
 completion
Message-ID: <arKdGMrUixIb4spc@gourry-fedora-PF4VCD3F>
References: <20260921152449.629486-1-alex@ghiti.fr>
 <arJYmwKnEu-djZlK@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arJYmwKnEu-djZlK@gremlin>

On Tue, Sep 22, 2026 at 11:44:20AM +0100, Lorenzo Stoakes (ARM) wrote:
> > @@ -554,10 +567,12 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> >  			folio_set_workingset(folio);
> >  		if (pageout) {
> >  			if (folio_isolate_lru(folio)) {
> > -				if (folio_test_unevictable(folio))
> > +				if (folio_test_unevictable(folio)) {
> >  					folio_putback_lru(folio);
> > -				else
> > +				} else {
> > +					madvise_mark_dropbehind(folio);
> >  					list_add(&folio->lru, &folio_list);
> > +				}
> >  			}
> 
> This existing code is utterly horrible can we maybe do some refactoring before
> adding yet more functionality here?
> 
> I feel like the 'pay down technical debt first' take I had in THP is pretty
> valid here also.
> 
> But also, yeah you DEFINITELY need to separate out patches here.
> 

I will post my refactor today, sorry for the delay.

