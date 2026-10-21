Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792559791;
	b=SVgbQoMBhiEjfhYIrjlZF4w042lZsosSNFPSFKyNomJVHjhiiTAXiqDNSE1jzyjH4DKm
	 YLTiUS3N4KyqWn4biprczWQACjhNIOre48ASqy800pGqsRJk2NJvf3PN5gNJalgDmxrMZ
	 CRdqFBRcG93Hg14/WHONdGrzdokbMxGp5dlopzPvT98q054nnVUsvA8kn2KmW7N1vxoyJ
	 7DCYiH5ueeKrtVbdpC1cJ+pOwFuMeD8362+S6Xm3qkvdbxqZjcoTCaTrfNMRwvglL6rJA
	 dXMu9ne+iEeTwJvQXxttjmVBYrbyVPGtsZA6XsQUBXiQKRsQP9rnN3g5z4sRDxqOAUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559791;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iYCDbp7xu9CJYojx/sCsbjb/ARamyJzB529MAMWXIXg=;
	b=e7ZikslBbO+FgmXOR25/hmxFwGZger7tex+fJlVFHvAYVGw2NRDADZMVI9E/HxmXMPId
	 y+MtvLJQRk1bxha4Phj5eG79fZjCFZchcFHpiLJw7I+OeRVRv2mElWrDIeFu14gc34vWq
	 WJ8PVN586ykwf+wUdWR6veiKF6iWOFm9lsiac1xzCAQ70abaExKEC5ju3yl1U04jWXq/6
	 HAioxb3iMsDJ0NERZrVNBFfu6p77dT0K1wGee/57GMrOwIUs/mxbugezjBA32BIhD3Dfw
	 SqTJkiJvatPoU8+wQxXWReBKZQkgmCJXDsRp5c8OdTHTOW34UmzNP32WYI4nuEXXV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Grm+l9U1;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499BF606A31A;
	Wed, 21 Oct 2026 05:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 499BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Grm+l9U1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792559789;
	bh=xXsogCyahZG5zvtRjGL2R/rk1SOh2LYT71BDQM5HDtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Grm+l9U12zT9ydFrPQ1OoT/6MbYp93nbraDLuWsSweVYLO8p1tyooxj3jlnf9ecBb
	 +jGrn1kRQ83fssCYVO1EFo8RIkYFqNptIH4sq9is+NN3zsh0NFtl3iF+i6jTjzuiUa
	 nDatFYhgMz/fDCkWydl1kIJ9PwSzQnwUsCz1tVAUTaw+lLugNHrL/5RBMKEAe/z+i0
	 9kD82yjvk/PlKjN3+tCMemCUTZ0/sYofI9MW0Z9toUjJzR8Qa/Y8QTcjU2tevyx3ym
	 aZ/qGQSsgE7NuAGZxTsXkpG7W510QfqnhhoZJVqSd/Vjl0pVnG2ZaNPM1Xd0S+Uxdm
	 WYghNI2M2F8Eg==
Received: from vignesh-thinkpad.. (unknown [100.64.0.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86E5017E0F75;
	Wed, 21 Oct 2026 07:16:27 +0200 (CEST)
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
Subject: [PATCH v4 3/3] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
Date: Wed, 21 Oct 2026 10:46:08 +0530
Message-ID: <20261021051611.3328351-4-vignesh.raman@collabora.com>
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

Add job that executes the IGT test suite for
sc7180-trogdor-wormdingler-rev1-boe.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v4:
  - Use shared skips file between sc7180 trogdor devices
  
v3:
  - Rebase with msm-next
  - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221

v2:
  - Add comments to clarify panel configurations for sc7180 trogdor devices
  - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
  - Failure pipeline - https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1642103

v1:
  - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/221
  - Depends on https://lore.kernel.org/dri-devel/20260210071138.2256773-1-vignesh.raman@collabora.com/

---
 drivers/gpu/drm/ci/arm64.config               |  4 ++++
 drivers/gpu/drm/ci/build.sh                   |  1 +
 drivers/gpu/drm/ci/test.yml                   | 12 ++++++++++
 ...180-trogdor-wormdingler-rev1-boe-fails.txt | 23 +++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index c46125c1f80f..64951d9f98cc 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -214,3 +214,7 @@ CONFIG_PWM_TEGRA=y
 CONFIG_DRM_PANTHOR=m
 CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y
 CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=y
+
+# For sc7180-trogdor-wormdingler-rev1-boe
+CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
+CONFIG_GPIO_SHARED_PROXY=y
diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index fdaa26ad79d6..be12bfc0cb97 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -27,6 +27,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sm8350-hdk.dtb"
 elif [[ "$KERNEL_ARCH" = "arm" ]]; then
     GCC_ARCH="arm-linux-gnueabihf"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 248c6958cdbf..fd03e976b4a9 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -103,6 +103,7 @@
     LAVA_FIRMWARE: qcom-lava
     SKIPS_FILE: msm-sc7180-skips.txt
 
+# eDP panel (parade ps8640 dsi->edp bridge)
 msm:sc7180-trogdor-kingoftown:
   extends:
     - .msm-sc7180
@@ -113,6 +114,17 @@ msm:sc7180-trogdor-kingoftown:
     GPU_VERSION: ${DEVICE_TYPE}
     RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-kingoftown
 
+# MIPI DSI panel
+msm:sc7180-trogdor-wormdingler-rev1-boe:
+  extends:
+    - .msm-sc7180
+  parallel: 6
+  variables:
+    DEVICE_TYPE: sc7180-trogdor-wormdingler-rev1-boe
+    DTB: sc7180-trogdor-wormdingler-rev1-boe
+    GPU_VERSION: ${DEVICE_TYPE}
+    RUNNER_TAG: mesa-ci-x86-64-lava-sc7180-trogdor-wormdingler-rev1-boe
+
 msm:apq8016:
   extends:
     - .lava-igt:arm64
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
new file mode 100644
index 000000000000..4af93eeeaf99
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
@@ -0,0 +1,23 @@
+core_setmaster@master-drop-set-user,Fail
+kms_color@ctm-0-25,Fail
+kms_color@ctm-0-50,Fail
+kms_color@ctm-0-75,Fail
+kms_color@ctm-blue-to-red,Fail
+kms_color@ctm-green-to-red,Fail
+kms_color@ctm-negative,Fail
+kms_color@ctm-red-to-blue,Fail
+kms_color@ctm-signed,Fail
+kms_color@gamma,Fail
+kms_color@legacy-gamma,Fail
+kms_cursor_legacy@cursor-vs-flip-toggle,Fail
+kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
+kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning-vs-hang,Fail
+kms_invalid_mode@overflow-vrefresh,Fail
+kms_lease@lease-uevent,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane_alpha_blend@alpha-7efc,Fail
+kms_plane_alpha_blend@coverage-7efc,Fail
+kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-- 
2.47.3

