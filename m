Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC433C3C0F;
	Fri,  2 Oct 2026 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945088; cv=none; b=ZpkNKLz2HF2BnQX9lFBVBVBiuAeIOpQMUgAMGFO9UOfhgXcg/6t20zEsnYAnoU47+8NYUv0zDuch8M0n0faobJI2XWgiRwpnLL5YWVzehdvE7L3SgTy+WBVt+YDnqZNue+CipD+8Pe/TiHgHF4CZZ04r1z31Xz1OaPQr3WpPb1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945088; c=relaxed/simple;
	bh=xRkafcCjSFUo2rYZT8BgEEoW42FdhvEROQUwsiLUhqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGpdV0jphFKonmvaBjsNMBdfpPQzap3VroTwQrr9DnM5N2APBfE51+T+XIIoEGcVzP8NGAZYEma57xdWyyoM4LkOpuJmJy2SfKhmupLiu4LmgaBYDzvhj3wZy6QJoBa1//AmJBbji01RJ6DGbegfa5zKOs3Onpno1nX01n9ECEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VC/lPoqL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VC/lPoqL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B9C1F00899;
	Fri,  2 Oct 2026 12:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945081;
	bh=xX1uPIerE/XHyUkcOmnmZJwAkV4wSq9vMDaHmsrU6ps=;
	h=From:To:Cc:Subject:Date;
	b=VC/lPoqLl2/xHeoZ1JiCO7h0qcGmSmrUulc9eUuQPtc+7RZ7E5I3W5apxm5+P7WUt
	 Jg5u0uRocTuLFHE9S4eV5oV/Gk79KF36KsP3yLHxlXsyJlSt8ms4fhIFyUkEJKjLaJ
	 YuWVlqjQ8KUkh+Hge9TbZixZng4Y7zfuQyOCPrCKla9XNOHz0eMNeOrG+pb2vLwQ8G
	 Ew1r+TU6R++0K8eJ+El84dlDaFEcyQnodCO+gfg7O8zVVta6VBSmVKdJr8CiErVg2n
	 v5nQ/+xIMICcl5ga8y93Kak3fNxfdwHQBDlhMQiJq3A62+zHVkz7BbwYhOHjBJidic
	 5BwZVpdURLOMA==
From: Arnd Bergmann <arnd@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: iris: avoid plain 64-bit division
Date: Fri,  2 Oct 2026 14:44:22 +0200
Message-ID: <20261002124435.3435628-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

inst->fw_caps[BITRATE].value is a 64-bit integer, which on 32-bit
architectures cannot be divided:

ERROR: modpost: drivers/media/platform/qcom/iris/qcom-iris.ko: symbol '__divdi3' undefined!

In particular, doing three divisions in a row is particularly slow,
even on 64-bit CPUs.

Rework the calculation to replace it with a single division, thus
avoiding the build failure.

Fixes: 5f21cd9a4ae4 ("media: iris: add support for multi_slice in iris encoder")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Please check the math, as I'm not sure if this is the intended
amount of rounding. Previously it was rounding down twice and up
once, now it just rounds up during the combined division.

Ideally this would be replaced with a cast of the incoming value
to u32, but doing this requires to prove that this does not overflow.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8c4c47944f22..5294999fdf7b 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1588,8 +1588,9 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
 	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
 		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
 		if (rc_type != HFI_RC_OFF) {
-			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
-							 slice_caps->max_slices_per_frame);
+			max_avg_slicesize = DIV_U64_ROUND_UP(inst->fw_caps[BITRATE].value,
+							     fps * 8 *
+							     slice_caps->max_slices_per_frame);
 		} else {
 			/*
 			 * No bitrate target exists under RC_OFF, so approximate a
-- 
2.53.0

