Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC964A1DE7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186669; cv=none; b=e5iqg6RRTg3FBO9mhenC48FfO1jIs0CR/Mv5ZnX7p23Cp8iMQgUyKbPcpY+CFxuHnZe3WbbhTmwes/68hQFPNAkrPnnoRMV0q6ZYCca6e9EkDIkJOJczxsGpX3/VRrUWW11jSvW6y+9kxboyQbaAXtd6/WuS0+f283iWZU61AdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186669; c=relaxed/simple;
	bh=8JWcZcSbKiZgsmRV1Y1OcStfvIfC+SugJo9Q81iZvpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NIYpeOM56FrGP7AfPzKtSw2el89Pr2vhCxpKLqUrADo9DJ3HwO3PRIfRh52eUdmH6IN0yd+2hRlmq1ceugLL6rA69vEjYtb3Iq38plq/cvhnsEQOIljO04rGgYInNVzhoYHoSArFzrzMymuvFW/NUo7W7OJtTnficKeODi+MX/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pONTGYE9; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pONTGYE9"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-851cbd64814so1678666b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186667; x=1788791467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZ5oUnPH+Fi+rmudX4EiRwks3Vn6HHm7xh6Ub6H58ZE=;
        b=pONTGYE9fWLt08pbtMLifWPm+N1YrVvy78VikiwV+nJTPICLgprPLEF70GmUlqPB+t
         Ny5AVreloM4/PmCZPkKqEwbudlej3lMgws0qE4khEPbl3LAg+8LUT/yqV0Iei/kOODcg
         PTqU4nPgf0ZNtBofiM9EjBbhKRJ3mj6GEraOkZmxcOkbaAkrJjVQ5Hns/+IsRVYdFFx9
         4kuvwWYw6dlAQnSZKG58pueOb+xFwMUlbRqH8aeNDmoK09SEx8uj+sdYBJUIZb5GxTae
         hjaabpd//5RzRmf1i4ER1ldSK5ilDwE68/WIfw9LplEc/L9PEkeN5Zrv0s7n+3NU6tOX
         hBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186667; x=1788791467;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZ5oUnPH+Fi+rmudX4EiRwks3Vn6HHm7xh6Ub6H58ZE=;
        b=O6A4vRAU37jBZHnntWHQHSfVBcuqZXQrNmbCrWW6qLQoZtwGwDCzfu+cSmdMG4kSDd
         ffIP4EexilC2C6pKTIVECai2Q2lF1K+ghNxzAhh6AvZkLUb/jX95cdH8qmUbwF4i8pRv
         F4/QvzUf5ba/PQMhGZ0/8o9dJEmPZM2ZqysnBbcm1S61pIoo5TlhVDBGCcaQ+lvyYV+P
         7ZQ1C3yTJdm3m6vkzLCLhwY19TCEApSjHIn45hrLW4/bOGObD3tR2DHoZdOVvNBlupWI
         //t80wZyEAl+trpWO/mNQh6Ao8XG6yABy3QmJ9poZ1jcab1r9xvh+TR14A6tt+PHQecR
         ICCw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+EfmrrI0v2Uwwy/4GHQql2HMGPr+TmWPV9B+EOCBi0XzdzKeI7Fmsu3CDivhBVhZ3DcUXd/JcJnqf68g=@vger.kernel.org
X-Gm-Message-State: AFuF++n3AX9eAuQsLoGQ4oRZeAr3SMhsqXAsFKqmzRC3PNLd5/cG5SZ0
	04G68bWHEhvEyNAxrjkzdgX6FCKrz2VAvBNryboP/vQjbf8gi02MUJ1a
X-Gm-Gg: AR+sD13wh1Sd2UIVOTSSSzlJRiEpXaEJkXnGJWfmSb8NoHHeEsYkeGu2fbYeS9bOcHX
	pKu4UCjDSQRpMUXnUAWH9tW7ueOHmOLVqEkqPSHbj64cpx7+0npoPlJB4CqPMHqPsWRnW3sA6ey
	6D5QalYvG4ZMBoMEJc7OP/kqUJGT8o+nDoHba3z3+vkxD10Hv2L9bVhVTCmq5lZk8keYNj54JxR
	T8dKEYL0KylxUOcujQRN30q4lybKixsxqsg7TW/yt+t6kwBler4bJLx2jt72OaffERG0GJvFx1q
	T5mUw2b/Aub+fLPkdnoDDDovQXT5TllrhBHmV4PVss6OBlp7yofK9yPjPcK2WEATI9/8Nhnf/nO
	SGEuANxIILDOyD5uKRXJ9b6wHovfx97AMkn1+UsNpvvUAQIFB2HJ+EhtLa8X6pFMwt6NOZyL4Pt
	/zUwcSC+IKx5DaM6XHhmVxqHesGy6C5iiX+AQbqGKAlrdXUd1+fRJmktJUe87B3SRX3DYmgcqz
X-Received: by 2002:a05:6a21:b8f:b0:3d3:ad3c:49a8 with SMTP id adf61e73a8af0-3d3ad3c6cb0mr30102499637.22.1788186667148;
        Mon, 31 Aug 2026 07:31:07 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm4248961a12.10.2026.08.31.07.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:31:06 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2 0/3] vdso: Keep the CLOCK_AUX base at full precision
Date: Mon, 31 Aug 2026 22:30:56 +0800
Message-ID: <20260831143059.1592875-1-zhanxusheng@xiaomi.com>
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

Changes in v2, all from Thomas' review of 1/3:

 - Drop the nsec_per_sec local and spell the divisor out at each site.
 - Store the remainder straight into the basetime, as the coarse clocks
   already do.  It works at every site including CLOCK_MONOTONIC, whose
   remainder feeds CLOCK_BOOTTIME, because the copy can read it back from
   the CLOCK_MONOTONIC basetime.  That also makes the copy take sec and
   nsec from the same place instead of one from the basetime and one from
   a local left over from the division.  It is not a codegen win: gcc 13
   emits the same 419 instructions either way, with two movs scheduled a
   slot later.
 - Keep "vdso_ts->sec = sec;" on its own line under the copy comment.
 - Keep the asm() barrier rather than OPTIMIZER_HIDE_VAR(), matching
   __iter_div_u64_rem().
 - 2/3 drops the same local and stores into the basetime too.
 - Picked up the Reviewed-by on 3/3, which is unchanged.

The problem 2/3 fixes: the CLOCK_AUX basetime is shifted down to
nanoseconds and back up, which drops the fractional nanoseconds of
xtime_nsec, so the vDSO floors the base and the cycle delta separately
where ktime_get_aux() floors their sum.  The vDSO reading ends up 0 or
1 ns below the syscall for the same clock, and clock_getres() advertises
1 ns for these clocks.  Thomas confirmed this was unintentional.

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

