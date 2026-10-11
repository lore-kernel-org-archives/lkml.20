Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837B43C1985;
	Sun, 11 Oct 2026 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719722; cv=none; b=Ra3R0/gXcU6VV1yt4Ts96SHIaE4RpVkZxxURNnDEvUKnm8ly35m5L1johHA5p4gPGO7sfQ/ozbg3tL8s50RRCNh99Ba0Ki1JBARj9nj283SUZXBSxVWE3Dh+hQEXb0A45K2SIANrQ5BJSLW6lrCDiXU9PQEN/liaUcDh+CvpGm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719722; c=relaxed/simple;
	bh=vTxTLXO94mPrFzBNxHgnRC0RBrChBU9PxbBkMXtarEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTVdqya2AQLufakfu08zBN2/Ew4bR7tpPa0UEcQlW76aGOuFms1zxXnY88HVT2OcEOZsnbCEylSui4JJP44lRHS9kaAkqZIHcCo1dqy3HlcdfJGb9363jKlQCBBjIqjXvqdVoKO023BGKXg3w8lB7DHwvKOjfIVwKUP6zlXBo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=L9hU7eQE; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="L9hU7eQE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qs3brPkWF42jNUnHBP//SUL9M17vf5P9yzMliBCVuNQ=; b=L9hU7eQEUCcT+rlCoKqp/nVEcK
	hgnQfOA2N/eCOBlMRGzztTPUs72VBzYdW6bgh4JjGWIY5qz8dPTXflHP15/XkHrxNZVsWedLus4AN
	rKX+oUKtIZu2wHt10uH0of0ivqzHIWviYEpLB6APoaXSEptc/j4lB5l7jgmrFNnmD9d8=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1xFs8u-0000000GkAI-2SWn;
	Sun, 11 Oct 2026 14:55:05 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 11 Oct 2026 14:54:09 +0300
Subject: [PATCH v3 8/9] drm/panel: novatek-nt36672a: Add panel for Asus
 Zenfone Max Pro M1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-nt36672a-panels-v3-8-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
In-Reply-To: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Aboothahir U <aboothahirpkd@gmail.com>
X-Mailer: b4 0.16.0

Add support for TXD TXDI600YANPA-43V3 video mode panel based on
Novatek NT36672A, used in Asus Zenfone Max Pro M1 smartphone
(asus-x00td).

Co-developed-by: Aboothahir U <aboothahirpkd@gmail.com>
Signed-off-by: Aboothahir U <aboothahirpkd@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
v2:
 * change compatible prefix "txd" -> "txdkj"
 * use co-author's real name in trailers
---
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 281 +++++++++++++++++++++++++
 1 file changed, 281 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 48dff2279b0e9..7d7c79d2502d2 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -464,6 +464,252 @@ static void tianma_jasmine_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
 	mipi_dsi_usleep_range(dsi_ctx, 5000, 6000);
 }
 
+static void txd_x00td_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0x9e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x07, 0x94);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0e, 0x35);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0f, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6d, 0x66);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x69, 0x99);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x95, 0xf5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x96, 0xf5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x23);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x12, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x15, 0xe6);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x16, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x00, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x07, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x08, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x09, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0a, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0b, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0c, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0d, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0f, 0x17);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x10, 0x15);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x11, 0x13);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x12, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x14, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x15, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x16, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x17, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x18, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x19, 0x05);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1a, 0x03);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1b, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1c, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1d, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1f, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x20, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x21, 0x17);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x22, 0x15);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x23, 0x13);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2f, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x30, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x31, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x32, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x33, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x34, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x35, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x37, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x38, 0x72);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x39, 0x72);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3f, 0x72);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x60, 0x10);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x61, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x68, 0x83);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x78, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x79, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7a, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7b, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7d, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x7e, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x45);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x81, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8e, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x90, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x92, 0x76);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x93, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x94, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x99, 0x33);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9b, 0xff);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdc, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdd, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xde, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdf, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe0, 0x75);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe9, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xed, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0,
+				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
+				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
+				     0x00, 0xac);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1,
+				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
+				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
+				     0x02, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2,
+				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
+				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
+				     0x03, 0x68);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3,
+				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
+				     0xbd, 0x03, 0xd6, 0x03, 0xda);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4,
+				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
+				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
+				     0x00, 0xac);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5,
+				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
+				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
+				     0x02, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6,
+				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
+				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
+				     0x03, 0x68);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7,
+				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
+				     0xbd, 0x03, 0xd6, 0x03, 0xda);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb8,
+				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
+				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
+				     0x00, 0xac);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9,
+				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
+				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
+				     0x02, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xba,
+				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
+				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
+				     0x03, 0x68);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbb,
+				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
+				     0xbd, 0x03, 0xd6, 0x03, 0xda);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x21);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0,
+				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
+				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
+				     0x00, 0xac);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb1,
+				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
+				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
+				     0x02, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb2,
+				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
+				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
+				     0x03, 0x68);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb3,
+				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
+				     0xbd, 0x03, 0xd6, 0x03, 0xda);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb4,
+				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
+				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
+				     0x00, 0xac);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb5,
+				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
+				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
+				     0x02, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb6,
+				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
+				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
+				     0x03, 0x68);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7,
+				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
+				     0xbd, 0x03, 0xd6, 0x03, 0xda);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb8,
+				     0x00, 0x00, 0x00, 0x15, 0x00, 0x37, 0x00,
+				     0x54, 0x00, 0x6d, 0x00, 0x84, 0x00, 0x98,
+				     0x00, 0xac);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb9,
+				     0x00, 0xbd, 0x00, 0xf9, 0x01, 0x25, 0x01,
+				     0x6b, 0x01, 0x9c, 0x01, 0xec, 0x02, 0x22,
+				     0x02, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xba,
+				     0x02, 0x5e, 0x02, 0x9e, 0x02, 0xc9, 0x02,
+				     0xfd, 0x03, 0x21, 0x03, 0x4d, 0x03, 0x5a,
+				     0x03, 0x68);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbb,
+				     0x03, 0x78, 0x03, 0x8b, 0x03, 0xa1, 0x03,
+				     0xbd, 0x03, 0xd6, 0x03, 0xda);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0a, 0x81);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0b, 0xd7);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x0c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x17, 0x82);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x21, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x22, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x24, 0x76);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x25, 0x76);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5c, 0x25);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5d, 0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5e, 0x80);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x5f, 0x22);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x65, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x69, 0x60);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x6b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x71, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd7, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd8, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xda, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdb, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdc, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x06, 0xc8);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x12, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x19, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1a, 0x97);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1d, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1e, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x99, 0x20);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x13, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x16, 0xb0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x17, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 70);
+	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
+	mipi_dsi_usleep_range(dsi_ctx, 10000, 11000);
+}
+
+static void txd_x00td_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 50);
+	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
+	mipi_dsi_msleep(dsi_ctx, 120);
+}
+
 static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
 	.clock		= 161331,
 
@@ -608,6 +854,40 @@ static const struct nt36672a_panel_desc tianma_jasmine_panel_desc = {
 	.send_deinit_cmds = lavender_tulip_deinit_cmds,
 };
 
+static const struct drm_display_mode txd_x00td_mode = {
+	.clock		= (1080 + 122 + 8 + 76) * (2160 + 20 + 4 + 28) * 60 / 1000,
+
+	.hdisplay	= 1080,
+	.hsync_start	= 1080 + 122,
+	.hsync_end	= 1080 + 122 + 8,
+	.htotal		= 1080 + 122 + 8 + 76,
+
+	.vdisplay	= 2160,
+	.vsync_start	= 2160 + 20,
+	.vsync_end	= 2160 + 20 + 4,
+	.vtotal		= 2160 + 20 + 4 + 28,
+
+	.width_mm	= 68,
+	.height_mm	= 136,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct nt36672a_panel_desc txd_x00td_panel_desc = {
+	.display_mode = &txd_x00td_mode,
+
+	.width_mm = 68,
+	.height_mm = 136,
+
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+	.send_init_cmds = txd_x00td_init_cmds,
+	.send_deinit_cmds = txd_x00td_deinit_cmds,
+};
+
 static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 {
 	struct device *dev = &pinfo->link->dev;
@@ -689,6 +969,7 @@ static const struct of_device_id panel_nt36672a_match[] = {
 	{ .compatible = "tianma,tl060fvxs16-00", .data = &tianma_jasmine_panel_desc },
 	{ .compatible = "tianma,tl063fvmc43-02", .data = &tianmaplus_e7t_tulip_panel_desc },
 	{ .compatible = "tianma,tl063fvmca01-00", .data = &tianma_lavender_panel_desc },
+	{ .compatible = "txdkj,txdi600yanpa-43v3", .data = &txd_x00td_panel_desc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, panel_nt36672a_match);

-- 
2.55.0

