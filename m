Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509882;
	b=dYUhxqOkW6cpk5j8ONppNSLzUeoaziW2FduA2t1YXO8/7QxebG3KaiJDvNN4HIP0SZDu
	 350ivNGYr33Rs7IrpbjL3+Ez1w2iGiB6Mr/7W3jOuX9m+tKXjqjBQoTlrRbhFLHZ6jUeg
	 9igf3LJ4v0C//uKmACB5bhZK15F9d3zanHOpy118gN86dqO6uEv2Z86lSSsOK/jU2oiP6
	 osr63W77vCOhxKj0w5o8n8oOe5AOltnJHYDBMdrhpGN7CtdKbpj88gei1/UXroakuZL+d
	 z5Nr9ccWYE89pBp3nAhQSEgRKW8wDQ7G6euGd4MvliGFn2nSf6NIW8aq/b38Pg+K3Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G5tN8cFWYKKQdXdrFLYLB4O03z7PGyAtAV81+AhWuws=;
	b=taHNFgN2RB6lWFGexZCUqoy/t+7zVOpGaepZZsHw/uEnRJb+qkGtEnk6X08YaVD4gQXJ
	 /Q0Wzz+esy+8spHRhVaP+FzTKSTU8MGnpL/xLOl2i8Cw2YjM/T/83UYzPL8nhPxnF+SF/
	 zOii067vOC12DCNy45D4M2bHep2VsHpwHu/T+HcvI2Zx1W+/hDHFrUUNTvW4/8TqrFTfP
	 q/sh1HeabBTutxJ3xH9AtVC4k1SO3U8lcPHCYSyDXUAWVKht48oPFLDzxEKqnM5eCnBKj
	 lUr3hDB/vHcqmk0PVZvRrzg+/QbkOqI/doF7QC4lvyffRxhl4nH6KOVCcNgfr9RMCvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cX+NB3CG;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0E606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D0E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cX+NB3CG
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso464815266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509880; x=1793114680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5tN8cFWYKKQdXdrFLYLB4O03z7PGyAtAV81+AhWuws=;
        b=cX+NB3CG/dJQtaBpiupEdRyIh1uUSNZHmLzJ6mAkshlYKC0Bm6RPkBC71+QgjExV14
         HMtI5uR7Mg7mKwwkeKRtU2aQ2vCRnhhVdc0n8/2+Nf8RFFVWuBxlg4xFCzhKfla1qkXc
         q3lahx2LzV/gj4ynwbnOICeqD0kMLbtkdoXJhs8jeJubXNSEUVKpC3oJGHKKImOkCu5V
         IkdFjg2hVUDbRUlXPBVsV19P+/RXSfAQw4p3jTSZ5bbXT+u21emOa58ZnUdB7Xta4OQy
         4oPajs7sxNh7kJ2k55IQKWGV9ZJOEorie8EuH9wPX3AmW3p3oBuhY58qW7tIFP2wI9md
         YFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509880; x=1793114680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5tN8cFWYKKQdXdrFLYLB4O03z7PGyAtAV81+AhWuws=;
        b=SX0soO0+E1E8akPPFUcW/R9y8CLhF5Y2JDzX693r9iy+nVHjVvYjaksDhGyVVaInzF
         +VCAEOrv/Na3eFxjsF4ikaMZAuRouZBkdYOECb1q+FWlYav7C/rzCnehQyzSA4nl6W7t
         DfKtl1iqrryEaICM69Vlxqgzl66zteT4M0oZShpaaGxgwmwu+RBoRqEN5FNJ/fMklz6h
         h+7I2rYmj7tAVrWpgSsSOQxYITpaf3gn0NPPG+EXE6FQFPRHMzbrwqfnim462lZis0Yu
         zCADxkINZSmNeqbjplgpoIMRhvGIkjQmtbzP5+fxA4mpZVwYPkkGnYHMqNoQwFzFF/9t
         Qa3A==
X-Forwarded-Encrypted: i=1; AKwUvBwClmWWWztjiDMi5bfXidLS+recT9gzeewohYpqzbxZz+x4vHa2No5BXTQmK9t7BirrW562mza3e0RD6cM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6bZfu2nXkk7hAenFjZ7ATEV9zYNacxg7eQ+D8jsU1sAspguGU
	FBkb1vNi0MGv64C4U82m/06d2S+s/f9+4YWYY6dNi5DZBhbcZaaL6xEs
X-Gm-Gg: AYBFou2ct2B3hluqkuP3FC4L66z5VYYLFxUJa95Og4lnMHLFvk3mV5ET1l3UeuXCdrW
	x5hXOs1gW6qF3DrLym463UK3URxID/ewERtj+fBufUB5uGJO1dY7krjqd4PzXBbte5oV1yLROxj
	WRmAJiY8PsiAZKIfi9nynbFGaivL6qXk4t+NHOLvY7nsmuf59R1263ZSywnx1yQnrItYZJEwMNJ
	Q9Dl9SjmbkGv/4eWN1ADtLPp7DLr9/v4WOhi4ZbSNEHp4Uop9u7jEKlXWILPe38nPbXPt9icXnJ
	2vsD4T3nFRSthUhL9s6acMgM714dj4s+HBywDhykToSflQnUnr7Se3mzrQe+MruP3SRQ2mdYQcs
	0YiALCvT/bTtaqNerFjnwJmEffkOz5+9Hm4yK8IQIzQLS3+mCJnBeEVQy88+O/JB20AbRbEG+rp
	SjGwtDO7tEFOi+Gdu6ZkkPyNq2tqCr+EKYQXnyKoh9dFA7oDAllhToEp6zMTxsGbwMiGf4QVI4W
	xTMzwdAj37iQErccTiRZ8Mq2FoROo4CY6KvxBR0PqeUML4zod6AuSX+i3UKzd4VBJqbMY5dPlCv
	AvolXLyKT/Fq1MV2nS+HYPyljTBPDF8c
X-Received: by 2002:a17:907:9693:b0:c2b:898e:24fd with SMTP id a640c23a62f3a-c419f90824amr855300766b.33.1792509879566;
        Tue, 20 Oct 2026 08:24:39 -0700 (PDT)
Received: from Martyna-s-A34.localdomain (ip-80-113-116-3.ip.prioritytelecom.net. [80.113.116.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bcfc5sm488110466b.59.2026.10.20.08.24.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 08:24:39 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mehmet Fide <mehmet.fide@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath9k: drop WMI command responses when no command is pending
Date: Tue, 20 Oct 2026 17:24:12 +0200
Message-ID: <20261020152412.95560-3-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020152412.95560-1-mike.michalo@gmail.com>
References: <20261020152412.95560-1-mike.michalo@gmail.com>
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

ath9k_wmi_ctrl_rx() accepts a command response whose sequence number
matches wmi->last_seq_id and copies it to wmi->cmd_rsp_buf, which
usually points into the stack frame of the ath9k_wmi_cmd() caller.
Only the timeout path clears last_seq_id, since
commit 8a2f35b98306 ("wifi: ath9k: Fix potential stack-out-of-bounds
write in ath9k_wmi_rsp_callback()"). After a normal completion or a
failed send the receive path stays armed, so a duplicate response from
a buggy or malicious device is written into a stack frame that is gone,
and its extra complete() makes the next command return before its own
response arrives. Sequence number 0, which means "nothing pending", is
also used for a command once tx_seq_id wraps.

Keep the receive path armed only while a command is pending: disarm it
once a response has been handled, on timeout and when sending fails,
drop responses while nothing is pending, never use sequence number 0,
and reinitialise the completion before each command is issued.

Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
 drivers/net/wireless/ath/ath9k/wmi.c | 33 +++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index 76c8dfcc53..5fd20923ad 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.c
+++ b/drivers/net/wireless/ath/ath9k/wmi.c
@@ -202,6 +202,16 @@ void ath9k_fatal_work(struct work_struct *work)
 	ath9k_htc_reset(priv);
 }
 
+/* No command is pending: drop all responses until the next one is issued. */
+static void ath9k_wmi_cmd_disarm(struct wmi *wmi)
+{
+	lockdep_assert_held(&wmi->wmi_lock);
+
+	wmi->last_seq_id = 0;
+	wmi->cmd_rsp_buf = NULL;
+	wmi->cmd_rsp_len = 0;
+}
+
 static void ath9k_wmi_rsp_callback(struct wmi *wmi, struct sk_buff *skb)
 {
 	u32 len;
@@ -219,6 +229,9 @@ static void ath9k_wmi_rsp_callback(struct wmi *wmi, struct sk_buff *skb)
 		memset(wmi->cmd_rsp_buf + len, 0, wmi->cmd_rsp_len - len);
 	}
 
+	/* The command is done; drop any further (duplicate) response. */
+	ath9k_wmi_cmd_disarm(wmi);
+
 	complete(&wmi->cmd_wait);
 }
 
@@ -248,9 +261,10 @@ static void ath9k_wmi_ctrl_rx(void *priv, struct sk_buff *skb,
 		return;
 	}
 
-	/* Check if there has been a timeout. */
+	/* Only accept the response to the pending command, if any. */
 	spin_lock_irqsave(&wmi->wmi_lock, flags);
-	if (be16_to_cpu(hdr->seq_no) != wmi->last_seq_id) {
+	if (!wmi->last_seq_id ||
+	    be16_to_cpu(hdr->seq_no) != wmi->last_seq_id) {
 		spin_unlock_irqrestore(&wmi->wmi_lock, flags);
 		goto free_skb;
 	}
@@ -303,7 +317,10 @@ static int ath9k_wmi_cmd_issue(struct wmi *wmi,
 
 	hdr = skb_push(skb, sizeof(struct wmi_cmd_hdr));
 	hdr->command_id = cpu_to_be16(cmd);
-	hdr->seq_no = cpu_to_be16(++wmi->tx_seq_id);
+	/* Sequence number 0 means "no command pending", so never send it. */
+	if (++wmi->tx_seq_id == 0)
+		wmi->tx_seq_id = 1;
+	hdr->seq_no = cpu_to_be16(wmi->tx_seq_id);
 
 	spin_lock_irqsave(&wmi->wmi_lock, flags);
 
@@ -311,6 +328,8 @@ static int ath9k_wmi_cmd_issue(struct wmi *wmi,
 	wmi->cmd_rsp_buf = rsp_buf;
 	wmi->cmd_rsp_len = rsp_len;
 
+	/* Drop any completion left over from an earlier response. */
+	reinit_completion(&wmi->cmd_wait);
 	wmi->last_seq_id = wmi->tx_seq_id;
 	spin_unlock_irqrestore(&wmi->wmi_lock, flags);
 
@@ -352,15 +371,19 @@ int ath9k_wmi_cmd(struct wmi *wmi, enum wmi_cmd_id cmd_id,
 	}
 
 	ret = ath9k_wmi_cmd_issue(wmi, skb, cmd_id, cmd_len, rsp_buf, rsp_len);
-	if (ret)
+	if (ret) {
+		spin_lock_irqsave(&wmi->wmi_lock, flags);
+		ath9k_wmi_cmd_disarm(wmi);
+		spin_unlock_irqrestore(&wmi->wmi_lock, flags);
 		goto out;
+	}
 
 	time_left = wait_for_completion_timeout(&wmi->cmd_wait, timeout);
 	if (!time_left) {
 		ath_dbg(common, WMI, "Timeout waiting for WMI command: %s\n",
 			wmi_cmd_to_name(cmd_id));
 		spin_lock_irqsave(&wmi->wmi_lock, flags);
-		wmi->last_seq_id = 0;
+		ath9k_wmi_cmd_disarm(wmi);
 		spin_unlock_irqrestore(&wmi->wmi_lock, flags);
 		mutex_unlock(&wmi->op_mutex);
 		return -ETIMEDOUT;
-- 
2.43.0

