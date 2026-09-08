Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E455921E4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905102; cv=none; b=FPtDlO3K1tp1kN/yvhirVLWpmhJ6ZcDXhQyhAL4qy484l9E7ai61V3Yl4FR6on5WIHKeAGf/TN5qVUNyLghcRoZ9fkbW3nkYzDAyjMtvxm2+fbPlNBVV3M5CcXA/MUPO8u2gQGhoWyGNyvqFye+YJ6epZsJYKlQgxvL+6rxUqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905102; c=relaxed/simple;
	bh=ePs91XSM48zZM3SaAL6tnk9g2qNbUW6PvFwH6+mLMos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/8uI+G7YcbbFbapr7oh2j0iL4QXn9TjU5lkVph59q8QYwSFJKw5hw4ZSI6AumfYEgDYc0A6mehBBCPvx8jjS3AGpAoaF7aso0qO8FB70hYFkaiZqbXOZ9Z/dG6V+0YssFgPIEwj9L3lIf8tPXG4SoITiUbc0vS2it5LTzGODDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRr1FRpi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRr1FRpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701401F00A3E;
	Tue,  8 Sep 2026 22:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905100;
	bh=sRBKq+2Umg2Iw+/V4MgGP4abKYY9eE606qemJj7IMBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WRr1FRpinzIqkYXgjH92g2dXPRSg0QMLL4zSozziJRNd5xp7aOA+ii7e5aIrAKoc5
	 /dqzaZ17cV2DTquPLFFkkrtHvzHFg4/GID1/jsGTuqqXh7vbmGoP4PUp7JHAmtH5L4
	 X6PjVFXutNfTqC/VMiL5U/IGhrLHXGbENl1ZBrMZWwq0MY2Xbn7jADwGXnt/qecbOU
	 zsTYjgWqFDNxYcwGQ6OGumBnrO09OOSxM+hpTCp30ro6i5E8zGUzI9Z9/vV3TegXKn
	 gASK2w71thUVE5yd1xacivMWWMICQtmg2CW49uyBCYAp4WQlqqGxAfei62fYZdDDOP
	 PpVQcwwoiEQbA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:44 -0500
Subject: [PATCH v3 07/22] accel: ethosu: Move DMA mode to src/dst struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-7-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
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

