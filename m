Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141805;
	b=ytD1z6egPJa5W6vTVB9jHvS4M2uW3HyqBygKtKULod0v0B656rmn0gtUiwxGdC4hs03n
	 nrUheiAjGsNCl2MwgTwE2w9R8aLSzEFgVCs5aRbVyN2qXaXZde9QeaDTT4P7Q5Y2sLOAI
	 lVtvjuye0bLjjavyPWsd0OivEpgYrGfgiA6H0zDfV4Rc0x0uppJNBXxtE/YotSOLiDouT
	 MKGhNDBdL4f1JhPKTOEVYUbkmw5izF1UkuAm7rtgCu2cHZ3I8X6RagBPQ+4H41J86va0v
	 jtgh1Nc36Rpnjk8IYPawciXYL9tE4g7WZnUx3Y1N4nmsfyV5r+T5f+Vwv/hM/aayu1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141805;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=hwutejvqfl5rguXTTXHr75b3F9Go1tFMpPjHzLwYVSo=;
	b=EPYp3LrCu86VwAcu94lRzQgUi7GfpvdGT5JqsmI5Ehoawhj8eXyyrRMbkf/e8VGdcLg5
	 SNMcVOZVP22ASsU7/n7EvUCDK0UyUtLHhUh9mog+TS0pMH7RmKMLpGAdLfIah/hjp7TMc
	 c5rGQCZ6+IJPtO6qjjcrYF7AzCmn+fHR/d/d8R9D/6TtGOaAHlya4zGD1g8qden5s/EUe
	 zrJOruj48iQI0lgOefh/TVCRX1aDyUNL6EyzGTTYRTqN2iLKRyNrkJRR4JkErodKIvXQe
	 xgQSJQ47mOmnGc7kVyFyVotpuAz/PHxsegwRGea3PSxMGByPjY0sLbcxOJ1G2CXvNyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cdA+sdJ7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5caOTJcK;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93001606A331;
	Sun,  8 Nov 2026 12:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93001606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cdA+sdJ7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5caOTJcK
Date: Sun, 08 Nov 2026 12:43:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794141803;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwutejvqfl5rguXTTXHr75b3F9Go1tFMpPjHzLwYVSo=;
	b=cdA+sdJ7Nli4YFtQmo1td1yrIX5dtIzKV2Y33xzizcgpek2PvygRSpU6CGWsxM/Oe31MTD
	SgmUPydRtj3FwicKG8LijVowZkRO78wsMJxt8gKAeHPNQ+myM05Zqy9X8gYiv+KKeCRfZK
	KjrO1PVT/67R8DhZTufW0mZgNhtolWm0okVeSyt+kW+mOxcCenebr9pVixkfwU5tq9kMBk
	HFkJfaVJgvBH5MpXUaqUOUClJpZBQ0dDmF0nNQHCghuG/s3xTvVZAZOoCidmj5AnQUTnO0
	8oJBvu25MJBANxONI2yywDAeTvLTRkLKAshYcZJTod62EouOPt0BOQXC6brleg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794141803;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwutejvqfl5rguXTTXHr75b3F9Go1tFMpPjHzLwYVSo=;
	b=5caOTJcKTifI1sEbFOoOn1jE8OIPy0feemQsq5AvgVzv/ZoPsRvuNcMNzJnwLz/7eWAZ/v
	Pmja06eeJh6DGeBw==
From: "tip-bot2 for Sasha Levin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: core/rseq] selftests/rseq: Avoid an ordered comparison of
 function pointers
Cc: Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011223358.2327625-8-sashal@kernel.org>
References: <20261011223358.2327625-8-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179414180151.2093942.11410108956895285591.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the core/rseq branch of tip:

Commit-ID:     f99b08f3e685e6276ea899a51f00d0d1f2cad4ca
Gitweb:        https://git.kernel.org/tip/f99b08f3e685e6276ea899a51f00d0d1f2c=
ad4ca
Author:        Sasha Levin <sashal@kernel.org>
AuthorDate:    Sun, 11 Oct 2026 18:33:36 -04:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 08 Nov 2026 13:41:53 +01:00

selftests/rseq: Avoid an ordered comparison of function pointers

ASSERT_NE() compares its arguments with the relational operators when
printing a failure, which clang flags for function pointers:

  legacy_check.c:41:2: warning: ordered comparison of function pointers [-Wor=
dered-compare-function-pointers]

Check the result of signal() with ASSERT_TRUE() instead.

Fixes: fdf4eb632683b ("selftests/rseq: Validate legacy behavior")
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261011223358.2327625-8-sashal@kernel.org
---
 tools/testing/selftests/rseq/legacy_check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rseq/legacy_check.c b/tools/testing/self=
tests/rseq/legacy_check.c
index 3f7de4e..b59c4cb 100644
--- a/tools/testing/selftests/rseq/legacy_check.c
+++ b/tools/testing/selftests/rseq/legacy_check.c
@@ -38,7 +38,7 @@ FIXTURE_SETUP(legacy)
 		ASSERT_EQ(res, 0);
 	}
=20
-	ASSERT_NE(signal(SIGUSR1, sigfn), SIG_ERR);
+	ASSERT_TRUE(signal(SIGUSR1, sigfn) !=3D SIG_ERR);
 }
=20
 FIXTURE_TEARDOWN(legacy)
