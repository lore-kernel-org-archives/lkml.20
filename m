Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649956;
	b=IPFnE1uxyGf8sQE98wlxSXUPFKWMg4DnmPqAdCTuVQPxd+WJpQU1M59dlr/8y7NwjxRG
	 OfxHI/iaTgbC8oCWX+N71d7ZnatLpgTF5nde9inhvDpJ+7jC701JMbXKQyIn3bj6OUPO+
	 kqXw2GYEDLXmTz+qbaezHWdxi+Em8mq4yEDyah4od6Pavr5aIxVrrjMrvxCavTe8zaS2B
	 qzhIi3wdW6PbzLvJFLSTgpUUJsr/TGLJEhuCC8qS8t2ZaBPT8jlvMQIPwZLGfgiE2Rfhf
	 ZVGyYB5SN3B03/iMsBky4Zeh6p9vf6d5WrlLgWqof3DLCjWwcarBLXV6V7ro7H2yWZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=irEMTF2DCivOVax/5aZ/aZtTe/ItHTCtvHLV5jKcrwU=;
	b=ybP7bN0L1TdsnNlIjbM2pIQhGc2YWJiY/9pYGZTOFrROFNCc7bYso1xyumgwHUTIrlse
	 EqFoAkD8bIfBGV2QDzYSjocIYfuEx2/S/8904cGVTOFo658p2qO7VCRhcyDP1GlBgnZsI
	 29wonYZ29aor5v3wdhkRCOBdQDmikVEy88IVVDH+T0nJU7EXr2pKK9PMZs+cUr2fVMk/3
	 9wSaRXKr/cO9VDm4sCSjLV0/2VUNX0btxb1O8/miUVlqyhvPiR8ayygnSqHJGv88c4RAJ
	 c40jRH5cTgXIppfPB5p6WYzGbBDoqhHFu+vEfPPUKSt5m3FtTZM9mHv6sG+dUYDEnHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6892606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6892606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHq-00ARzD-V8; Mon, 02 Nov 2026 21:05:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=irEMTF2DCivOVax/5aZ/aZtTe/ItHTCtvHLV5jKcrwU=; b=aKGzCU4NOwDOBB0lCs9ktmQhj9
	vF6h/TOywsNIOcj3ozWqkO2TJqzASSifwNvg36ZgC+53JG7uw02QOoUiHG1OFqeg0+zHWUAAHQGYV
	Y7fTjeDEgfkFdfvmbKFwHr+Ami7WsNtKSwTrEk/Nn3DMq7pEGwQ+FfbG6BIvjzdBBlV14LPHXFcWx
	qUjSthSGoeQMQN2aIVInwcDE8MIkx95c7Q9GgCa+kL/GnRLgGmvU4m96dpDoUr1aJOuyZBDCqYj/3
	veO9BGUttnC6RFLnUfnk4SF3zQ6ghPAKI8QU3BE30LaQ1AtgyJGk0+y9XgHItXYwf7TjIG+DwboOY
	qG1SuT/Q==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHq-0002nL-LB; Mon, 02 Nov 2026 21:05:46 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNyHd-00AUIb-C0;
	Mon, 02 Nov 2026 21:05:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Kir Chou <note351@hotmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH next 4/7] random32: Change prandom_seed_state() to be a real function
Date: Mon,  2 Nov 2026 20:05:19 +0000
Message-Id: <20261102200522.3337-5-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261102200522.3337-1-david.laight.linux@gmail.com>
References: <20261102200522.3337-1-david.laight.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no reason for it to be inlined.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/prandom.h | 10 +---------
 lib/random32.c          | 11 +++++++++++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index ff7dcc3fa105..d4627e62098c 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -37,14 +37,6 @@ static inline u32 __seed(u32 x, u32 m)
  * @state: pointer to state structure to receive the seed.
  * @seed: arbitrary 64-bit value to use as a seed.
  */
-static inline void prandom_seed_state(struct rnd_state *state, u64 seed)
-{
-	u32 i = ((seed >> 32) ^ (seed << 10) ^ seed) & 0xffffffffUL;
-
-	state->s1 = __seed(i,   2U);
-	state->s2 = __seed(i,   8U);
-	state->s3 = __seed(i,  16U);
-	state->s4 = __seed(i, 128U);
-}
+void prandom_seed_state(struct rnd_state *state, u64 seed);
 
 #endif
diff --git a/lib/random32.c b/lib/random32.c
index 53cb289a5db4..83776345adda 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -130,3 +130,14 @@ void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state)
 	}
 }
 EXPORT_SYMBOL(prandom_seed_full_state);
+
+void prandom_seed_state(struct rnd_state *state, u64 seed)
+{
+	u32 i = ((seed >> 32) ^ (seed << 10) ^ seed) & 0xffffffffUL;
+
+	state->s1 = __seed(i,   2U);
+	state->s2 = __seed(i,   8U);
+	state->s3 = __seed(i,  16U);
+	state->s4 = __seed(i, 128U);
+}
+EXPORT_SYMBOL(prandom_seed_state);
-- 
2.39.5

