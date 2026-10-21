Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549216;
	b=d0O+hn13WBEpENcGRrP1lEJxorz8+aINq6M1xfz27TVGsrXIeeD9/Ytg1OuWlhP09vv8
	 7iPay2txpZTz8nsk0syJcSh94f7DMhUCB8teZXm7yd5agsWlKO20rIhPWs8JTh7ZPJkJn
	 QXevKxLTsMjR3cxQ5lOrqRFTp8Rf2LVHiOWbMUcxoqz+L6s5GVYw4/clqif9iuKxKjZky
	 RynBy5sL9zPTrEDnvngezOg4hrXdVkdl0UarM1sAUDfJ6o6StNcNASrBqKzcDsZBPyi/J
	 WfwRSIPFR+CYo2xWnlGYssCsx31v3cEDvJtmRUhRwtfhbEBKl0stPLJmsGf4vZyGOmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4wXolCIQzcfX6BR+4Zq3Q7gMENB9jqxPtoflATyZXeo=;
	b=O8y7JZF0eZ76bY4+CghfqcUxb3yaeKiemsM9M0JtB0s+HJjt0VRB4d1GX6OrcehKLTph
	 fpfwa8yMla48q7YbJRrGlK5MthMIOF2dxx9aSRr6xizCy00DtiT8I9Ir0a2B5gbTpRdNn
	 2/SjsaYOygnWTRYn/sKoajBJNyYSoF1Ri8CM3CUsDkE4/wnqJgcCwfmClOKMsVM87GEGY
	 deebtxj03o82rELCDS57bK8VK59T0ldFvAATQMd1yZOmjvjAHw0sSSSZmAl6K9AJ+qR1B
	 aVWDBZLewulVZWgQlPVFZW+7ptoJsrakCdm+S1t/eaif2twyihMs77uEk5nRcwU+48w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iCMUOQDI;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D65606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iCMUOQDI
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso147127a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792549216; x=1793154016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wXolCIQzcfX6BR+4Zq3Q7gMENB9jqxPtoflATyZXeo=;
        b=iCMUOQDI6GpPQivFmQCZrzyI7yignYwvFkjRX1YadYK4VW+QrrzE1E9kvItNq3k7c/
         1RHh6MmBBC29sZ/YMgXB8LwZjoxGmTPWf4RKEdeLHBPgpn8V3DmXG3ygIVP8xRFilpyQ
         sP5Iw1MfC1+5BA/au7iGK5p/o7uMm/zE3DQP7KSdgtvfbZaWdIrPebl8GYTx5LJLgZcg
         N9Z8C6RFpzAs21v+UQM+weOBYOnF+zXmVb/7Td2k/VBjamUhPnamlxdPi7pEWeGMKwi8
         t/xQvvSvNCiypBrckC/bAIYGpthkSqS96RHuo+L5PfAeTb+3b2WSc2tABSZRP4pHOkZ5
         g7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549216; x=1793154016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wXolCIQzcfX6BR+4Zq3Q7gMENB9jqxPtoflATyZXeo=;
        b=Uf/AUPqxe3GW/n0jHIljnRZaOfqmm+YzWHEa6Ww83miszStEJe3NjROGpPvP330R1I
         ZFjupkowDUgs0M0Xxiw5kbFEm9WUrGp6FmQH3H5+/zWX/SFpj+viHSa2y55/yr0IgY+J
         ZyEo/RE7lzP82tHScBfAoVnb1G/WohLtJdqchIPabtzAl+x0ToN3hx7B3bIowjBWmuLv
         MMNBEVfEK4v6XzTnL+uGLbxubGNOEM+/pCdwKn97K6DnExU8hGbfCTbUrqhoGkGLnjk4
         SJh3nL3KKkWhTPuoZFiRXtQN+VHybIJtQMFS5GI+NTG665YX+6P4oIqh1Mh/0cKAx8rV
         CVCw==
X-Forwarded-Encrypted: i=1; AKwUvByVQhTCr8VB0rWzvKdt0T89w3kmOWYHqSguWSWy2GlwDZwHtbBtohs9UW9aAatZdScNMz/7PIp1zZyGZRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAfS7lRimS8/xwbVfrnA7pA+W8ochMLytpC38Jm2Ljl6qtO6h0
	J73L78VzQZnlH8pAW3YJqbILEqWJyIEzSJUIYVgmDrFE12p7RO88tuve
X-Gm-Gg: AYBFou3c7/0OtIE2yuyrlQrVjFM2oh/YCYBqKM+OEp5Dn074owdyHnrhIOqAWb8mSQk
	xRuCzL8gRfiYjJxwttMSvc/1LcCzdm1AO1tBBdg31eTP9uBtIBtZa9UzlBbQS9LGmm0RJ/V4qLz
	0TTDjRkPU2xBF+wvcg+Fc4mQkiMtqT/3BqkjfAiSflKgI2GmGZrmq6fY71E2fWwPExY5lNjUiIR
	5Rm/zA6wSaoj49eZpmDAV3DXq70aV0MGyTnA+Rz1SwOls3cvwBxh8CMfMtVdxCFqmFLtLT/Nfce
	rQTVhj3IC8WNRO9jqMNinOXAmCmzFu6QXNRa/TIyGLlTg4wgpVgrY5nvwTG/IcS0Bs8y9ebUlTB
	7S4OWW+nfIqcCyvXnugvVUY93u+sBuyohsNqjTcBbNrfNn5MzycIGxV+dvNPOPFJiduqV8zOMx5
	VVo+22FMKukfRZ8LtpCHL9IIQOrubtpAFGRkA9qYslT+FcrXY3O3aof9wTwpyAKbBwq+WX7JYbp
	h8FjkCtZUnXjmYLovNL12Kp84qNRCCsG4XnJ46AGxZOcR5nxmqr1nmjUnTnW9uolqzuSn5t
X-Received: by 2002:a17:90b:4b03:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ad86e9eb76mr588413a91.14.1792549215633;
        Tue, 20 Oct 2026 19:20:15 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802917c3sm1979077a91.7.2026.10.20.19.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:20:14 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v3 0/2] tty: sysrq: fix the reset sequence state kept per input device
Date: Wed, 21 Oct 2026 10:20:05 +0800
Message-ID: <20261021022007.1717207-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Sashiko's review of v2 asked whether clearing reset_keybit could leave a
device with a permanently truncated reset sequence.  It can, and the
answer turned out to matter more than I assumed when I first looked at it:
with the default sysrq_downtime_ms of 0 the truncated sequence reboots the
machine on a single keypress.

That outcome is already reachable without the v2 change, on a device that
has not parsed a sequence yet and therefore starts with an empty
reset_keybit.  But v2 extends it to every device, because clearing the
bitmap turns what used to be a stale superset of the old and new keys into
a proper truncation.  So the race is fixed first, in 1/2, and 2/2 is the
v2 patch unchanged.

Changes in v3:
 - Added 1/2 so that a truncated parse no longer sticks (Sashiko).
 - Added Fixes: to both patches.

Changes in v2:
 - Retitled from "Input:" to "tty: sysrq:" (Greg Kroah-Hartman).
 - Delete keyreset_timer, otherwise an already armed reset survives the
   reparse (Sashiko).
 - Added Cc: stable.

Zhan Xusheng (2):
  tty: sysrq: reparse the reset sequence when its length changes
  tty: sysrq: reset the per-device key state when reparsing reset_seq

 drivers/tty/sysrq.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

