Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F4B238D54
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376662; cv=none; b=VjTdsnTXnmSGDHGzFtUGyWGc+yvx/0EwdRle7uayJvYyI/laDWBmrErwwe6HX2SwStp4EZxGDMJwrS+bKuvjdSJtwfJpeFIUeCdpoj2XFY+fL9RgrlmgfkunG9L+qC7LtNXnMP6j88ppCNfaozQyDHvp7jCt2s98MUs1+BPhBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376662; c=relaxed/simple;
	bh=1V5t8LbiXAw8AROgOh5u2/xrbfArdg5eGIMOS+nX6CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g/ZsMt6oDZ4x1LKBLZBTxq6csfOL5RZYwaywiHdJ7c96Ix0Q+5C79K8pkRUcHfnl1YLg+m6APzOYGGKaJzjSMnoueFCcs/m3kjOVHA0Bat91/UTxjRnyJ/Lub46C47HXmJ0gn9NbddqkclkR8MgarCz45o/eB/TYH1h763wy+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFWm8XQz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFWm8XQz"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so1057945a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792376660; x=1792981460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Gk59ct/zaCRueU3AFoIL4iyqvmR/bVU0l3fys1RicI=;
        b=AFWm8XQz8in3tkX6gfzRNvpGPIFupSwizIpLt5MG9Z/7jRmgntXZWhQPmS1SN/AJsi
         Nm5SxQojXhNeXhAnE5k6o7w5rkK/PwhEFpz2FBfD/Jk1gyTqMXznfL9YPbY7gOkbOEzS
         f+PoPIu72COAdruXZ6v1f3i2xk/AzeEhWzLAaZIMlGYxdmnvDAFGJk/rCt5ZgBOxghLP
         5fuZvOxuUEE30Wx/qgYEmyrByFX7KnP4QSxRbUX9f0XHGXU7WsI0aIFiAzqcRnDpanu8
         LaWMvt4jmayl6Fx90CaFrp1k0HLP/su04jE+WJ6R6W9FIudu6yjv1Gmll3yvoksaPksU
         FKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376660; x=1792981460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Gk59ct/zaCRueU3AFoIL4iyqvmR/bVU0l3fys1RicI=;
        b=Bya5s+diP6gyGt/lBWyojjjbWl5emIK1CcWBxCGjJcB952XM5U9n4igKXEj0hIRBDB
         bm5Ny3vUFqqRJQ46HaiYN3aYMZ0BsZFYR52HYRt0WI7JDXvTe/l1yC/JPIdZqQZUsy2C
         D+n6ww1Ek9D0wMOiySBwpp+NkPmGysmytI67SSFMCLz1opQRNsFu7Z/T2w4tlzujBBX6
         esg5iqoYP6QJNvHR7g72C1tfxfeVBqwKSAoAj71X/tlFjoukFuwMJOxqGDYGziVN5YUm
         x7fIfXy3Z3z1pWfm2JTXvFwwWEx//izO4I3gM8VKTGgA+J1z3kLql37byC37LlFHB5F0
         t4mQ==
X-Forwarded-Encrypted: i=1; AKwUvByuaQKxvk5CadqPDDPZsGj9BmpSy5glmSOgTZCDxUh5n0a0CUvVNR2tY5SRjWadw20IfWGyEqGolQRnSdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr+3+9JnbqVE+VEP7LBB/QVP5duyJ0I5y0QIWCpcAlh2ioxWxG
	CaT3xHEfe1CaQS68TGUIW5zpbQFiEeF7/wZJOp9TlqzitYOk1IrfSHxRuo6FBQ==
X-Gm-Gg: AYBFou1avUTpz1QVvJ6WfvaLOm9sMcybwytzIsRjQ2KMrn1lwo4oDrtWJgGGW762SDq
	6DbyA4OOk56ZBru7pPm0CQmkfl64rREhQzgqOV8WlaEItSJ4KX87dwj/NBFMhx4muQPulSBPHdJ
	oD1f5VxKgHfUevQFBZHuCTOMLA+0HQxVMeDuQW+DK/w2DFU7wuPurkc4bAyb671ZPXBGXAyzOjX
	B4srok8UND4nrA/aU1WRcn9GBTnx0Jf9f2LigmRSWqcexYcRkl955+FVpv/YMrAjhRpex8LcyXy
	IBZZ2CC41iRLstTI7tKHtyTLtq7gfuDsEwwCKPQCFn1dam/DPdCnO6bqKQ36gJ9EB5ii6NrGhGL
	cf5srd1lixD7ORsOzrb3ICrP1OD1bhWl5QNFhpKQ5EdRQnelR0iOvLmkqgofEKQQaku4f6yMH5H
	WMjMxj92iY0UACyjrNlwZLbAJW7DWyTBEJji0CR8ymBxBEVskS5QtOMjv7SM+DGFwsf9AJl5Gi6
	FdsluMIqMw5wkTZLnAjInS54Qe/Fl4xZoYIzKc61foK8BSKugXfUM05hXiG0UizPYcYNcqnvuqt
	0PcJ70IZIxA7NaA10pau5ImaYI9+QMs7fyzaa3wW+7P6NA2PkJNIzipfSQjY
X-Received: by 2002:a17:90b:5108:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3acbb3d5753mr7030690a91.1.1792376659959;
        Sun, 18 Oct 2026 19:24:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm21169534a91.9.2026.10.18.19.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:24:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: "John W. Linville" <linville@tuxdriver.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	b43-dev@lists.infradead.org (open list:B43 WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless] wifi: b43: fix 2.4 GHz reception on HT-PHY
Date: Sun, 18 Oct 2026 19:24:18 -0700
Message-ID: <20261019022418.236356-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a BCM4331 (HT-PHY rev 1, radio 2059 rev 0) b43 barely receives in
the 2.4 GHz band, with or without HT: against an access point half a
metre away, 15-45% of the pings are lost and iperf3 runs at 0-3
Mbit/s each way. The 5 GHz band works.

An mmiotrace of wl 6.30.223.271 on the same card shows two things b43
does not do:

- wl writes PHY table 9, 48 entries, on every PHY init in both bands.
  b43 never writes it.
- wl writes the RX gain tables 0, 1 and 40 (one per core) and the gain
  code tables 2, 3 and 41 on every band change, with different values
  for 2.4 and 5 GHz. b43 only writes entries 8-11 of tables 0, 1 and
  40, once at init, with values that are neither.

Write table 9 at PHY init and the gain tables on every channel setup,
with wl's values for the band. Replaying wl's state on the card showed
that table 9 is needed for any reception at all, and the gain tables
for full throughput. This also answers the old question of whether wl
meant table 2 instead of 40: table 40 is the gain table of core 3.

With an RT-N16 access point on channel 6 without HT, iperf3 now runs
at 15 Mbit/s each way, and 2 of 40 pings sent right after association
are lost.

Fixes: 98f8dc72ac50 ("b43: HT-PHY: init: add missing small-tables writes")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_ht.c    | 62 ++++++++++++++++---
 .../net/wireless/broadcom/b43/tables_phy_ht.c | 11 ++++
 2 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_ht.c b/drivers/net/wireless/broadcom/b43/phy_ht.c
index fab8399c64f7..b6c200cba715 100644
--- a/drivers/net/wireless/broadcom/b43/phy_ht.c
+++ b/drivers/net/wireless/broadcom/b43/phy_ht.c
@@ -760,6 +760,58 @@ static void b43_phy_ht_spur_avoid(struct b43_wldev *dev,
 	b43_phy_ht_reset_cca(dev);
 }
 
+/*
+ * The RX gain tables depend on the band. Tables 0, 1 and 40 hold the gains
+ * of cores 1, 2 and 3, tables 2, 3 and 41 the matching gain codes. Values
+ * from wl, which writes them on every band change.
+ */
+static void b43_phy_ht_gain_tables(struct b43_wldev *dev,
+				   enum nl80211_band band)
+{
+	static const u8 gain_tbl[] = { 0, 1, 40 };
+	static const u8 code_tbl[] = { 2, 3, 41 };
+	static const u16 gain[2][4][4] = {
+		{ { 0x10, 0x10 }, { 0x0b, 0x11, 0x15, 0x1a },
+		  { 0xfd, 0x07, 0x07, 0x07 } },
+		{ { 0x0d, 0x0d }, { 0x0e, 0x14, 0x18, 0x1c },
+		  { 0xff, 0x07, 0x0b, 0x0b } },
+	};
+	static const u16 code[2][4] = {
+		{ 0, 1, 1, 1 }, { 0, 1, 2, 2 },
+	};
+	bool ghz5 = band == NL80211_BAND_5GHZ;
+	int core, i;
+
+	for (core = 0; core < ARRAY_SIZE(gain_tbl); core++) {
+		u8 g = gain_tbl[core], c = code_tbl[core];
+
+		for (i = 0; i < 2; i++)
+			b43_httab_write(dev, B43_HTTAB16(g, i),
+					gain[ghz5][0][i]);
+		for (i = 0; i < 4; i++) {
+			b43_httab_write(dev, B43_HTTAB16(g, 0x08 + i),
+					gain[ghz5][1][i]);
+			b43_httab_write(dev, B43_HTTAB16(g, 0x10 + i),
+					gain[ghz5][2][i]);
+			b43_httab_write(dev, B43_HTTAB16(c, 0x10 + i),
+					code[ghz5][i]);
+		}
+		for (i = 0; i <= 0xa; i++) {
+			if (ghz5) {
+				b43_httab_write(dev, B43_HTTAB16(g, 0x20 + i),
+						i < 2 ? 0xfa : 0xfd);
+				b43_httab_write(dev, B43_HTTAB16(c, 0x20 + i),
+						i < 2 ? 1 : 2);
+			} else {
+				b43_httab_write(dev, B43_HTTAB16(g, 0x20 + i),
+						i < 0xa ? 0x00 : 0xfd);
+				b43_httab_write(dev, B43_HTTAB16(c, 0x20 + i),
+						i < 0xa ? 1 : 2);
+			}
+		}
+	}
+}
+
 static void b43_phy_ht_channel_setup(struct b43_wldev *dev,
 				const struct b43_phy_ht_channeltab_e_phy *e,
 				struct ieee80211_channel *new_channel)
@@ -801,6 +853,8 @@ static void b43_phy_ht_channel_setup(struct b43_wldev *dev,
 
 	b43_phy_ht_spur_avoid(dev, new_channel);
 
+	b43_phy_ht_gain_tables(dev, new_channel->band);
+
 	b43_phy_write(dev, 0x017e, 0x3830);
 }
 
@@ -946,14 +1000,6 @@ static int b43_phy_ht_op_init(struct b43_wldev *dev)
 	b43_phy_maskset(dev, B43_PHY_OFDM(0x0141), 0xff00, 0x46);
 	b43_phy_maskset(dev, 0x0283, 0xff00, 0x40);
 
-	b43_httab_write_few(dev, B43_HTTAB16(00, 0x8), 4,
-			    0x09, 0x0e, 0x13, 0x18);
-	b43_httab_write_few(dev, B43_HTTAB16(01, 0x8), 4,
-			    0x09, 0x0e, 0x13, 0x18);
-	/* TODO: Did wl mean 2 instead of 40? */
-	b43_httab_write_few(dev, B43_HTTAB16(40, 0x8), 4,
-			    0x09, 0x0e, 0x13, 0x18);
-
 	b43_phy_maskset(dev, B43_PHY_OFDM(0x24), 0x3f, 0xd);
 	b43_phy_maskset(dev, B43_PHY_OFDM(0x64), 0x3f, 0xd);
 	b43_phy_maskset(dev, B43_PHY_OFDM(0xa4), 0x3f, 0xd);
diff --git a/drivers/net/wireless/broadcom/b43/tables_phy_ht.c b/drivers/net/wireless/broadcom/b43/tables_phy_ht.c
index 1acf2df66e5e..7952584c0170 100644
--- a/drivers/net/wireless/broadcom/b43/tables_phy_ht.c
+++ b/drivers/net/wireless/broadcom/b43/tables_phy_ht.c
@@ -14,6 +14,16 @@
 #include "phy_common.h"
 #include "phy_ht.h"
 
+/* Written by wl on every PHY init; without it 2.4 GHz reception fails */
+static const u16 b43_httab_0x09[] = {
+	0x0000, 0x0000, 0x0002, 0x0000, 0x0001, 0x0001, 0x0003, 0x0001,
+	0x0000, 0x0000, 0x0002, 0x0000, 0x0001, 0x0001, 0x0003, 0x0001,
+	0x0000, 0x0000, 0x0002, 0x0000, 0x0001, 0x0001, 0x0003, 0x0001,
+	0x0000, 0x0000, 0x0002, 0x0000, 0x0001, 0x0001, 0x0003, 0x0001,
+	0x0000, 0x0000, 0x0002, 0x0000, 0x0001, 0x0001, 0x0003, 0x0001,
+	0x0000, 0x0000, 0x0002, 0x0000, 0x0001, 0x0001, 0x0003, 0x0001,
+};
+
 static const u16 b43_httab_0x12[] = {
 	0x0000, 0x0008, 0x000a, 0x0010, 0x0012, 0x0019,
 	0x001a, 0x001c, 0x0080, 0x0088, 0x008a, 0x0090,
@@ -796,6 +806,7 @@ void b43_phy_ht_tables_init(struct b43_wldev *dev)
 	BUILD_BUG_ON(ARRAY_SIZE(b43_httab_0x1a_0xc0_late) !=
 			B43_HTTAB_1A_C0_LATE_SIZE);
 
+	httab_upload(dev, B43_HTTAB16(0x09, 0), b43_httab_0x09);
 	httab_upload(dev, B43_HTTAB16(0x12, 0), b43_httab_0x12);
 	httab_upload(dev, B43_HTTAB16(0x27, 0), b43_httab_0x27);
 	httab_upload(dev, B43_HTTAB16(0x26, 0), b43_httab_0x26);
-- 
2.56.0

