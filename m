Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649955;
	b=wNMfI/MqvCOgG2+0NEN+qeDcruX+XlFEgZZwzHwT71/pnyL3Il0TFmWWARRDFcS37Lyu
	 c+osroKkBE41/V+/roZAZinkxCbBMxSUfeWU45Dt/VgIA7nRdffHQ5EKwAnLkYTSk77Hy
	 XG9tCPS0dHzoL4qUPWDjZLOf2uioZ/05VUKmCFCRpDgqGt2vXthgRFHlqyF+JYQHbl7e2
	 sHjxFlFjxNxUQDfcNSYW1amDY5aKzvB1AkfLrSUeDZfAJa45ERgFel/chQF5CY6lA0Yts
	 rH/J2xtDTCaFQXCYd60+EvJobAWLjDCt9exsCWRyv5FVmCq4lsd0vL5bMyF3LWm5sQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iJo4UO8QoHmk99+BMYLj0J0Yz7b8aqhtFw7gMw1ouwE=;
	b=x682yM+UlEUTc52TW+qv+CQfuaacUCloh4/20gDzAGT9XE1scrroATQNwhnjPMQW0eX9
	 Xc9111F1frD6yT+CYIl41aoVBZVuSJ+iYlCzaqqEtyi+/Zku6C3L0xIC8F9xWYCDsmnNF
	 oJPVA2vsT+RVXWvSoVQUKJn1PHbQE2hA/4kv5i420IZcmqAG2Rbo4SBtL8TQEE458Vd30
	 /n2xlO+3Iha5NT+97TVktq4PvoTbVPIKi7CzQVLQvA1QDqjipSjyyHGqjoboTLLYyFp61
	 nx2mXEQGiWpfAJZmnop03DeNTEkJLYOF8UpK7FKwv+iDPUQ4tCgsGM52f/fuIThQkTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	dkim=pass header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b="G9A0J/qL";
	arc=none smtp.remote-ip=185.226.149.38
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD5606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CD5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=G9A0J/qL
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHr-00Cc96-3l; Mon, 02 Nov 2026 21:05:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=iJo4UO8QoHmk99+BMYLj0J0Yz7b8aqhtFw7gMw1ouwE=; b=G9A0J/qL/mA2K4LPGopEQ5SBtb
	e6NugBnaSaMKfqCo49rXu9jBZPT9JXRvR7nc4t3TGoyfMESIqDz/WRI1p9rPOaz9/ba0i1ZFa2UNW
	0+g7bCgfPu1RaafKof8FMMLeVlAM2YvWouhD3DIp4FtuN9MjN1c6Ztz/rzo9pdJjEH9fCrowsMpiC
	ZokCJoijjzvsGPjSTL4HDn8EFIizcop6oiCr8sS8UEEqwXRZMG33kt+oKj9fcA9iuf1szq/B2VCbA
	zI9ipIS7ROa2fxpXd/fFK72NHM5NqIzMwisIrmgUQY3fH0u6jwyqfYLuae2znusXyurmJGDNWgwdy
	rS12nLIQ==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xNyHq-0002nR-QW; Mon, 02 Nov 2026 21:05:46 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xNyHd-00AUIb-Os;
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
Subject: [PATCH next 5/7] random32: Use add (not xor) in tools prandom_u32_state()
Date: Mon,  2 Nov 2026 20:05:20 +0000
Message-Id: <20261102200522.3337-6-david.laight.linux@gmail.com>
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

Matches the main kernel change.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 tools/include/linux/prandom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/linux/prandom.h b/tools/include/linux/prandom.h
index b745041ccd6a..56d1422e54a8 100644
--- a/tools/include/linux/prandom.h
+++ b/tools/include/linux/prandom.h
@@ -46,6 +46,6 @@ static inline u32 prandom_u32_state(struct rnd_state *state)
 	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
 	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
 
-	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
+	return (state->s1 + state->s2 + state->s3 + state->s4);
 }
 #endif // __TOOLS_LINUX_PRANDOM_H
-- 
2.39.5

