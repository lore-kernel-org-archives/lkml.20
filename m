Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5C72D77F7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355450; cv=none; b=L5iJHyewbA7bvaW9FMHG2T9JQ66rjV9siE/nkZ0uNYXgr/Zz0tQ0cd/P1pV60fomd3GB8d07kaJVyssOC8A92kW6qxEquM4SJvd9UVQtMLKxynV09TaMXbauEJ5yRCfRkisN1wixczu+EvlET6oIDjBDs/vjX9+CzueZW9KxkZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355450; c=relaxed/simple;
	bh=z/bCn8iYH5OH94S5ln4YbRVsxMDASAN4nggVicBGOWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=meQrwzCV8Rkp2dfIdovcdk7R2fJ2+IRQedaR0gwfxquCEZZ5llYExEkjBfW8Ro3tSAsh68vWRjecc26ZWXYx92+jP0ZpolX6WoajawjxVrl8u0hFPjAnxVsmYVomyLQGpVzT8AQcnF8BmI3shKdx0CdAfCiReTTfv19HyGL/40Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn2yB/7U; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn2yB/7U"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so6928075e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355435; x=1790960235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8+cDpA4o8IIv8At6bigSA0d6QqqnQSZKyoTG42fL74=;
        b=Kn2yB/7U9We8hFm5Yu+Mo0t0ajbvgdWASh3ofEZR5aicQINh8DKscVcF4CJvClmLl7
         3f/9UcYea1RfrfxtMAyLqRpJTg+Z2ZLJ/8AQsTACHGfcP4SFDAT/7RJ5oZ5q3Zpux/K8
         SG1frcoeHVfeHQIvrIbljQOIAQAG4ZRAcE5xBi4XXr9rk2KkKSExubMZZffrqq4R9UQB
         T+NOGc2LkYaC+U06gNk7D0FTNjQ3DPvIiecM/kHzAa1V5QZUO8yKKZ+6eJRyUKriq+OA
         QmBBdti8y2u55BCuOgKy7XyNNxMijv3x4KMH/BpYhnb3PX/YvrlQqHv2O+S6AtdQzKap
         NCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355435; x=1790960235;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8+cDpA4o8IIv8At6bigSA0d6QqqnQSZKyoTG42fL74=;
        b=J8i7hkjfYlYcuG9I+0Y0uv+sglYto0Pf/+4yYv1tI2/0LB8dEiSzzgH18HlV6OM6VL
         3XHjaqAKSlC7ltkpIrT6aLMvoc/xmgxM9aLxfCf+028nFJtFP0JEDbhZ9FCWVBsm81sz
         JNJzOWIowqZ90+oy6GraamV4MoeC/JQF0NfJ/9QMxylQtfmd9O2ciPDUf43Z9v3viGC8
         zIaNaH1CTj3uHLdRb0T2UZ929kavZyWqemY80dKH4v/T9LuRJQuhJKLNnM5D2X0zNZXm
         jHKwfraZb7stKvF8oWpgWBbFqMhywv8A2+cADhb1xxJHgkx7wnDhAKOpIr0Myk5r51xJ
         Gh0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxA1uZ47vAdMwlV6LKQtDoHYTJgswAWgrgGjcvG8bCYGXB7SgPvO42s5HkUxJRNrCoKTXRaRPTf2jHihYA=@vger.kernel.org
X-Gm-Message-State: AFuF++m6+HceoYu7bvBrllq68EMlZV/nGNsxFKHOkYF+anlzEX///DMO
	QfjZaGUHG2Aw/6+niuPzuCx6e6QMJFz4sXkrUS2tUbXsIpwcnMczOrpX
X-Gm-Gg: AYBFou3UaE2cQVaWCo+gJaea/YLag8ynCGuuNFLdbgO/U+l02WyoqtgNY+srVNo76h5
	GmEPJo40CvqjzjMUSxLQXMXkbYmYIOKD4EXibsgSz1/THbavdOL6Zbltan31tYeqEh4unyf7cDK
	5jIL3CBW40ufej+0H3uJ6maODpEAIHLQXXH3SPvbDgZ8p7XfV8XQgwU/M1e9a4SWuU7gYNplHEP
	18dOf6thhccIo72mGizvYkquqKIwYFOey4cZcqSdGGX8DUqzb7u1Ojm1X8z1cXPW/9g70z+Jzkv
	U8L2nTPAvUzlZ/n3/x15UdMHAH2Nlcp9pkMUvdXRxrAfZO25rsMM+TxncUih9tG3vB3trk8BZx4
	onFRXWgK1uKcKksJt5bHMNCg1Xf/DXRPOcSnXtiRUGT2Sd+pFhX1iAq60CiqcXAKLWdSgs40G6z
	ICRVF7UdX4sLBqRCdinX8PBgBm+H1vNCJkIT5d7FIHe4n5mghI/jHJ6jRc2RNz5By9+RElWvCUm
	Jmivf2tnLICy0l+5Wz8JeYuPyeJH/rfSUcPRQATTAecXX9aSPx6yu6tlm9Dc9NXu7CFgiOJYAFs
	4uMNteypXlbDsyTTdFMBtNx5rsXt/HU4dGw92QZs0RDfYvjHlV7OAjHJraHGr2NMSNWekRBOUlh
	kdu8AVVekPWa4f1XQ
X-Received: by 2002:a05:600c:1391:b0:49f:c18a:61c8 with SMTP id 5b1f17b1804b1-49fe66ff2c3mr114387595e9.29.1790355434688;
        Fri, 25 Sep 2026 09:57:14 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adc6-9c01-89ae-b145-8960-cf19.310.pool.telefonica.de. [2a02:3100:adc6:9c01:89ae:b145:8960:cf19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm8020363f8f.21.2026.09.25.09.57.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 09:57:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Deepa Dinamani <deepa.kernel@gmail.com>,
	Cassio Neri <cassio.neri@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] time: Prevent time64_to_tm() day truncation on 32-bit
Date: Fri, 25 Sep 2026 18:57:00 +0200
Message-Id: <20260925165702.51677-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

time64_to_tm() keeps the day count in a long, which wraps on 32-bit
kernels once it reaches 2^31 days (about 5.88 million years after the
epoch). Patch 1 widens it to s64; patch 2 adds a KUnit case at that
boundary.

Why years beyond LONG_MAX are not handled: with this series the
calculation is correct on 32-bit for every year that fits struct tm's
long tm_year. Timestamps whose year - 1900 exceeds LONG_MAX (about 2.1
billion years; time64_t reaches about 292 billion) still truncate, but
only in the final assignment to tm_year. Fixing that means widening
tm_year for every struct tm user, so I have left it out of this fix.

Changes in v2:
  - Split the KUnit case into its own patch so the fix can be backported
    on its own (Thomas).
  - Declare 'long rem;' before 's64 days;' (Thomas).
  - Carried Thomas' Reviewed-by on both patches; the code is unchanged
    apart from the declaration order.

Testing: time_test_cases KUnit suite under QEMU, i386 and arm, built
with clang 22 (LLVM=1); arm also with gcc 13.3. With the series both cases
pass. With only patch 2 applied the new case fails on both architectures
with tm_year=-5879541 and wrong tm_mon, tm_mday, tm_yday and tm_wday.
timeconv.o references only div_s64_rem() and div64_u64_rem(), no compiler
runtime division helpers.

v1: https://lore.kernel.org/r/8d421725051450cecf0a7e6d2c514b6926df43b1.1788019619.git.kmehltretter@gmail.com

Karl Mehltretter (2):
  time: Prevent time64_to_tm() day truncation on 32-bit
  time/kunit: Add time64_to_tm() case beyond 32-bit day count

 kernel/time/time_test.c | 16 ++++++++++++++++
 kernel/time/timeconv.c  |  6 ++++--
 2 files changed, 20 insertions(+), 2 deletions(-)


base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)

