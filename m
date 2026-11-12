Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485707;
	b=ok+XpMPZIvy7rJ6kMLgBiIoutkWpOcUNpKZHzCk4WdfImqjgH4QeDLTgVMO9dyN5Hukj
	 Ajy5xUk1cBGSrMt9N2sXuXItnRhipme9zontby+XQi8UkXrWBWy+NJZqeABjGm5ozJT7Z
	 LOyHKBlKbVFUZDU/7UimonUKU4VO49gk3jc3lfpyvTW0fyEX0k2rvvP2UbYfF+mdPUlyW
	 VurfPzFPAmEE2LutQEj5+OcoeYNVhDpOKwITNWMbLqkXY5/w8JqXr/qAbuRI3BzxeNeke
	 zig5afbXQu90EvtSnMwzLI1MBo81sbipn7DObMIZZYZW+tyQv1iaFmRfzIDpz/tv9iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cpDaJnSBpbTWNByfkYn2gGCZr1PGzjLso15YyBRA1S4=;
	b=H10EImt9kp2ZxQDRcHHjsx+Mko2O/dYvYoWNrJQ4e3c+C4PtOISH/TKigZB/L8T8vy60
	 gcmqHNTvEufO5YUdLBMmllrKqJsT+RjEEEbs44QnLpRBw2O19g0UliTAsq0b1KKQmtHqs
	 sy3qBoWVQUzDajvnCoGvTUQwrgcCWM1N0GSZXaRqIfgFPia/0qmeDuQmM0q+3FcJUkSlE
	 T5mB1ktUNFbrEge6FbfKKp24Whkph17mzlIDmZicExEgm3NJ2FxZ1iNqV8LgloSS/jEEO
	 E568YHe1RNwH6sts10Gea2MzwozEfHCa4or1I+cgZe1XBYSgaRHlpXV8KQ8SGGW6j/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEdjqTVv;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7961606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7961606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEdjqTVv
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so4199502a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485705; x=1795090505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpDaJnSBpbTWNByfkYn2gGCZr1PGzjLso15YyBRA1S4=;
        b=kEdjqTVv9e23y8+9wgqsB2RBLZ4W9SF0zYcpvYN4RLdJ+gLxwCPGhyEh17e8tBAYTM
         NO7CY4W9XW7l2i6XuUfvfjG9vwc0kPk0kD7uNKPAs8n4EHFws6ywLsTWma0j12UATAyo
         cNG6VcdySN2sJl59CjCigzrSV3WRKgzRjunBmgx3ab4CwOMekvCTJbaaeRcYpANOPPjv
         uwFiXvS4VwXrEWXbSYKxqWq3H+SnLAj4rS8XeziKGhIE305AtDIdAR+mBf9iMK3hobtg
         oa5lF6DIbNTJMCuGZpncOZAaD4EuiWJfekblB6fPnJ91jm9LP3y/f3JjOc5vCVdoLZJj
         fSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485705; x=1795090505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpDaJnSBpbTWNByfkYn2gGCZr1PGzjLso15YyBRA1S4=;
        b=Pmt8aQOnvqm5kfeqH/bBb3nWuOWZ8WXfmkxdAAQJuuOWvP49S2M1m20nzO7jQ8NFUQ
         PVtvBb5UpntAH/KimOP8SAUi/83mwdXGdyxbfjfF4Xjr4zyNp0L5nApPKSKOn2Mh9mC2
         5xtzUNKu0zFlgUp0ISdgJ4QNz7j+rlpd2I2m5EZGBYVpUGxQiH/2c9ZWIIVc+oDv6fR/
         qzRCm0eBD9hA5ZTgTyIiy06LFMydsBGtY4Gs8hppBRowzFP1sPmhs72xdkeMH1zHubTN
         nGMvOsHTai5/Q+VjA3L00qRAgWhIh0FLILMfW3bgZmoME+LbkbMXBSNiJFIB8jdEAcht
         jcfQ==
X-Forwarded-Encrypted: i=1; AL+hErHLfjTASACMC3SPfp8APtE+EMjyDnI0Sjimoq1M5vDqr/WwgvvXTKcOAMWNYL5+doZCC47ZunQJmxRzYMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TJDEuJ7ocLYK6+IE6hC042dQZbnVDulSA1Kss5Q4b6RL5XZ1R
	V7WJu+EDMqmww7iGcpwcvpwC9jH93oQN91KPUBwikEdj3Bb+OpzqaA3n
X-Gm-Gg: AYBFou0xvp7r6vVO4kDJ7ITqmC/mY6q3ddk10M8kVEljzRPSsLSUf2O5lGJRa6DA/rw
	+/ACps42H/h9EAoWqY/yL2yNJCFGLhjxknaa5S/ATZxDnUa4w32cssxhbNt25EwKKIDJa6WvGoK
	74I+NC982pqGD0WrWcRBHmm1yhXsIbQ6NsRSH7EdaUPjE15znuZo5MJlfqp2aScMp8uqGj9Vp2+
	ohgDvY6+5+XTngVIXQpyBjsNLtRd0Md9sL4IWp3Pxyfww1V0+TwqZhYYBgWfsse+FBtnkpVQWd6
	haw7Q1+upzySmuTYsgNclKt2Nm0O+UV33cjBzVkSLBtqg7WEMA5sZckd4Y6gutFVzhx7uctIdeP
	R/+B1YFsn3Y7riryKuZwWoH7UTg/DAB1h5VuX9GRo9HtgGJZIKd3Wd9nLT1UdLinDcUtt7WZgUt
	U7G3TdvzV2YVDT8JUCNak/8IrucIJXhsfuQzpMnKwcr0V5n5Cp2K6GIhR/o3jk34atHBBQ7jSOq
	tMsPgfgH8rjfjKR4sVcH05v4TVIQUZXzTx/OVfhhpDMtZRVi96yESEKOBXfUGs+pbBUgg==
X-Received: by 2002:a05:6402:c4ca:10b0:6b3:c422:9257 with SMTP id 4fb4d7f45d1cf-6b777702f43mr2869009a12.25.1794485705031;
        Thu, 12 Nov 2026 04:15:05 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578d57c4sm3241614a12.18.2026.11.12.04.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:15:04 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 12 Nov 2026 13:15:01 +0100
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 5/9] mm/vmalloc: BUG_ON() on an unaligned range in
 __vunmap_range_noflush()
Message-ID: <avWtxcH2mKw7dgbp@milan>
References: <20261110112546.261415-1-hao.ge@linux.dev>
 <20261110112546.261415-6-hao.ge@linux.dev>
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
In-Reply-To: <20261110112546.261415-6-hao.ge@linux.dev>

On Tue, Nov 10, 2026 at 07:25:42PM +0800, Hao Ge wrote:
> The PTE loop of the unmap path stops only at addr == end.  With an
> unaligned end addr never lands on end, so the loop walks past the
> range and keeps clearing.  With an unaligned start the loop begins
> in the page containing start, which extends below the range.  Either
> way the unmap clears the mappings adjacent to the range, and that is
> nearly impossible to debug afterwards.
> 
> vmap only installs page-aligned, page-granular mappings, so an
> unaligned unmap request is never a legitimate teardown, and there is
> no way to tell which pages the caller meant.  Check addr and end at
> the entry of __vunmap_range_noflush() and bug out before any PTE is
> cleared.
> 
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/vmalloc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 86fbb1d2b27a..0565cbfe325c 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -518,6 +518,8 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
>  	pgtbl_mod_mask mask = 0;
>  
>  	BUG_ON(addr >= end);
> +	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
> +
>  	pgd = pgd_offset_k(addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
> -- 
> 2.25.1
> 
I am not sure this is good to stop machine at all. WARN_ON_ONCE()
and return?

--
Uladzislau Rezki
