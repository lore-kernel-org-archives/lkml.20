Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376614;
	b=FyJEY/rTit94pXovtIGxjD/kp5AnGYWnwHweBn7oRkBzO5SUpmYlapmp3e+2i8gBtJMb
	 mP4CBp7MVFddMUImsDRb3JrzSRMZTkecwtJE0kKQEbZKHYzjCSsxEmwUIlf7VpS+pxuS+
	 dhah7/SNPrRN7Z6V56y5smv0U2fs1YJykbzodvAxg74/Y7njiyYuinxRy7X8pdD73IZUN
	 qOdPgTasARCyqOmFVy7piR8CWUDz2s9meQPzMiSc8uVTFWzq7fEWI95FA7QBAAw8DTo23
	 vaxTGDDvXQXPMKSH6vB0oomGVdUAWnorOysM5PJsXn3L707y9N7kwOGGs+lKkNxN0UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
	b=nAfcgH48MoUtq3zbZ2q64ueaxnskEpgEXHM1NhWLq4C21xU0oG/rdx78LtbcxUgenFkT
	 TkUk3lDzNxq5Ulb3QjXjR6eid0Zc+VYU2J5s530fvXXbrloANy0MgY7WQE2zUZ2yAbqRS
	 GouUaMjdMMFAz9Pn0PrFUZS9z/oDbKg4nQLYK8NV8xNKyYPo6VgpwluK2c8+a9dyyUSBq
	 ihthDnPG9TEp1BoecuhaVuFGqpNN45FLLhceTNvM5jYRBWHlQRFdZW6MBmcJ/pZ55cr4L
	 YdSbrN/mGgOsZN1aeIAZnoVJQOGsArMVFCKPlR5wewl0KXMu+Rlkk18KMgR1FUfk/lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vRjqI5/h";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E7606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558E7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRjqI5/h
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1423226b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376613; x=1794981413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=vRjqI5/hclABu2QBc8ugqYu29kWFKF471I54hASrrOmzpvUosM6GGhNNOXKwSf2Rny
         otPaF1vhAv9F+Gqd4sQ7S89YwToXCBeTAZMyk7BQmytpZTRmeOSWnbcbzrwG8URDFd9V
         i0UrPQfxnDQkd0p+x8T2aUS2qMrN/StcvQbd/J3u86cftty1Zi0lSXlqD3cwdjt0bUgu
         KTuprj0iNZlK1UDK153M2wgq55pqMLP7n7agORZIDonftNX3d6AXXOVeudTlwtgAYMLU
         +lOuSsxD8CX/bLnhQAM5vrxT26CX5AGUUaO9sVdE1OxuTIXqEVYqS7C0u1VXNoSMm750
         2pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376613; x=1794981413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=fOTepaoZyutgUYHLVMPqMcG/W4BTyY939a3Mxwk95v1e78XXEl5o0lX0Sq54BfsfuS
         CxAdaUr/snUbYm16FCjLDmiQQmo/I1qEb+yb+Zud2kzi7LTQYqv9bs00T6BuQTzi0ZBK
         gt9DWAJPfdDhiXJ8E63ppT05aDojZMZM0NMGfmyExYdUoGDJRPjumqE016i3/N650F35
         P1rRo6cxnIG6C+DEz+0wnmukdacGexspV2Iig1dqBTmzjqoxoouyQElSjQPO9fczXVNa
         ib8aggMtY1zuKQhySS9G2fBjaiQEKyWzZTrJKZWv+LFYkSFvjhZjl8Oq+vECjt5KI0QV
         sbRg==
X-Forwarded-Encrypted: i=1; AL+hErEwMpmqKlq/InFlvdsbCn55/z/tElI4uCPdQVvHWQAPbEMedgx3ylvGpQYJ55T9sQSUfe9Jz9py7vHsc0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dl6Wn71htwgSpdp6iMvfvpu2WRhBdpDLBBDoEqC0Br+DzMnzh
	T6aeL/m37YyROQvqKm2kBujrWdpTmcjdfX7TfV8U0eXPFqTxu3jtzGGI
X-Gm-Gg: AYBFou0JJhsV3GrqtwQdC5KF4Fi7J5DXv4bYZkzJIaPrgsnqwd0X+m5XQNV+mX2OBjI
	/Z+pu7fVxxamxmcE4B+mtFKVIG2UjHAWzrw+Lk0zbDIWvMOJ3yXyXYYvEYjKBW4smfUCF+wEwbX
	x7pYbEh+aGJpeeS2OH1cNZki82HGXlb6vCYZPlq4S4eiwBqHgBuaTGCZtt9InpAh7+uiEnCc0xQ
	jb1O89HL/Q0IPWlX/p14MSzMaii0a/PGMvfOgRF18QkoqOLhlCjXLZOsHggBb+Uy2NaVaiyyUL0
	O152mRPZvHjxFaVSnhjmGKRct7IJ43A3NgspRMUOa1Qigdm5AWE4uSOKIfGPKBisM7KUR+GvkJ2
	45RtnBv7KCkDbsrRo0HJ8y2Fn+C9ZxyXZGE5WJeboE988Dq2otoIKNZNo0/q8T1w0/ho/gTBDTA
	zc3SAkCaDIzKPCuMsmisGprq9vmWfjF7fL07dY0Ar0IyblepDLGJWLnBADON0khezR+YORjzEhp
	zIEPGkSD1YiNSOIdVkAmdru37M3hKyJnTrWkkKxQgUfHki9bgHNiu4JO68tdXlnxzi4mueSQuCy
	R3s2ERRQEGEDkh5++fFyHhqGvLw=
X-Received: by 2002:a05:6a21:648a:b0:3e2:1656:b7c7 with SMTP id adf61e73a8af0-3f2fe3d46dbmr1571001637.58.1794376612581;
        Tue, 10 Nov 2026 21:56:52 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d695905sm1393894a12.11.2026.11.10.21.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 21:56:51 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] usb: dwc2: gadget: honor pullup requests in core_connect
Date: Wed, 11 Nov 2026 13:56:16 +0800
Message-ID: <20261111055628.183891-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111055628.183891-1-inochiama@gmail.com>
References: <20261111055628.183891-1-inochiama@gmail.com>
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

