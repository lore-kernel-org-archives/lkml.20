Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAFE4BFE7F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358261; cv=none; b=nS8VGv5ur5sSct5faiq9rzYQfSiLfLqrId0Xnr12NVHZEL+VfuxMRjJtkkkYGmH8q9+3hdZScTQ25QUPJxOIeM/BTirjfnjOGNGJvG/MyFEgSUYZXu5rBCg8DHg19u04NaxL9FwSWiZFoCu1xJfapZOhfarhQ/M5I8K4knLv0M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358261; c=relaxed/simple;
	bh=8B2fWGIDUgftWpMYtaxbZfUEWzXz+xAFmykfFulfqSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0R3HK5pJgaMSl3pwBQfGtl/ODsM7ophwjdLDoAaFl9yH8nPCtLfh6JGASGVZsTwUza12yyNpR2R/Ym3jjHt+/fzSGQhByRRVXX8W143pxKAhuFXEDccjBSOBQdMk3667SdpSZhU5M5y7jck9TvJUvzvDIdTlAOO4PXLNU5aFMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=0OTeV3xG; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="0OTeV3xG"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so561168b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790358255; x=1790963055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aslm3Yn3BYgx8V54FZU0TWe6uKvDrpLLy9fax5L8J1M=;
        b=0OTeV3xGr30TJvyyGZz8L4AFRkV9I6IILtbxmfuxSBwpEL/2fOrxIgziedfmcd1EgL
         yiHLkN0wL0WpTir+drF1gCn+5Y140QRCYAsNJWf/OeyIZUyS7p5k9FJlzXXd+Wzv1j+J
         a+Nv1WEH968XBj80MWCWmp3F5lJf7HNtPO0C6qu0BNoWwN69A9CdPIvkTtejh/1rJPNR
         bN7KhbXWOw3CNOJRf9IitlYi9MqoZhudSnfcGYFayfJKdda24FL39oHOjVlO9OHC4N9H
         Be3OJuIdgIw4V7StQY4SuiN5925XaGkBYQodIXUGdvNqenUnmMGhRP/MgveniJbE+HEb
         7AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790358255; x=1790963055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aslm3Yn3BYgx8V54FZU0TWe6uKvDrpLLy9fax5L8J1M=;
        b=gelniMI4Q/Wx2jXu5+VBYr/+CZKcWJE2l0cirdhWHxKAm23gpf2wa557A795rPl1BH
         1E7ACxt8R2ImX3EN5Nj+S2tycY3BX8TEH3x+P061Hqa2fMp6zDcpjzUKKaAIpTKG1WzM
         s7pGQuy1Rk3JlyGiSK4t/pFNQnKsUXdd6V2EiODTDMECh/ILvQMsadwTO1ojRE4azzWX
         6hxv2d6dff+LJ3qJ/Rh6vh7Vk3KttK50Kx6mt7l8M9zof4ah3RjFXj1V1oyHUvrxmia1
         UJsw85Drqkw4sDTeVHSa1zu8iU2w7IQMOJaj+dsmRHsjdnsWuJkiXkrmgSc3ZUp1Bk2C
         hXlw==
X-Forwarded-Encrypted: i=1; AKwUvBzwUwrqQwEI9e7PqmE1l4TjsR8Bi5+ZgEtdU8oi6hLZDkruO9pt1iVO0ko+K6n5xBNdQlZk4q9uFkWufZk=@vger.kernel.org
X-Gm-Message-State: AFuF++mVdtRb/F/tOiHhPN7Dj3gKDfwPJ8OSYpgr51ZguNCU49QregD1
	G7WScTx65w7ezlOxZ/9QCMb9Vb41BmWU5GWZRWRFSTYZUvRDwB1S4vUdJ0EgswKGoes=
X-Gm-Gg: AYBFou0I00ZI8vPlk3Jt8LPlAoNBjy2yKtbBQlNPaJTplq1w76FLOwKCl8QSjJvwXYH
	3nWhe0DfALWXXHyfa2lJEgdsojOclaqnjk7GcT2JV3P0H8yHe4I5pgceQ57HwHKdT4qKoHpeWDo
	A5gYg5UD6bIDp8QXwI0BRyeltF/HzY4K0iY9zmK3WpCzUOzMH9SHzkWbx5gtMK+qNr9ixM91nG2
	3ck55uLDcggk4vxxeHmzmrs77Lr+6napOq04u0CcUvDWsZvfhXhijx1AkaKvyWW8egO3y68CGUI
	2NL9G88dBDI2VfZsFXWwjtOI/mA9OJMAVOopvd188stFbMZfCN28mgGxa6poYSA+rBBFtWcrF6y
	1NIF+iY+q8DIsLbwlrvNmNOyEarXH7O9W54DSW1aRBXQpFxXv8+wlKsINIV9P93odDodK0M4WXi
	aULhXrcrR/jO49Ae7EJ0icqkU13G5DbV58oXeSWIHdGxQCrgicHyXK+jf0oFeI3FRpecG7B9+gm
	u/6zyHjhicEdA==
X-Received: by 2002:a05:6a20:6a28:b0:3d0:868d:8ccb with SMTP id adf61e73a8af0-3de0e725d69mr5559430637.13.1790358254568;
        Fri, 25 Sep 2026 10:44:14 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4a::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm1686953a12.13.2026.09.25.10.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:44:14 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [RFC net v4 2/4] bnxt_en: check HWRM response if completion never arrives
Date: Fri, 25 Sep 2026 10:43:59 -0700
Message-ID: <20260925174404.2789072-3-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925174404.2789072-1-joe@dama.to>
References: <20260925174404.2789072-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a command is sent over a completion ring, __hwrm_send() waits for
NAPI to consume the completion and gives up if it never arrives, without
looking at the response.

If a completion is not posted within the timeout, check the response
before giving up. If resp_len is set, the sequence id matches, and the
valid byte is set then the firmware completed the command and only the
notification was lost. Fall through to the normal error_code handling in
that case.

Several seconds are spent waiting for the completion, so a response that
was written at all is complete by the time the wait gives up. There is no
need to poll for the valid byte here the way the polling path below has
to, where the poll is for a non-zero length and the valid byte at the end
of the message may still be on its way.

Log the response state on both paths so there is more data when this rare
event occurs.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    | 33 ++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
index 5bfabdca7d0e..4feba90f0bf6 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
@@ -582,11 +582,36 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
 		}
 
 		if (READ_ONCE(token->state) != BNXT_HWRM_COMPLETE) {
-			hwrm_err(bp, ctx, "Resp cmpl intr err msg: 0x%x\n",
-				 req_type);
-			goto exit;
+			__le16 resp_seq_id;
+			u8 valid_byte = 0;
+
+			/* The completion ring entry was not delivered for
+			 * some reason. It might be possible that the command
+			 * was carried out even without a completion being
+			 * posted. Check the response before giving up and log
+			 * the state.
+			 */
+			dma_rmb();
+			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
+			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
+			if (len && resp_seq_id == ctx->req->seq_id)
+				valid_byte = *((u8 *)ctx->resp + len - 1);
+
+			if (!valid_byte) {
+				hwrm_err(bp, ctx,
+					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
+					 req_type, len,
+					 le16_to_cpu(resp_seq_id),
+					 le16_to_cpu(ctx->req->seq_id));
+				goto exit;
+			}
+			netdev_warn(bp->dev,
+				    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
+				    req_type, len, valid_byte,
+				    le16_to_cpu(ctx->resp->error_code));
+		} else {
+			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
 		}
-		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
 		valid = ((u8 *)ctx->resp) + len - 1;
 	} else {
 		__le16 seen_out_of_seq = ctx->req->seq_id; /* will never see */
-- 
2.53.0-Meta

