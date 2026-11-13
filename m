Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567905;
	b=K+KwPYHhuNO9iQBF3b0i4OPfnC3+wmO1PbR+/jkt6gGb+83C+GylL/61mLGU8KH8RBE1
	 y7hoVjRUoUtr79NFHD+GqaEJNG1Gm0VInkPvHv4LARZQH6Sp4mrRMQ0mv7/xfE5aLGLnZ
	 V3yR3iKpw47hClqSlXb49H7BmMJ2VRGzNxdniyU7byJmmx0uMXIJjdSTxjtEHaDIiqfIo
	 zzkajiatRtAi1xTmSkKkGXDW4oYcIm1jrs42FZf4poJLO5aZzxgmNYaZ6ir9blF62pm0j
	 pxdaN8VW1bXyLf9oJvVvPYoyIRfsMb9r3HdTfrQMxQD4jM/NDUVYQKoTf6M18LIijAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=;
	b=O8b0jcANePo6HMHdCtI/O+cgStcV+BxaI+rHnawRttL5UtqpM5vyd4NtRts3c3zpNrQT
	 z3OesPhjAAgcCGqbqqMQKtkZyHF/QkRUmW3wkqMYz9PDHQZwcZlI0wKRZvWr7QSJuwbhB
	 GryeP1jTs6UeXfGtUhRHqd+I8vs/weUDVCKkZBePcYLZnAcdamT89wtRzteNcn0czIxk/
	 fudms0JkSfTodDyTMaZBM7QwFrsydW4c6ON+hyXYagX9hf+LiErJbBxVgCpE5jroAkQ6F
	 UhpGPoxWdqwkLWKGvWTSmmV7n+ZXrzqPincARptv/jdKlvnaq24NENTSqKhESWNUNaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yoJksLH7;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B7606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291B7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yoJksLH7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so11403445e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567903; x=1795172703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=;
        b=yoJksLH72T5ruQc9lM2z7lpJklpea7vOdB6SjdBgssV4CRuR5mmYwzAnslnXJxggVE
         eO1zLkISX5gyNaCAFFr+xs4iAgnbAo4Pf0s1HM1Ol1bFozWQKxTgQ15MxQ9CyzMTUAsH
         +j5PWuK4FXbEtLmwreFPOLKewDQrretJrs8fRfDHatnKrfp8s7SGPPYfvOT53W5ABogB
         RF83NQ5NNuGOljgCY61gxaQn9hfzMJJd8qIChgBBU3SFsSidocbM87ELh6BabMF5E9xC
         E00DhZWPGHEDt2kf/1euUlWCA3Zs7+iiGvt7iARNdjpGUZv20de1dJFYpzTgtXfT4Zw5
         BBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567903; x=1795172703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=;
        b=dgg1Cze38Vjkf34JjU8qT/qL4QyUgO2/g/JphQOba+vfY2EUZ5NUQRtft8gn4MM/nb
         mtkRrqa48ZTkH/zzOlL+S5fLz6LHnsMd/1atdaGyBdSyTLp5EJWc+9iLIShm1NvDfHRl
         09FbZD3xR1sUYYmnCp1zeSqArO0YqgaNXqXA+FRUJ66xfc0RDBw1fnA36RKmH8jSD0tQ
         ww64R4IfCGZ+AANL0LIt3DV14tu2y7IfJk9ulfRBuZyE5ljTy707pM69nYP+UkSGhAiW
         /A0ZQLaM5CfumNw506sdvIXPZO6Vf9uTGz6Gi04NnO1qIXQcCJ6noDEMV8pPMkq5WcPP
         05tA==
X-Forwarded-Encrypted: i=1; AL+hErGWUqJQ9KDe6Z2KxhFHvjbDuyRdWwRbNm6cS2Az1t+4vrAFGJQsLZ7XIqFy/n4RBX7V00KgJNWhcsNQCgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yh4GcemM8tiG7sTFZ91TU3LIg3S5vukgDM6fyHt1MbFjN+5y2
	Djd6JRHo0jKiApz0XKqsfXPOIvFoWIPdBCwCqnbe48FABqKo/5/RE4JA
X-Gm-Gg: AYBFou2YUjJ5KNs47qDNZhN5gukVwkyJYVNjE59bHBFPfrXv4oJEYtEGrN3KhO2gnk6
	/+xrQ17I+sM6yBQx1jJmXZhMDv9dDVw1r19hAsy/kO9nI4Hjb2CgMxwjfsT31JEEPu5voXMtQEx
	7ShWonEVUf6txOt/HnFl491v5DCs+uZXpMty+Hj626ufNnXYJSeRl/MmYmmnc3gfUgZ2qHF3ROt
	rqOsRKdA93IlWsr2kbkMG9a5VoZ64EsSI2/36fl2gRbdyJZ/d3Cn8vm2CtspbRMLezBssKD/avd
	vJB0eoR7TGO4w1VNel2shwaZ8NxXcmrU9YKPPWfUdUUwWkdPwbGkMVtPsI9VqftQQyyXgzVL/mA
	JN8isxBUX30CCE+twQR5HLlAnKWH/X5VO4lx2PnjW5zKNNfpbLxYfT5z60iJ6w8unJWNddCtfAt
	KZ5odgjgciwTXHw30BrWkevNAQc4e8SKXVPMbhcEE6CfYBX5J9LYJ9qt4AhfJhRXPbEGxwn3m7A
	Rul61/Xk8FA/kZLnWDAV9b4Aw1kAoPCpHB7jR+lzRSdOuXS+iR2NhuPeXTJ+3Za/OMwGQNbKPTh
	E/Vquvl3tbVl+o89mu1dOr9XQFAv22RDzJU=
X-Received: by 2002:a05:600c:c4a3:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb55a02932mr43197405e9.1.1794567903271;
        Fri, 13 Nov 2026 03:05:03 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55afb6absm57515955e9.15.2026.11.13.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:02 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx: test the block read flag of the message that is read
Date: Fri, 13 Nov 2026 12:05:01 +0100
Message-ID: <20261113110501.1142036-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

i2c_imx_xfer_common() decides between the DMA and the interrupt driven
read with I2C_M_RECV_LEN of the first message of the transfer instead of
the message at hand. A block read of DMA_THRESHOLD bytes or more that
follows another message is therefore done with DMA, which reads the
initial length and does not look at the count byte.

Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
Reported by the Sashiko review of another i2c-imx patch:
https://sashiko.dev/#/bug/linux-f62df5ed-ad96-43f2-872a-ae2c0100b73f

Tested on a Colibri VF50 (i2c0 with DMA) with a v6.12.117 kernel that
carries the i2c-imx changes of v6.13 and later as backports; on this
base compile tested only. An I2C_RDWR transfer of a one byte write
followed by a read with I2C_M_RECV_LEN and an initial length of 16:
without the patch 16 bytes are read and the count byte is taken as data,
with it the count byte is evaluated (here -EPROTO, the device answers
with 0x25).

The line is from v6.13, the patch applies to 6.18.y and 7.3.y.

 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..9abe0a26c877 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1713,7 +1713,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			msgs[i].flags & I2C_M_DMA_SAFE &&
 			!(msgs[i].flags & I2C_M_NOSTART);
 		if (msgs[i].flags & I2C_M_RD) {
-			int block_data = msgs->flags & I2C_M_RECV_LEN;
+			int block_data = msgs[i].flags & I2C_M_RECV_LEN;
 
 			if (atomic)
 				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

