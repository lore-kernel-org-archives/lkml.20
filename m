Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292308;
	b=C0J64NeP3eGv+kbt5cJtShp/Z3lVx6k3jr+yJl7YGuQAnk/SRloEf/NnkAiIH/L79NQc
	 /YWhWgH1VFtksrgS1rzCfnAJ9yxZPKEsOUJIm3R8dZFbbxewd1ms73k8Xt3tduuskVPJF
	 ACb0M+VGjoCD1stmsIOJx0R1lBKpKunLX8FXImwOseTXvU9AI7cU4tgItCV/+Zl6yPbKC
	 TqSveZ7F+SA9dOTKsmpQDBchXjqLTqMsZXE6LBcTGCL/S8W1tIZYbzv657jXwqdgPtgch
	 CfrFL04qPe9WCyZ4Dfex1lHFiPuP1qym6HLHNAKllQkTbt1LJgX2rwOLJVK0x9jjXoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rlC3PRcSmwaxdGJVTnjCi+zX4baye9cdvwj9NNfIp1o=;
	b=dZ1Kkq9qqeYo9P++Bynahs7y+5H5r+lZPj7RGVz07uvhISzh2zK17AEw/3uzlryEYgYX
	 FjTnqKDmJPCCub5rtv7LS9W/c4QRdFpggL0ns5YQnr9w1LQaIXcZ8wuqEYFUvlEvUBUP7
	 0+EmjlwGpwZH+2w9QFKqadnd76pJOmHdJbqR3QhS3x4GR/Fg9/h6PLDgCVkT5oWiQRlDv
	 uhlNHIhuuTYIs8WL521SUkTEgsLpMOflxSju9XhOQE6xXpy3Coyc8JLNZ7cUz+gkHDDih
	 yyZdIuD/uKZjMjz+zm9CFs7Mjvd90XyceQfdt1RmZalEWluezCRguFdM4I5nNiZJ1tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wj0jQ/4V";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE6606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EFE6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wj0jQ/4V
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1736621f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292306; x=1793897106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlC3PRcSmwaxdGJVTnjCi+zX4baye9cdvwj9NNfIp1o=;
        b=wj0jQ/4VuUyLTdFP1BSxiVCEs/U6nygJhmcIxYFtnVKAYmFHv6thJehw26ay7S1LzT
         JucleO1u2QvRvBS23NYL7YdFYx2vQGzTvgFlDrmfHjrkLETfOeF2YaBC5xewqjPMNleS
         /C7PuxaklKOerkzxfo0ES7eMf8WL1FiEjPtpZEkQ1UTr3Gosvk59gNUfTiMkL0Xw3/G0
         d+gR3uqCvhSRxH7OiQ8XaxZApbvdTV3+v5If3npRXg6BNJY3oXypv2Tqs5bKHCfO9bvU
         FtTQE+UzXc2uEe5D0HpIuPXkKP9PzNxTMJYSfr9bW+CnTe2PeQ5LHAV0LZ8GvbUEKf3A
         XTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292306; x=1793897106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlC3PRcSmwaxdGJVTnjCi+zX4baye9cdvwj9NNfIp1o=;
        b=YXabqhztHPikUJvEyGZFhzq1GgwWq1koGcHtbhGIrGuMoDOkvk2ixodhbvRSE44mX5
         X9tizwJRjlEf3BMVrvAzr+IW218c5MYNdOYO9N7IZcJPI9WRAEuWvecasNxis109XuPS
         LhgA3LflRCaDlhDGtv5eQ0ZNXH/EGx4qF9AHs4EKiMhkYc8rOr3hM66Qo9+z0MLx4YLz
         vrRUMCBVnBZgeIdgc6d5w01oI8fpngrJP0lLU9cAaUVZ4iTvoURnxbECN9WVlxrWvF1K
         vBhbitjvSdkqXPMBsKlUngIru5mL9Utmjt7YqnR+HaAvD14hQ9roho1KCu26xJ1s7vdJ
         NVmw==
X-Forwarded-Encrypted: i=1; AKwUvBxo1rohZj1iqMt9IWCwqOcGfxdDcjTZiZ2Ua94O4ouRTrP+1S5Bbv0+3MrRvqzS+hYXbCgR10oOSBPN4AE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSz2dVxF/VUxZGs3IQ6MQEukHtSEgS3MEr8J7AQIwf1CsUNtpL
	OGYeAXhFtLBAoDLu7nh+odO4E6Kf8FFlnm6yIoyKOrJWlpcmSggKbGu+
X-Gm-Gg: AYBFou3mzhKP6zPVMrmIWEAdZkclGCL2jFHyjgILAo4zWggQgXermSsjbt8c+SUcvTJ
	7FhDIUAeNYTIz2O740UHO7RyuxrhVJ9EPZ+7Zlrx9NVTwr+Z/xAZKn2JWKBFwfT+U0V/rma2QP1
	KuXAY0A5R3kuNFBuIEq7TjSP7e9YSwPPaXEXqx2iP5bFQFVkaVvSxMG6pyi1FxTSwUJMWrSJwKk
	Dj+F1Bg320Ve2tSoPKQAz5RwWm3g6netUSy6uaS/olaiS13egX8R9JccrsYfTfJIIpZ8S4A+xon
	wmZXkTK3UkZMLX3IcafB1mUxRGAjEZMzYOPUHBShr1NR+a/DPfQZJwgZEP/nQjKjuLL89cTzqwD
	D82ePqMU2BhDz8OJo8oCK7GnBmg7+XaLJkqNgAeTK9iofN2Wk4HFGZterYp7mm5s+92toPxuMmy
	9tfbO017G1Cuaf6lN/v8d/+10Dx8DxLTVwOmuOB6OnwFuhBcEz1htrlU/Yxobtx7HqzkwA+y0qA
	Xc7rzsIWOFsZDFK5eSPq7BpeKAPFdbQcDGc/Jqq8WKV7XNidP65RWZLApW6scYGOtEh2HqbSlUS
	ca1lunjAeS6GQefPCpnFAjjrOq6jY6aHxy5tCV5ErAZD0TcxmXNeXa0nyMdzE1KC8XGn2kfKkAv
	Xmw==
X-Received: by 2002:a05:6000:4281:b0:48d:bae6:d7ba with SMTP id ffacd0b85a97d-48e5d5c7104mr12457549f8f.26.1793292305830;
        Thu, 29 Oct 2026 09:45:05 -0700 (PDT)
Received: from Nebula.taila1e315.ts.net ([83.104.75.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6dfb26f3sm224238f8f.46.2026.10.29.09.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:45:05 -0700 (PDT)
From: Chris Sutherland <csutherland.random@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Sutherland <csutherland.random@gmail.com>
Subject: [PATCH] Input: atkbd - skip deactivate for Lenovo IdeaPad Slim 3 17IWC11
Date: Thu, 29 Oct 2026 16:44:44 +0000
Message-ID: <20261029164444.400649-1-csutherland.random@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The IdeaPad Slim 3 17IWC11 (83VS) creates an AT keyboard device but
produces no events after atkbd init. The 15IWC11 (83RR) already skips
deactivate for this EC failure. Add 83VS to that quirk.

Tested on a 7.3.0+ build. Without the quirk the device is silent.
With it, /dev/input/event3 produces events from the internal keyboard.

Signed-off-by: Chris Sutherland <csutherland.random@gmail.com>
---
 drivers/input/keyboard/atkbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 019cfa855..506323002 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1943,6 +1943,14 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
 		},
 		.callback = atkbd_deactivate_fixup,
 	},
+	{
+		/* Lenovo IdeaPad Slim 3 17IWC11 (83VS) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83VS"),
+		},
+		.callback = atkbd_deactivate_fixup,
+	},
 	{
 		/* Xiaomi Book Pro 14 (TM2424) */
 		.matches = {
-- 
2.53.0

