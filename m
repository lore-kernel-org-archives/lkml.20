Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559755;
	b=hhZwAng35eNCNNeIpL7jIsCJHcsdaOC9+j7EMitBTv2hhpYbges86j2Bu9nZSDxuAXoc
	 71tbs/yDGRy3VRbK2EBBbjMVihYEF0+MzWrdmhDjwdi8MMaIvvGyaLJJzSB/psI84tyvm
	 BVW/3OZ9Nhg+9Sc7Iu0ySwHs6GcLPGo2kqlBBdBfpHnsVrLtCP4cAlRM3KfKjQ8xKLor8
	 UDtTkax0ii5OdEPdnQdsnAiqDd4ltgXIXHt5431FftOVzt/M9E25a2EkMpTS0dSiPcipo
	 ovQfyYniDHhd5XBWgVe14mpvegj63A+gEvt2gIvpe+fhNHr5q5SJhAs9n4hLmkPeGCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=CxJEPSxKZkA5JInxRotIu8NqmleT1f29t/E9d4ZVi80=;
	b=LPyVAnPYX/Dsa5baQO1uAkuVkdHDOM/ibShQA3cQv9IvvHTWp/E1AKFg9qm52iNeEWHP
	 Buzw5z8kxvZnJirH7IthzkW+qdmqiSwCwuMsHJJHQyH5m9sHH7aHRiJkT8U47mqR9ACYU
	 wqATgkHOxqrWfXIOI5aVwCzymJXKVNOnauGYO6F005C500OG93nc7aHLTikXz7hFK34jh
	 esbudT9/JABJD24ju2tzxR0PSPXNl4PXTnYJ+gXjabkCpu6ZBlciwcgJTYffSookP97Pp
	 gFP1r2s6cVB2yKPOHUy0WSkJY8FE63TWti5sCxVBEF+QW0iIbpVqeKfzwYl8PkdLscw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DE7Oc838;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210E606A896
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1210E606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DE7Oc838
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-85d363fb73cso742755a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559753; x=1795164553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CxJEPSxKZkA5JInxRotIu8NqmleT1f29t/E9d4ZVi80=;
        b=DE7Oc838yKNszWJy1P1XzJd6Wq2+LyuJsByCk9qAizJpewW87iGgH+RSzzkiYFQlfP
         g6e3TI80TiSu2JKvCdwAiDHcgcksrd2eSUFt0GDHVVD+9VkHzfbgfeHK9ekPvciIlNX+
         S6MFCnL2AwaXzKKb8jz+N/qFJe1m14U5x8blA/hlE2kJ07h/OdjHgTepC04mYHux63Mr
         iHoi9GZbXSQ/6NBevQQLwTNmuXr3tTq/zszPbGTel4sfBSqv8lhG1xf4xCL7/jtfdbBO
         9e7faft9PmGkR5435uQYufb+8jtP5J4LdrZ8B7EFVXlgZJABUZa/G37CCMuQkEEPEeIv
         Wkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559753; x=1795164553;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CxJEPSxKZkA5JInxRotIu8NqmleT1f29t/E9d4ZVi80=;
        b=gJLWPVnNQ8bG4M5QDmSY1fOFem2CUs/OTw1zmzDpi80PflbZ6nMsOvdJWg9X2Wwsj9
         pKgn4QYyp5rKj83DoYAQW9QKdZy3o8M8QGfHfSpEIHU+y05I+LymoxUgfipGbSUoYgis
         e4+Y6Y7vXoR/qP79jLd0S9MrQcLDO66TGYWayfMXIOhB//Pg+WaW/ne1ZKRvrhmUDQ6z
         Z4RnJ9Ty04uCEzNIUSh5XjSRYy2XHEUUrxSmyrMpDJa6sqc8kUI8dc8wup7IWaunz0Yj
         xJvKP0Ill4hXHT7VfgT2keM6Hut/c9gqCAaI0m3xt0V3bebtL3NUUpwXHwgmhSSBvgrS
         W5LQ==
X-Forwarded-Encrypted: i=1; AL+hErHrUtl51u6XxUlyHX/Wj0ARL07kHdefAVyxOZf9IXSm+LiZsOltX3Reqj2fHZpV7RaUtaDnTjUYJYajBZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RhXTz9m3hMIRL/xWQFQnCw6fE/JemM3DurEi7204tWfqdfWJW
	Puc5Sf3Fz4BAIa2deL1I512Q33Rn4fFQaC4151PQvwxQXUDvNXVBfJgK
X-Gm-Gg: AYBFou0YRRdoddWL8EVtKmQBXD/9Cmj7j07aHV5xdI61GLoZDPJVtVOITchN2HysxF0
	8sv+GJ3LbQ+uR0VszmLxczfdgxysmPY6NjmSgn4Tg+gC9NQ2AxAaDlcp1khSDmlYGouVdHH75Lm
	QArRtVNfvJYui0c9gakPYekwB8RRnDT2tW3zGfdSinw2zUnoKNX7uM/bLU/7F/8+D8+uUkC6pk/
	haSWAnkK7vthkztuJQQQueV5ViCg8T2uCozD3zvpXltG4hr364q+b+rjUGaDk9ESeYITuxuc5Si
	AsStUHCwv68XovueQxPdyM8lQwa0DeWJDflxPec3nU/e6x04Ov1EePskRNYgEnu2c/kEUEh2pOP
	g3GgtABS73Av0FXk0DXreT/M3hVolrt1Cea0fAzhHmVkrhABc6HAsLvWBCj43JN/9Fi4nJH0G1p
	ga55OWBg6h8SP/w+irdXKa6KNNIxnztqDUli6rI0liU3w6n2lzAjYPt3gc/66F3ea7xGyFZzl8U
	jP8geZLcVDh3OlYu9WY1VTDLSUuuYBI9qS+5ka/wEr1D2J08liryOYe6gzEeOSQTi3OIU5ohl0N
	jrCJyD31gkFTDfnBpSmQ3zRsy9YOuckDfirhtyBn1wPjFBQo9RhUrUJj+yHB+BPbS+2IywcyYt7
	CYoqLkprwWi/afUNYGjnaONEz8+2GSQv+Xm9xl//MmgQSWSDnUhG81cI0xFenb2lPAcOg+BjdNF
	/yI9gr17cAWwTg5sWsl/5i0j6T96Ac+r++4ObQ0QySJApJQ4hC9YM=
X-Received: by 2002:a05:6830:4c03:b0:7fa:ac4f:79a with SMTP id 46e09a7af769-862898708ccmr1498843a34.22.1794559752867;
        Fri, 13 Nov 2026 00:49:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm2034202a34.22.2026.11.13.00.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net 0/4] net: phy: restore driver state after userspace MII
 resets
Date: Fri, 13 Nov 2026 01:48:39 -0700
Message-Id: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQrCMBAFf6W8swvdCIL+ingw8WlXaCzZWJTSf
 zfqcQZmFjiL0XHoFhTO5vbIDXTTIQ3nfKPYpTFCH3aquhV/xtGqTMNbRjMpdFaZVTTumXqGSFW
 0eiq82ut3PiKz4vSXrb8z1e8T6/oBsefl/IAAAAA=
X-Change-ID: 20261113-submit-phy-mii-reset-v1-1b9ec0e2be11
To: Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Chan <michael.chan@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

An MII ioctl reset needs to restore the PHY driver's configuration and
software state before the PHY worker can access the device again.

This was observed while testing AC200 receive statistics: a userspace
BMCR reset cleared the hardware counters, and the next update interpreted
the decrease as counter wraparound.

First remove b44's spinlock around the sleeping phylib ioctl. Make phylib
propagate failed writes, wait for reset completion and keep the PHY worker
disabled until driver reinitialization finishes. Then use this path for
phylink BMCR reset requests targeting the attached Clause 22 PHY.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (4):
      net: b44: keep phylib ioctls outside the spinlock
      net: phy: propagate MII register write errors
      net: phy: quiesce the state machine during MII resets
      net: phylink: reinitialize the PHY after an MII reset

 drivers/net/ethernet/broadcom/b44.c |  4 ++--
 drivers/net/phy/phy.c               | 42 +++++++++++++++++++++++++++++++------
 drivers/net/phy/phy_device.c        |  2 +-
 drivers/net/phy/phylib-internal.h   |  1 +
 drivers/net/phy/phylink.c           | 14 +++++++++----
 5 files changed, 50 insertions(+), 13 deletions(-)
---
base-commit: ead6fa9a0ab194f02a2f36d634b193e9c5f9a1c6
change-id: 20261113-submit-phy-mii-reset-v1-1b9ec0e2be11

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

