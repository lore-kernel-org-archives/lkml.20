Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1C52FE5A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950954; cv=none; b=LzuvMjxNNbPS7tilbOwmO/zV6Fwnk9ifXJvZ1B222nri/6J2cBNqxqgm8pLgr3JkiGE3hcpQ8fhUdb0XobmhqJm0ICwM5vajAhJqsMbeHYUfNi/ZKCJeUVUT4wp3+0bzy2rnz5G/8s1xtSmRabVuE2EwP5zuMF2/3xKehak+FlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950954; c=relaxed/simple;
	bh=lKLLoJOB3QCdcp8M6zQjLq9DEXilfjW0g7Vx6AzYsYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/WCk1k21dL4YwM0K4EBgqXDm0AQUEpqrxfskEaTxrc4ndJcKhilKlLwtq3b8p39VoLl8j7XZY5AFwvu34PQN19ed5/Q0idhGZsVJDuc6IqCPC0qkXNobADL/d3/nbdYLb8PMUztYssoFVuG3LeQpf4/aLTKIF1FCF+KUXpyO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgAUY16i; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgAUY16i"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-853c07a76adso5478067b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950952; x=1789555752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AuhItF3DHuGBcrjd2vsxrXT95gQ2Gc/hDHGyg4+Yc5w=;
        b=EgAUY16iU7PHU+H6Yl0y9baFLpDk5HukogpI2jP/2y+Nm41JoYZhhwDF1NGWpvRCsL
         o+30hKjRsUjNwY/IgJylBvaNyHixLLKzuHQZIZPiLhImp6VxIopJ3Oa4TlDn8qyQaOqW
         UUU3LH3VypW7he/vZ0okbNF+9litV7X1QV6qUZFfJ0WZ4kOzeSx0N/pK5hNIp7/QQkCT
         PDppsJnPdOSjcM/L6C7LhEiM6sAw7DCNEk+D2HWcD+APl4tyYBQ+//gKMmxjQcDXrPzx
         YTrzcYvLdBx8OfsTuyYSX8kbfAwBGxkiJLUKv3HfUML3K3kJE656srPtqNjpFRZ/E6TL
         6V2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950952; x=1789555752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AuhItF3DHuGBcrjd2vsxrXT95gQ2Gc/hDHGyg4+Yc5w=;
        b=G1Ib99KCjnop1emHK8eC/mp0JLLN3/2azQLTl9+XJiOtN54aWUE//qnz6ntAumq42c
         +YXMSSNa9V1pUi/2ba1WkrOjx9pkgcvVMuZHb7IPrd0GuDj+nxDcguNGiAEu+x4DJO1o
         OxKN7eFneJV4f50ZKNEEPwJMVCfKKWfysILEr5w9MWr6C79g1Q87PDLCnHen+PFNvL85
         pn0wGkPL1I5w5UwNbvbb9Jv2RsaGaKR/whhHCQZ6eOZs5dcwYmejqnh3JYCrATT0yVfV
         AEufDU7zvLinVCeY0cLAKdlu4yZKb86Kj+i23APXlogEW3ibbWv7uAnFXnRSgVl49pmn
         dv8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYun0eeB8FpJOZYSq+L8EBCFvC+Lp/OCH39lyIvWpRBXBRLmwHLIkNRHPKb23dY/4TaW2ZBSztxRrif88=@vger.kernel.org
X-Gm-Message-State: AFuF++mQFQB5Xx9T0fTGCRVtyBz+MhSnRbdrb+p95D5hpLsEz6bJzext
	55XO7Ba5g5rgJ6ZsGhZRT/Op9O8ZXT9IgFW2+nOviS3Y/JLzhrCnmIzr
X-Gm-Gg: AYBFou2yKeNfcCcl5BNT2LmSZ6c9Zfaw5zpaMTimTNLsaqU2TtGIyuN8ZXwEzUdz+ut
	WJJadrcHNJpzbcUnmgn+MrW5XTTkh9E6Y8yrqJxc9ZdUNmdY9lStIAOwZN0Y0oaxryOQOrK5v9s
	M0AbPvdeHTDP/sqH+Qb52gF/gvhaD9UD6my9/jnP3i4zex8mG05j1+1Nh+gWJQAlK28d0k0Xfkz
	1wXeGaP9Ri2hX/DCz8kK7/W9DDi/mqTJnOy9Ts4NVRAEuO92H1b+VNrUpTX8plybwmITMzS1NGV
	+3d/7zuULFg7rijQP5jDr/np0fx9j7XxS7gFyLolOtvwBCsVl7YRyLkRsDQXYsL8vdzApWAsqy2
	sdkbDCSznse273RYkhLh6wjt4E53DDrvOa3xQ9ohScaNVQ1ieusSniFVZWSmCE9WGfQp6SdJW3v
	SANOP8MVOD9GondrX/eBbBWDvzM+3DJa7OWj+Vr81EnavMYUZndWMTe/bPRSpY7vK8IwKtzL3NQ
	9Un7PUFWCBn/fyUJXUiPnS8
X-Received: by 2002:a05:6a20:9d93:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3da3a104d63mr51608904637.28.1788950952391;
        Wed, 09 Sep 2026 03:49:12 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm12026723eec.29.2026.09.09.03.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:49:11 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>
Subject: [PATCH 2/6] comedi: ni_atmio16d: validate the IRQ supplied by userspace
Date: Wed,  9 Sep 2026 16:18:43 +0530
Message-ID: <20260909104848.1763-3-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
References: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

comedi boards are configured through the COMEDI_DEVCONFIG ioctl, so
it->options[1] is a number chosen by userspace. ni_atmio16d passes it to
request_irq() without checking it first, which lets an interrupt owned by
another irqdomain -- a PCI device's IO-APIC GSI, for instance -- be
claimed for this board. When the owner of that interrupt is later
released the descriptor is freed while this driver's handler is still
installed on it.

The driver already documents which interrupts the board can assert --
"0 == no irq; or 3,4,5,6,7,9,10,11,12,14,15" -- so use exactly that set
rather than the whole ISA range.

Bound the value before requesting it, as das16m1.c already does. An
out-of-range value is ignored rather than rejected, so the board still
attaches without interrupt support, exactly as it does today when
request_irq() fails.

Fixes: 2323b276308a ("Staging: comedi: add ni_at_atmio16d driver")
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/comedi/drivers/ni_atmio16d.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/ni_atmio16d.c b/drivers/comedi/drivers/ni_atmio16d.c
index 6765cdc276ca..87fed16b112c 100644
--- a/drivers/comedi/drivers/ni_atmio16d.c
+++ b/drivers/comedi/drivers/ni_atmio16d.c
@@ -593,7 +593,9 @@ static int atmio16d_attach(struct comedi_device *dev,
 	/* reset the atmio16d hardware */
 	reset_atmio16d(dev);
 
-	if (it->options[1]) {
+	/* only irqs 3, 4, 5, 6, 7, 9, 10, 11, 12, 14, and 15 are valid */
+	if (it->options[1] >= 3 && it->options[1] <= 15 &&
+	    (1 << it->options[1]) & 0xdef8) {
 		ret = request_irq(it->options[1], atmio16d_interrupt, 0,
 				  dev->board_name, dev);
 		if (ret == 0)
-- 
2.55.0.windows.5

