Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649955;
	b=mwefv36vkNbQy6MN+jzECDojowXzuwRkibX52RZyj/zFZgmCZtFqhjeSDMdv90Wc+tnE
	 4umN1BVLpRlw0o2IJc0RItFWcOQeBKqds00tx7h+yWDjeH0AKfByoV5sS+9EsR6VL6rOu
	 zH1ZSX0JyZWceKv3ojUClILUZMq/NfHhpoYya2eQlD7eLltC9cRhbxnsTpxbg4GehAppl
	 DclfaNfg/HN3QsMiszaRh4WHg1oTWMu+KUoA0eCWxE2Iz9eG/d3nSornjFuWL81of4iMc
	 g7OR6mVWn8T0j7QZYjK+D7EmGH6tVbY/S2wgvT0MT3ZlvLgSQcy1FeCvK7MD2FPIbWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=af5cAjoTJMICk4/K/aQVYoMys5HKuYkh1BgXlZFXPKI=;
	b=R+Y++3AiNUT3d1zDt9CgOr81nn4Vt3nHu98IUNDRSfMU3blIhIuA/yUFLDIq6i1/Slqk
	 9r8sJysNaw9RExSWOmM4CYmDkvT50qAs8ycaT+CcQ5qWHeW8QxkrCQsppryGgGp3IQudu
	 SELu51iP4X+AQ/VanQ8ObQZTKTRVmwdvXfYYWQemPAH0GjiDLhZ2UznjJEJ8ui32PjjSs
	 r/7MLw63fScHg18W3VFidX/JQJyWD8hx0O9VKGxFzrIeylSn6y2yqRdygyb4labFqqkO5
	 heqkfM69h66GoAiZT3KKyDHaw7VmStp8g1p+K/yQ7Dz53VAu+qNoZ/q0RtoRY+bJ0UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	dkim=pass header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=YUsCj91u;
	arc=none smtp.remote-ip=185.226.149.38
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20C606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F20C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=YUsCj91u
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHq-00Cc8l-Cp; Mon, 02 Nov 2026 21:05:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=af5cAjoTJMICk4/K/aQVYoMys5HKuYkh1BgXlZFXPKI=; b=YUsCj91uGMUEzcv3CZUwiLxQh8
	m5f0s2Qcy1hlYI9gEuaROrGLIeJQvcQ/PS9TVbPNrxBKPLDPpSeNn2zk+l0Yeagc4xZFYXp0TgXMU
	pJwvSiDk/T4ujKqc9wAELMjz9TEBdMcFdg1Kju99i7JlddeYLqsfcDN5JscwYKAdqbD7kc2TvQ/ah
	BD2NPKpuMutgbFEBilWa/gVDaVHzst08jahUkYs08UXaIyd8ej0RSt0zoL/3/++Wa7u7wTLFSD4g6
	Ey+YqUsbJgXCBgkBnl173GyG8U42mBnzQeGx9ZL7mMyoZ9w982ukdnx/GFE1cI+tQuO/Z5DSLasHg
	dF04wS1w==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHp-0005ig-QP; Mon, 02 Nov 2026 21:05:46 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNyHe-00AUIb-J6;
	Mon, 02 Nov 2026 21:05:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Kir Chou <note351@hotmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH next 7/7] random32: Simplify prandom_seed_full_state()
Date: Mon,  2 Nov 2026 20:05:22 +0000
Message-Id: <20261102200522.3337-8-david.laight.linux@gmail.com>
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

Instead of offsetting values that would be treated as zero, just set
a bit that ensures they wont be treated as zero.

Reduces the number of initial states from just under 2**113 to 2**109.
This really shouldn't matter.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/random32.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/random32.c b/lib/random32.c
index 1d6468045267..2c5c3519a0f8 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -118,13 +118,13 @@ void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state)
 
 	for_each_possible_cpu(i) {
 		struct rnd_state *state = per_cpu_ptr(pcpu_state, i);
-		u32 seeds[4];
 
-		get_random_bytes(&seeds, sizeof(seeds));
-		state->s1 = __seed(seeds[0],   2U);
-		state->s2 = __seed(seeds[1],   8U);
-		state->s3 = __seed(seeds[2],  16U);
-		state->s4 = __seed(seeds[3], 128U);
+		get_random_bytes(state, sizeof(state));
+		/* The values must not be near zero. */
+		state->s1 |= 0x100;
+		state->s2 |= 0x100;
+		state->s3 |= 0x100;
+		state->s4 |= 0x100;
 
 		prandom_warmup(state);
 	}
-- 
2.39.5

