Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863454D9F81;
	Mon,  5 Oct 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220556; cv=none; b=ctf8mJNxiYtSHd9ikkXWb4zkzbc2jjYJQMyVEIqQSb+trEMiwZUD5r2xvCXKAm+UATfHQ6qNjL6WYteVtPhkkm03r4LwtoG+Gpt7eJM/wnVcFF3Um+maQTO7hi/u1WYVSqxb67fKsoc5ZnVNbxh/x/OOYhJR79l6pH0TxQf5sTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220556; c=relaxed/simple;
	bh=F523uhHNxHq0IqzYV4dQKQs0NWhwzkP6mf9rLa6ImNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcSYI65rfUiVMNZNctIoErDwSMqW7aJ90kBFQAyUjS2KWcxTOSOQVYfpxlO2nT5bOWagmUy596yVx6RMtwVIOaJkQZ4qacg6Kz8QEjZ+AP2dkeFpe1I0r2j+JqAikdyyxKJdbI/Jo3Pp4y2GMt9yZnCahmy7yUh+C7n0nUpTmLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edmNmUO7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edmNmUO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C0C1F00893;
	Mon,  5 Oct 2026 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220554;
	bh=AQPpgbtlJvvDe0GI0OtO4XoylpU/vxYqJPaS+/yTTKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=edmNmUO7PPerpd8Qg29HjwZmw5/YResIAg+o3FzcXUbf8Qif4BGJDnakrg0JocZEz
	 RfuXCuLOJUqctYpiqWFtG3gANxb6AvDW3E9RM8wQ8DyIpceJBhzWgBIXala7yuPVTI
	 S4lb495wg8W/FiF8NdnYziNmFWIyJ4WqTVlSpGOK/+SxWlPruX6ca2LsGVNGBLLvzn
	 1e4s1HrQdawAAXZkI4So+U/l8olISvuqJgD1zr4RAHcjxzbKbbLlXVsPheurT6DlNZ
	 VU+pC8z5qkQwQFOgUlgN2E2MMfHZoJayfxTNqN0h2d9XBDDi0BSGZ3G08SQRNjvWfK
	 IERw8jM7X7FXQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:13:34 +0200
Subject: [PATCH 04/74] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-4-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4409; i=bod@kernel.org;
 h=from:subject:message-id; bh=QzeZSVQTtZsWo6f5KWtcTCsmR6DUnv0oKQFiEOC0IxU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sD9CwFLsnHB0+9/GNMjnHsxOH9vz+WeEZUr
 Utnn3LrDl6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbAwAKCRAicTuzoY3I
 OkfdD/9MImWDAC3d+NLUEykAJDFxwvzQBjN32aHTOlQhW9hIeNe0d7ROxIPX095W6ewPgqrf/KU
 WKdb+hJg6U7ltzJKRrgGRurm1KmqfwU0ewfhBSQQ+WgnSw7OA2hLPCt+F2B/uQECNAC6Kzgjnkq
 dfPZUFeFROvMOqnTbxREw5UyQe4aOpvY4MCr5zWc9zHKojEopMG9Y1RYJhXPrNFlnDS72p19C6k
 4yM7TM40jq/zpupCZ2AvWTA3HfsYzbp1TpqXXUmFwpK1u0hFUipnsFiPuDQVCkfJ9VvgSDT3Qeh
 J5ml2X1S4K9jcqDSFgtIc+2LGpB3CWIfBcVjTU1icuf6uQTxmBKXkMGchQhFXPjWFPROpHLLKsx
 Kk3qUaFGi467LsV+qwFIHbZJ89QqVkSezXko6gg5oZd5oFasunaSFe8Cp6PQkDoLvajBjdGERrZ
 OKatAAxNFutRe1jA8mBLM806lXy7N2FXEhQfI2/cSvFKwa6J3cfskIGBcbMKOGqrYVdFeDMBGeu
 vi60hlJDSPoSbZGhNsJYgWf2hQAdGSyXCeVZ4kYtQZ81ozs47otZMxm/Y6QjOzWV7I8e3ppyDkY
 Soi0HmspSQCn8LpI8CXXOfiGWdjTyUlfaLyXx4noFq1z8+BXFbyU1ApkKA894pYjgdVdgtppOCJ
 9fgzWtJpdocDwNQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Antoine Bouyer <antoine.bouyer@nxp.com>

Rework the userspace-api documentation of V4L2 ISP to support
statistics.

Update all occurences of 'v4l2_isp_param' types to match the uAPI
changes and add a section to document the statistics serialization
format.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[Update on uAPI changes]
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/v4l2-isp.rst | 45 ++++++++++++++++------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
index facf6dba1ca7f..8a3f05b5e85fd 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
@@ -18,22 +18,22 @@ single C structure that contains a header, followed by a binary buffer where
 userspace programs a variable number of ISP configuration data block, one for
 each supported ISP feature.
 
-The :c:type:`v4l2_isp_params_buffer` structure defines the buffer header which
-is followed by a binary buffer of ISP configuration data. Userspace shall
-correctly populate the buffer header with the generic parameters format version
-and with the size (in bytes) of the binary data buffer where it will store the
-ISP blocks configuration.
-
-Each *ISP configuration block* is preceded by an header implemented by the
-:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
+The :c:type:`v4l2_isp_buffer` structure defines the buffer header which is
+followed by a binary buffer of ISP configuration data. Userspace shall correctly
+populate the buffer header with the serialization format version and with the
+size (in bytes) of the binary data buffer where it will store the ISP blocks
+configuration.
+
+Each *ISP configuration block* is preceded by a header implemented by the
+:c:type:`v4l2_isp_block_header` structure, followed by the configuration
 parameters for that specific block, defined by the ISP driver specific data
 types.
 
 Userspace applications are responsible for correctly populating each block's
 header fields (type, flags and size) and the block-specific parameters.
 
-ISP block enabling, disabling and configuration
------------------------------------------------
+ISP parameters block enabling, disabling and configuration
+----------------------------------------------------------
 
 When userspace wants to configure and enable an ISP block it shall fully
 populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
@@ -59,7 +59,30 @@ definition without invalidating the existing ones.
 ISP statistics
 ==============
 
-Support for generic statistics format is not yet implemented in Video4Linux2.
+The generic ISP statistics format is identical to the generic ISP configuration
+parameters format. It is realized by defining a C structure that contains a
+header, followed by binary buffer where the ISP driver copies a variable number
+of ISP statistics blocks.
+
+Extensible statistics buffers have :c:type:`v4l2_isp_buffer` header followed by
+a binary buffer of ISP statistics data. ISP drivers populate the buffer header
+with the serialization format version and with the size (in bytes) of the binary
+data buffer where ISP statistics data are serialized. Applications shall
+validate that the serialization format version matches the expected one and that
+the buffer size doesn't exceed the maximum size for a statistics buffer as
+declared by the driver's uAPI header.
+
+Each *ISP statistics block* is preceded by a header implemented by the
+:c:type:`v4l2_isp_block_header` structure, followed by the statistics data for
+that specific block. The driver might optionally report platform-specific flags
+associated with each statistics block.
+
+Applications inspect the statistics block type as reported in the header and
+validates the reported size matches the block's expected size before accessing
+the ISP statistics data.
+
+Extension to the statistics format can be implemented by adding new blocks
+definition without invalidating the existing ones.
 
 V4L2 ISP uAPI data types
 ========================

-- 
2.55.0

