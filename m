Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35B3C37AF
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791083222; cv=none; b=pLCckHXnYcubfZkw17uMS3fEcJkJfpU3tzdo4TlvcMT5ABOPFLw0begSOSdJDxZtj+1Thofq6W1O76XbsEVbKTo5OQT2ov3pd3XkhiaGxIzitdjAuVg6LdoOgVXjiPlgLpKxo5bd2PnocbYBdy9kib4OHymRlC1uTA73nXa3r2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791083222; c=relaxed/simple;
	bh=97w+wyZ4hAu1HtKz96oDWN8wbNGmXiBGOXZd1CtEwPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqv/y98h/0FJRyhRqZUjedyR/GW5evCbFT0k4mNi0X6A91S/XJr6MrVBg88LZX8fc22WSD2Bz8c+jY1fHnfFu5HzHUOXotda2HXputXWVmQD0JnGBr8OKGgPHWqGGgDOdvuS19lV8yVzO8zPUSLiZYpdkWLGuGgHd9KUImKvqow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esNvopqe; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esNvopqe"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a29bf27so232705b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791083219; x=1791688019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xGDw689I2nieuspdwl4thgn6puX+R1JqxzAeq5vzaqg=;
        b=esNvopqei4cqufxFq8JI2el58SZvD8t6JtDv3CgX9XCIdPziR/jTqzVNGsJBgpK8zq
         zdflu6iP/vs8UlIDCR4ITTBrT/bVmkN5X2l8BHATrnAhdvvD7Q/iiVIn+vy7BPDubaeI
         GMj6R6tjlOOCZTRhnwJengbA1Zf/a5QpaWD8qRnFwWswurAZiabhlmOa+Je49muMSf7f
         kVBvQxWjNdTNbrd6957UzSOyGApM+nK7443xC+D7dmYPp1xbjlLlmmtoBZD2IWUJnyTA
         IAc93ssF/R3+mH+YOIPsFAqgnBQH2P2cG/i+udAlIcwJfjxhi4BJyM6UCaOaMa+3O3jn
         KFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791083219; x=1791688019;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGDw689I2nieuspdwl4thgn6puX+R1JqxzAeq5vzaqg=;
        b=i2ULTZqqMupN8igTUXmuEsYd/lbGOmtuPfuEJf62UVJbkHMWLcRHqAnEr9ZbYfwYP5
         H4+4VbAEWM2W7RNRSTuXPApwdx/EagRvGOCuZpNXXzK4dJUJy+bnV5WfGh0126l72F3A
         RRNLMdMgnxQEvNJQPe7n94pvDXgg/uMVjHhtgnA7GNdWvG3vKHySRawANJnqZyGPzrrA
         WuvbYaOcQovlvcEzdVTN/bhBlW3YjqUYbV/NuHFeLcyH+OiGH5YqztISKtNlVsgeZ2+3
         OdM+lrDlmc8VAXbYFE/d5YgQvuYPejFMpQpkZ0UHOhBNfTWwzWvJ9dmLHhFjMtb75gcB
         KeZw==
X-Forwarded-Encrypted: i=1; AKwUvBzTguDll6VzPwQmkXrjkcS+uPj9/9MWByipmMhEWt5RGr/lMh3NgNjMXv2n5WP8rsnTRWpyIvPwyMzi/uA=@vger.kernel.org
X-Gm-Message-State: AFuF++mEcra5auT17eODzVNqordivjCMs2fuDFM3OdaMs/A4L1FDqWdx
	zcUZu0MsXp/ogQcEn81cTLiqeZAPaR29L+KVwJApNUKFk4R3MkasvNmm8e4qXQKi
X-Gm-Gg: AYBFou0cP/aMY2zDwPguFg9x86RbROIPu30olKRvdI1SEVa23ESZBssWpjLjhDli8EN
	EyZFy4MvGXvR6nYAw8HrLJ2vXv3vnhaLVYTxLYgVizJqt+UPJfJl6ZoBDXEyD9CwFsrGDF98XM6
	jGzOkXDkpkgwqH32j89sDj4qaJLhLYi2U99XoEWmz5dP59MbYPZzLVd/h9BnWLKjuPqNPscXXpP
	MGZTBuVP1kxjl2Cobjq0f7QcbOhL2ycdiBT7BPR48DU/mwLolHZ5H4uifQsPYYU5xzs8fDPip1x
	HTqiXKDbPxqIXQv1sJq6slFmr+Hf7uC4+AMSuJB27+x20BW3PCLzREY2YnXWsHz9b/dx5rhrc3p
	lkvBc4fS8tZiCX3BGJk9zmTEpq+9CQ7WTN8qZL3RuGVtavRRNViwgKycMCEQ8FUzKbcfEjAfklv
	+ueT7ekTYKO79uEptU2MR374xdNeGEt96lR5uCopUs5pUWZTy2PKdgzhERnFTBFI4e3JnYSoGVE
	QRPUxT4WDi5IDQ3IZxo3TNrmlCWAJz6m8Fr/LSVcIeSOws+RTilbPHAP5QgFC/MdG/u+Rf5P/Qs
	Cy0HXpQjwA==
X-Received: by 2002:a05:6808:f88:b0:4ab:318c:6b38 with SMTP id 5614622812f47-4f526442119mr5877208b6e.1.1791083219254;
        Sat, 03 Oct 2026 20:06:59 -0700 (PDT)
Received: from starship.unifi.local (107-216-42-6.lightspeed.austtx.sbcglobal.net. [107.216.42.6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f5249dc2e3sm6503800b6e.11.2026.10.03.20.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 20:06:57 -0700 (PDT)
From: Lawrence Lin <deduce@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	linux-modules@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ftrace: Avoid quadratic symbol lookups in ftrace_module_enable()
Date: Sat,  3 Oct 2026 22:03:58 -0500
Message-ID: <20261004030438.434327-1-deduce@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003-ftrace-mod-bsearch-v1-1-92e2fd2d80ff@gmail.com>
References: <20261003-ftrace-mod-bsearch-v1-1-92e2fd2d80ff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Krzysztof Wilczyński reviewed this off-list while looking at carrying it
in a distribution kernel, and raised two points. I'd like to bring them
here, with numbers, before sending a v2. Cc'ing him.

1. ftrace_cmp_addr() duplicates ftrace_cmp_ips().

Agreed. For v2 I have dropped ftrace_cmp_addr() and moved
ftrace_cmp_ips() up, above the FTRACE_MCOUNT_MAX_OFFSET block, so that
ftrace_process_locs() still sees it on architectures that don't define
FTRACE_MCOUNT_MAX_OFFSET. That builds on x86_64 and arm64, and on x86_64
with CONFIG_MODULES=n.

2. Should the sort use sort_nonatomic()?

I timed the collection and the sort with ktime_get_ns() on a Ryzen 3
3200U (v7.3-rc5 plus this patch, debug printk only):

  module     addresses   collect     sort()
  amdgpu        64983    0.41 ms    36.4 ms
  mac80211       8199    0.11 ms    12.0 ms
  nouveau       19354    0.06 ms     9.6 ms
  kvm            7993    0.07 ms     7.9 ms
  radeon         9882    0.03 ms     4.6 ms
  all 141 modules loaded at boot:
                         1.09 ms    94.3 ms

So the sort dominates the new code, and amdgpu spends 36 ms in it.
It runs in ftrace_module_enable() before ftrace_lock is taken, so it is
sleepable and is preempted normally under full or lazy preemption.
What it does not have is a resched point, which only matters for
PREEMPT_NONE and PREEMPT_VOLUNTARY. sort_nonatomic() would add one, but
commit 340e3c5165d4 ("iommu/arm-smmu-v3: Replace sort_nonatomic() with
sort()") removed its last caller with the intent of dropping it, so I'd
rather not add a user. For comparison, the lookups this replaces took
about 4 s for amdgpu on this machine under ftrace_lock, and needed the
cond_resched() from commit 4099b98203d6 ("ftrace: Fix softlockup in
ftrace_module_enable").

Is 36 ms without a resched point acceptable here, or would you prefer
something else?

For reference, the cold-boot A/B with v1 and the v2 change, on the same
machine with a distribution kernel (linux-omarchy 7.2.5, amdgpu from the
initramfs, three boots each):

                     stock     v1        v2
  amdgpu probed      6.17 s    2.03 s    2.03 s
  kernel (systemd)   6.64 s    2.48 s    2.50 s
  modprobe radeon    155 ms     83 ms     83 ms
  modprobe nouveau   468 ms    141 ms    138 ms

(medians; radeon and nouveau have no device on this machine). The list
of functions in available_filter_functions is identical across the three
(84301 entries), and none of the boots logged a warning or soft lockup.

The same three kernels on a faster machine, a Ryzen AI MAX+ 395
(Strix Halo), three boots each:

                     stock     v1        v2
  amdgpu probed      4.84 s    3.80 s    3.81 s
  modprobe radeon     47 ms     32 ms     32 ms
  modprobe nouveau   130 ms     60 ms     59 ms

The saving is smaller there, about 1 s for amdgpu rather than 4 s, as
expected with a cheaper per-symbol lookup. available_filter_functions is
again identical across the three (84676 entries), and no boot logged a
warning or soft lockup. The systemd kernel time is left out because on
this machine it includes a LUKS passphrase prompt.

Unless there are other comments, I'll send v2 with the change in (1)
and these numbers in the changelog in a few days.

Thanks,
Lawrence
