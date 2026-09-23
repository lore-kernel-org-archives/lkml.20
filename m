Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD0F5326CF;
	Wed, 23 Sep 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171124; cv=pass; b=XThhD9jd3zSGisrFC+xhM3e6K97rBvo7K7F6yreV4xCDxEFHxZ0SUNIyOHYbu81bxGM7n7KsfqynsPHwTyvlH+i0M1XZW1dHGOgLxo3DE9gJ3WH69erg2J+p1yBdEl2eMkAAtVE34a42o/MvnPUw+ksUL1PmUIueTx5kF6SAhzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171124; c=relaxed/simple;
	bh=11pf395HFPqFFVE7WIMBOBNHTy0rozSU49939RIVDm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJLZltETvgKpzGW4lvZZkyiMMZOMWXEWwQ1sz3uhtsyLGAeSiCsDiSPke2fWTIGmZWAG5mlz4vFt0u8AVoSkIXgpqOGa8yRuCQ6Qoz/C4UMQWAmPOcdZvXSf4KIFActDVnU9p9azTSLWoS/C7P21EJBt621IIOD3/6V4tYJtvcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=ELoPbdhK; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="ELoPbdhK"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C2FFD201F09;
	Wed, 23 Sep 2026 15:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIQ+kVeTFpwdQFubcs+XfNdlKKJLxXXt43xFDdw4Yyg=;
	b=ELoPbdhKWTaixBZyDG/dVjXNRry/+DcVm+Ap5ALKB97id2ov4tbjcMIZsW6mqrpM9TnIRg
	BkVfrJH0otaH+k+9ozuTfYYi/VAfQ0eJi4lsmPga7hMPabLbWXMmJKZFkQ++DlurQ4NXtv
	cTAw9GPBgqHuQtMrfTiOcYMdfWcB7fyPRXmSGvvg8OddzazC9NvH5lb2YS7KSaIKfwyy1G
	B/SzEIMluvTzItk7s8Q3uS2sGCmAzEGpIkKpP+HKPAtEuNViCxRiQ8Hjn1wCg1oGhLV7Jr
	zaW9fY5X7P14NQjmH8hDRNQjj+l2ivbBY2W96+++82XV8wUMhqpnI9ZnEGbUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIQ+kVeTFpwdQFubcs+XfNdlKKJLxXXt43xFDdw4Yyg=;
	b=aGV9LlbP4Li54hsdiFKHqIv/4KigqSR+V/phX6ilU4hBATu4lbYGGCResznwp66QsZz9WJ
	pwZpuhon9W4SK+6Elur3D9u2mK1myfoTBUdpp2RSlU+8VgyGc2AEoAxdS21uCbaJ7/eBh2
	zi7/KR3ZCRcWGbnbCDOfEQSZRbrFd1YnDBqbewMm3tXQyqi79fcsd7x2GN3HQrXWh8PFKl
	IqfAZaLkrY9lTUpqr//i5ciUibRfaANfZ9Uab4fLVEgzW8RNJ/jXyrwXJ6Bck9wWiwnEIZ
	cUCVX0M91N0AL8reb9T2wag4ZY1qmaOR/1+CTbfe3OddBRCoL8fQf8M3wGBoiA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171116; a=rsa-sha256;
	cv=none;
	b=EyCSBwtQB7CVyyOQRKatfGm/nGPNki0TG6AuzZb20ybkHWP8miX95Yovgres/iBtT2uQZy
	US5TFSnHwh2Fpygq7I/XsNUChoeGgtpfCxRuhU2M3S2LlFV9hhMwoUeAWC6//geb4QBmBf
	H+zjKcgNYkyVlswGat4Hm4SJ9vXncmQXMEI5cjhMN40LNfYI+I+CB6+SceLQmnNbfTCb+U
	TfBexRICyDaYH0G4mdEEmcMz60ph5v5XY7wwBAPwwwx+mFantNoLXS+N0UeC8K47cTdI0S
	n9JwB0NDHxKHVbuyuh3ytDAdpNv0PxvfhR9AEtSYWatXTPuh1BaQ+3167tP6tg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Sep 2026 15:44:45 +0200
Subject: [PATCH 6/9] dt-bindings: media: snps,dw-hdmi-rx: make hpd-gpios
 optional
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hdmirx-media-v1-6-ea3d77d4a5f3@pengutronix.de>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
In-Reply-To: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=1727;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=11pf395HFPqFFVE7WIMBOBNHTy0rozSU49939RIVDm0=;
 b=psY9k97KirQSqUpLK3qIAY6/apFlbVLxPNsiS2wPveZUAZRtf8p9W2iHJXgZbFj0XXTOFGjTk
 TRtce6RdonkAZlQMX+dgCNlngHWTbK0XWNmVnAPN8oUhZLBeO1chHJE
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

hpd-gpios is the +5V line of the HDMI connector, which the source drives
to announce itself. On a board whose HDMI connector belongs to a bridge
placed in front of this receiver, that line goes to the bridge and there
is nothing for the receiver to sense, so the property cannot be
provided.

Drop it from the required list and describe what it actually carries.
The name is unfortunate: the hot plug detect line the receiver drives
back at the source is a controller register, not this GPIO.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index 7e66dcbdfe2cb..9c6c377417c0b 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -63,7 +63,12 @@ properties:
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
 
   port:
@@ -96,7 +101,6 @@ required:
   - power-domains
   - resets
   - pinctrl-0
-  - hpd-gpios
 
 additionalProperties: false
 

-- 
2.47.3

