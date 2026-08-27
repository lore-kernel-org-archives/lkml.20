Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F4B374E67
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862813; cv=none; b=oyzoaPVf2eS/hfZDsG2jyY40ug+y9HCUUfZkC386Kwzn5D2z9cvUs81AYCoGd5uqtOzvefSd2hMkV52sXdA8QW7OcW2FqgK2RUoXAgoEVmuZDpF2Z+JV9XJKA7X1HrPg+i9zkEnJ/m9VpnZCfV0BYIISCIfYJrqoweQmM4A9/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862813; c=relaxed/simple;
	bh=TiTIpixjiEKj1j35oZPlylmbEf1lYrJOisUGxThKzBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJjo8KXxwMADtQdxp4S/MGqVTgBZIHRx9UiQ67eChJc2ZuPmH7PLe3Z/x2pvQLQK6MaNqHiCIUvnrWRdMz3Sanwzhez4bRJ6sczqLn+Q5Xrffecq+tX7AGxrQ+ZQX/gsJexvjEKKpN51vEBX8E3E/Bnx0JpH1etD9kezKYVOOUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBfuPI9R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBfuPI9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ADD1F00ACA;
	Thu, 27 Aug 2026 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862803;
	bh=euVg/tOwg5ulL53VFnnSZJZdeTLzg/FGZY1xwhIMPMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JBfuPI9RdPMrhn3lVUSCqZyqwzvidM74e3isdluBD7J6yYxsCyX0qgY2Add2hOZuY
	 DgOnuHK2loRzlARS1Qo6c8MqtgmfIQih7f2iJs2PGhtLVI3szs1/iFbFfJ8tsZ3y6s
	 XkFrVjxPpFN2FvA+daaS7ud3IC84Drn54dBZlZOMolIuraFbaWWbc/YXbBVZUXkhGC
	 I81zzsTczmTjJ6VswHCfDiQtfDS5zwp3JMJj3i6Ro2T6PDNF5JaEcd1EAQGo+uByiK
	 Lrr54V584oMPbESYIk8wXhAhIEyrE5F44vLoAV6FRzvk5vKibdJWbkLCXqVt59nU/3
	 8AMG79mXYmOig==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:06 -0500
Subject: [PATCH 07/11] accel: ethosu: Factor buffer bounds checks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-7-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Move the repeated command-stream buffer range validation into a
helper in preparation for validating all weight and scale streams.

Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_gem.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index eda9f42239be..9fce7caeeb9a 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -259,6 +259,22 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	return addr;
 }
 
+static int buffer_size(struct ethosu_validated_cmdstream_info *info,
+		       struct buffer *buf, s8 region)
+{
+	u64 end;
+
+	if (region < 0 || buf->base == U64_MAX || buf->length == U32_MAX)
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
@@ -303,24 +319,16 @@ static int calc_sizes(struct drm_device *ddev,
 		dev_dbg(ddev->dev, "op %d: W:%d:0x%llx-0x%llx\n",
 			op, st->weight[0].region, st->weight[0].base,
 			st->weight[0].base + st->weight[0].length - 1);
-		if (st->weight[0].region < 0 || st->weight[0].base == U64_MAX ||
-		    st->weight[0].length == U32_MAX)
+		if (buffer_size(info, &st->weight[0], st->weight[0].region))
 			return -EINVAL;
-		info->region_size[st->weight[0].region] =
-			max(info->region_size[st->weight[0].region],
-			    st->weight[0].base + st->weight[0].length);
 	}
 
 	if (scale) {
 		dev_dbg(ddev->dev, "op %d: S:%d:0x%llx-0x%llx\n",
 			op, st->scale[0].region, st->scale[0].base,
 			st->scale[0].base + st->scale[0].length - 1);
-		if (st->scale[0].region < 0 || st->scale[0].base == U64_MAX ||
-		    st->scale[0].length == U32_MAX)
+		if (buffer_size(info, &st->scale[0], st->scale[0].region))
 			return -EINVAL;
-		info->region_size[st->scale[0].region] =
-			max(info->region_size[st->scale[0].region],
-			    st->scale[0].base + st->scale[0].length);
 	}
 
 	len = feat_matrix_length(edev, info, &st->ofm, st->ofm.width,

-- 
2.53.0

