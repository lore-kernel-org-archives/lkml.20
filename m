Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866288;
	b=CMnFIw8vsdSZPds3BaOrgJrpKtj4SGOvhVRUaAszQsDzmG9DoJsVxQQ5Hz0msW+qe5Bb
	 xVmYjujM5ArUg9FpEwm+LL015sCR82EpNNpIy4qX7E5svgrM2xUPjH5fMHWvUYF2qFvay
	 Xvwr/0dV1kMTQWOtC7+7rpwZLWVRu+bgYpwZgpxhXRShahNxahzJELgVa0VFYb8ZmV2TE
	 QHgzeeGDn3/Ve29MiBZZh4aAZcWYHVYqWdAiES3yk1kiWzcsIdfntr2v0IDjJxSh7n0+f
	 nYxdSumiOJRA7yLJhgn67mpvT0m/Ztm7jLPBD9O9VgaU127+Uq7WIzBFSHdpDTs6RLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866288;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Sfu8XegkJNt1bHPWCZSNbggzpI4vInPs9CpIHVTysjA=;
	b=lTlxsY4zc1ck6jPB+YKOgyqvEmbQG9dkl+vgQrbzlmNATUAwPD4ktYELycRo61DuXtG4
	 m8LpVkLBoMnDgHRvaazg9CXvC3dlxUHJ3rIy61nrMg1YPTR9XkTEgh3eesghV6n/NGYPN
	 OMr3NDRJU217KVUWSkzT/XhAHitbFOa6QYKBBxrLD0c2nBLW0y1JJbxCE/kSzNyfjfgAP
	 0m/LEqevmPGgpM1+XaZUF2aBVhFUVz1g7tzO1chFd1kE0MTqCPqTDwAshfvq3iIiv/ml6
	 rz9WXyOy05FiVXvhbnPK1iVnvMp0lMq7J0LneKQQpMuR3HXzsL/Z2FzLZ6XEi2B2Yxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SmYxsFhg;
	arc=none smtp.remote-ip=95.215.58.4
Received: from mta1.migadu.com (out-4.mta1.migadu.com [95.215.58.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961AE606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961AE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SmYxsFhg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jLPPE7t3pNPx0Vxm+96Kc1cwCSMWGPv1jMqY2nUciro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794866284; v=1; x=1795471084;
 b=SmYxsFhgCKsvzqHE8hMBfpY6pyHMpE5Zm4PATyQ9w9+EJTlSZwxF+Qsvy7/+o7zBghPuDd0l
 Ndv4W9oUe4NufM55vqRMBN07048GVPYxZhDRyEHmadNRfz+3WIp8TgFLLGIBKjp2MCC1gKRTD8w
 1deL5fkIIrqeK6oSy4AiEU1s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9fbc24a4530f67e;
	Mon, 16 Nov 2026 21:58:04 +0000
X-Mizu-Trace-ID: d9fbc24a4530f67e
X-Migadu-Flow: FLOW_OUT
From: "Luiz Capitulino (Red Hat)" <luiz.capitulino@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	nico.pache@linux.dev
Subject: [PATCH] mailmap: add entries for Luiz Capitulino
Date: Mon, 16 Nov 2026 16:57:56 -0500
Message-ID: <20261116215756.133593-1-luiz.capitulino@linux.dev>
X-Mailer: git-send-email 2.56.1
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

Map my previous addresses to my linux.dev address, which I'll be using
for kernel work going forward.

Signed-off-by: Luiz Capitulino (Red Hat) <luiz.capitulino@linux.dev>
---
 .mailmap | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.mailmap b/.mailmap
index bb8cd0c84747..88d0f83aadbf 100644
--- a/.mailmap
+++ b/.mailmap
@@ -589,6 +589,9 @@ Lorenzo Stoakes <ljs@kernel.org> <lorenzo.stoakes@oracle.com>
 Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
 Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
 Lucas De Marchi <demarchi@kernel.org> <lucas.demarchi@intel.com>
+Luiz Capitulino <luiz.capitulino@linux.dev> <lcapitulino@redhat.com>
+Luiz Capitulino <luiz.capitulino@linux.dev> <luizcap@amazon.com>
+Luiz Capitulino <luiz.capitulino@linux.dev> <luizcap@redhat.com>
 Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
 Luo Jie <jie.luo@oss.qualcomm.com> <luoj@codeaurora.org>
 Luo Jie <jie.luo@oss.qualcomm.com> <quic_luoj@quicinc.com>
-- 
2.56.1

