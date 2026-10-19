Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440422;
	b=ggKBj/R8vi6zHGFd5vwocdxTIL0HOkd9mAc/uzI6Z2edso0Z7LzqqefTbKquNDIhYox8
	 OHjooGMkF8z8baKeeQnGEeRjnY9lLxZKE8o0HVXVEc2mqjrvQKYVc4XAnVhYyImyOAT/q
	 0OsOea+hfGcbZIM8/MZ4SkTr+NKcYGIuZE7IUcMuKe8eC1mVPk/J8A+r71ty31fwQ3PDf
	 EekJ15Rib2tza/bYDgSQ5cs+ucC07FGkzIhcglA106woYgi5taZYNKXXU3gFnPhCP3Uqy
	 iEbfE49Btdu4pv63Kr7qDrK/BVklXQ3ZUvH9gMtKaR6nrKI7lq/difW4uys/JQRSxHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
	b=eZo1OyYaCcK+eWhL8vbmbJwKp3Aj9DkAPYGFPJ8FMlwVkcbP6LMcOzQzkM4O5VGgrFlt
	 SLMsBu5eetYG8yXrsWnD59rO10AqrmSfgY4OZh3LYzQx/NrrlapI9UkfJaegu1HOYcBcM
	 K9RKGDgqxO0cSdyPryYi98dqGgg8GHb4HHVVwTt2inR/Tc6HFvvLEP76G1EQLAdCuyKOi
	 TZxCAYFVlO4uuIrb0Nw6wmzPM9Nl/J/1UsTtiybnXNTNvrj0zb+17ewBE7vhwzLu7JX6F
	 hXfNMrvBRtNIymEpiUjTJZ95hoKda+b3f5ZG7sp7rzeO8qzomr67MBaGM/hLUWpOc6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z0mwdAZT;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A65606A322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A65606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z0mwdAZT
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eac4855401so719329e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440421; x=1793045221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
        b=Z0mwdAZTrhQsrFAWnmaf4+LGT9x+W+BMs8zyNOThm3icLQe29j1vwCnAgVBH7Mex1m
         qhEbE9zybpU8dNzkTLgY6FEQdhAf7T6SV99GuPvFIKAThCMUA/Sk2n2AQZJeUqVY/R8O
         ou1FNzc8jqXtQvheh6k8uBsZ3znXwiWPjX9GuSi4Dq2l/byJfkt23I2AWc3779v7m+Vc
         0crrNiS4Mn+DD3+6x1PebiNwSl6PpxID41wJ2bUtMuq+GUyyQ/h/lzTN4ey8sjwOS5Nd
         6rN5vyPCrj/wngt1DZN8S99qFLMYh5jQH8MLzJSAqx1Iz9KQZcSNHuBynkL5j711TuSk
         Oq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440421; x=1793045221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
        b=f+P6irY9empIy7lDbiQx0RM3ZzsZPayzQCdVzlEyFDvDS1joaiLc50fY/7+ArwWUK5
         KXW3dd6tKDeCr4gFqpLjh+d5nGxdrLOZ9BeSRbueeWg+Gv0wS8XX/J9v3MK349qcN+Iy
         8k4btZAro5IzN1QbRHVUIvEqqrryoAzJKL1GDf9spu/fnM1uSmkRqbgQdU5NYfJI4YvP
         z5bYrRUWQMS/RZ5O8hS0cheXa+gsLNiakc7Hsiyguqi17RI3ZJ2vW4LUXLUYNYyP/4Ip
         K2s6r0yNsSJwBzcsTr5GviGaOHy+hDTRZ08stFKrvqcttAHugF6+ZpWaWf2bCkQppRUP
         sxrg==
X-Forwarded-Encrypted: i=1; AKwUvByOSnltyDQ7Nfxrug6oYboOXKH9vgwx0N0QNLsxaDv3c4udOHyiWzY5YXRwYt/Ad//3Q5E3Y3PKahbS728=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ7b3NSqxG2HRl1Gl5yCrWj8IvK1K0udPmaj8zgf5DqG9duIbL
	4/P8EUle5AH/5VlaPuqb6xZH7g/8tYOlOuqKZZidLmsOcRUDPfJFpqb9
X-Gm-Gg: AYBFou3OygRVosR/HPlnvX//aJNwyF4HxUp0rBMbSPV/l2+ezeQD8xaQLpAkYkAq9Hw
	F7xuDukyZ0iEuawI9acf8ipIj9iayfXn/0Bvx0z/3D74j8En9welCkFNyKmtBW0FBaxTkFv/JhW
	K08FDoGlK4H+JLcnAm6OV2OC+c/Ud/K9j+WBMo9q7KsK61rCvlGLPle77QpD+7AA7hPBLB4rcZv
	9XtXk1+07J1+7Na79vIVN4RDXzi5EirAf7Au76F9dlbJICf2J//nNqtzM+qBr+a7tCMqwU+HQqQ
	BF3LmkRvSCJOs5nOn1xEPr7i9zcm00fIKknWiNrylVnKjmedQjb/pSNvIFKnqOAzHB5dni2hxLp
	XomYRVX+16HnH6RaBdii1JUPkAFB/qpc/zYJt3A+lWPTSeU+qfIDz1dDHoBmYn/SyTJEkiuZcQv
	btvGEZbmtJVys5Heh4HEn4ld7KFXcNs7/Uh/fqNLGGz91brL6z/wyMSUcXWibb6dxRDUl/Bu9LM
	mrRKEsyn7BsltpiL+uklyjLXXC4OQAXaIBsQtkgOmd/tECrl+88v0v28Ye41f4ZXAnKOSYqWtBf
	Oeikw4Y=
X-Received: by 2002:a05:6122:4004:b0:5ea:7126:38a7 with SMTP id 71dfb90a1353d-5eaaa62c43cmr2437882e0c.13.1792440421005;
        Mon, 19 Oct 2026 13:07:01 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:00 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Mon, 19 Oct 2026 17:06:11 -0300
Message-ID: <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

dw8250_setup_port() writes all ones to offset 0xc0 and treats any
nonzero readback as the DLF register. DLF is a bit field starting at
bit 0, so a real one reads back as a contiguous 2^n - 1 mask. On some
Allwinner SoCs offset 0xc0 is the RS485 control register instead
(UART_485_CTL in the A733 User Manual), whose implemented bits are not
contiguous. The probe still takes its readback for a DLF of fls(readback)
bits, and every later divisor change writes the fractional divisor into
the RS485 control register.

Only accept a readback of the form 2^n - 1.

The probe itself is unchanged: it still writes all ones to offset 0xc0
and then restores the old value, so this only changes how the readback
is interpreted.

The A733 reads back 0x19f, and Andre Przywara observed 0x9f on the
A523. Without this check the A733 RS485 control register reads 0xb after
boot; with it, the register stays 0 across 300 termios toggle and
restore cycles.

Suggested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 325793f20256..1b0192efe162 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -225,7 +225,11 @@ void dw8250_setup_port(struct uart_port *p)
 	reg = dw8250_readl_ext(p, DW_UART_DLF);
 	dw8250_writel_ext(p, DW_UART_DLF, old_dlf);
 
-	if (reg) {
+	/*
+	 * DLF is a bit field starting at bit 0, so a real one reads back as
+	 * 2^n - 1. Any other value means this offset is something else.
+	 */
+	if (reg && !(reg & (reg + 1))) {
 		pd->dlf_size = fls(reg);
 		p->get_divisor = dw8250_get_divisor;
 		/* Keep a hook the driver has already installed */
