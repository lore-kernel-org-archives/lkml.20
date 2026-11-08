Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174315;
	b=5SznRBtklbYItkcL1h51QOgKA/RVPrqgTuU7pQH4XNQgdcQWNXQU5nQ42RcMj7FDGNYA
	 jCu0kC15RECUFbYcSA/mvSjcVNfsnBa+pUyeIgRxF+KAtxCDAMz9WFALe861YleFuTGA/
	 eSS4mG1nL7WZMufDZGBXw+V+VLtwKNhltfk1xUOatJMoMk5eTbKgiG4ZXHDg6Om5pAMqa
	 GkMRAvdaGZJlykm/HkV1lAvgZSGtUwsj60Mw9OVjcZHPuMJ18FqiHqWqQzP4MYKb5+X1j
	 urIcDxvkQUA1ZWExURLzkpTzYPocmeuuGLoHsA2J46ENGN/Bd2mkmdyqc5UnoKDmHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xnQeGBiEH8XniaPdtXo6TRG8fMURfPvZnz3uNdKFs0A=;
	b=MVBbd2eIoyGRjo233G+IJYgK59u/7O/BIKuchS2zP9YgCXZXozODt5PJkqiNeF5+7ove
	 PZJ8FgjLfqA8rMPA3VLAJtFNYr8GvzDpfiMuKU6/lKTnJ+357xR62DLa0vw1dhCG6ujXU
	 X+Q3hKpdg36R/tzsLy/egOpslXapGKeOaj08kOPUTE8YmaxeVfhh/vF3QTj2U/HrQ7hlb
	 628rlPEq/xUtuVxO4yDzcBn1ZNM2bY7auPlaG7IRndbfMaUey2+PrXo1KLOXVn49Ru2UX
	 ZvtWrrjDwbz05UL41A7FmYB3H7aeoM07duppeNNbab7/3k1UtUKme+LevCvv60AWWDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="H6v7/uaX";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0653606A33E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0653606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6v7/uaX
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e96502e447so2506865ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174314; x=1794779114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnQeGBiEH8XniaPdtXo6TRG8fMURfPvZnz3uNdKFs0A=;
        b=H6v7/uaXN5ImIlXEQg7Vi6q8sSpAAxtdlzDO2SKtZOWSV3q06KYH46GhKX1BGBKv6E
         iqdycScwfmaFyc2tqEGrxfzDfWtyIqRkp6YwpkOSG7x7A7B8+xcCkPShSbY49mivodLa
         25nFGuVsAOhk1XcA0qBRJrSZUebzRkKRt44cBJFcP+6eg7zlzZ5Mm8CPAKdDKE67DY0i
         AXoAdWSuVwwtcSjg/6rqIPxzDKe/lR9KHiVUxSPbe+VPqjONzeviF2lwhtUaurQfsfvR
         aVr079OutPoSq9jbUrqz8hFfOxd3uQpqGTOzxb08jKnZLwm5gXLxyXtJYFCCgBRiZwBF
         NY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174314; x=1794779114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xnQeGBiEH8XniaPdtXo6TRG8fMURfPvZnz3uNdKFs0A=;
        b=tbnXpTc4m6m7uj8aKNfHv7HBMbYfWuOsGM51fKs42zS87irtZVKpg8GDI7qlXxfmq1
         3pt3Htc/dqY+7b9yfaAIFY0WHNVkizEEO0Gtyv7segVmcs8OkFda2JnIdhc/ETnVQbrF
         etJBltv4lfxVk916OESkcom40/V/gLHhB2uTuAUxEtbvfQjf7RRs2kPx9/kYHlUMiP89
         +z+QTinAXytgdLSaosTQVEzfc2V5A13vz17RqIxFfwF9HFT4VDkrqayOp3T7tg8VwRYO
         FNm2tm1SYrc9Uz7L8t+X7qM98+v5dut0ZrHHWLJAv/dqwIUCrK5D7RKGzcIkQhvRn3Nx
         olew==
X-Forwarded-Encrypted: i=1; AL+hErGD1NyJ6Kj3gLp59UxEAVrsPO2mCHEKqqWRQn2/r5P1Jlztnh241ImG5xXGaQfsje2AQeKXK61Ju33hf+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WufuRCiypJKdCL4MVA1uiN8izKuFGnfghXAIEFa6GRH8eQIeL
	2Bh9WLUh9HyCw3HqGnJAoUNe/CVeQ+ONYxK4KLK2za49WP7k0XwYUi2MwtbYfQ==
X-Gm-Gg: AYBFou3XNStmRhEcRtor6sO1NXjJhv9AR5tikF4zXPlDOoj+g30LNf/Nabsyf8zcHv+
	ZiDlAJlkPbuuswu9OUe/lQHDbXDEh2zW5qlB+Ckr/CmldLQe5HEv2oWbsgfgsIfsIr2a3Gc1h25
	3YMg6tiKPXTPwNhT4c0dEEIMVTiOYJzLZ9Hznt2/1149L2HNpv8u3jNH66sXZghyeeRCaxyuBB/
	/XtMUglbPIseJzHuIKbP1pp1p5oVPUTr6HWRfEzs/6FWua1DJa44YSNGuqCnLgK3tNnEJIQYQwZ
	PjR/WP0IdNfMQ2EVciqOhaBXtUZsKWvbbeHZXu/xkYnSe0a4TWNo3rLEyQ6b/TbVnhSD1RZu/uv
	FwhSgA+Y4d2hueCKnSNhQLrKnwFr49wPZnDgkHOp2ZBAUyKC+jkhIyaQviistIyKUlmEsMf0wdG
	qsdfSx1XbC78jxQ+H4rTfSn14W8fSlwl+bSFM41pxxVJV+dtvaMhmeJCYM9EY4jNqudA5gEyrys
	F/B2CtyY8SdL/RJUNa5ZOolnF5A/yfxRIu4RfK1ccrNKmf/f17wui8ITZLhaN6NVmrm9vMETC7s
	orjDWKqFeLTbcTVZfOFzXvMTxdQ/yAVo8hWa7yqJgMLe4WzPwj8QzRc=
X-Received: by 2002:a17:90b:1b0d:b0:3ab:2d46:1dd2 with SMTP id 98e67ed59e1d1-3b12d1002c5mr2069263a91.6.1794174313968;
        Sun, 08 Nov 2026 13:45:13 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm4619463a91.4.2026.11.08.13.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:45:13 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 2/7] net: dsa: motorcomm: Drop VID 0 VLAN table programming
Date: Mon,  9 Nov 2026 05:44:42 +0800
Message-ID: <20261108214450.1662362-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108214450.1662362-1-mmyangfl@gmail.com>
References: <20261108214450.1662362-1-mmyangfl@gmail.com>
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

The VID 0 VLAN table entry is unreachable for priority-tagged frames:
the hardware classifies them to the port's PVID before the VLAN table
lookup, just like untagged frames (measured on YT9215S), so the VID 0
entry is never looked up. Drop the dead programming.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 693564aeaec1..47f06945b8c4 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2263,7 +2263,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 {
 	struct dsa_switch *ds = &priv->ds;
 	unsigned long cpu_ports_mask;
-	u32 ctrls[2];
 	u32 ctrl;
 	int port;
 	int res;
@@ -2321,15 +2320,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
 	if (res)
 		return res;
 
-	/* Tagged VID 0 should be treated as untagged, which confuses the
-	 * hardware a lot
-	 */
-	ctrls[0] = YT921X_VLAN_CTRLa_LEARN_DIS | YT921X_VLAN_CTRLa_PORTS_M;
-	ctrls[1] = 0;
-	res = yt921x_reg64_write(priv, YT921X_VLANn_CTRL(0), ctrls);
-	if (res)
-		return res;
-
 	return 0;
 }
 
-- 
2.53.0

