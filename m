Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0483503BE1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797097; cv=none; b=lTMWflyQH+L6j+y8yjx6I76nL+3JaLSZQLOn4TUmYfDE881UcwSOCdhpJ/QRBE0ZtqMchquQ4qsLJSoa7XQMP3dp3QPOyjj5Cm0iU8WzVaTsKPnkWm3HELZcwc3+3mRY8ezqNLKYKz+gjrQCj2G+5YEl64GlpaLCSBI1vlv1JZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797097; c=relaxed/simple;
	bh=7oIcXSH1gZ5pYqSF0p9nTlhpOlZssCHFCItFtSVIiEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9IsH/57MChweH450PBnNlVWZ5RMdHVht8ksWaWoIukOPg8UPfjU33FDerI4H8NNsKS3m4iN9ppxfDoyiBu+e44R86E0joFfThP5yAbIjeUWjeUUhYzhWuDt1v9QjgbX+yy28/U5mXyR1frCGsmVgS3rZrZHg/2YrUTWBjsmU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mOUSZR5a; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mOUSZR5a"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9399798ca61so220503585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788797093; x=1789401893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNnTBID4g9aytHQLyfm+JMBPPEsDRdj9xryUeJJj4sA=;
        b=mOUSZR5a+jKgEMol0Hs8T8xctZFoniizjw9yko8/lHt97hsjjdfh8H7JdITzhH6RcU
         5OvNOf0yAFXzE7AuVTc9G7P6IvObGFJwBL6dex1xECb7ayQfii1sudbg/Uun3yNd36oL
         sIFj/I8mpNtpWcxQzh9C3hu1H5R5P6lRSZfaHzqCopL+6JqQh36zGC80U4GzPsB4D1cw
         FL56uRQUPbCvEVLlOibqAAV2R8gtzVn7Sesoep7Iq3/ncQeP6LnZr3EMAoGbFwRlUATS
         llI5GxdxOcd0lGXTrjb7r4/4oIpXZTkGE3yB5B3dWUWjuPpyd2V3cIxRi39qqHL+eJ0V
         HWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797093; x=1789401893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNnTBID4g9aytHQLyfm+JMBPPEsDRdj9xryUeJJj4sA=;
        b=FWZGWcYP2tNCAHI2KJ7g4OS8Yr/Sy2HmWT/9XpfrjZIEc1oPZEqhPY2nQJ1FGzOcK6
         dTr7v3+5xFIxc/FoAYK2PnBF0vUcFxOpBEgJhw/xwZt1sRVmLTEEWwzt+DiEZLmTfyjf
         3s1zLH5jvRKRC4bv8NNAuV39kKegBNgF9LPLXUMTukSFKiMNrgbglj8dqzIgNQOq0Gay
         kQguwzcYbr004S5hKOJfy39bxZAKtlcK/2M0rR1pT9mOvWgHS7TSymm9gE4kam2DE+cB
         YHe9ZlqUsN+XtjCad3olFuE5TIKGcrLwVA9aC5lCwGNtfvjJ1sX/NIInIJ//gzh335c6
         7KTA==
X-Forwarded-Encrypted: i=1; AKwUvBzzAjkmcROpKjTDt7xr/aiV19E70b0eUaPSBvhRPbHo5mYMb7blWH+mL270HjKR/nF66jgIbc9VKfPAikM=@vger.kernel.org
X-Gm-Message-State: AFuF++l9Ynab0MwgXVdAKvval2YCexI2So8VZ+7M/zAPp/SDtJ/nEo98
	kuWLhHZZj/mzqRalxvZIV/PsnDaNZLHpvJJeNVADmVhqsYH+JQZBzs+jeqmooUmTjcA=
X-Gm-Gg: AYBFou316sx0bc+SYN2psbpBWPy5icD0wP4VpwoeynO6s7r0ZyqU/HRRijOZYV8tQuH
	VLbKBCdrRJ1GV5mKjrjZXJlXdjoQyfcjYyAEbvN73qu4OKtvITXbEGLOh52bYzj4smeRr6lVncp
	2fbH9wIbdbPhnQZCz/yilpW+zD264Nq1oRYI92YtdXDWQjCo2F5O2pQsazG7y+rhDAM9Zv5Qwil
	PMajU5vNpjgIaNpGJtbAvMkVVgZMO0ndDsuL2bmjMIyOhp3N2kBUdJQ9SDQZUwaaPUpEr5b/hBS
	UBz9jB61uS0iC+KzcAk3iUfMQr63k07bx+E5ObZHl0oWXbnO9DsMB9kwESjvZoDwP9S6ucXFvei
	2FRSn6YA1oLK7E/YkVPYcZcira0WCZOpp7cPINSnPMxDYvD3+hzJha2cV91VbGuTfSaUnlpXT1T
	cF4xGuRL2KwlkUJYVQMeBtieT4+2x9b1agbb9sH3UCy20Ig3uRElVMfWG0Dd79qIqRfyZiRQJpO
	4eVdfu4lNQJ4kzFcuMoEZNZiqSe72ktefQSW3JlTtc3
X-Received: by 2002:a05:620a:a38a:b0:939:f89:3688 with SMTP id af79cd13be357-9398048b90emr1959600685a.42.1788797092662;
        Mon, 07 Sep 2026 09:04:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbb70f1sm932389885a.40.2026.09.07.09.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:04:52 -0700 (PDT)
Date: Mon, 7 Sep 2026 12:04:50 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/6] mm/vma: only permit MAP_PRIVATE /dev/zero to be
 mapped anonymous
Message-ID: <ap7fOu5DHkKtqlkg@gourry-fedora-PF4VCD3F>
References: <20260902-map-private-dev-zero-v1-0-a578c730cec7@kernel.org>
 <20260902-map-private-dev-zero-v1-3-a578c730cec7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-map-private-dev-zero-v1-3-a578c730cec7@kernel.org>

On Wed, Sep 02, 2026 at 07:00:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> In order to use mmap_prepare() with MAP_PRIVATE mappings of /dev/zero
> without the success_hook hack we explicitly permitted mmap_prepare handlers
> to set NULL vm_ops.
> 
> However this is dangerous and we really only want to allow this for
> MAP_PRIVATE-mapped /dev/zero.
> 

"this is dangerous" -> can you expand on this?

I had been experimenting with mmap'ing kmem dax devices as a way to test
generating a driver-defined efault mempolicy on an anonymous region, and
this exact pattern came up for me during mmap_prepare trying to get rid
of the "fileness" of the VMA.

Basically looked exactly like the /dev/zero vma.

I understand this is a hack, i'm just trying to better understand why
"this is dangerous" and it shouldn't be a supported pattern.

for clarity:

   fd = open("/dev/dax0.0",...);
   buf = mmap(fd, ...);
   /* 
    * mmap(_prepare) callback marks the vma anonymous so it takes anon
    * fault routes and sets an mbind mempolicy installed on the vma to
    * prefer the node the dax device is registered to.
    */
   buf[0] = 0xDEADBEEF; /* faults an anon page from the node */
