Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B163C9ED5;
	Thu, 24 Sep 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251569; cv=pass; b=B8IgU+xxUyNcuFyH/XtMW9eYVsI2XCA5gIm2kncTrSpEHdYAlaWtArpuvA2GFDf/0qL7SWYgSNQUAjDsmnAkep0EucnDzkDxFvR9K5tC8ZLehOUqI4XygO29VN/bQs18ddxAs6QR3y2O8TvcDEYG69PVhlDTgmcGKYYgZUDZkMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251569; c=relaxed/simple;
	bh=jflGn9UAu1atXtnUCOpvKTObJfAaNkB9QIEiBBsQnNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXcIhN0t0S/ygmS+NvJWZecyW8Vjjz7Ln1z5+sempmRnikWa21qwd0zv1v14Ek07AbsRiui93mNVLQPvrJf07alfRKKmnSvcyrQwT2AHgyLvv5CfjqVifA1a9PsggjEN5MvVqkFixS5fYRhQ2/fPkGZWEoB5wyqEPoh1OQezHMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=PVXQDCSD; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="PVXQDCSD"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1CC5C202136;
	Thu, 24 Sep 2026 14:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3UODHRra9NS+sV3IX2ewvjZ5b9Vkt7WDALjDMrncgs=;
	b=PVXQDCSDaY/rj7f38h1W1IyR+wwmdk08VobPyLiZlN+yKe9SklnzXXEsjBOVHfzVq3QQzr
	fZdIXxxp1Vwm8KgT6Nsqv/12qFbyuYT9JbN57hpwOorfSBXy6sHRQ/61LwMmmt24o3sIVe
	KHG5cy7D3WtzBgVuBXuVaQg84CLQa7ckGTMVshSLdJ8ZuNfuTaooS5Yo1ohaeVU9zNQD8F
	AGan96Qzfq41zk19CNlIahSWUYjMfOLMWs4rE4ZbChhzsZpVG42eZcJ3dkvkDFm2mpY4Sb
	Bbs7AmJ75ZdJXcGotH0X48gwEF4uX6AwEGl9gnbjuKT+Wob3kkr2VgSwWetv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790251558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3UODHRra9NS+sV3IX2ewvjZ5b9Vkt7WDALjDMrncgs=;
	b=gwzKRBp2brirg/67YqgiHStxFkNKt3yZn7i2L7Nzz4/lRGyjPXVJ7WshRNzn3E187gkbzb
	f4hvvCz7LOITzefhMUe/oRIblP8RrGoCaP3G4pF0vg3EZV2uPhmfe702AmZu/8ZJvopNBH
	yTiTvmIn/xvdx1EKLjy2aSQHyofzEdQ7nlENAuFDlPH7Sv4+kYmq1Hy72rFoxEslQp91RD
	CKLnlbulBIJBm8GDfgOvlTw3nb70V0KdSgn1L2UjlQQCk1FFJbAXVAKFEUHscTuS7kRurl
	uzr/ssUDC4gYTD4xuEDu3H/l2g9nxUw8cGJOUja14DR614NQmkQsSN7bHGo5Xw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790251558; a=rsa-sha256;
	cv=none;
	b=Dxlrt57ZzcH4Nn4sAyR3XNfcXx6lIF5g0NM0HgsYYSemGcKlqbQaW1XwKdN7E+nk2CvEzc
	Rf6v7T/mjQm29fraawKLYyqx2Kx9mvPni/IfQrR61r7WaxsEMYEQXZ5e0rDaVMSQGW51TE
	jpAc1fo51BVg/EtP9J1BGJhtGQE0btn7s14h3qEbc0b/Ma1bSBunK3s1NiaZGMTjVjeErj
	J/NrRAN7EjOW/HDr+biONuwSZzV2dFmPkvVuyjaDOIysf5lPFPXBDlHBJmzHXahsHXfNOg
	/kh3ETWves6jIZu5BmYHejx23fB8gySzZ1vH+vHTlTcbR3L5dwldxNUaiAdodw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 24 Sep 2026 14:05:57 +0200
Subject: [PATCH v2 3/9] dt-bindings: media: snps,dw-hdmi-rx: add a port for
 a bridge in front
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-hdmirx-media-v2-3-c12f641d8b0f@pengutronix.de>
References: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
In-Reply-To: <20260924-hdmirx-media-v2-0-c12f641d8b0f@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790251557; l=2421;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=jflGn9UAu1atXtnUCOpvKTObJfAaNkB9QIEiBBsQnNo=;
 b=fTFPtfGqylsNGPa/z4Izv2LBSMPs1lrYnTvXXhgVncAstcLIhI3U4RN+qMa5JDjP3cydRSgrm
 NC/0J8TEGivDGJX2MHbu4WxGzjf08rZ6ttopIyGYEL+6pvvAIeBieX1
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Describe the OF graph port connecting the receiver to an HDMI bridge in
front of it. The schema sets additionalProperties: false, so without
this a device tree carrying the endpoint does not validate at all.

hpd-gpios is the +5V line of the HDMI connector, which the source drives
to announce itself. On a board whose HDMI connector belongs to such a
bridge, that line goes to the bridge and there is nothing for the
receiver to sense, so the property cannot be provided. The name is
unfortunate: the hot plug detect line the receiver drives back at the
source is a controller register, not this GPIO. Describe what it
actually carries.

A board has either the connector wired to the receiver or a bridge in
front of it, so require exactly one of hpd-gpios and port.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87d0e06a..896f8ffbb5bf9 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -63,9 +63,21 @@ properties:
     maxItems: 1
 
   hpd-gpios:
-    description: GPIO specifier for HPD.
+    description:
+      The +5V line of the HDMI connector, which the source drives to announce
+      itself. Despite the name this is an input to the receiver; the hot plug
+      detect line the receiver drives back at the source is handled inside the
+      controller. Absent when the connector belongs to a bridge in front of
+      this receiver rather than to the receiver itself.
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Connection to the HDMI source. Present when an HDMI bridge sits in
+      front of this receiver instead of the connector being wired straight
+      to it.
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -88,7 +100,12 @@ required:
   - power-domains
   - resets
   - pinctrl-0
-  - hpd-gpios
+
+oneOf:
+  - required:
+      - hpd-gpios
+  - required:
+      - port
 
 additionalProperties: false
 

-- 
2.47.3

