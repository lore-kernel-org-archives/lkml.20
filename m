Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464C137FF6A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856265; cv=none; b=kIJwU7t8YfVlZN+G2dZxBt/hW8OpnLGb3U8pRIRS5PuHgBoAwAsy/nSrETxmnexGOsD29zcWydcDGa+GzATSrDevVYPApQ8XYsgn1vYUrWqoNE6a0vhXfaKutab1PKoY/0PrwKyjt3chXUSMuCcVd17akFxErux6oHe8M/vj5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856265; c=relaxed/simple;
	bh=YSHkjkJs4CsY0ILw6c3tAHOBfJsRlxF/vuZrLf/ebGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ie0ApYuj7CerJHvf+4F5Hq6/SmwCmFd79joCjfMYJ7WQM5sm5Y1EYIvLf4+ASD/P9LibzqYKGNlmmmDVO7o0AaNA4kjyMTPX5BhGC/9EbRg5I5vUydhoeWzyHyp+1Ga3LAqa4M6f7PK4qeDROwku0AGVh//lfQOv2MEYmTUDMN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OP7Lfp7+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OP7Lfp7+"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so15794225ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856261; x=1790461061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqiQzbKzMiEybSTxBW9L4SlPZ7ERZ8e3u4vm4ptlPAo=;
        b=OP7Lfp7+eZ+ZFtMlR1Y8l9bBBtMRkC+RicGOdgFGdfvQ8te1FyIz5GUf6TMEBjyJ1g
         3oRLD0/En1x+gJB5qYsVBBH3WLbJsS+okRHT7DflBlOxCHHyq9dvzZwoDzg9tCgTDvoF
         FUbMZeZeO0BqbR/UldHPOTBjskA4mJjUhbXzV102rMfp+voS7CgYyMh9VF3Ra+2f1VaW
         E2g5ZDfKTxhuG1l1xD5z0lBI8Zgl/kKFaVeU0L4//dU2lOqu+KYqxuq+FtD4NXx9r904
         65d2cqW+Ncjf4UDeaZT7Qh+ib569NQUmlgCk+JUOHFBGLAZ6MLwA93pU7CiYE6pqzEdl
         1Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856261; x=1790461061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqiQzbKzMiEybSTxBW9L4SlPZ7ERZ8e3u4vm4ptlPAo=;
        b=sGxHB12rlCwCfyMqc2xA1EIbh1dY3fC6yXD8om6vuhl5SupSsH8xt2Ng/5HV4Ia0rx
         4QtnZKlJq97nz4vEW5pOT0yu8AR4o+MfuwAVFyE8garyXJ/6FClDMJCOuIjKVivYArmK
         6HHukfAEOME2PvzfyOHXSXique8txPTFuWpN+Y28HbM/ADKkZJ8yIiB8+fRYcicDuVal
         XYe0aIqjrM9B33XYDXRNoyJ9NQi1WWEYFZhe4/4nsBl1TttDJNXrLQXZR1AHGvuXww9O
         DXhFs6c5yYnvP2q7EC2+F3briOV8XVjMAlK/5USW9A7WTaPT/IJBdBdQA2sXh6Kk6nYi
         IF5w==
X-Forwarded-Encrypted: i=1; AKwUvByeRfIqJYxDAnziKcy+H1e81clEEzUDyNV+QXbyZqRGARgA4J0xD1YfH2lBakmXNfZTuAlpBFC0cW5b+Dg=@vger.kernel.org
X-Gm-Message-State: AFuF++lzRt20z90wgUN4ojBU3cmzPxOsLCDE4PQ92udiXcbHdOQjtxgW
	9uF6UsbXuoghdQRlE/p+cE3v19HEvK0taHD8+IgnIzo+LE9HZKOob8B6
X-Gm-Gg: AYBFou2+czdO282c0TlYMuHho16Si3T4XzUBV9XjfedvCU6A/haBivckmRdfKRtYmEA
	713sPjHu1iC2Z3hyucVGKbzJ+rTh5AhZK9ar9a2U3ae1D20XYyS3p1BpiJuleQD3nrwqpdSiD9d
	ZMzv7HGtB7NHLxkHzQIxkxzChpDCNdKLYYXt2El0OpkPfWY6BMgb0cWgbTW0Lpn2eMY5oCJcUFc
	WdUVj9gTb4+ZZyNZseJrVDrjDOR2WImv8UZqw0Uo4osKl/YNecyvaZRomoDHtXK7/l7ZY4cLNZu
	td8B2E5P6rW+xG4n3q6FNALqxWfbp424mEfANRpStYxesaVavMLmc0a2+lNQLynhyjoddSFuTay
	wOLNFYXe1fmglzpPVXpCQd2jwRUx9nb4UaQEelTa2epaF+wvhFWYjM/XZiCOYXsrvgi/CF0qWSN
	RVPmmi2eXvwfMCDT+aJkmMNtqRr6P9sKLB542nGMz3HyQxUZh+jVZ554lugVQblgoT/6XzmjSS1
	mYaOldF7/0fHdgObV7j1iCuWU1A8kSs6Xj6HzugvplW3RuLzHsiBKzL5qUeBkoR4cc4EEvCpeD/
	2fxKvKqHxg==
X-Received: by 2002:a17:90b:530f:b0:39e:4c80:44be with SMTP id 98e67ed59e1d1-39e54e277d5mr11840903a91.33.1789856261250;
        Sat, 19 Sep 2026 15:17:41 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca4ef3esm6328976a91.1.2026.09.19.15.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:40 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_sock: fix negative cookie IDA free and short event OOB read
Date: Sat, 19 Sep 2026 22:17:39 +0000
Message-ID: <20260919221739.3708895-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hci_sock_release(), check hci_pi(sk)->cookie > 0 before calling
ida_free(&sock_cookie_ida, ...) so an unallocated or error cookie does
not trigger a negative IDA index warning, and in hci_sock_sendmsg() /
hci_send_to_channel(), validate skb->len before reading HCI event
headers.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
index 070ca388f9ac..ab960cf2efb2 100644
--- a/net/bluetooth/hci_sock.c
+++ b/net/bluetooth/hci_sock.c
@@ -115,7 +115,7 @@ static void hci_sock_free_cookie(struct sock *sk)
 {
 	int id = hci_pi(sk)->cookie;
 
-	if (id) {
+	if (id > 0) {
 		hci_pi(sk)->cookie = 0;
 		ida_free(&sock_cookie_ida, id);
 	}
@@ -177,6 +177,9 @@ static bool is_filtered_packet(struct sock *sk, struct sk_buff *skb)
 	if (hci_skb_pkt_type(skb) != HCI_EVENT_PKT)
 		return false;
 
+	if (skb->len < HCI_EVENT_HDR_SIZE)
+		return true;
+
 	flt_event = (*(__u8 *)skb->data & HCI_FLT_EVENT_BITS);
 
 	if (!hci_test_bit(flt_event, &flt->event_mask))
@@ -187,11 +190,13 @@ static bool is_filtered_packet(struct sock *sk, struct sk_buff *skb)
 		return false;
 
 	if (flt_event == HCI_EV_CMD_COMPLETE &&
-	    flt->opcode != get_unaligned((__le16 *)(skb->data + 3)))
+	    (skb->len < 5 ||
+	     flt->opcode != get_unaligned((__le16 *)(skb->data + 3))))
 		return true;
 
 	if (flt_event == HCI_EV_CMD_STATUS &&
-	    flt->opcode != get_unaligned((__le16 *)(skb->data + 4)))
+	    (skb->len < 6 ||
+	     flt->opcode != get_unaligned((__le16 *)(skb->data + 4))))
 		return true;
 
 	return false;
