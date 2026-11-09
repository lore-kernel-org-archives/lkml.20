Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231921;
	b=QL6Ocej+9sjU1mZcbCAR7Qmv3B6E1eKLbEaLWX2mf5GPhcrbOsyu7dMr8SFdF4+fuxp4
	 8zCxPublosUjoxVboJTwGM5naYK5ZVsAjc7/+9VAgGbGwt+K1luojOc/nRwmZZceQyGay
	 U/l5HO4TEqXsbbNANHyeIiEE+R0Z0RzB67pZGfUIBiadUDCufmP+UMw/K48fZQKp5BiTK
	 UMUcZSv16XrFXh4dfu/Jc9jZypx/3BZBFoGgCdxJs0GNbek9R/vl7CdEvWUFc6b41hNW9
	 h+38lixjnv/bPNy3F2VY4h5PywnMd8nRMBzMAzHTTH6+ga8W+YuUABZOPU3oGJy55Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZB33fDrAm2+MTpVzqHevrVjMtTfx0w/Sxjvwb8uQmek=;
	b=cSq1detZSeZvNMCG1gOZjI2h7OK9Ay+v0UuCZ3hnwDIzZioYa3Q9ySrKPeWfYtNUyjTb
	 0UVRquMXAsLQOTUlh+IQMhM2kbP9Kp/m4hk0pYWRe4H4Qkb8B+0NPsQWG6+F5+kOeHIaY
	 E8/nllb1UUQtxTXPH3YKdx4CGG6BJkFj3Cj5N3EnsIl/x4r/TgS+R0QEfH6Ynq3qPeH48
	 4vn4b2ceKjfQQOQTZHF7lO47vvw7siW0oviONNNw15tZ+M9AJhE5qT3/0me265JSu32Hl
	 6ESJ0CjhizAWD0E5RbB5SkHeVeva/BWzkMewYLVtX4o924na9e49z5i/YdXmj4UZecQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vD5Yodr3;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A995606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A995606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vD5Yodr3
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso437004a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231921; x=1794836721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZB33fDrAm2+MTpVzqHevrVjMtTfx0w/Sxjvwb8uQmek=;
        b=vD5Yodr3X1C0rOWGiV4KYpByjyi5NN2U1kf/rt9jVtcRLs+Wh/OK/kef9yZI+La0H9
         mUkBg1N2VbAN85LyfTRZVjUUEhdGXYeMc90gN0QhtcvWozHmNPKdIbKmjPo233RqkNJl
         WQPg5mqCPM4ZBmKbZDiLSsFGcvftdrtoFFBOTXPFJRClb0fmwW5a3mCjUED8RTLZ/9gJ
         aP5DztaUutJ6VNxAResBO2W5MEG82FX3SMrWa5yqZF9N61gLogY5HjLIebxU3x/EV1P7
         v/0TTBGZ1vF7yOzeMzdYw39D3gTtnwkXksBNtYPa4dZWh/97nVW1rw7enctg3blDPY8e
         IaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231921; x=1794836721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZB33fDrAm2+MTpVzqHevrVjMtTfx0w/Sxjvwb8uQmek=;
        b=oLKPUVpQll/g+q8DIX//YMefKvROxqkIgO922ewNC+O5IT0z9PBlC9LSIvMdAkXCQG
         imKAzZDlZGYxs1RTE923XtBaqAE6onAY7HYCftDH16ehOK4fOlPXkVi0yzJ4nYhDJXa4
         wz7WEXZIIZRUFaCJ/qBkjGHxBN5HuR5INkpxUHywQwIwJL20YnZ1Z1FmSnWuUOTrA5Dq
         RCtES1miU/6aoNCiEbPY+E7se0vRn3gndnvpTAa7eq1OozJxn8AXvsoX9cAAKYqPjJRK
         D5vj32FG1HZw/k9B3PWfTc4cdNQc5i97t4ntSYel9wLUcTakKt7yC6dW5UYMqQFXtkk1
         yN+Q==
X-Forwarded-Encrypted: i=1; AL+hErHKqJEdXm9sU6IF1Rq9s0Q6JhWm5Rzry376PQxEsHq8wvyvAzOi1m2ktEJFvLvMoDv1X/dlDU5SatIkK2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XyplqSZsByvLYGySPl8o9CbPhN50wy0oxcuQwO75/q4pE3hZY
	9X2cAEKA1nNgMG4INvjAhLqh4AOd8Brq1LqFSioSl8pp2N/uJJgd3K4d
X-Gm-Gg: AYBFou0WHV9h5qslf53fWmP/A0OBZiDapWjAjdlyXWvJ9l0+krxD3s/LmFMtWzM+ffp
	1iLZUySrkJHqUM7D/fKNYdMGY5zyy2N6+zaMQONovIwNrjOruYhJOIC35MnMLyZUpfz6vfjfGyR
	nmJR4OcgqZz+m4UeMz54Y25ZCf/PYofjDasy3CtRw9tN1x1kR4qC+cA8jQMYQHPCDIkF72J/IEw
	a+BOE6by/2SZNsptp4iFS89n0O9GwSVmVXKsVREBEGEwMN79KmelGIkjUevs4bml3GIuHF0yw9T
	5PnVr8EabslQjxaH6L8x4WhEtMp6uBxPlbkBBZVCDv8TDUv2rr55PrXx79N7y45MDiOvN8CZaB3
	YvRokM4ypU7DPNnWW9/LWVKkaVY00srVuzmXgAITw/JCaKDUcrbdxWIPCYBP7Hj+5CBMvWwTxq4
	qAjbMPq4sGi2MGY2jCA3FxgehWJmNciM9+d3+hwz5N6TwICfzIGlpD2JYV+W3xyjd53SqsSF48B
	5t0NkFN8qATXrq4wqoNOqP5X+Thz1R5tayHy50J/j6Ws7KRRfNkWLUKsiZcO9P5dcVCaPyfAQxE
	duae1nxE6zqjlcqVBLS8qI6/ZRBo
X-Received: by 2002:a17:902:f710:b0:2ed:1b02:f6f2 with SMTP id d9443c01a7336-2ed833ee3abmr40925505ad.6.1794231920747;
        Mon, 09 Nov 2026 05:45:20 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81727f9bsm11014285ad.57.2026.11.09.05.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:45:20 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	rmk+kernel@armlinux.org.uk,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v10 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Mon,  9 Nov 2026 21:45:03 +0800
Message-Id: <20261109134506.2794160-1-zxyan0222@gmail.com>
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

This series adds auxiliary snapshot (EXTTS) interrupt support to
DWXGMAC2/DWXLGMAC2, fixes a stale TSIS race on the Agilex5
cross-timestamp path that the new handler would otherwise expose, and
guards the shared aux snapshot handler against a zero channel mask.

Patch 1 makes smtg_crosststamp() complete on the persistent ATSNS
count instead of the transient TSIS bit, waits for the FIFO clear to
complete, and holds aux_ts_lock across the whole trigger/poll/drain
sequence so a concurrent EXTTS request cannot flush the snapshot FIFO
mid-flight.

Patch 2 guards the shared aux snapshot handler against a zero channel
mask: ilog2() is applied to the mask without a zero check, and
ilog2(0) yields an out-of-range event index that ptp_clock_event()
feeds to test_bit() unchecked from hard IRQ context.

Patch 3 adds a dedicated DWXGMAC2 timestamp interrupt handler.  The
XGMAC hwif entries used the generic ops, whose callback read the wrong
register and whose enable mask omitted the timestamp interrupt, so the
clock advertised the aux snapshot channels but no event was ever
delivered.  XGMAC_TSIE is not enabled by default; it is armed on demand
from the EXTTS enable/disable path through a new callback, and the
handler only touches the FIFO while the interrupt is armed and while no
cross-timestamp owns it.  The interrupt is disarmed on suspend and
unregister and re-armed on resume.

The failure fixed by patch 3 was hit while bringing up auxiliary
snapshot interrupts on a local DWXGMAC2 board (not Agilex5-class):
enabling an EXTTS channel succeeded but no PTP_CLOCK_EXTTS event ever
arrived.  After the change the same board delivers EXTTS events on the
enabled channel.  The races fixed by patches 1 and 2 were found by
reviewing the code paths that this bring-up exposed; they are narrow
race windows and were not reproduced on hardware in isolation.

---

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6: https://lore.kernel.org/netdev/20260929073553.4136336-1-zxyan0222@gmail.com/
v7: https://lore.kernel.org/netdev/20261004120526.2728564-1-zxyan0222@gmail.com/
v8: https://lore.kernel.org/netdev/20261013033207.1684328-1-zxyan0222@gmail.com/
v9: https://lore.kernel.org/netdev/20261104125030.1183146-1-zxyan0222@gmail.com/

v10:
- Rebase on net-next from 2026-11-09 (containing 7.4-rc2, which moves
  the est_lock initialisation next to the aux_ts_lock one).
- Wrap two lines that exceeded 80 columns.

-- 
2.34.1

