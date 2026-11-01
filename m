Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793545024;
	b=rXFpZnJyE+ZYsyJxdTpJUBO3ui9DyWvW2lyny9D77BJCr2XIhwGxRxI7eC/Bnu6+E7qb
	 eD0EG8T7mcHfgdfeuVXXIqZNuo/zgeKmlqgw6/nC0tj6v+V1fOweaFnrEIkP0fwtBZYCL
	 sCRtbwsQwur10mIJJJhnixvD+0ZZA9WZ2Crjf+rMLS+XEeSUDu9Wvq+rutivIvZSmYsUF
	 gI5dk7TRRTaLuQjF8RAV7rKD7Jc39Jz7KOGaLSJCLDbNUVtQjsxNA2uRl2QprhZ2sMxpl
	 tsSS/BHxWFSD5eXqEbvCbnMBm3bX1qFhpDMKIMe6MSqsriGFg0ORJtul09Ig5YoxgaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793545024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L5lhL2beYV7BhyhbK9ACbFrNrJXtxDi/4b3LA9oMRFA=;
	b=3mIYNULbhd6HWroEZp5rYWeoJXMKz6/obYaNadEAnlKXGUm413UB3ZhZbDso2Rtf7Ce3
	 0jTIXV4b+nUK+ZP1Si3McuM0CnigCUODnbQGXy0R/nOFdGw5AC7Qe+HfQ1mgYHIQF+PMc
	 UhU0qqB4T5SZbS0SW3p/fy/HsiVbfKyiOjKN48BKIRnO0XEEbd9AL17+JmnZbxcvlLQ78
	 fjqTnUFIbny/e6c244QLKWBFmRtmDQD3jEr+np4C9iZrBT6rIW5mJuWGwfRkdNAGcsEzM
	 7M1dOCWgIj97Kqc+97f87bqlu+ZflPN2ONfOVAakTHDlVdlJooN4OrL7tzjaVrrpayA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QILQC8FE;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3922606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3922606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QILQC8FE
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso4433248a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793545021; x=1794149821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5lhL2beYV7BhyhbK9ACbFrNrJXtxDi/4b3LA9oMRFA=;
        b=QILQC8FE1WP2+aAvEV5glCxGnqssHHiRDH4Bu+bW8/rLzjezvWaIscoeNvwWY0XwtV
         sWHqhXZPQ7neMkYKtck2VSHZNgGryHhvszLlcaHpX0eKJG6x3qHlVq9spSPe2Eil1bUU
         ypGY9bWkGdrR8srF791MX7a7V0FS9IIiPee37U+7B6IWG4XhsP9cp10JcNJ/9+wFWwU7
         M8jGKwrD9Lpywn53jH4enEhA23ZsaSkSfLkffVHQyYINkGxF+Ur6zXpiBpUN/DV2Fd6s
         F0lDxNiSGF3vi/jU/N0VwGR+acvhKAnc6eL9NLSuuBxEyCrXlfBU7OUqVeW8AYRX5yRO
         9P+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793545021; x=1794149821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5lhL2beYV7BhyhbK9ACbFrNrJXtxDi/4b3LA9oMRFA=;
        b=vHP5FANZuVL+Oqynf78hf5O2sqz3eYqBMfZGJ8r4K2T85rk4rYS5xVt3UQ5SMagBtV
         jS9lhfbzOVvky5r2vozu0kChp8ZDNuL44doP0T4yBAhOViZoUsFYi3UYTdPNz6o3Vti5
         I0rD2whsg3MrOh+Yxj4/d/CAKIMWLzAj05OUcu4DpdG+Zkd/ezBntkFq55/oW/Gnq1u4
         ksJTzBITnOTroTZJltOP43hcLa8QAUP6sMFj/LLYdNw7BpFnU3EFwstZUvS+kOEHkc+4
         EnxZM10QBEfBfAPWwPUvwfUrn76+goiyOUBZqjkNRC3m/LKUrXJgwF/Kb/DgAq3/Umqs
         9qMA==
X-Forwarded-Encrypted: i=1; AKwUvBxas9TyRr5/y3FDeubFcL1lXmmb134ZpJJND6vBx6cGeeWQYT//GvzfVuRZKhtHynzxkSFpqdGalryHnz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9txKrsBiIb3JceX14ouyIatD5rMuoN9N8UBzletoTuwjQgo5jX
	sXlfuzv7KCnsguftCWA/55FVLxt0pEfzLYzY08aNY3Xt6UJyHNjU4Q3M
X-Gm-Gg: AYBFou1Y94RbIzjdGrxdJewj2D205HxwGuED1t6wTWVA6ZLhv+dNEyWmMx8J0qbOIjf
	YvqYhMD8rrLZpyx5ZHHCrp2W7lL5S9ww121c6SO/krtVDbePAo0SHvxXSOQT3glcFPLs29kUJhK
	00v0BHFVKtY9dcyiglTpPMVbuqiDSDyVHJzdsTXOYG5UnLCCAeheG7Bbu68PWyc7j1psgk0LNiP
	W88qWaX9wLoBZgSpw/JDo6yYsddEniGes8JsoyZMrQoE7AszlLfKyA9cNXIjUeErbl92o1nBpUi
	Dhj9G4m7NlsYODc00XSL2CtBWgeRSLFVzSlTC1+p4hTZQbJu2ZMIqfl1FF0JOgqej7fgb8MCM2j
	1B417ccR4AWoSKS6NK2DlULTMpAcaWqFCsR8TxDKurYcIDfpgZUjfpU93mopLdywnDlOV/04tgB
	YJiX81TjzNSEZ0/dcWKnpx3Otd6hokoG6kcWFO6v/q78J8ZhTx5UJJv9ajH8cKi1F1pIvsmJjIY
	MPK4rlFgeyIptNeAT8anj3w8DDTzBfGmvxp01oi3GSw4QEL7jphIKEaSM5bZvu2Wvb1dTLM4UTH
	Ips+NP8dMhH0G5wztnhxTLt9kz+S0XrrZrHXS1Ufl6CL
X-Received: by 2002:a05:6402:a50b:10b0:6b4:27a:38f7 with SMTP id 4fb4d7f45d1cf-6b4d46841c0mr3541426a12.22.1793545021117;
        Sun, 01 Nov 2026 06:57:01 -0800 (PST)
Received: from stukan.bbrouter ([46.201.91.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee975sm2166587a12.13.2026.11.01.06.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:56:59 -0800 (PST)
From: Timur Stukan <timur.stukan.linux@gmail.com>
To: netdev@vger.kernel.org
Cc: Hangbin Liu <hangbin.liu@linux.dev>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Timur Stukan <timur.stukan.linux@gmail.com>,
	Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jarod Wilson <jarod@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] bonding: 3ad: don't set BOND_LINK_FAIL on a slave that is not up
Date: Sun,  1 Nov 2026 16:56:53 +0200
Message-ID: <20261101145653.63648-1-timur.stukan.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In 802.3ad mode, when bond_update_speed_duplex() fails on NETDEV_UP or
NETDEV_CHANGE, bond_slave_netdev_event() sets the slave link to FAIL if
the slave has ever been up (last_link_up != 0), and to DOWN otherwise,
so that miimon can set it right once speed/duplex are valid.

last_link_up is never cleared, so a slave that is currently DOWN but
was up before is set to FAIL as well. miimon then treats it as a slave
that is still in use and takes it through the full down path again:
the link failure count is incremented, "link status definitely down"
is logged and the 802.3ad port is disabled a second time, although the
slave has not been up since it went down.

Reproduced in 802.3ad mode with miimon=100 by setting a slave down and
up again. On NETDEV_UP the speed is still unknown, so the notifier sets
FAIL, and the next miimon pass sees no carrier and proposes DOWN:

	ip link add bond0 type bond mode 802.3ad miimon 100 lacp_rate 1
	ip link set enp0s3 down
	ip link set enp0s4 down
	ip link set enp0s3 master bond0
	ip link set enp0s4 master bond0
	ip link set enp0s3 up
	ip link set enp0s4 up
	ip link set bond0 up
	# wait for LACP to settle
	ip link set enp0s3 down
	ip link set enp0s3 up

procfs then shows "Link Failure Count: 2" in enp0s3 slave part. Also in
dmesg wrote twice: "link status definitely down, disabling slave".

Fix this by setting FAIL only for a slave that is currently UP and
leaving other states alone. An up slave that loses speed/duplex still
goes through FAIL as before, and DOWN/BACK slaves are left to miimon,
as in the other modes.

Fixes: ea53abfab960 ("bonding/802.3ad: fix link_failure_count tracking")
Signed-off-by: Timur Stukan <timur.stukan.linux@gmail.com>
---
 drivers/net/bonding/bond_main.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 7019e5d8fdc8..8212d406f3bc 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -3973,18 +3973,13 @@ static int bond_slave_netdev_event(unsigned long event,
 	case NETDEV_CHANGE:
 		/* For 802.3ad mode only:
 		 * Getting invalid Speed/Duplex values here will put slave
-		 * in weird state. Mark it as link-fail if the link was
-		 * previously up or link-down if it hasn't yet come up, and
-		 * let link-monitoring (miimon) set it right when correct
-		 * speeds/duplex are available.
+		 * in weird state. Mark an up slave as link-fail and let
+		 * miimon set it right when correct speed/duplex are available.
 		 */
 		if (bond_update_speed_duplex(slave) &&
-		    BOND_MODE(bond) == BOND_MODE_8023AD) {
-			if (slave->last_link_up)
-				slave->link = BOND_LINK_FAIL;
-			else
-				slave->link = BOND_LINK_DOWN;
-		}
+		    BOND_MODE(bond) == BOND_MODE_8023AD &&
+		    slave->link == BOND_LINK_UP)
+			slave->link = BOND_LINK_FAIL;
 
 		if (BOND_MODE(bond) == BOND_MODE_8023AD)
 			bond_3ad_adapter_speed_duplex_changed(slave);
-- 
2.43.0

