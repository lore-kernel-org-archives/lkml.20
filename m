Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E4112D21B;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225935; cv=none; b=NcGggi73x4lVs7ojn5AHZgdc09w/mfqXTWaVyLveZtllMdS4wEbG4F+ftBzEjyDpxWPdHrrLmK0s+QNUpC06LM6mPID42TuWFAD2lQQNlhDJXrHOTsA0Wboh22sJD0dKtDFtnrlv2NXDQaDGycWEEawxrOLzWFAHLg4lz8NiZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225935; c=relaxed/simple;
	bh=uGgjj/bVm2RMQrXvIlT6pSJ+SabtuB8Hk1e749+1Yds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O0LSpnavNSZLnbi2zxO6OXCjWrms35+GIAM668ozzqp10xJoEm7IAzyj1xqiWxakwjQHGpxgIA0gIZfkm6u+JlZXscDoMSGeIxK8XYueHlKgAHQd365hpU12ekqQX7ocM+/1V/39uNhPlYy2hqQP6Z9vkk3ODmB0Sbua37qxfbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qiwhbuzX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qiwhbuzX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BCE0C2BD00;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792225935;
	bh=uGgjj/bVm2RMQrXvIlT6pSJ+SabtuB8Hk1e749+1Yds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qiwhbuzXWhXm6Zn+fu/o6rbWF/VoZNyvslagRz6t5SRrpnDPxxyo8+AbLYsvVITiM
	 am7ThTTfcOs8rzANOeIY/FPgo0pqtkS7yx67M6HE3H5zV2HMJDwXW4PzCCRB49JxFc
	 fCxqXUPwFFYYK8P/cNN7uY6ySlH57qXty+JYt3KakGBLVnIQQ8SyMiypqGEdk7GNTB
	 Io5i+7AuDdzYi3byUs4+KHk2/yDCCaIvIPdla3swcnH9NaDOnXNzHtUtid19fjAhVJ
	 NRBYFArZJ2u/HR5d+O+DEry1VMDxok5eMQCuLb2yIjxU9H9Q+Yr1UrmfYgAiav+b8S
	 51npULNSZPzUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F421CCF2C9;
	Sat, 17 Oct 2026 08:32:15 +0000 (UTC)
From: Tin Posavec via B4 Relay <devnull+tin.posavec04.gmail.com@kernel.org>
Date: Sat, 17 Oct 2026 10:31:59 +0200
Subject: [PATCH 3/3] media: ipu-bridge: Add OV9734 sensor config
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-ov9734-ipu6-v1-3-86eab22ae258@gmail.com>
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
In-Reply-To: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tin Posavec <tin.posavec04@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792225933; l=1269;
 i=tin.posavec04@gmail.com; s=20261017; h=from:subject:message-id;
 bh=FwgBHrNJRouDllQ+29L6D3vp6iZpIUXBZhoEI3VmSgY=;
 b=QDrGAg8BUmbwzH+NIyXLqxVnJU2GjUiEKzRoPbbry/m7nZSKEBftvlOD6+8nCekMYhvbnTFjm
 dLYbQjQbfyLCTq5eTqRKoiPXmb3eNu8K6YYsS8XYe5H4uN4v2p7ftmp
X-Developer-Key: i=tin.posavec04@gmail.com; a=ed25519;
 pk=SHQVmXmK88mO08JT/P9vzu9gKd208IICWLSbsX3TmcI=
X-Endpoint-Received: by B4 Relay for tin.posavec04@gmail.com/20261017 with
 auth_id=1222
X-Original-From: Tin Posavec <tin.posavec04@gmail.com>
Reply-To: tin.posavec04@gmail.com

From: Tin Posavec <tin.posavec04@gmail.com>

Add the Omnivision OV9734 (ACPI HID OVTI9734) to the
ipu_supported_sensors[] table, with a single link frequency of 180 MHz,
the only one supported by the ov9734 driver.

The sensor is the RGB camera of the Intel NUC M15 laptop (LAPRC710).
Without this entry ipu-bridge does not create a fwnode graph endpoint
for the sensor, and the camera is not enumerated.

Tested on the NUC M15: the sensor binds and streams 1296x734 SGRBG10
at 30 fps.

Assisted-by: LLM
Signed-off-by: Tin Posavec <tin.posavec04@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..4982b77de 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -120,6 +120,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Omnivision OV9734 */
+	IPU_SENSOR_CONFIG("OVTI9734", 1, 180000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */

-- 
2.53.0


