Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513063;
	b=tlXvxiTrz/qTNeb7Zf0zWmlzu0hEPLkC0qPI6sJYcYoe95ipDzszXSicAVmv8XBh4BAo
	 tegAEbSPKge4Uh9ZDfRlai7kp9STyarK6IkmNibPwOrn+WteWm4mNbtbv/oc9CSdVjRu8
	 BYsprDHfmyK5ZjK7DKfnshoL8Vx7X5IhmeWivdIEwNMsSJXtR2V76GiCubGJLqobV6e1q
	 0GsOTjzRJAP8QKlJAZ5/16yM7bZSDC7bZI9QfsHnGmPp0VGJf5Kn4HOXE73h1AxHIaQo/
	 JE+yCO6UM/C1KimnfL2nMEoudqJdkPFXCvCcLL0+19wQpPzGTLyumJ2eVoQWypc6Zgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iy1PGAVVFI8dPYiM+gpo0fvo32WV7ANCCu1Cx/iZJPM=;
	b=PJwxQSI1R96XtWM5ilo3yHs5Re85i3F2P9zyQM78bD6DQkTDpTEuv8MZV79qJPMcU2Gs
	 xiHMEKdUemKdA2ZnPmtTO/Bue7IigTNzg+oYjTzqwpfAffd7Qm9YbDARWJ59byhtURDZw
	 mWb9DV5r9iKRVvUPGlmcp8So9UDI6hcmwYIAK3GwYk8J6LXM0Bv/U+2m4YnFyCy8MxcBf
	 qYq2d3IM9lECIUQlR4iOz+xeohWgTkqQIjh/Sw3Idi1Ru4OSDfE4Ozf7e+XRtQe4tx2ZJ
	 C5F0jiIhtMuKkDgZDOlE2O5w4AB1nrUt6cpUkI+5Vqi3wDXDDUXT3oq+qyXT7ptIizA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQvutxD7;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB253606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB253606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQvutxD7
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4697404c2bso18081466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513061; x=1795117861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iy1PGAVVFI8dPYiM+gpo0fvo32WV7ANCCu1Cx/iZJPM=;
        b=IQvutxD7F9WZ/sQGFXApOc2N+biixFiqUql7tu7RejqBuBTFnqSLJv7DSjQqMyImKH
         JF1tw4JNvYvq8lDeF/CCVrSnEgxcKxJl0EG8s7P09Yijhqg8G+J7TtUfrCewkEmbc+JV
         wiJT2GK8TVFaJHkSBNYVTHnzVraeLHMwFMZXipJzmc415lwzcfH7htdJHcAN6BQhkys+
         zG3NFwq0IXr/9iTeRDc6EdYqv8h5g/KGV7OW8z9UISipm4b4pKoQglcAMY2al/Zr9MCK
         7Gew7s277Qm3m1e+8Qh6hTt34Fy4Y/AAI8m+epsvg6NpuWvU50dHtUsG/VxvFjO85pSU
         Df0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513061; x=1795117861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iy1PGAVVFI8dPYiM+gpo0fvo32WV7ANCCu1Cx/iZJPM=;
        b=Lnsnt7M2ix0VUE4P0vG6QIOAhV5Y3Ipd94N++YMmxoCIZhHa5TC5dkFU+y7pDcdeow
         7zRdSUxmcKh5tLXwJv8hvGkTXKBHsPIzgbSMo6UsA4v5PBf5CMxL6FFe/1jLslTOOLgT
         vBFvxNCm8pVqS9hx7OG88uk+vsAly3oOPe5b7VJdv98oroUfuEtK4O5I46sh1aSygzNX
         +9e5b0piXdGSPcqturolXi3kJf7RX7r2XYEW/xsvbRcQ+tNa8ZM6VBFwjopA5wRyMGXp
         Eqs88E9GY0svC0TBLB8uzS/iUqbgLVIEY6bfcxKNEa6MSyXLI0tzPm+9UC1rG14y3vuT
         yKcg==
X-Forwarded-Encrypted: i=1; AL+hErGR6T1VBIF97+Ed+sgBG5pe0Zm9u7MxhLYsdyJAALqAIq0Tm6+03nAXdzwHmarAanlpZwGGobKtL1oIccw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VJ95ace8Z4fjmPcBaJJlCrU53H15oF10njrZQtG2D6BYq//6A
	SZ7O6vW+WG23aDbD8wBY13eLB1dpg+Scs9vEoJ6u4jiK5GdiiWGcKx+1
X-Gm-Gg: AYBFou1wzdXAyaYaXoziWA+MuJ3aCPA5mfuDeiC0UT4S7hgJ+BowWnvMZrbYUfcmwrP
	Tyy/A0e3+uIfpJG862CPgDdyIhaFZd88BT+0xqFkZ2+gyB8X9AZ+/zumrClyjNagqvuDA9OqVd5
	JW8x4jzwHjiPtWixPct3ALDttvkTFyXpO/lxaiHrPUo275ualRBYHUsq1L0C9uvLvxe1uPJ4si2
	BiRCbq7cQ06PDt7gQ/5GMP4MnSimUH4SgEUKjX0zZ4lfv23vskdSHQ/3vO2EJaJd55WDd6qPX1c
	t0FGgMbSzpRnhtJrIu0m1I2hVacQoxW85flCEMrSkQfXeuwABHB9EOW0JxEodjsoNszK+ujbN4z
	HI9jDCjM1Zkh2BqooNY5m01SILtxbcdIXmvD9wG4br5QBaZycjcvS5PG2svw5xVjFj6O7QOZwfz
	sX+oIx45PE/FM+c82qu5+BabyGcVle0Ups9dckmeeWLSMCCLChG1D+BeY4+4w+1rco/6CT250/e
	o9gkBs4kwtSY1QDTSPSgvtIGtNCpVgpQBjAdQaimWn4I+K2vHHI2Yb7dUXuTCEYdjGS4ntdBr61
	fp7/XJPnR41aY4WJG0obkF2/4jrvk7ll0xPqlwbe
X-Received: by 2002:a17:907:6e87:b0:c49:cf3a:a324 with SMTP id a640c23a62f3a-c5096409dbcmr25078366b.22.1794513060809;
        Thu, 12 Nov 2026 11:51:00 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42782sm11727766b.38.2026.11.12.11.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:51:00 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/6] net: bcm4908_enet: TX ring and DMA fixes
Date: Thu, 12 Nov 2026 20:50:45 +0100
Message-ID: <20261112195051.597102-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
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

These fix the BCM4908 Ethernet driver. Patch 1 fixes a TX stall seen
on a TP-Link Archer AX6000 under sustained load. Patches 2 to 6 come
from reading the code and have no reproducer.

Tested on an Archer AX6000 with OpenWrt and Linux 6.18.55, whose driver
differs from net only in one tree-wide change, with the LAN going
through this driver: TX and RX at line rate (941 Mbit/s TCP), and
ifdown/ifup of the conduit while it was sending. I ran the same again,
plus UDP at 1 Gbit/s, with the TX ring shrunk to 16 descriptors for the
test, so that the ring was full much of the time and the queue was
stopped and woken over and over (about a million qdisc requeues in a
minute). No stall, no errors in the counters, no DMA timeout warnings.

The AI review of v1 also found two older problems, with a missing TX
interrupt and with a failed RX refill. I'll send fixes for them
separately, after this series.

Changes in v2:
- patch 1: stop and wake the queue with the netdev_queues.h helpers,
  also when start_xmit() finds the ring full on entry; the changelog
  also names the slot that poll_tx() completed without a frame
- patch 3: wait for the TX DMA channel to stop before freeing its
  buffers; free only between read_idx and write_idx instead of
  clearing slot->skb in poll_tx(); drop the OWN check that could stop
  the queue for good; fix the RX timeout warning; the changelog
  describes leaks and stale frames, not a use-after-free
- patch 6: the comment and changelog no longer say where the DMA waits
- patches 1 and 2: more exact changelogs (the measured rate and what
  stopped; what driver.rst says about NETDEV_TX_BUSY)
- drop patch 7: its trigger is not reachable with the driver's own
  settings
- wrap lines over 80 columns; author name without the nickname

v1: https://lore.kernel.org/netdev/20261109235700.2586821-1-kudzo51@gmail.com/

Kordian Chmielewski (6):
  net: bcm4908_enet: fix the TX ring wrap
  net: bcm4908_enet: drop a TX frame whose DMA mapping failed
  net: bcm4908_enet: release the TX ring on stop
  net: bcm4908_enet: unmap the buffer of a dropped RX frame
  net: bcm4908_enet: unmap RX buffers on stop with their mapped size
  net: bcm4908_enet: publish the buffer address before OWN

 drivers/net/ethernet/broadcom/bcm4908_enet.c | 124 ++++++++++++++-----
 1 file changed, 91 insertions(+), 33 deletions(-)


base-commit: 86706ffa990ecd46a4326f8eecbccbbd60a6cb8d
-- 
2.56.0

