Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150785;
	b=WJdZmQTyB/098fDVBppjJ1ChRJjp9HowAX9GHSdVXX9xRv7oS4M+sCaYVfc0gPILagHI
	 ExWKjHngulPeDeY74YtUIixq/r4fqeBfKZIerF35svh23jpDX4ykQF/aZ0vQQcskDczbX
	 t0reqgoBHVq/XOdB/P0A83jItnGfwN4LB+BoeW/PDL7Hig5cVXlLJ9dpx6NDFP+BJ6HFW
	 gVLduoBONIQJ7T+e4gLESLyVwnGoga1cB8a8uXvqfilvozxXiw8v5ViYO+jONqAPov1Ua
	 GbZbKRmgRpC1Em9Q8IrB7T9YGTooYGFqoTidBjQwkARu0HdDDNgl1CE66/wsUvL3Txw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uOuX8lmp0xof0e0xCWW+uMkqG0cNoPc1tk+upESwVAA=;
	b=40Ii5wuHU0kiicoRlHASgxfq56EuqK8uGrJeYK3tQ5jNVFO8eqRAnBT9iwgVt/1Vm7WH
	 EOzQX46RKVwgfg3dvhG22C+OfaeHO6JbQTcOxC6QPRHApX1V5fWy4wStN+uAb5WSYZVzp
	 AB9q8rW29V0O8M52bocZ1GaKImKlEXudXS2oLLSxP+Nk3lfeu+cuHb/Z8s6536ZMqWrN4
	 PiEWkSFt8077lszk9hsNYL1MnUFKhda0eWfF/sfd3s3eAbIXoS6+tguStANUKUipDwJC6
	 sH7ejHA1oD0vgOTVLtxqZzKpGL/18g9ASDq3xax86vSQVzQiDZrYvuJgnXXb6PtSOGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wD6nmJjk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB82D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB82D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wD6nmJjk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso3562635e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793150783; x=1793755583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOuX8lmp0xof0e0xCWW+uMkqG0cNoPc1tk+upESwVAA=;
        b=wD6nmJjkfOYRuScAAjWuroVnw8/yb8cS2myqAQz8AU6cn6hJkgnYxaQpjxl6D9mRMJ
         ZcFMgRHJ5n73SPLY5hE3oPlainPIQ32aabs5/Mxinv4xNdV0R/0GdT810Kwqc9Wy/EnQ
         qrMdqyCIlZXQ+Rux1I0L6w7iCGx6F7GJGDyF7v9+KHClhIml6bdDHOIBYwd3mJhMybRo
         zOIVMSncRPdj2Na19D+2eikNW36sXxRY/PmjRoU1FI9D299oP4KeSoVGJa3t8mtHK8cc
         E9J6Oj1RDgUTrpn8i3Pnmg/qojF1p5V0l2cjZOyAKigv9Z0dMRnemAUvzY9fLpGiM58T
         bY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793150783; x=1793755583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uOuX8lmp0xof0e0xCWW+uMkqG0cNoPc1tk+upESwVAA=;
        b=Gm6RvHEU88fntAofH16mvo3rs8tb+kGY8M/woVpOmb8G+LHhtlpbFhP5h+4kihVhF9
         SDFc93seqeQ7ZpxhWe+lSZh4HsX/RvEt+GwLP5vfu+tpCYSO/xqo7x7QV8PB8pQKjdiF
         CVme9defkeXx3I21THqyjxiMYSwolry/oFHopX197wvFTu9ZgtxlUjAS3VmuNJk4StTM
         RyJa8+fFHndR98fSvLheEr82guPW82QsHdLxvUPwEEwHSxyrQ9F0CSnus9oADtjYd/u8
         740Sl7i92jKDcgrVJAVYEINI/tI/sjjapDzgly19VxOHLp0H19r3/YiIYhwFzd59shfC
         IP5A==
X-Forwarded-Encrypted: i=1; AKwUvBzml8klIHdUPfut0WMdoMVIfbNAJsQtDNHnMGzzOSOzILUsyxibbfzySseYXeSRSEYhVLaM6ksaQVhajdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3F4Gd6MFP08hzb5GvIAwem4iAO7fJ6q8CzvV6Voze/bI4b3Li
	2jSt2Kdw1111hDgKwrNDgH+JqO+oHnRODHsKHeBlunlL2EW0vUw1tKs=
X-Gm-Gg: AYBFou3qLWU5bTQgzaHoSz1gixs15Hoe5ZWI33T11YwVy+ZpeZKv08Z2HXpwFpOfyjW
	Qx7o8sD8Ec67Q1ew3RkUbVfaFjvIEm/D6+GYxpO/VW+A7nfe0Uc3LbgKNvEDNjzItT2U8OonfZD
	q13iprr+k2naKlugoextb8fXdyrErI5FXPBFt4BmJn4jjtes5YBkOwdscwjeP5xspegKqp0KL4E
	LY7ThYEQyl1vGgdv/NiSw+3ePC0DAKH+/H+63xJXTxL0QkEYWaZ6Nuaq1+NVTrJbvg3Zz+vcB++
	rStusONds8ss5DhEtMpRso75iYj+ZVarXEnSAw06GPsrS9FRWOWD/ACbMQDg9z1ycbulcUDYn9r
	Y4UnVmTqRsCxjkGsjaen/gaJLn5mrbFu+3P9AOYFp6lVhPfh6jKGgSntchl54ZcWEyloGA3RGzK
	OHKwJp7xUbZdPSZmCIlan388qQyPPUI9hEcSeZrUlbE9fstsGBNOdYHwrEk0tLS835uV9RLwQms
	5odpaewlnB8iOUw1kvSEaQxrhA9QfxF0hjjQ8MwURBXTvV0MzhqBx+KA6n+pIrp8FHAZFRJ2hrT
	q4tv9M5HO6o=
X-Received: by 2002:a05:600c:190a:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4a966586d1bmr13640805e9.12.1793150783182;
        Tue, 27 Oct 2026 18:26:23 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c9f150fsm7935155e9.10.2026.10.27.18.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:26:22 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	linux-wireless@vger.kernel.org
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless] wifi: nxpwifi: validate scan response TLV sizes before indexed access
Date: Wed, 28 Oct 2026 01:26:20 +0000
Message-ID: <20261028012620.3762590-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025181531.3744345-1-tristan@talencesecurity.com>
References: <20261025181531.3744345-1-tristan@talencesecurity.com>
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

The scan response handler indexes into TSF and channel-band TLV arrays
using a loop counter derived from the number of BSS entries, but never
checks whether the TLV data is large enough. A firmware response with
fewer TLV entries than BSS entries leads to reads past the TLV buffer.

Add bounds checks that verify each indexed access falls within the
TLV's declared length before dereferencing.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
  - Fix From:/Signed-off-by: email mismatch.
  - Add missing Cc: recipients (Francesco Dolcini).
  - No code changes.

 drivers/net/wireless/nxp/nxpwifi/scan.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/scan.c b/drivers/net/wireless/nxp/nxpwifi/scan.c
index 67d7ff2f10c59..a8d3387320af4 100644
--- a/drivers/net/wireless/nxp/nxpwifi/scan.c
+++ b/drivers/net/wireless/nxp/nxpwifi/scan.c
@@ -1999,12 +1999,22 @@ int nxpwifi_ret_802_11_scan(struct nxpwifi_private *priv,
 		 * was received.
 		 */
 		if (tsf_tlv)
-			memcpy(&fw_tsf, &tsf_tlv->tsf_data[idx * TSF_DATA_SIZE],
-			       sizeof(fw_tsf));
+			if ((idx + 1) * TSF_DATA_SIZE <=
+			    le16_to_cpu(tsf_tlv->header.len))
+				memcpy(&fw_tsf,
+				       &tsf_tlv->tsf_data[idx *
+							  TSF_DATA_SIZE],
+				       sizeof(fw_tsf));
 
 		if (chan_band_tlv) {
-			chan_band = &chan_band_tlv->chan_band_param[idx];
-			radio_type = &chan_band->radio_type;
+			if ((idx + 1) * sizeof(*chan_band) <=
+			    le16_to_cpu(chan_band_tlv->header.len)) {
+				chan_band =
+					&chan_band_tlv->chan_band_param[idx];
+				radio_type = &chan_band->radio_type;
+			} else {
+				radio_type = NULL;
+			}
 		} else {
 			radio_type = NULL;
 		}
-- 
2.47.3

