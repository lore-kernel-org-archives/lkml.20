Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466578;
	b=LRXHiuFTcFpXEHS3j7oS6LA3/be7DsVbAPSnVR++tfcLK9PeYIzm93qVsH5xOmsUsZ7H
	 DKkIHp7KD+dloBhE0D4IOsJQnS03mGWa+1wbnn29ijA97JVE5FHtIaJXlj3d09zd109bO
	 8iLoRHAoXI5lar0lvr9Z/d2Ow1Ey7EdKgDifPVAorR6YA+UQUdLEYXHh9GhQyiHpeiicR
	 lNsKGzhtU1oSi8WL5y0g8nknXmA8Lmm+KyI6shYxUTV1H4IVPsQ/ws0inXCosLchIwYqO
	 OfBTXHBoz6kP8c1IwYXoHJQDOFJKIC/qEDGddmRctB29E/qLJWuar3HjTTk4p7UNSFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R8u1ixJmi7TH1leov+iud2pI+lutflCpqRALV1qurqM=;
	b=xA2O8KF8JeuYK6JrHbGjkFoRGa5GEoGhzk0Q4MsGt9A2VNctrYtXqolqguN76s8WGKCo
	 mN0nvWCrXauZU1xAoQzvpL/DC/gN2R8uyDR0enSxEcTGJFLi3VhHxajJawdGOVKrjvlCJ
	 4fKObf9kjQI6Swfky+DW90KtH7mPJYN8y3gSAeKrNQOW7UD4AHyotrINaZmDw4Vk2i+Xz
	 X9j9JmenyDxMVe7MeUkpDEIsiywIDjqjW6R7WXsFbg6ut8L8mCDAG9vImR2eerX6l5oy/
	 HVcG0EH0pcDmSqXeU0parTxS0hhuS8RUipDAe9tcZTZTevjsK2PYKboVHZZzlJjsJcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE219Tvo;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A320606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A320606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE219Tvo
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f2049ea7aso270493585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466576; x=1795071376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R8u1ixJmi7TH1leov+iud2pI+lutflCpqRALV1qurqM=;
        b=cE219TvoeGWM7xjel8oXWWtPj89dTmLMtC0qCaJuJjc37uvQVOl/km/Hpzd3Yuo9Vs
         tUcXKSAAefqN7AyG2gUALa6hoEtNTg8+LiW/m7O1+u/mPPyhOKTkd5xYDgmNdzNgmjBO
         VjG0vVQCgznEB0gWSwHQSUv/ijROn1tGO39PBupfW8QjbrviCn5vxLg7QEhrhi8xIXII
         K+UTEGkKjJZyP3S3MZQG7HlD5or5Wc6nCoeSDb4OlKd6EMtcIETigZc/h1O6ODEeGFIY
         DWmTRwrxAJuFcZzwQuT2y+Ij3pCOZr5+iQ5z5jKgM1W35j+xupY3VTqEwzcGtwccm4oU
         UgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466576; x=1795071376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8u1ixJmi7TH1leov+iud2pI+lutflCpqRALV1qurqM=;
        b=W6KGlFSalSrRYr4qveF+9usfoPoVRwjuEDlQr1udoFHuKWfH2ArBsQsg8OHFUivw29
         TcWJQFJpZmhzlJCrGBsTZgcx73cGVpqk6+rJ4zQDncHAwzIDHbzS9kCOkS6KRTbMOrmw
         ZSwBux5Oq0mcEGyLoorj+W3C2WBBt22/oqzHT5dfSg+WIbqSz4Vnds+eFoBu7vmYnt5Y
         tiARorALCmbMGhHDyz9RHqvpX9+gLw0/1EjZc9qmNWX7CKxvYXQbEf0FdQtTlXbqzmWQ
         Jw2Up6SQHsJpULBMuquabbCUG9GCqYyXxXm7CsDgE9kJcKnxmagHNBzB6alsBovxNJxd
         Os3Q==
X-Forwarded-Encrypted: i=1; AL+hErHp+hJdTTF68q2V1+NaEtHvoqWAa8s4+ejMakcE3jMCQh/1NnpY/m+j4hy/3vQxqZ5vQtYsi2pt5JoK6JM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dmgbpJJPK7+6GIa9OeX2fdIAe8dwFEWWUQATrY0YObW+Z70l6
	CCQBEmZE0HohL6EdjsdOkPyEG32H9N70TpIoqrDXMHaLBNo/h0lut7wRu8aw
X-Gm-Gg: AYBFou2X9s/94j7RgVIVLl/oQmAlopd/xnOW0GLwB66Ta/dG6hs8ywRhc2Oc4eTvdJ+
	Hs3EAlpovyIWyxnvkvF7mYA9MoHD9pT/h/y7dnC2O3K8KackIG9Z4CHkAUT4h6HTimvsqAj8HYX
	kmnWs0i2Yy8bzmMn1AINSCDXA9pyzHJPy7voc8INBabf63+ttjI4umrVN2RqYDSsugVUGXyRJ5b
	9NP6mxkXOf6GJJm8h98aQvVAiNyf0fU+zL1AsgLtGu1PkctWq1bzNzVwcRL3Cj846to5Iz3ccZ2
	gwuQcOA/EPvekbPlHdQjHSrmm9Vi1sM1emdJSe/L+ArqAKx7ndgrydKUXaz+545f6rgc0MQoENv
	KZlqVx+FHbPcWPx3dvPb7XEmjY9gjYVog5I930im+EplK4lc5zwP09uf+KkP52Jxwicm8Io7Ayl
	CMzY/CkMzo6E/cCfadIU6ReaOkDoBr3Jx6G3F/y2PDPRe46vtU6TflJAWC3QBNZAPkv7eFEm5br
	ctJn8pC0ANyQBcKuLGHEjFFNVfNiRmeHwdWlRHItSc2CRnL4OBg8TuPetWBkG/P87pm89G+1CjD
	FDtqr7bf6EdAuW5UyBHJsqrgBnp0BeezmNYWvMGSb7VAlgbK91sCUNwjwCYZJXNxyiVH17jRVPP
	J2geeLs/Hv680bh68Z3TXcn4ywGWvCsgCRNlEcLVPFokro72xl27v3TiESLuZi/xYDNe02HeXOt
	R+/1xSicGMXXrE+gpzC1GQqV1DGvdV2Wi9
X-Received: by 2002:a05:620a:1a26:b0:946:f22d:1efc with SMTP id af79cd13be357-947b0049770mr887965685a.67.1794466576048;
        Wed, 11 Nov 2026 22:56:16 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm663813885a.16.2026.11.11.22.56.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:14 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: hd3ss3220: disable the interrupt before unregistering the port
Date: Thu, 12 Nov 2026 01:56:13 -0500
Message-ID: <20261112065613.34182-1-mhun512@gmail.com>
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

The devm-managed IRQ remains active while hd3ss3220_remove() unregisters
the Type-C port and releases the role switch. A cable event during unbind
can make hd3ss3220_set_role() access either resource after release.

Disable and synchronize the IRQ before teardown, matching the existing
polling-work cancellation. The ID pin IRQ needs no change: its GPIO and
regulator are acquired before it, so devres releases that IRQ first.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/usb/typec/hd3ss3220.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 60d6de9ba339..19c5dbdc97a1 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -554,6 +554,8 @@ static void hd3ss3220_remove(struct i2c_client *client)
 
 	if (hd3ss3220->poll)
 		cancel_delayed_work_sync(&hd3ss3220->output_poll_work);
+	else
+		disable_irq(client->irq);
 
 	typec_unregister_port(hd3ss3220->port);
 	usb_role_switch_put(hd3ss3220->role_sw);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

