Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925199;
	b=OakOpiYScxfOkkUG9QNJQFmLH6L45Hrd7Sq6DjsQyI/jObNGKZk3qpiMV/CKdZuza+O/
	 hI+TkgxfMMVeVG3KjsPJtK23rzyD4op/xQeo23FwHnaEZqw/oeXN+8IdqwxsTrw8brdwY
	 Pdh0uAEDp3LOnTNz6zJuAX75SuY5oh6kaYbzlo75NYW3AV0NkbWi7kmT0mLMdCTmEh2op
	 f53Q9qnhSajhxVoQAIn0mqQnMWvhquZXfSU2DWiyOxicroBgPipfFbZvQUL1Zz+3peUOi
	 IewdYahMGQqmQVCwq8VEmZH1m2Wj2y8cdK6nnOi6gmDLExdMHFitOhzW8nXUNblDxoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925199;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AXpU8ISp0jRVPb13iw0ptLUv6FobkXQ0x4wGrSGKdTY=;
	b=A+/PVP6IFHTR0oOZa27UWsMiAEDJ0fg2tGAx2e+ElseEiwQsqan2G6gpIlI3s6t9y+Lg
	 oa8NUDaBGM3/Elbip44txVZQwgxcYdStrLjRv4l/toMkgjTGTaav+eIe5SzvDF39t7pqA
	 5REseMRLNO+lVQWX9ayPLOiymnuw8ZYamIcougmAmH2BrqoCCXMvzR8UcudOOyI1s9/J7
	 hQ2XToaCFNX67A9YgrLAOibsBIvI1f8HjzARzXsXLW9ojfhuR3dI8O4L6JCEDekUISK0x
	 4Kv2rAD6kpCQGL8L1qgy56mEAE14qAhGz1R1gdKLfGXpqDUwyzXUOKcHTo9Z0HVPbqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BTBY2ZI5;
	arc=none smtp.remote-ip=91.218.175.191
Received: from mta0.migadu.com (out-191.mta0.migadu.com [91.218.175.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE4F606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE4F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BTBY2ZI5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jpoUrqEhZGtO1voo/V91CLK+zaKFJAgHFOTKKalt7GE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794925195; v=1; x=1795529995;
 b=BTBY2ZI5MqtapREnrmOO9d5EU3PgXaLjvspbG3UiNjxfZ2cV2lq2qA4gofBpodRIvWh4sjpl
 8ECTZtpZULbyIrBnRMBpyg3/wQR2apPv4kPwGmzXOVC6Py8NGvj2HpWGRcvHyTn2jvNl1P8wlz8
 oV4tUlgDr6sU9Qqkpd97AyqE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2adbb1d648220a4f;
	Tue, 17 Nov 2026 14:19:55 +0000
X-Mizu-Trace-ID: 2adbb1d648220a4f
X-Migadu-Flow: FLOW_OUT
From: Ruben Wauters <ruben.wauters@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <ruben.wauters@linux.dev>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: fix potential divide error due to optimisation
Date: Tue, 17 Nov 2026 14:17:51 +0000
Message-ID: <20261117141943.10540-1-ruben.wauters@linux.dev>
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

Compilers can potentially optmise the read of gdrm->stats_actual_length
to two separate reads. As flagged by sashiko, when the rect is flushed
the stats_actual_length can reset to zero. If this was to occur between
the two reads, the divide error can still be triggered (albeit rarely).

Fix this by adding a READ_ONCE around the gdrm->stats_actual_length

Fixes: 431c2dffd2b7 ("drm/gud: avoid divide error in gud_stats_debugfs")
Signed-off-by: Ruben Wauters <ruben.wauters@linux.dev>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index cec5d64e152b..4854b30ea5ba 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -329,7 +329,7 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
 	seq_puts(m, "\n");
 
 	if (gdrm->compression) {
-		u64 actual_length = gdrm->stats_actual_length;
+		u64 actual_length = READ_ONCE(gdrm->stats_actual_length);
 		u64 remainder;
 		u64 ratio, ratio_frac;
 
-- 
2.56.1

