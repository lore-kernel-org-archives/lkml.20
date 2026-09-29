Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D2751B18E;
	Tue, 29 Sep 2026 12:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683354; cv=none; b=qwoohLctoTdOJm2ydcJek00eZqMqneN2Nx4BIzbX4/FJiIPH30cgn2aN/LHtSIC2td07o1hqvwSENBpHehS2Y80Zl1yHQngR36Rv6s7h4bS5JlOS9h1NE6S0ToelIn5f9nXY6D5khhgPIWiD3N7+cHlWiSfhrv4i+Zqt2bsn4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683354; c=relaxed/simple;
	bh=dbJ6kOcQDEUsIiKOME+MEWx9IHe/yd+Yxmrp4oHY8yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kg8WaY59w9YCCxwDg4S66MN/91GQV1mbZrgnOXT+C3o8NAZz4sP5bzqw6yuYNx9NvyY2jS9q1ZioDGecjP2rjBUtai+mI3segDbIrUDlsl0i7f6A1+jLxS1jjszbRCliOlmorkc96fWwgE4f7ACAS7DWVl21tD4F+goLQyXx1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQ7UXZx3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQ7UXZx3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E194A1F000FF;
	Tue, 29 Sep 2026 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790683352;
	bh=xkHwuGzZKJ+JeadR+nsbk7mtq0lZfTS7Z8HAx9wx9Cc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LQ7UXZx3SWYlXyrDd7R904oUsW+LTh9j2M+El1B42B0HQlOMsjkgO1Yr3mXkTqBlM
	 gw06hPpAzIJeLlh42q9x3v42QEHZhRG3eH0V+KqIajVTX/TNEYARx+tItMW6cEokwM
	 0JJ7mWoV3QsqyDh5YV1xztgNyjdwv4DjbwS+7V+eA/kEvnMqITDZDaBwBHNZ4DHGkq
	 W24OQis7hdXsFoqNG9dbANJSiPDRRRGwfHZ0JjlB0NN88+N5O4PG61WRmLNh/lTJJn
	 BbPkmG3iCdE+TXfIy/7ce9I3RYtDtMwS8sjGRTfd1yl3k1VabAMgzY58oWYRlkoN/T
	 Q9PREiKhdj7BA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 29 Sep 2026 14:02:24 +0200
Subject: [PATCH 1/3] dt-bindings: media: mali-c55: Allow wakeup source
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-mali-c55-irq-supend-resume-v1-1-e3af34afff12@kernel.org>
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
In-Reply-To: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
To: Li Youhong <dayou5941@163.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Nayden Kanchev <nayden.kanchev@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The Mali-C55 interrupt can be wired as a wake source on platforms that
support it. Use the standard wakeup-source property.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index fc4fcd19922a..acd57799ccd0 100644
--- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -20,6 +20,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  wakeup-source: true
+
   clocks:
     items:
       - description: ISP Video Clock

-- 
2.55.0

