Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926FB7262E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133581; cv=none; b=ZNMXOjODRAI86AMgU2+O2c0qtUGNnmU732enNvyK30RnlHHp5UmKZTxrQJQv7gOTmGTrylOS2qdfKax0tSW2pA1pyx/+ovz+nZ1wpJRwaKfvnOCknfU9WrcicIqUjxJ8w1jswRWlZtCTzZ7XXOQvVUXg5FGMNTmc8dEyOZveUqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133581; c=relaxed/simple;
	bh=Fvw3a11k1H96MSgvLcQCHxdBO3T96s8ZzddX0DVJ1pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WzixjYVi5tP4+Y28T5KwMmmmz2mQSYmu+KSZ048kpg/D0V/mRCFuSO9jSTrArtMYhe16GifCJMrKcVQaharJNwl7Keo/EYtu0V1NiVXYmp6W5ceZdTfZienHlD2MbCsGe2oGEBlD16RR4Mr9aZAQ3yXlf6GOccxgJlfcrun53yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFZaQnRB; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFZaQnRB"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49dedadaa6dso517777fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791133577; x=1791738377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fvw3a11k1H96MSgvLcQCHxdBO3T96s8ZzddX0DVJ1pA=;
        b=iFZaQnRBTxHhqkgur48WM1HO8TyCe0zFlpgzDitYmGqCC3fb+elMjTXxXq9/DAoMwn
         uYMZgh9L6Xvd/vjeMw5O7Nnz+qdGxQKq+05bL35efQDKxcB/ruQdiRxkzkyV2OYt3eqE
         yJ5qCSikCwFrL59lARRgJbA+bn3wdwUS9o1e8BH2+NG0OGm8joR+Yk8PsSK3Pxq0wRoo
         syuVd4lPFVyVQOAl1M+EvKRIpEI160smZnOGEb+xh7F1o1L0Pl8nWJ8WXopkm9GO3FtU
         Iy8ReazmqfhQqDEY5+FH1JS0BU6S4qdabo2aR23b7fYHUditNSYJV95Ys7+OO5N0rXq9
         Dtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791133577; x=1791738377;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fvw3a11k1H96MSgvLcQCHxdBO3T96s8ZzddX0DVJ1pA=;
        b=pA2rXFmWWXYjC8oVzE14KNkdemkHQYdeiN2i8EIAawjepQUYvf0BlOqg7JPpYsY2UU
         B7HQA7CPOshkR9OXO5yUY1pZKG12+eYuaf7atjWpKh6YGZYV6XUh9kYPPtjlHlObj9bo
         7KjjVbbAnOBVx73a2NzRakqvcC3UEqc5fRObj4kVuFiip1UHhac3yA7TDfBbG2/uCJ0s
         YIAd224Rh9/kVbS8nupu3Ha5sSIeAH1TQ5efquVjn3PQIM6ZPHJK/rC/D3hc9uul73N5
         jNfZ55gfIrLsNHNYcDkLDnLcS3/CJTn+x1R2mVAkJMwkTXkHuiPYrZN/t14UtN10f9No
         AlvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg7XHx1hQEoSbW9UOd0jfn9JwM35rCtDwRtMrqm1Lc2IuAFXw4bD9acy20QS1tnHiYY2eRrzE6LYytYpM=@vger.kernel.org
X-Gm-Message-State: AFuF++nOQ+5A/kMqu74KF4dYtvJm5Suf1JDOkP1wIxFjzTOcLPsPavLV
	0T5QsnsUPZRzJEH3Jls9dpAznP8aYSzYuy0S8veEnUd+PxIGIJSwkkiFXK6PlD/6
X-Gm-Gg: AYBFou1kD4POWi22Y7yGHotxPI08ea9Y59PLdGkhF2jENNE0OElN2PRtKtdv7gQUWBN
	k0bpmr+u7dW3jYN6RPwUKo3WR2iy8Fs+hspx4Zmqc2FB264PRWtbDAaSE2CbwifJ6wdPnO5/E8b
	x06W2ni+D5lmrxDKkuD1vBk5Gyb7SPeyWuk5BdDErz3EBrOSZ3qIKriqvb41AeTR5vI86HVD80J
	57pIUVgP+OtRLgZUHtWbzv5YHSVW1lgruUiGXV/15Z8HlyWZOc5A/ZG1+v+f8r9b6NcIZ26COAR
	2iwmj6NNraBa1ZYAz7w6Vv6gqjWvo1tnoQtuzlhFcjqsnCugSftf8AdP6V8RdLGwHfFTNKomUqm
	46fMMxoG/INJyYTITI5+Nq6udOejGxWhMSOX1V9bFwluartT3NG6Kok7ySbmAgFs7DTx5Vrk+wj
	xCP7V3yJwDdMoMA6jI2i6hEQlgHiy1ja5+R0UIKBf17wC482CC/QwtmvNkND3pLF5XWOZf7LPQD
	BWKx8P1GMhT4jZMTnMx89wKbTbvmQfBw5BbkdiBco5QqS3j/TmGcPxvP2SP80dvum7UrwRncVUe
	06Rekmowiw==
X-Received: by 2002:a05:6870:b50d:b0:485:d31b:7767 with SMTP id 586e51a60fabf-49e15dc52bfmr7641789fac.37.1791133576582;
        Sun, 04 Oct 2026 10:06:16 -0700 (PDT)
Received: from starship.unifi.local (107-216-42-6.lightspeed.austtx.sbcglobal.net. [107.216.42.6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16545353sm7403626fac.0.2026.10.04.10.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:06:15 -0700 (PDT)
From: Lawrence Lin <deduce@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	linux-modules@vger.kernel.org,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] ftrace: Avoid quadratic symbol lookups in ftrace_module_enable()
Date: Sun,  4 Oct 2026 12:05:58 -0500
Message-ID: <20261004170600.1541723-1-deduce@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004050904.06a5ecab@fedora>
References: <20261003-ftrace-mod-bsearch-v1-1-92e2fd2d80ff@gmail.com> <20261004050904.06a5ecab@fedora>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 4 Oct 2026 05:09:04 -0400, Steven Rostedt wrote:
> It would be interesting if it actually triggers (finds something). If
> it doesn't, then I think we should just remove that code instead of
> adding more complexity to it.

It does trigger, but only for modules. On x86_64 v7.2.5 with kvm loaded,
available_filter_functions has 18 __ftrace_invalid_address___ entries,
all of them in [kvm] and none in vmlinux. Each one is a __weak default
from virt/kvm/ (kvm_arch_vm_compat_ioctl, kvm_arch_shutdown,
kvm_arch_dy_runnable, ...) that arch/x86/kvm/ overrides inside the same
kvm.ko. In kvm.ko, no symbol covers any of the 18 addresses, and each
body is a stub that returns, returns a constant, or tail calls.

ef378c3b823385 fixed this for vmlinux at build time, but sorttable only
runs on vmlinux, so modules still depend on the check. In its changelog
you wrote that "the real solution is to not add a weak function into
the ftrace table in the first place". For modules, that can be done at
load time, and it would make this patch much smaller.

ftrace_module_init() runs after the module's symbols are set up and
before any record exists, and ftrace_process_locs() already sorts the
module's locations and skips zero entries. A location is valid exactly
when some symbol, under the filters find_kallsyms_symbol() applies, lies
within FTRACE_MCOUNT_MAX_OFFSET below it. So one pass over the module's
symbols, with a binary search of the sorted locations for each symbol,
can mark the valid locations in a bitmap, one bit per location. The
remaining locations can then be zeroed before the records are created.
ftrace_module_enable() would then drop its test_for_valid_rec() call,
and the weak stubs would disappear from available_filter_functions the
same way they did for vmlinux.

That keeps the work out of ftrace_lock, avoids sorting the symbols and
replaces the 500 KB array with a bitmap of a few KB, at the cost of a
small iterator in kernel/module/kallsyms.c, since the symbol filters
live there.

Would you take a v2 along those lines? I'm starting a prototype now and
will measure it on the same machine with the same boots as v1. Then
I'll post the numbers with the v2.
