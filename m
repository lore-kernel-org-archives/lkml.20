Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887390;
	b=EVgbTft9UXB24JxOFx4/s0fqq9l0/ZZzBcwzv3DIEUI/TWewypApUp2bUjLYZxy/tfaN
	 pKdDBSpsw4T9briFKC0JRAHMbiIaCU5VZkzIqwL0Tk/CQmmc//KH7OZ1DQO2eficOi2ms
	 D2EhcQALABHwEebKWaPdFBwHhj/7wvjpyo0CrIj3ja+zwZtA0N9H9lKXlWNg93eu/5Gj0
	 /NrPhLpzCsoo4ZtCHcl/HEZYY2cFMUmxJH5bH6FD+MpWVVrPbnvtUfiC75nuf2wHN5wjH
	 zUG/AT2uvcVsx/EDCXbQ4XtYE5ZbliDnhsSFz+CoSMLW49C20k2fRY6EH6bxKIWg89A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RRfNWo7QpY2x+rpM47udJSSCiW+Ce4+mjWwNqpYTpZQ=;
	b=kkbXeVd67BFsf0QdN1xJ9qOdCdXAW7cruzd30sMWan/SeORoifsqBnNGXMPzjvywsRC1
	 DseBEFml6gUEvFyvvoFQU45sdWEOAKCfbUQ1M6K0Gr96EzDnk8K57npaWhd/hGuY+DQ2K
	 fKuTdlZrhoykewWzfi03ao82uA1nkER3IjTtpeNaboyoxKQZ/++JtES3pnp83NR7K0Mk9
	 AVf0a/kriWk92S99gBcLqmYLpCm7P3/zmVKPcgNzlzK26gfB/8BjntASPFrh2zJvnJN36
	 WWG1R2+7HTKplTbtCoYg3Z+ouPRE6h+4PjOBgtR9UrgNfs04QCtwTMPKyumxcj5uXpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McDxFBhB;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78051606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78051606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McDxFBhB
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67db0791748so2265317d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887389; x=1795492189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRfNWo7QpY2x+rpM47udJSSCiW+Ce4+mjWwNqpYTpZQ=;
        b=McDxFBhB6Log5D5VyjNDBUQFQ4SUCCG6L0Uc1yzkukzzhDtE3m9iEwIuh182cb8hKG
         p7ufeb57SrxlCttBBNFhkP3ia4e2o+rGrMNv8tsSJaD0X0RYUIKNjy/KtJVccbV1B2BT
         V2s728GkipBMEYF78J2/tsgxmbFx32stZUae6P5uxLNhZhlYudP0SgIo1ExyRpV3lAFu
         +YaVgkISbgQ+oyXdJTmd+XZ4NrKbv+NiwnBff9XUi11n6btgX0HDN6mLrVPGmnCm0tXp
         BKtAiFZYF+/zhBZebn5oYwDPW1EqKYhQuQg++Dl5dYItQtltmwEHoR+4SRy+m+e0i7SJ
         VvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887389; x=1795492189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRfNWo7QpY2x+rpM47udJSSCiW+Ce4+mjWwNqpYTpZQ=;
        b=ctGW0b8t5NvYndhROj/q55KVa3N2LtIglWkLT1bGB0nXc1jRNpW0sXu8DAAJCOnfD0
         lJ184V7ea51cUr+6qsIkuG3o5gArhT0ObzURu+NwjFLzT+KjkU9pv3aFXz0kT+xw7AoZ
         U4AX08LQ9uM22OB5ISQT0eJvWpGIek+4zG3SBRRod+5oT+RXqjqqfVg6sDymjuHoEkpJ
         LwsxaKwGv6rclZQyTRX45OaespiV/xMeMhERL8cs8Mku+tBaoYZuq0AvyLqtwVHbZcXz
         SdoiwRwprjt6iPxcgUxO0/U1ovoQYi9th7R9BU1pR6LJjKxwjT6KuFOYwqgotUZaehml
         aCsg==
X-Gm-Message-State: APuU4Z+bfAozJsWMct545bey5TQWGcDsjMIvVGD8Pvj/24UnAY1BhZdk
	McMl1SodQeSMw8K+yUOxF32DvZdR1QhWy8maZhu9Px9uWmyPnpzxIaJ3
X-Gm-Gg: AZFdTZfIe5qvltobu2mb3OQi+foB67MZ+BispeCXCN/mrP0icpxeIIw17igbgLntSS0
	sF4jPAIyOsURgPCAVlMPGLC8B4DkW/lCH1XCRo1x7jJ5XGXgIn8ofcKE3x5jYOk3Etrrv8B2fmi
	ZcYDQ4oX1Mpvumo/eKAk++XVf7AnIclqiDsNFzH/2E91Oa7dZNAjvWa3I48Vb/vuzZwGavCpJPE
	qvLQJ6Ab4PtpH4vvnyS/2Cok44TjvFGYOgl2VTFffazQrPaq4k+muABa37KrFKnXcEHokwikGng
	4JJ1vvCFvd/UohBxaIGLHYZ+RuNhYa1mDUmuH+GSrtdjkoADZU6/QalK6zJUek8/FIJkP1BnTyR
	ei/WNw+7V4EN7IToZXOOvaNZtyvrmssTS84aNJTwiM9emtLG/cC5plqZ3BQmFFA5mXIKZ4h/r1Z
	0c7yLuQsmrWIfqqowEEwhg71gCfguRdlaGJfkkSh9EYWQIscBUarEaUU5AelZYWzpjfokJe8bLS
	zofiFHsD0xiy7aqA1aq3aL8xP/GrpbgBXXTJHfjccI69Em4QaDtbgZ/KNBo4SoXYwZ+An7gJ0BN
	31wf8H6hr7I5onXKrf9dFxXZEzHvsTgt9zolQZT5iMHd2SizlAo94Z9JJ0oYAiHpYNvS7KyYw13
	LhblMyTYJKPJqnPwYl+8bqkTRkdOB4I73RPRt1NH0wgJqkU9Q2vLx/GQP0bWYWJu84LmS69gjVM
	L76qdOFLvghXIgsMU78oIqs5IAHvqys4zPy/7sPuaATmgS3m11aBKkiDUvfCY6jj9D6YPhJQB9X
	kpSqrqsI5PVcCIhW58=
X-Received: by 2002:a53:c0c6:0:b0:679:b50e:9a with SMTP id 956f58d0204a3-67d897d8ed6mr5566347d50.108.1794887389272;
        Mon, 16 Nov 2026 19:49:49 -0800 (PST)
Received: from localhost.localdomain (104-12-105-135.lightspeed.miamfl.sbcglobal.net. [104.12.105.135])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec306904sm15108597b3.43.2026.11.16.19.49.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 19:49:48 -0800 (PST)
From: Jason Perlow <jperlow@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jason Perlow <jperlow@gmail.com>
Subject: [PATCH RESEND] Bluetooth: btbcm: Add entries for BCM4364B3 UART Bluetooth
Date: Mon, 16 Nov 2026 22:49:47 -0500
Message-ID: <20261117034947.14803-1-jperlow@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The BCM4364B3 combo chip on Apple T2 Macs, e.g. the MacBookPro16,1, has a
UART Bluetooth controller that reports LMP subversion 0x3032 (001.016.050)
on some units and 0x305b (001.016.091) on others.  Neither has an entry in
bcm_uart_subver_table, so the controller is logged without a name:

  Bluetooth: hci0: BCM4364B3 Trinidad Olympic GEN (MFG)
  Bluetooth: hci0: BCM (001.016.091) build 0115

and the firmware lookup only tries the generic "brcm/BCM.hcd".

Add both subversions so the controller is named and its firmware is looked
up as "brcm/BCM4364B3.hcd" first.  Tested on two MacBookPro16,1 with a
v7.4-rc3 based kernel carrying an equivalent change, one reporting 0x3032
and one reporting 0x305b.  They now log:

  Bluetooth: hci0: BCM4364B3 (001.016.050) build 0082
  Bluetooth: hci0: BCM4364B3 (001.016.091) build 0115

Signed-off-by: Jason Perlow <jperlow@gmail.com>
---
Resend: the first copy was line-wrapped by my mail client and did not apply.
This one is sent with git send-email. No other changes.

 drivers/bluetooth/btbcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 065536d4ec..92ba7aeac3 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -519,6 +519,8 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x2119, "BCM4373A0"	},	/* 001.001.025 */
 	{ 0x2128, "BCM4384A0"	},	/* 001.001.040 */
 	{ 0x4119, "BCM4384B0"	},	/* 002.001.025 */
+	{ 0x3032, "BCM4364B3"	},	/* 001.016.050 */
+	{ 0x305b, "BCM4364B3"	},	/* 001.016.091 */
 	{ }
 };
 
-- 
2.56.0

