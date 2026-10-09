Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6DA345EB4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547928; cv=none; b=Yb2rqtUppPPSLX01G0i4QUfkwECpGOu3Ejw4drBDdS/XXtkA1GieKj9CYaOqg3hY+O2cP4G4C85V/m4X9kxoWfVgBFCaIU/cEMmk8A7wniFpGJdUwCCNcUlUKAIi6LNajDluo9LdZ2oVDnsTdWYMCDa2h65UfZ2xOf/fjZZkZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547928; c=relaxed/simple;
	bh=Cl4LBCNyYjfLcA8M9pFp0MGm50fZVlfvAIPstVNB9dY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AWoQT5Ojg+s0vXXbY9S3lJORyD+9XgnZlRWwxChxpnbvQ3Ee9a5I5enYVcjKq+45zQdAo8fkh4fi6evQcFtOu5hpf4kypq6jWflS7mX+euHP2s+KSOspQT3/xgSSbNAutqyEsJrmFsLr2FleUC8X/tc3b1EaQe2IS4p5NhlJrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImrFpvk/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImrFpvk/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88aea027391so3353774b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547922; x=1792152722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XEWrIzKLR6ifRFKivyWaAxL1i189Pekuk8YqMPtRbiE=;
        b=ImrFpvk/OQZ7GdpERaG1WU9Sxw+6apwn1pKKbhqeZ2mz+QNnHl3YJrZvkfI5xteCrn
         VKvtDLgOJYlfe5UTB7uR3PPabK65y5DhLZ/RC8D8GWPZ2pejLGLTuESFTXtS1vIx7MZk
         x2oQ7onerRrL3sN2XUYnrTh0W+tad0cByq7UW9/RiLUhTc4YkkreEo7DT4yurdJJh1CX
         t2MUHZg1Vym+EvmU28+zgHw27GgXZr3NAnZPKaUewLoH/Dz8v+AJ6+HI6P1hx6CtcwIm
         zCUncBKlY5FnXkZAndhqKNkYYSZ8rUOqlNQaiTl+R4GBmpulTU93ciYPp8dL/bI6Yh6S
         T9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547922; x=1792152722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEWrIzKLR6ifRFKivyWaAxL1i189Pekuk8YqMPtRbiE=;
        b=ZveY+Ig0r/isqj/GuHCt+ngnPkRoM84iGYh+mSRpTsaLfzUXLYjxiK51ikBYd7r+oU
         4saosJ7ULah6wOoHNeSfv/tfs15sYPz6ZCeIjKcbZudCnlZWS1HAjRnm+4QGF9i/t1uR
         SrDr5mfbviMYMuAjx5GAdvPS5gcpKU2vVs9LifjstGeZ1QiqmBxsKBOxX8wBOSUfFLFr
         2/E1JipHrIXJbBQE0buaRh0X/+rDeFKiFMn/JFlYv/Z50kkn32DKRUgz+JlEp1wBB9my
         1fI9q2VVXAAC5pnWMcOQ/Zqx8OWwpf3eju7xW1dCUZ9sT1V4azdaONY1J9h2ZG03UQHK
         5ROg==
X-Forwarded-Encrypted: i=1; AKwUvByeHiIpPYTr+yI4BP5DhPb/SR/d0boKVD/uov8SgapyvpdEyCJiGW+XBu8Rgc2oV1qf2qF5omp1xgoS3MM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY90QTyHRqBuABWZd4GyJUGeTS2vhOAWdvM2od9ZgXgRqxVGuH
	j5YOv0Wf24grXZ7OMaNO62YN+mulYs+BX6UqqHNz/IY9NUoPWQUDXIZN
X-Gm-Gg: AYBFou0Vux+nBe7WAgMPamcWVXIfLD86jGpKvb/gKpGP3DXcJsG20VnfkfmKFVFApub
	DGewB5EKJgiWIp7qR3+ioKqSOPWFM89Cy9DuHbA3IGUp07shclRdOlRLe0c2TFGIUNdZQQrdNbl
	69sWiRNkFtDwcsuKps11OoXtloAZZnovbrypoqoZk02YK84PXr0ZOZTHyX787A+hFG0pyg5slaZ
	7A1wtwos7ho/a+5VkdPh4ebFEKRjvEgDs6UHWm8U7T9wP/rV6fXCm2rTepT0f2pIk+D3ieISUq4
	Xglyngm9tDmFxgTMeQCBavA3ruqbHzpnSN8ds8MFdl0DzCqFcEeU63HllCP5zsWMkzVr6Y3fXil
	XwU1U86X0gUN18JTd3jzdCjms5Ur07soXzLLkrDipXenb6nry/6LkOe3qOoMaiZl2PH3g2vYzhz
	ppY5v8o8ByNi7pcQO0/tR3efZ9Ql68jGnc1We40pVPxKkNP6F/JXFzo7xGgNqqm7KCGemv9CyIj
	8s=
X-Received: by 2002:a05:6a00:bb8d:b0:892:2279:1008 with SMTP id d2e1a72fcca58-897c40f1e1fmr1597858b3a.5.1791547922019;
        Fri, 09 Oct 2026 05:12:02 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3eca287sm786243b3a.37.2026.10.09.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:12:01 -0700 (PDT)
From: Yibo Wang <wyibo6109@gmail.com>
X-Google-Original-From: Yibo Wang <2024312277@stu.hit.edu.cn>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Fri,  9 Oct 2026 07:11:41 -0500
Message-ID: <20261009121143.550498-1-2024312277@stu.hit.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

This series adds support for the magnetic pogo-pin smart keyboards of
the OnePlus Pad 3 Pro / Pad 4 and the OPPO Pad 5 Pro.  The keyboard is
built around a Tinno MCU attached to a tablet UART.  Both sides share a
single data wire, so the host gates its transmission onto the bus with a
PMIC GPIO for the duration of a frame, and every host frame is echoed
back on RX.

The MCU speaks a framed "one wire bus" protocol over the half-duplex
921600 8N1 UART: 8x 0x55 preamble, 0xF1, src/dst addresses, command,
length, payload, CRC16-IBM (poly 0x8005, init 0xC596), 0xFE and 4x 0xAA.
The protocol was reverse engineered from the vendor kernel driver; this
is a clean-room serdev reimplementation that replaces the downstream
platform driver, which depends on a private msm_geni_serial callback and
a user-space held tty fd.

Patch 1 adds the DT binding for the "oneplus,pogo-keyboard" device,
describing the supply, TX-gate and wake GPIOs and the touchpad geometry,
with a MAINTAINERS entry.

Patch 2 adds the driver: keyboard matrix, touchpad, function and URL
keys, caps-lock LED, attach detection through the wake GPIO plus a
100 ms heartbeat timeout, and the keyboard backlight as a
"pogo-keyboard::kbd_backlight" LED class device so UPower and the
desktop keyboard-backlight controls drive it through the standard
interface (the level is cached while detached and restored on
re-attach).  A sysfs battery level is exported for the keyboards that
carry a battery.

Tested on the OnePlus Pad 4 (iceland) running Linux 7.2.0-sm8850
(v7.2-based iceland tree).

---

 .../bindings/input/oneplus,pogo-keyboard.yaml |   81 ++
 MAINTAINERS                                   |    7 +
 drivers/input/keyboard/Kconfig                |   11 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1109 +++++++++++++++++
 5 files changed, 1209 insertions(+)

-- 
2.53.0
