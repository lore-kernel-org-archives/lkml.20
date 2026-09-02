Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04144AEBEF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368428; cv=none; b=f2ZKbtQ1QDdwtBRxczhAVVsL7WcfkSNjjm38rrHI+QO2OgqRoaDcQxOfisx+ZMMDrK945dKSVS1CR5KxAh78sqg/YQwL/cTkdwsV8+AUEsQHqvbKylms1SReyh3pb8wHiH5/3EMoqzdq0EQtrRKEEEWLtK5PUIIjzooADvJ+5A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368428; c=relaxed/simple;
	bh=HJm0f1TBOXXnDZ8FSFPGdVB7n3lz/vSqJCqOGtS0lu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvsfmI3nPRDoyzDs/cSm3uYEpgW/7V5RqwUN6PTuylbPIt3BjvxqLzr77TUnbjH21zh0yJQEilfhoG+1px/ofweWUt2JSoMUxLuQGWjfQeX6Utrbly7mGPAtEDMbfKBuQb0fIcLYPcodEWt6kv1XuTULqjs0pGchDPLsCjG3BTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wehbb6+V; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wehbb6+V"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso1426598f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788368425; x=1788973225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qwirF8YS4XS5WYBuAAukyT9KZnZ3AKCmccSFmPzUas=;
        b=Wehbb6+VvlApMCGdTUZ2ptS/JCNaIP8vaPS8OSc2BRUnXxXiHCrseeOmDMCHoR2O/o
         rw9pi3M0gh+Sh62Z0R6aaCznqbVwhPL+AKsCHsVit1vJFK5KXdF5eByM4JJprtsFArXu
         5P0pXYHX3Z6bsXdSr8+5c3cbpRtlNzzhA7DI5rmiciZNTa+P4z7bHFxg3g62wxiOLtOr
         hgXBS4JACxrcoUYMnvyGkcl9bvkx3sVe4gSyCMN3XmqM9+Dw+BoagVmPpMQwdTW4cXir
         OKqrSiJ8WkVR9sKPf9KMfK6wEU1reAUuNVrD2oI53cEwnIPDmVerS4Xb3eK8GoTkIEWR
         F+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368425; x=1788973225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qwirF8YS4XS5WYBuAAukyT9KZnZ3AKCmccSFmPzUas=;
        b=dhRXt3gFbC1EG/7spUIOURWEDo7393ZFYj88FFG63odE0cW9O5yeP6qM35Q3mMlBdP
         ZU9SPnBdcwm6cAErrVsLkibj5ekTE0KKKNhFHk2eN8Ct3tYGnKURIHFTiCymZmt7Emf8
         Nc+87ZTXmkfQMVnzqvqe18cggxFz9CZAo0tj9DpmtoAN0Gja2pYr9NYmUiWg/viVyNRU
         r+Pgj/rEt/VoOSULeBopGjXlV2WL0OZ29UGMps71fF+ZgUJm9+E8eeVWMPgtj788bSmi
         TguiGKXjv1B1k25rGYMHcW12hf8cAqBDZCB9u1+GTJld1dSwOlpY15ohU1iMbb9INnUw
         iojw==
X-Forwarded-Encrypted: i=1; AKwUvBwcMGerGuqq+wgI0/Wk5NV+IdV1SNbRXm7Vb7ysvQf4irVUEM4fTSd/mL4ou5k5KNnyy2EUBmeBVTUqVf0=@vger.kernel.org
X-Gm-Message-State: AFuF++kPUwOpmhlerwptBnJzwuNovIlPidG0cM+b5PIbkX2g6KFSZFFo
	Vlb/Ii+mEKf7xT8BQPNEt/uW2aCyGvX6fqLDYFZ3H+nlYWtnE7utX2hw
X-Gm-Gg: AYBFou2iCERPwRufdsQVDhYYN7NhBEMbQp1aP8ut7QkmGOKNTW/8rSpVZYFFuietngM
	EESziK10gi+Mzxn2J8/ezF+gfCoajKjTGHEVjXmxmNCFX04YwL7VWopSRMtnskCYqKTeojuyhCF
	XXTGl1CwZmV+Md522QJ/Js6DgYvId+u54UXF1tyJuBS0hs2FMjZZornkUUUGvqMgsVjxQYVb73C
	lIbHAJJDuXjAg/yOofUXp8ShV90nvW6Py6iaGSivMwCSCOA/bglFVv0uDHWf9ZxZ4ms89TXv10t
	V6FCYp77CeE6isNpSvgu16YJOUW/tHUgQHuEu4/VFqysSsZpCfUpuxdKdleSIuEiS9ATXDnB2G3
	GTmYKYC22ver+HwLMjzKvje7Awa5c8bNQWSWcpdtanKMY5SfbNsMpoxTVVFBvh7k21+E8NJBWNN
	RVJpnudYd5VEBkfn+1xHicqZNDHtUuFqTrPmlnyGcXoH38qmhC1ABKhkzIT7bUzZ0Nhhci36iep
	jnmzxLY2hfKIt4YFhq4uIbHMf2PIXexZLjZ51V/Y0y0emfzoFXW0W2WHYztjJRsZxiwhLF0LUjE
	BdLUm1S9+l8nREQrG33TOVByf+7/tzMMW+4=
X-Received: by 2002:a5d:554c:0:b0:482:e6ec:4edb with SMTP id ffacd0b85a97d-48488f1b148mr8670058f8f.15.1788368421495;
        Wed, 02 Sep 2026 10:00:21 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-017-232.77.7.pool.telefonica.de. [77.7.17.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2edfsm7345851f8f.23.2026.09.02.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:00:20 -0700 (PDT)
Date: Wed, 2 Sep 2026 18:58:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <aphUkaF4mXlxAuCm@gmail.com>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
 <xwyaihtgvjonk4wqmllsnzkq2ch63bhfzmvh6353ds6tpjuaww@lmu7ltps4il5>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xwyaihtgvjonk4wqmllsnzkq2ch63bhfzmvh6353ds6tpjuaww@lmu7ltps4il5>

On Wed, Sep 02, 2026 at 10:08:58AM +0100, Anshuman Khandual wrote:
> No user-visiable failure was reported even without this change ?
> Missing TLBI as seen in QEMU is the only clue here ?A

This came out of an experiment to add warnings for architectural
details that QEMU does not normally model. The checker tracks guest
page-table writes and TLBIs using a shadow TLB.

It reported 3072 contiguous PTE transitions without an intervening
TLBI on the unpatched kernel, none with this change, and none for the
already-flushed write-protect control. Together with the code history,
that was the basis for the patch.

As noted in the testing section, no user-visible failure was
reproduced. 

I also tested an unpatched kernel on a Raspberry Pi 400.

The Cortex-A72's L1 data-TLB refill ratio was approximately 1:16 for
the 64K hugetlb mapping versus a forced-4K control, indicating that it
amalgamated the 16 contiguous PTEs. A contended test still completed
85,396 full-range permission changes and about 2.8 billion reads
without a fault or data mismatch.

> But you have not seen any real TLB conflicts even on custom QEMU ?

No. QEMU does not model the stage-1 Contiguous hint as a combined TLB
entry. The added checker only logged the page-table/TLBI sequence, it
did not change translation behaviour or inject TLB conflicts.

Thanks,
Karl
