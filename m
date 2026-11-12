Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466586;
	b=SArYFc81ppNVRXWzgoY6jnE+nKXWjp+09YukggN3/KeTAT5j5A4sBUMS0FY+PT5PWOaX
	 4DvENSrJvyiamHbaZMNXuE6SDTt7V3Kv4UsA0BBWaOO/ztRgLQ1EB/RYIpO1VgOYlrbyz
	 53WNApuEHnX9aUDXTi/ZRuU+vXq1hgqlWNlK5jHeGX0dQwOVgnyyPfKYMfMDe5qUfZXZH
	 XJtkpSjl9RRjEebpIQ5TyRy6Kr9UG8YfkK0oVrHsMIOpEe58xx+QcilBXIuzE/0JYnJYD
	 Z4JDRji9Eg8ccc68PYZzPHNUoko8LhcKq/KLfQb1iFtuqC2q92hm3QkqYjzGdt/PiKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
	b=Wp+L+z5NSYj9xxfxKNlyyMP2w46vwSZsSmXKtUr0jK4LfBgOVuelSG5N02AeWrLRr3ac
	 JFnwbNYVviDgU32VSfBmqtj1LHCWfsvuTUEUh53Hf7rQeIGcUm7umB5gxr7bZ+cNMi4Hy
	 zElYm45s1eip4oqDz3pB1se1Eu36nF6ScHAO+MActM6JqoRHe+KUW7NKYrIK6lHZggVqR
	 gVtBzBZOL92/PO85CyzIWB5s5Nz5BQb4ar3H+mXq8/KgtPClSmdhS8AyU67uekHf+S2Nd
	 lB6sdMRH5iOcMvnEoHeR2f6zKnIPTld8WpEP68nLo2T2W3tF0bDalAxygeIj/dUaKRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z/TJ3Xhf";
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B46460A2610
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B46460A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z/TJ3Xhf
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5351d76e1baso6223231cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466585; x=1795071385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
        b=z/TJ3XhfSGoUPqhZUqv/zZmJ9HOGxzJ00XDyo9zsrUC4geZxxRviNE1Gku/8HoBFlu
         5srUqj87jFT+sAfQ76XHxWgzOMQNmmWzG39wodzkCZPLwPE40EgYuIwHvRsrp8HheZPf
         DdxXzAyjs8Tu200PkN/XLnzdYqgaUHMA6TPzQAiLrW2s7ITyDnu3+NubVY4PAV/KBWEM
         Xas2jOtk6DrhPj2Hh5PUN1pa2FoAeEHaTjSREcFqcX7PuvINg+b0ni1KBeMeuLTjCEdE
         0VmlletuSyAAiecrQWVDCD7ib4zQsK8DYTdP19WgRgCvg2VKi5J79FtmMxHxsLydvoXc
         o13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466585; x=1795071385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
        b=qSMHtE14K+XFxecwTCbHq3mCxUl8TQChHpPYgpf5f1cqa5JRelzdWXVIZGnTwdbP6U
         Xhw9ILnsWZfx/rc2cLdVD5HLpS/fbKeAqUU0QAIH/yXbaIaoCkRRNFn59oNSwA6yOa9q
         F/WP4es1cWPbov6at53joRLkqm80J5Ro5ynJ5B4UnuaTLShLG9PLdhwHxCTt2Gqr4TVb
         2OarKYppGNRGd2HyHQsxgO34lqlmAy3eGiEIk/eGvI+BJqnTMXzGTEzUZQD4HJDMLYCO
         xFZ/DF+voVPi4Kftep6o2P6//ourPwFCsP22BuHw+C1C5g3ATdeWSa+nS3/esvMhGQja
         NicQ==
X-Forwarded-Encrypted: i=1; AL+hErEJ4WZFjWVxQeTG5KUBTsodasuX4czBluN9QUfrzLWTs2rQkfX+DrHPzeAUKorZseEEZ8h8EM2PKq6pFoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ukesvCfd0S4K5YJMnEBN8iCMsvcI1E4hun2lMcqnfOVBg/Gy4
	QpnmBb/9QhAKIQsG4enSY5cQtqjf5W/SlRl7TXwToavY2NQcvc+pympV2Sqr
X-Gm-Gg: AYBFou0QglVNLGo0jmKu3pDXP0BLfEzn3ZdP0I8zdolTThmJuj8/gluqu9PF7pUoyD0
	xt2E9NbT+Uc43NWvlvLiuLt688Z34t9QebOVozRfCPIUjUJYpErRCn9etMX/WV8Eq9GlYHifKqY
	1STtZvvjSL8gB+Pvo1Qq3JN0rCFznHi2zcQwyKmD5dpuL5o1HPvCD0N3YHMA1+jpXqYE/i6uNgz
	R/jeOwej/H0W4I6UuwH98rzNGDUEScwbGkosQ/yV2D3izDmwPkU2pLrr2HCK6prPM1uc2zjlw0N
	OY0jyejlr5cBKzzzDsWxuaBq6dbehqMnvsxZ3I+Xzlzqv0fKq1+y7/ZiURsDHUUhuLxymTGdXif
	PfpVtg9/shxXHjlgkl20dr9rMSg4EU0pbotMgzNSJa/TiW9OqjBacLgA+z2X9f/N0RqrQ10oUtp
	OY14MmkuFXniRjpBtgHXt3uv9YzFjNkJgQdjTZAqSCpjE7J27m1O2tuMqsmauixs97BfOxGZpnj
	L1lVmh+M8+l4KLjhODxnODBP3pFScmhHAqWgmiGLdfFGNFe0Eh07rNJg4K/Thj2d70Dp1Vd4r2C
	clZb1v9Y5wpVHFYrnrJ0ofmbP8bU5ZP8RnlZ7iTGBYUDGKzCHR3/hBZTydHZKb2R8nse3bg57xV
	t06jbMDToRuTd8TT/3hGE1sEqldEdPgQ5KfxPIgHXhDnafKc/9x0BDOtdFb/Hfd0+qx21ehGDiN
	vfvrCMs4aWqiLDFsaT2T5Vb0qjMO3zUOb2buOLhE8npYZYpBH4yMr3tQ==
X-Received: by 2002:a05:622a:1dc7:b0:54f:7f40:799d with SMTP id d75a77b69052e-55956e5ebd8mr31073631cf.31.1794466585518;
        Wed, 11 Nov 2026 22:56:25 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef054f382sm64827376d6.43.2026.11.11.22.56.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:24 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: sunxi-cir: Disable the interrupt before stopping the hardware
Date: Thu, 12 Nov 2026 01:56:23 -0500
Message-ID: <20261112065623.34296-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

The devm-managed IRQ remains registered after sunxi_ir_hw_exit() stops
the hardware and rc_free_device() frees the rc device. A running handler
can therefore access the FIFO with clocks gated or pass a freed rc
device to the raw event code.

Call disable_irq() after rc_unregister_device() and before
sunxi_ir_hw_exit() to wait for the handler before stopping the hardware
and freeing the rc device.

For backports to kernels where rc_unregister_device() frees the rc
device, disable the IRQ before unregistering it.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260729153104.3F6641F00AC4@smtp.kernel.org/
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/media/rc/sunxi-cir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index e97bd9e03c1f..9d22ad7aa94b 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,6 +374,7 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
+	disable_irq(ir->irq);
 	sunxi_ir_hw_exit(&pdev->dev);
 	rc_free_device(ir->rc);
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

