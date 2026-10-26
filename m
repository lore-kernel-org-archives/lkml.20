Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013070;
	b=i0jRvUQrG5XWbMmK3ie8YlQEYpkgihRqDNksVo5lhVVCGvb2//Np4IfxN9G0In7czBn+
	 jOGLAybMBimyyYAjaRsmm6XL8u9KmUUXeSvClamQ1ZaGC9wqDANbo0cbPLWNKubqIULNk
	 tfuize/4oqwCqKRsvneix5YUntsN1FdVWOXByjBbiQyZ/Cp7D7D5vQ9a7Gr1N5hoEmk1/
	 cKAQkqz6lRh0OScVG/k7MeHbfQAcitDYlyia09Y6IVvd0qk706cgjyowuL7ajMd2twoGP
	 +DGviHIyZ96JNYywQZ5Y5fDT+YHy11OifMjl8zaF+Du7AVIq9UHLGQY44tA433FM+7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013070;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+7bx5/5y3VgHCfj2NKx0KoszSuPmqDmHKOfzapuZ6Mw=;
	b=WL9hns2nZUs3ICHO9t7bc81jUujKRV9MP+MyR19mA7Bi4RaRHSFC53UYMO3zUF7pDkIO
	 2+nIgyeUb1oGkpPA1nlT2FCIKYtO5NZbU94LQmUeA+1HPyNFTddWb7qeJlkA3NSn5+Mpd
	 mdRXF9Md4AA4OH4heh/ZZphySvoTCDuvriyVdCs0k/LWoFkU9qoXm/nDxVyeBWmxRXp5U
	 t8bcjCQZ9hUzLCsIjkp5AXh784qh/SE7pjuQIo3f0PKkqblUXi+gXSbgebPYho9NtMSNA
	 A8danVyaEX7SlN7H3q/5gOj8tWaxksb/yiPbppst570hS/jd+mG2TyNQDbE0frvXGFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OBb9AgPq;
	arc=none smtp.remote-ip=95.215.58.219
Received: from mta1.migadu.com (out-219.mta1.migadu.com [95.215.58.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E360A381E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E83E360A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OBb9AgPq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jv1JLity/HyGd23H851ZcH74mWl+hMmP7+oxHglKuF0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793013064; v=1; x=1793617864;
 b=OBb9AgPqg3Na+GAyozt1sTaYGFvZYF+PyQgaNha6G7uWRYWN6Ue+8fMv3Dfaw6Zh1ioeJuSX
 E52M1MwcjvifYqko1OKv/X8GB7CEI/8cFBFdu2r6SEEO8z/F1YHWBqIXyBo50zxf5I5dIsNzmyY
 9BGh/khvuh66KMCj5AFvqMQE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a4e10bcd9f5fb55e;
	Mon, 26 Oct 2026 11:11:03 +0000
X-Mizu-Trace-ID: a4e10bcd9f5fb55e
X-Migadu-Flow: FLOW_OUT
From: Jackie Liu <liu.yun@linux.dev>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix logger leak on perf trace allocation failure
Date: Mon, 26 Oct 2026 19:10:47 +0800
Message-ID: <20261026111047.97178-1-liu.yun@linux.dev>
X-Mailer: git-send-email 2.56.0
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

From: Jackie Liu <liuyun01@kylinos.cn>

dc_construct_ctx() allocates a logger and stores an alias in dc->dml.logger
before allocating the performance trace object. If dc_perf_trace_create()
fails, the function frees dc_ctx without releasing the logger. Since
dc->ctx is assigned only after the trace allocation succeeds,
dc_destruct() cannot reclaim the logger on this error path.

Free the logger before discarding dc_ctx and clear dc->dml.logger to avoid
leaving a dangling alias after the failed construction.

Fixes: 5d72e247e58c ("drm/amd/display: switch DC over to the new DRM logging macros")
Cc: stable@vger.kernel.org
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 1143916391e79..03179633cd036 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1022,6 +1022,8 @@ static bool dc_construct_ctx(struct dc *dc,
 
 	dc_ctx->perf_trace = dc_perf_trace_create();
 	if (!dc_ctx->perf_trace) {
+		kfree(dc_ctx->logger);
+		dc->dml.logger = NULL;
 		kfree(dc_ctx);
 		ASSERT_CRITICAL(false);
 		return false;
-- 
2.43.0

