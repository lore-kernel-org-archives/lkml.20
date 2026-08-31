Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E7D3C6600
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160835; cv=none; b=j1vnRBrRJsEvGS0LIyJLyszFZVNmq6GFoEhmtN/TKd72x/Yb7Do7K79FSS/5vwHzplgKYG1DT5YxcFREHFHTV9Syhno9L1CM0qY+qB1tpDei0NvOxeHu+/QN0WwCK7jOlaMeQqTvYaNN47z6pHNWDxFktZfQB8KMjFl0B4cvzDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160835; c=relaxed/simple;
	bh=uWGj8ZrC/dkfkNekrWcG5WWlnwxQqcw+th3H2udDbak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f/wxmLVayfIZ7f1+rwzbUTcvz3IwXE8I8cDSBps07YQbeRyPRAMNzhY0Li+qU3e8inL0jOauJ2U95Rc/JoiibPFr/ttLsEBMTR4L4kfz0aXJWWD5EqwSEWCc2ItbatUEY+Tcdt9P8jLsEnhvsONMlxsoCG2dRI4dzBC+bOkpBmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzVt/oRQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzVt/oRQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3633698a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788160833; x=1788765633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zef8diL4g7+FwM+Dyb7UInyRUs6ucM8Ox5zkRBLtlxk=;
        b=YzVt/oRQgvfnLEscLA7DSFOeGUd/kT7Tw3WHKLwbvf+J3gNeZzZv4F4zUZNvvjN70o
         sG7+KFpisVcsw+RM2sKDgsMzjW0IDmAQdv/A3suv8SN18vY5UvP5t5nmTQfK1PXnmzRX
         Z9iDUwBS9SH+/41dPQjGEQIkKb5N34KCK3saUXdt+KhypaB2UJmO1Z5IXQ8h8z9GblH/
         U+b6SFu4MJ4znsL8UrSiUEt7fOjBli7pmbpOja6jR3/9+o5PDdR0F5LwZ7ziis+PZw4Z
         EBSxznIpv0rmVd9ARI4lRl1/t5I9SAbJxFTWXZMTxMT8s5sNWrLi3esJ1jQRlalkRdqS
         P1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160833; x=1788765633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zef8diL4g7+FwM+Dyb7UInyRUs6ucM8Ox5zkRBLtlxk=;
        b=QbQ4i7lDN+8YZNQaq4IpwgMO7wBlrQ6coEinREwPtYssMGLjDTwsEBuH+bnhwaeqOp
         +kdcOKlaqN1Oh1kPfFridrHW+FtVrZNcFrF0fFecpuiD2cXRZ3ohbxdw2F/w+OsBo0qg
         DCQH0HzQIcxqA9CVKW0FqzcP4oV9WZB7nbMImu26fL+GMtq5IF5TXh74vVqElf45MGT5
         rzxrkGM7hlRWFxUJxhMFEI8wZOpgoAuD5TTZrHdE2UUAT45bDYp7tY/pCo9RO2s+bh6P
         YfuWgj7s2aVCo6/+re7Ll3udm0+y2hvL11dZRarlyzPifk39q27qjCYoPSUDhF82hkhd
         q4Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwZQEAIZusij58a7ZO77t9htdoCoTubnoak3JJuo4zilVxUCp5Sv7Y8oFmcVZTGAFR3umD+f1bLC/LwfBA=@vger.kernel.org
X-Gm-Message-State: AFuF++lFn9pXmhGxc3kEek+8VOkNZVDNy8blZVEdvRJrcfyk7FBuZO5l
	kfIZc2otRAGOp1pIAtqQ3Nqt36fBxXjJKprTuhBGtw7uPnx2h0IgB56t
X-Gm-Gg: AYBFou1aSO9ufnMFz8U4/dg1ArV4xEhKnY9cptSR/x7/plzieLBlSG3/mYbP2GyQYdp
	hWxiI38BDJnbC1nDT+5mCTt+dhMjgaQs/VmA6OwxaH/pQkhJAy2EeK3PafOvLPlWVGeAoRWg+mz
	MiL5WQqZzdLxZ+UxSnCGXQwPYKpjR/VFMEK5+Pt9AVyXiAtWLoFm11pBub5qsEipuD8TEKXQD3P
	JBlCjMRa2WnaGu8dcZA/JuT02z9nDNZza+Oa718voXWEbnfF804OpVnN2hHRg01BKOSYC6xeBJ6
	GtHfLRSflDL7pM4lOR1zy8dzA8Eb/HuAXnPiccxyQY1ZwTNKHMpgIHmLjJlL1liaWK6vzrOV8xt
	fVd/hqFgTVtTJxWHksuUaV4DMYngmwrgmn+kfJt0b2vZ5B3O6mS8oABV/5OA39DwnPogH2f8UQ1
	gu0LMUkmnKVFf7p0FSj3Mfv6774bexQZ0lX8tE2Jp52jHYVHNYsNhoq1O0oWu06xntwuWmAwvlO
	R0z
X-Received: by 2002:a17:90b:590f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-3989be5b4bdmr25049035a91.18.1788160833227;
        Mon, 31 Aug 2026 00:20:33 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396afff2650sm20128800a91.0.2026.08.31.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:20:32 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: thomas.weissschuh@linutronix.de,
	tglx@kernel.org
Cc: luto@kernel.org,
	vincenzo.frascino@arm.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: vdso: is the reduced precision of the CLOCK_AUX base intentional?
Date: Mon, 31 Aug 2026 15:20:26 +0800
Message-ID: <20260831072027.1315879-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

vdso_time_update_aux() shifts the base down to nanoseconds and back up,
while the other clocks keep it scaled:

  /* kernel/time/vsyscall.c */
  nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
  nsec += tk->monotonic_to_aux.tv_nsec;
  vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
  nsec = nsec << tk->tkr_mono.shift;

That drops the fractional nanoseconds of xtime_nsec, so the reader ends up
flooring the base and the cycle delta separately, where ktime_get_aux()
floors their sum:

  base = xtime_sec * NSEC + offs_aux

  syscall:  base + ((delta * mult + xtime_nsec) >> shift)
  vdso:     base + (xtime_nsec >> shift) + ((delta * mult) >> shift)

The two agree on everything else: an auxiliary timekeeper is memset in
aux_clock_enable() and __timekeeping_inject_offset() only touches
wall_to_monotonic under timekeeper_is_core_tk(), so it stays zero and
tkr_mono.base is xtime_sec * NSEC; monotonic_to_aux is set from offs_aux
by ktime_to_timespec64() in tk_update_aux_offs().

So the difference is floor(a+b) - floor(a) - floor(b), and the vdso reads
0 or 1 ns below the syscall for the same clock.  With shift 24 and a
2.5 GHz counter I get the 1 ns case on 60% of the (xtime_nsec, delta)
combinations I tried.

The scaled form the other clocks use looks like it would work here too,
and would restore the exact parity that tk_update_ktime_data() documents:

  nsec = tk->tkr_mono.xtime_nsec;
  nsec += (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;

update_vdso_time_data() already shifts wall_to_monotonic.tv_nsec that way,
and monotonic_to_aux.tv_nsec has the same range, so the width is settled.

I am not claiming a monotonicity problem: across an update the step is
floor(a+d) - floor(a) - floor(d), which is 0 or 1, never negative.  It is
a standing underestimate, and clock_getres() reports 1 ns for these
clocks, so it is the full advertised granularity rather than noise.

Was the reduced precision deliberate, on the grounds that the sub-ns bits
of the base carry no meaning for an auxiliary clock?  If not I can send a
patch.

Unrelated, from the dispatch next to it: __cvdso_clock_gettime_common()
does msk = 1U << clock after admitting everything up to CLOCK_AUX_LAST.
That is 23 today, but raising MAX_AUX_CLOCKS past 16 would make the shift
undefined with nothing to catch it.  A BUILD_BUG_ON(CLOCK_AUX_LAST >= 32)
would pin it down.

Thanks,
Zhan Xusheng
