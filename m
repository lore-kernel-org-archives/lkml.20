Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5BE3793D0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526007; cv=none; b=oj4XO9jdpCMoBAwpNoGb5joZq2q17qggv3kLqnijYr+Lf+Q3naoEwlIGjidjR+80LZ1n+Oq58EPV7IxECFTVKplfGA7bTnW7ab51NYpRuxlrxm1gwuBAlag8tGrglRGj5Lb4+vwoOEMXgYi4R1y9QHHHhtTta3hoSbQxpXKhdpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526007; c=relaxed/simple;
	bh=A4/1ri5HuIDttueCUT0PCIq2gr18ZPmxmc1yUhOG+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UfSNUTHJqxo7s+3AkQEWaCg8haJbWchsqfc934+8gVCUshOI0yEqfHWvQCA3tbHBZRcGc7jG9DqRkeUbwaXOZMDAWCi3XMPxvvCUfBK6l8fgfLlihZPoWNlJCzTn6mUdC8Hyr14TpwucAVP/IVjt5UFtoe5HFVU0kzHBbrHGVEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhILKFaO; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhILKFaO"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso465805b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789525999; x=1790130799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hy/ujTz3CUWmNrrscj1BmpB2cqE+O9iKHNdWqpEvyjc=;
        b=GhILKFaOwy7m4lMN7/Y+MdvbuAMCmjjooo0UB9lSdESekAW0HCpimwQdWhprJyxoxK
         2pLLy/pxOVEPCt7TTxPOZEhHWixsKGW9G0aT8uLtZFcZYUaHGA5ePREwaNh5FrdBhVbe
         PLWJL86A2yaUzlNjP/uop6sKbrak9cm96UmhZpmkJkRwdpuO2NCtUhy5C7NXwk1kAnsI
         p4p8COfLCe3+qXKB2j3XKmXMR796qqfKKheUchb5EKs7b8sSL5xAsvW7uvJl8GGzngsj
         pvqDaqwN3c0CHO8HGnqZgqGha6XXvJVyBjes2k/RbxEepRX7Laai4RYal+DL7UsCDogO
         5uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525999; x=1790130799;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy/ujTz3CUWmNrrscj1BmpB2cqE+O9iKHNdWqpEvyjc=;
        b=2Vmfe48u4qbWWuLGrj2CXi5XjbgW3ZbA4cmJ5W0gFy8MX0Kj+pvPrXjJKFD0Y1x/fv
         GkhFHrbtsSDOJEr6fbL07g2uq2Mm+C3IWL6mgflzO+jNrm5LQiY9FTeGaH/xXLqAawRa
         o2yyzhi4OthrEKJrkwcZMaiDTLxFXsg1uXBA5dzs5xruujDOpVa8JhMYUbeNVzlUjiC7
         MSCPGKDW5XLE+/bS1pAZ24z7y7AvcleLFdecZFGJnHfGlzxRh/5Kef9bLU3LnaXAbIxT
         SYv1DMrC3r585pZmDhsflvJEgxNwW/Hkwu/TJPixOM8XNpj5N9M+mNXKHDryyLH62XLR
         Legw==
X-Forwarded-Encrypted: i=1; AKwUvBxws3CXCddMaSj9am04Sv+UH5HOrWQd3J/NgIxlqtwFaRCoBsprzLehCPqkMET+Y6mUJYSLQHlQ9UaRJV0=@vger.kernel.org
X-Gm-Message-State: AFuF++kMcuSZqVDcSLozDgY7VFuSHlQaZehXD7WTQnbJ01nJpbBmZo73
	MJwoQIp6xJnA/7hZ0b8ruHflsVpUgAuEFrVHxe2laphxbsS+76kE4IZD
X-Gm-Gg: AYBFou2qowZUffkr7iM6etlCE6NwAMVROpq6wBD5BGzlhgtjmAC7yEvEgCRrbpEUcO2
	B2G/bOSX5zdS0yTAjCBq7HLQvq3uD5U47tiQ5WsQPS3vb9i5du2cE/DfTbULnPJsvHWfm97aytB
	WPfLiuJ1xcemTv4+MSX7n16tl5fWCFtJTqq/D/ELHmE1fUhMp8kWEajelbneImVThRZmZyHVIpM
	+LXFZBHp8877Z1m8GdD0FUmrNFzFZSNkrRwW9IMMgkfrQD6REWoOGYaor4a9zcw6YMqXVdyq5Gj
	XLrFWrjAsZJRlV6YMqjT0vJxMYUr/JVb63V76O4GvxQEkdK6qOo4FTbva7KAKFK7+tYVlm4fVYA
	PrBTJkyRZaaD6oMIMnivErI1ak5JkLS6ZXI5J6rxTlTmyptp5j4j4yq8cetxaLYbxDRrFxQahiR
	gvwZ7XmFKK/DzFxDHo23Nu0SeQAbmssAJX0onycX+axLWwQzWgccLFJ2VObdZ3Wu1IMbG6lvJVd
	BKMKXpao/k=
X-Received: by 2002:a05:6a00:9296:b0:871:41fa:d1d6 with SMTP id d2e1a72fcca58-8723cf31f63mr1313742b3a.14.1789525999470;
        Tue, 15 Sep 2026 19:33:19 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720123e374sm381370b3a.24.2026.09.15.19.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:33:19 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	thomas.weissschuh@linutronix.de
Cc: luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v5 3/4] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Date: Wed, 16 Sep 2026 10:32:51 +0800
Message-ID: <20260916023252.418473-4-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The vDSO basetime of a clock is stored in the scaled nanoseconds of
tkr_mono, so that the reader can floor the base and the cycle delta
together in vdso_calc_ns().

vdso_time_update_aux() instead shifts the base down to nanoseconds, adds
the offset, and shifts it back up, which zeroes the fractional nanoseconds
of xtime_nsec.  The reader then floors the base and the delta separately:

  ktime_get_aux():  base + ((delta * mult + xtime_nsec) >> shift)
  vdso:             base + (xtime_nsec >> shift)
                         + ((delta * mult) >> shift)

Since floor(a) + floor(b) <= floor(a + b), the vDSO reports 0 or 1 ns
below the syscall for the same clock.  It is not a monotonicity problem:
across an update the step is floor(a + d) - floor(a) - floor(d), which is
0 or 1, never negative.

Add the offset in scaled nanoseconds as the other high resolution clocks
do, and normalise with __iter_div64_u64_rem() so that the stored base
stays below one second and the userspace fast-path does not iterate more
in __iter_div_u64_rem().

Only the sub-second field changes.  (a + (b << shift)) >> shift is exactly
(a >> shift) + b, so the seconds carried out of the normalisation are the
same as before; what the old form dropped was the low shift bits of the
remainder.

monotonic_to_aux.tv_nsec is a normalised timespec64 fraction, so it stays
below NSEC_PER_SEC even for a negative offset, and the sum stays below
2 * (NSEC_PER_SEC << shift).  The largest shift clocks_calc_mult_shift()
can pick is 32, which makes that 8.6e18 against a u64 limit of 1.8e19.

Fixes: 380b84e168e5 ("vdso/vsyscall: Update auxiliary clock data in the datapage")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/vsyscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index f43dd3f4744b..0e4b499328c0 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -155,11 +155,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
 
 		vdso_ts->sec = tk->xtime_sec + tk->monotonic_to_aux.tv_sec;
 
-		nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
-		nsec += tk->monotonic_to_aux.tv_nsec;
-		vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
-		nsec = nsec << tk->tkr_mono.shift;
-		vdso_ts->nsec = nsec;
+		nsec = tk->tkr_mono.xtime_nsec;
+		nsec += (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;
+		vdso_ts->sec += __iter_div64_u64_rem(nsec,
+						     (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+						     &vdso_ts->nsec);
 	}
 
 	__arch_update_vdso_clock(vc);
-- 
2.43.0

