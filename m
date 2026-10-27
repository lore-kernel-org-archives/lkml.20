Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113469;
	b=5BWM30piKtBXBPTpH4TSaSWYzwHNSKQo9rrWIXSr7GkzW1QNsfciJyg24N/Odvc3+zSz
	 +MrWBX5C1StWK/4a4/U5u50Sw14Uss4NHa7lkJ9+1DbfSUgem51hPMMwnrPjHufKephd+
	 2K+8NpcfWXK50/BSBg+Bl1WkE41HvkNhsrImHTFRkVr5mMiJ3BbHTWVPlx0guqeCXrpxj
	 fE1yF+hiPMsK0WtpOGqI5E109kDoigGZVucB8u2L/HtO/9iMD5fjA76bLor4kwaoUruES
	 IcvxEOGARBvYTio5Fh+t3M104v856FuWo4uMbxNH1bVrj4YYY86vboJEVqDXcOJNhng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+XtXpqT5FEcCOgiw9Ofa4pd6QtfZfviQBxyFezmRJqo=;
	b=bpA8j/yWTgkOV82TE5i3rbFFvV1y/s+ypRDBFYvksK902SU81MvN9hcd7l0cRoD8rWO0
	 a9Jh/AIFgNwkQF7ro4LA8ImN8pvWxcGOra+Y/VwSvkr9dZl5P51wRCCLApQN6HFqTsqQA
	 lZK2ec7m1k2kLVCI3t2RuSeKNEdypwCqBHSAwolePPs0Vr/cdPOype1vcC8JuVfaRQfMq
	 wMtTDgLr/AgbBT1+gLbiI4dt21goBO29ExrXR3WQV/qtQeRy+NAOTqDCIc8T626G0hith
	 VOxuOR1Bu/ljzXtxOcuUNUyKEOy0hriOfM2PRYtNWsR0dOb440EZyaHbmFW8sAv6cwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQf6+6Bx;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A860A2601
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 352A860A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQf6+6Bx
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-824f3901d55so4568510a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113467; x=1793718267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+XtXpqT5FEcCOgiw9Ofa4pd6QtfZfviQBxyFezmRJqo=;
        b=AQf6+6Bx1UX3xOT7oQVjv5r9sYWhX8WV13c56tZGSKSDRCu4xL1MthyWQoqseGeaku
         ZGRz1e0I+h4JNGJ72AU6zJF+RxjMkKlT8G3ssX4jpj3cakliQCoyr05xhCvF34bzsZts
         u8i06m0lqjLAKpYtdQ0X1n3gG5XRjSa91qE7yvr3mU0fTe8jKMwxHOL4EvFKYOCiG8mD
         rIQv/LeV7Cw57C7JJBh+MU+Tt+bZvN1GgldoPp+OBB3HHpu1amY+bDr2MbFAPLRgn9AI
         +ePvGLlp/j1Z2d9SbsblMdCMKtJqSaBY35Gr6KT1xnJtimxNlfofjrUxKVq3QX2SePCP
         +3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113467; x=1793718267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+XtXpqT5FEcCOgiw9Ofa4pd6QtfZfviQBxyFezmRJqo=;
        b=aI9lsFUt/7kEsQl0IfcPkG9WubJZHvFAXl4X0Myjg+Fm5WU5YMddYCe4CC6gq8mR43
         tcKwBLIABkAwtsoncujHeTWXc52VEXhwj7erjovBPP872egRDEfVBKyuBRtWj9VzNQfe
         8+mEohIc3MAinCh6v/BJna6bbDNjL9bHSEn30qVGU7lzGAKmi3xV7OGcAXo4ebY73xSQ
         1G96JbwpJ0RP/3t6XNaJe5BJSyFiUryh6MIbUyqJb5vUZrVA7e1RMV0wUSDSmMm39L89
         NHn20q42gJqJut7rBA+wyVJFuxDOBR/INKYViaCaFBTPBR9cob++nEodauzbIYaYeDZ6
         q7VA==
X-Forwarded-Encrypted: i=1; AKwUvBw1qTrRcSyxI+s2p3RJT1it+hTCO+lpfoaOlafEqMnHerqqGUdpkn8U75yw0l7yY11Ssh3hyb1ZvMORrpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFAZv6ZYbi2OwtL0eCpyzPyCOXUFE38hc2sCYGmmQLNMTJdPc6
	4ElQX/7ep4p1e1H4tjAKM2fNwzmK7Ic3aD7qohpTXRUKSCWIAG46Y2/7
X-Gm-Gg: AYBFou3yenRVhWgFUBK9A4aI98twannpq5YCIEujTihsqby62r/s+xKWr/46ph2aXqN
	VRwqn4nsezdXwL053IaJ+2XcaeADkGCne1aRzNAixVZDVcsfMKWGe8cEGQJfd7ZSI/rQhh8M9tw
	HG9WSnrtwYpysL7TlZQmDCfkfhq5BR2r/gHiETTi172pU2ZtwAYeRmDUuaX2x4xPyPj/1gYK9k7
	6d6qk0gd3JMV6gNmgqU81dnbfwnPrOzfD1EHmOu07hXQOx/iWChC4D161nvzirZl54C82362XeN
	2ik7dZ09zpx27ZRqCzbanqSZN7kgQiZecMfZ97nPVzgnq+LU7uoTbFRxerKNfwB1BJ/hkK9PoTL
	CNbznmo8+KHUW5oQjmRD/Yii3TNV6HSXrRqiqawZ+usVqqcuqP1RKbPWphPQzOFV8fB/FRCL3Ue
	tNYYZARM1NpvDncEWnqZhZpo/xMJCN4lW73DZ31xE+F9hrOMNPKO3s0rzXtXrXL+V5itZ3Ifdn3
	egN/7flJ0DEje5INPBhFNKo3cUGGjIFUUiYv1wEfFADzIFkDN3WX+9TL6S85mLolp0TFWCFj6sC
	9B0QnFdcHOZkDYmVnw==
X-Received: by 2002:a05:6830:2406:b0:845:7cb:69f7 with SMTP id 46e09a7af769-850fae80212mr8574590a34.3.1793113466823;
        Tue, 27 Oct 2026 08:04:26 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.163])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fbb25f59sm10837058a34.20.2026.10.27.08.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:04:25 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] Bluetooth: L2CAP: fix memory leak from repeated configuration of a connected ERTM channel
Date: Tue, 27 Oct 2026 23:04:17 +0800
Message-ID: <20261027150417.942699-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

l2cap_config_req() accepts a CONF_REQ on a channel that is already
BT_CONNECTED (the state check explicitly allows it), and
l2cap_config_rsp() has no state check at all. A misbehaving BR/EDR peer
can therefore drive a connected ERTM channel through the configuration
procedure any number of times:

 1. CONF_REQ on the connected channel re-arms CONF_OUTPUT_DONE
    (l2cap_parse_conf_req() sets it on a successful parse);
 2. CONF_RSP(SUCCESS) sets CONF_INPUT_DONE and, because
    CONF_OUTPUT_DONE is set, calls l2cap_ertm_init() once more.

Every re-entry of l2cap_ertm_init() leaks memory and resets the ERTM
state machine on a live channel:

  - chan->sdu = NULL drops a partially reassembled skb (leak);
  - skb_queue_head_init(&chan->tx_q / &chan->srej_q) detaches every
    queued frame from the lists (leak);
  - l2cap_seq_list_init() overwrites chan->srej_list.list /
    chan->retrans_list.list without freeing the previous arrays (leak
    of two kmalloc arrays per round).

Normally l2cap_chan_ready() clears conf_state so the re-entry cannot
happen; but l2cap_chan_ready() returns early when the channel is
already BT_CONNECTED, so a peer that keeps the channel connected
while replaying CONF_REQ/CONF_RSP pairs bypasses that reset entirely.

Drop BT_CONNECTED from the states that accept a CONF_REQ, and have
l2cap_config_rsp() bail out when the channel is connected, keeping the
configuration procedure strictly pre-connection.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 96298f640104 ("Bluetooth: L2CAP: handle l2cap config request during open state")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/bluetooth/l2cap_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index aaa2a1cd489a5..ffd771a799510 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -4382,8 +4382,7 @@ static inline int l2cap_config_req(struct l2cap_conn *conn,
 		return 0;
 	}
 
-	if (chan->state != BT_CONFIG && chan->state != BT_CONNECT2 &&
-	    chan->state != BT_CONNECTED) {
+	if (chan->state != BT_CONFIG && chan->state != BT_CONNECT2) {
 		cmd_reject_invalid_cid(conn, cmd->ident, chan->scid,
 				       chan->dcid);
 		goto unlock;
@@ -4493,6 +4492,12 @@ static inline int l2cap_config_rsp(struct l2cap_conn *conn,
 	if (!chan)
 		return 0;
 
+	if (chan->state == BT_CONNECTED) {
+		l2cap_chan_unlock(chan);
+		l2cap_chan_put(chan);
+		return 0;
+	}
+
 	switch (result) {
 	case L2CAP_CONF_SUCCESS:
 		l2cap_conf_rfc_get(chan, rsp->data, len);
-- 
2.43.7
