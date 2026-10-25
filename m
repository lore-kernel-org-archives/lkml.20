Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960320;
	b=vtyCYe5SV62rTfvBewnlUlUBK8yDcJpMBNqWxh3Rk7TU/OuJEFFgbgvnPossmmXpj+ob
	 oW+ASIC/PN2D3GSPXoWXwXSnSvmHyfdBUMV7sJJmroQnRZuFr0FIkOveRKNr75mpOe/gh
	 TrghaWfNgq76vegyC0nGgQJFKqcBei9lKUYznSyG20/ipi+UDCKgPOGuF4191LXii/mDE
	 qbbYab0w1IHt2CyjWiLGv3tlAU1dh2xesiuY58mqmRLVWCVPSkrWUh9cc9WP0Iz2n+ild
	 z9Rhiy+Tqx1oRZd9ynRnY76GobxQi2upagNgXUb1hXYeLGLpk+n1o4qQ8IKo0ltgZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vJIpz2IR2uKayeqq1B9k4Uy/SxrEV0GO4KqXaU7mgEo=;
	b=NZ3o34dlfI8RutW8MBt3hkJgrkqU3jMIsv/F0YuE4xrqFTS/blGraT2HH/cz22+oXcv6
	 MRJ+rufU4I5QEdJKdBnBHgQY94SR0JQ9YJNW/nJc/JYOUZxEdcOKL5eWmihwRKq3BgVZL
	 M1x1xMlQc7hd7a7F/sa3VFG0kevEoMpDjWI7BX2AglSKzRqyhfSE0ztowmeIz3j0qwqBS
	 rG3tl1gxUIr6RHav3b9dy7L3YEl/mUt9FSwkwlLdi5SA9fTr8VNhCIYfY+cmh44+GXAR8
	 Llom/Z9kdlEJnkjjF1bga4bMYPfIMYPzZfwYQQfVL3OYHH1bTE9VC5uc8/xYtWjJuHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ce14jaf8;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D8606A326
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ce14jaf8
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso5930113a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960318; x=1793565118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJIpz2IR2uKayeqq1B9k4Uy/SxrEV0GO4KqXaU7mgEo=;
        b=ce14jaf895Ti3kambPTJBFMPUD6UgUFBX3aXbnMuWOgqgRyC09OhUwMm/gSWWfHUKS
         8nxMGygECc7k0F/E+h5Fh/HtNtJKN8OrCVVRrgwr8El7YU6RMW7gxxHLa/Uov9zALaro
         b5kFu6bi16LMTFOy/WkJ4b1+EpNdUsux70gXjwelOXhKrxWHdi7r+xwX1WSAVTdwX4pi
         OV+gP4KWYU63oX93ZkshQcTlsjJ1T5Wwl7mZuNKRVpfnLA05x2reR19gzkZFcEQA5kL8
         whlhkxeGYLfeYrSuMY604MqptkPLP13imaLaCzImos0piZzoM0UMNxNLIAQARNirjXTX
         WoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960318; x=1793565118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJIpz2IR2uKayeqq1B9k4Uy/SxrEV0GO4KqXaU7mgEo=;
        b=lAx4RknNI8ZBRaLHX0u2NbPSZvIeLaHJ2Oi6lpsoduMPTr6JlVefGjffpNQvPNrrye
         25fWkld/cL5WchpW6nszBu2CbVZo/ZuYrWNedqz15TbZZN2eaJSAKq2zaS8Cdha8iFY5
         zK9g/yvjfubsfFgGHlrhEscLCELbwpmoo5TU5p7MKGuyKErrBdVpr0ZQJsbK58y75Rtf
         yd3nRJEiw6ION33c02/6Eten/86llEcjR6ZEJLKt5+H/tf9Kq5axDKCPF1h8NMT52x6W
         8T9IOsft0p8wPItmb+Pre1vYZOpuTe1dEHBl93V+qoL7fqDNPNn004M/0Cp+AIQ8XI5O
         xMww==
X-Forwarded-Encrypted: i=1; AKwUvBxwnZBb/9zBd9/Se1fUZjPcU+HfbHpNJzvAN1Lrd5VGa4GT2BexQaqyVhC/YTs5rLKZdfwpHcOWP2sw2WM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/7g75X2IbxJd2dQvZVWOSGx47FmNquqUkvkrrecm5YbqW8bay
	kyMXuUYLVoXqiZ4XlrcDXY386K39GQdIYN63fQdPxpSlB6/1jbD1zYry
X-Gm-Gg: AYBFou3l/WlUJWij0bjSPbw6HE+vB/qoSaZ+Tf6sJWYCiW/j5hCGVsbcuTS6LzqnPt5
	ovDMEN0HM0O96kWOiqO0K30LhfLZqXYAJ7ZkKKwruAUixwHehZN9QKny+Pn9UT2iJT7O2pLnwj7
	tEnjeblFs1DNSC0z+CpZoNghxgmPESnfKcTc2BytOrzUkWNLtdWIL6B2jXA73eVvLIVcekfGgGE
	/DwkZIMP+sddurzrX8Nymo1/BeADOqRJpk9yTbizWkdQvuC5NeGp9VFgWrqL18v7wTQSpUNnNn8
	TMUEh5IAtuBB1djD5WkIdPELINsXWqZxXnU+7GkQWvnNh3G88ncWNKVCkFRKyGDXQ8DnKDOtO6f
	Tnw4sb5A+LrW2uM6jsOzvgDCTXEZIXUy2iZnrAmDTqjgt2OxLQnPHMu7IIbtASHjWcGkUcA+A6A
	dIgBPDsHnBAQY5g/yWoZpQqVAcgl/xXU+EjFkW1qAIwUWbspHqVEDinjD/puhlzMR9ktUKdrwe/
	gr/kU0A+NXU32gkbtxHlpgawitYXghrE0SJXJVh2v9usFEPHxnYOV3HP9D/NztVMS56PK6EQhcz
	t4pdCDv8uIA3fBKtFygXz7kSWewJcFUnDfnNERx5z8Qu//2Cbu4JP8sWSl/4MgutNnB7U6QtCHx
	3NE9ioJZbYuMtG6Tgto9RGopcNXg38gCYncb9Uc0PbFHI
X-Received: by 2002:a17:907:7206:b0:c46:78af:6150 with SMTP id a640c23a62f3a-c46bdac6ca2mr638087666b.2.1792960318542;
        Sun, 25 Oct 2026 13:31:58 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350706sm247414666b.3.2026.10.25.13.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:31:58 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] net: lan966x: fix double fwnode_handle_put() and missing mdb deinit in probe error path
Date: Sun, 25 Oct 2026 22:31:55 +0200
Message-ID: <20261025203155.455075-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

In lan966x_probe(), fwnode_handle_put(ports) is called after the
fwnode_for_each_available_child_node(ports, portnp) loop finishes.
However, if lan966x_fdb_init(), lan966x_ptp_init(), lan966x_fdma_init(),
or lan966x_vcap_init() subsequently fails, execution jumps to or falls
through to cleanup_ports, calling fwnode_handle_put(ports) a second time
and skipping lan966x_mdb_deinit().

Add cleanup_mdb and cleanup_switch labels so post-loop initialization
failures deinitialize MDB and clean up ports without calling
fwnode_handle_put() on ports again.

Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 1179a6e12..7abfd97ad 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -1228,7 +1228,7 @@ static int lan966x_probe(struct platform_device *pdev)
 	lan966x_mdb_init(lan966x);
 	err = lan966x_fdb_init(lan966x);
 	if (err)
-		goto cleanup_ports;
+		goto cleanup_mdb;
 
 	err = lan966x_ptp_init(lan966x);
 	if (err)
@@ -1255,10 +1255,15 @@ static int lan966x_probe(struct platform_device *pdev)
 cleanup_fdb:
 	lan966x_fdb_deinit(lan966x);
 
+cleanup_mdb:
+	lan966x_mdb_deinit(lan966x);
+	goto cleanup_switch;
+
 cleanup_ports:
 	fwnode_handle_put(ports);
 	fwnode_handle_put(portnp);
 
+cleanup_switch:
 	lan966x_cleanup_ports(lan966x);
 
 	cancel_delayed_work_sync(&lan966x->stats_work);
-- 
2.56.0
