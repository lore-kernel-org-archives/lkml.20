Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCD559C984
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905105; cv=none; b=SqV3/4DyVzaZQ/Gv5WyTDo0pIsqRvO4nwRPH/4lPh/FzN5OX8laZpyuw+VDFegWbJ0M43D/vAzYaqEszuHzBOOQReRv3NbqOWNJSVcKLXVEkz4KJIqIm5VDTIOELjWIociFiVVrV62ls7Obx0vFGesVPXykIoq+YuFz/VpQJRFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905105; c=relaxed/simple;
	bh=FbefwW1eZASfx88uMrOevD/fzvnmLdy4GhljWjat4wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iumbfoyrt3fAxjtktF9ZC+OpjOWrsGPfcMsbM979ThxsQqHcETgrRjecj6whjU8ov8AzXr7cE0rpRmV0w/IQsfOKeUjT5OuzKep4aVMASD2QZMPCTranzVpthgOFNyuQgzpIHcCxnl2NNKlxiOYeJhCEnzahTVc5Anr0esj4tvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/GUlM5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/GUlM5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4F21F00A3D;
	Tue,  8 Sep 2026 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905104;
	bh=q5CMo4WNSM4ju2lnbqf0rXaRmZc8RgBpR2ruwkdpQ50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=V/GUlM5BCPyFYhPEHi2Jb+nM/J7dlUuHlhnjY0lP+UJrptBVgzcGjgoaCu9jCiLtd
	 DShMgX8Vu9DfwZeozD7w5tsf0mVzJsDjVNhVzG4LObKDSkq5vqfzJCirQvrEruA73S
	 Fzh9ZFTrZOKUoDa7tcnOXlBqOOGx7UIHe5Xyz1tIjkEV05ssmOeUsqp3SmH/2jd2qQ
	 d8UZ/I4wsnL30V7zFA5sn44YPrPos0Y+ngAkYY0uvyzplwxa0Jildc2WFT/oArSYn8
	 41jW+0v+4uyQeFHRykyr7AqR9yLCI8J3ee2dWfnhJIHEKmheBjSIBuYnIbxS6fT4pV
	 4jvZMRehbLyEw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:46 -0500
Subject: [PATCH v3 09/22] accel: ethosu: Factor buffer bounds checks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-9-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Move the repeated command-stream buffer range validation into a
helper in preparation for validating all weight and scale streams.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Adjust due to previous patch
---
 drivers/accel/ethosu/ethosu_gem.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 1e9ffacbc394..2707b7df5dbe 100644
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

