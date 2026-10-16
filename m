Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6FE4C9DE6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158503; cv=none; b=fxjFI/8z4O5MEDii9RO8t1dG5bf64jIzyavmGqWHBigIYfZ83xpg4kyOOybvlhkrJy93bgNfULKA2NihKpDfE8xSKwKQ4lYgcJy8wtpOmVweRPxlMYNMTBFhXbvwV7wbFARethHkH8k8bJ/fZRpYytcEIkR1ZWxIAYatGyA5h9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158503; c=relaxed/simple;
	bh=vw4nCqHouwXkZktyUkREIgbKQ870DxOexmNpDbWI7jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDiVUnOYRrWcnVKJqYHtUqd2jeah5oy16vV3JOqvmKggnMDxG0ojlDCed9wxoOnXgw8BCIyVJYfgUpGZXlKBrWe+RfqdumpKLa641cLOBEv6EyDJUkT8UPU1CBhYvYuyyzL8ymBVcUfb2O6Yu/LSFEizboKFaJbkOyrLN0cyXpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=K9HxLENO; arc=none smtp.client-ip=83.166.143.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="K9HxLENO"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j5mKb2RRmzbqV;
	Fri, 16 Oct 2026 15:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1792158035;
	bh=g6jKV1Wzp7fGYXRSf7cKBGfPxyp04vnQU7GdTLpcL8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K9HxLENO5ll75qzX6aI5UYh/n+FyHtM6QpadLCr4OW4z3Y0WEaCURefOdjkl/uDPF
	 i6dmyXMkb5BsERqI2eX6V1UEcQKNyjY35cqu6Fhj5z7SvnhB6lAP3do/9n80J/8rql
	 Tq+4ZDM1kV/oEaTsZOJFjcV1YKOTTIrlbVkDC228+fzAyJs8EIDf4OGj7eY1dCKcdr
	 RKppPmWt9zJE1yV2p8WdH/rKafft8G/V5G/85S0QWmKlb4jWwsNFLRsLu2oU688W6D
	 JhTqDvAuTbe2PyEw8gz7d0ihAxW8oXnS+Y56UT5uoUk39ilbz4W47adlPkaRlOoNXE
	 4CJprKKEt/7bg==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j5mKZ1MrHzFgW;
	Fri, 16 Oct 2026 15:40:34 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 16 Oct 2026 15:39:58 +0200
Subject: [PATCH 2/3] media: rockchip: rkcif: add support for GREY and Y10
 formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-v4l-y8-y10-csi-vicap-v1-2-27bb87aa745d@cherry.de>
References: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
In-Reply-To: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The OV9282 camera sensor driver can output in those two formats, but the
VICAP didn't advertise support for them yet.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index bc9518f8db507..7e86e0bc7573e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -87,6 +87,26 @@ static const struct rkcif_output_fmt mipi_out_fmts[] = {
 			.type = RKCIF_MIPI_TYPE_RAW8,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_Y10,
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
 	/* RGB formats */
 	{
 		.fourcc = V4L2_PIX_FMT_RGB24,
@@ -333,6 +353,12 @@ static const struct rkcif_input_fmt mipi_in_fmts[] = {
 	{
 		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
 	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+	},
 	/* RGB formats */
 	{
 		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,

-- 
2.56.0

