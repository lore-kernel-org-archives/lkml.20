Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280997;
	b=M/7tPQUPqSQD8APjJRm5pCSYqZPZBoOcr9euDILEXkqwR8I/72ba7QC9Iud3O9bkPS0k
	 bO1FoHM87OaQps07iHTbTS95FjeWfvRGk6WsUvmdr02/HSB6e66FzoMmHMVms4Gbt3ygO
	 80FvvuQxW8XfxKzsymLfiUc4K3Pt3ifWN/mEb6j21XPBgOunB+Jc/QYi1Fj0HWoJY/zMk
	 SzJcI1mQd6W7CnwZ5o+G40yrnMt3AY8s0Xytng2v1LqP29fgN0fM2g1Ne8NjN9q7NVBNR
	 tdAotPB6k1E0BWjEtdK9uKtLzxIv8KeVErAhDlhu0Ap8cIdQT4Rbhagm22yyNc4x53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280997;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ekO0d3X+6PaiUjIKMajvPpkg0Yr7OOFFbHuwyMP5If0=;
	b=lPpgrpLNHvzJWIa+emz3xc7DJkfLFk3IjGVK11eXdk6BDW9k97lVHD3KRm9vgvhv1gwY
	 cxkWnjWXx+o8xR63xyat+MRtfpbhGoxK8Zt/TCSuGtEO+/QWk6HAONpS9RtL79WI7SW4b
	 ZC65dj9fCYQi3wlaClsqBsK9J2Pbbq/ScSXyKmt29CSGmKG2NwAzs0rHWoTGcGGb3tDZE
	 acP4ydoolbddesuAM+gtwS0Wc12CNJhksMwzI2YsaBXv8RvaU4HzjK1hOqMjuYBytHj/K
	 AAtE/BfbO0gb5i/zTxqCbsGABiZy76apMrOuVekGksG7UEvHOKJhAYHeuafUni6G1RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlVH2VEe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB8460A5BD4
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlVH2VEe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68191F01828;
	Thu, 29 Oct 2026 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280997;
	bh=ekO0d3X+6PaiUjIKMajvPpkg0Yr7OOFFbHuwyMP5If0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NlVH2VEe2W4/NzFHnI0dm1PDFysk+BWbf/GIE3EVJstS7naWBbKfJUTmPTHbfnlTa
	 Jo49PnOB8VbVW0XNhNgD4elpYFRUmwPWvYhE+6akvLNtUzcTsZCbtWiSoAA8pMGcO8
	 CU4rOz9cfqKrxk9ZsDd6XugxhV2IUZ5oL8ydJcW2CFOEeIA00iidnhiUE8ccihZe1z
	 RJ2n4Q7VJt9nOQMQnZAX9Y22zfq8PxiU8ruMGMlVm+esmT+74g6174USYVMzoPGgLh
	 MBIIYFlC9tbgjwHKCHshgAeLs1iYAhBfAN1dAxg+5y3Xqa5B3sjQYJ1NK+OmcFRcUN
	 UJIZyjZ2hOGHg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:03 -0500
Subject: [PATCH v4 16/31] accel: ethosu: Factor buffer bounds checks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ethosu-fixes-v4-16-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Move the repeated command-stream buffer range validation into a
helper in preparation for validating all weight and scale streams.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Adjust due to previous patch
---
 drivers/accel/ethosu/ethosu_gem.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 75f6901d19e5..24f88696c18b 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -433,6 +433,25 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	return addr;
 }
 
+static int buffer_size(struct ethosu_validated_cmdstream_info *info,
+		       struct cmd_state *st, struct buffer *buf, s8 region,
+		       u16 region_cmd, u16 base_cmd, u16 length_cmd)
+{
+	u64 end;
+
+	if (region < 0 || !cmd_state_reg_is_set(st, region_cmd) ||
+	    !cmd_state_reg_is_set(st, base_cmd) ||
+	    !cmd_state_reg_is_set(st, length_cmd))
+		return -EINVAL;
+
+	if (check_add_overflow(buf->base, (u64)buf->length, &end))
+		return -EINVAL;
+
+	info->region_size[region] = max(info->region_size[region], end);
+
+	return 0;
+}
+
 static int calc_sizes(struct drm_device *ddev,
 		      struct ethosu_validated_cmdstream_info *info,
 		      u16 op, struct cmd_state *st,
@@ -485,26 +504,20 @@ static int calc_sizes(struct drm_device *ddev,
 		dev_dbg(ddev->dev, "op %d: W:%d:0x%llx-0x%llx\n",
 			op, st->weight[0].region, st->weight[0].base,
 			st->weight[0].base + st->weight[0].length - 1);
-		if (!cmd_state_reg_is_set(st, NPU_SET_WEIGHT_REGION) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_WEIGHT_BASE) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_WEIGHT_LENGTH))
+		if (buffer_size(info, st, &st->weight[0], st->weight[0].region,
+				NPU_SET_WEIGHT_REGION, NPU_SET_WEIGHT_BASE,
+				NPU_SET_WEIGHT_LENGTH))
 			return -EINVAL;
-		info->region_size[st->weight[0].region] =
-			max(info->region_size[st->weight[0].region],
-			    st->weight[0].base + st->weight[0].length);
 	}
 
 	if (scale) {
 		dev_dbg(ddev->dev, "op %d: S:%d:0x%llx-0x%llx\n",
 			op, st->scale[0].region, st->scale[0].base,
 			st->scale[0].base + st->scale[0].length - 1);
-		if (!cmd_state_reg_is_set(st, NPU_SET_SCALE_REGION) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_SCALE_BASE) ||
-		    !cmd_state_reg_is_set(st, NPU_SET_SCALE_LENGTH))
+		if (buffer_size(info, st, &st->scale[0], st->scale[0].region,
+				NPU_SET_SCALE_REGION, NPU_SET_SCALE_BASE,
+				NPU_SET_SCALE_LENGTH))
 			return -EINVAL;
-		info->region_size[st->scale[0].region] =
-			max(info->region_size[st->scale[0].region],
-			    st->scale[0].base + st->scale[0].length);
 	}
 
 	len = feat_matrix_length(edev, info, st, &st->ofm, FEAT_MATRIX_OFM,

-- 
2.53.0

