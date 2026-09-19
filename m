Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE91376A07
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853342; cv=none; b=m+rpXQqkoojpblj5+6qypzRptQxgsr3L/zwlMtyhHp30DmLAwxk5db4uSWvGJH6hYLyDcdi9LrF4YajSrPcphP076QS3FSe9R/c7lA8e9njkUeAG+w2o6Ni3wAaqXC176OBoeITTKdacxGvB+auCAlyHbFw6OVU52d+sgmnlXdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853342; c=relaxed/simple;
	bh=prjDMLVmFu3EaYvVl6i2BgtEyldcdqRrMc/3t9zL6bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dqQzVsbo40Bk+23pWxtdE8Vg6wFq2SaknoDPEjkgVjVyA96FH4CSHEHK44spZKm6BDE1GfK5oNSUcCbm8F4XRpJECkv+29PsHV4mL+4aoVPDcdJUURR3cfdscQtr/unsVyh8K574L2Bb6z76SK8BTEQWTe4NlUjShv8YBObnQdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWIDi4BY; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWIDi4BY"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so1959758b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853337; x=1790458137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYFViyQge7tf8m2KJ5gBNtr9+PNFnUOuNQpW8AAs1R4=;
        b=gWIDi4BYOzkiYNVc/t4a84aNa/xJJBrJlZZzyQs/D0Bki8js38cwua2BQRetrfQY95
         T/AGWO4+ddHR7PyqST7QxhiNhPl75tEItExsAJarX6BIzUgTklA5WttQhSVmv0JxyX2S
         KaINKVhsxJz3JqVrJ5Qgg0DRfqEMMIlDDgp3lLnvO/Qzx9Nz73mvSvPrbfm5+FZtzulx
         jdZQj1G2mlZAXI7y+LKEJoOMOoKxFigCXgL3IO4Qyo0N6zAE5QEPFFK77sawhpzDDN7w
         PfOkCkOJkEDqyVX3DdJIvjKXBY6B3LnGWhMl5aqsRSvg2lnm4iTFpTkkScLXcNRyoD72
         WnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853337; x=1790458137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYFViyQge7tf8m2KJ5gBNtr9+PNFnUOuNQpW8AAs1R4=;
        b=DJORLrU7ObiCG3eMH3c9YU6rtYgsHt5x80SgxnXoGKHJpNnDZYbwzoWwLZpSjRhCrK
         Adfsy1iYPukxLT+cqFQPqziRanbYPKAzZfjhvvbmpD9autso4yGhqPeQFvBsgszkB0VU
         19UglOkGoDmLVSV0lVjfLjYxVhNPjkQM2aBDJZ9PsA2FXCSSsR6Kzia46zhKE6XHBMHg
         mlLgYbCzopryRfleFidwrocGvpGB+ALY7Guh+P5Xm3FajLH7b01C8g5K7/XM1ciRUSBY
         jBc8ICEecqx+x7vDuTg1cvhTZYxsYDG1kEfBsrDUpyjQCv9g47Q6+8N0fzy9A0Dfy3wl
         1EYg==
X-Forwarded-Encrypted: i=1; AKwUvByoiZzaMSEWW/mISEm1h9dxOKb66IKp5ygea+vVpXExBwUn1ZyN4m03ZlrsP8m4UnLClEqjJJM3BjbnwR4=@vger.kernel.org
X-Gm-Message-State: AFuF++mEd846pEU+CYTpSASY62pH46nWtRh3w7trn0rEIVf1k7OuISnQ
	CkZH6JdtrUOrFOFwi8BDSX5KfYYAsXyJm3PlagEnA11J3h/+8t8jhGLO
X-Gm-Gg: AYBFou34DcW1z8P4bt6SvfAWj6nFF0rzLiEvVoobDseBXmhR+gB57Uy5aWsBA083B8n
	+/ks1saOSvoif9a3LP2WTx6zelsMZJn4dKujP7nbkq6d67jPmgXUoUMaOF+RP0H0SqkaL4hOh4l
	pfOc/AHSssxpLXMMinWTdH3YUkti8k1WKEkbHxF0t1Wxs3GkaIJoeMkaUkofIabc+xs/MfAzIO2
	LBvR/zaIId8alHAWl0nWkOHVwg5hhWNafjHg4qHkJf0m/MsXJPEf0/B9/3LirS7gDoNohVuS1m5
	6BxO0tQTKlVWimr1tXcPU93F5DWHRf6hijA5Bdr/BJ9pwtsAHI/mz0UCW8/HLIRLWwA3cZcMFoR
	YgUa/ae2Vam022INedv97+queaNQPoPDRYkjNgMwNgBU/lkuKnJpPKqgrFDktYQcyxtlEVsTbJC
	nDSn94PkrH1FyqabBac4DKJSX1VXLntKVJz8NhfAghF3rKv5M76G1ZXefL1NYIleykcrGgVihcj
	wdy+hMcfgVoxjTz26VS73gp3T9UZTINCIIs9axclYk/SsAMAJRV2h8j+tX7D46vdWOidqxoi73G
	I23NTs2qWw==
X-Received: by 2002:a05:6a20:72a1:b0:3c3:a3fd:db0a with SMTP id adf61e73a8af0-3dd8c44c5c6mr9467932637.16.1789853337043;
        Sat, 19 Sep 2026 14:28:57 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aefa9c0sm1224118a12.29.2026.09.19.14.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:56 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ppp: pptp: fix out-of-bounds read on short payload_len in pptp_rcv_core()
Date: Sat, 19 Sep 2026 21:28:55 +0000
Message-ID: <20260919212856.3241262-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `pptp_rcv_core()`, `pskb_may_pull(skb, headersize + payload_len)`
only verifies that `skb->len >= headersize + payload_len` without
checking that `payload_len` itself is large enough for the subsequent
PPP header accesses.

When a GRE packet arrives with `payload_len == 0` (or `1`) and `skb->len
   == headersize + payload_len`, `pskb_may_pull()` succeeds and `payload
   = skb->data + headersize` points to `skb->tail`. Immediately
   afterwards:
1. If `seq` is out-of-window, `pptp_rcv_core()` reads `payload[0]`,
   `payload[1]`, `PPP_PROTOCOL(payload)` (`payload[2..3]`), and
   `payload[4]` (up to 5 bytes past `skb->tail`) to check for an LCP
   Echo packet.
2. If `seq` is in-window, `pptp_rcv_core()` reads `payload[0]` and
   `payload[1]` (up to 2 bytes past `skb->tail`) to check for the PPP
   address and control bytes.

Require `payload_len >= 2` before pulling the payload, and require
`payload_len >= 5` before inspecting `payload[0..4]` for LCP Echo
frames.

Fixes: 00959ade36ac ("PPTP: PPP over IPv4 (Point-to-Point Tunneling Protocol)")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 drivers/net/ppp/pptp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ppp/pptp.c b/drivers/net/ppp/pptp.c
index a797a0606f6b..2f979294490d 100644
--- a/drivers/net/ppp/pptp.c
+++ b/drivers/net/ppp/pptp.c
@@ -310,6 +310,8 @@ static int pptp_rcv_core(struct sock *sk, struct sk_buff *skb)
 	payload_len = ntohs(header->payload_len);
 	seq         = ntohl(header->seq);
 
+	if (payload_len < 2)
+		goto drop;
 	/* check for incomplete packet (length smaller than expected) */
 	if (!pskb_may_pull(skb, headersize + payload_len))
 		goto drop;
@@ -317,9 +319,11 @@ static int pptp_rcv_core(struct sock *sk, struct sk_buff *skb)
 	payload = skb->data + headersize;
 	/* check for expected sequence number */
 	if (seq < opt->seq_recv + 1 || WRAPPED(opt->seq_recv, seq)) {
-		if ((payload[0] == PPP_ALLSTATIONS) && (payload[1] == PPP_UI) &&
-				(PPP_PROTOCOL(payload) == PPP_LCP) &&
-				((payload[4] == PPP_LCP_ECHOREQ) || (payload[4] == PPP_LCP_ECHOREP)))
+		if (payload_len >= 5 &&
+		    payload[0] == PPP_ALLSTATIONS && payload[1] == PPP_UI &&
+		    PPP_PROTOCOL(payload) == PPP_LCP &&
+		    (payload[4] == PPP_LCP_ECHOREQ ||
+		     payload[4] == PPP_LCP_ECHOREP))
 			goto allow_packet;
 	} else {
 		opt->seq_recv = seq;
