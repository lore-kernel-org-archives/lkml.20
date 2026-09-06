Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF439E164
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788686677; cv=none; b=ZBuFJ3i3QPc+vFd7EOlI0+kY7z/iOqVq+idpayLtOUFCIomntxU41rP3kQenTuHZHMnNwWwjvI4v3Cu8VG/1RFH5ej6QCz0eCl1W7BN9OPYV8gUODlrhwdzOzG/1B7PqJSC0Fu+MtS9SqhjJmRJnqH7Cmmyq15g9hBOzE1enzew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788686677; c=relaxed/simple;
	bh=R0d2I2oFbcaISY9HYkvAh+fEqUo/dGsfYd8ObVhTkvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KutgOa789qfQl8tDhNgB5kE6wULQG+zhVF1hcptOIBgxB3JO/KRlEr85e6tI64UL+eQJZC+Mt+OL/yeHN6+4S61Er+wN3SsxoOHCWPdz0+o6BVCmzxouG/IAk4TwJXmsFYYNWxKrC7A/sih/zl4IquRlGMG2cn//P2yM0keD6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnQSFFXk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnQSFFXk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so18562945e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788686674; x=1789291474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey8A+s9kaQEFouzsUcbahf9veFscS+cZ76Rl/QxLJxk=;
        b=jnQSFFXkR/0qcrK3lHgwdPUq2hNZM1k/7SFaLadUSy71AQkijIARUM2Y3k2H7+VkOf
         /W0oaWRb6OjC7zvJoaeSCSQfsD+oz51UIHcpohSGuzheP5BHQIpy0/9BeCU1shlZk39e
         RooxDPi6JwbJm9K7cD2ehwXKKx+pB3K1kjkLin+6KC1h8qT+ECs95Jy+PysMc6Wi3+5C
         RM/YWbggagJXvk4qmHTeD5n1CcNEpG/9xT3SPvfUrvwNzInFMy8E96bdwEhIUZjRmt+P
         pO20M5p3uruJt/+l9vVEWuVdZ8Xa7MHFVpis/CDTpuR0nDXrjusffyLjVD8q5b/pQGNs
         7aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788686674; x=1789291474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ey8A+s9kaQEFouzsUcbahf9veFscS+cZ76Rl/QxLJxk=;
        b=LXTeIR+lpRx1puM6ALfHy6V83ZZzeWfWw6aQcDLYK7A96g8xlR9aUwYa2uMK+Dp/th
         HliT7neNwgMemOa8cYix3kFXv4Zj9cOYvBtViXsvTRCUy8t7Q+KzISxVq0hYX3Amh9Md
         9K95jq9ynW2zug1myvHH3wiFZwdVN6l0l8/8nASm7II+gabK/OZn0/5dL95tFZEPENbz
         wDS7U8GRHIMp9kxxJRuCbOXOYKl/llOjnCGsUic9dfjN2dimCS8IldZ4wE0S2/RLD1AB
         mKF2Ac8dLBcdByQkABuz7VlEM/PTowNCGyVer342/O99FJONVfCiFFbs0UavVHSyUE/j
         oeXQ==
X-Forwarded-Encrypted: i=1; AKwUvByoFKF0N2O1aufzfYUbzu+h6zS2KAFQD/uz+F9/0W+lQUTvH9k3pjwGnhO6pRt7kR/bRxsWzXVs2ToyfCU=@vger.kernel.org
X-Gm-Message-State: AFuF++n8bsAkRGe0mYweeRDodUswO3PN+pZWWZwsz8SMfpdS+9xsoCMh
	0WPPlOma9LHUDQJd4dIUxrpepmsN3p455lK4Co0bAp8dgALkrjjt2lYW9+QKrw==
X-Gm-Gg: AYBFou3SgoqBWU1CQTajnsG4No/hf3nXINs2YBTXUH3iaslm9klwp6chFhwl84V4NCd
	oVXV5jHGeQzQhbRIlUhlpWkwE92hW3HbVu9jEE4SCm1R3McAMS/f/lV1F+ZvjyBv6HmCpYBHeOB
	7UAz2LREVAQ5cIZbhLQMimvycYV3Gr82VSixkFJlXYPYAT/Ords82hgFRpMRBcZbZagw216LgY1
	1O5CgkRKU1C0mCFlJMGITqi0QgkmBbHR3gJ7oyhfgkC/N4DQEQ+EdsL6Tm3aU118+FKkKpvX0ze
	uesAxRHwtg1YEneEKM7VVzVF2ZIsEIPIPpAuqAaG1KlBuM6GqMG51EECVnGjk3kki1s/nyO0ZQM
	X41ROK8sEhcf/l/3qTORVf163mmVLgCM4RiXlR5POY8M7kD9UZATcbXFW5045xuL4SRf39B0lv/
	tgdGOVui7aBxVu5OQAvq4it8lo5cYP5xjy5lMTq8eROyIvwdM0+2iG9EQ8e0tPTy710LxtE8H1/
	MMivqXrHHoGEwYrZN44AgRUnHb+IP1lO8hNDPxOekrcasdD
X-Received: by 2002:a05:600c:37cc:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49cf823f107mr175775965e9.10.1788686673822;
        Sun, 06 Sep 2026 02:24:33 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm216768265e9.0.2026.09.06.02.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 02:24:33 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 2/2] media: mali-c55: Check the statistics buffer address before filling
Date: Sun,  6 Sep 2026 10:24:25 +0100
Message-ID: <20260906092429.50046-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906092429.50046-1-devnexen@gmail.com>
References: <20260906092429.50046-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mali_c55_stats_cpu_read() copies the metering registers into the buffer
returned by vb2_plane_vaddr() without checking it. As for the parameters
queue, a DMABUF whose exporter cannot be vmapped yields NULL, and the
memcpy_fromio() then dereferences it from the threaded interrupt
handler.

Report the failure to mali_c55_stats_fill_buffer() and complete the
buffer with VB2_BUF_STATE_ERROR.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../platform/arm/mali-c55/mali-c55-stats.c     | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
index 655e52a5f288..a9c28b090b2a 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-stats.c
@@ -200,9 +200,9 @@ static const struct vb2_ops mali_c55_stats_vb2_ops = {
 	.stop_streaming = mali_c55_stats_stop_streaming,
 };
 
-static void mali_c55_stats_cpu_read(struct mali_c55_stats *stats,
-				    struct mali_c55_stats_buf *buf,
-				    enum mali_c55_config_spaces cfg_space)
+static int mali_c55_stats_cpu_read(struct mali_c55_stats *stats,
+				   struct mali_c55_stats_buf *buf,
+				   enum mali_c55_config_spaces cfg_space)
 {
 	struct mali_c55 *mali_c55 = stats->mali_c55;
 	const void __iomem *src;
@@ -211,12 +211,18 @@ static void mali_c55_stats_cpu_read(struct mali_c55_stats *stats,
 
 	src = mali_c55->base + MALI_C55_REG_1024BIN_HIST;
 	dst = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+
+	if (!dst)
+		return -EFAULT;
+
 	memcpy_fromio(dst, src, MALI_C55_1024BIN_HIST_SIZE);
 
 	src = mali_c55->base + metering_space_addrs[cfg_space];
 	dst += MALI_C55_1024BIN_HIST_SIZE;
 	length = sizeof(struct mali_c55_stats_buffer) - MALI_C55_1024BIN_HIST_SIZE;
 	memcpy_fromio(dst, src, length);
+
+	return 0;
 }
 
 void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
@@ -224,6 +230,7 @@ void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
 {
 	struct mali_c55_stats *stats = &mali_c55->stats;
 	struct mali_c55_stats_buf *buf = NULL;
+	int ret;
 
 	spin_lock(&stats->buffers.lock);
 	if (!list_empty(&stats->buffers.queue)) {
@@ -239,8 +246,9 @@ void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
 	buf->vb.sequence = mali_c55->isp.frame_sequence;
 	buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
 
-	mali_c55_stats_cpu_read(stats, buf, cfg_space);
-	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	ret = mali_c55_stats_cpu_read(stats, buf, cfg_space);
+	vb2_buffer_done(&buf->vb.vb2_buf,
+			ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
 }
 
 void mali_c55_unregister_stats(struct mali_c55 *mali_c55)
-- 
2.55.0

