Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251974;
	b=Z0PSb/I40J/qmEfcD0wyzu3/ny6np1O3bWcv1cY8Q8s/uBXdlhzu3yhqf28tGh1VhT3x
	 wBqiVmkvDrX+b/VMhnYy0ub1Td+deu+9TeP9MOFTNlCxFeENZtklNBmUsLGDOFTH9+vpt
	 LUveAPdtkm/4ZS2jOLDDHSRbHmTp3iYj3GetIrAMJx3jA4cr89oHYJ82jReI6ntPyegnf
	 jNYFecOYGq6aC4MqILK6vFR0XzqeFiAyzarTeFSPOy7E9z27Ef/HDp0b5iHpkIOwNdsj3
	 5RJDM0Gs6Tesr7cR59S+8a65908hMAnBC6N88dQWg1fr7FADDNbv2uwgICvq8T4dsmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251974;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Pighe8PbD44mS9W+YJHmdXKPF93LTikVws7t5KdO8vE=;
	b=rMLBseWjPzngcotJhcEFuPiyq8bxF59OiAo2eWq6LfQjz4yrnqyAIPXkxnyiyDQ5nqDC
	 PdESLA7NSiseveZi4WbWOnBj0X/hRp7VnpsVtZ2w7fd/tCS+MkUZOFdF286Ec+0boSYh2
	 xjfiiwWm79+xD2aFtTnBjqcezDVSwMD6CL4IUtUrCwSuowBopBk9JUzL1oV7iQZEWr9kF
	 6vNi8XfOB3bbujGxO8+nVkqhYQcnY9gGwqCLTgVaZrF5Nf0JFYaA0qPViJHKwoYbCVZmi
	 fqntLTcwzfaFgtc6wwm6Tt8kFqszPFIht/Daui/EKB5QmdeXrA0emh440RcI6EVrTRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HcQ5kTLn;
	arc=none smtp.remote-ip=95.215.58.212
Received: from mta1.migadu.com (out-212.mta1.migadu.com [95.215.58.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B052D606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B052D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HcQ5kTLn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HBowGcdGS1jVM4EfEOIZD/c85nFeSxHCT+HaIBbRP/I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794251970; v=1; x=1794856770;
 b=HcQ5kTLnGsYpMHYsuvRugkOUB1v+wCIg3FRRcsvUe3Jcf4MKWijL0HSpOdsMmFuQIjnOcbg/
 HiMS3VMjVdlxCmvrL5YdTooneIpurNf0qbxoSYB93NsrKIsObWYTw54OqRpb9CI4dWLIfGslhrT
 Z9eT83GKsD20mk2wv7jZQlK4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 74d6a46719d3ffed;
	Mon, 09 Nov 2026 19:19:30 +0000
X-Mizu-Trace-ID: 74d6a46719d3ffed
X-Migadu-Flow: FLOW_OUT
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Bradley Morgan <bradley.morgan@linux.dev>
Subject: [PATCH] mailmap: update email address for Bradley Morgan
Date: Mon,  9 Nov 2026 19:19:28 +0000
Message-ID: <20261109191928.3222846-1-bradley.morgan@linux.dev>
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

I switched to bradley.morgan@linux.dev for kernel work, so map the
brads@mainlining.org and include@grrlz.net addresses over to keep
shortlog and blame from splitting commits between them.

Signed-off-by: Bradley Morgan <bradley.morgan@linux.dev>
---
Andrew: Could you *please* merge so it gets PRed quicker,
it will be a pain to wait for merge window... gitwise
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 0d05be949eff9..b277d0d04ac56 100644
--- a/.mailmap
+++ b/.mailmap
@@ -180,7 +180,8 @@ Boris Brezillon <bbrezillon@kernel.org> <b.brezillon.dev@gmail.com>
 Boris Brezillon <bbrezillon@kernel.org> <b.brezillon@overkiz.com>
 Boris Brezillon <bbrezillon@kernel.org> <boris.brezillon@bootlin.com>
 Boris Brezillon <bbrezillon@kernel.org> <boris.brezillon@free-electrons.com>
-Bradley Morgan <brads@mainlining.org> <include@grrlz.net>
+Bradley Morgan <bradley.morgan@linux.dev> <brads@mainlining.org>
+Bradley Morgan <bradley.morgan@linux.dev> <include@grrlz.net>
 Brendan Higgins <brendan.higgins@linux.dev> <brendanhiggins@google.com>
 Brendan Jackman <brendan.jackman@linux.dev> <jackmanb@google.com>
 Brian Avery <b.avery@hp.com>
-- 
2.53.0

