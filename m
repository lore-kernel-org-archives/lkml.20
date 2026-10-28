Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156475;
	b=sqKgOX87dX8ielQgFmpuAMBqNFKFA4dj3LJvel8wk+LA33EhTiMB6qG5b92FPX7KOuWR
	 d/l6r6FVuQ4TN0NTn8Vawqf3JUoQwez5qqv7R34D0ygI4BT883BkjdrOg68CPs2uhwinR
	 u1t+WuuZOrxvIhDzPktoz+Vf7748C6lya8rtucHBcR1aTEurkn3y2cCcegV7AMuWh+0Dw
	 2+p8GVJ47hxuxPGHbq9oxPBcpd5u9Fn2Cm1bxpzaiMZqfw9mPMsIB86Hhult9XnXb4jH6
	 B98vnH7vLBBgEcdaxje30tsYizEEB1hoNbB55tDi5pGdR3VZThNrlMg+MOpwcl4YLcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9PnFWzT4ZetD3ik9zsui77LQ52Y8BICw8ljy81KMriw=;
	b=as+AdB5J1Oz6H/BcHBGvVWrpxv6MWEGg6ZUQuuOFi90FuqTnJDEdp/2p1NlhTvPeYyBs
	 e1qLub+6Uobp/7CHbsmICA8UUUdnpM7mvQBg1oYrV1GbEG+FdoSYCfToJRxGL9CkHExdM
	 JScADxr61uXFz2SbQTEvkk312s8WchPgeLNhYxK5G+kxkDtiWOhFqOGH9FLuJJCGdufau
	 8dSLU1RVbRvLNZI80Hw2uS2VZqV/C4RHiZkfJYW7LmM9CU11/MtP2qu3kCDDJtPEgS6no
	 YjEv3VCyaWGUEWnY7oc1dpeMMPLNl+Sh4OYYDD7lhJrgg1XTtgS2U07YjsytFrW2YLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atjFsLOB;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC90606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC90606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=atjFsLOB
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-84e8a9fae57so207748a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156474; x=1793761274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PnFWzT4ZetD3ik9zsui77LQ52Y8BICw8ljy81KMriw=;
        b=atjFsLOBuMbhXbFgurTKb5yps9bMzFMF3XR2VfFg1jqtE750QWEliiQXcw3DMlbmFR
         x4Avb5z6Qc8OQO9IQUJXjVdWxEKsPBdqrflWWbQ9HBO9DKAwWlZati+SgAgfE2uNVpph
         K5p172iUgi23y+peyB2Dc0iXaLOjIpCQ6BtgYOc2bFbCbx/3q79y2EEVF2c+PyipG5ox
         NioY+xFNtEZxaP25kxifO6cWoj74+Sqig0DatRlkr5KPwWX6zygP3dX+BJ8P6mylsYFb
         ePd6HCptISXu9Gd4botRqG7RQnsThahG6ebac+A5iFn3ZE+kWJPBDO7napx2PI1tBEd9
         jvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156474; x=1793761274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PnFWzT4ZetD3ik9zsui77LQ52Y8BICw8ljy81KMriw=;
        b=wazplDabE+QjkYpwpI5us3SPLa9BDy2zX1Uj+81d6feqHP/g2rCPm1tVByPWVORJWP
         mOk+7OkYWSFWHbwxU4LWxJXluvs0PBaoJ0RPKGORQimWSEB7deaGx4ISUhR93ldtOeG2
         UGgZr+G+AJTprOwbmSiaSaoncUlD3/eokfOFz4yGJs4Ijs0tP7crlJDHZmk3TBCf7Try
         Yan0WXNTjt3JHE45pN1RXdgFdlx8VkiaaHwDyFBdIQ8OJc/HHmrWl10PKTWWVTnoASLS
         SR0pz9cMTv1+GkAV1VPMmPWCpN7A1mz6JbAZ/+yhlJKptCwti9OGWSARu/B+RxpdqB97
         a6qg==
X-Forwarded-Encrypted: i=1; AKwUvBwK4oWMYnruc2OSqWOWh7G38DzXjd7lgDQmXEK/buNEUSHCdW8EIkZeU+3xrTWpJV4Ba71TBWCu5TTsMbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk/WqqsPQaEJ46HafzZ0+tn6IK3WT1A/9Ba5D+Bb4/7SRsUO9h
	zBbdaDUqhbkRHft0xLf4j0hk7d/qEbkhxZqisjmaolmTeSPmIufa+PYB
X-Gm-Gg: AYBFou0cw+AeCzMRXNH71sQX5FgbUeO76jdhjnukPt/4ADNZpb4J44vXgW1ToD8FWPw
	lyRsFmBU2+DNix84JDzaoQeXjW3zQF+keoBk6rmrMGoAbYFLSO4N6/CJzZucLDIebk2No0aXU4t
	JORh3Xmg7VOkQOWH7n8xMJ3rlz2SUZfGInzjHOiUkGtwKbTQSfODwy52fXvrTkWa/6Zr71EH08G
	2j4TebpOQeM8ilJmstpEcyGMMm23zamuE75UwdIYokJ1mfA2M0HCaHlXv5DmWwLsz7e8yucF4Lk
	U1By2L53x2/nt4fD6uWmAekhvtNUNe6FqYTHaEf8HqhOjV0oGFm6LTo9BuPuW7Fm75qZz6YBpi0
	1DTN8Smm21rRiG0MJ7dDVrW3fyQzCM7Pi6NWpWSIO6DZwJ+MGdFhG7Vn9aKhDwQj/P9ccsAI3y4
	Rj0OreqbEeDPDkJJQWkf0V/enY4DLPUlhxN6J854oVnW92ynzGn6XbJDlV9d3BbTvi+9EnBWfRz
	Yqc7Hu2Ez0gE/AVML6PgxBQS97YsmixLhOZDpcqeBYbCRM/hWxyqir9F1xRtqUiuk8txU4uyQ77
	nxGtSza9A6hNcb83fBJqRh8zb7+z0MskTg57eSpZEtwI7sk1UdMnq4vnFCqvDnz9fBc=
X-Received: by 2002:a05:6830:2701:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-85ab753d198mr1238284a34.11.1793156473961;
        Tue, 27 Oct 2026 20:01:13 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.180])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b20216574sm470580a34.20.2026.10.27.20.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:01:13 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] Bluetooth: L2CAP: fix memory leak from repeated configuration of a connected ERTM channel
Date: Wed, 28 Oct 2026 11:01:07 +0800
Message-ID: <20261028030107.2213982-1-bsdhenrymartin@gmail.com>
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

v2: Rebase onto current bluetooth-next (the lookup helpers no longer
    take the channel lock, so the config_rsp bail now drops the
    reference with l2cap_chan_put() only, without
    l2cap_chan_unlock()).  Fixes the CI apply failure against
    bluetooth-next HEAD.

---
 net/bluetooth/l2cap_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 0000000000000..0000000000000 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -4591,8 +4591,7 @@
 
 	lockdep_assert_held(&chan->conn->lock);
 
-	if (chan->state != BT_CONFIG && chan->state != BT_CONNECT2 &&
-	    chan->state != BT_CONNECTED) {
+	if (chan->state != BT_CONFIG && chan->state != BT_CONNECT2) {
 		cmd_reject_invalid_cid(conn, cmd->ident, chan->scid,
 				       chan->dcid);
 		goto unlock;
@@ -4709,6 +4708,11 @@
 	if (!chan)
 		return 0;
 
+	if (chan->state == BT_CONNECTED) {
+		l2cap_chan_put(chan);
+		return 0;
+	}
+
 	l2cap_chan_lock(chan);
 
 	lockdep_assert_held(&chan->conn->lock);
---
-- 
2.43.7
