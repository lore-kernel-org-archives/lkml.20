Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCE1EEA3C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180966; cv=none; b=KGo3kh7AQ8S8iac/YCNBFtmB44dQU3sMqUMFWe+QXFF8t7pOa7+VD+i+82HKFZogGxLYYlJLuxJdll52XcHKt8edMROVTx0CLGm0RGOiquU2rRe0H1vlANcvzq05HlFX1wR6bWD0VVkW/DzbfpHprYcyXpAd9a3WX89zqQ6FIaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180966; c=relaxed/simple;
	bh=dta+GBTwSiyBuVTzncuWyIsLnOkmJBycSAhzv0JBeJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=if4efiP7614PgwUJhmrlNX1hFpkigodjev8LwHhGlw+IDkMWQbViPYuE45C6WUUeK3vCidN5crzavjDRh2Z4tAJNWj2Ixo6Kw0X44TGBqDA/H7nduq+fOsMQgp847atVqY3ANdFoTZ9pIfz9cB6QDa/bSGUbQDm9GFSncF6xnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZ+h2SCD; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZ+h2SCD"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1915242a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180964; x=1788785764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzAEtgl1vEU/fVF1mMgBAI/L34U0ogwge26j0Lf5MYA=;
        b=QZ+h2SCDS4TQSWGD/5qJVF4ziFKPBnos/yNCZsCdhoT2x9ApO1GHFx3XLWQc2Et1YR
         sC68AA8A5RQJlYMMxP8i6c4mIxzFKiMuP4KEkTcJ0URmdLYk/kxbEXLNdm5CzNCZUfbU
         GgGWpikPjwf7KcVNQVCwSp8DU1CwRaWVnnnJfit+Wiut8rO360di9qnmfAR/GWNEwyb/
         MZI9eg55YxFiGBnLZFk25r3mYF5NPQ2JDPxo3CEP8VZNkPim8S4SCXiJqqAQQwmxNQpZ
         uMDI6wbb4YIUGXCNHoUKZ9BSncMF8Lq8Uu1ZoWj6ufSgMx++Nxvg7kSmLg6Df48b9s7X
         Iapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180964; x=1788785764;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZzAEtgl1vEU/fVF1mMgBAI/L34U0ogwge26j0Lf5MYA=;
        b=DtIESmS3jCtxjijpeM4ix46PANdYjb3nLGLdXAiX3z4ouIDgr+W6o9+KfYhPUr4Itz
         ZCyl/AZXpwbdxRXC7tHUqcwKnC4/MQx1/8AG/wSyxAAxmFo8WIvCQRzTZgOqR0qWnUs0
         XJSL4SdS73azFeKlBcsXOl92ygoRV6XUuB2bwNopcnvm65S30maYyrhIklRgCL3kq3WB
         VgAaKvRokJ2jMdoWDDjuFdDc940TxLKyzX5YbrS3KgvMHmZQV+6zkfqZhdm0y0xl1zLa
         NDV7zf/I+TZPSc1wIsU05emlkxCmrF+syFhBBN5tMVMFf3oWgk8YF3UzWRfb/X0UkbI5
         y35w==
X-Forwarded-Encrypted: i=1; AKwUvByCKhZuWiGrnftcdi3MtFlL6xX/nw59FOLTA7UTyGgFMgzajW7k0B+pzvac05uljPVbTe0SYgO0xWAjZXg=@vger.kernel.org
X-Gm-Message-State: AFuF++k6JoYKftKHwHJ8CZrfM88gmS/vgqv8chb9zg3pvSz/G0BuP5M8
	bmqDHEDLPri6SeaR5oSpXYkUKGCS8r+IZ7ma4dkMWK/D7v2xwbxb8cEbHbDgZw==
X-Gm-Gg: AYBFou05oIq0cdQkAUlOSBhBlyuzKT2WpCQd3SZmbPysa7BCxmVm5ZT8Q7KZA13uZzw
	7t5Ixf1DTsGfZYB+/TsZ0xSBr5F12THCAybfb0/RFMCrsXbLjSPz1IDTTCWf8Ac9c/eO9XhBtLE
	gcI0N3ErnWsXg743gxbyWkSl0WAxooys8Lwavcqb41iLv+RmQGqeh2WiL8Hven8k4IgnV0puC6P
	+779tbC/BZUjai9z3qh0H3t78tfiOpeNvAU5SSyGLML+0MNtc4eIivhhrdxYcRjmiIlHr7lU3ix
	63hMAMYWNQZfZZ4Vih59tuFt4TE4lu8SaLN9GW6aGg0dsgNI/cVpe9mdYHeQeZkkME8vwZztMYa
	HGaFUIY48ij8RkvSfOaRAnhZqTNtL4xRrsG0sqQxem32hTSsRR1Uy4FTVYf3EYqfWWiMjkyG/jM
	3e0CbE5tA3fno+BWddkKCR5JFKOpnrETE4Yfy7pvB3/DybpJzuxHPBy1uYTN1uvwO2A83/27mL
X-Received: by 2002:a17:90b:17c7:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-396d0fc1b2fmr38536445a91.16.1788180963934;
        Mon, 31 Aug 2026 05:56:03 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d776d0dcsm5645997a91.4.2026.08.31.05.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:56:03 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 0/3] vdso: Keep the CLOCK_AUX base at full precision
Date: Mon, 31 Aug 2026 20:55:54 +0800
Message-ID: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thomas confirmed the CLOCK_AUX base precision loss was unintentional and
asked for the fix in this shape:

  https://lore.kernel.org/all/20260831102924-5f7570f6-7dc4-4996-9a35-db9c9f577dd2@linutronix.de

1/3 adds __iter_div64_u64_rem() instead of open-coding the iterative
division a third time, and converts the two existing sites.

2/3 is the fix.  Adding the offset in scaled nanoseconds needs the
normalisation to happen against NSEC_PER_SEC << shift in the tick, so that
the stored base stays below one second and the userspace fast-path does not
iterate more.

3/3 is independent and can be dropped on its own.  The assert is on a
parameter, so it depends on the compiler deriving the range from the
vdso_clockid_valid() bail-out; gcc 13 and clang 18 both manage it, and it
does fire once MAX_AUX_CLOCKS goes past the limit, so it is not vacuous.

Checked under QEMU with an auxiliary clock enabled through
/sys/kernel/time/aux_clocks/0/aux_clock_enable, comparing CLOCK_AUX via
the vDSO against the raw syscall at offset 0, at +5.123456789 s, and with
offs_aux driven negative.  The two agree within read latency in all three,
and over 100000 interleaved pairs each the vDSO reading is never ahead of
a syscall reading taken after it.

The 1 ns bias itself is not measurable that way: a pair of reads costs
several hundred nanoseconds, so it cannot be separated from read latency.
The argument for it is the algebra in 2/3, plus a sweep over
(xtime_nsec, delta) which puts the 1 ns case at 60% for shift 24.

Zhan Xusheng (3):
  vdso/math64: Add and use __iter_div64_u64_rem()
  vdso/vsyscall: Keep the CLOCK_AUX base scaled
  vdso/gettimeofday: Assert that the clock id fits the dispatch mask

 include/vdso/math64.h   | 21 +++++++++++++++++++++
 kernel/time/vsyscall.c  | 28 ++++++++++++----------------
 lib/vdso/gettimeofday.c |  2 ++
 3 files changed, 35 insertions(+), 16 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

