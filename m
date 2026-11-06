Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934229;
	b=AMWJvWdBt6iNo/atBxeLxJg8WRT6BbvBowy0o3cFW8W5/0G4LfjQfrqGw4rKPy7D0k7S
	 1i5MNsc4El4TLe+kTGQxvE8cNddfPmlS0IEBv383zntHjG3Kc3SXgIBaNk1YzZ141FlLk
	 kQZkqC8pfpmZNasbpw5+RXKga1e3rbxU+QezVxm83xVVcBxU66TOYRbeAm8nI4lPV2sgY
	 sYeQt4eGO1cwz291teeey4bQ4XZgVyj08+x1VnbjU9Rd4kZa7pyYveujH7cdtQspvBUGw
	 ehob07eUe0RVN44LfxtixyAaV5IhKDy9cJME7U0LWtIyAJbU0Qwh9EXpcY+gA50cvEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=;
	b=QwHpQHM0HN//IqpuBdMg+DcgcGyY1+aHdhU2mYKTt920Qb1sRc8F2dE1ICf6SUh5PI5w
	 /LldBGJSo0a/kIn2N8iagGB8TCwCYAziDJUBxT4YgbnfGiCNXUDaA0v0IyDHM/Dbp4w3J
	 +eno4lnjRRNzfRuwfI46Zyz3k4gxGMwX68jga6zV3lbvaoIr0NIY08KH5+bsVjnixR/Nk
	 IsaN2/631EnPNBYgWGQi19ECzqRen8VYjLdYkUzReOhw7G6+3aLwz4rzIQv47koEHDRJr
	 SpMOYvDZhkem3YaiLOCYFByQq+2l/v7C4JCuI0j1KPyLxpDDq5T1SQYs67/XH0iscmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gzWSAcwq;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B7606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F29B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gzWSAcwq
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b271e573adso67585b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934228; x=1794539028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=;
        b=gzWSAcwqLhy49ecsDFREsKHaaWHQWJ8zNrp2Bm+B3BFf/pmIeWXDVJRzRK5/eMJuz9
         AMstDe2HFiGaARWBczByLHMwCnJ6CCOx4Bmdk/g00lxdsr20PKxQkkfWGCgVeeZ6J35C
         Cu+ohYj9w10k0ADrbOu+vWjABGH9lc6PWFufcbQfHA+o7Jd2IGGoOfgfJCCkleZ5Y5w8
         5QeaY+2fYQZgLmOS6JxEhCv0un+sIrbMFb3/TV6HPNrpfELSnhGQnUkcqoQrHOP2Io8a
         nDTfNyVF9HKiG7m/edh2fJUAcuOMvoQnmKfHoRby8IlDftr+iT9J6ICwmIShKZ6yn0up
         h8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934228; x=1794539028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=;
        b=qMeQgc3+TlgkwiB/DmHwqW/1gXP5PcvRc9G13UC1VNG19ClqJlgP7GjqQnGD6XQh5b
         5byrxe32DpP/d+80mYwDdFMsOx9imCQxruEZQ01l08v/gzlhnx4pmnQjEYmd6lLmeiIJ
         HgLPGn+E9nGrF7JUWA2J+AtSloRLEAKaeunhw8vaIiFq8GK7B9zE6nlqck2iZFX0ckRB
         wdlpe+EQZVeJBSfgVHyVXXBv4tv6aUSMQBXIh1os3OpYp01UpO+IGxm+hYYbYI+XTJKF
         8Ud7PJq5SncLDKrixHjnDo9WgtlVHZCFSyUgQDLeRT3jN//8Q3wDUfzgxtAp0P/NKmjM
         Wjlw==
X-Forwarded-Encrypted: i=1; AL+hErE5WeFglY/esUE6Vi74vuBlI335fuM5oc0Ujx/MIHcRYr9wEQZSY7CSoHN9HmaGmhNc8z7IkUWPnUCvlzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CqvRPhJLcNEkkbAJtgD/boZobhvLJyo65PbQ9hdBNYsl7njBW
	JVT5O4Syy4GGQ37afXzYjYEzIqhT2cuWQBXvCveuF335umikWx9HtJgJ
X-Gm-Gg: AYBFou3TK+dMXBgvNOaONsUaAiXSWAapADgEPWxSDFn3D989BdkLL/816UxnxqVBO+h
	APBGebB3sTGFuiNaegEi4+kTrlcueS+A0JST4/7Y6J366oU/TqBIW9MYnIjXRAw1DeRKP4bTxsH
	IwiHNMSIIG9H4wLVP3SHvUMNNNWM+q1iKVtlD5VUccxCN09/KHZ1EOlTBxOUKDpQbhlCDE5jyDr
	WiazMRcCCvW0iLf7PaalRdNteFr0LeR2obYpNdLcMdBRNiJEf9HDXqPCLQrtStSaMAgw03Wu2GX
	TTRRoDUbXPl6IhjtZMxXNMTTprSzxdltOJadxkEUNSuDOEIBnDJOjAGJAe1O9dkHU61HuJOgvtj
	z+KFvmAdF9/VKGUCOAPA5+RhB3UNidj4Cd+mTyDWrRCq7DhQb6yRFNevZBSdy7LC7qLpTfwaho2
	wtZnpemQI2CVnCTRCEi66v16AsBAORk0D+VKSRKtCFQrsjg0Blfz6dg6DDaBErPwyC4FEBZFHYT
	nTpr1csXa+h9B/RXMd9+uLMzLxlffJlcdXhNWlW/eJyb1/XDgRkd2yVFTKRCW1C5j+NptvmTE38
	zmMFHsYhD6rdBg4QAP2TDXBqawUbJa4UjDF86+P1ltxrcVpUM6j2Ofohmybg8q2yGvk9JiYjRhP
	oGa8dEQ+aStEirZc=
X-Received: by 2002:a17:90b:3950:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b0db6f6c35mr1062138a91.62.1793934228109;
        Thu, 05 Nov 2026 19:03:48 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:46 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 06 Nov 2026 11:08:04 +0800
Subject: [PATCH 3/3] ARM: dts: aspeed: ventura2: Name the USB-UART bridge
 reset GPIOs
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
Message-Id: <20261106-ventura2-dts-update-v1-3-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=JErXBRcaQqttTRbJYkhlXXvroT4ugDdSkuI4a3TfxsQ=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USWOSM+Se8JtxUUwtmuKQLlZfQThISypYBKs
 cRvRTZN/aiJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElgAKCRClg0K3CVbE
 gTnNB/9gX6LuenOCksACETKUVDRyzmW1xPaQiXCUzc3TTNnKY5mK80xYSM49pNtveFr/8gL9L1A
 4ZTufnTHOb/E1VsKBVmkHFP3tWQSskkBAlnMrvXeOd3N+edRLpX63+IKV+eKhChv6SxYyZmc+u3
 zEi27kslPErTUrWnjUKy2O8vpSLYLBLw3NOHCo/nweTGmxqnMat8zZwPczvXM9kS/b9HROaXEiN
 p9E6HlSi8G3q/mdZreGKcID0wHtwd/VagH7BxR4E+tLjYnpX2VVGiblyJa9VgBSu8RnDRyJPyVz
 3t+HZ4TLKxdxa2ruyituo3pcO5ZAB3zSAPQ/hO//B75hvGtd
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Lines 2-4 of the PCA9555 at address 0x20 on I2C bus 6 drive the reset
of the three USB-to-UART bridges. Name them RST_FT4232_{1,2,3}_BMC_N_R
after the schematic nets so userspace can reset the bridges.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index a9c5990ef969..af26256f19f4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -1937,8 +1937,8 @@ gpio@20 {
 
 		gpio-line-names =
 			"", "",
-			"", "",
-			"", "PRSNT_FANBP_0_PWR_N",
+			"RST_FT4232_1_BMC_N_R", "RST_FT4232_2_BMC_N_R",
+			"RST_FT4232_3_BMC_N_R", "PRSNT_FANBP_0_PWR_N",
 			"PRSNT_FANBP_0_SIG_N", "PRSNT_POE_PWR_N",
 			"PRSNT_POE_SIG_N", "",
 			"PWRGD_P3V3_ISO_POE_BMC_R", "",

-- 
2.34.1

