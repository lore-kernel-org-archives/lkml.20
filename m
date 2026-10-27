Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119417;
	b=YTH4HeIvvEd1VJ7huKHewHNOJa5cdta3//nBGiSVNrX/uXji65kD20OaCMqjiBHJ/AKi
	 dT4wFqeu1hcJ1/8UXsvM7+LVn7arfUqjFbanpf2faVkWZciUvwy7oprWmKp+7csIztaVh
	 SJr9YsKEYQKnDM8lQrVGQCuJRJzcC8QyEazBA+pVSyO3MLk7c3lf8dhoH4OjHtLaaWMd1
	 4aVcCtXkd30pI5b9ikENnGk4GBt2UWleY/VJMCyP544sgS4XIuJvvunsIrV0z6VsP6hxQ
	 BIXUIClfyJ2+FJ9MCtEPP4TJsBo0UCSVhgHKFf4YB1vqCH6Baok1r3B96bgQ5GuCIlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119417;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=h73lYkny7Sjfwyrg2DL62M5KaLgBgZQ96YE9XST9cA8=;
	b=wPmrkqUbp0OTi3mkK9a/LnUDDq/VdxmsFFfiP/qPXl2hkQXRFtDA1eT8xJmJfJq4xVk5
	 yinVFXcH/cy+Ut7tOgXEkl2+R/V43seNAKkCJZ7S8YJ88K5IC9JKky8RyCmitDHwNrXg0
	 v8qoJK7KNLEr0vwbiL47Q/F22RuiBFIC4fJtdrC+Kp/FeZREgUjzybK+TvQgRnBsKBO0/
	 jQ7TLrYmzrXQiR65Seoy5ysiE5hCPBFoXu7agFbSAI8IMtZioy206iJ6cyQAfMRkBLm6R
	 s2pHpRfA60N7FUR3JI4vRWyqo/xhw8QZwvbOwNL7xOEIda6XQNe/ECMzykmg6OPJJdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fk70c+SL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DDF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=fk70c+SL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1A41F01829;
	Tue, 27 Oct 2026 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793119416;
	bh=h73lYkny7Sjfwyrg2DL62M5KaLgBgZQ96YE9XST9cA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fk70c+SLs+pE8ZdE7NB/RpYz0gsKh1uEGwZ8Z2aGBH6ZAY1fgwpRyGRKNmtxLR5MD
	 9/pMrSaaQl11w1y219XkM4naEAKSp8b+iU7d5iO/Dg84oeKyYbZ8PupYKIIWtkmstV
	 9Po69MQVXZJgZzhwDfBnQxtXV/lTYQqeBrjsCJeg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:43:29 +0100
Subject: [PATCH 2/5] comedi: addi_apci_1500: fix clearing of the gate
 enable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-char-misc-comedi-v1-2-1899771ee15b@linuxfoundation.org>
References: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Frank Mori Hess <fmhess@users.sourceforge.net>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=fJoSA6+IRNKHKFwYIKilvYgVsmLVIeMxnPdp+RtJNPE=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPrmwsFmw0u9HwrGjZZNbrrUIvn66r3OHvmWe0/OVsj
 e6m5avkOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiifwMC5bHhs5Z8WTawz/B
 nxf7HuH/d31Owy2Geco+fXYJ7zctf2e2svUNj/35Q+kX8gA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

INSN_CONFIG_SET_GATE_SRC reads the mode register of the counter/timer,
is meant to clear the External Gate Enable bit, sets it again if the
external gate was asked for, and writes the register back.  The mask lacks
its '~': all the bits but EGE are cleared instead.  So

 - the external gate can be enabled but never be disabled again, and
 - the instruction wipes the mode (continuous or single cycle, external
   output, count and trigger enables, retrigger, duty cycle) which
   INSN_CONFIG_SET_COUNTER_MODE has programmed: the timer silently falls
   back to a single cycle pulse.

With the right mask, the instruction only changes the gate bit.  An
application which sets the gate source after the counter mode now keeps
the mode it has asked for.

Fixes: a8c66b684efa ("staging: comedi: addi_apci_1500: rewrite the subdevice support functions")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/comedi/drivers/addi_apci_1500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/addi_apci_1500.c b/drivers/comedi/drivers/addi_apci_1500.c
index a203e27888e2..3d65aef565b3 100644
--- a/drivers/comedi/drivers/addi_apci_1500.c
+++ b/drivers/comedi/drivers/addi_apci_1500.c
@@ -696,7 +696,7 @@ static int apci1500_timer_insn_config(struct comedi_device *dev,
 			return -EINVAL;
 
 		val = z8536_read(dev, Z8536_CT_MODE_REG(chan));
-		val &= Z8536_CT_MODE_EGE;
+		val &= ~Z8536_CT_MODE_EGE;
 		if (data[1] == 1)
 			val |= Z8536_CT_MODE_EGE;
 		else if (data[1] > 1)

-- 
2.56.0

