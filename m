Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8C3B5302
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482318; cv=none; b=LQAG1LsE1EJsqPGlkLNg94s6M4KIGJ+D+MwiEuQT0tw1U3Y6O7PhaKj3IZTKntj51I/xg8n1lGFs+VCfco3CZJfCPMys8xE3PUTVxK+UTQT9x1zNpXkxwlg4gcBf2rbAECTg/wSld+fSRiCIzTrw1XQdhH/WIVrIbGEJ2M3VMGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482318; c=relaxed/simple;
	bh=XP7iG8EjgZLn+YNGiqj8MkFgY6hRv4lb2REbNzeeOYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4DN0DdDpq5OcAqwi9tiY1VIzvSgsPrq6KtRVQybCY1WJq6FyBFcpbXIxQtR5INkKCVFBxl+AyRzHUjRB1yzIEfk9h+1HHWOLAFWP7saPL2P3rOFB1icdRNQg3elCbcwv+wZqSjZ2BODcNONH/xPX3+2gMqAPiNroWYjXOIKsvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIjRGOcN; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIjRGOcN"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso1218160a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790482316; x=1791087116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/F1JXfrPVlqflPqgZEKNxiSPZblFhEIoBm8x0QNmPw=;
        b=UIjRGOcN5b4oFzREBkAN3rVbVAllQ3RLX+LKxr2gWRR964NCVK4m2TJQAVpuArNO3X
         +nwddducL9FlNJysomff2MkDGVdy4JPUSCGJi7k+d6uU+60JCju3Gr4XSEyxJe9zgNVG
         Q3/l3RQ42sTSjZWdZfN+Kuszvj9g0K1FZgTATgZkX0O0eiivUoNWcj4nFJ1dwkrU68/h
         9jHfKiIJrLF26Uim5IbhJY90p/3C8lL7LHGu/a5oLi0scljxZF5nn3wgpdNw+1POK80D
         6wJ9RhIhLoQ2JQDJ1Ex26k7Zi77m8ri3Zw2A7eGhn0QKmznjppucAYZxXRDz3gcOonnH
         IuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790482316; x=1791087116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/F1JXfrPVlqflPqgZEKNxiSPZblFhEIoBm8x0QNmPw=;
        b=Fu9beK9zBqXbCa2/qYN/KfiYfQNaGmgX954X6j6qq0Nc4Tdxp1O+2BwcZm0L3eVedZ
         YuhNN8114dBXvpIq0cV8xQm5sFe/em7I9UVyDPPx2hvho8WyMQ/yExh7a6axeVRKnxHp
         4q+8b40wpLp/5ZoVwKHg9iCa17uSjq3/dBWuDdtiEXO79Arn6blHKawC7T7UC2p4Q9Tg
         vVFloupc0wP8narjChlVsms6FJUuFJvk0zwikTJ/gCV0nzmyT5pr+BYJBZOEgNU7zKlM
         Ao0iGsn60Z+0wA7fELenHQ0LMCDSKU3dV/57puXXicNNCaJYoMy+QdRtUXGIoZ/MO1nz
         g2oQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5+QYv7wD+uy26Xr7AmR+STQtntUYTcbU4j6VgiTeOMNBRFdLUb65hrAo4E/gejB1VeLl1ZqnpPijBZ1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1DN2tMuvVld5zxA32K9lR2D1y4y85o7a5FyIeqAZ1ofWyrpdG
	4QyKooSLKihEdBZHSVmsyHYMUWltxjhZ6RBW/usPmQXo7mDH3j1w2x27
X-Gm-Gg: AYBFou3oo2Ec52lpUvnPv71h+FTOA+ZR2N2W/QaGt3e9OzIIa42h76GjPrL075oJzjv
	6Ki7f8Y09K8Ojy0FuHLtG2XCZQnuV5H+Y1ceS4v6cgugCKsYwokSmfGExC8cAjnLpC2M2bB+WYG
	TyW03ZU6gXOVlwI36YBSU2cYN+f3dBbR0pPpXPnDSLjXeilAUatcqqhE11wrsyb2k/QD+JoAeO4
	6Z96/ZlWA44Bi28CUKXOKSyleWOMHTy0gTgLEJRQ9Hzs9DnEp0ATKrvzgk7ie9asqb+tmuNGch0
	QxyFv8fe/uGmr98DB4+YwcRQlJ6sDSycptKllmxvovgXLxL/pg9xm/13nEBuR++/oU3nVnD7Vlc
	7ldnWr4bdGheW8uuBPjVcygl3oy0fyJXbk87B8GKbqvQUwdOhXUCExE6UqWJ4AMRPqybgcPgtpc
	l9e1F3yf10SNIwuCh6B3KjeUPBqL3pnBxRzzIucqpfHceP3jkbhBflvSTIcliDGA0b0Gk1JsIkb
	sKp+9N7ojEMT6D13QpoQ1c=
X-Received: by 2002:a17:90b:274e:b0:39e:4546:fb13 with SMTP id 98e67ed59e1d1-3a0bb5788femr5079408a91.19.1790482316276;
        Sat, 26 Sep 2026 21:11:56 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b4f6345fsm5542732a91.1.2026.09.26.21.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 21:11:55 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/5] HID: wacom: check the input device in wacom_intuos_bt_irq()
Date: Sun, 27 Sep 2026 13:11:37 +0900
Message-ID: <20260927041138.4112920-5-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
References: <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>
 <20260927041138.4112920-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wacom_intuos_bt_irq() reaches for wacom->pen_input three ways without
checking it: two dev_warn() calls on the short-report paths, a dev_dbg()
on the unknown-report path, and input_sync(wacom->pen_input) inside
wacom_intuos_bt_process_data(), which is called only from here. That last
one is the odd one out, because the pad_input sync two lines below it is
guarded:

	input_sync(wacom->pen_input);
	if (wacom->pad_input)
		input_sync(wacom->pad_input);

An interface that declares no pen leaves the pointer NULL on a fully
successful probe, as described in "HID: wacom: check the input device in
the shared report helpers".

Reproduced on linux-next 20260925 (x86_64, KASAN) with bus BUS_BLUETOOTH,
vendor 0x056a product 0x00BD (INTUOS4WL):

  BUG: KASAN: null-ptr-deref in range [0x258-0x25f]
  RIP: 0010:wacom_wac_irq.cold+0x8f/0x16a
   wacom_raw_event+0x68f/0xb60
   __hid_input_report+0x398/0x4d0
   uhid_char_write+0xa99/0xfc0

One check at function entry covers all of them. It is safe to bail out
there: this handler only runs for INTUOS4WL, and
wacom_setup_device_quirks() only adds WACOM_DEVICETYPE_PAD for that
range of types when WACOM_DEVICETYPE_PEN is already set, so a NULL
pen_input implies a NULL pad_input and there is nothing the function can
report. Every path that reaches the battery notification passes through
wacom_intuos_bt_process_data() first, so no reachable work is lost.

Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Cc: stable@vger.kernel.org
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
---
 drivers/hid/wacom_wac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 48a58a6672c2..11544adb74f5 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1237,6 +1237,9 @@ static int wacom_intuos_bt_irq(struct wacom_wac *wacom, size_t len)
 	int i = 1;
 	unsigned power_raw, battery_capacity, bat_charging, ps_connected;
 
+	if (!wacom->pen_input)
+		return 0;
+
 	switch (data[0]) {
 	case 0x04:
 		if (len < 32) {
-- 
2.53.0

