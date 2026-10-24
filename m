Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812658;
	b=TR0x85YGvbMJHvKIjVKTrjpcuAUyG9nPMooA8P5cRjfYjOGrrXzqN7K4zx/Bzlo82l/O
	 kcSNNpu9ICPdfdfNpc77Vjd1+OJL55yAucGU0ingugDqw1B4IF9jkVZljRjFoLjZdJJWl
	 msXPPTDYv6sjEpLF8QxmR/lN63/iX7LGP/PeCCHuMEzM5+q7hyMFW548eF262CxgcDylS
	 hw5Py8F6GcuR4vfOI3c2lRZbShksasDglRQz5NW6IMU7UmQawikCJsNAf4CYnuwpR9ZT6
	 d8V4AM0eZKbavT4s3XY8KbfJ/hK0F10bly9NaTkNLVbxrTW+saaLglQaZbPuaQFZnDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SMS+XYATUvY7YNvEDxX5IVPCQZNzXnmL5Yux3ihoSpY=;
	b=q7GCbvZCepP+mClqI9SJwP33Pr426nMVia4/eGcxepg2EhcA0ZGe+dk4ZGxyJ5RHDXsF
	 /h0mzV6K5OVZaRlil6EK49ESHd7Ijwl2kOD/662r/X2XENMxoI2dhA56Kn2VbMupYGBt3
	 6EG9VY+8PAfTwCSj09K4Dm36fpdD+zD8+iTmeV+qgTrj7AfH9Z1sOAwvbe3g2E8qvklGl
	 ZnXXTHMJ4Q5Ms7eIx6aL0SwbSaSdkP567WVygXYHQjPzATV+eVaYNXfMBH+nDWLf9eKcE
	 +GBP0MfO3icC+wBvuM5Mzqy+3PdpZglfroy1gddfWTQacYPPbKQ2bg1AlhrJ3t5QjvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xnbot7Li;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDBD606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDDBD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xnbot7Li
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35c76e9614aso2249284eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812657; x=1793417457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMS+XYATUvY7YNvEDxX5IVPCQZNzXnmL5Yux3ihoSpY=;
        b=Xnbot7LilCE9GzQVggpQUtlm3O5iPC748Darj3t7UdYZ/Y12arwKbFv+cDmSrGM0cR
         mMAQ2QZ9CdPlz/yF9ebjqCNfn+15S0e18qDxAvWQ9UNNlmgvcnuT6A/sicnFXSDYFT4q
         1W6qW9e7xh4WQPakwDTQjmG2ekjgvOFQwvVzBEmsmwieOBTKQ6oIj1A/5UkT5giu0ukO
         L/t9k1mPmHYp8/13GtyIZNo/UXDvvZJm/nBcsZSKHFAEHlf+wJMJ51pArPB3wCzz3XpB
         OkxihjPACxym/IRBK+4LsPAl7dFFU57RlxApVF1AMALUHZFAP3IaEOb1+SPO7yRBunKW
         Ckig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812657; x=1793417457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMS+XYATUvY7YNvEDxX5IVPCQZNzXnmL5Yux3ihoSpY=;
        b=dIn3lrUHcA0YjnPa/XVjkZyvxSggycMAorpJRd5O6SaON3zjP/M+10kU1eZfKmBGij
         hkfufoHUQf+ffz+zv9GmS3v2TzP8BtP1eU4kDBENBCZmC7owMAdhhb0ZRLJAvZ3O2/ne
         5vU6Bdn3/02v9VQ/mVEI2h2a2hgoYJ/v0GXwYzQIMhjnazwVEDFM4Kv3AJpPtMD8QlRU
         deFSRCiDjHiJVOljJFxXLi4kz22wWaBnrc6ri8Ui0uW3UiY//YX0J9muy/LmQ6xZpG6t
         IrxyOWvhzdcuFPlmhOxeWQosAzcXU+zrclEdX7dxdonRQHUuD3Avxd99c1bC6nEauvzT
         s0BQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcH4Do0gDx145Vm7xDjGT4uKM9R8twOLdmSxh3eCnU4kNdkbAiA9mB6IiyhOuZgqGtN4kMcsUhMbX2log=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNBSugjI2YTeLksbebTCv/fVR0EyU5fh+Ws6ypa+uqgAQCuAvu
	UVEBkKhiXY9kbPqncmk3sD9cZ34dDBxDBgKqLidseUw34RyKSdA8ECK0
X-Gm-Gg: AYBFou3aAuX95VMFkChV998df4HEo1c9E/PcZcOlCRMnby/+oHjJIhw/SCVvUuS5f4v
	PdecERogDVL5PxGBu9RIfVnReUpZ/C8H6eCxRcePpZPuFb9MGi2BCHKJvo2rl5h2uUaQ982u5yj
	0z5aPXRavlgct/ydq7tKvQ+hNaMB/DG5CJCzGnQHDn5KAZ1sO2wfWyS1nooyX/nsUELMTaZXgW1
	5bU9pVMNebjI3TWtjuHZKVtnwpZJeKZDZoYvamD0X399GPaIcOEnxAzx6bWLD8DZgjTur3vGAvf
	XLjheyqd/ghd5xfnCyLEsRWGefiL35W8g8bP8OFihTvjRvJuelOcYzkyvBf7fu7I9I0z14tSBzB
	S/pTPVywkgfiyOQu2o9iUc2v025d4Ht+3JLV0Nzuo8nG9PKkPSHeS5TVfOZKVW+Th21YF3mmJAL
	dicU6H0hG+td0UsAcZfNJjQWZZjtRtF+6EGkIHQ/RjSYlxHrcT3v2o+nSyS5hNQSNyROaAwJpnm
	NyaZBnrWm9+CCQjYTNQmW5B1dVNd/z0KmiliGwoqCqTFELMGO8Od1zXEmMeZ6OCvwtURwK+Xrcr
	aYz5Hyak+48R3PFYU26v4JVh691l
X-Received: by 2002:a05:7301:4543:b0:369:a113:7560 with SMTP id 5a478bee46e88-369e86249f2mr1546686eec.41.1792812656823;
        Fri, 23 Oct 2026 20:30:56 -0700 (PDT)
Received: from jmoon.tail8e743c.ts.net ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm2827283eec.27.2026.10.23.20.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:30:56 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH v4 4/6] HID: wacom: add NULL input guards to wacom_intuos_bt_irq()
Date: Sat, 24 Oct 2026 12:30:38 +0900
Message-ID: <20261024033040.316652-5-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024033040.316652-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261024033040.316652-1-jinmo44.yang@gmail.com>
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

wacom_intuos_bt_irq() dereferences wacom->pen_input in every switch
branch, both directly for dev_warn/dev_dbg and indirectly through
wacom_intuos_bt_process_data() which calls input_sync(pen_input).
pad_input is also used in wacom_intuos_bt_process_data().

Both can be NULL when the corresponding setup_*_input_capabilities()
returns -ENODEV during a successful probe. For INTUOS4WL, pen and pad
are always expected together, so guard both at function entry.

Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index c38fbec114e4..6e2e67abf80e 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1269,6 +1269,13 @@ static int wacom_intuos_bt_irq(struct wacom_wac *wacom, size_t len)
 	int i = 1;
 	unsigned power_raw, battery_capacity, bat_charging, ps_connected;
 
+	if (!wacom->pen_input || !wacom->pad_input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: expected pen and pad input devices\n",
+			      __func__);
+		return 0;
+	}
+
 	switch (data[0]) {
 	case 0x04:
 		if (len < 32) {
-- 
2.53.0

