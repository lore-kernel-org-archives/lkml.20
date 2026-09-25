Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F514BD341
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348328; cv=none; b=n8/mjF05qIy4pDfotrVAJZb+DIRH7ESrxTKyOI09Aiiij9+aYQykNxUF8eucSupt6Rh4j0wVH9V28ucehXCsiBDQsNqTtWNlNnFNaHEZmDlKrrYNA14YLqbTS5XO2iG3RSOQgCzmzJROnZGjraEodHf6tzrCjCckgp0uu7GA+hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348328; c=relaxed/simple;
	bh=Sknz3FdFSB6JPY2cqVQyaPIiINy7RpwrClA0JIyd34E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lEZBFuDzzD+RRQpiGmf2lD1O4m9GqvnHkuevU+2ZbQqX6SHuj/QABkCuZALJNFDFFdrpwccD4qzx7Ds8LNHZZUwJmrw6Mvd7XTGS9LCN6/2nobnXK9vkQrENO311KWEkrg1xsY9lUPgmb+Uq/6lmxWrKNJV50yk01Ch2v1yDVxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BrwtVUIH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BrwtVUIH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so5840145e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790348321; x=1790953121; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3mmzkhyErUd9nhmX6bMHHacdtyTPprVFWqekxL7BwQ=;
        b=BrwtVUIHH/QB9hJoZlLViL8IdmyIq55QgfqePQ8NVStLrD8NZL8AmZDN5LXCtvVJnx
         FOh5qUHNbUFHZuW6+RKQbioe5L3+Ld/qwnkazUm7XrISI+a7aBz2cAnpbtd/2Rcf2iIg
         NwgrwwXfxgYPYhnO/IaTf9Y0QsGc9ts29n7u4HqcJ5kHYU0PKD+uUA5tRcWfhrKOj3qu
         XvUaGlLJfd9erwX3XT+fnv16uoifzhSeszP86Zlbt7prESE5GsnZq1RpPznJwkMY3/3n
         nQc49tERyQUAf885FeN+sZoj11iZWWEQCascaUbFloGe4bHgj0NPoMLHkT44clCJD9uv
         dang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348321; x=1790953121;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3mmzkhyErUd9nhmX6bMHHacdtyTPprVFWqekxL7BwQ=;
        b=k97Cu/hN+8srmUI7tJVY7l7GAd2+upbQIXQkXylSlZrrYGGD4CXbZsOJIeoYls60xU
         OOjRspeXxfvAtED+uwlOPLFX6p40qp/cSZ9CLmRtiBtx26MR/ZVW9Lps7UPWq7rp3uds
         4YmTt3tSkEYo62AnQTU8dE4LUeOmwBy7V9kMU2qcIdiLLeveT1xBdhbz9Vk4ZY2Pm/7o
         odD6QPpsJHccMKjvxyXqkfaxGwiuYfKoGGDjyy9oQs8pFPNcLlJdE32nWdIn6cn5Np2Q
         8QEYrIQxPMUH4etmWOmFofwyT4k/iWEJzzgFYHFzUN3nstu+rzeYYgKDLCXaw3c1DDs9
         TXXw==
X-Forwarded-Encrypted: i=1; AKwUvByTMeBzKvHSdTg0bzlgrORFkwEd4a5VVJCLo3X5CaZQ8hWKp9RiYHWnPBoupsIoJUviAOd4VXxs000uAl0=@vger.kernel.org
X-Gm-Message-State: AFuF++mKj1wWz2u/zmwP31gfovRXphji0FwoOjAxnsfI3Y3FcukbD+B/
	DQ4eeb1IAeAiiYCIzjtAPs8uUSUtfv7h6AEuPyBgGwnFhgTHDzfojyvDDh9Phdm3Mww=
X-Gm-Gg: AYBFou14r2TZNNkYyajFfwavxbIRCs2mrVASC8HBXEe6DTjzUs3NgbNasrqkuEYSvU4
	orUOEm9bFgHmLyJGOu/VmunMS6c5u+ZX8kJp3HvUt7BJTxXFbQywAIoRNdr1LbkPW/4fsAD2Wzd
	Mgpbo6NMHEzkTRTw/4+l7XTA/oL7Z9vOEhPrYLsqfad9J+ubwehMXSvD32CJuFGTm57v0mCveli
	p68RGkndVvj2wG3v/ddqoWmXkbeOoZP7AwoKVcObe85U+D4hcdAPfRwkY6fjljXrlUF/IsA96R4
	qKKq85VFroNL6b4fiv0xLOhi9L8T+gLn+M7redvFqe1cZKJvXG9mulHjsLfIZFsADa2RLEgQyKz
	sgVB2HteSNgjC7JZTKK1Q872yu3eMfmDxqQykOgnVs++67H4HKurGDhiAC5q4k8Rvz/3IWl9l7s
	+mdUd/y33HF0aJoiFvTKAYtHWMaP23zy9vHRjkWyE0PGk6nrEvk3fOWUAJ4GvJwHzAdX7/T++jW
	BU/zmKiz4MfXz6Y2Q==
X-Received: by 2002:a05:600c:154b:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49fe66c863cmr109626585e9.6.1790348321076;
        Fri, 25 Sep 2026 07:58:41 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff13b3c58sm27350435e9.0.2026.09.25.07.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:58:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, Alex Elder
 <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, Haylen Chu
 <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 0/5] clk: spacemit: preserve and safely synchronize
 firmware PLLs
In-Reply-To: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
Date: Fri, 25 Sep 2026 16:58:38 +0200
Message-ID: <1jtsnd74yp.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 09 sept. 2026 at 22:07, Troy Mitchell <troy.mitchell@linux.spacemit.com> wrote:

> Firmware may leave PLLs running with valid settings absent from Linux's
> rate tables. Replacing those settings during clock registration can
> stop CPUs that depend on them.

A provider should not act on the clock on its own. 

>
> This series removes the init fallback to the first rate-table entry,
> decodes hardware rates directly and preserves unlisted rates. Opt-in
> synchronization applies only to differing parameters for the same
> decoded rate.

Don't think the provider should be responsible for that

> It temporarily moves mapped CPU consumers to validated
> PLL1 branches and restores their parents after the reprogrammed PLL
> locks.

This is typically a use case or policy choice that belong in whatever
consumes the clock. Your DVFS driver maybe ?

> PLL1 itself is not synchronized, and enabled outputs outside the
> managed CPU paths prevent synchronization.
>
> The series also corrects CPU divider and shared-parent modeling and
> makes MIX rate selection agree with programming. Runtime PLL rate
> changes still require a stopped PLL; automatic DVFS switching and new
> rate-table entries are outside this series.
>
> ---
> Troy Mitchell (5):
>       clk: spacemit: derive PLL rates from hardware
>       clk: spacemit: make MIX rate selection consistent
>       clk: spacemit: describe CPU clock dividers and shared PLL muxes
>       clk: spacemit: reject rate changes to running firmware PLLs
>       clk: spacemit: safely synchronize PLL parameters during init
>
>  drivers/clk/spacemit/ccu-k1.c     |  60 +++--
>  drivers/clk/spacemit/ccu-k3.c     | 137 +++++++---
>  drivers/clk/spacemit/ccu_common.c |  12 +
>  drivers/clk/spacemit/ccu_common.h |   2 +
>  drivers/clk/spacemit/ccu_mix.c    |  35 ++-
>  drivers/clk/spacemit/ccu_mix.h    |  18 ++
>  drivers/clk/spacemit/ccu_pll.c    | 535 +++++++++++++++++++++++++++++++-------
>  drivers/clk/spacemit/ccu_pll.h    |  43 ++-
>  8 files changed, 689 insertions(+), 153 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260907-spacemit-pll-init-c942bb249244
>
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>

-- 
Jerome
