Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35725349C0;
	Wed, 23 Sep 2026 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171111; cv=pass; b=C7uqPysJ4SB4onR36QFfmFxoBOGby00MfFS53M+csIf0/pR6qnvxTW3Lccgwk2b+dBE/6gYqClAvogjSdUHvG3RhCqSYENaUq16jzl/mDNCt8L0U/8H2qo4+VMclotzlf/tXfGSf9ChtaLHzhSeHCYT8Tdc1ohIwr51HDNpkD70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171111; c=relaxed/simple;
	bh=xWlfN9+GhrAH5fBlIOLGlxYKkOs7XRP/KRcvv+/TXdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgnU9I72Z6d03w64brWU3V4RXQ/ypKcp1a8sd2mrKYzuZ5vbkTvbp+iAeLbVpRh6ztBSYznzUH2jof84z9YGXJ4+aA19JQzDzlQnvxoSjvYqloj+GvJ+MOLL6ZAKhAyqXorhmUku3CIErMNb0EkORjD8lfVktJAPchVGewSdxNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Mc0PQ002; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Mc0PQ002"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1D970201F09;
	Wed, 23 Sep 2026 15:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSEXIAd3qXxHLdXQzZDZh0D3NtCVTAxo16HvIUyaOuU=;
	b=Mc0PQ002vtU3xjhdWWW6GbU5vg5Ea42q1KvKuZ6DaOMRM6XNX1KY1yz7tXgshXQoOir1r0
	Wd1G/zYvcg8iTMiix/UR0be1BhToBiaQw3GZuoiWTNLGpyeCXntnTGTJ9xRdB1sevWRf+q
	Xni+GdZENqCD6rjUIpIfpvxxtTv+N8Zy0eA48/Tax5OOBUvNVa+wiIvCiY2Reyd0tJYsW/
	Qf7vsARhBcYjd4L/AQ3bhvFFGOHMTTmvCZW1ZF4VBupFrWYih7QsQ3hXn3k7PpCHZxqVHn
	XswAj3bj4nylqQS5QFCQoyQXQiYGGmcsycEpkDg8PlmPrTOwzLOsO2LJV4PkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790171104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSEXIAd3qXxHLdXQzZDZh0D3NtCVTAxo16HvIUyaOuU=;
	b=dnSV5HEaRC70bpXVNUXKDtKuuxg2aFQ8GfL8EigWj2JHn8vaE4QCJmvtU0tThZ25Nt+bEq
	0rcA8g/rkoO2RitaRTyyII4HY0/zccSqZNVcq/A1IwwnLibglanB5RD22m5vdnURO/G58p
	j0YIotKQGr9B7r3Ehav8uuVcVGFeNpRKenTHmppz7SHLgjNq7tFfB6BkHBohxGRgt/Dizn
	yYHjF092/cs2N3W4h8gbTfG5wr3JMERpZtD36sYkPqZyi6q7wQ3mTc12e9Tgrxm0RHqpUK
	iuAk/YoXbqQfdCdQadPnY/KjHsdCINdSaQq0PhNpDvQOES8IP/JXoDkNE3XZcg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790171104; a=rsa-sha256;
	cv=none;
	b=TqiO1kafYOz8E/JaJeFSYia3HZ5dkVfqaMJcUkQKQh3kHyi6HJ5f0xSTbj6KEDgz6upQ2p
	Vdc8npmq5ugClbZmmQcvoGH0hqsu1kdP1EAvQjVrC9CXx0LewFbn23SG5z7ixztCFXwOGg
	5O+5FdBghzJf0j44QPsJndICOACHcNZDkK/Smmn99J+hpFq8OaZp0YSbCPERC82nErl/YN
	ozIwHapB/Vp7KJeVhy3peLZAYAxgzo5u3h1vnfR3RXxoTQI5QCY+9jYcQtRXRJvuLB/jt5
	Ml8PfPMNLsOa02plPOBcT67FZnMJnptsY4f8AVMYPDBgrlXZbVqq8H9UJrnfBA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Sep 2026 15:44:42 +0200
Subject: [PATCH 3/9] dt-bindings: media: snps,dw-hdmi-rx: add the source
 port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hdmirx-media-v1-3-ea3d77d4a5f3@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790171091; l=1367;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=xWlfN9+GhrAH5fBlIOLGlxYKkOs7XRP/KRcvv+/TXdg=;
 b=xh6g3YoiPyFajwKr69TSbaiAxdYaJdAsgY3VWGKF3wUZkI+KBB+isn5xj4CUeetURwCUouYY+
 utTnedKToH6B9zXRppYi1KpYgtGLNfZj1m/X244jeuUUDr4FBLF/BSj
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Describe the OF graph port connecting the receiver to an HDMI bridge in
front of it. Boards that wire the HDMI connector straight to the receiver
leave it out, so it is not required.

The schema sets additionalProperties: false, so without this a device
tree carrying the endpoint does not validate at all.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87d0e06a..7e66dcbdfe2cb 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -66,6 +66,14 @@ properties:
     description: GPIO specifier for HPD.
     maxItems: 1
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Connection to the HDMI source. Present when an HDMI bridge sits in
+      front of this receiver instead of the connector being wired straight
+      to it. The bridge is bound as a v4l2 subdevice and appears in the
+      media graph.
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

-- 
2.47.3

