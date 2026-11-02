Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635123;
	b=v2SwbQqN20Y1mh8z07qps7yihlh9RWpb6Wrj5Yxwuk7dqJibnUovbv06isxUmG4Hlpct
	 QYH6d+88txVMMMNX8RRcYytItY8pROv7o2KmFLNHaTX75L0+uK2ZU18whTvGGgqNDcME1
	 9TpTb2o0tEXakTS/edUNOF5h0LcGg2ycKg/rz6HOY6BU4UjQgg8ree2oeNlK0kCjXk9EZ
	 m8Be1amKghmy9JTVqlxa0AodLMfLhlh5KeG3iJVgdXQG0NsQGejfU3qe40YvRLX7YN+P5
	 uS8HBw6hNAme21Lg0fNe/OvEjWR0ooYz8q/8tXD6WQKZwk2KRK1tsd5PGU4E3ezmtiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sI6mXD4yaK7Ns7KJBv2qv3XEUsVwizuE1gM/skedcVA=;
	b=nokVqNcLA4ZrT6IVuMdQ2t2KbftOHkR348eXAPNWi9VKIWpdOjOAJVTf7BAoLCqViMwl
	 dOED+9o7NQjeznkv6ystxihUmI3wCDMbseSEXSBjxZkgVUUZW9s7iz0MfXkZz819W+ztP
	 H+AnQ6D4bZuKHjVsFKz94z27yJFL/CmFQyr7/ti/2Bv4c8/w4sG++eGRijCc91VVgtIw8
	 egKKU4AJaB9SEML25hEtmKVJyxNfkS+byA0f1L8flfWn1oPasnaIm9qprWvIZ8Ywk22+d
	 PnLu2wXuNuJ6yHg0W4q4/Xen6UIwE+o06xhye5QuY0u55rzK4ejcvhLbD+rUXkQKiaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJUWMay8;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB42260B9941
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB42260B9941
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJUWMay8
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2001989a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793635122; x=1794239922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sI6mXD4yaK7Ns7KJBv2qv3XEUsVwizuE1gM/skedcVA=;
        b=eJUWMay8nXxOvoeA7ZaJmxGcmoyEELAJPJmKNuDB+VE1xWFlhJVmmKDRdLYtyj6N9U
         Rf81WbSVE0jjdAs9a1NVx2JkhWpwgOvcmpsqamDNhRAAO2hkaZmQMOL7yeI4prhevzps
         rSJNsWOcglrR8OlhSKJlxY5p5jdAqrCAInEHo02UUVhQNPXlyyPK36NZ1FShywOSh36w
         Prxa4kg45TK+Oam0If3OBemT1ld68CrHwswfIZfoQ/Oq7EovP2GPXLjZs2VdH552MtjK
         mNRbZ/IdBXaeDCPVa9rtuL9vxyIsWxV0fmhbDSIjpwGd/SO0FbdaKivWjhIw+Ou0c++l
         OqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635122; x=1794239922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sI6mXD4yaK7Ns7KJBv2qv3XEUsVwizuE1gM/skedcVA=;
        b=TfLsfjPt0EWlZ4Tcyys5af8B8Xf5cwITgjsSkIh0wiQyQYj1gtBTsakmpQ4cnS95T5
         /FMyq3uHJYWnXDY5OhBgEokuwm5bSmuRoofkYM1bwqRI3AByThD3ksiZGN3YiH16zJmm
         LKR2J7O5JnuFJHr0oPZt6zgUqqSBAg6VB+7s2wVNqVunFQoYzvAvbm11lmM0prIRBi8Q
         G826JUeorS2brF7jz4qwgV2aFF1AdO7EILutDn3A/4a51RC4eHJJ7+7R0E6ky/MEB7aX
         cf6hzSG2+xieJjbhqmnuC+Ek/v/yCc/A9hGMj3BiwWViEHmdzD1n0jVDg5edTs8UxRHN
         BD/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNQoBiuYgondLqA8U1nkc25cgqhqoOZwW2sOT1z+tXHfmp1KBH4Q0/byKHmYvyisJQhVeP0/1daIW9ETo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pXg4W3jrr4928Kkb0QG27UEpgCLpnq1ado1WnyS8AGtAKV5dL
	mZCvx78PDiZKHgTHeN1kNuaN2JidomFqGZEsTLNWCJ7OfAx6eaw7Opwl
X-Gm-Gg: AYBFou37YXgeXCo+86864PnPJtXDI3sX6ILMY3auhfXFjFmsUVqd2K3KGK4yuBYO/wn
	yOoM84Qsxrx55RRcY9OiDaR7Xmf0JshY4Qwlp+9JDXeq3rY7UMNepvRP2v/WooSP5Y3N59YayOk
	jQOVADdLG3OJ5IOwEsNfJxvjbV6l0Eh8eGkwl70A4lUkt1QnBgV3SYN+ehJMCwnzAEnyciOVGXm
	ZLROR8hzCgGZi7gVYaNDJ61acq4PboE+fbBP+eAG1lG5wHXRhjmrtCPv4CLw7XsUyTSg643k4O3
	YOu4jF/0yZ7iTWzJcniD3t1d/+3+G8d8rexkhRI1zL8OhryCxlYN8SB+ZbbOZstCbIeud6QRj6T
	5bTVuJ0ih+TVn0N7Dq2aL7+8egjJK6LcPDlSWoLgbtExPPJoA8aOyKoxhSAYaacgLr/wJXtk3VA
	LCb1REl2FC5scUZQEvtwliYmGzUQ0jCh/MfZwINt1U+N7h78zWm9A/QVwp11m0WJEnWCqyXts8M
	Bp1Icwo3B3SOVBx4bjB612FXp0treFXnG4euOyb0f53QFxxRuO/6NQXwVQXxyI5OhuIkf8vSbbh
	/rfpK0RXTeaFQX/QmzRsceRSmGb7yegRotc9zwDzI6jxb2PQhJzY
X-Received: by 2002:a17:90b:28c7:b0:3a0:a912:e759 with SMTP id 98e67ed59e1d1-3ae897ee62amr8717288a91.25.1793635122045;
        Mon, 02 Nov 2026 07:58:42 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d429fsm19183949a91.2.2026.11.02.07.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:58:41 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/6] net: dsa: motorcomm: Translate FDB VID for VLAN-unaware bridges
Date: Mon,  2 Nov 2026 23:56:36 +0800
Message-ID: <20261102155641.3682626-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102155641.3682626-1-mmyangfl@gmail.com>
References: <20261102155641.3682626-1-mmyangfl@gmail.com>
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

A VLAN-unaware bridge reports VID 0 for its FDB entries, but lookups run
with the unaware FID (VID 4095). Entries added through switchdev were
installed under FID 0 and could never be hit by the hardware lookups.

Translate the unaware FID and VID 0 back and forth, so the software
mapping stays symmetric with the hardware lookups.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 907f7a5b0687..447736854870 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -590,6 +590,9 @@ yt921x_fdb_dump(struct yt921x_priv *priv, u16 ports_mask,
 	res = yt921x_fdb_read(priv, addr, &vid, &pmask, &index, &status);
 	if (res)
 		return res;
+
+	if (vid == YT921X_VID_UNWARE)
+		vid = 0;
 	if ((pmask & ports_mask) && !is_multicast_ether_addr(addr)) {
 		res = cb(addr, vid,
 			 status == YT921X_FDB_ENTRY_STATUS_STATIC, data);
@@ -618,6 +621,8 @@ yt921x_fdb_dump(struct yt921x_priv *priv, u16 ports_mask,
 		if (!pmask)
 			break;
 
+		if (vid == YT921X_VID_UNWARE)
+			vid = 0;
 		if ((pmask & ports_mask) && !is_multicast_ether_addr(addr)) {
 			res = cb(addr, vid,
 				 status == YT921X_FDB_ENTRY_STATUS_STATIC,
@@ -740,6 +745,10 @@ yt921x_fdb_leave(struct yt921x_priv *priv, const unsigned char *addr,
 	u32 val;
 	int res;
 
+	/* See yt921x_fdb_join() */
+	if (!vid)
+		vid = YT921X_VID_UNWARE;
+
 	/* Check for presence */
 	res = yt921x_fdb_has(priv, addr, vid, &index);
 	if (res)
@@ -782,6 +791,13 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 	u32 val2;
 	int res;
 
+	/* A vlan-unaware bridge reports vid 0, but untagged lookups on its
+	 * ports run with the unaware FID; map so that static entries match the
+	 * hardware lookups.
+	 */
+	if (!vid)
+		vid = YT921X_VID_UNWARE;
+
 	/* Check for presence */
 	res = yt921x_fdb_has(priv, addr, vid, &index);
 	if (res)
-- 
2.53.0

