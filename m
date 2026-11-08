Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141324;
	b=jOfnblsWbw9A5JNpLMsgdQVWdPq4WaZulHLHyLtocqSmQj+Bz3haAI5fQnW9g/EHQBbZ
	 IK8kJVEf8pSVVP5o/fKw6DQKKiko8WIl8hDXVCiNheSP2cO4eITGjgMk27m4KqtA1DtGI
	 RKEfEzTBHKLVjEscLC4YWcRyli/VaITr68017arp6N1Xxn1qhNHBE8urMgG++RWkyfmYu
	 H7mlaHSyHcGo5beecSjFbG37WwB1/9TTzsryvgmWk2NdwCoVNN/XaT4IoujGAFL+vOie3
	 pjvIuLEG8454aDVAXIKxQ1vwK/UxfM77GbAYgn0+GJy3+2D1XbKTA3Gpquc2oBvrKFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141324;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=stqGfFWqTftCRldqKv9OwVPeqOI+CMlJANU2hWPYzjU=;
	b=Gzqndbqc7DUg08pIOJxDq5RfwSZEqUhqDinYaNTBL/xhTSLzeD/Zl+d6sZMuePgUPQPX
	 tgBaa84clIikuGyPPC19OEShD9H50JTClT/+Y42E1JW6/CbiUmahmqPezBHa/v2yw/ylN
	 HgKtxb1gCTVvfcuOA/VNXlTk9JyYCYq1byQncRAn4QR4HwpJ64cA5RiTW5FLn883LZU/3
	 aDFDFu8Q4ETfyXF7SnwgHmoVXwvqj67pMk8d6i0MT9Lb4JzilssX0FaSnE+0zK+T6XPrt
	 SmZ3XL6AQ58DjJPPyOKVf8pXT58z3oNFoN4GNa4PQQ6OA8BHiCpeqpYH2+VlePyFapw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yn+KdNkc;
	arc=none smtp.remote-ip=91.218.175.201
Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538F8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Yn+KdNkc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+punhtJ68XsWPdnlp+NVbyrhnoMeql+7vD6IIgQcDVk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794141321; v=1; x=1794746121;
 b=Yn+KdNkcOJXbDrrzSuZABJ+9SV8tb3M5mI0UMLEbIkZ52JKqHSYWQddNg7x6FhV63V5+42d2
 jxAActguR6fTTorV3Mc5q359rqxr0+vC7jikyguhIbT596d2PVfRxO6yAhWuYsn4nrjXqV9Plpr
 aavAFsK5JJ2tqd9hEs++7Ma0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5122c3ac40c4b46;
	Sun, 08 Nov 2026 12:35:21 +0000
X-Mizu-Trace-ID: b5122c3ac40c4b46
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Ridong Chen <chenridong@xiaomi.com>,
	Ridong Chen <ridong.chen@linux.dev>
Subject: [PATCH] mailmap: add entries for Ridong Chen
Date: Sun,  8 Nov 2026 20:35:09 +0800
Message-Id: <20261108123509.214127-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
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

From: Ridong Chen <chenridong@xiaomi.com>

Map my former Huawei address and my current Xiaomi address to my
personal address, so that all my contributions are attributed to a
single identity.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 3a7380b805ce..66541bc57254 100644
--- a/.mailmap
+++ b/.mailmap
@@ -810,6 +810,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
 Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
 Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
 Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
+Ridong Chen <ridong.chen@linux.dev> <chenridong@huawei.com>
+Ridong Chen <ridong.chen@linux.dev> <chenridong@xiaomi.com>
 Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
 Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>
 Robert Foss <rfoss@kernel.org> <robert.foss@linaro.org>
-- 
2.34.1

