Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01C73DAADE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326723; cv=none; b=W7+7YhzSxWZUtsUu0VkNtrk+3l/30/dIEvTadB/J25Y6zpTLE/nWPzomhoUdvAoIaYbmsHHTTOvqlu1KC2gObwQHGp0g+U3MLHuNlyaDn3pbqoVbNygENjX/uTnQYfS+07tUWga3jRadxKyzTF9uaeUxsD3fkFbcxQRLNaT24EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326723; c=relaxed/simple;
	bh=PKJTlDVAjSSCiZ4sse/d9hXP8acgrgKHHDNHT4z8ufs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QaIU2bVNFOq8mBLSRV6BHDHuH/Lg66YZFQ8+nNSMw/N0V4GdZtB1lGn1lYEwrsREJkxImTrFlh0mUMLStGLXOM2WDGxP8HxP5RIz4gsJ32wrp/eWVI3CJluTGiDD4776rZ7aWO+9NkKZj9GN3kem4ieuejcd/SagEjqtbI/6+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b=jxV3Qg65; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b="jxV3Qg65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1792326692; x=1792931492; i=jan.claussen10@web.de;
	bh=BF/1P4AvrIIFA9XMFtkI38tLivXVyi3Hsju2semGjjo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jxV3Qg65ZSnXfEK11Ye7R8JWpXtc5k/6lNBmYrlmM5iQ6QxCjQ13jOlePhl0P1US
	 6dkP3P5TIXeNNb8LLdtqcc85ZheWlSIRQQpVV5zWe4wwV7cEDpNP6YgWVMbxX3Zby
	 Z/enpniv1f8wbpVEOs2aqTUKaGkXuLRnEsASeEJxLC9vFDqYoaumsMm4t7a+5EEvi
	 DJGF5g+EKtJqMvoY30E0VTz0QMV8r4CBi56/9pQA4LGOFg47ZAsfJGN52C2h9NmZ5
	 jVqk+H027m5Nn9UwQunMMxapnHpsT3eetM7O2K+JOHrzwBVFkVlPkwXCaryObMhpy
	 C2mhVn203TW1PoxZWg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mi53D-1wewZJ25Mv-00e0zh; Sun, 18
 Oct 2026 14:31:32 +0200
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] drm/connector: hdmi: Create the colorspace property
Date: Sun, 18 Oct 2026 14:30:13 +0200
Message-ID: <20261018123037.19560-4-jan.claussen10@web.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018123037.19560-1-jan.claussen10@web.de>
References: <20261018123037.19560-1-jan.claussen10@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OSU8NkmAUtGI+fmib6WS+aUVgukFrOY/L1r/UitymWnaSKcBy/n
 AJp6MaEfaoXCI0t/GpDwJ4NZDviQyKx0xIsz+594/GHw/gxlxaIAp4gbjB1UxaBzBx9Wdeq
 706PAyFiHgApNCfnFwtKf8wtKaRwcJPz4RivgxtTgh0t09Vj0rH97DJkmjQXFKTgL0wXTFE
 pgxF3FAT5FurTRvn1/29A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8HVHhyIhOkk=;2wwh0hljaAVUT03AGRVKxLPwvTF
 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
 DLSTBKSkY3WFi4kDWPDOCKhGltn0k=

HDMI connectors initialised through drmm_connector_hdmi_init() do not
expose the colorspace property, so userspace cannot signal colorimetry
such as BT.2020 for HDR output. KWin, for instance, does not offer HDR
without it.

Add a supported_colorspaces bitmask to struct drm_connector_hdmi_funcs.
If a driver sets it, create and attach the colorspace property with
the colorspaces it lists, next to the other HDMI properties.

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 drivers/gpu/drm/drm_connector.c | 9 +++++++++
 include/drm/drm_connector.h     | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connect=
or.c
index 66f53e155342..eea27bb6557c 100644
=2D-- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -672,6 +672,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
 	connector->max_bpc =3D hdmi_funcs->max_bpc;
=20
+	if (hdmi_funcs->supported_colorspaces) {
+		ret =3D drm_mode_create_hdmi_colorspace_property(connector,
+							       hdmi_funcs->supported_colorspaces);
+		if (ret)
+			return ret;
+
+		drm_connector_attach_colorspace_property(connector);
+	}
+
 	if (hdmi_funcs->max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
=20
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..9d2d133463ba 100644
=2D-- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1521,6 +1521,13 @@ struct drm_connector_hdmi_funcs {
 	 */
 	unsigned long supported_formats;
=20
+	/**
+	 * @supported_colorspaces:
+	 *
+	 * Bitmask of &enum drm_colorspace listing supported color spaces.
+	 */
+	unsigned long supported_colorspaces;
+
 	/**
 	 * @max_bpc: Maximum bits per char the HDMI connector supports.
 	 */
=2D-=20
2.56.0

