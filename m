Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEDC48F015
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101465; cv=none; b=jpmm+HzD35z2tmjEyIzgGGWfdMmnQw8Gv9SJz209dz/Lcpugc8E9NxioOYnjriqVsTuWnjgineYiVlmhWrz6W2aClWDvVwFZ0F3TEmTLKls57j7nnr0HVUW9VcVrJsH1sk7w2ISYowOxtaATF116DgBub9DA4uitlsueaLgm6Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101465; c=relaxed/simple;
	bh=wJWRwJSOwUJCCW1ziry9J4YSKqISemZjbWRRzBnqnL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otKxrk3ggQRpZG3xLLG75J2k4BwvXtRDu7hc6qlX89UU/GrQbfV6FPBtjXY2ORFHdEIGV0bIJE5Iv9MSJ/6RQslP2hQ1E7etHexIR1NNwgmIwlt7/om3iG1Cc7s5VE7CXlMHLUYyN8Oo+6LLrhR0xr7YBDbzuduUtHo8/3bN3FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=ehSt+aNC; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="ehSt+aNC"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so131423a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790101462; x=1790706262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xO1R65BfMNPc/29NEB8dWdJDbp318jymstIuoTuu6l8=;
        b=ehSt+aNCK/bSUvRlxLpdEeO7iKohkTqoNcwVpCMNl5h/8SyiZm9/7SunT93QhIsRZC
         EICjEjE6yChy1mY9QnF3/3vP2NtfS0Zl+dmPynkr0pQZd21MPA9n37KqxglL0X01K3N/
         2fb+bUfuwpD0hLIf3kNAklxVg/3rGOZgzC4ZIZ4P33K2etSmLdEbO2c5eeJ6f00BVE6r
         KpcTaAQMOX8hKDC51H6K80p3Ye1/Jb2j6jSRRzzO82AVym7G5Td5jIn7t7vMcGWsSfFh
         RfwKkHWcXW+W7jueoUSDwO0FBtftpOwZq9O4HZuGViLsoFLGQBc0FvxoQbqmnFGpoGht
         7hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101462; x=1790706262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xO1R65BfMNPc/29NEB8dWdJDbp318jymstIuoTuu6l8=;
        b=O7jsBQeENBuzgTbA+1nwZVbY+lTwoz6MTnsTbrs9YqExMhnyY4DIeEZu3u2jEaj8xV
         Fe6ipbvcPjKgE8/3QgoOCuIDqH2F8tSBNkYo+28VbfxdcIgSkYt8KtGttyabODVJqiKg
         reAS1sgCHjrd3J8YuM/lgCRTvXe6pss2VB1ZageRHYR5qEdmG97n4sQOnCvJVBsJVWou
         cN7wmN6JQHrRj5mSVw6I4Ja/C3d9hKAfENf/AdioQF1UWXaHDH8/e2ugV0PeIq3tyd5T
         303sWa2QTmd1bucWpYjbL59SbFF5nqXOEtpHXwtSqJ1qvtfseElxclbwhJWv8mv4UPxW
         veWA==
X-Forwarded-Encrypted: i=1; AKwUvBwwdrhogwwtGVKqj2ICvM9vFuKuc2IMlBBSFgm0LBKBaNp+36lW0tHap3NdXNrEWQSr2GbFEWwHy5h4o9E=@vger.kernel.org
X-Gm-Message-State: AFuF++kiypwE78f0dO8jitZWE5eAlPFezNn7UnhGBloPgUMF237cHtAc
	+GDDV0ITed4XtWDDawgCYQT3NpMP/P66Qc4txh7eUNikqI+Gh1VyGzgm/9dbr4EVjzU=
X-Gm-Gg: AYBFou3sy1V7cIb4uIdjidAvG/vTqTYunE15/WSV0ALF70zedqQr7waagXhQYxFXZGv
	xAmHEJPXrwlfG3C8bX2LqAT3bWRTPgjLgm6GvKCvMfFuUclk5QCfSuCHbF+Sc+vRqnWoctoHuoh
	xNvtLM6OYP1Au9NaDiQMJV/IL/I2SzGneGfhhhvqmzzeSlM9y1FvP9kTmMf3Lb/vjrVCgshFS/X
	cCu5EaEkci805vI5dRV8giOr0Nf89ieHcsVJ1MEoi69BRD0qB9WLDIr6zLiYNRwpbQXlx5vBBQ5
	I/GP1cnNdH8OQgtcgjJDdpnceXPA8iwSrhmCw7DJzDuwTYMpXvWBsd1zmVYxiuMK3qg1WOfa2ee
	yJxjwRxwjWdbbwdksYk4qjc+YhwfVHJWW++Bh4B/8/HfnAgdCGokwKEXN5a5ylxhYTuHUFA/HJu
	OqgFL0uNu8i1vVgrsfT9Ocx2XXRMyqeoR62ViX1MhYnZT4GI/fVb8=
X-Received: by 2002:a17:90b:4a45:b0:39e:6c6a:4b6c with SMTP id 98e67ed59e1d1-3a07e6bacfdmr240793a91.54.1790101461609;
        Tue, 22 Sep 2026 11:24:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db883b5sm663652a91.2.2026.09.22.11.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:24:21 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [RFC net v2 2/3] bnxt_en: check HWRM response if completion never arrives
Date: Tue, 22 Sep 2026 11:24:02 -0700
Message-ID: <20260922182405.1290749-3-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922182405.1290749-1-joe@dama.to>
References: <20260922182405.1290749-1-joe@dama.to>
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
valid byte appears then the firmware completed the command and only the
notification was lost. Fall through to the normal error_code handling in
that case.

Log the response state on both paths so there is more data when this
rare event occurs.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    | 75 ++++++++++++++-----
 1 file changed, 57 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
index 5bfabdca7d0e..c494abb71c51 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
@@ -456,6 +456,30 @@ static bool hwrm_wait_must_abort(struct bnxt *bp, u32 req_type, u32 *fw_status)
 	return *fw_status && !BNXT_FW_IS_HEALTHY(*fw_status);
 }
 
+/* Wait for the firmware to set the valid byte at the end of the response.
+ * Returns the number of usec spent waiting; a return of
+ * HWRM_VALID_BIT_DELAY_USEC or more means the byte never appeared.
+ */
+static int hwrm_wait_for_valid(u8 *valid)
+{
+	int j;
+
+	for (j = 0; j < HWRM_VALID_BIT_DELAY_USEC; ) {
+		/* make sure we read from updated DMA memory */
+		dma_rmb();
+		if (*valid)
+			break;
+		if (j < 10) {
+			udelay(1);
+			j++;
+		} else {
+			usleep_range(20, 30);
+			j += 20;
+		}
+	}
+	return j;
+}
+
 static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
 {
 	u32 doorbell_offset = BNXT_GRCPF_REG_CHIMP_COMM_TRIGGER;
@@ -582,12 +606,39 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
 		}
 
 		if (READ_ONCE(token->state) != BNXT_HWRM_COMPLETE) {
-			hwrm_err(bp, ctx, "Resp cmpl intr err msg: 0x%x\n",
-				 req_type);
-			goto exit;
+			bool completed = false;
+			u8 valid_byte = 0;
+
+			/* The completion ring entry was not delivered for
+			 * some reason. It might be possible that the command
+			 * was carried out even without a completion being
+			 * posted. Check the response before giving up and log
+			 * the state.
+			 */
+			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
+			if (len &&
+			    READ_ONCE(ctx->resp->seq_id) == ctx->req->seq_id) {
+				valid = (u8 *)ctx->resp + len - 1;
+				completed = hwrm_wait_for_valid(valid) <
+					    HWRM_VALID_BIT_DELAY_USEC;
+				valid_byte = *valid;
+			}
+			if (!completed) {
+				hwrm_err(bp, ctx,
+					 "Resp cmpl intr err msg: 0x%x len:%d valid:0x%x seq:0x%x/0x%x\n",
+					 req_type, len, valid_byte,
+					 le16_to_cpu(READ_ONCE(ctx->resp->seq_id)),
+					 le16_to_cpu(ctx->req->seq_id));
+				goto exit;
+			}
+			netdev_warn(bp->dev,
+				    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
+				    req_type, len, valid_byte,
+				    le16_to_cpu(ctx->resp->error_code));
+		} else {
+			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
+			valid = ((u8 *)ctx->resp) + len - 1;
 		}
-		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
-		valid = ((u8 *)ctx->resp) + len - 1;
 	} else {
 		__le16 seen_out_of_seq = ctx->req->seq_id; /* will never see */
 		int j;
@@ -647,19 +698,7 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
 
 		/* Last byte of resp contains valid bit */
 		valid = ((u8 *)ctx->resp) + len - 1;
-		for (j = 0; j < HWRM_VALID_BIT_DELAY_USEC; ) {
-			/* make sure we read from updated DMA memory */
-			dma_rmb();
-			if (*valid)
-				break;
-			if (j < 10) {
-				udelay(1);
-				j++;
-			} else {
-				usleep_range(20, 30);
-				j += 20;
-			}
-		}
+		j = hwrm_wait_for_valid(valid);
 
 		if (j >= HWRM_VALID_BIT_DELAY_USEC) {
 			hwrm_err(bp, ctx, "Error (timeout: %u) msg {0x%x 0x%x} len:%d v:%d\n",
-- 
2.53.0-Meta

