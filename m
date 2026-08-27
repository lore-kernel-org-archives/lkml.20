Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9672936E466
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862812; cv=none; b=KP2hobLetBXbW0hk+5T9m7iD1FMzcqR2wfHFlihJqpyT0AVNjTJxFHzty7P7ON4hHBm2clCCBvDDjl4SvLuqOeK+oqp0kdLnJBj3agM6zIFmz0QiZa8AaHLK0MoGA96/vR+ZFVVxhmlexdQ/smRCNUeHtciLD5RC6SqNpxrrSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862812; c=relaxed/simple;
	bh=AA6t6PxVHGhAqlHnhQ/mznRkK6lhMb6izEIp6UPyr8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHbIhg3vD9BvwgbBbyOASFdHEXwVkL+9MEaW0iSBDQ+3RWIQLWGDNHNFTX4Rq0hMbQUPCZWw3wKioKf+hgk5ClZAdG6Q3C/HQ91huA5CfUSBDF9XSgMRfXDzmttudX82zow2cFQj9NkCW0F3uVTpCV6lCMBuNU7GprTn2vPOkFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKhvmget; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKhvmget"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33791F00ADB;
	Thu, 27 Aug 2026 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862804;
	bh=soqnG960tBHGLpWSzIdlomnC6GrsL7rtWYMUTaVI+vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BKhvmgetFhBeRwz1VwBKvv6FI+f8RZtJ8HFBshs8gmvWtMdUICqTgwWbPhgZeJLLV
	 hieQOB3QAgu2zgfuGJZ8bAdJ6J4FIMgSUtJLirYXaio8+a1sGPFfLgPXU/uTjXJrb1
	 Lr705/uq8Ob5YwR8RK7TxY0Y6ekiEwsvQgfslFiq8FaGy3wsqC9xSfvmpi4Dswidce
	 tAR8vXoei/yUC0mx9LKqvhUNfvQy88lyJLisdLfBnFAsW97GhC6xO/y6ATLsKxs+OS
	 PbmhOMix6M8gfO92uf/Ko/JO5zOKPHH/uCT8Aeux+foWyq3Q+093EvV2LQKGuQX4ix
	 wduBSZGvniB1g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:07 -0500
Subject: [PATCH 08/11] accel: ethosu: Validate secondary streams
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-8-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator records the additional U65 scale and
weight stream addresses and the U85 weight decoder addresses, but only
checked stream 0 against its region buffer.

Check every configured secondary stream against the matching weight or
scale region before accepting a kernel operation.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_gem.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 9fce7caeeb9a..3d1f4121db4f 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -321,6 +321,15 @@ static int calc_sizes(struct drm_device *ddev,
 			st->weight[0].base + st->weight[0].length - 1);
 		if (buffer_size(info, &st->weight[0], st->weight[0].region))
 			return -EINVAL;
+
+		for (int i = 1; i < ARRAY_SIZE(st->weight); i++) {
+			if (st->weight[i].base == U64_MAX &&
+			    st->weight[i].length == U32_MAX)
+				continue;
+
+			if (buffer_size(info, &st->weight[i], st->weight[0].region))
+				return -EINVAL;
+		}
 	}
 
 	if (scale) {
@@ -329,6 +338,12 @@ static int calc_sizes(struct drm_device *ddev,
 			st->scale[0].base + st->scale[0].length - 1);
 		if (buffer_size(info, &st->scale[0], st->scale[0].region))
 			return -EINVAL;
+
+		if (ethosu_is_u65(edev) &&
+		    (st->scale[1].base != U64_MAX ||
+		     st->scale[1].length != U32_MAX) &&
+		    buffer_size(info, &st->scale[1], st->scale[0].region))
+			return -EINVAL;
 	}
 
 	len = feat_matrix_length(edev, info, &st->ofm, st->ofm.width,

-- 
2.53.0

