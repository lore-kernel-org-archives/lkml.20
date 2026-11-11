Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415204;
	b=T4J5SjnXERyltNZvhkvTsj2NLGCJ92QeqhGn0UijcidFidgSOY9lVJm1vbZx1YDzZMhr
	 sQCCZk68rXpdTTFQbbgqZsZeM7iOAE1IVzasE1Vt8Vn4O3doUj1bFNsxvmB86iIC33eEx
	 aHLYc5QJQFn53KVyqk1S6u7FMWBTB4Sb1GipQZeu3bbk0ThmQC36Fp0RrRckSX2EYx+CZ
	 wYuYwtYQke4d8Z9bSpxpFrxaSrSqNeb3zUB+gICh0z2ztReavAz6MGDzWkC7rbF2i7uXf
	 ilwPdVpOFuMkAZDcGPhG7Pw27w12q+1zfXtyeF9MoW3t8zrOYJ43TrOouhXKa4742OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DK/NRwKqv4Idy7jO63RXwvPCac5VLHLN/HkLe32hFbM=;
	b=ZlOvh9acvFRhwAVbpqIGD35o3F/65+GThBDwSxO7i1iKhOTNSBObCPWnS0wwBc8Bcegg
	 1n/N0Nsw7YiVYBUTZ1TKZHPsF1EfDshJVNpsZegK8oH2ymRkmLqiJjufGWvxgCwjRA030
	 64/S/7sYCON1KHOtEwL0HzAnl73wSh313O+q4VrhAygFIahKvIJWhi7cgnisgtinIPhQI
	 0iI3CIWAYHCv67lDGfZtEeyaDLaz7ugp0cXID3zPGrFkYH5OPWgp5O3bIALkJrj/841Rs
	 1AXBpIaSxAFdm07uAsjFduOw79zlvHireQw3J9ukFH2IueJILT+lUlQdyO8DZy8nW6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LoqCc/MR";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF1606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5AF1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LoqCc/MR
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso1717838a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415203; x=1795020003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DK/NRwKqv4Idy7jO63RXwvPCac5VLHLN/HkLe32hFbM=;
        b=LoqCc/MR9jv+G8Zww1geKlz7y0ShcuVx4ANEhnDNDO5Wpqw/0M3guUgzKw4uExm46R
         kijMwzDjeMg2QOLxXJNe/kKuwiEEzsPkFK5zrlJGl3Z5GWjcxIoLN5NiwabfOzOchs3l
         Rp/hIbyzDCugP/LSDxLwqlnFHpxOrR5bjAJfR1gweclbPp6ITeH9RsKWgFjJbkZyWQjJ
         PhCCdy8KBiFiZOCGCdCj4AzkMx5Mwbl2Or2yNV1D9JdSwz0nj0dLnAmRM3tNvl99dZbb
         EUCJp46z+ceEbSz8j32opjf8VTJbItjgoyW35N0nk2KByWsmlIEu4ifUbR8IJIkUHlTd
         4W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415203; x=1795020003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DK/NRwKqv4Idy7jO63RXwvPCac5VLHLN/HkLe32hFbM=;
        b=p9PfM1AdBhQ3YMhUwL0zQ3NFkx4eO93dHvng0LV1UGdVudj4EKdj+Jj2H1vJfXvtB/
         1qC+BN5Ns/Rzofz63syAplOtLlXjGTtWzycA5QtGFgWk035203YE5WrpWZ1r8BNey/W6
         hlRNyqk99A7ZzhUknwU32RuGaJI0pRxFCyMx66FYZmvh2fykX8uiUW+9kcOSczuTsun+
         /rMXLnXuUBTGXTrKlxaHMPG25383DcEjhMHCThw7D2KpTgK7yW2Nwsiwm9N3g3P9ZhIy
         HqrXZPzTmwbxcxi1G+ibqjS5XhWf5iU0Wlb9poTSgnUxRN9VqVMfN2u6MdygIoeb4KG0
         rHLg==
X-Forwarded-Encrypted: i=1; AL+hErFrmSkk3RA9DLnP5jejqTz/RrUzdR0JNx5zFScEq4tZ783FduBZWfDfonDX6+miXL7zPBQq0sdkynwhr0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vHpdgleT4uPqflON29Frvl2sFgzh1dBdmTivU96EhSEVjA6+K
	UQm1H5UntErkGT1ECA9hyyFPOBoDEZDGKyy3kb/FrYotix2cYpTEavdA
X-Gm-Gg: AYBFou0nAn190zhIUo4jJGl0Jj7HGdnaRevW5XnjejOIsh0NAk9mjuZxyNzPHAWPxsn
	IGG49+bfCcwNWsjunxZNm8HNb2qzYf5I0LlviC3vQpnADcCzFzmaewu4VXlERdY+yhnrJGMmo+N
	SU/28CN7VENY17B8c+r+gRl5v/eV63K5spytkKxqoWztFK+I0vhXv7o07OMUAadEOSoJZ9rnVO8
	4Rb3mtaLNrEuMY4rEt+Z793zIegl48q+n0mP58b3r5D9uukaP32JX76nlaYKJsQVYik4PtvfQY9
	JxI94Ro8euVsNFHMTuZjCITWLmWkSSKJRfvTnj3NxklewlwaOImDqDROAoSLnQ3YdG5v/2SLNot
	x5eL0y7Uad4L4YlXG5riuUeYvmzYqK03sldnWKMNlEnRH1OMTHEfLcdh6SOYrzlUHgKJWrhAS3E
	zQttAMOg+8j3L25o7x3WWijNLXOEHwI0emC2bE0G71Cnl7qcE2iaLxmaxuJfD60hKQUXH+W6WJL
	YHi5YmWV6L7U6W252AV/WW5haYJdGfpHGhOjn5fIAuE//Q0wd+VzReKnlqhBi0HqJ6mik8Gwkqh
	6NywBg/nEnmbBIlVaMchqzA6la5RQWLu7gn54Dyw5kK/1I8y5aI8NfxFxRsOVsDPpqKSKqHGk10
	=
X-Received: by 2002:a17:90b:54cc:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b182eda812mr2877851a91.27.1794415202712;
        Wed, 11 Nov 2026 08:40:02 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b2cdsm29035a91.16.2026.11.11.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:40:01 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: dsa: motorcomm: Resync SMI slave after interrupted MDIO access
Date: Thu, 12 Nov 2026 00:39:18 +0800
Message-ID: <20261111163954.1132921-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A register access over MDIO is 4 frames: 2 address writes followed by
2 data reads or writes. The SMI slave tracks the phase in a state
machine, so an access interrupted between frames, e.g. on an MDIO bus
error, leaves the machine in an unknown state, and every following
access fails or acts on a stale address until the machine is realigned.

The driver so far assumed every access succeeds, and relied on manual
resetting when the state machine wedged. However, without a dedicated
reset line, the reset itself goes through the same SMI interface,
causing the chicken-and-egg problem.

Realign the machine before the next access does its own work. Also, the
initial value is unsynced, so any stale state is not inherited.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 106 +++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..8b6c9739b684 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -94,10 +94,98 @@ struct yt921x_reg_mdio {
 	 * Keep this because we need switchid to form MII regaddrs anyway.
 	 */
 	unsigned char switchid;
+
+	bool synced;
 };
 
 /* TODO: SPI/I2C */
 
+/* An SMI register access is 4 MDIO frames. An interrupted access leaves the
+ * machine in an unknown state, and every following access fails or acts on a
+ * stale address.
+ *
+ * The driver used to assume every access succeeds, and relied on manual
+ * resetting when the state machine wedged. However, without a dedicated reset
+ * line, the reset itself goes through the same SMI interface, causing the
+ * chicken-and-egg problem. Furthermore, our driver verifies chip id before
+ * firing the reset, so that can never be triggered reliably.
+ *
+ * (A/D: address/data, H/L: hi/lo byte, r/w: read/write)
+ *
+ * State Input Next Comment
+ * ----- ----- ---- -------
+ * AH    aw    AL
+ * AH    dr    AH   `0xdead` sentinel
+ * AL    aw    DH
+ * AL    dr    AL   `0xdead` sentinel
+ * DHr   aw    AH   abort, frame discarded
+ * DHr   dr    DLr
+ * DLr   aw    AH   abort, frame discarded
+ * DLr   dr    AH   the access is done
+ * DHw   aw    AH   abort, frame discarded
+ * DHw   dw    DLw
+ * DLw   aw    AL   abort, frame consumed as next access's addr-hi
+ * DLw   dr    ?    `0xdead` sentinel; stay or advance undetermined
+ * DLw   dw    AH   the access commits
+ *
+ * The table lists the whitelisted frames only; any other REGAD/op combination
+ * is not characterized and is never emitted here.
+ *
+ * The resync sequence is dr, dr, aw, aw, dr, dr, plus one more dr as a sanity
+ * check: the machine must be back at AH, which reads the `0xdead` sentinel.
+ */
+static int yt921x_reg_mdio_resync(struct yt921x_reg_mdio *mdio)
+{
+	struct mii_bus *bus = mdio->bus;
+	int addr = mdio->addr;
+	u32 reg_addr;
+	u32 reg_data;
+	int res;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	reg_addr = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_ADDR |
+		   YT921X_SMI_READ;
+	reg_data = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_DATA |
+		   YT921X_SMI_READ;
+
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* aw */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* aw */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* AH --dr--> AH */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	res = res != 0xdead ? -EIO : 0;
+
+end:
+	mutex_unlock(&bus->mdio_lock);
+
+	mdio->synced = !res;
+	return res;
+}
+
 static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
 {
 	struct yt921x_reg_mdio *mdio = context;
@@ -108,6 +196,12 @@ static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
 	u32 val;
 	int res;
 
+	if (!mdio->synced) {
+		res = yt921x_reg_mdio_resync(mdio);
+		if (res)
+			return res;
+	}
+
 	/* Hold the mdio bus lock to avoid (un)locking for 4 times */
 	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
 
@@ -136,6 +230,9 @@ static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
 
 end:
 	mutex_unlock(&bus->mdio_lock);
+
+	if (res)
+		mdio->synced = false;
 	return res;
 }
 
@@ -148,6 +245,12 @@ static int yt921x_reg_mdio_write(void *context, u32 reg, u32 val)
 	u32 reg_data;
 	int res;
 
+	if (!mdio->synced) {
+		res = yt921x_reg_mdio_resync(mdio);
+		if (res)
+			return res;
+	}
+
 	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
 
 	reg_addr = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_ADDR |
@@ -172,6 +275,9 @@ static int yt921x_reg_mdio_write(void *context, u32 reg, u32 val)
 
 end:
 	mutex_unlock(&bus->mdio_lock);
+
+	if (res)
+		mdio->synced = false;
 	return res;
 }
 
-- 
2.53.0

