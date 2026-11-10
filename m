Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294412;
	b=m+mRF1tQLuxcjhNCcUlKdJe7yYOxaKhgG0/8v6qXkIzHfzix50yP5KfiomWOUdSIXQ5s
	 NRJYWzLxJYyFlbMc3g9nnq9w9MbV3tyOTHdKcw3oAM5/hw1RXNQ5nd7MJ/i4GqE6GeMbW
	 MgXKR+ngO67PdqTeXoHNJDBqsb08MRgbXLcbW2r4xoML0NmAJJaRAiAsQ5EpJiiv2DPZW
	 6GDvbu56tT3PWLDGFYl5tQZGr0t0mlvvtHIx81f2IzL93GVeNa2+44uklRihEDuOTjFmo
	 BcQ69RqTCXAK6MM/JEquV9KfSB0LjsB2kokPvRJQD0z9g/Zluc4W6OY7s0ctyasJSow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
	b=Fuogb/kjGuZwxFI+mm/amABxmc6f8ULF0R29eSRknJrF0hRyRB5HQp3S7J0ujbk7Qp57
	 Cf7YAr4CoPwN31IzXBKkkGuzGGezOQZ1flM7FcEgwuQ/CoFvuXkDIsFgB/q3pm+/WAJQ6
	 KGQ6qiYNTvaxF9Aq4p0+Z2Co6w39U21WXTLqYxshPtdQRBcZUYxZZdFc48PDm5xZpRcrP
	 4MoxQOuxrGR0M+iuWuy+33FfslINbSYHH90UlbVU0na+uNarIbNaeYm0fNFZLGNvYN+Xf
	 Iv9blXNRKoVnmN9raTrloSnrWZHK0hiAfeWS1RyLXvTXDDczYlCPyOs9fGhwSPFPRyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKJ7rUAW;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0702B60A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0702B60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BKJ7rUAW
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso849849a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294411; x=1794899211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=BKJ7rUAWks0DI97ftAUkRPKWbNCmemr7ZVhL0nOul9OsmRcVKnn56LRoOaVKRcwpxB
         iOeR3mPcbcm6BejaQPVX3ju2yY2zeXr0dyHKECKckIXB/NdDfCwlAEyOGTEYKOeMR/eh
         U72mfcNDxazqysd+U40sIQEngN+csLpeNFH7LLXnci8Jz0CMxn3bmoD6voVIXYY66UdX
         K6ZT/PugF+gWdrhOx36wjD89zBwqCMMAgOKXDP9oqETsquxRncoQZUurbC8qUisYvZuR
         UyF332X6SUWCmVzaPsQBQZCHmIrrm8RYko+CLEoyTxpeoJJ74dg98kl+W/57na95270n
         ea/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294411; x=1794899211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=tJojRDoYulqiw2oe2Idcdc0aMiDvYuJxBGRk+qRHM79rpI2UjqXNPYURyV/Ae/bhKP
         k2O3FQ2goSDLE2IAZCj50WctR6rwdChkBrj1DoxnJ/rwlria873yNz8WMqFrRFNHgXrq
         IuHCy2p4h2endf9JPeBEo6nfCeEQosFoz0+2uae69SjECZ7EUD6G/xERbwzBzqNebehF
         A0NWN1YAzt3XfsD7Y2Sg0IeDEw3osVcR3U6hSxtuFDxkJ3DkLWRhFSO07+Id/WjMQZgE
         oPDmQlGzM/9VpqFm8iZapzlS+qrwq3j2DAX0Kz8bnUtwyCOHDPGCCY0xbZFsnzm9SmNh
         HG6Q==
X-Forwarded-Encrypted: i=1; AL+hErH+FpbNB6S1VY4sXJBMprnDsQnPZhubglN6kZlv3CQsrJBDjKdJW0EE4A/y0bH/KhkzcFQ83AccOfaOUYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4XoaLD4SYgQVgPOU4wJhv1n65GVl13tNCgwYhqSwvIAX/gk9v
	LH1lnhRKimX+ptm9GgS7Yg4oovr1QOf14pWtHsLAL4Y/Ds+6a8oUVLvR
X-Gm-Gg: AYBFou0uQQ+B1gDLMUyvrux2QGFOQfNxCOcAYozHHDGOge2weYwCfxiebXk/xzLR8xU
	M9EwvSIXPzwDLGQ86GCWWxPqzysz/lBFMKarrCN4/QPOcN55AijDvVYIufoIDrMD1pcJ+iFtIU9
	jkSYgKUqOGlgyKcrQC9RuixDvZgH4xq6b7vrhBT+RcdsG97kO2asX8L/QXBdSGNY65UmjQ4WR82
	17rDKfBZ/dt47N+VqlOo0cFyqQfBHmSGFjAochSBVn6G+k0JBMyPxFH9qrO7iYBJYnNch0k9dNI
	vJG9X4JBy931r8sJYe/MNuDXGFRZjjQ2NUwFKxJmoEwKA14ZtB86GX3dNpAg9gkpBeVxTklnmWm
	F+7hwN1Murp/ebgR6NPbsUjVD2UzrWlog7vzY3ReKpnhd9o4S6DqDoSWeXcnZsArBKeZ8Ed9h3i
	Q1tTW1YVBqALJP0wXreU8E+3+XSRF9gD2xCUdqs66+SZC/qhDQ7DBBHqsTL2VS0975FNu7ptXi9
	EbKdGGpPsKBYeLfM9vcAMeopcaym1huSqUOWkrJfSghZRocmVzRViTTQcgU/gJnwBgfZQZCy3+v
	EOUpVY4No6v2Dsa6W/IwJF47siQxp/xq47XLL89cMO5yPXwu
X-Received: by 2002:a17:90b:3b44:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b166d12825mr1909705a91.40.1794294411341;
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167918e94sm2647121a91.11.2026.11.09.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/4] usb: dwc2: gadget: honor pullup requests in core_connect
Date: Tue, 10 Nov 2026 15:06:22 +0800
Message-ID: <20261110070627.217946-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
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

The connector ID work initializes the peripheral controller and calls
dwc2_hsotg_core_connect() even when no gadget driver has requested a
connection. After a host-to-device role change, this clears SFTDISCON
and lets the host enumerate an unconfigured gadget.

Check enabled in the connection helper. So the device will keep
disconnect until the controller is ready

Fixes: 510ffaa48eac ("usb: dwc2: Initialize the USB core for peripheral mode")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05fff0..5c8e85493289 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3664,7 +3664,8 @@ void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg)
 void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg)
 {
 	/* remove the soft-disconnect and let's go */
-	if (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD))
+	if (hsotg->enabled &&
+	    (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD)))
 		dwc2_clear_bit(hsotg, DCTL, DCTL_SFTDISCON);
 }
 
-- 
2.56.0

