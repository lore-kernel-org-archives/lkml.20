Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D182C15B0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435229; cv=none; b=R4c+lXYlD+aBKPNkFBxbHN32Hsg7oBrmLbP+wrp+SfTfTo5Tr6lk2POcMxXCEVGEPRKtHUSbUT1QZ8yaxbGmLfjfMApBu0x051RB1cjVmVPKmVixLJZzCf9QrbYuIxKaievxsy0Ir9u6q1MbP7AiJ5dVxCVRZmovfRMyCpB5vOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435229; c=relaxed/simple;
	bh=WGU7/JMb3Apf6nVCL6jDk8mWhlmHbK7srTQ8Ag0GJPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qz4/j/2y2SloyHb+tebkDrwHePOa7wEibpPSJnE3u6MdkfnAjSuL+2pV0xyzNg7s00gTIIhUk3iDhgvQPNZErUlk3b1PcsrzCu4bm2gu68iTg4yEA0E+MVpKl2pVptYxe27RNGsij2ru6rnrVZcmvwNlKz6WFIlWg6RVn7q+Npk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q70+f9D3; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q70+f9D3"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9105d241693so28934186d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435224; x=1790040024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bAgcAeT8h1GjhtSyhK4NU9n9kJiBEpb3mWf8LmEtbk=;
        b=q70+f9D378mv0oplvqwtYnLQOz8q+f+4PZRI8RtM9qSddiKKJ4NtBp57We2lrDKeT6
         uylKOERaUVqc6HXJ1gdW5p4M40gwNIdyVOxpHh1g/8ypWETO5NL07Vis6ln4c7knVlnp
         4JuOlRmTul13brTbmegxC6TgOb/lpnchrjvSE06CZ+zvtO2Q+r1uH9kCOHiIm1+bBx6r
         wBCJVXmg0l9DmPzCCeX724F0A8qk0Dam7HHYAKk+CXTl9Sq5rDco6UT/dXfbhVBAUFBP
         3AEjpgtYp/FBx/4HUty+DRaI8Lvuv4RWvfcYUdliOzzQkZWxua6Yy9Gas0i+GO9eCiav
         AOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435224; x=1790040024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bAgcAeT8h1GjhtSyhK4NU9n9kJiBEpb3mWf8LmEtbk=;
        b=W8qHKtjcPQsRDT+1aOSDf2tk/J/e4Tvnf0Cw6sWrO5JpKpVPnN91ceP5FJDlmsS6Tk
         bT6PxIcHdGdzUZpvgXfun1fY7D0ICPr4PsC1BHUF+d9kE0FborgPBryPPH+UsMIR5BdH
         EDbC8lVBR3QrtYVYGjoV5FrGMos36U87y5Anoal75OF5B81wfqmnyYeEJYsWrC8xZZeQ
         e7W0QSV+9jCXMQ3mtwcCBW33m71eiS2hGm7PtRUb6ytx7da/hCJJuPC3s4u60uEsJF40
         CCxL2h6Kvp4Tv1GVesyqIOUXcTF7lF9SEmRss6eb5Aux+Oe5D0SIPJTtpJusxKVrAFYi
         2X6g==
X-Forwarded-Encrypted: i=1; AKwUvBwA6sJDK259EG7+X87J81Jy0Cm/l6+rffQyR1NkID75mKBV3dh5jNwzXgUt23U75BdeneWUlHsVJw3TtNU=@vger.kernel.org
X-Gm-Message-State: AFuF++lzxMdf5p4d1I9PC5SYzcUFUz/CEzEgB4L4W9lIV23TkqlTNfxa
	X84thg/3P0d38ECMEm3vtc6BYivPpJ7NBNdFAvC+8fUlcTy+X9cJET4=
X-Gm-Gg: AYBFou3xFcpWobxPTxjK0kXT3GXcfw6sywlKcC7ggybq4G4dyPqaUU+A4G1JSxyq9oV
	Za+DnEL+g6XRoUepfAjrZur8mOR9s8rztBHI6rkIJi7HwpPBWlOb0QflqRA9Cjm8+O/0Xa28umS
	vbKWFbroRXlbChfRF0hzAD9DbUolT/nqo+wRJ2rw/XALgwWUJZp2aBSC7RX5TwnHJOT5OnzXa5u
	k4U0cx/AKdac7tnZjYWDwwh1wB74uBUkGhbWdOhAXSIaxkBlGVg5d83q7XDPGr3pphkT6FqJAeu
	25NRP4j8/p9AOz7i7EGFrIGsvREGqmH8ha535qkCF3MrKdm+k+Q4s6FRrfhvKzb7eHwuV1nan61
	OvkdzfnHxkxNqNV9HvkJLlkLBhBRxc2K7Z7a6BK6EI3lH/6bT/9JM+3MGEixElAdhRZxwJT9EPQ
	ZKXNjZ4DJ2bF4j3JVyqffhlq6K0Xequp+o2+XZyFhgC0zrTB5ksDI0svf2Lzlatnl59fx91NvDT
	0FVFBxvkiTE2pXCZZ33VuPrmde2zimgNJT9SUbGkg3vXwMCajYk1PZo2LsegnZU/lSYuxVe6luo
	AaNobVeydloy3Ntd3leFa2dKwW8ZsA8MbbwUHVUblle4QoJyiT2qt9+CLlWHW+ertx4NKNoUl9V
	/qhEGlQ==
X-Received: by 2002:a05:6214:2f0a:b0:910:3453:9011 with SMTP id 6a1803df08f44-9122e66e23bmr95006006d6.35.1789435224176;
        Mon, 14 Sep 2026 18:20:24 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:23 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/4] usb: ohci-s3c2410: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:09 -0400
Message-ID: <20260915012011.61874-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-s3c2410.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -335,6 +335,7 @@
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	s3c2410_stop_hc(dev);
 	usb_put_hcd(hcd);
 }
