Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524E4BE44C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584801; cv=none; b=JRzcYV0kod1g+depahEQyKmp4vyXx0BmZzKXDrTlJlEXGm6oe7BB5zvK9FZFqQred7HYT1/jtp+KpE8FC+PDMqOXE9M8V4X1SguuHQAOoa0K+uTNd9vtG6xyXOlbWglhIKdCb7V2erAtTPiFRKj2H5Qfj6IlUM2CabEL0XIanhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584801; c=relaxed/simple;
	bh=KuiQ3IKUB2w9nXq1YX3MmqHIvFA2tKtv5n9Cp1iq7qA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nm3wBBMvZ6UamOlekcp/+McHPI/D7zKSSV1uMR96Dvng/ZKaeEfgevGNWAhbV9wnVg6iRh13uOH32e7+Yb4iZGY8H7IzdwMQ8YGgwG6bD+eN+MIvlCnMlmbpoAKatUESEho3+LPJ/u8+wCp9qGV3YV7EQnms6qluvMzqJGjdtW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H1/cKE/2; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H1/cKE/2"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db80fcdf8bso1117995ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791584799; x=1792189599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5eNaZ9lIvV3v/dwCQY0Acm5f+QB1YMzWWisiwjAWsk=;
        b=H1/cKE/2FGv/Bv8WHfilld0NlAKTUL095Vr6Y3cWSGhph1i5ZT9b20vqmABEF5M5bR
         OcJjWgxNUPmDQyhfiADI9ws6xEhUr+GXFDG9HwCgzUgNNIhqqScYH14LXI9RWqSFINQR
         gXUARLZMgkUWyBdluml5zL1S0EIejjvAMiEfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584799; x=1792189599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5eNaZ9lIvV3v/dwCQY0Acm5f+QB1YMzWWisiwjAWsk=;
        b=yMJPsG5r86xP+CEHI9Xki5FV+nQa1utpmy2IskrH/EMS08xZYyi4OET0tZQfTu3yc7
         9HAO3jylFZWv/c8kQW/+s0endy9qL2KVkI8uDOSTcmgb1I/lZ3SFxuviXVdMbF7HkxD+
         /awlzlApOQWYH8k+RW8fQhejGFe767DsjXiNJlC4KEM/8Crbww/ShVG1Z0cywCX42C26
         2zU5qDK5fs52jfFffCfh0BsR7jwGfsQOO0icibCaK9gBRZsMB9rIURZdBacy9CjhuzIO
         8/F1HjKVP9aFzEbQmu7i/LLCheOj8rDM4VQa2TO95zH8/byEYRqLCKj16gW6plHjEX0G
         vFgQ==
X-Forwarded-Encrypted: i=1; AKwUvByMo/8vFe+Bdp0YEVn643eJWzDs5WtOwGanPes6V05c2XV9mPS3erhmJDnTGY64sQPO9tIDBC9rBll/s0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMqLaodiZODWhB1mwqQiRnNjaI97+6rtbmilatlnugrigKvOzy
	SvIiA18ZveQIg0tzog0xyuA4fcEzbo4kOfRMxr4PAWIiGaph87GGVyQLbdqPOX1vYA==
X-Gm-Gg: AYBFou21VgKf2fOsiMVBm1th6aQ7X2ycqfGfUSCj7b/h8llNsSUlILnOE5bJWTlOVHB
	fxOwlnQ81ryCPIxIO/n2mStdiQUxGG+8bG8klZ++VIC8OXQl4I7pEshn3o2Rx5p92rLhhK27mxY
	vyeuHbMW3sXdfDnWfl2E4zetys+e2Y/Pd/I1CxiUzro3hjEWcYEZCipvibzzJq/O+nSDLC+wHlY
	mqmhXAYmxxSUc5bWqgrYTsWbVGkiRGcKRqy9Y+N+hyRmCadSsu5YCKIYu65Hp1ACrly4vWrq72/
	ojfh+Fr5D6N6Hx6BXVzsb4njNe2FiSA72BWBl6zt2E5fe4VrEooDdH2fHOimFU9bAn25u1ZaAk7
	khOHNmr9CpD5MdkfJ8wkGbnp23P1sqxiGgA9cQU+z7BdoRb0LOqch3YhLha8LYrR13XfhDdyfJK
	PbGZU67t3qjtgX16LGaNuHAvswvA1lkKD+dnsxveADcp1Px00CH4nq6Y7WHuWPZ1lVxvQKg68/i
	A9V8jR0OpiqFe/yJnUJjDV64FkgBZFk+zw4ZagPUOIPzeUJCivsh82GZ0eklhWZ8H1Hu2amZl0t
	KA==
X-Received: by 2002:a17:903:11cf:b0:2df:8aea:7d99 with SMTP id d9443c01a7336-2e842bc8073mr26181935ad.59.1791584799610;
        Fri, 09 Oct 2026 15:26:39 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (35.152.82.34.bc.googleusercontent.com. [34.82.152.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm16660725ad.17.2026.10.09.15.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:26:39 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 09 Oct 2026 22:25:27 +0000
Subject: [PATCH v5 02/11] HID: Add BUS_SPI support and define
 HID_SPI_DEVICE macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-send-upstream-v5-2-384af01da3ee@chromium.org>
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
In-Reply-To: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791584797; l=1445;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=K9qWpa5CElybzpEomRWCeuxEJVuPby2HN/39jIN2wOY=;
 b=DAEBq1NSgXCcSRGDgv7mTSvfFXvZQUxWlGT7XyleRhM2NYQY9lknT//0P6rdifesIsq82ZxJy
 juVP+wOX5jeBzOvl9RenjkrrlGZi02gGUzA4gQiUAcSPO6BQhaniy5p
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

If connecting a hid_device with bus field indicating BUS_SPI print out
"SPI" in the debug print.

Macro sets the bus field to BUS_SPI and uses arguments to set vendor
product fields.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/hid-core.c | 3 +++
 include/linux/hid.h    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a3ff0514f9cd..1b9dbb7515ad 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2373,6 +2373,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SPI:
+		bus = "SPI";
+		break;
 	case BUS_SDW:
 		bus = "SOUNDWIRE";
 		break;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8d17b741638c..45f713fe9982 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -821,6 +821,8 @@ struct hid_descriptor {
 	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
 #define HID_I2C_DEVICE(ven, prod)				\
 	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
+#define HID_SPI_DEVICE(ven, prod)				\
+	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
 
 #define HID_REPORT_ID(rep) \
 	.report_type = (rep)

-- 
2.56.0.385.gd3acb90ef8-goog

