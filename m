Received: from mail-oa2-f10.google.com (mail-oa2-f10.google.com [74.125.231.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B84FD271
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063456; cv=pass; b=TzcOwzifs2GrKIhjQLxRfPXd0DKdFN6hdmwkYeCQiO2noOSLnjLT/D8wgOJpGk6/JEHl/ZO9FId6g1luQlnHFK9J3oEXjdNpsIZB4W18PXGUwJTo32N7ijOfuBZAtFi647+fg/eygM+tuNEhwc1T8bdJ8cBDOIYCK7o17zanzKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063456; c=relaxed/simple;
	bh=4Mrb+8X/5Y2CNFjpWJLndPDMubOpHWH5ki5nFMCA904=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=liyYHWaOLPk6O385h0As5HHp4EcEL+D3BFNwgQ6x301VsibO+eMZs/RFaHIe/O6D/4iKOD6r2uvPZ/c7eQkSfQYjbq1BrNr+GOgX1lcP7SFQ6JiSnyytpusLVVaCVue35HVfL8Ru6kwwwtwwl1VH6jS6FUcnbgVBLPBmN+2pfEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyBcZRHb; arc=pass smtp.client-ip=74.125.231.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyBcZRHb"
Received: by mail-oa2-f10.google.com with SMTP id 586e51a60fabf-49e545b61f6so441232fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792063453; cv=none;
        d=google.com; s=arc-20260327;
        b=WmL72LK4bSdlooZNjpIe3T0DH3ZDhVqHZriLNytIx/7NQQFGkt2B/K9Dgyyx7KOgxC
         b1SAK07tkmK2ywXDBapYC6VlKSjeKJh7Tkccv6iBShiiDXxub2tNknxDzijsgRrZXyZl
         nVhbGWzYUOQVM41Ck/FEsgnPiYrfiPhVWWvwGBYXNKHYdqtEeEk4/0+m6JJtEWeJ30Uu
         NkeVCpOdc5CU9Z+ldJ5hPGxNKdnffhSBkrc2nMrfMrxelPUhDqNRRkxMGIOLmvBEWhka
         fAP0RgPO9mzi1nMTmJ4gODkablXLEuBAAaQ0TDDvmyOo8ZnIt8Q8ejIhwQ1f0eqMlAcb
         2sVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Y0ZwfiBQ3RpBcxHsrin1gDEfz7uV6dXypoeGwMb2TIw=;
        fh=SgAJ7a9NPajPf2afjzR+UUfvO5nLt0uLethvxVmdpio=;
        b=fdNzG/Hfb052SmPgQuGl0TKh/7gOjce1DIT4UZSu8MOPWrOE5AvEEZXgEJfnQ55gic
         PEeqbQe4Xjqq7KXURVkgcVpfQQ5gN8H+A6J8nrsqe7R8ibAdmKXnslYWW2nGVY9h0Sqf
         CBdsqqhbjq3NfIKGKBoiZssDoY6vNhj0Jw6h1NVQz1bWx6/jrjaoJ1gIDc7MNExBDbHb
         OMaDbHdNpsT8dUvl2mppmtH2G0+m4BUSAKqUbB/+wPlNbeJew17XU8SvS4E4RczvvYJ4
         DjfZEEnlhzU5G2XsozFDN1yLhPU25NPvSvjBZJZCWDnh9gNX6uqcaI5a5CKdr5HqlLfz
         hDcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792063453; x=1792668253; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0ZwfiBQ3RpBcxHsrin1gDEfz7uV6dXypoeGwMb2TIw=;
        b=PyBcZRHb/uwk8gUNCMdjlQ/3fkrC2u2fMluy7HUVi/11xLl9g1u1HmvIe0mZu3Stot
         ZNVxKF4c8K07+ngES6CagmVx4up8kNpNxrrLgf9RruWNyvfZ3tvdYpBx3hZY2chgE17B
         HU13J3Mt9aLRVoFwJWfowY2IANful5Piw13Jpi7acFLdSdb8MoeXnqZ+lIXxdPcAmBy+
         WPqHO8KtJexOOtFIP/AIAGVk/hkiVwHH7x59SYndt98jZtIA0KgTJDFs41ESQOYscPtM
         shInIAUM6Jk/vM0DhOc0MH10tFbOBPrSJxPRGIycRa8vfmSn3RIxD/C1+fy1JBslUvDJ
         caGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792063453; x=1792668253;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y0ZwfiBQ3RpBcxHsrin1gDEfz7uV6dXypoeGwMb2TIw=;
        b=ZCFBoSLqZa/M8+5Vpc4v7HJD9E9hB2ukxGufDuUY5dqDwBYjYssuNfO9+Q8aboKgqK
         RRFdEFHd7H1J3IQY36EldMn6jmbFA64UMNlwyC6BkA/Y61rPHEpux/XNIUS15i4sWrzl
         sxPgX99GNd/FwL2Mmeu3w8wYOqNBsKQbc4Z3zaHg8b55WEwgtvTXO6yeqATWHrAK1JcD
         kTxWuf41QKvuYgp9QXWhf0VRWfk5AgaedFbLwIoTVxDtXKlYoYXuA4kxYvWpnZjdrX4k
         ZrYOWM0vblt7zl4Gnq1OsliDClbuGb8XAtSfcYq3IdRUMPpabkbnC6LEX+BY5A9JJm+4
         Wa8w==
X-Forwarded-Encrypted: i=1; AKwUvByr58c3N4vcGypwQtE0xt8AkDS4w0YVNFlasTYVpwlG4Jq8RZ0R0f0pyBr+8ouuYlU+C14OKZ5xuJaGGas=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv7O3ZQ+EVQ2iMk5CqbJP7cBDW0As5HhrwBrWIv2sXK8On7QcA
	3QF4GDz1JCLsnVGjyLoTe9GEqfFGwkw5AVNGCiqE1UyaSw7y62U2VKDUbtz646vIYhI941hfPNN
	Kam3RSihy4VbXLyoSqwgEIOcCDGB4h+w=
X-Gm-Gg: AYBFou38tMup9uEqw7r5bSzY/CVYxpu7j1anSbRjtJ0d6hf7Dch0UXEdZdpwoZITa43
	yylZRKjNcduxA/+AKgKI1zTGwlfRtkr0uE48fKeDK1L/WCi7LkKbxjYY+OdPzke7ZjrN0r8hYd1
	yvOTyHp6lVPK2IzbVBJGy6O+VtvCt2W+4IlnQ+Mv80XTdSKdXjTk7Ft6IVkDnP4Sn30NNzJRWOQ
	pUJ2sKn0Ue25TUy6OwPa3S2FLrzPdDSP4r0L+UcJIIqis6h/dBPYg/WkCstD5Z4STGqOVRRdjq3
	0dTBrjUFSsZU0VFA8PB+9cHpzlgkMNvGpAigT3/9U9RwPErYJrQQ328+rUaclmRBwvwN1TRazHK
	B7Xje+tiCFTUJBCCaYaEl
X-Received: by 2002:a05:6808:138e:b0:4e8:bce4:993d with SMTP id
 5614622812f47-50c4e683baemr14333600b6e.11.1792063453079; Thu, 15 Oct 2026
 04:24:13 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 04:24:12 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 04:06:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
Date: Thu, 15 Oct 2026 04:24:12 -0700
X-Gm-Features: AclHuK-Z1dKLpbNU8M1HVDhdDlGkqdOlUqMA7Se8cYihkhi6OUAS2FWVbX7zVVg
Message-ID: <CANOyQmHad1vamnZT12M5yPrJ69==Pt1U0+MGw6u0MuNtr-DRCw@mail.gmail.com>
Subject: [BUG] DAMON_STAT: idle percentiles out of order on 32-bit
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

In an i386 QEMU guest built from mm-new commit ad9f2d463666,
DAMON_STAT reported these memory_idle_ms_percentiles values after a
statistics update:

  guest uptime:       22.51 s
  aggr_interval_us:   3200000
  percentile 0:      19200 ms
  percentile 50:         0 ms
  percentile 100:        0 ms

The 0th percentile is greater than the 50th and 100th.  The guest had
256 MiB of RAM (MemTotal: 254216 kB), a running kdamond,
CONFIG_X86_32=y, CONFIG_DAMON_STAT=y,
CONFIG_DAMON_STAT_ENABLED_DEFAULT=y, and CONFIG_COMPAT_32BIT_TIME=y.
aggr_interval_us changed from 0 to 1600000 and then 3200000, showing
that statistics updates ran before the final read.

In damon_stat_set_idletime_percentiles(), the loop compares

  next_percentile <= accounted_bytes * 100 / total_sz

where accounted_bytes and total_sz are unsigned long.  On 32-bit, when
total_sz exceeds 42,949,672 bytes, the wrapped product cannot yield
100%, even after all bytes are accounted for.  Upper entries in
memory_idle_ms_percentiles then retain an earlier value or remain zero
on first use.  DAMON_STAT monitors the system RAM address range, which
exceeds that threshold in this guest.  I did not capture a per-region
trace in this run.

The guest init read the module parameters after 22 seconds of uptime;
it did not write to them.  The i386 config, guest init, serial log, and
build/run steps:

  https://github.com/jm5905938/kernel-mail/tree/195d7017352a3d0f4a0475b98f3b03650f5c14ea/cases/2026/damon/2026-10-15-bug-reports/03-stat-percentiles-32bit-overflow

Thanks,
Aveline Noir
