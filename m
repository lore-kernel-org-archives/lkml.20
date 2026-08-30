Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CF62BD11
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788108005; cv=none; b=B8eBUkGZo8/YyBHilmjexsA0ieCOSkR+leZ9hgbV9GefxD00UhWlbTQWYXaY6Wol7dmP81bWQgiZwxrIoAsEK0+m6SRFYjFoshy+mtm4rZnvknGlzjLEQRtwSVBIkhEbSj66ln/FQm31X91YTNkIHWJs/NYLXV8J7lvDCSJ6Ojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788108005; c=relaxed/simple;
	bh=0KiJ/rsV+FI0hi6nnxeUYRfWHY02EDUbDnikrBsAd+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuMzNXrJztLUojkIsxtdLCqwx8V9m5Sp12enDCds2ru7di994hBJqsOvLpeTfk5DkiwkZWV5mNg1rmF/T/mUgi5Q1QLc/FKXipVyJnyfzB3ZnbAOuBnZgWbfpPwm9+QpmrzAqTXlgLYPXeMHcTxllkoXCVVB2P/FvYELxdNoAKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=r718lprH; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="r718lprH"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e57a753f9so278724485a.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788108002; x=1788712802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PokV92Wfh1ph78+DVYXuDrVLqAtkUu6EZ7/DX6OOMHg=;
        b=r718lprH/AYQltFVBRHuWn0Ls3PMZv3gZsFy8Ee/ERzpZCqaw1WYIp+yliinIr5ON5
         W4/l/r7CVEFD/1ldDd2jk4UA6FW/18hc0l+KgR9p54GQjp/JmmsvTXRuabpp46YNpepY
         qa6xIrx+wVmEBUBrGVn1ZnGeBVsuRGQZSBWuGfcPh/3SfITgbUCvxreIaaCFybkQlprS
         HgAIO8CvKBtAy21qxCsN0dU+aF2dfk/eMTczRS7WC+jxkZ/j0kO5aa5JGdoGpKuw3Ays
         xUnM5K5Ba/RYj4jcRUw2lfyVLXgfXzHFSqGAC9XRKPHIfs4AoBTIi3uUdjLwknmW5ZYI
         kVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788108002; x=1788712802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PokV92Wfh1ph78+DVYXuDrVLqAtkUu6EZ7/DX6OOMHg=;
        b=eY3Iya5Fpv1EbmsV+42FYc+G4Mvgg+e5icExrYsdMo/klVcJqJI1/AnJj0uGi9bD5o
         sZDqFJxeA/7FBfWq0UeOrxvtQOjULZzebOc+LuVp4iywl7odKScjMFOdQOt7Vju2npnt
         r1r1CV29NzHDjqTzY6eJW+wAX9/Emu2GIU9opcf+XM4/LMP75hxiaOEY/srSqbdbxzxW
         dvZ1ISgqZZvsmV+m0LHygK4XkdC2f52rQxLN6sTxJ+zreIHWeJ8RvDd7B04hmNUSYQp3
         dNfLS/aR6hmHdDG9n3/seFuTBB/UYtPKCGAItMbSuzMBaOgOfzFlgeAKWcQpZG0Onl4r
         RKWA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3mzE5C8EBK0hPYgW9+XhlS3gDVy7c5qf3rkhkO9FTpoeGxjci9OveNgVnlpLcywqG3qDAGfufe6mQSko=@vger.kernel.org
X-Gm-Message-State: AFuF++mSB1Y3ISA9w3GaNyJlL7QDRsmf4a+5xHgGWji3yPn5YR/dyoOV
	Mr/YKbgEGQv2Ohx7B4CDMgISKbrdm78NmOt39w5jHfI5ex44Ps7dROenZ4bRngPFfeI=
X-Gm-Gg: AR+sD12AYpGdZvPaEcmm4fCplsDNykuMIPBFkHmVn4xKjWHG5uFBZjcJYVbxOEjOSYx
	5/8mKHtjlZiBPctqWl4ZTJNu2djW186jbblAn7r56uP+1zU0Xsb9ZwnlDQy+y33zcy33zinTeds
	jmxVBJMAw83qUTFUwjoN52oWng91iEPpTmByXFr+1I8r9pKirO/aL9tAgDz8OMocL07DIEgsEYl
	opZHSpqt/SwBcqZ2VNHjvII9BaSZygubyD9PYnVonFQ4s8Uc+wlhNLBNfVEFZBV9B56HEdsrtqt
	mrSZbxvWuTSA1b/AabbQTauodrJG5BD86+WIVLr+SnZGO9muz/i5QsaSbSFeSuqQG5DgIMRFmBW
	9uMdrqOZ0iU8lDpixcfF2+T3vFXhcHx5wREPYv1PtPrUSAu/vL0CG8Bpn2SrD1ymkeZf4EAEkOs
	YaZlt/GXmNyMteGpnYCypWViiEhGS2UMIXLR1ICss1y/HjBQav+47Vk2DW2Si3gSiY/wE5MIykF
	50bEG2D2pFLeViRMtwTjiLvQIXRu5UQG1zVIpBdFx/O
X-Received: by 2002:a05:620a:5235:b0:937:5298:7820 with SMTP id af79cd13be357-939137b5b95mr2035043285a.8.1788108002384;
        Sun, 30 Aug 2026 09:40:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391725f916sm605301085a.20.2026.08.30.09.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:40:01 -0700 (PDT)
Date: Sun, 30 Aug 2026 12:39:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	david@kernel.org, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, urezki@gmail.com, chenwandun@huawei.com
Subject: Re: [PATCH 0/2] mm/mempolicy: stop copying state in the interleave
 paths
Message-ID: <apRczHobjsdUTChR@gourry-fedora-PF4VCD3F>
References: <20260829015943.1258774-1-gourry@gourry.net>
 <20260829161850.db162f9f99deb419f4700c11@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829161850.db162f9f99deb419f4700c11@linux-foundation.org>

On Sat, Aug 29, 2026 at 04:18:50PM -0700, Andrew Morton wrote:
> On Fri, 28 Aug 2026 21:59:41 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > The interleave node selectors and bulk allocators take copies of
> > nodemasks and node weights (for weighted interleave) in the fault path.
> > Both of these copies can be entirely eliminated.
> > 
> > For node weights, use SRCU to pin the weights in place.  This eliminates
> > a copy and a kmalloc from the bulk allocator path.
> > 
> > For nodemasks, we can operate directly on pol->nodes as long as we bounds
> > check the walk.  A concurrent rebind can shrink the mask, or tear the read
> > of it so the mask appears empty.
> > 
> >  - The interleave node selectors fall back to numa_node_id() when that
> >    happens, which is what they already did when a copy came back empty.
> > 
> >  - The bulk allocator simply returns what it managed to allocate.
> > 
> > The node count and weight totals are read separately from the nodemask
> > walk that consumes them - creating a time-of-check / time-of-use race.
> > Just clamp the walk to a single pass (number of nodes), and clamp each
> > bulk allocation chunk to the space left in the request.
> > 
> > The cost is distribution accuracy during a rebind.  The copies never
> > corrected for that either - they only kept the code from dividing by
> > zero and overrunning the allocation request.
> 
> Not very well, it seems.  Sashiko thinks there's a div-by-zero in
> alloc_pages_bulk_interleave().
> 
> 	https://sashiko.dev/#/patchset/20260829015943.1258774-1-gourry@gourry.net
> 

That's what this was for :]

https://lore.kernel.org/linux-mm/20260828193111.1023497-1-gourry@gourry.net/

~Gregory
