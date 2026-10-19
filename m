Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D749B5C1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400416; cv=none; b=iAnAuK7nBJGoZfIE8h87XmI5xSGFRpYqtOAYdlB1qwvfTAOrAn9BQ2NAgc5ZnDFu1UWyFSwl/eReuFQfYAvMYgsLK9uqnZxqu1pJj+ic09HH5XTw5KKgJyCc8yc0YqlMfn+qs2UsE2Nx33U5izWd9/A7VwckLaas+dDLrYpj3Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400416; c=relaxed/simple;
	bh=gpJsPC1bgzRrB21bbmuJR8Rh6on/+2rqdpt3atueTZQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aURlGVRbO6Gg3fnBnfTvBoiueXi3ApzMtroyfBFWSkEF2INZIIMezYXeTQ0KRyNXjZODXXgILySLs3oa5pwyynDPNycHg5LiBPVNfKPuO0vACKM6yY1YMPp7Yv4NrmjIdbiLAP0oyH8Z8x3SSUDHWpB37HV4XHx3LmGtNU4iGlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fN+BNRMy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fN+BNRMy"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b001cd92bso957635f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792400411; x=1793005211; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iKwgkkYty1GRm5iOvnB2r7jBXi8LeJAk2XCbdMUEAe4=;
        b=fN+BNRMy3yaJF/FdwdHvNcegyohj+tYdKq5C4xm0HASyVhvPDbU1EDEr8KYGb9eStL
         35KPdGIvCgw+ZmsdoT4ANr4M5YnMI/RYdhTvWavBKGcUPAMlqZkK/mca28btjllzL7MF
         kNnhvzXQr9JsFvK4yDIp76rKTUCgVVzcrutf7dCBh61cCI6EZ4AOrBLMvv7JQiaKaQNB
         NzfLhoI3WkpTkIBZ4sysnvKQLJ/6XzSiVWvtsjJqXW/n4NvPyh9qt0E8RwvCUBTMXNvn
         NSNnbyGFqo2U7j3rVgi4VCbHRaxnVYUPXDXRLFW+XljQvVdSzasK/0i/2/EJc3M7lfk/
         lJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400411; x=1793005211;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKwgkkYty1GRm5iOvnB2r7jBXi8LeJAk2XCbdMUEAe4=;
        b=fJ8vzjIkaTgSjlOXQF09zOUEadRNZpS765kjoZjgtEkHGxcqXugxs8rmogEfcZwNgI
         7aJKNcDfxHLXKTSmzH6mpyMhIxoYQWpl+tf/xSLeSWBvLirLFmG9YCujFxzhjGWzvQgI
         31OBCw10gge27kiWqmOPTeWDL5YsqHvwegc9RRICjiPt0fQ/8UvjGnk6oe6Ah5RjLG1Y
         7D87+bVxD1Br6iSvZjghJzY0K1ye1pWaiqvdFFUW2Xezlt/HrAks6zQ3fLZUKTCXfT/u
         glw7xJZQuxnuHufqFtyivRlr7FSUlncZ3SfhFTDC6zJ5mW/Z8xEI4pufmNVXj00pZ1Tt
         8cVw==
X-Forwarded-Encrypted: i=1; AKwUvBwUr6Sf++4aVqh0ggAlNiNLYN0XB7E4x1QCHLmOwGRTcgV+Y3EV3qoxxJ0XnOv6s3grg+7GVVptQS9SXnk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzSLkc6j+yOD4YOIQJsAbXf12AQf8H/LIuKdhhtDVIjFolo4RO
	ibtrreOVXgR0TdVHbzwYFqByMvHw0PrhOD2hI9vmsDvwjWZGAT+rP8qOo7I0homML7A=
X-Gm-Gg: AYBFou2ZCp0nv0PFPCLuudYtACyQbNm/Z/T2CuWfuc/gkjElLhO3amuJDpA3YFBFb0I
	kuFUktMjbBetH/udkRwor8ZYYmqoLMzjS0YNeCkXITwrvgdTzBZD5rkdN6TZysUSrmMEaEXvD5U
	BaqHM5PLWCCit4ps734uktpiA0impWso2V8xgDry9L+ILsS2aDYyqRyD0SIfV37Qu84zvy6kgvN
	VHJh2VYldSVO68fpHCDVXDdeb6CUfggssKc4kRnl5SAxjS+uLyz2LtkVBYW4mwWImEQJYsf+yMX
	TES6MDSlC4m9Vxx/WtqCmu6ZL6XnFfDhN88b6mW8La95RqhCMal3MK5/cr4l8+StYzvAoTJvyXk
	ofCiuvQGUPbB1E5DOkYdBelyR1p/BmhJwLi+te4VuE1JhFs5F9v9jg4CYeEgir5d0NhiRi0Uiev
	YH3a2uU8v9yaU67YV3fNjY1ny8mmZsYzKmVyAkuX2q3oRr/AWKbfkeQPP1OKx3uRH+1H52kYAim
	oJ2BqaYqEvjMLWA1edbjFAtDgZj
X-Received: by 2002:a05:6000:240d:b0:48e:eb5:4976 with SMTP id ffacd0b85a97d-48e0eb54a52mr9171721f8f.53.1792400411273;
        Mon, 19 Oct 2026 02:00:11 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm22649658f8f.55.2026.10.19.02.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1] clk: Free the parent map only in __clk_release()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261016164050.790594-1-nickolai@csail.mit.edu>
References: <20261016164050.790594-1-nickolai@csail.mit.edu>
Date: Mon, 19 Oct 2026 10:59:59 +0200
Message-Id: <179240039974.859276.7525896118303728782.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3516; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=gpJsPC1bgzRrB21bbmuJR8Rh6on/+2rqdpt3atueTZQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlX7wgbXi0WaJ2yJfaFwjrpOZo/D0zR4y0pffvhgon9R
 FWlDX8aOkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCR89MZGbpbZv963i7fPFn8
 3eGbJXwP9xxm/Bl/8U9N3MfMJdMsSrYy/Pdd+2B2c+WOiBmHDrnV3BF4fKdqcbLkk5olyzv4Y4V
 uTuMGAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> clk_core_populate_parent_map() can fail in two ways, and since
> __clk_register() answers every failure with kref_put(&core->ref,
> __clk_release), both end in clk_core_free_parent_map() walking a parent
> map that is not there to walk:
> 
>  - If the allocation of the map fails, core->parents is NULL while
>    core->num_parents was already set from init->num_parents.
>    clk_core_free_parent_map() only tests num_parents, so it reads
>    core->parents[i].name through a NULL pointer: an oops.
> 
>  - If a later kstrdup_const() of a parent name fails, the function
>    frees the names it copied so far and the map itself, but leaves
>    core->parents pointing at the freed memory. __clk_release() then
>    frees the same names and the same map a second time: a double free
>    on top of a use-after-free read.
> 
> Both arms are the -ENOMEM path of clk_register(), clk_hw_register() and
> of_clk_hw_register(), so of every clock provider in the tree with
> num_parents > 0. A user sees it when a clock provider's probe hits a
> memory allocation failure (in practice under fault injection, as these
> allocations are small): instead of the probe failing with -ENOMEM and
> "failed to register clk", the kernel oopses in __clk_release() called
> from __clk_register(), or, for the second arm, corrupts the slab
> allocator and reports a double free.
> 
> clk_core_populate_parent_map() has cleaned up after itself since commit
> fc0c209c147f ("clk: Allow parents to be specified without string names"),
> when __clk_register()'s fail_parents label skipped
> clk_core_free_parent_map() and only the later fail_create_clk label
> freed the map. Commit 9d05ae531c2c ("clk: Initialize struct clk_core
> kref earlier") moved the freeing of everything into __clk_release() and
> pointed all failure labels at kref_put(), so the map is now freed by
> __clk_release() on this path too.
> 
> Make clk_core_populate_parent_map() leave the map to __clk_release():
> return the error without freeing anything (the map is zero-allocated and
> kfree_const(NULL) is a no-op, so the partially filled map is freed
> correctly by clk_core_free_parent_map()), and have
> clk_core_free_parent_map() return when there is no map rather than when
> num_parents is zero, which is what clk_core_get_parent_by_index()
> already does for the same state.
> 
> Found by formal verification of __clk_register() against the kernel
> binary. Reproduced on riscv64 under QEMU by re-running a fixed-factor
> clock provider's probe through its sysfs bind file with failslab aimed
> at the parent map allocation: the unpatched kernel oopses with a NULL
> pointer dereference in __clk_release() (clk_core_free_parent_map() is
> inlined there), the patched kernel fails the bind write with -ENOMEM
> and logs "failed to register clk". A userspace transcription of the
> four functions reproduces both arms under AddressSanitizer before the
> change and is clean after it. The clk KUnit suites pass before and
> after on x86_64 and riscv64.
> 
> Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Fix looks good to me. Thanks for this

The description is a touch verbose for just few lines fix, which is usual
for LLM generated content. If for some reason another version, it would
be nice you could summarize it.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

