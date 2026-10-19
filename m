Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436494;
	b=FgpGIUpvDtGbup3lnm1qF7GjiYsGo8NE5teCRh2qOLhdqLEKqZNl+yWnRwafJgRYMipI
	 O4BFi5WmB9a6dTcfIV1fk1Z03fakLVtGTZ9F8+iCRaObNClxTwYjS+R9PzhMsz99J9yQG
	 i//76bugiKSUu0LfFBl0YZNRLnqdL41yfwYPfIkbmeIqF0DqFpxYECl11aEa6x1NSpESL
	 1fQW5fB40YFy1D1v7fPyShQJ5t4PW2l2bvfFTkBJvPtvk8+DWrYhQ4m9IqUxqd6zxyBoA
	 c6MICcUjaNYVw5Yu45/Mm54EX9omRPaWMcAjxOeffkxT9cUsU/IT03hQyQUnsck/4dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
	b=A4pdWHXHn2H32KbRJ01otC88omDg9Oa4VSCWcMJG/23C6dvZMxaasrmX1Asry1WYtXZm
	 n8URs6ZVhRcpHgNUKkiTHBkYWJkcFxIJ1MR9jO5Ei+8mBOHZuEXudf9zIsm+2SWzd4seL
	 4KqW8b3IfGVzLO8Zb5zDDw+5GXtoZM8psCx3vNSieR0iUELWuyTqKj4SZNKvU4Iw0qPtN
	 xcjmpj9SofNL9G5+OofJ8uhtmGXW/sr/68VPLMQzNePhhMagJ6GdyFh01Pcr+7IUUKLg+
	 /Sm1YXB0ySuGLlvNYOG4C+vXWXSrID6pLh5gFAsQLxuKfJB+SD2+t345FxQ3fB5BTdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BQq+KE8x;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC5E606A337
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC5E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BQq+KE8x
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e946155442so19769905ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436493; x=1793041293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
        b=BQq+KE8xOXbY/uqMBJRUuuiRWixMIYgasL2Q6oCe08KuYbbGLBcRh24ixnfWFYSdS+
         dCiH4G1K7vTp7FQiasyc/3m9GP5veIG+hi/bMw6XJT9kgi/wSJmKm372tZ0JKJdfCLaH
         7FoNQeI1qbJzVaYfIhpmC+tqgs9LZRyoUr7go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436493; x=1793041293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaY9xBH+ODoyMqXQ5rD2hltdyGJo1APi4ZaZtmkclWE=;
        b=bfEAdow5TPK63FpcmelXcAlJIPcoR7uzFIc/u/FeheOj4DfR/jEgcBLO2cJh9fxA4B
         kb7+VEL8ywB3aW9d4a0vWSCkqEMv+qD6xbNWOPiDsKYhPtcGsR3eJVzddSELjSI3FmKd
         lZW8SL0QFNdVJvOK3GTjssdU9j3U8w1bzyUapB3ALbBHmYszBw3D9YBwBsLvugX5KcF3
         i4WrT8Hx1+fhpmSoca4LUfsvNaDgVo2ReqhnCfU1RJtWDdaF19YAmTUCpj/WbPFfDly+
         +EBhxNBn5rmgBgV7KcmT4d/IKDWfQM9XL7ERTfz56CBlU7VrwdCeiabndvUmaBrJnHOO
         9rOg==
X-Forwarded-Encrypted: i=1; AKwUvBy2TgGNBD6q2C0dqszT5C1IbrIu3JqFJ7rIAVEB6w7MocWpk4oABkhIbVPd14H/A498gGEPg0R/6iz9uwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK02fKGUWMYocc4pDuM/kaGZJxS7M7Y6rBHN5dKiiUtatWrz3oM
	UJtzZTG2u+yJ/e09/PZQT47gkRcqOOG/Me9mKBRCBxsZlIXf5E+HmjDFNaJ2zjJ86Q==
X-Gm-Gg: AYBFou2V6rgUOOZ0K3SPvm2qNuAJt1HxQ1lNnaEM8LLrtKxTZi+DMMbVi9q/OU38gP5
	1EDl0ONbmUDDy7/nriWPrR+VoW9+ClY5depIaZshYYyhSDJ6YhJNW2++kF9OQp4tPnKgei5mJSs
	SklWIvhYzFlIqo7tbZLux1QcDyffI3YG8gjmCoX65SaLeiF3WfvUQXYKQRHIhAYFyb8RnI75HKl
	TGMxfayvWW9F+FztmgaEECOZ5jfcIXs4CondW6hNeAj1P4ovGMsyrNEwlJuQkH2J5NA+PRhhLg5
	HpU4CXGh7OOIETNrtWf+wjEF5mOiyFILQiWCrGo9mbuYzQC0o/OPYuluzbbEP8pEsijAzLrLhUa
	d8k/unbafn2cyMC/2xWLFfgdDO9OI3kVpo0KACePKWUAvhDI9iaarq967RXg8uO+SqUb0NosgSo
	pQh8rYV2+7IdPnNy9RPzONfZQqTZf0ZxSv2+kVZiSr0WAYCm364R3zeJAn/oMRw6Obs7/QWe5tJ
	6PZKC4a29nq5bGTaeiXoROis2yPJMumBG8nFmtCFuZNBzndsObZ1kxC1crS4nhViIHY07I0Ic8H
	WfYQOQ==
X-Received: by 2002:a17:903:283:b0:2df:90d4:1193 with SMTP id d9443c01a7336-2e9a704f530mr82162035ad.45.1792436491907;
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:31 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Mon, 19 Oct 2026 19:01:14 +0000
Subject: [PATCH v6 02/11] HID: Add BUS_SPI support and define
 HID_SPI_DEVICE macro
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-send-upstream-v6-2-cb9ba4b3d6fa@chromium.org>
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
In-Reply-To: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=1445;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=Z/2OynYTrncR3whlCD+8cLrRCycyd9G1cnZSFD18TV4=;
 b=lJc8V8Nqjo1jioaiCACjgd6Onu1pi3IF5K3H7O9O0Ysv6de+/D34pDGq9QMvDw8mebB528I80
 2kaE6ZZjzlGBGFbwmdNzil47p34PVsQJh7RrChGNGuNtij++kwe8mZX
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
2.56.0.212.g129ede20d9-goog

