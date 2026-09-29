Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB093911C7;
	Tue, 29 Sep 2026 19:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709741; cv=none; b=m0bDkmUYQQF/quI3qeQfAyXuEs7Xk39FdHxXvRtWiE3Ufn0rcFAuQLqctimWFc2JbCj8bDqG32WzRHukLbWkaaIzHqhIk+TgxenObpwVL4JZZAXSN407l/IObsNO3T04Xaz6r46uyrqbq0IZkN9UIQd6kjawd7IBMVW71wcVXoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709741; c=relaxed/simple;
	bh=ebVjS1SJevnfW8LpsU6ABNzCBIIpw7fxUZn2feWSv30=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=VxWSN9mdnpgmK3anxFieID1RiJDpDnTP6D54XVIxKNjRqQXW9O8TpKyGGCKl0Fwxj0P8rXUK6Ai1UE+Y731455xr7jmoNildGpfus+lppWtf0+97evJ8kSS/WcarAVd9+dh/rRRGsD1sQYgL3SLabnOagANZOQZjKESg91/L7ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hdgrNQfT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DRb+qGLy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hdgrNQfT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DRb+qGLy"
Date: Tue, 29 Sep 2026 19:22:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790709738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7bFk0mCDCrrezCpoCph3UqRLWk0fp1J9vElYcEUXPM=;
	b=hdgrNQfT/7qPQ8iqSZYP0ytWXTCk9/A/kSiYb7x8yrq6sixOdUvkp56n7hJqaaIO24w/pf
	OeO9TbpxxLYSYs64FZQE95rIOO0/CzKR5iyRQ5gzIBxXoOCauVRGfjUgLpNjqI714LwN8T
	aTdXzk+rPqms7aP3LwFCj0IPIdchUTiU5rhmmNNYR+JcN2mi8lYiZW7yXCL0KFsaJWzdIn
	jk/GVp0JYhqho2X+Wd4T96oim9VDagcUYoyfcGRsLMrlGnjkgsbdgd4zfJaRSGUT2vfEsT
	6It5zOsYnnQjeUeW3IoQAdlBYAY0SmUVdU2MgpwWgiuFx83VK+UN+rRICJW54g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790709738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7bFk0mCDCrrezCpoCph3UqRLWk0fp1J9vElYcEUXPM=;
	b=DRb+qGLyvW06Z1j+qead5KOhpaOtz2L73Y6qfJ6krBOtZPOIlxANAM7yiE+5QIzlOtLWZ4
	Add7UntOdyLdyBDA==
From: "tip-bot2 for Karl Mehltretter" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] time/kunit: Add time64_to_tm() case beyond 32-bit
 day count
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, thomas.weissschuh@linutronix.de,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260925165702.51677-3-kmehltretter@gmail.com>
References: <20260925165702.51677-3-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070973642.3910103.14821955480431097046.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     3945c4a3ea151f777b4b098ebeecd2f85c20244f
Gitweb:        https://git.kernel.org/tip/3945c4a3ea151f777b4b098ebeecd2f85c2=
0244f
Author:        Karl Mehltretter <kmehltretter@gmail.com>
AuthorDate:    Fri, 25 Sep 2026 18:57:02 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:18:42 +02:00

time/kunit: Add time64_to_tm() case beyond 32-bit day count

The existing date range test covers +/-80,000 years around the epoch,
far below the day count at which a 32-bit long wraps (2^31 days,
roughly 5.88 million years).

Add a case at exactly 2^31 days after the epoch. Without the preceding
fix a 32-bit kernel returns tm_year=3D-5879541 and wrong month, day,
day-of-year and weekday; with it the result matches 64-bit kernels.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: LLM
Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Link: https://patch.msgid.link/20260925165702.51677-3-kmehltretter@gmail.com
---
 kernel/time/time_test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
index 1b99180..8b71876 100644
--- a/kernel/time/time_test.c
+++ b/kernel/time/time_test.c
@@ -87,8 +87,24 @@ static void time64_to_tm_test_date_range(struct kunit *tes=
t)
 	}
 }
=20
+static void time64_to_tm_test_wide_day_count(struct kunit *test)
+{
+	/* 2^31 days: the first count that does not fit in a 32-bit long. */
+	time64_t timestamp =3D (1LL << 31) * 86400;
+	struct tm result;
+
+	time64_to_tm(timestamp, 0, &result);
+
+	KUNIT_EXPECT_EQ(test, result.tm_year, 5879680);
+	KUNIT_EXPECT_EQ(test, result.tm_mon, 6);
+	KUNIT_EXPECT_EQ(test, result.tm_mday, 12);
+	KUNIT_EXPECT_EQ(test, result.tm_yday, 193);
+	KUNIT_EXPECT_EQ(test, result.tm_wday, 6);
+}
+
 static struct kunit_case time_test_cases[] =3D {
 	KUNIT_CASE_SLOW(time64_to_tm_test_date_range),
+	KUNIT_CASE(time64_to_tm_test_wide_day_count),
 	{}
 };
=20
