Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792559786;
	b=iN9ijcTYLvABxvH889aJp07QrRpC/jMxvJBLfSoUI+hTRpZ84223jky/6sQnR5TsgLwz
	 5v838HUFO+MIZlsx4Oii6N3p9ISm6by3YBimPDfM+GEJ9CPVn34QjTcFx+mIDYzAY9CeD
	 ma5f4swxOPw5YQbWFVlFXouEL9z/4NXlG05l89CmRgLrhkf8XiIVnf+X4kX0/ivbui7zN
	 Jmilq7pm3s9oOk4tdAEau+9YbOgGKjPXJcPP1RVZpcMbT4zFUCMtwOa0eBVfM/AJ4EZXC
	 0pZ+6Uw3Et2VzBYqb8USkKLkSIWJCgqeaUdcQSmfPCVmhUreOsJnF09U06goYz7ZivQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559786;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rkF5O/QhCHYyYoCE41lCmIDoTbPDNd6h5bzlsYBHuaM=;
	b=EJWnb0NlFegL1+R6LGcTPis1w4nofBNbR1V6yHRG/YnoJjvpqhWTFj7D9MGL7siVW3BQ
	 y+FoIw8F2cDLB/b0LRzMzxgr2ezZAPAE/C839kEJss4BpL9YkC9xOQ9wrWBc7qbXh8bPp
	 xbSyz7eZTqDm8vyM0Wy0H5gXfbQ3+Cvix5FzN6BzQC9wrAGMULS+dPofrMNmmCA0UMDF1
	 2evVWJ7XKwUwOioRPTYg9clUNnzo+5s5I6l9JzdKe6EtjVCX8o32/SwphvZp9CJTU5Z8U
	 cgiryRP62GTqS5aUQNa3EpS0Uv6E7mypb/2YyqtHxrYxy1u+4c6IrKsKzsdtwXrPxkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bsO1nb24;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF56606A31F;
	Wed, 21 Oct 2026 05:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF56606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bsO1nb24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792559784;
	bh=fZf+Wl+XtrVWss7Uvsxrkc0w0pfYbvuJQsVSoUp2kOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bsO1nb24JV20j6SofCDhgvmWddV4P/cVv8VqVXvxS55sj6MXAPTgtV4rJhwDMC9vs
	 HBefLtKXxPViiOcNOb7WfDdBLYFJwbVqs1yULrBDO/ocOewKRN4xlDXy8yku3DptxR
	 2P/61UQb/f7yYCZFzk8wZW0fVDirA+IyQlqn/FEPjlgNRyC8Sv3lQrt7bLs61VrXbN
	 ni4ZceGShYy/GMH0d65j3kyaUipLzzctNM+4466W45nQ6gfeMAg/+oWJXdoJm008eP
	 Fmrp3Yu1hetgWAygDIXTHI8738FjgrKuKD+FyN/wxhHvwP39cyVbENmd0ra/bFjHO7
	 4DdrgsEhFC7wg==
Received: from vignesh-thinkpad.. (unknown [100.64.0.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5BE4217E0C5F;
	Wed, 21 Oct 2026 07:16:22 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	valentine.burley@collabora.com,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] drm/ci: share skips between sc7180 trogdor devices
Date: Wed, 21 Oct 2026 10:46:06 +0530
Message-ID: <20261021051611.3328351-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021051611.3328351-1-vignesh.raman@collabora.com>
References: <20261021051611.3328351-1-vignesh.raman@collabora.com>
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

igt_runner.sh looks up the skips, flakes and fails files using
GPU_VERSION, which for sc7180 trogdor jobs is the board name.

The skips are the same for all sc7180 trogdor boards, but fails and
flakes can differ. Add an optional SKIPS_FILE variable to override the
skips file, so that it can be shared.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
  - New patch in the series

---
 drivers/gpu/drm/ci/igt_runner.sh                            | 6 ++++--
 drivers/gpu/drm/ci/test.yml                                 | 1 +
 ...80-trogdor-kingoftown-skips.txt => msm-sc7180-skips.txt} | 0
 3 files changed, 5 insertions(+), 2 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{msm-sc7180-trogdor-kingoftown-skips.txt => msm-sc7180-skips.txt} (100%)

diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
index 741d30655ab5..41c6f332a5e6 100755
--- a/drivers/gpu/drm/ci/igt_runner.sh
+++ b/drivers/gpu/drm/ci/igt_runner.sh
@@ -30,8 +30,10 @@ case "$DRIVER_NAME" in
         ;;
 esac
 
-if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt" ]; then
-    IGT_SKIPS="--skips /install/xfails/$DRIVER_NAME-$GPU_VERSION-skips.txt"
+SKIPS_FILE=${SKIPS_FILE:-$DRIVER_NAME-$GPU_VERSION-skips.txt}
+
+if [ -e "/install/xfails/$SKIPS_FILE" ]; then
+    IGT_SKIPS="--skips /install/xfails/$SKIPS_FILE"
 fi
 
 if [ -e "/install/xfails/$DRIVER_NAME-$GPU_VERSION-flakes.txt" ]; then
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 3777189e9737..248c6958cdbf 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -101,6 +101,7 @@
     BOOT_METHOD: depthcharge
     KERNEL_IMAGE_TYPE: ""
     LAVA_FIRMWARE: qcom-lava
+    SKIPS_FILE: msm-sc7180-skips.txt
 
 msm:sc7180-trogdor-kingoftown:
   extends:
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
rename to drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
-- 
2.47.3

