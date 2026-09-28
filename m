Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7D48FF76
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588177; cv=none; b=VHMigCEiIl808nV0HFPIXeQ7bAub93mv9EzWN0NfMZ77RxlkLZWHSOAiTktQRFYwAJhdkPLXQ4+RdyjcEuJXEiGBsBcrK14MMxfuQkU6VrmRca3DAAyvNEQZQ3cj8/ZkTA/rmGddENneTBA5FBAnc5WJ9ccGRwO+bosKyT3/hrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588177; c=relaxed/simple;
	bh=PGT7LUJhNlIXxf24gKbbhICpLO9Jlio8+ef1uOPt6pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtF5Q4XS+BFS92fR1IpeGtgxzuq2ZL4HRNegvPt8w58BVIEpBbxlZ9Qo9oE6/Hn9TV5NL7vj6x3KE7pY/fFHQAsW9ffuv5KxTY50/CEkMiGp0oIA+Zh/Pq/IfvAJlFB9fRPHqFerYweeXtxhqG+unt02vXxFveP6VYWuafdJS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnO3KiTI; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnO3KiTI"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34346932d93so1181295eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588174; x=1791192974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kiVahB4Rxru6sjg2pkpTDslHHzWfM++l3bxz3pEhprs=;
        b=AnO3KiTISt8mshj/aHuh9/2Z10ocIZLaztx8mCBoLKL32x5zhksF7HUGKsmKbfTWw9
         HTyjYdlHqS85XB4TJ6KW81MjfuRzfSm4Xt7Ud/SHbSf/3c/ueA+QRidXgvY1zpERsFz8
         4yjAOTFIBtcwtxksYmepzTJaXwjBO5cTJOsO9BTXX+uGRhpzFXKNne/vMn6+ZQg2WaMd
         29H7Gdt35FUkoLrv5Sxe3yAQkR5DQV5HOMLwP0wfQIGZ5n7ZVkBT8RMtJn909B2vPaCq
         VpMgEQkKjXJEJPnKg5YXSwbiCpOZVKXfeNICTPmHsM+U6z6JIGjkJGwa4rljxvdIE5Yx
         oyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588174; x=1791192974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kiVahB4Rxru6sjg2pkpTDslHHzWfM++l3bxz3pEhprs=;
        b=cCvMqY0a5muSbegroHOyjEixZmzN5egivxRwDBtcdBUqFSBL3xg0Vc+K7wg4oNcE70
         dEowm+O0x1v9qunSCC1bdYFeSrAWAjaRbC640FF9gg589qtb5HrEsLEtJ8SwV2MQzz2+
         Tzgu0WbA7s3fHjg2g6V3F1V+APEX5+k1qIVvFnt9lQunxZnpZLFepVOvv1zUashb4P5C
         IxtTi+4FKFMLEGHjxw1Uv3TNRu5u2HsBnIXfT5nodadJdoxY0H9v40JlBcWRK0pIMdwr
         TYQLa3Gj2FuCtwn0/+skOV4TBuz/yXbJFv9RQ9WMKSlSja61P4eDrFMoy8AeTMtlwWpc
         KO7w==
X-Forwarded-Encrypted: i=1; AKwUvByFPslWVeLJFRsJgCiHVWVmP2xGSKLLsxjeDuy8TwWSvifMhp8gcK69nCatVa6gE3NDIYVCwlL9GQZqKqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnxZduT8SB0Zdfa0VG1IUzb4CKi8DwTjeUg/3i392g+k1C6u2O
	AkwSCpCOkI/1hjOdn15iHM/HiVytah1QJrcdvb/KlluDiBufzeXF8rSyd2jsM0pl
X-Gm-Gg: AYBFou2fiMELSPkFK7WUv4o/JJRRjc1p9KqlVutaQIA0K1Lza6jCU1Ya3IHGucu5FqI
	7HBo6UZYnNrh9Dc//Bu+fe6MStFwDBksZEo+AXP1RA9ByMPB2/27nBxXYREJ0eyhdHcGL23Ue+e
	1lUg7WzeEEgYrVM9QzUuVJ81lbQ2bdf7q4ezhERlhmN/tJTlpSwneOd8e2rG1Nq6cDNaL/lEfLM
	Sp9o7PSMjMiTs+0DgbeDd8FJAFRhsmkYqtxNmhyB7ArLlNyPDzQQQ7uXW2rALj73e6Hs3d/38N/
	bOsr1cQqizwoLHIDLvX2CvVeDtCRAX71SiigPVTaHroAsqAzn4nCUS8TA7Y+92IyId4wIUntdOj
	Qp8QWuGFVzPzLyjjnxayNnuHFDwJ6hBD8xBqroEWtBZPZ2/U2uGE3C5/EVR1scOwZAHgPGjSCju
	ggOcOW4rsxf1zlQGi740yxSChx3L6xUuYK8SpfK4ogF1Gm0bWqxMYQjbhnPxDFIFXN4xYpxMlOS
	HXhNDUI/XnvAtRZX9TGUuzhAM7mWOwNy3nr7LoXAw14uCW5xexrzrlVjKbblpuswQ2Rakfs8gC2
	OkB6KxsNGt2Y9HaQVKMmOuz/gQQrJA0DtxDk6WhJkw6QVA4XmyAsQHXq9ekyOpJZcHCLNAsf1w=
	=
X-Received: by 2002:a05:7301:fd05:b0:33b:ae55:7dc7 with SMTP id 5a478bee46e88-342702bdf40mr8537067eec.11.1790588173865;
        Mon, 28 Sep 2026 02:36:13 -0700 (PDT)
Received: from FT6N242TWK ([223.181.116.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm19014358eec.14.2026.09.28.02.36.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 02:36:13 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] time/jiffies: Use the exact HZ ratio in jiffies_to_clock_t()
Date: Mon, 28 Sep 2026 15:06:00 +0530
Message-ID: <20260928093601.79224-3-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928093601.79224-1-jain.sm@gmail.com>
References: <20260928093601.79224-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When TICK_NSEC is not a multiple of NSEC_PER_SEC / USER_HZ,
jiffies_to_clock_t() and jiffies_64_to_clock_t() convert with

	div_u64((u64)x * TICK_NSEC, NSEC_PER_SEC / USER_HZ)

TICK_NSEC is NSEC_PER_SEC / HZ rounded to the nearest nanosecond. When
HZ does not divide NSEC_PER_SEC it is slightly short (3333333 ns at
HZ=300), so a number of jiffies that is exactly a whole number of clock
ticks converts to just below it and is truncated to one tick less. With
HZ=300 and USER_HZ=100, jiffies_to_clock_t(300) is 99, and every
multiple of 3 jiffies is one tick short.

The tick does advance jiffies every TICK_NSEC, so as a measure of
elapsed time the old result is accurate to about 1e-7. But intervals
that userspace sets in clock ticks are stored with clock_t_to_jiffies(),
which uses the nominal HZ ratio, as do jiffies_to_msecs() and
jiffies_to_usecs(), and they no longer read back. With HZ=300 the bridge
defaults read as forward_delay 1499, hello_time 199, max_age 1999 and
ageing_time 29999 through sysfs and netlink, and each read-modify-write
through sysfs loses one more tick (1500 -> 1499 -> 1498). The neighbour
sysctls that use proc_dointvec_userhz_jiffies() behave the same way:
net.ipv4.neigh.*.retrans_time, anycast_delay and locktime read 99
instead of 100, proxy_delay reads 79 instead of 80, and
net.ipv6.neigh.*.anycast_delay reads 99. Inside the kernel, IPv6 route
lifetimes from router advertisements and netlink go through
jiffies_to_clock_t() and back through clock_t_to_jiffies(), so at
HZ=300 those routes expire 3 jiffies early.

Convert with the nominal ratio, x * USER_HZ / HZ, like
clock_t_to_jiffies() does. With USER_HZ=100 the result does not change
where TICK_NSEC is exact (e.g. HZ=250). On alpha, where USER_HZ is 1024,
NSEC_PER_SEC / USER_HZ is itself truncated and the old code returned one
tick too many for large values (jiffies_to_clock_t(976562) == 976563
with HZ=1024); that is fixed too. The value returned by times() now
advances by exactly USER_HZ ticks per HZ jiffies. The product also
overflows much later than x * TICK_NSEC did in jiffies_64_to_clock_t().

The TICK_NSEC based conversion predates git. It made sense while
TICK_NSEC was the tick length measured from CLOCK_TICK_RATE, when x86
returned 99 for 300 jiffies at HZ=300 and for 1000 jiffies at HZ=1000.
Commit b3c869d35b9b ("jiffies: Remove compile time assumptions about
CLOCK_TICK_RATE") made TICK_NSEC exact for HZ values that divide
NSEC_PER_SEC, but left the others rounded.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
The KUnit test in patch 3 fails without this patch on qemu x86_64 and
i386 with HZ=300 and passes with it; UML (HZ=100) is unaffected. It
also passes on UML x86_64 with HZ/USER_HZ temporarily edited to
1200/100 and 1024/1024, both of which fail without the series. In
userspace, with the code extracted verbatim, both functions equal
floor(x * USER_HZ / HZ) for every x below 5e7 and invert
clock_t_to_jiffies() for every whole-jiffy clock_t value below 2e7, for
every Kconfig HZ value with USER_HZ 100 and 1024, 32- and 64-bit. The
bridge and neighbour values above were read back on an x86_64 HZ=300
kernel in qemu, before and after this series.

Possible follow-up, not part of this series:
tools/testing/selftests/bpf/progs/bpf_iter_tcp4.c and bpf_iter_tcp6.c
carry a copy of the old TICK_NSEC formula so that they print the same
values as /proc/net/tcp. The test only does a dummy read, so nothing
breaks, but at HZ=300 the copies no longer match the kernel.

Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 kernel/time/time.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/time/time.c b/kernel/time/time.c
index 470195e88ca0..f19e742c9562 100644
--- a/kernel/time/time.c
+++ b/kernel/time/time.c
@@ -684,7 +684,11 @@ clock_t jiffies_to_clock_t(unsigned long x)
 	return x / (HZ / USER_HZ);
 # endif
 #else
-	return div_u64((u64)x * TICK_NSEC, NSEC_PER_SEC / USER_HZ);
+	/*
+	 * Use the nominal HZ ratio like clock_t_to_jiffies(); TICK_NSEC is
+	 * rounded when HZ does not divide NSEC_PER_SEC.
+	 */
+	return div_u64((u64)x * USER_HZ, HZ);
 #endif
 }
 EXPORT_SYMBOL(jiffies_to_clock_t);
@@ -729,12 +733,8 @@ notrace u64 jiffies_64_to_clock_t(u64 x)
 	/* Nothing to do */
 # endif
 #else
-	/*
-	 * There are better ways that don't overflow early,
-	 * but even this doesn't overflow in hundreds of years
-	 * in 64 bits, so..
-	 */
-	x = div_u64(x * TICK_NSEC, (NSEC_PER_SEC / USER_HZ));
+	/* Nominal HZ ratio, see jiffies_to_clock_t() */
+	x = div_u64(x * USER_HZ, HZ);
 #endif
 	return x;
 }
-- 
2.43.0

