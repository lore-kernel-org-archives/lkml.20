Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434689;
	b=aHCNNwsLaKXNz5aBrdkAOc4nakMbsNqfenW/jsgWFtkbU4YbUQ3VFEtpfqIp4lBPKIm7
	 4TVFVDrUMG3uk0vWArD6u57PFbgpR93R+1s+Scz8i10bud85jlVPl50D3jrsTJWTR/vs5
	 mf60O1vQiAKWLMrhydS9iilVmbTm+DuXed6TfRwW2OdDEvhJx2CGc0dhSyj12IS9aLIrz
	 uq8vgWx7zGNPJF5eOcsdgFlBOqynRvBOqidjcpIBjW5rSj8i+GThoZ6nVdV9bKwyku1HL
	 P0Hy6xlZd7TLb9EN7cJcOn5cJhqR9vSizs9pOB5WwrXS9GzU84jDpcOnfot8vVJODMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=;
	b=t3myTqfHMJJmMNQWKZFYhlpw4sZPf1Ngi182mdm6T6hat54STSA/GthTP6oPKjX5rkZC
	 tjshQR/Cnkk0h93QfD0oBv6pUe/+PNafMwIfqc2H8R/Pei8W0S81LCyJx6Dv/Ogma9wCI
	 cS2lkWoGVdp+46b6PqMIkUnWl4SDy3OiiM7+NLT9w9bIkZLV7HcyVZFTopqSEa8b550r0
	 v7fFbGz7MbweJyQ/Yr2YPF75dfZNBvxDmil8N0dRevbxBbwLWSjLyTsjgN3MdqWMPOfmW
	 UEcHPfw/1qxjqs9j8+leFBMjS5xeWtYFS013enng9ASnxheL4E13Fuj+P6fmKBcK+zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zKULn/6D";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BD606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 324BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKULn/6D
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso979654a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793434688; x=1794039488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=;
        b=zKULn/6Dode09/lnBjRIO9OamUmJKqsN3UyMmIPm1wcXvP1MO+eJTj2vp5pX8oBLMq
         LfpYtOMFP20aXUWHKlPQkX6kRjD8kc9f6R4sTNMK/p8xMxLUXH0bQJPCeRPaJiHePuVV
         NeSt1VX+SJf7MLTgXbVM3GItqzA/l2zYjw0Yyj4p0/T0fJ//gf/Zbx2BTWNFpnZ3A0BR
         J3tuOZSj7lpfcOIvLRUbJpkELPIxayjn7O4Rd3KOCArYkRtGOepzAzBE0wNh5ZLcmh/e
         h8KrVl5961YqnT+3/vrRSgScW7kw+jBiYipM5JJwRy5ze/Ll07G03CIE8sVKelWERVpg
         QAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793434688; x=1794039488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=;
        b=lbMekUehmSaPk/FW3VUONmKCZO15vuyQJUz7ZF70Jbwp1I3Z+Ovvk9Y6A+74n2keS+
         N/BDWqKfEvXABEWZRa/8cYGnu5RCpUZGA2scgY7QGLgbkZaGc7L4bUcfMLdjUKUZlb1y
         5wztyqcSPRaamA3iFk0n0SVrRpAKXe8DKWlra3e5UUNLfZXJDxjLLpRXEtp2kYPFKHpW
         JXFZ8fHqFxvut7JRgxuOxlYFBcQgipjhGgAB32k88yVsI6dLc1uyeAzRVTHH8bcWRKPB
         aM4t3vGqW4C7mUetkfIHsy9ZhSCBnEbGDSfvd81KJVTLC67CMtOU032Af3v2v7yeF9i8
         psQg==
X-Forwarded-Encrypted: i=1; AKwUvBy9Sdk6b8JOzakVFoA1GZmW9KKBXfaQLTnk66dPXJMSCHcgFRDRvAHpqwzj+dL8PJ8MU0PZOYbIBSw2ewI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDxwaN8qODF3fq67OcR6T0bPpo0HnbG9GAFS4NDsKACRSVKmjS
	xd2i61LZEsqbvCJtulhTBCLU6YApkZSe/3fEUD6+LSpgVO5Mx7AWHQil
X-Gm-Gg: AYBFou2jHHU2dnv/ZEANFKJGDeLfig+YyB9ZL8DVrnm9j05d0xO9m+731A1qsrkqlFP
	Exl4a5HQ1SYkHYh2KDQO5F51BmhIkVjiDVXL+PrxAlSPSGQblcMBPxx87D+vhm71I2kHtczkuNS
	r3yl7aVRhDLbNLA+FcfdBcKUY2pD3yO7vGbQR4yc0RcneMUme/7XscdNO/n5F+Xdd94qAllVlh9
	KdkVx0jY763JrFrKbx0pelNrYQl4TOWHGjVJv71Ha069xqx1l737REffpBQs1UBtxs8trntkFpX
	6E4cGnvvmzZbQTunvLpWEWXCNb5o6Po+q/46OfC+nMWs+iFDGc3MSf+thgTh3lQM3It+EGdT2Pg
	Gas4p+Q7YeI4/N7alPtPsEw5aJkFmVrELtIj4hA2fODYkGVYkyseDdJFpWWyuqDGxMlIwL+TU54
	Sp6Qlsht+OZWPWyjGzgoEUeVarFtF6hbaNBPhR0/QpLVfr3bB0wYS7laGW46LJ7zNCjZqzIfOX/
	7W717a1PeFeReIQAg+EzRhcbFHzH6BKemTw5XUDpciVJWP4OTwMlUUfgIMdyuuMGAE8RynZy8RM
	WjTb8yh3sBbqJGH2KrBAqkQE+ZtXMzoWhKAwv7WejohCHyztYwx2bKeTUa5lByfiLMY=
X-Received: by 2002:a17:90b:43:b0:3a7:e126:4980 with SMTP id 98e67ed59e1d1-3ae8979de24mr3720019a91.43.1793434688533;
        Sat, 31 Oct 2026 01:18:08 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm11288897a91.14.2026.10.31.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:18:08 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	James Tai <james.tai@realtek.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: realtek: Write the encoded slew rate value
Date: Sat, 31 Oct 2026 17:18:04 +0900
Message-ID: <20261031081804.218566-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

rtd_pconf_parse_conf() maps slew-rate arguments 1, 10, 20 and 30 to the
two-bit field values 0, 1, 2 and 3. However, it shifts the original
argument into the register value instead of using the computed encoding.
After masking, these arguments write 1, 2, 0 and 2 respectively. In
particular, the distinct 10 and 30 settings write the same field value.

Use set_val when constructing the register value so that both individual
pin and group configuration apply the existing conversion. Leave argument
validation, field offsets, masks and regmap error handling unchanged.

Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input voltage and high VIL")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
An arm64 QEMU kernel exercised the RTD1625 MAIN2 pin and group
state-selection paths using the real pinctrl callbacks and a synthetic
regmap backend. A slew-rate request of 10 wrote field value 2 before
the change and 1 after it, while adjacent bits were preserved. No
board device tree, physical MMIO or signal timing was tested.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60222339726b4..656c281c557ac 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -438,7 +438,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		sr_off = config_desc->base_bit + config_desc->slew_rate_offset;
 		reg_off = config_desc->reg_offset;
 		mask = 0x3 << sr_off;
-		val = arg << sr_off;
+		val = set_val << sr_off;
 		break;
 
 	case PIN_CONFIG_INPUT_VOLTAGE_UV:
-- 
2.55.0

