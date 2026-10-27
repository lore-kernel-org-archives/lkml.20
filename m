Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104771;
	b=3xcnUxV90zDHpAUw/TWAeuIrLsDfkFGdfvy2X5n994hb5++FFqlPnehiyMhocXxJWsB3
	 Xl53oQ4JFu6PJrr0yKoOFE0mdsnuBBi3RpZdVhyQNBAMrAZrLtmqInfolkVP0TJXB3ZCQ
	 QZpCuLbJKhnu+Tdl33gpS3jHkz2oxb0S6X0rw3lHYB49UbyXRThjhHpgQEuSHiIJmzPNf
	 +taGiOgj961Mh4essQQwnhScEpX/E9yunaevgREJDESlwciv/P1Ea7kWgdD0s/YwbTbCp
	 yOCRfBy8PolMhBhXpkc+ypbqi9FypKXCzq8eJXmvdnOfRu2TWBJwd2PMXBGJI2BCAKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104771;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=gLWsRBjvb19o+i1rz/E7XkPpB1jiHd1XfulRbSJIA6k=;
	b=SU56IOz/dHu93kN7WmjInJ1EGiw9zvMTV49PQTroZVGYMdNYYqEt80YZJ8cI6p5aVXp+
	 aBBwlE3jmcletmoz9Cb1aHCtkbCvKzak+X2qYdbtQUBMzevRv/6Ci8Wa7onwx4sE047+Y
	 UCCwKpyGFCDa3qXc8Hr4Nm7+ENsuVE5bgRZZeXvQBE7R1+uBKUJbejGHwlqyVeTYbWxvo
	 GqNwaZ2MWx3Nj5RPzOMc8OdMdpoHLsA8AYrhjtmbZ2KhKy07tY1qzSdkmpncG5dLmaIS4
	 N4gIpP0fA22pm0Vg1qpLFI+cmQdZJwTsBc1qOGFj6uytgSzjxKbiAjsT3d4mLaN5lhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LiQZmoPH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F1860A2614;
	Tue, 27 Oct 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LiQZmoPH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222071F031E2;
	Tue, 27 Oct 2026 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793104770;
	bh=gLWsRBjvb19o+i1rz/E7XkPpB1jiHd1XfulRbSJIA6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LiQZmoPHeqs6344FI1juM7Jytp2h50dpczssPUaBGj74Jsd+paS9LeUeE8+tDcKnL
	 A4Keb+I6jurohojmDof2uCejWpL2t3tF0oyHprr8D49uJjEq66lb4Puxx+xAscFMZS
	 qVX/3rV2gfScu8vFBe85Rue50DiWd2G5coXCOJSQuheud6GdIbJULt9ZYDoIErudCI
	 b0vE9QyBSdblkAFcFmpmNies/oByViw+v3Tq3JsMN+szQAhjLa+aRlPN5zD+bq215Q
	 O6pPnIZ9WBvkqAGW5GAbvCDpWwAtZAJh2SwYTsbH6d+aJQsLD2IRokoJqTKXcTq9DG
	 771XmlDcT1Vcw==
From: Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 27 Oct 2026 18:09:04 +0530
Subject: [PATCH v2 2/3] media: qcom: Use PAS API for video memory
 protection
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
Message-Id: <20261027-pas-video-v2-2-5b52bca5add6@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0

From: Sumit Garg <sumit.garg@oss.qualcomm.com>

Replace the direct qcom_scm_mem_protect_video_var() calls in venus and
iris with qcom_pas_mem_protect_video_var(), so that the call is only
issued when the active PAS backend needs it. This allows the video
codecs to bring up firmware with the OP-TEE PAS backend as well, with
no functional change for the SCM backend.

As the video drivers no longer call into SCM directly, also drop their
Kconfig selection of QCOM_SCM.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig         | 1 -
 drivers/media/platform/qcom/iris/iris_firmware.c | 5 ++---
 drivers/media/platform/qcom/venus/Kconfig        | 1 -
 drivers/media/platform/qcom/venus/firmware.c     | 3 +--
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 0996213e71e7..804d8d38341e 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,7 +5,6 @@ config VIDEO_QCOM_IRIS
 	depends on QCOM_SMEM || QCOM_SMEM=n
 	select V4L2_MEM2MEM_DEV
 	select QCOM_MDT_LOADER
-	select QCOM_SCM
 	select QCOM_PAS
 	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index ed2bd0e83797..16e19c65c7ba 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -5,7 +5,6 @@
 
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_pas.h>
-#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -241,12 +240,12 @@ int iris_fw_load(struct iris_core *core)
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
 		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
-		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
+		ret = qcom_pas_mem_protect_video_var(cp_config->cp_start,
 						     cp_config->cp_size,
 						     cp_config->cp_nonpixel_start,
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
-			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
+			dev_err(core->dev, "qcom_pas_mem_protect_video_var failed: %d\n", ret);
 			qcom_pas_shutdown(IRIS_PAS_ID);
 			return ret;
 		}
diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
index 7997b8aa427a..c4362eff954a 100644
--- a/drivers/media/platform/qcom/venus/Kconfig
+++ b/drivers/media/platform/qcom/venus/Kconfig
@@ -5,7 +5,6 @@ config VIDEO_QCOM_VENUS
 	depends on (ARCH_QCOM && ARM64 && IOMMU_API) || COMPILE_TEST
 	select OF_DYNAMIC if ARCH_QCOM
 	select QCOM_MDT_LOADER
-	select QCOM_SCM
 	select QCOM_PAS
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3c0727ea137d..d232fe5b28b4 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/of_device.h>
 #include <linux/firmware/qcom/qcom_pas.h>
-#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/sizes.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
@@ -255,7 +254,7 @@ int venus_boot(struct venus_core *core)
 		 * cp_nonpixel_start = venus_sec_non_pixel/virtual-addr-pool[0]
 		 * cp_nonpixel_size = venus_sec_non_pixel/virtual-addr-pool[1]
 		 */
-		ret = qcom_scm_mem_protect_video_var(res->cp_start,
+		ret = qcom_pas_mem_protect_video_var(res->cp_start,
 						     res->cp_size,
 						     res->cp_nonpixel_start,
 						     res->cp_nonpixel_size);

-- 
2.43.0

