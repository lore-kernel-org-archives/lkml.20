Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932E7403B1E;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=IAD0SZKW6UYpf4mNZsNKGqhTmDYz2OAT1HJmSNDCSWiH5MuiKVhqpUVPO9vE6/BwYMfr8K/vg+PbqJeveb4xiFt2nmqiHVZBVC63hdVR4lVNmZ/qFtydndPf/jtx0187S/BYRsEvh4x0brtgqr/3UlEJ6FRmzuGcqYE9DoEetw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=byLwJEK/R0iF1hVJsJFLShw+Xi1gUX2joyJ0FTJBvR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aer9jaLdp2z25ADh+TxZakl0EoyeGMeRisGThdFxNdK2MQaC4H/NREl7U3otuY8u7dH/9P+t/6I7mID/Y1n4oQfETdlvbuzPvwjq0aK6gEV5hSRQtdwDZriFP0VQ1MeiC0g11fqfuSy9Rm4e8JKbLeb40RdES+DFS5eyxNT3B4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mV4ZJRdE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mV4ZJRdE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 522CBC4DDEA;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=byLwJEK/R0iF1hVJsJFLShw+Xi1gUX2joyJ0FTJBvR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mV4ZJRdEqt2VjhOJmCZ7MVneE7fpkLn+33/r/wSQD8/SSqbqAUOUgyvNu/Rvnrx8N
	 GKak0glc8wKF8rPFmrxlLZ3JtZBqATxIhqgGaRhZ9OO9KFl2uKNbi8KW+PxRtpzoCO
	 tpkmjB+HQpirJHmiiR4sJxph6u3XcyERs6Y2hvdM5IF5ds2MKfYTrwbVWhcvMhtrYr
	 16SEqfGA/RLjO7b/0nPluDB3MDPg0LZWxGRGXo8zpwqkame1jyLLnK6muyRfFAxT0L
	 KO1PycuNso9drBYbSMl8Z5QL2IQeN2MNTtmmWLfFgLu+OjQ69Mu66lXRab9wsSLIzW
	 0a7Jq2IJtWDEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413C6CA5FB1;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:26 +0800
Subject: [PATCH v2 08/21] media: i2c: it6625: make the audio sampling-rate
 table static const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-8-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1207;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=RribfGY3QJE2SQeaCGtxnJiAw7Fi7U9XEsgEFbiuJqw=;
 b=6SDSrBhwWtKM+bYcnCH6eiMUx0uPbHHWkA4x0wSnVVUTzeFyYpiBiFvWyCsM2epLjjPGUy6Ik
 Ulxe9MukONRDYk+Y3foV/3V7eYIjjAcfn/XaxIfA2Ea4pBi6WkCLn/q
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

s_fsid_map in get_audio_sampling_rate() is a fixed lookup table
rebuilt on the stack on every call; make it static const so it's
emitted once as read-only data instead. While touching this
declaration, move it ahead of the plain int locals per reverse
fir-tree ordering.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index b48252a71bc1ed788de2df79c5fdaf7895f6e0c4..0fe828cc5aff6d61957c3f0a781033dc94b7754b 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -583,9 +583,7 @@ static inline bool audio_present(struct it6625 *it6625)
 
 static int get_audio_sampling_rate(struct it6625 *it6625)
 {
-	int fs_id;
-	int i, freq = 0;
-	const struct fs_id_map {
+	static const struct fs_id_map {
 		u8 fs_id;
 		u32 freq;
 	} s_fsid_map[] = {
@@ -610,6 +608,8 @@ static int get_audio_sampling_rate(struct it6625 *it6625)
 		{ AUD1411K, 1411200 },
 		{ AUD1536K, 1536000 },
 	};
+	int fs_id;
+	int i, freq = 0;
 
 	if (no_signal(it6625) || !audio_present(it6625))
 		return 0;

-- 
2.34.1


