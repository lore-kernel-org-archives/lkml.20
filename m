Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EBC3F7A83;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=Dovf8KLh6SIa7//MzE1vORxLlIexgVRLIg3jyS0Yg90vEkxMWn19340f26zseTtufxts0r8jj0VSx3K/7uXS3O+g+pwRB18AIsgI3pEr0m6k3P/7YwoXK8F6J5vmevaAJOThiECGtMwmbUZxsMnDDaDu5wyisLfpITP1GHumxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=MZ4SNiX5An1I4HMBFwNw0tj0D04S9cwxlqjl0QXD8x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+z6APdrg7uJz19DirsMTI1xRHfefC0C4cfKUyyj+jGBgZzUVQ2OL/O6kMxx9MxM6smOV6TlMwc0rBvFhjsbYoknEw9PNTuV2UHwAEaHRhSp6rWs73XkbOKp4AC09aj243pXxiU/iIIuGPcEHkV/gRTFO504sroGlohRthcAKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gELObn/X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gELObn/X"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBBD9C4AF14;
	Wed, 30 Sep 2026 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750569;
	bh=MZ4SNiX5An1I4HMBFwNw0tj0D04S9cwxlqjl0QXD8x0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gELObn/XKO5sofiDawndYV+Vp/Jn3pjBD1F/s96gJMHl87Y8UVaPCct11By1Sthb8
	 AORJFAErbeQiZ+Uc5YzL3X1GK2Vkf1y71wbTZjrYgyxO2SeM4Yfiijaj6irKCXZEz3
	 u5XtJD20/wgg+NuNxn+g+xEv2foeDZr2Rnpd3KiCd5g8i9OiYaGY001NfW1bhj9X36
	 VuTG1mX5xbr2qO13BvVHffAlT/gojNL08PzywxZwCTKILsr0AE7w6j9eny7+/1Cv+Y
	 Woe1tuQ80IR3vHr+DSOyr//+KLx8KoSAezIod+mYmhg/RO8HMoK2LmgdX/vyHxujtT
	 Pd5J91q2n3eyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C702FCA5FB5;
	Wed, 30 Sep 2026 06:42:49 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:19 +0800
Subject: [PATCH v2 01/21] dt-bindings: media: ite,it6625: document the
 default CSI-2 bus type
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-1-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1595;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=2GNSGI/SvJJnKRdKfmcthbKtRJOxkaKnD5LBk104cW0=;
 b=gmcEUkr92KQXRx+94bsEWoxMUYXEWR8pqxzO3eQKln5bydnrweTsoFcTTwt9Rl3UGxhliH6aG
 NrcDnbc3g8ZDQHFtKFDjZ/TZTK3n8Z4CiCT8qluKy2rJQVpS6SWO1X7
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

bus-type is optional under port@0 and port@1's endpoint for ite,it6625
(the allOf/if/then clause only requires it for ite,it6626, which
supports both C-PHY and D-PHY and needs disambiguation). With bus-type
omitted, the actual runtime default is D-PHY:
v4l2_fwnode_endpoint_parse_csi2_bus() falls back to
V4L2_MBUS_CSI2_DPHY whenever data-lanes is present, which this binding
already requires. Document that default explicitly instead of leaving
it unstated.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
index 756fe655f534f85b23b7741d06710c956f9694d8..9b621f726249189255692da02049ebcbf1d5b43c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
@@ -65,6 +65,7 @@ properties:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
             required:
               - data-lanes
@@ -88,6 +89,7 @@ properties:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
             required:
               - data-lanes

-- 
2.34.1


