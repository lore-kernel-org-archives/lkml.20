Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83E4DA546
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789205; cv=none; b=KnUtU5aviRfB/X9qw6vHOgu38NmVtn52F1tUSZtm8cjSRFrsuSWABZUazjDO7Z6vd5Mk7X1hYTBSxQjKFtfRwgVP48aIppvoa2gToGxjhkQ9LD9N/mysgLUpfOSsViYg2eP3acNRh2ftN8gKbebGGPUwjtmezua87MpLrb7FLg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789205; c=relaxed/simple;
	bh=47x1gmYS5KETxsK67acl3LI1NZv3B3g0kC0P4y8LNE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUAHcTB6HaW4jqAP4DyTOh+yLjyjRUGiI2uJEGFF3s7ltYjOnf1YBkP9UP1JBtAjY1AIYySzxlbpCEpfBugJM+Xzak36qFsTDeebyX7EYZv7KlYE8iu83qhT2u4e+3IFzkbe3eim97ZrrKAxHrfw5iUR2I+HLNcT03idkJYOnL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=G6yCMOC4; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="G6yCMOC4"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2840432a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788789203; x=1789394003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUAd5a57Ijw8GSMVGKJOoAag1P4lVOLvfbZKkau5P4c=;
        b=G6yCMOC4CRLUF+Cs0M1DpLpqDCCjOCxOtiXgpEcE+SYc7fxBVMz2h42/Pxt/s27e5T
         lABeyK2pz5IatqxNvN85OHodpEcKpHK04pZnwte/WJN0fAWqO0JT88A160xcSaTUSop7
         RxT2eC3CVjwzTEP24K6c0AwYDer9VnCKOcRHyDfsx5RfU4N7LjNdhHTwIvqoHkTeXHE9
         RF8UhvplPSJNKUkQ4a/WkOupOl1XOtRmxJqpW3YpZDzxov5nlq7wI8b3OzBBFHiNrPse
         bA10OBtLWqLuIGhAWG5B4DWXsdgyuo+IHd3SUiZzWjpAnzAfYMvKHEh/c+8CUkqoU2LU
         tu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789203; x=1789394003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rUAd5a57Ijw8GSMVGKJOoAag1P4lVOLvfbZKkau5P4c=;
        b=Sjyk2wSEjCiPO0CalQgHvlx4zTbwt+ZDcgZZgwKmU0preyVr4C9b0j/RskepNF8+oX
         1Rg2GB0BSeDBb1acInJl7PNIvCc+0lse0JfanJHD2hq4nRB0g7AYR/GSPc9Ny8okOZRw
         S0X33dGPDO0yPOXy6gLmrzg4mjhbrdilrA0lth0/fXnx6aX76Acau/H7ij8IheSzFd0P
         bf9BtJ2h4hp8MTS6mI18mlaJpg4hg9vcms/AHdRsZOFbcnr9komc8UxcAQBr68LjeKgI
         4KOSi12PHAJzPUT01YY8wcBSwGJi/9+TpXYPcQxSv7AFEZzjUB8qTOV/8PMk88AckykI
         jAog==
X-Forwarded-Encrypted: i=1; AKwUvByAzRI1cmeGrpla7CpddZ0b2+bra0ANfuTVtaU2ASZbufy/5EH4L6FsTMEhmeUDLlk0rnsunEYsDOIwdPg=@vger.kernel.org
X-Gm-Message-State: AFuF++mJrML17oMI3G7W0ecaAHapGLmiKJiaTNS8c7SI1pBqdRhYWTvj
	iQASjaSBVdHGHgFslgOlwpBGCshC0v0+KA1L9Ru3S7Q9EZULk+Sai+y6dkh4y7uhCz7r
X-Gm-Gg: AYBFou17aVO3I9Rr4s6pjz/P02tx7iM6ehm7inauxD0d7s4+xqOU2ONPnlqPsJyxhe9
	KtHWEJF8yMrtMn2PrfpSRi86kx/xA/cy+MfBfIHfn++I5ki+/dDKQk4Oak+8ngCpLB9StsL7WSD
	e3h5v085EtDmiuQOxGIprLrW3bV2a5vrU7z8ZOmqXt4gT3xcsl8VdTMBUdLw/F1Qi+F4BfGlJBY
	fbTlm6ejR20LVy1QD5jwwomnZYCLfyFzHXPB6cTvibLWkz/8EC3shuu+N/8kNKxrlU9ihjoIJ6O
	bUWrJOZRVeciGkP9X71fR11Ks+pMEZ/vr8gmlb2FqXN8hwHttxjbDF9F2/BjMW9E67NCLT4ABOz
	xFgzTiCZ6VGHgmPiY7e+oJ1q+/ERXltV49k1OaxAMsNdODrZay98od9qQttbHbCLpdyKvZE8ttg
	IwrYq9GEK5eabD3rwWMApoulPvo0opJBcV3osGZCvGsT+DErHsZ/a+We6YfP+IMDW8if6ZZqZMh
	m7RZ4fVEy+v4on2CK1n
X-Received: by 2002:a17:90a:d004:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39b26273267mr35785346a91.13.1788789202756;
        Mon, 07 Sep 2026 06:53:22 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdc1dsm21282204a91.7.2026.09.07.06.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:53:22 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH net 1/1] inet_diag: cap bytecode filter complexity
Date: Mon,  7 Sep 2026 13:53:11 +0000
Message-ID: <d1b0d3a224167afa0ee61db0c9f778a2d12ff9b6.1788775605.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788775605.git.zihanx@nebusec.ai>
References: <cover.1788775605.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inet_diag dumps run request-supplied bytecode through inet_diag_bc_sk()
while walking TCP, UDP and MPTCP hash buckets under their bucket locks.
The auditor currently accepts an arbitrarily long program, so a dump
can spend unbounded time in that locked section.

That fact is already present at the git epoch: tcpdiag_bc_audit() had
no op cap, and tcpdiag_dump() ran the bytecode under the listener and
ehash locks. Later inet_diag extraction only moved the same code.

ss(8) filters only need a handful of compare/host/mark operations.
Reject programs with more than 64 ops in inet_diag_bc_audit() so TCP,
UDP and MPTCP dumps share the same limit. 64 is a policy cap above a
normal ss(8) filter, not a lock-hold budget.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/ipv4/inet_diag.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/ipv4/inet_diag.c b/net/ipv4/inet_diag.c
index 34b77aa87d0a4..1ca528cd3e72b 100644
--- a/net/ipv4/inet_diag.c
+++ b/net/ipv4/inet_diag.c
@@ -725,6 +725,12 @@ static bool valid_cgroupcond(const struct inet_diag_bc_op *op, int len,
 }
 #endif
 
+/* ss(8) filters only need a handful of compare/host/mark ops.
+ * Bound the program so dump walks cannot run an arbitrarily long
+ * bytecode sequence under the socket hash bucket locks.
+ */
+#define INET_DIAG_BC_MAX_OPS 64
+
 static int inet_diag_bc_audit(struct inet_diag_dump_data *cb_data,
 			      const struct sk_buff *skb)
 {
@@ -732,6 +738,7 @@ static int inet_diag_bc_audit(struct inet_diag_dump_data *cb_data,
 	const void *bytecode, *bc;
 	int bytecode_len, len;
 	bool net_admin;
+	int ops = 0;
 
 	if (!attr)
 		return 0;
@@ -747,6 +754,9 @@ static int inet_diag_bc_audit(struct inet_diag_dump_data *cb_data,
 		int min_len = sizeof(struct inet_diag_bc_op);
 		const struct inet_diag_bc_op *op = bc;
 
+		if (++ops > INET_DIAG_BC_MAX_OPS)
+			return -EINVAL;
+
 		switch (op->code) {
 		case INET_DIAG_BC_S_COND:
 		case INET_DIAG_BC_D_COND:
-- 
2.43.0

