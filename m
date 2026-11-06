Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992483;
	b=as2dqFt0+hM5ITcyDt745gvGNmUugGiqhy6xO+E9iE60Auia1HiaMouKqYyXpWHd5MrE
	 Eaj78b7BVkJ99CbAMOB/MzjlsQywvkOrrlhhohiZliY0pGlLncdPHltBMXlaXLxugNqWY
	 AZmXCAJeace8ctc4Qct0Kh+uf9UjaApbIviWZfLo3UryqgG5pr8XLd9l41IkSCzF4uZcR
	 uQJZzU1/KE2lOpZRXtgMbUP6DgcUgpsb7pEiL2mvdnkw56YTAg111+02g4d/JpUY3wai+
	 kSfkkFDMuAoTVSMvotWy1cjBrGZ15b8SDN9YBQba5KdjQDlrcRoC09OJU7FcPhZp4qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aslm3Yn3BYgx8V54FZU0TWe6uKvDrpLLy9fax5L8J1M=;
	b=PnEnxak63ApoC6Rnzvcd59L9zwNRJ4+uspIlp3sVkpwXu6qtclfPFUbDIVECGZOYj8zH
	 2gqf3uJf4Z390LLfE7juj3DgV/cejHsAJ1hwVyC8kW0ZEqdtmjAxeG+pwvW3+trAmi6nt
	 8cACXNL3qKoeB9yTomKHC0FZJKx6HuGpmHJWwx8AucGa3xgDnXrfAJp0dj+CBsN4WW8UV
	 9S+AUoI3Erq+ByIwssyvFV0B+eNoo9Vf2GSdKdRcw2Q3Ijo0legvK/JON9DGfUIxECVlx
	 ql+ls3QpzRFngatZ+AmJlTJn1zNQj1j4PllDCNZT0nUM/5L46H0IZcH6SVzhSjWxEFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fD4M4g12;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB37606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB37606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fD4M4g12
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a070755c8cso457396b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793992482; x=1794597282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aslm3Yn3BYgx8V54FZU0TWe6uKvDrpLLy9fax5L8J1M=;
        b=fD4M4g12rMDwQ+mCHieGTT+VTcQBpBM0I1nzyEp24lrICR1UikVwZ+X+IWCMI7wV3K
         Wp0/46Fn8EEeeQs9icZxwhBVdstyNIOUpXelauYtrcKUsTNzhRror/h7Oo2xapgwHZJw
         BbV5KT/WxiWSHpffrp6ygKjPMaLwqCbXP+OH3t+N+DW5iEdUsCqlWY+7FsiZn1BwGKL1
         3uYuqHyfiUxmYw8wTh2x28YVu6GzG00kclMFWKHVmGtjX1IXWO5XEYu9pJBnxTq6uMAu
         qgbKAX5psDv1Fw9aeAGfCcNrRt7TzxklYZoaL+2+jeHdNhFsmZ7wUZiu0pv0InHjQx3N
         vOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992482; x=1794597282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aslm3Yn3BYgx8V54FZU0TWe6uKvDrpLLy9fax5L8J1M=;
        b=23mFLSM8ZRPbgeGGiVn5pRteYCLOzM/1HufT5qUIwFkR+5l2YX3onCyAwaY2sQc65o
         Sh6rQaw6L8WGYvHRDix1rAZXvi2P3XzH8/JIwtFeICJvngluKG912a59bBEjFgXw672j
         RnWmSkyr0EO//sE2k1QXX8uKTXEMJc8ZgyC4pKKYq9D5X9aN6EyUIBXrRTLeK9MhgDD/
         +q9kZm6bJ0SlNdeJGLFOK2acRbs0pligZFtOGy3Q8snYpnhtkH/M2hogxUrSPJE3Gclm
         iuIISHT0aYyhDK0kBoLcFLZjbv0jXJ7DjiGRf/TopHAmeqhebVQLc/R/43n1wooiis9V
         Ysyw==
X-Forwarded-Encrypted: i=1; AKwUvBxlUWaFHrV5WltxL5nQxcdwkDN7J1W379Ixic8UQgzPamhwGdTeuwgP4X7eXiAt5/StVmEsn+Kn6zdKlew=@vger.kernel.org
X-Gm-Message-State: APuU4Z9napOSrIMMS7BEdSUtYzf4GKCheU1+bLuVhSSHKgQkQHPJi04W
	KjQ0FkQp6pzKZf7o1OBa0bayM8jlNqixshAiA+jzLIzCI5g2ELcVTq2PHSC3WqBFEt0=
X-Gm-Gg: AYBFou308qsZvEFSFiYb3z3keSKe7xzQc4DuFnYwWcEQkd6CEB4Z6MGb3wjpdx7rgQT
	hn8st96yodCK514y6mkictrHVyw0stdgatMUJwW8cbDzDha+BXjNre9uM1DiizxRlcJamFY30H0
	sWpon1y8leNjZu6BvZDZuEFJ6lEFGTI3uQpdKmpH7tmKJx/0LFixgbFHZRH9QYNNMG1xhvwvpur
	kq5tfJfhaIXqoqBKwtOlyZnjgIu4i2frv2YpTX4peXMCcfhyDuKt9VCz3r546QewWy3lpi9rpbo
	IPC4eNnMa9RI0e7lAbWR70W4BZCNdQO6JZ+xtYOa9ztFtpl0WTYdJpYFxTL6/Oq5QiqDcYFzkuX
	G0zu6X3G8bm2rujV4fvHsv6pyjMKwoWKbpElpYgnjH298rSKE8O/wqk93P+2W/ssB3fAnz3hY+r
	5PD4lIPt3atFe3BwHpd9+TbRQM3K8OtqRTSem6SXC/+RaYk2v/xqGmVkcc1g/irNOxXhORo+9dQ
	OMjTiW2FlFoColAN371jKNnhTYs0wTCpnD8dElqZaYomVEPKk/QzjcRfcGxNzsX1+GWAWhjguEq
	OKI2Cj8Yt/f3vqb0ip6onlI8JjmgOJ/Ic3jk992IxQ==
X-Received: by 2002:a05:6372:a80c:b0:3e1:3858:1dd0 with SMTP id adf61e73a8af0-3ebb293a76amr3480273637.42.1793992482406;
        Fri, 06 Nov 2026 11:14:42 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa3ffasm982983a12.26.2026.11.06.11.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:14:41 -0800 (PST)
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
Subject: [PATCH net v5 2/4] bnxt_en: check HWRM response if completion never arrives
Date: Fri,  6 Nov 2026 11:14:18 -0800
Message-ID: <20261106191423.4194081-3-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106191423.4194081-1-joe@dama.to>
References: <20261106191423.4194081-1-joe@dama.to>
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

