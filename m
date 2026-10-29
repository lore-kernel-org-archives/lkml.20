Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280995;
	b=tF9F2Lr+Sn4wiEAB71oEOwIgebtQSrICZRmn3BvjKFbZ9gsPuUdrEp8bN8wukkTC0WaM
	 tIG4YtTnLxEJ4W4SDiiXLm83UVAUDQXLlo351QQxBtzqkHOwEpaAwQoUvuamQNnZqLYII
	 B3Mi5uBs/W1jSMlY9DkHWWGXi1bK366qVbsnfSmAgrWZvo7x8Je3mKerUBHul5tbky4uI
	 53whLv8/oyMnD95cXXcfqgddiPcJvIOpPYPxdm3me1ElTYW8L+VUw1+MZegsg9f7EIeBB
	 ti9KBcl9QKBWyROxbKoZleqdzsrJT6vldsxt1jaoUT5vuxv865SCDsITe7cQALnrOxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280995;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=sRBKq+2Umg2Iw+/V4MgGP4abKYY9eE606qemJj7IMBo=;
	b=Lkw/4fslTJbRkqhaPOF3N4TEEfeIUbuWshcjO1dSExLAFnHpX6QM+FFLv2qyZLeFxuyd
	 f57Ojc5pI8+LT37glUXsyio0Fw4t/Po1aoUF8IvVIygT3422+bs6oAq2WnAL+3E0yUhwx
	 o37/xDolFmZt9aABf/atQYERBLpBwEiecRK2fpRz5ZPgyjfdvczQca8fZuMPANwZ9Bq8U
	 d2baJwlyqkIjt9XhZsjqtzFVwTuh0Kz7E2cWznvG/eFFG8IaAHt8nyvwEQTXJOyAJ7+Rk
	 JLnONfrnszZAWRc8EwLd1Br9zK/lkPXAkarYjBy6edmNKyt/iTYR8C+iRCndsLd18/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Go6ZSJOQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E047F60A260A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Go6ZSJOQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BE91F01825;
	Thu, 29 Oct 2026 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280994;
	bh=sRBKq+2Umg2Iw+/V4MgGP4abKYY9eE606qemJj7IMBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Go6ZSJOQiXMndLMil//He+pO5uArn/CYu+U7vYiaIHm8LFvt24EEvdbeWmATwZnKc
	 C/gS/qhTt2BC+Hf4iHd3VLpTZgKoDaUQTW4DYwlXYgKVwnXpRI8okajJbjpQvE5yrf
	 QWj4rhoZZdRudz9YqN4VOPuzQ2ZsaFCE1Nzg05ADhkR5Lv0yilaV2AbTKxTnQxDVYy
	 Da2ivuArRkhRbZxx97ndZF7UVIdficEQM470Qaqe+spwq2etwWGJPcDGeYKzJZj5VR
	 h24mkIqKad09dNqvyqmpjajy3tf8OdPzqoorD+a0tY6ZneDopOyavNEOx88vfBWmk/
	 +iJPMs9mN95Tw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:36:01 -0500
Subject: [PATCH v4 14/31] accel: ethosu: Move DMA mode to src/dst struct
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
Message-Id: <20261029-ethosu-fixes-v4-14-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The DMA mode setting is independent for source and destination, so it
should be part of the src/dst struct dma rather than the global DMA
state.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index c046aee42687..2b9c98251c94 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -110,6 +110,7 @@ int ethosu_gem_create_with_handle(struct drm_file *file,
 
 struct dma {
 	s8 region;
+	s8 mode;
 	u64 len;
 	u64 offset;
 	s64 stride[2];
@@ -118,7 +119,6 @@ struct dma {
 struct dma_state {
 	u16 size0;
 	u16 size1;
-	s8 mode;
 	struct dma src;
 	struct dma dst;
 };
@@ -171,7 +171,7 @@ static u64 cmd_to_addr(u32 *cmd)
 static u64 dma_length(struct ethosu_validated_cmdstream_info *info,
 		      struct dma_state *dma_st, struct dma *dma)
 {
-	s8 mode = dma_st->mode;
+	s8 mode = dma->mode;
 	u64 len = dma->len;
 
 	if (len == U64_MAX)
@@ -664,13 +664,14 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 				st.dma.src.region = -1;
 			else
 				st.dma.src.region = param & 0x7;
-			st.dma.mode = (param >> 9) & 0x3;
+			st.dma.src.mode = (param >> 9) & 0x3;
 			break;
 		case NPU_SET_DMA0_DST_REGION:
 			if (param & 0x100)
 				st.dma.dst.region = -1;
 			else
 				st.dma.dst.region = param & 0x7;
+			st.dma.dst.mode = (param >> 9) & 0x3;
 			break;
 		case NPU_SET_DMA0_SIZE0:
 			st.dma.size0 = param;

-- 
2.53.0

