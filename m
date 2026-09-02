Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB329B78F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320290; cv=none; b=D+dqQy2fmjj+ZPwSu8P1DJNFePpZsuh6odjBcxeQTflPzlXhvqXCAbHg7WF8xqBc9T09RKktcncIAltn/FkJ3bUxGsquWVmCJYuo9/kS8H3bT00rXHIKTX/kK+3bk+g0jqD9nlblOz9frqaPP8fluhkfZmyVI6xW5YzIdZbXPhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320290; c=relaxed/simple;
	bh=bVfGwWtzZ6T3TCBjxdmhrFxiH43W2uBIuuy2/mzmyiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W70OJAuluh3EmSVcjMulniesJk3D6orwQ0R3oOoWIFwsQ7FcQ6wwy7B/zumIaqsZ5O1Hze9v0wfBgODm6JGz5m+9ENSUws9xKtRI/uZYUcqa9z1FbyFU6Rzhv1QPl2aDb/lCAG7yin3gf0VA+Q2zx84DTxB5YX1VGcD2XfkOnLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzdH55/I; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzdH55/I"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d91ff7d9acso5352145ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788320288; x=1788925088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+Msi9Q+pnpxYPThRhUmoayu82MnNSZdN8JYBLhCwNM=;
        b=dzdH55/IOrlb1oERx9f7ZoYXPZTmZP+Zrtn2STaFNmsvMXXWLogklu0gqIYN8nItUV
         GfHDOaIGtr7YhPpZ2jJoo+bsCqImdKLv2hHWuZrtFrL4u9rrb/2IH5UMcZIqtgb6kP2u
         bsSLMU0DgpiHtc6fiMtK5FlxELmtFhR+5jmUedHGPmN282oNFap50Vhw4v2EoiLFJoQ3
         VtHp/p5gZs2f1Fy77W3vZZLjAmz7djLHoaSGtNQsbx3MdoHFjz3Y2i6v89fGDS3PczaB
         qooEsOS3dGo/s62em2q0ani9aQ7ot/3RpS04+3zDsOUBvaMda/gQtNkIKBCxxSzV681K
         Tk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320288; x=1788925088;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T+Msi9Q+pnpxYPThRhUmoayu82MnNSZdN8JYBLhCwNM=;
        b=PTN9QVsdKvNziC+di0LrXWPoLyJYPUEoNxLEQs3fFF4AbliAe/OIpGaHx0hauupjCv
         hoW71j4zoSHp/HIeIGVatPssGedCPzxy+9s4/+0OJRLZ8aDCFzlP2lUJiRf1Kb1dsn0p
         gby+wwebPgPg6iY0sC4pdfzRn6H/Ww2i/eh0SWybE1Pvei95o/DnMIOJpM3A1ebWG84C
         dliL63HK6ao8IBIqG3qz6AWFw5fU+KEzVAddJawxZYDOtF5PdJdnImPlSCm065fXmcA9
         ZgBQlz2XnG3ri9OHdZyGeZXKxBCoD4790vj2ZIh1yuh65/ecvoci9JTgB5hW6VanUwAx
         y1sQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/lPkhZkEysjbOf70CKpQhg4BdWyvv9xQtJ52ebaROBH/HwrvkFocBBMlcdyaFAnCDhC7Xi1rUhG/OyKk=@vger.kernel.org
X-Gm-Message-State: AFuF++kpcdAcwP3OBdex/v+cUOGRGquhjahTs0v+P720ZnWoNiksOKlf
	dhW5Flw8/X17/n9KvxONwJ7Szkdl7QjDC0P4ydeDhTLN/cZVze1EBZJd
X-Gm-Gg: AYBFou0bt+SxudGYWkkBLkv/bVA5Twecu30/Za9Y6sQS1vLUtblfhnMTk7DYuCOVU++
	/RBM6L6FVMDgUWNKWYbPkFCIZb2UKqf3e6TA7FRX36/uXEuHLEl0n6o6cZnu7/5SsMENCuI6dNA
	U0GHpEBh3ojCe7typybV+hMJiUgEgyYohBPkSZB9jiNECOoVLkDmL+2WuMvfmwEBvlAtWXpKjkT
	9IAW4RIv0AsWgxoRmAxHqqvwL/3xXQkBfozxNy0FEOzyEQsgDpbFwJbMMxZdoSjiLveeSZn7gsT
	eQRwaXC5EK3gQ03H2jnDDakTcK0aWdriZlXlggGE5uWZVS5egkB3NOTjxepXm8DIJ3qsKndOhjC
	DK2+MDUHf4uPwPkgkcDPWazfvJut1xaHjYKnZVIyQUqF8B/lClsNdPqwBYjojkyAFdtg4uSVgaH
	tqcdI8eAKJ8q4AynjJD9OpdWjOJx3BZzU7WSSi+g2tFbZQAlVOEXtzV9sQNJdiaVr/PrQUaebyC
	CDn8FQ2nws=
X-Received: by 2002:a17:903:26c3:b0:2d8:d4d3:3fbd with SMTP id d9443c01a7336-2daec74819cmr30243755ad.17.1788320288175;
        Tue, 01 Sep 2026 20:38:08 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd386eefsm5715715ad.28.2026.09.01.20.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:38:07 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: thomas.weissschuh@linutronix.de
Cc: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	zhanxusheng@xiaomi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] vdso: Keep the CLOCK_AUX base at full precision
Date: Wed,  2 Sep 2026 11:37:57 +0800
Message-ID: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v3: https://lore.kernel.org/all/20260901020636.1821993-1-zhanxusheng@xiaomi.com

Changes in v4:

 - New 1/4 converts __iter_div_u64_rem() to OPTIMIZER_HIDE_VAR() as Thomas
   asked, so the two helpers do not diverge.  Measured on the x86 vDSO with
   clang 18: vdso64 text -64 bytes, vdso32 -112.  gcc 13 is unchanged.
   Neither compiler turns the loop into a division with the new form,
   checked at both widths.
 - 2/4 uses the macro too and drops the comment about the memory
   alternative.
 - 2/4 no longer claims the vDSO cannot link a division.  It cannot, but
   this code is on the kernel side, so that was the wrong reason.  The
   reason the loop is right is that the quotient is never more than one,
   which also answers David: there is nothing for a reciprocal multiply to
   save.
 - 3/4 drops the sentence about the advertised granularity, and says
   instead that only the sub-second field changes.
 - Continuation lines aligned under the opening paren.
 - Picked up the Reviewed-by on 3/4.

Sorry about the pace of v2 and v3.

The problem 3/4 fixes: the CLOCK_AUX basetime is shifted down to
nanoseconds and back up, which drops the fractional nanoseconds of
xtime_nsec, so the vDSO floors the base and the cycle delta separately
where ktime_get_aux() floors their sum.  The vDSO reading ends up 0 or 1 ns
below the syscall for the same clock.

Checked under QEMU with an auxiliary clock enabled through
/sys/kernel/time/aux_clocks/0/aux_clock_enable, comparing CLOCK_AUX via the
vDSO against the raw syscall at offset 0, at +5.123456789 s, and with
offs_aux driven negative.  The two agree within read latency in all three,
and over 100000 interleaved pairs each the vDSO reading is never ahead of a
syscall reading taken after it.  The 1 ns bias itself is not measurable
way, a pair of reads costing several hundred nanoseconds.  The argument
for it is the algebra in 3/4, plus a sweep over (xtime_nsec, delta) which
puts the 1 ns case at 60% for shift 24.

Zhan Xusheng (4):
  vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
  vdso/math64: Add and use __iter_div64_u64_rem()
  vdso/vsyscall: Keep the CLOCK_AUX base scaled
  vdso/gettimeofday: Assert that the clock id fits the dispatch mask

 include/vdso/math64.h   | 29 ++++++++++++++++++++++++++---
 kernel/time/vsyscall.c  | 26 ++++++++++----------------
 lib/vdso/gettimeofday.c |  2 ++
 3 files changed, 38 insertions(+), 19 deletions(-)


base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.43.0

