Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649951;
	b=tDsWdqyPSX6QvYaPHYut0Ivqq+8n+wJEigTH+wUaYYfZoNV1eifKfW9RNXgY0MAbW7dz
	 XVlcnKXoxeZV2h2TTg/jS5BTOqu2TEPAgFo1w6RwrzKlAEvpONTw4HuN2XK5q3yfmWO4F
	 urGfDf8IqyDKCDfKYri0VwdNvwHgehMvoTTjuEYmWyAzQuRbrP/8X82SFxqYAZXSkZWre
	 ETTQUCLPWYP2lu2ApED5A5p8YlaC/MTHx0HNZH+OzoJlYkEy0gfSF1wtu3JZVZo/HUWW1
	 GYzdeciU9Jre8m628s8JMr3KGGdFI376bchRmZWrYAk+35eUYGMbdttXsndGbIEvL2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vYbF26lF0gG0N2M3M6IIq0ZNZQTj6vs3uxKG8P4IdaY=;
	b=yvtCkfZlalPPY21Npgqq84la2F33Krs+uLnmtNqqW3O/J3bZmM5EukzqD6zjJ8gTxpSW
	 5UcDSs2WQs1byIH/hzXy7Iqpe0iKHaAFZ8/CoEaFTx4Fn/bnoYqT86JtqmnYBUSNSti1b
	 6eabb4WsviJH7zXaO7odboLDpY2vgSh0JnxKpP90bliXVcnXlzOiHLTcahzq/f1IB0qg9
	 tfxF7VqQUaGmko6ifptRHVBPGrRFiXIRL8aBr/hR1zW+T3bELrzJZTOy+HRVh3m3UB5XI
	 ku7a3pTTWoWKOc5a6tDtKGdkCxuRlOde5xOdIDmsifH56vN1egxVtqqb8Ps1x7xR+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30E1606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C30E1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHq-00ARyx-2K; Mon, 02 Nov 2026 21:05:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=vYbF26lF0gG0N2M3M6IIq0ZNZQTj6vs3uxKG8P4IdaY=; b=YPtCnuKe+ZYtaQ/CUNMkrOQlB6
	rTiONDH8vJbTyjoVMTfCvhehVTRL+Csne+aw5ffxz2fjL8NWL5A8J3Aia0cgeFAJC8Z5voPj+cCdy
	lZIHJ2sy78UFOLutztqKUsXRF/5AcLWAy7EYenbNquQLBpF1wr7TU2eOk78k+Lh1FjnhK9+7HC0zy
	EKnEgQAhsx8jfRBtbTtqM5m+giYItIsV0pP02rcaQnl3AkLVay9B6BsBKoxz0ouiGYzHesP3/nuBd
	vErD1SGLkWGUD5bXXWL0Ur7i2R1zyHWMTvf53aYxSzohU3YhMd6N3Smhn67Ntknb8tSo6gbmHy4aa
	E1xRu68A==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHp-0005ib-FP; Mon, 02 Nov 2026 21:05:45 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNyHe-00AUIb-5g;
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
Subject: [PATCH next 6/7] random32: prandom_seed_state() use all 64 bits of the seed
Date: Mon,  2 Nov 2026 20:05:21 +0000
Message-Id: <20261102200522.3337-7-david.laight.linux@gmail.com>
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

Use the high 32bits to initialise s3 and s4 rather than reducing
the value to 32 bits.
Simplify the avoidance of values near zero by just setting a bit.
Keep the '<< 10' so that bits 0 and 32-35 get used.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/random32.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/random32.c b/lib/random32.c
index 83776345adda..1d6468045267 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -133,11 +133,12 @@ EXPORT_SYMBOL(prandom_seed_full_state);
 
 void prandom_seed_state(struct rnd_state *state, u64 seed)
 {
-	u32 i = ((seed >> 32) ^ (seed << 10) ^ seed) & 0xffffffffUL;
+	seed ^= seed << 10;
 
-	state->s1 = __seed(i,   2U);
-	state->s2 = __seed(i,   8U);
-	state->s3 = __seed(i,  16U);
-	state->s4 = __seed(i, 128U);
+	/* The values must not be near zero. */
+	state->s1 = seed | 0x100;
+	state->s2 = seed | 0x200;
+	state->s3 = (seed >> 32) | 0x100;
+	state->s4 = (seed >> 32) | 0x200;
 }
 EXPORT_SYMBOL(prandom_seed_state);
-- 
2.39.5

