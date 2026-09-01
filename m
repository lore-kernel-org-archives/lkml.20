Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F43F6C21
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228416; cv=none; b=YLREW7Ae3HMhVOZC6EcG/IPMypqpCnt9JQ/FKZ+g7G2o33/vr8G/KdTO5FJv3Pbral9h5ZEQtz/Nm3zyGmFC+4ZSsMewswIGkh6xZcJiSkv5Z3J5M3b3Z/lPJNlrUS95+Q5kU1dCcyU7HaXwYt5k6WozZzkc+RaPQfLWaVWwPzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228416; c=relaxed/simple;
	bh=+s//ArBnYbrDK9HoibsnhCVjmW2bXOmSyzAL7VipIuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S1F94cqvdAQOBWh17RD+zmvSUVcVyT8G7EOBiLIi/j6Z1GxCMcA8AW19WU05WMSheuj2edD7xuRMM4E52YEpupF5+9NzcdXBVhC8P3O0tTN1gv0y2NEaY1OwP3SMDpg3ybJTKItYnc6Jg106GJ24GCad1hV2zq1LbIqc05Ipwn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZYyPBbi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZYyPBbi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf452def93so4916115ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228403; x=1788833203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID3zV3uUdLfa+KYuJNQ9IEVb7ZDc4qbpsR7jTb5N7fg=;
        b=fZYyPBbiljur/zq5quJxyO1/UMF33X64f973g7lsX9FVm4X64tk3gn6G2AUfc0mOf8
         3oVgH7lZUrahojc+9ifiL6Qw5BsiZgP5EJ93HwklyX0ZrRXyZc3XKmuCQtirEAr+DX6p
         bMni6xao717GIPKZcUOxoseHnCmIFz6K0VxnnJ/t74CpI7QWVkECOxt6ceK16s3GLocA
         MksXz0z2ovVAvFfGk6G8dPQyVSSCjvTTqAldJdNYKd0HoSqXiP7xFz4VjvxGbN/gR0YD
         XKrcatis3wsHR/J/zkb4ZH+tqFcxHjMs6U7w2kTb9O4UWKN/8flNIHGCLToMZA//NK7j
         hslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228403; x=1788833203;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ID3zV3uUdLfa+KYuJNQ9IEVb7ZDc4qbpsR7jTb5N7fg=;
        b=MpQhgnWrMFaEIplkzs79Xub6jQROnYm/nrU69B7qbqS+HkWIb320AYki447VKcyLRY
         b+zjx6n2rX6+3uP/iGmzw47CXIbPRtxXppnnEOh1L3rsIeYOxbCNXNjvblPc1wr4Ycby
         H0u+kYKHTHHcUhc6gIyJtlOmr0TI48otx6o43132JT2X3lNc6NerLLw2M3s0SZ5+uCZv
         P0l88AX4jsACf5UHjtdGMZNsS29bqHqEthiDD+vlmGFOEqfKjOJnICR4DLpXl/0NstwX
         Px478ZIVHiSkAooPdeYIvH/AR7R+kL4h1A4qqK+xOoMTKGKkyvD5jReyNy62DlgzGUOo
         Kw3w==
X-Forwarded-Encrypted: i=1; AKwUvBxWZxn3AWark8T30Fr31RlTTiKC8iRBlBfm7joH5uOK2z1fL1HG6l6yQWVnVuCB0AiXQBCL1kPXWYoCWc0=@vger.kernel.org
X-Gm-Message-State: AFuF++kqO7V6I/kD9b3PH2gGrd5eGz5e3FeQ3NF1feAI04baNajX30Zg
	mS0qlVdAJIVA2BINisMDLjkfRA2r5Izd7I+hpM/HzcAs1WJAoDfDMwoh
X-Gm-Gg: AYBFou33v7CRAxsAdmrgWY6QjzUXPj669eKBfjYXh43+78PMPLuR9w1nL7CDMSNkDkV
	gm6LjBYkkOHiAoEuU2wzMHAQG5Yd79Mx04YVpBHwrDCd17VpTogXgNOj3aNBYBXMSjaPlSPT/Ck
	haqgqep9Mi01jz4FyWLFvR+TjjDIgjzHPyxzCUh56tBY4lQ9UMfXS9PgFpCj9A9o2jMq4DmpxoW
	xfOfxZ2+DuBbkxZJYZ9lIExMj4C+0r9ibfnWKbY/0lD22Woqsi5ykGov4in4Gf+j+r4AqFjVUV7
	5zfoiTRE8V2En7Q52WYCIwfryagbMX4bQlINMAzMJgfMahhI4qx1V4vKeHwA+F1+kk4A2kFSQZx
	MSfjCIB00PKqWyaq4ucpMaT5HUb0SLQX0eEOgCmw0o7P7xucOHdgypNj82730CUfUTxvAe3mC9v
	zoYmN2AmCP3zqdE4rmHV+wSZQX2MsJnDfCXnlBiray9OZO1cou0I5tFeleDNaqd276yfjbH68Dp
	w==
X-Received: by 2002:a17:902:d4cf:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2d95297df5dmr18513455ad.23.1788228403408;
        Mon, 31 Aug 2026 19:06:43 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7596412c2sm43098735ad.37.2026.08.31.19.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:06:42 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v3 0/3] vdso: Keep the CLOCK_AUX base at full precision
Date: Tue,  1 Sep 2026 10:06:33 +0800
Message-ID: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1: https://lore.kernel.org/all/20260831125557.1490398-1-zhanxusheng@xiaomi.com
v2 went out before David's mail arrived.  It touched only the call sites,
so both of his remarks about the helper applied to it unchanged.

Changes in v3:

 - The quotient is a u32, as David suggested and as the u32-divisor
   version already returns.  vsyscall.o loses 16 bytes of text on x86-64
   and the loop drops from 36 to 28 instructions on 32-bit gcc.
 - The barrier keeps the value in a register instead of offering a memory
   alternative.  David asked whether clang makes a mess of "+rm": it does,
   it takes the memory alternative and spills inside the loop, on 64-bit
   as well.  Both forms still stop the loop becoming a division, checked
   for gcc and clang at both widths.
 - Fixes: tag on 2/3.

Changes in v2, from Thomas' review of 1/3:

 - Drop the nsec_per_sec local and spell the divisor out at each site.
 - Store the remainder straight into the basetime, as the coarse clocks
   already do.  That also makes the copy of the CLOCK_MONOTONIC values for
   CLOCK_BOOTTIME take sec and nsec from the same place rather than one
   from the basetime and one from a local left over from the division.
   Not a codegen win: gcc emits the same instructions either way.
 - Keep "vdso_ts->sec = sec;" on its own line under the copy comment.
 - Picked up the Reviewed-by on 3/3, which is unchanged.

__iter_div_u64_rem() has the same "+rm" barrier, and it sits on the
clock_gettime() path through vdso_set_timespec().  Converting it is worth
64 bytes of vdso64 text and 112 of vdso32 built with clang 18; gcc is
indifferent.  It is not in this series because it also has users in
arch/x86/kvm, timespec64_add_ns() and lib/math/div64.c.  Say the word and
I will send it.

The problem 2/3 fixes: the CLOCK_AUX basetime is shifted down to
nanoseconds and back up, which drops the fractional nanoseconds of
xtime_nsec, so the vDSO floors the base and the cycle delta separately
where ktime_get_aux() floors their sum.  The vDSO reading ends up 0 or
1 ns below the syscall for the same clock, and clock_getres() advertises
1 ns for these clocks.

Checked under QEMU with an auxiliary clock enabled through
/sys/kernel/time/aux_clocks/0/aux_clock_enable, comparing CLOCK_AUX via
the vDSO against the raw syscall at offset 0, at +5.123456789 s, and with
offs_aux driven negative.  The two agree within read latency in all three,
and over 100000 interleaved pairs each the vDSO reading is never ahead of a
syscall reading taken after it.  The 1 ns bias itself is not measurable
that way, a pair of reads costing several hundred nanoseconds.  The
argument for it is the algebra in 2/3, plus a sweep over
(xtime_nsec, delta) which puts the 1 ns case at 60% for shift 24.

Zhan Xusheng (3):
  vdso/math64: Add and use __iter_div64_u64_rem()
  vdso/vsyscall: Keep the CLOCK_AUX base scaled
  vdso/gettimeofday: Assert that the clock id fits the dispatch mask

 include/vdso/math64.h   | 22 ++++++++++++++++++++++
 kernel/time/vsyscall.c  | 28 ++++++++++++----------------
 lib/vdso/gettimeofday.c |  2 ++
 3 files changed, 36 insertions(+), 16 deletions(-)


base-commit: abdf623ddb75b24659018d3952d8f61937306ae5
-- 
2.43.0

