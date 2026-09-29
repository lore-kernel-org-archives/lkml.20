Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6453DF00B;
	Tue, 29 Sep 2026 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709742; cv=none; b=kWUaYq9fBi6ix7KwqSaafTMsSBdTq3hWqHEat+knKbjBYvYqD1SgD2U4QmtqRJoxWPlhxcAkUcPVZy6MdI9/zlhrROyeaEpM/S/n3NWpfbuHh9HB+Iwf0UChzYDIE0osubZZYy+TXpYO5M8Ja3oWAIZScUqRlyfcINit4ysVGec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709742; c=relaxed/simple;
	bh=0TUQLwiE0x0ZXS8CLuMe8EUmSABPae9Whz3kH0OgEVk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qhO8Yo0LLtBz3210wYUpFviiKdv9/UrTLs2A3UNTbNUtZfJ+zpPiXYgD8gN6a37CpN+q0oSH0ttapcQ9WZsJuZ1rLiilLFWgkir1ieFL+PUlK8vvy6TH9FY5d8LPiQQOXe1Qgne9TXCQq4gcjRQ3uc51/h8rvyzaExVj4L1RXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NjuuA8Pc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B+oraiRf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NjuuA8Pc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B+oraiRf"
Date: Tue, 29 Sep 2026 19:22:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790709739;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQSKJz4L3mjf5A1PR2ahMvfXjy8zgOtrrmV/UPzt6nY=;
	b=NjuuA8PcgAVTMjk3ChHm3HPqQSjJFKee/roUcLSPZ1HykrYM2/ZGK1C3Q5uAcOhQz7Llz8
	K95XHim0VWM5zjnUapP8viiGCXXXsTRpRv33gr8D4zjhuQZ5C3weStrQJ9HWEga04XLSXM
	ReFFViG5SFIqpAaQ7Ry6gS0m57ujOtZ8sl+meKoKPPnSD1RAf3VGaW7OmVM9tac/BOlyK2
	BdtXPj642fxi5bNtoYObOmHtN5icePi6AdmcQH/wlxzoHx6liPeHFjAfgpaf8xRVt2zwZH
	GD1gJOy/mNP65xBeCFJzXf04ajgUgcrMLwHyZsvfLS2IJBuUTEHjr/bgUc0A2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790709739;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQSKJz4L3mjf5A1PR2ahMvfXjy8zgOtrrmV/UPzt6nY=;
	b=B+oraiRf7pqVMYEWhNJPdzUWDEhtX64eY2ymOvLHtcD6SF6rl/MTzxX59tpRMDaGo8EIAF
	5ZAjapA5MLbzLhAw==
From: "tip-bot2 for Karl Mehltretter" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] time: Prevent time64_to_tm() day truncation on 32-bit
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, thomas.weissschuh@linutronix.de,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925165702.51677-2-kmehltretter@gmail.com>
References: <20260925165702.51677-2-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070973803.3910103.15764442265132096616.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     2927f7ca78448781e11a4623d347cd653c28adf6
Gitweb:        https://git.kernel.org/tip/2927f7ca78448781e11a4623d347cd653c2=
8adf6
Author:        Karl Mehltretter <kmehltretter@gmail.com>
AuthorDate:    Fri, 25 Sep 2026 18:57:01 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:18:42 +02:00

time: Prevent time64_to_tm() day truncation on 32-bit

time64_to_tm() accepts a 64-bit seconds value, but stores the quotient in
long. On a 32-bit kernel the day count therefore wraps when it reaches
2^31, even though the corresponding year remains representable in
struct tm.

This is reachable when formatting externally supplied timestamps. For
example, NILFS recovery copies the little-endian 64-bit ss_create field
from an on-disk segment summary into time64_t. Its sysfs attributes then
print that value with %ptTs, whose formatter calls time64_to_tm(). A
corrupted image can consequently produce an architecture-dependent printed
date.

Keep the day quotient in s64 while leaving the seconds-within-day remainder
as long. Use div_s64_rem() for the weekday calculation so 32-bit builds do
not require compiler runtime division helpers.

Fixes: e6c2682a1da3 ("time: Add time64_to_tm()")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: LLM
Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Link: https://patch.msgid.link/20260925165702.51677-2-kmehltretter@gmail.com
---
 kernel/time/timeconv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timeconv.c b/kernel/time/timeconv.c
index 59b922c..aed3af9 100644
--- a/kernel/time/timeconv.c
+++ b/kernel/time/timeconv.c
@@ -49,8 +49,9 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm=
 *result)
 	u32 u32tmp, day_of_century, year_of_century, day_of_year, month, day;
 	u64 u64tmp, udays, century, year;
 	bool is_Jan_or_Feb, is_leap_year;
-	long days, rem;
 	int remainder;
+	long rem;
+	s64 days;
=20
 	days =3D div_s64_rem(totalsecs, SECS_PER_DAY, &remainder);
 	rem =3D remainder;
@@ -70,7 +71,8 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm=
 *result)
 	result->tm_sec =3D rem % 60;
=20
 	/* January 1, 1970 was a Thursday. */
-	result->tm_wday =3D (4 + days) % 7;
+	div_s64_rem(days + 4, 7, &remainder);
+	result->tm_wday =3D remainder;
 	if (result->tm_wday < 0)
 		result->tm_wday +=3D 7;
=20
