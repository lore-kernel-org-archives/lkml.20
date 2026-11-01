Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541212;
	b=YiALI7Xuc0xx+8sa/eoGlg62CYCHHBY3BWfU9Nb6stDUBm5XVgZxsT8MP2KzUNwEkuWs
	 aB2vGvLMuxxeElWAWKE4QfznZLdV3wUBBgjjXRBLnuhyZHC+qk7J6UbCBIzZUDkEAQXdy
	 3atD2wbuSOvqQAdfzDRaZ8ScTxZM5f7tw60iUjQhiVdEDnQz+mXC9Hox+u61C5QbYo70P
	 yhzkY1sXAbAy6MKAGt/IU+O3XKZy9PrVnlvjfTCvzZ2Ud+f1WYdkRj6Ex+Zxdk0apdCOB
	 n3+Zpa/6p9JyKGb2sVcWYu1Ob8kOE1HyjEt+cTHDfhHqw5unfbRkpiLNrM5ze9lo0Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ob9tiRoLzrD8MH3HJ+lkSzfmmvOaWtBTkgx8ANuE3JI=;
	b=gkkh4a+3JnVOLIHDGpNx292LM9ZkMknaW1+QEsI1mzJKLcIxtxLdukNvq7R4AXtrrwUD
	 qSZrAodtAzL7q/kp0oGU4D3ilmbXXWpxKJMl4WN/DQJYO5W2+M1WVzbFS/n1coRfkuSmv
	 kvy61/8CRAkBD/CH4p1OWsrwnKrb0iZXLy0/CXM89XpfWJOqt3Stln0ChcVfZ0Hx6C10R
	 jsVNvqqyy0yvR4ZZUoYO7m+l1HQtelniK1xWI1ooz1GeNiWXjgEYC5MqqOZezTpGXsTBd
	 EUqPtyY3UqIvX20MRV+6MqNJJ6jQbP2z9YdyVA5kXqdbgeI9nsnfkTBLbTvwFs7wdxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=iYQOPLGt;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FE8606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FE8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=iYQOPLGt
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ac9d666d4eso18852277b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793541210; x=1794146010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ob9tiRoLzrD8MH3HJ+lkSzfmmvOaWtBTkgx8ANuE3JI=;
        b=iYQOPLGtYwzVZnyj1j23lYqTPxmQHbYy60ll8geKmCKn/Hoqd4q2XlhcoWxWU4ZolX
         yx09r1t72DeBJI31edAdrMsdui10kyHITWbGUihd0+DIMQtUrvMTLSmrBi85/nV8TTHV
         YVLX2OuycFLflfLpNCnna7aRyGjXmLQPUZ/eSxOILp3DMHEShgh5qiOSb1V7zR4civ/d
         CAn8DkodHzzmlvKzEG2V6R6jnooi1UUVudQ4k/hzjQoUFvGpIWbgIkmWCjXmkt+6YSO6
         C91EnzeVvEDyLgw6A7kBnYSfpw5QZ7BydV7vNYH0QQVOoQE7QMMtHNtZRxxOa2SUS6lm
         7MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541210; x=1794146010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ob9tiRoLzrD8MH3HJ+lkSzfmmvOaWtBTkgx8ANuE3JI=;
        b=cBr4bw9JwIxnX+iKWwBVfSx+oIN++N/ikejHlRvOVZNshLSNrO5lVsiA5BTEuQHK1C
         9dqBriKSEwKomsMKadLxW64lJcYV5DVMr/SFiIQuC7U6D5VgVcPnUHuL/YpnbYJvrmnl
         doXVDlMSry5/P/BMKHyKGKImyPPw0EZOXPN3xSPtSD/GErmLdZxjKSMv81VjDZlwBzFy
         1VvE1yKh9CylGZ5X41F8qS1IdIEwuf7QdsMa/9dmFUoSbsc8iLwgCJs8J9MFeM/hiOGH
         Dfrvfvmc3QJDNaS0dTXmUm1PE/ACaTvmXv5r0gFL91jWuLtxg3B2jxcbsnMrWUYUWCpc
         iOfw==
X-Forwarded-Encrypted: i=1; AKwUvBzZrG67Ynp3jS1tHWVRN9z3diasmM6Lc7bKDZMsqUfNuNdeYbOJ1ChG+RNXs7EIMSF2cxXs7P2iww1TlYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B0FQvQ6aUscFPpxp2apVXt0LfpUPdXTCTeUyTrHvcBCbMfCaG
	Mzm98h8szVirm6a/CFvlLuT6eYO908v+ubbWOFQZMqAntBuAJCg/F67bDnMhsTshBA==
X-Gm-Gg: AYBFou3HlfhE6i4iH37GALb1+vFPk1X0l9zWifFfmVEydlh6ZAgECgLGvzZp9XuRE6Q
	7Mo1Els4rePA2iAuXFEAl51nnXMg4a+va+rjIIOOvxU9thyyqO/AEG7D1RcsN6ZHZFi1jJFCHuW
	YDKIGNdsbAJObIBAcaUiY26a93vAckTPa4zWIeShY41uyHN12HEBH9y4zjzJA1tloGDkAsRVnIY
	vDV2iYHBKn21jdCkkVIIWhGv8yrqqdLrhwRQgMS3rTSqZ3vvkBPehSa4WIlAtqJJxV2TkHnzITp
	snKNl7BuuBhOxIW8hBCWaJjdDCBA7gJUKLsv9qipwFCnaSVAGbZKLZHIABqFYHhPer77G3w3Ezu
	PoGG7CYWQ/wBU3zFk4rr1J3bN8OB6RbiXkUPF5pnzfyaHqBoWPH/hRowlbXQYdN3oZMivb9DmEq
	aRsWraUa0pwLGiS17rFBV/Edk8DtELvqYKSKXC/BarrE9adDnFEe3n391Pbll3Mc/hUc6No6n1I
	RUjWzdLSa48nfnAaB69vD5ECsMYMMO4jv7tYIwwsaN/stuYQCSaRmFLea7Zmyf83elWeGY=
X-Received: by 2002:a05:690c:f8f:b0:8a7:1943:17cb with SMTP id 00721157ae682-8b2b67c1d1dmr42944947b3.90.1793541210292;
        Sun, 01 Nov 2026 05:53:30 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71657besm36833807b3.30.2026.11.01.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:53:29 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH RESEND] Bluetooth: btintel: Drop dead !skb check in btintel_read_version()
Date: Sun,  1 Nov 2026 22:53:24 +0900
Message-Id: <20261101135324.2192752-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
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

__hci_cmd_sync() returns either an ERR_PTR or a valid non-NULL skb;
its internal NULL cases are converted to ERR_PTR(-ENODATA) before
return (net/bluetooth/hci_sync.c). After the preceding IS_ERR(skb)
filter, skb is guaranteed to be a valid non-NULL pointer, so the
!skb disjunct in the subsequent length check never triggers.

Drop the dead !skb subexpression; the skb->len size mismatch check
remains the real guard.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
Resending, as there has been no response since 2026-07-11.
Rebased onto current mainline; no other changes.

 drivers/bluetooth/btintel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 0709fb3212f96..4aff00e41d43e 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -471,7 +471,7 @@ int btintel_read_version(struct hci_dev *hdev, struct intel_version *ver)
 		return PTR_ERR(skb);
 	}
 
-	if (!skb || skb->len != sizeof(*ver)) {
+	if (skb->len != sizeof(*ver)) {
 		bt_dev_err(hdev, "Intel version event size mismatch");
 		kfree_skb(skb);
 		return -EILSEQ;
-- 
2.34.1

