Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665520;
	b=YN+BpSuuiBFdCV0EaLZNl0+Jj8T4DV4gnVK9W7fvKbWO2cTiNipqS7wv5Zs2SuntELt+
	 vgMnWbW62aEKbIldAsEFB0p77yv2EfsnmYzOjSYjWR7s7doM9PWvIllfRj+9lh3c10AYA
	 tXwDTDf4KTrVRHwMWsPbG8CeKMCVzTpkH6Tg1dhM1ZEHIet5NYKPEKEF6hrtPJFMi/q4e
	 Eekt+G8NNpGpsgLPN8p/8rtA+LoLtxTXujqLl/JTdll8aAA9xG8a1AgrYBARkHfQ7ehpg
	 I4ZYD6HdpLDnZDl1SgyWr2vUJu+U9+Cflq6kOfWOiyi22scaDl4jMeY1BdB/7zoyWMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pVMLwxSCpD/ytFzS+nn7Bl0k4R6JGoce3kfN9Q3T/gw=;
	b=fCqv9RSHXi6o7YM9kggj5W8lvZrhYaj71S/IbRebEYngrajECFmT3KnFV/b9WLSnCN+e
	 mr4OTSD9u/6C8n/yOHLLT9cZ3dKGpGU6kpqkyMu4/Gwt4T14rtYoH3PqrT3U7dTjjm9ha
	 tS3yUb6xcCyyqu4k7CU3yRue4seb9H6cj9juCDWCHb2HJep42DJMjx6Az92mcuD9DJeHy
	 Qo5Z6I/nkxdfWI0MAatFCAVAyH7UASsrG9ArxidiJEzFw3zXw5a3mPlxhGoemJ+HNoi3/
	 QmPmaXC5ph6nmBU21tqR74VvmNvTaFC6AKNEjCnfjSY2MwUXOMY6mJFwZD1yThx5xlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UtzxzJsb;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBE5606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBE5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UtzxzJsb
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dc202a60eso851491f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792665519; x=1793270319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pVMLwxSCpD/ytFzS+nn7Bl0k4R6JGoce3kfN9Q3T/gw=;
        b=UtzxzJsbudrr2qENNOpIb/DQSaek2Lte0iA7WVnmAhe++JCzDY4NETk3cY5qG1iF28
         jD00fXy5tX9Bia9+j25Cvn1nmc92x/8ejbXORmkNUH4smbpOF9RDErn+77ON+zG9B3O6
         Xt9SFf0RdU2L4sY9jljEiY2J8B9tGEyJUjlalWRODeYV2kD4XrxgZU1nNnMOVq3cDiyM
         aoCiMFU7cfHKlawnMe7yn9l3/s9QP+whZGlTynnKtlAhARncxOPux0u6gLAO8IRH0HDQ
         soflXpobOeGb+BNCIK28cOMg4N7ahUtPi2VaGs0vUbuE54PO/BUaMt0Ivc4jx+4oa4Rd
         zMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665519; x=1793270319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVMLwxSCpD/ytFzS+nn7Bl0k4R6JGoce3kfN9Q3T/gw=;
        b=CcdmCieuzyLGE1imeU0D+jCbmU5uC+emEeUK0nvdnUxPVSplYK6kFuS4Zr3RpZY8JM
         fDhKjIXd5lPmINivzCLZMnMB3P0N0euGg7g3BlGy/jXX0PTa+O6H/I7QTRMRrtYjrtH2
         /rJgm5uhhdy1dkS94HBpysnH3irSZfxtQ2soit8E/FKvfbgM2UGE2H2qC2eRTJKaao9Q
         oWfnOyed9Sgfuv9fFBFHpUps7g0F0w2BdDWo2AXK74lrWrxqxatPj2zdQreK5yqbaRYD
         D/3cjVARo73xtYA1Q6bcrHOuVjbnBjgtY6EfcbMrGDWTBTs880dS5uuf4X2OUdVKpX1Y
         FURg==
X-Forwarded-Encrypted: i=1; AKwUvBwx6UhWMIUUaAbr0aKuSo+30X64JPj/uwQ+MBV16YMTPThQU7Tkp+1irrGFKLexakz/r+XwLovxqNMD520=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9sProGnboRGrkeY76Hmc27YLvbdrcY0t7WqFaGXZn0UNLUHrX
	1Q0sFgmvOPHXwq6mG6rm6s1LLL4GpGI4BWBKrcpf5+AmF52IcFL44k5h
X-Gm-Gg: AYBFou2ZrMTJN9DAcykm5Eo64hXa9jagx+9tFqAHlC1x7Lz4LIOh0Eah1WEHGAGtl1w
	Yf13p1glrrRgJcwSdYg5rm8Fxb7xUHev+Buu+JVC1Q6DWTVaa9pt9kqI01O6mnZ41CB88yg7aZj
	l9UIO9sKD2L2WLVyY3naweHCK7QQYtt21be8375oKmNrvdKyzS+2TUfKP4EmEzmJLwbeWh5M5WQ
	3ONPt+KdlV++Tmq0SbhuTcx8b8zIEjrxbAuc+a7UaRFPEvNHT3KIoclr5MtonfhDLoiT2IoPbSK
	J0l6UoaBgOZNwGkx+ot/KquvOOVtCD91NaB4cMxuY4tedqJQC7vIUgKRsYjh4W2nDbjdTDckDry
	Rsn1LlXyc1o9T5VRtcu3uAK7hQguwDXqSKOYoYeumPCSVoOrl4G5a2HuGFzeTUKCvKGbkyMhwp5
	DoEnX6uBlXYkF1o2boY/xUbiH/AS8EtdkuHKIp+kIPRif8qrQVRFemcE9VpnZhG2qVZe4+0vr5k
	dxge/nJZGBNfgq1tBxLq0Uq8OXqDKbUJyZxB91/Qj5nJAo7RQJsTwE/ej1soDMs0cPvOSnlm9Pc
	hcb01pjLltj62PxudO7pinoVoA==
X-Received: by 2002:a05:6000:1789:b0:48d:ffcb:28e1 with SMTP id ffacd0b85a97d-48e264a6351mr10425346f8f.11.1792665518651;
        Thu, 22 Oct 2026 03:38:38 -0700 (PDT)
Received: from stukan.bbrouter (224-91-201-46.pool.ukrtel.net. [46.201.91.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f02f1sm12757371f8f.3.2026.10.22.03.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:38:38 -0700 (PDT)
From: Timur Stukan <timur.stukan.linux@gmail.com>
To: netdev@vger.kernel.org
Cc: Hangbin Liu <liuhangbin@gmail.com>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Timur Stukan <timur.stukan.linux@gmail.com>,
	Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] bonding: fix missing down path on speed/duplex failure after FAIL->UP
Date: Thu, 22 Oct 2026 13:38:21 +0300
Message-ID: <20261022103821.89552-1-timur.stukan.linux@gmail.com>
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

In bond_miimon_commit(), when a slave is proposed as BOND_LINK_UP but
bond_update_speed_duplex() fails in bonding mode that needs speed/duplex
(802.3ad, tlb, alb), the slave is set to BOND_LINK_DOWN directly. This
bypasses bond_set_slave_link_state(), bond_miimon_link_change() and
failover.

This is fine for slave that coming from BOND_LINK_BACK, which was never
brought up and is not in use. But since commit 1899bb325149 ("bonding:
fix state transition issue in link monitoring") the commit phase also
handles BOND_LINK_FAIL -> BOND_LINK_UP which means a slave that is still
in use and may be curr_active_slave.

If the link recovers within downdelay and goes down again before the
commit phase reads speed/duplex, the slave is silently marked down while
remaining the active slave in worst cases. In alb/tlb the bond MAC stays
on the dead port, no failover happens and TLB/RLB state is not cleaned,
so the bond stops passing traffic until that link comes back even though
other slaves are up. A non-active slave is affected too, in alb, RLB
clients assigned to it are not reassigned and become unreachable.

Reproduced in tlb and alb mode with miimon=100 and downdelay=10000 by
flapping a slave within downdelay and dropping it again before commit
(a longer delay was added between inspect and commit to make window
wider and easier to test):
  bond0: (slave enp0s3): link status down for interface, disabling it in 10000 ms
  bond0: (slave enp0s3): link status up again after 3400 ms
  bond0: (slave enp0s3): failed to get link speed/duplex

procfs then shows the active slave with "MII Status: down" and "Link
Failure Count: 0", and all traffic is lost.

Fix this by recording the link state before the miimon commit and when
the speed/duplex update fails for a slave coming from BOND_LINK_FAIL,
taking it through the regular down path, including failover. The
BOND_LINK_BACK case keeps the current behaviour. The down path is moved
into bond_miimon_slave_down() so both callers share it.

After the fix:
  bond0: (slave enp0s3): failed to get link speed/duplex
  bond0: (slave enp0s3): link status definitely down, disabling slave
  bond0: (slave enp0s4): making interface the new active one

Fixes: 1899bb325149 ("bonding: fix state transition issue in link monitoring")
Signed-off-by: Timur Stukan <timur.stukan.linux@gmail.com>
---

Notes:
    sizeof(struct slave) grows from 608 to 616 bytes due to padding.
    I kept link_prev_state next to link/link_new_state for readability;
    it can be moved into the hole after 'delay' if preferred.

 drivers/net/bonding/bond_main.c | 53 ++++++++++++++++++++++-----------
 include/net/bonding.h           |  1 +
 2 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 09aa45d71fab..602ad697a9c2 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -2779,6 +2779,27 @@ static void bond_miimon_link_change(struct bonding *bond,
 	}
 }
 
+static bool bond_miimon_slave_down(struct bonding *bond,
+				   struct slave *slave)
+{
+	if (slave->link_failure_count < UINT_MAX)
+		slave->link_failure_count++;
+
+	bond_set_slave_link_state(slave, BOND_LINK_DOWN,
+				  BOND_SLAVE_NOTIFY_NOW);
+
+	if (BOND_MODE(bond) == BOND_MODE_ACTIVEBACKUP ||
+	    BOND_MODE(bond) == BOND_MODE_8023AD)
+		bond_set_slave_inactive_flags(slave,
+					      BOND_SLAVE_NOTIFY_NOW);
+
+	slave_info(bond->dev, slave->dev, "link status definitely down, disabling slave\n");
+
+	bond_miimon_link_change(bond, slave, BOND_LINK_DOWN);
+
+	return slave == rcu_access_pointer(bond->curr_active_slave);
+}
+
 static void bond_miimon_commit(struct bonding *bond)
 {
 	struct slave *slave, *primary, *active;
@@ -2807,10 +2828,21 @@ static void bond_miimon_commit(struct bonding *bond)
 			err = bond_update_speed_duplex(slave);
 			netdev_unlock_ops(slave->dev);
 			if (err && bond_needs_speed_duplex(bond)) {
-				slave->link = BOND_LINK_DOWN;
 				if (net_ratelimit())
 					slave_warn(bond->dev, slave->dev,
 						   "failed to get link speed/duplex\n");
+				/* Coming from FAIL, the slave is still in
+				 * use and may be curr_active_slave, so take
+				 * it through the full down path. Coming from
+				 * DOWN/BACK, it was never brought up, so just
+				 * revert it to DOWN.
+				 */
+				if (slave->link_prev_state == BOND_LINK_FAIL) {
+					if (bond_miimon_slave_down(bond, slave))
+						do_failover = true;
+					continue;
+				}
+				slave->link = BOND_LINK_DOWN;
 				continue;
 			}
 			bond_set_slave_link_state(slave, BOND_LINK_UP,
@@ -2839,24 +2871,8 @@ static void bond_miimon_commit(struct bonding *bond)
 			continue;
 
 		case BOND_LINK_DOWN:
-			if (slave->link_failure_count < UINT_MAX)
-				slave->link_failure_count++;
-
-			bond_set_slave_link_state(slave, BOND_LINK_DOWN,
-						  BOND_SLAVE_NOTIFY_NOW);
-
-			if (BOND_MODE(bond) == BOND_MODE_ACTIVEBACKUP ||
-			    BOND_MODE(bond) == BOND_MODE_8023AD)
-				bond_set_slave_inactive_flags(slave,
-							      BOND_SLAVE_NOTIFY_NOW);
-
-			slave_info(bond->dev, slave->dev, "link status definitely down, disabling slave\n");
-
-			bond_miimon_link_change(bond, slave, BOND_LINK_DOWN);
-
-			if (slave == rcu_access_pointer(bond->curr_active_slave))
+			if (bond_miimon_slave_down(bond, slave))
 				do_failover = true;
-
 			continue;
 
 		case BOND_LINK_FAIL:
@@ -2919,6 +2935,7 @@ static void bond_mii_monitor(struct work_struct *work)
 
 		if (commit) {
 			bond_for_each_slave(bond, slave, iter) {
+				slave->link_prev_state = slave->link;
 				bond_commit_link_state(slave,
 						       BOND_SLAVE_NOTIFY_LATER);
 			}
diff --git a/include/net/bonding.h b/include/net/bonding.h
index 598d56b1bc97..b2b102946fe1 100644
--- a/include/net/bonding.h
+++ b/include/net/bonding.h
@@ -165,6 +165,7 @@ struct slave {
 	unsigned long target_last_arp_rx[BOND_MAX_ARP_TARGETS];
 	s8     link;		/* one of BOND_LINK_XXXX */
 	s8     link_new_state;	/* one of BOND_LINK_XXXX */
+	s8     link_prev_state; /* one of BOND_LINK_XXXX */
 	u8     backup:1,   /* indicates backup slave. Value corresponds with
 			      BOND_STATE_ACTIVE and BOND_STATE_BACKUP */
 	       inactive:1, /* indicates inactive slave */
-- 
2.43.0

