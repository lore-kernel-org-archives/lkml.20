Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536659;
	b=v/galgBw5gfHBpxfII/oxp+CVteCYJbpGeYtVHn1gjxrSnglIwKr1CcEExmoEibSmpxk
	 K91VrwvNqcC8x6Bi8us6i36NIH0aFQHe3o8LO09C56Vzb/jyX+ZwWYH/48s3M0IlJ2fHc
	 gSFiZsagwTuovxSn0nAFKjQS0ONQeGyqXnugGvxdLknUSO3JMvUztqu6M9xMWEQDE0ANa
	 j9hu8yuYjVq1lQ8MbLg9qlbppbfaplUc4QD+6ZfXFb7tyxQVXpd/asSoyBkL5D+okC0zw
	 p4uaxUdwXF0JH5R0t3iF7IYkWfHs5EfyBuIOQ+KhZFD4vJBWHWsxsA/lMVhvWs9vGcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536659;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FbWtGHfmMkqaU9Tc3AXdLYkinKjIHqahgBZwpWhNJyA=;
	b=fRuZjEBAXcIATWYaFmGFqK9Qjz9UW/7HOKJZxfZ7iZ35cRdGfg7TsED92Iiq69/ONR49
	 oD6sGVgCk2s3EbvGEjXsNlJIWwN8zdg8unykkhsiJ/2mZFyulCjllbemOvqOqjktaQZjH
	 f8uzufQJAbppZ1gLIbiUc9kh8z6MNIVoCKjNIXtE+XNn40YEHa9wM/T7oRTaapD83ZVo5
	 xW3boEJZFmrK59RCw5FmIYV2tu9AnWGC9viGMHAd0lNkhqgTo+WFSTMpPeV2NGGh1lCEf
	 ejalkLUcBUkpuTBYqMs0FLv0WjK5tjPc4OdKpTlaV/1oHDWqzwXECCJnDzrzh7JVsxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=softbase.tech;
	spf=pass smtp.mailfrom=softbase.tech;
	dkim=pass header.d=softbase.tech header.i=@softbase.tech header.a=rsa-sha256 header.s=protonmail3 header.b=TaK26y8i;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8704B606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8704B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=softbase.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=softbase.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=softbase.tech header.i=@softbase.tech header.a=rsa-sha256 header.s=protonmail3 header.b=TaK26y8i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=softbase.tech;
	s=protonmail3; t=1793536656; x=1793795856;
	bh=FbWtGHfmMkqaU9Tc3AXdLYkinKjIHqahgBZwpWhNJyA=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TaK26y8iVWidvJ3/fosG5C1BYwrTWsgdWjifU4+BiIlmgJvVybmItxOjh3NUZqwMs
	 je9e/o7uJxcPZtSrVXVb4iHMpAGC2ZG7DotLAdQssXdOdGrd/hk8QaKmJsoB1lAgGK
	 4Jku99jpBqyH5AzC+jlW41/0PaYDfi6RSRbTPi9Uv0gQd0gDieDgBy/eISeQ8yBGsA
	 71Tx4NsVDTxx2NsQiYa/bLS3uTIDHbgAE+cQWntrM24FwlQD7As0LjFx2Q8C1Lr/G2
	 CPKYcQG7v2xK2lQ1SGblER/wv0cbs0MW0RlwYkA4C1g0Y08kHKxWCdayTOs7V7qUgA
	 r141ka88WMFSg==
X-Pm-Submission-Id: 4jHZ9X13VLz1DFSp
From: "Beat M. Liechti" <beat@softbase.tech>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	"Beat M. Liechti" <beat@softbase.tech>
Subject: [PATCH] mailmap: add entry for Beat M. Liechti
Date: Sun,  1 Nov 2026 13:37:29 +0100
Message-ID: <20261101123733.10578-1-beat@softbase.tech>
X-Mailer: git-send-email 2.53.0
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

Map my old address, used for the firedtv fixes in 2009, to my current
one.

Assisted-by: LLM
Signed-off-by: Beat M. Liechti <beat@softbase.tech>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 37aad399e..e524de739 100644
--- a/.mailmap
+++ b/.mailmap
@@ -145,6 +145,7 @@ Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
 Bart Van Assche <bvanassche@acm.org> <bart.vanassche@wdc.com>
 Bartosz Golaszewski <brgl@kernel.org> <bartosz.golaszewski@linaro.org>
 Bartosz Golaszewski <brgl@kernel.org> <bgolaszewski@baylibre.com>
+Beat M. Liechti <beat@softbase.tech> <bml303@gmail.com>
 Ben Dooks <ben-linux@fluff.org> <ben.dooks@simtec.co.uk>
 Ben Dooks <ben-linux@fluff.org> <ben.dooks@sifive.com>
 Ben Gardner <bgardner@wabtec.com>
-- 
2.53.0

