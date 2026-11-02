Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649951;
	b=BEa2q61qy+GnbwmUOSu5CQQrA/oF+glbgS0dHZW0okqe2KGrYH+H9GV0fW66Dey+ekP1
	 6VMtbO/FrBgYus95fM8cS8G4xms+HE4qDpEdU3B2XNo+WisY8JsJrIrBvDdZYcN0P8zIr
	 BJudxaR11RKI2TYWDBmX/8uISjZIRIMi7zbDOcGZAqF8dPf90pta7M16hv4TUWCicHa2P
	 us3ZMSx89GsghmpzpGTirODurpKimnmMAHswRnyIinQqzazGYmFHoIxHtaGpLljlNze4k
	 IkHMJf1Q1WFK5ouj+vF1cr5XuifU0n0S3iwu+xFGPVlZ4cMBX7361hWFYwplWvoATWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fS9ln7ZjK+1t2WaTiFUYK838R/OTCoQAHQ5YBvzElrM=;
	b=y6Qzh16Qp/Q4sed4a2oxEbn3EuPEL9fu5NrV2npVlQFUvyvFXAWcAORf/nqYc7Dl2W0c
	 P/LsLZZfk4KjpZ7OajUM9gKQlUlGT7IZPFbvTd15F5XUNY3Ve4fr8NFlwC24ZpqYAgEY4
	 Gu2sJgEmqxdKAOdJud+QQis30TEF4nPWi3SAtJm+KnDnBne1MgJ69ka+uNk9dWeqAmT4f
	 i4h4Px0oo7MqabfQCIb9MBxq/qtp/hlkW//RKDng4/SmWv8mqxj5HUZkToVG0Y5Q7MV0R
	 9r5gzyZiyqbbJMexvkgE6TplYuRUsvZPHkoDqyu+f5GdoDfdpPkWGlr7IbBam5eXuog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	dkim=pass header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=kIVESqOn;
	arc=none smtp.remote-ip=185.226.149.38
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD36606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD36606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=kIVESqOn
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHp-00Cc8X-LD; Mon, 02 Nov 2026 21:05:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=fS9ln7ZjK+1t2WaTiFUYK838R/OTCoQAHQ5YBvzElrM=; b=kIVESqOnHTy0zScgDvoUz/GOqw
	PwPGbE5qZg0GPEKAaLN46vBybYK96YRrVgRYB5bD15eLQ8zrJNsWHq+UYa5meaFInwA/3SgVQAqoc
	OXqGInlkjRdneyQ3qe1v/FmxiekZ0JK03Rqjo+0gmhMJEAqwRZrlWuWOpmnPkmyiMPTun7EQiepkD
	Diu94+V4eaW+Gl4stsVkkrb1+47sIoC7YWU4XgV/LhcLjgJvrYw5m5J2bXDCGxwxsZ+h7Ky1KOgQt
	E4SHS3WTYDqJYlJBu1lkeszNVdSqhUoBue4gWBmzE2v3B9JwO+LtPdEUAvg3FHMoA96zWhnbWLJF+
	QrYgeP/g==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHp-0005iV-3l; Mon, 02 Nov 2026 21:05:45 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNyHc-00AUIb-4U;
	Mon, 02 Nov 2026 21:05:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Kir Chou <note351@hotmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH next 1/7] random32: Improve security of prandom_u32_state()
Date: Mon,  2 Nov 2026 20:05:16 +0000
Message-Id: <20261102200522.3337-2-david.laight.linux@gmail.com>
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

While security isn't that important in can easily be made a lot better.

The four LFSR are linear are reversable.
Combining the outputs with xor is still linear.
This means that the initial state of the prng can be trivially determined
from 113 output bits that have a known distance from that state.
(Each state bit is just the xor of some combination of the output bits.)

Replace the final xor with add making it non-linear and nothing like
as easy to invert.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/random32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/random32.c b/lib/random32.c
index dad90219c351..34f08f6540e6 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -58,7 +58,7 @@ u32 prandom_u32_state(struct rnd_state *state)
 	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
 	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
 
-	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
+	return (state->s1 + state->s2 + state->s3 + state->s4);
 }
 EXPORT_SYMBOL(prandom_u32_state);
 
-- 
2.39.5

