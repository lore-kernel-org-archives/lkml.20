Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794349126;
	b=M6saQ/prPUYx75t7vXaiiSiXAs+qVjcpMNQKucL0VdW9ukRQ6HdkJFl1vNAqblcUFfHp
	 GnhtOg1O6tWwat5jlgig14cVQbs1uGBJNfoa1y9tJGnzP36UGeX3TMEgeE/C+oJG3cB6D
	 UTgJx89BzdvuTkgsQkrHVeQq1Hsc4z4VFq5s785jkMIJSWcvZ7pOTh+6F+4T9PCpGSvHh
	 pa24reE+S08YTGwBVA5rIb9U0sk0GUU/VSK/REZdOgFdkPTBw1aqL/emTgximva/6S1gG
	 htl8alVMtSnGpJQJYH/vRJQIXHFZwU32F3Tj8EEhw1DMn6fD8vr0BNZffIO4Xyw6wAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349126;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sAsssef8M9BJYAqaDb1o+lxM6zblF2emqCfzY+ds9V0=;
	b=QNyxay5/4QQpEBO9taCQgAF3pf3RMVtFTdqa8K++BGUDtuHufeq5mFlxz37Rzq4X5Z+F
	 TB5T5Lg/9iW3yfAZlGFCoaDJb3s/uNRUpoc1V8PQfRDOXS6drT1VUhmYuJBKYH50SJ+vh
	 ZV3v9qlU8wkvs2agFe4hM+ec/VvSLESr4d+IXlneqJbkB1VMolHjyvUD6xhf7tpafjpcD
	 3YLcKIQJDe5C4mopd61OxBJCmxTGD+a2T7y+frLUj5DVGM+Tlk6jvTPYw2SbOluEcYQwA
	 ISGazJgyEz6RdumzD34mdJmunTuK/HhDchkvVRX78ygQLmPEpQEEaiPXq7Yac3TaOYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xj7YhviZ;
	arc=none smtp.remote-ip=95.215.58.181
Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FAD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74FAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xj7YhviZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=poGMcKRdZmSpH1Ecviaj76ja+0kiijnp7goli5bqW2k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794349123; v=1; x=1794953923;
 b=xj7YhviZxetTEE/fW5dXZ6GcTw0osoFGmRGhEy8gdbWxdhAs5I+BKbWbYceySw0CdXiCgbtK
 Xuo7t+kQ5W95LCZOYREhaiQybfM9qh6SlyeBRyrgAhI1eoJ7NwxGtrE1+N9Ppsmciuk9MuE9/OV
 udVO9lCjou136ab4pJotWWbQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id d7adb2b07faa7b1e;
	Tue, 10 Nov 2026 22:18:43 +0000
X-Mizu-Trace-ID: d7adb2b07faa7b1e
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bradley.morgan@linux.dev
Subject: [PATCH 2/2] arm64: signal: drop redundant bounds check in parse_user_sigframe()
Date: Tue, 10 Nov 2026 22:18:36 +0000
Message-ID: <20261110221836.3265929-3-bradley.morgan@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110221836.3265929-1-bradley.morgan@linux.dev>
References: <20261110221836.3265929-1-bradley.morgan@linux.dev>
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

We already check limit - offset < size right after reading head->size
before the magic switch. Then once the switch finishes, we turn around
and check the exact same thing again.

None of the switch cases touch offset, limit, or size before reaching
the bottom, and extra context branches off with continue anyway. So the
second check is completely dead. It has been sitting here since the 2017
frame layout rework.

Drop the duplicate check.

Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
 arch/arm64/kernel/signal.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 20d5f19921e0d..d152735d632e5 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1003,9 +1003,6 @@ static int parse_user_sigframe(struct user_ctxs *user,
 		if (size < sizeof(*head))
 			goto invalid;
 
-		if (limit - offset < size)
-			goto invalid;
-
 		offset += size;
 	}
 
-- 
2.53.0

