Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927342;
	b=w2t6BZGMnanoH24a7vgtYUb87ml7NKvtpDj5YjLIYrFUB0B6ed959vlNrOHyz/RvD4ng
	 w1uIb69e6TN0tU/AuIbifp00jqtKCBc8WvH8iNw3+OV+D6UOUQ1RqYzsQiaforQ3Zc8vn
	 V1HQvceTT1ceEmV5WTMUpBDC7XrnGWc6Tlsvl4CISaLpbw5KQLtuGkig1C76sl5m8kGUa
	 NYFTGZaV8S9Tp/TlmkVE4nUmTSk2DNtj1ibvaEZBkDsSKc2lzZaR1zQogsej2x92HCU1U
	 8j7MPJzFOSxCGzbKwnm6oDEp6EBiw59+Bbe78UJSzrAbyX+YMaSqbuVoUoC20ZWpd4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VKadNleMHJBLRP4szDxTc4A4+nJ0/Pl3hG9PQuxpOUk=;
	b=l6zz98awioAaJ5BoTrmtAtd710OPi6GnaNk9PgKD4szJKDfiRqsJVg4jo2UFgZ4gXZmv
	 +JR1vSQ25pK4azw94wiVUfK6vr9zrUCk1H2AzB6SW3CtHR9CpKBrQS7fgBXQHKE5RqD+g
	 5aDyHu6t8Qy7j0dgjv24FbtkLF8a+L/RvqZtMX8jOTy2bEuQHAT53GL5Ml8sdUdM5uBXm
	 UWcnvRpuX/iIy2G58cR4tYk+MkirxnlLeSoN6NTGriMteBm+T7piFeBG5+re823hr6K67
	 ZvdsZfgLPai7aqz8z2g/n2SXpTKWtgrlw1UVwEIg7XUfXKHrREtDWX5LpagnbjaVuWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T5T1Vgai;
	arc=none smtp.remote-ip=209.85.222.200
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEA6606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEA6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T5T1Vgai
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso938624185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927341; x=1795532141; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VKadNleMHJBLRP4szDxTc4A4+nJ0/Pl3hG9PQuxpOUk=;
        b=T5T1VgaivdD0YfEnxADGj0sSnbChlsGKMyvYd28XOnFm2t/W6zWqHt6GffAlu+DdF8
         9eDYRC3Wt2sm7L2qAINRIEkFhbAyflBH+lCkkF5xc8jymU5GE+BKQZ+DLor+sZHS0qIM
         RpLVImvu04e9tBQWX+OZMWU7W3/818RoDPRZPJm3cIDJ6Jh3p1oyCrK/lnA1ssVbdlLw
         jlJEf3smedj7UfplYFzd7fmwR4Q3qG3jCs0bQvTKvdkbYyTChKNV31tcBFQWnYC4H1vn
         VihiHM74lldIWjSilWsBapO46SfrwOBzTdLw5EDXcouw8BWcdTUl5SBXmkZ7gOvESryi
         P9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927341; x=1795532141;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKadNleMHJBLRP4szDxTc4A4+nJ0/Pl3hG9PQuxpOUk=;
        b=dWXwLLx3D59Tbqmt8OR2FmIcFWoWAcyouL3wWfKTmzgttA59CRW9vZ616Dsw7idNpT
         tZDvFVeFvEfbDIUViJYDkTjvR1pzZbFTqeJoVop0SOXXQgv7Jrd5Lol42u23Wa3x/P6p
         /DRl0ImLlPtKAazBzLr8fWmBr4x4pu9oB0JWgSgEUq7C0Pa5s0Lbtg1F/gI7L9WubUvr
         Ywjhgbhu1LHPUw1I9wNCXSD40X4xSccMWYmPFPclBuzRzcVx3O4mI/WMcLOOCfV5Nnr6
         A8xYDeIiInWmQrcYWKW6QpR3R6mkYKWI98SRQvOU0tgHUzMUPIE89PcUJk0moz6QQp2z
         xGKQ==
X-Forwarded-Encrypted: i=1; AL+hErF8ZhXiqneerWfugR77p6Yr9iwCm8RAUYfn3Wlu3Iyv+7YajDlshtjjIPLPXFJf5wimwxBHyoGZ5R9pSiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/CNHD8wMDJW6mpffFU7M7urWSLTBTsFtgYyeo53XZO1WipGUh
	IvDb90ecIQYLBjoDeAqqEhB2DjuwCA9z7aQsFPbbWOW3+f7Hr+VLbYRIDBCBLtVkgpm6W7JpP8z
	utw==
X-Received: from qknvm11.prod.google.com ([2002:a05:620a:718b:b0:93f:43a4:a480])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:8908:b0:93f:47fa:b722
 with SMTP id af79cd13be357-9494bb858b5mr2039910785a.13.1794927340273; Tue, 17
 Nov 2026 06:55:40 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:08 +0000
In-Reply-To: <20261117145522.1910636-1-stani@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117145522.1910636-1-stani@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117145522.1910636-3-stani@google.com>
Subject: [PATCH iwl-next 02/15] idpf: wipe mailbox send buffers on release
From: Stan Iliev <stani@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Decotigny <decot@google.com>, Madhu Chittim <madhu.chittim@intel.com>, 
	Emil Tantilov <emil.s.tantilov@intel.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>, 
	Brian Vazquez <brianvv@google.com>, Li Li <boolli@google.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The mailbox messages are freed with kfree() once they were sent, or when
they couldn't be sent. Some messages hold secrets, e.g. the PSP TX keys
inserted into the SADB of the device. Free all of them with
kfree_sensitive() instead: the mailbox isn't a fast path.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
index c06b2d9bfe0a..fedac4716b08 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
@@ -129,7 +129,7 @@ void idpf_recv_event_msg(struct libie_ctlq_ctx *ctx,
  */
 static void idpf_mb_clean(struct libie_ctlq_info *asq, bool deinit)
 {
-	libie_ctlq_xn_send_clean(asq, kfree, deinit);
+	libie_ctlq_xn_send_clean(asq, kfree_sensitive, deinit);
 }
 
 #if IS_ENABLED(CONFIG_PTP_1588_CLOCK)
@@ -218,7 +218,7 @@ int idpf_send_mb_msg(struct idpf_adapter *adapter,
 
 	if (err) {
 		if (!libie_cp_can_send_onstack(send_buf_size))
-			kfree(send_buf);
+			kfree_sensitive(send_buf);
 
 		return err;
 	}
@@ -230,7 +230,7 @@ int idpf_send_mb_msg(struct idpf_adapter *adapter,
 	xn_params->send_buf.iov_len = send_buf_size;
 	xn_params->xnm = adapter->xnm;
 	xn_params->ctlq = xn_params->ctlq ? xn_params->ctlq : adapter->asq;
-	xn_params->rel_tx_buf = kfree;
+	xn_params->rel_tx_buf = kfree_sensitive;
 	xn_params->timeout_ms = min_t(u64, xn_params->timeout_ms, timeout_ms);
 
 	idpf_mb_clean(xn_params->ctlq, false);
@@ -264,7 +264,7 @@ int idpf_send_mb_msg_kfree(struct idpf_adapter *adapter,
 	int err = idpf_send_mb_msg(adapter, xn_params, send_buf, send_buf_size);
 
 	if (libie_cp_can_send_onstack(send_buf_size))
-		kfree(send_buf);
+		kfree_sensitive(send_buf);
 
 	return err;
 }
-- 
2.56.0.679.gc527c65306-goog

