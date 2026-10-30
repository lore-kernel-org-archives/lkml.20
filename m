Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358660;
	b=NKp9QDIjwDFQF1ygRaU4ER0w+QlA734HwWZBUydTUXcxEJM6E8t49Z04wIIOkwy8G1s0
	 ANjLyAY4WAGssb4TWjH8k5KMRwo5YTQfABXy8tTbhAwan/KohhmmY4fr+ZCAHlMUgeg8J
	 Frgk6+7DMXwKdW56cT1soRTWu6gbP7ueTTpqFa2KBMWNBbQmtXKvsU9BsV0iRM48Fll3T
	 /BUFrORiMf2Sh0PwffZzG3ywuxvowZtfNgYDdOp5kt+zE/r0n3IN2ZjT+KWTjHSdaoCRM
	 SEnQnboofu2Gg0OPyZqmpDwZmsDkr68xesaA7GMFA2Ez/zd+wF87tzcb3VMWP/ehJdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=46Vjwa9uE7FzNJRa2W9YmO/vasAer+dAOb58elbr7/s=;
	b=gHb29Ae83p9DzHsrlODO5nLFCaNWgllX6fsKQiEAmdVTEkWHt18NXinqt+0A4zPMFQMi
	 gwgmeYNIeCGRrKXxGlQ0aW0khGFVB3cTLSmBmAvmwlWAR59GXV1F//O/y+h7Vv7mEFFLu
	 JLs/GyYty41I0+yyna5lYeoQ6g7D41BvqY0ZPMlTguroIU+SkqLk4IcIx8d3A1vFoOFkq
	 pvosInlbMDqdokiCkocri3vrVfCyr6GPw5mkwrn9llRA1g2b+sZ7aqKdrMT/70zcsRdAz
	 QIRGwzKIofy1CXKvwCEBOEEngZcv8LrudKLDvjyZXUJHCjBYu6O0zDkAX/LpWZVRfIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DfbsY6t/";
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9BC606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9BC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfbsY6t/
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9906c3fc88cso324015241.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358659; x=1793963459; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46Vjwa9uE7FzNJRa2W9YmO/vasAer+dAOb58elbr7/s=;
        b=DfbsY6t/6BLhRw3tbLgCCfjBA6TOS24zTyzU6NzQuCjFbxJFUti7riKimMyqdVcj/N
         Sukln1wgCrDXfGIDiXsxcaF8yKq1Vya1C4g12bvniAoD/3WK+kUZOhkYo0cCER69Zder
         rvNo4j6BniMcqAmiW3nYTrh1NCb1jWGm2G+6GQHwYPvueYXYgWM2qT3ZOVjOi43emS6s
         zFFpzKZnnLJvWNtUib+byTc0DvmBzlQ+Mm7RszeYmas24HslfWk75su4piwO8IIsuHZI
         usOpzFBn8e7CSVHc9AC3xOiawgPEEsD+6XLIJmg6NIkFHFoBacgN7SPlil6NmS8aC+rz
         X/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358659; x=1793963459;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46Vjwa9uE7FzNJRa2W9YmO/vasAer+dAOb58elbr7/s=;
        b=gVaBho7tEL4Zfm2KuFziByrVKW9CI8HD5H87v9Y5jD9+hF/zf6FOufolPGkX2Y/NTx
         RqNQUJ3V3qSUc+Ajb1W0qMU/2fg1m4/0l21ktw2zz3wKqOdURru4LrQ9jTGZzy/MT0f0
         Xy1bknKIozjEq/oNMz9vwihP/t4A264ERB+t6gyXW7cqI3QBPNBmpcYU7sQRLRoKKMe+
         Y3qn2MWeYsqPF/SkxUGWGcQBALmagsg6SCQzkdUNJ01Lhio8MJVVegODicByCjB/udL/
         Zuk2xTRoZz6FISmLVHU2qb9NQbPnxAW3GTITwIB6vt0wbJLxxd4HQWW/ozbmf6rumR6p
         bgAw==
X-Forwarded-Encrypted: i=1; AKwUvBw53WqNm9RRhjJ0n7I9HnmEtjVVdYBZQeMRrKu5tNZqwWMvzX0csaOomnpNw8J0O2EJElGcHLa2xjAYkB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNuh6JSyKV/Z/tCfcFqAwDrCiGhwmktQYPy+zUGvN5wCXveoIv
	+gt9p5PO0kdkhU67FxieZXz+AIKb7X9HIoHSGva70RV2C+t5gm7zEiSzTB0ZtUc4
X-Gm-Gg: AYBFou0Et6zqBUNLQq70ZBDaGC4UDrpin1HHTkzTb8NE/3WBu2ghRTLuus2AF1YKQhS
	z3CEu0kA7Jsc0lPKK4rBTCZk4ah9lw6AOU2Ijtyvnhuz4yMXI/kT1Ub8mfz2LXBJGYy3DU/uDF5
	zU0xuUxXc5xXu5nZWJxh7T9IqvTIQlVidl1rqD21Mj5bk9SKM0UTKklnqSPjHuSCEuogK9qUMaZ
	7fyxMm0bvjwnGItc4nSjANUius91MCOmJ2CK5QkqZ0aD9GZHFiflMIXKyWTHJmyET5U0wVEis4q
	IBYHY9kKUwpUkkkReDx/8dABwrpEI3K1dK1y18YG3OQgs+Xl6oLEefGRupbBxvbkaqDqkMHHxd2
	DAruCik5WLnCBSAsHRxzf96cYwDT/uH4fJ//jlnM05EKDiBgJMaisM8Nv65Eb/acbuZYiLcGO3P
	yP4j3uN7myiYxpeQptwcqHCBnVxFVgdoTFoBjogWHYVONBW/24FUqy/Juq7/Of05ZEb5OPcqLJB
	dnWvpPE2O3id5o12TJmvMPTZhcd5Nk7EwUKVuPIUnrar1ogXTgtZXOp2s0I8T8Buf34KjjEYIuu
	xHiYudoRu2ZVCljy1s/hRFld31Gbw9zdn/5ZGxJEaInPMQS2h+AyWsAJwJsbRdNYD+cg6UsE6ZA
	JwCgIifhmMzLLQuQfdy8i2P0t2d3nqBBnG7kIzOqN
X-Received: by 2002:a05:6102:604b:b0:7cc:25bc:3b27 with SMTP id ada2fe7eead31-7d07226d973mr786120137.5.1793358658951;
        Fri, 30 Oct 2026 04:10:58 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([191.34.116.20])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1841044137.4.2026.10.30.04.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:10:58 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 1/3] nfc: hci: free the skb sent through LLC nop
Date: Fri, 30 Oct 2026 08:10:42 -0300
Message-ID: <179335864272.64596.14178706469641120758@gmail.com>
In-Reply-To: <179335864271.64596.805818095553030218@gmail.com>
References: <179335864271.64596.805818095553030218@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

nfc_hci_msg_tx_work() hands each frame to nfc_llc_xmit_from_hci() and
only frees it if that fails: on success the LLC engine owns it.  SHDLC
queues the frame and frees it once it is acked, but LLC nop passes it
straight to the driver's xmit, and the phy write operations of its
users (the MEI phy of pn544 and microread) copy the data out and leave
the skb alone, so every frame sent to the controller is leaked.

This was found by LLM-assisted code review and confirmed with a
test-only module that registers st21nfca with LLC nop on a virtual phy
and a userspace controller emulator: 20 device up/down cycles leaked
598 skbuff_head_cache objects, and none with this patch.

Free the frame in llc_nop_xmit_from_hci() once the driver has sent it.

Fixes: 8af00d48dc92 ("NFC: Add a nop (passthrough) llc module to llc core")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/hci/llc_nop.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/nfc/hci/llc_nop.c b/net/nfc/hci/llc_nop.c
index f9c826a13..1603e435b 100644
--- a/net/nfc/hci/llc_nop.c
+++ b/net/nfc/hci/llc_nop.c
@@ -67,8 +67,17 @@ static void llc_nop_rcv_from_drv(struct nfc_llc *llc, struct sk_buff *skb)
 static int llc_nop_xmit_from_hci(struct nfc_llc *llc, struct sk_buff *skb)
 {
 	struct llc_nop *llc_nop = nfc_llc_get_data(llc);
+	int r;
 
-	return llc_nop->xmit_to_drv(llc_nop->hdev, skb);
+	/* The driver does not take ownership of the frame (the phy write
+	 * operations copy it out), and nfc_hci_msg_tx_work() only frees it
+	 * on error, so it is ours to free once it has been sent.
+	 */
+	r = llc_nop->xmit_to_drv(llc_nop->hdev, skb);
+	if (r == 0)
+		consume_skb(skb);
+
+	return r;
 }
 
 static const struct nfc_llc_ops llc_nop_ops = {
-- 
2.43.0

