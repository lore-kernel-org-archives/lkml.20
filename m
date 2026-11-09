Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200561;
	b=b0eJmMyzY09DOCrcAy9Xd8l95//JohSrkcjFWY8ycDZuOfD68swXFX8p5S7VId4noJKS
	 uwFjRRfrCpEkNrf4jg+Q97FyilI4F7uNPPjw4dkcvCU5nOWerHUQjl39nVwuSXemqJXrj
	 46alTtSoQMSmmYLA3Y09yOh3+6Db020+pGlhrLpWJcbWnF0Gp3lsSD1ozWcr6sW6QHuQx
	 UZRsm99nVYHjv0ZrOmYNxamxNkYWCXQyfDfiURajZ0cej4yqb3Iy/d6qwk8yQAN60ZlWD
	 09mD7AGTLIphjEX9dK1tuAd2UcMS7+vEyw6Oy/i3ziGcX1ms6pFQaNujcT54JJ6bTpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yodLZKxnYV5I2eY1U3dtFzN1Z8iibbm+KfUX4glKyUM=;
	b=RFyUbispDI7gisUn60QR/oviWTMEd5vQinv++i0o2OZ02K4swklPnT5CkO8IPXJk/liP
	 eRJBSHsyTZBrLWlsjpUSWkqbctrBubj5bP5NVKLVmdZ6rYdU6y73rQrdyWKW1Z70hK2U7
	 tiNVKyuwHs0gxU4QfY8hsiddtC1SFrSExhTzFjWChIWdmQaL9sZdBQioIqB7rr3t9cpnG
	 beD7UzN2Y/CofxtrYWqiCtzPH7wJgFEWt5rMgr9rYoFy9yvoVu3VJqqQUwc7FP4dVaB+A
	 k8QzmgCCxUPkuTkAT6x3Jn3p/IM+sCbuywlMUMEYiZyyiZMZQYMh0Nbg+pc8nlaMLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeFl0mo+;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ED7606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9ED7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeFl0mo+
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-5641f26ce05so158264b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200559; x=1794805359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yodLZKxnYV5I2eY1U3dtFzN1Z8iibbm+KfUX4glKyUM=;
        b=NeFl0mo+kN5LveCEELqE8KYxpHl+jkjeyMtjDNMZKSqtMpdKxX3L0Blep+eF2G3OhO
         DdyaeUGbL1F16FxE9mjuvQlOO5wqBLl9UGKSja35X7oYAynGfWg1greYRpthzM0WidBT
         u3Q8R1iY4H7YKRTd//TbsHZW7VBGLzRYJG1DeksEzcRzEYeSDejBFFRbVoNmDWq3MY28
         piGNKzHc6Q4O//fv+5iQueeC48bpdjGT8f+hLvf4WRKS3CrgYXDN4UK5kPzxIWm8+I0D
         MOqKjeaoMckZcQeJ3l7Ltxr3W9csyk5YlhXjPwAG7HIrqns6jnEqDRFQNT3DOxyByZUw
         a0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200559; x=1794805359;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yodLZKxnYV5I2eY1U3dtFzN1Z8iibbm+KfUX4glKyUM=;
        b=1F/NT2uizmT02aCRukGhWNqSTLHRjW4kafolmu8/yicSTlKK6oSvVJkb0b0rxz5X2t
         w7l4feE8Ez3TyR/lO1GE0w6tpQhL/0wh8xXDsS4LELxyfU3g2j6tcjYuV1bRtHVMz2U0
         1QsoPTCMA9epvvX0dP31pIAbH9jeo2mAsmMaaBrFjiTaQilHEnXiJ05fNIvVH6F/Y3lF
         4cDtN0SMScK1tSUQ4CLN7ZDClOEHIq6NnMaiEDpUgkpcDpTCRvL5egRAUMvA5sjLExTn
         xfM1+nW7vrp/hmTxl0l0N8TmNTqFGens40DsC8jrpAHirc1IPdb4WonnV7x5sogOaHSz
         GrvQ==
X-Forwarded-Encrypted: i=1; AL+hErHo2NS5ZGJCxXLPf1yZh+cCAxTPaxqRk8n5eBV8mejPj7RDTyWp0rkP48smCBXLxS2WDJ01ON3Rr2+MSDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oL9GmARPvf6rwk9iBvgkknIyQD07qez1/psaYVm8Ych2QxIR3
	s28Ep+bGdCV8jqb6Togyju9krBlrcEH2+H8MHcZQ7Z4OoLwtgOACYCOf
X-Gm-Gg: AYBFou2SP00JgZd/JxZjUkyCc9X2QScGmom1Bnuo6KBQZkEWAunPjGNWKbEFGkQ7Ls2
	MtlAIcj/4HCfGu7qlTPhz77hYoGiyihu+bcs60a1aiJfHvfMjLOp9MQ9FN/ngfSwOXBBl9xUCve
	/88nDVA8KCZ+WWbuAJGcoe83hZcB1917DcDws5XxJj78CYhIRd6Z0MjGnxEWAM8P+UoqMFwL/Tc
	QLrmyTIr4ISgj+an08WSAlI9O/e6gwR+4GSViRXJmyNErafeoGMJblBDZSxvmriDULkUkiwKEcL
	FJNREipYef3h4Exo8PI/n+pdXH0tR7qVWPHFgo/AdwInoqYSnhEj87illSbgAjboIddy4Gj7nsR
	c14nI9ddhTO32Z9svltLwN8Q2SJXpOCCm2azbRg3+Pvqc+EkhrzdoHYtuUZsMYKNRv7cqgFrbW7
	h/Wyjz51RXJeubAiZITxup4Mqccu3PyX9aDE0X1l8GobF5u3obhFAgXfEvGBKItayobvYOItGt1
	DDWHAZJGUJhtcf8fZx0WfBpEWRS/HW6qYucmya5xBbtzphB8D+XmPvF8t1e7+hm2lcI8uXbTvta
	pSkRiRfPq/RmDuJbkYW+kd7IXeUxj0FOYGDaNE7Ki4qxMIoJUnI9OKiK5ShipWJdH00mOE7ifn5
	tCP373/0APyq6BrnYFksdyLz4g3/wVaAzRu5/QmQ3SaVf52Al1R9CavCyhbkxu1oDpPYBVlF2Mb
	JGHUCdPAZpTi2N/qG9BOTcjDefAGNLRZblAcZemcdNzT95YGzCODZpdE40vtPAqVgM2f0AnaoYT
	w==
X-Received: by 2002:a05:6808:1686:b0:53a:88c6:96c8 with SMTP id 5614622812f47-568144504a9mr1814998b6e.55.1794200559552;
        Sun, 08 Nov 2026 21:02:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3570841b6e.1.2026.11.08.21.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:02:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Sun, 08 Nov 2026 22:02:35 -0700
Message-Id: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wqDMBBEf0Xy3KXGQqz9leJDLqtuwRiy0Qriv
 zepj2eYOXMIxkjI4lUdIuJGTIvPIG+VsJP2IwK5zKKpGyVl/QRezUwJ3Bf0TuBmDZyWAEGvjLB
 JsN1jkNiqVqpOZEuIOND+f3j3F2fFB20q2tIwOi9N1N5OJcpK9CN5vF+78/wBHmDM+aUAAAA=
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Use the layout-aware channel enable check during termination and retain
transfer resources when the channel does not stop. Keep suspension status
available until the polling pause path observes it, including when an
acknowledgment arrives after the polling timeout or another channel
interrupts concurrently.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: preserve suspension status until pause observes it

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 34 ++++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

