Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041842;
	b=MCxLvF7/ctSbg2Fxkfg6BgvJpBpAl/MWaIelWWMU39KaovZ7+m3Btj6FMSkQHZRQjBWM
	 gVqylALK9f7Eifqu+QS2W+MLmHDEnZhGitBehMFeujYIAvBmyDeUFVSLhawWitqMmSVNm
	 ihoPjdy8GaUfhAcp1Jbr0K+CPELwqGD6371i4MiKyakmQyAN9C3NxiwvGi+3Bsihk6206
	 Mr3KMhpLGqDjQuxZJfQ62O9oVDXDwXOjw5CGs+VvTEjMlikMlNrFqa+K7yf0SbWtbxSPx
	 I87IlCuyU8wSkeOgNX8CZrNh1gbpMQeL9/JyJJMzWdapzHQKv3sz87uYcJbiUSVncnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=;
	b=lFt5ziah3NirN9FSDYOplY5KP5bwzLujjoUW4hzOJpUz2YS26sp1rHXSBlhjTs0rZmol
	 d1J48qzt58rRDETAWBHGoSeHpamLZB6DIcZoME1H5Hs1cQleuNqAjU5q6DnHClMQbHRbi
	 C7zyCcy/dyhuXbrWRUoO7ZP6xoNtNbSjrb0UVujM/+WNDUkGiijzQyYIn719QP12A+HrE
	 82p4fyzdIzCYBsaidgtpolZTjMu/CjmTOMDWDLgj0Cz8An50eDXgz8eeqXb+qDEuc9zT/
	 1BBXdwhInwbDkwmeRr8XXJr5jPoNeR3N/N4YUb8Mpd2II5lAXEQwFxaml5VPuZkW+tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sShvy7za;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1396B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1396B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sShvy7za
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-53c4858eb76so1446900b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041841; x=1793646641; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=;
        b=sShvy7zangLTRy5ngZOGMlPg2vVwKdPo/iJKehA9yjLv3k47wBx3uCpGjyjXeCOv6J
         wFb16CIlM6Gc4VYDMrA3bVZWvlMIWI3V7BUeQQm04IbJ/0wkptBA+i06vjQsu/CgJ/lN
         J0wuX1rsX/3c6bYxWrvKY/+e2NvppCdZtbXgU+Dkv1r8OdamXVmaEd2FHiu5A9iu37Zc
         ZSEjDgHKUoMu5iglBz5ZRB/hVs9jOH3L+h0aZ3lKY9XklpejSxcLP+8pxohseIA0le2J
         z7kTArcUULKqgz/CStma2b/JeGtpvwxiNOxWXPTLLMu8VmwMMM0hTksRVVmatRnfmxZA
         i78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041841; x=1793646641;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vyh3iBjJiIVu4mxU7sYBtj/3/lKMxZvgStAYP3dEPdE=;
        b=w/06buxzelFjgA+1AOYanHBdlb10Ek2cMEU36ByJPqHWlZoDG/9cNglJoCVcvDgP1n
         gP/9i51jrXVMo3mtMbR15mLMGep0wC2nVg5ewme2IkmliBnFsZ9devvINGK3Vua20fQt
         RgKfngmXqaZa+cQXVJNDTbElb1pyj9vi0EiEp3cOIdWytc2eRzxBsP/i1qckpwBxDwMo
         M46iucGxj0Z6G/JIfANzxArdUGhM+sUjYgDEDBQWtr2ycWKEGGIMhZYYeYrFQeMkMWmR
         ETFSvGjG1+e0k1Ra2oRIMu4WjjkqkauR3xBcEDEqwhBXlu4Qbtq18AtGz0+bxPp7ycfB
         2TiA==
X-Forwarded-Encrypted: i=1; AKwUvByzI98WfBbfWNd7hStozvVTrI2/Jxt/eRYX0s6cXqS1vNqAQup0WXWguQxjckEBEdmdJ8EuXp35x6I9Ilg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTKWN7/x0McPFO4EJJnvRzOmeSoOz+m4TaZcVSEkFa429kfngi
	PXRyLuSRas8zM9vk4sYjEUn6Sd5ToSw6wrdPWHrLtnw/y8s0Hebm07tY
X-Gm-Gg: AYBFou1mca1JgrrJK4alFAjAx8l2619fwRQOrQjKigjNWLJ0Zp5z9Vev89c5QDwQ5x2
	fZm4YjSIxQkM0AmQx1QBJaqiyiloZqEJdHgL0Z/mPX6cvQ5bTJSpdQglHSR4UL9Q9mm9I++B72H
	A4Ddh+DEnNO1QUBm1UnYYG4T008gX60EJazjiUK1l0AXdSkyRy5WB2EU14P80DGSJcT/G7yIdLX
	GGdE+9jgeI9mobA6TncfvMUmyUS2aM0Ic9FWThpqg5ElhHoMU1wxJ28hcdnv5G8owcR6LNgdRQr
	SugATzWKXfcB887oZt8I6EXBozmtR8Iaqncek9hWiJq02LbxX8xT3eraBum69ALYY39DDiKwhpm
	AZtQ1J5RClxGoOTb/X32arsVByXvShkFlN1CVgHBmfTDjvYFOqUGcjU9weQNvcel1kz4G6GCkiD
	tTgQPMRbnbJcTVB81ouCOQ2G22KckYS2N/COi28T/yL3LefTX0TNJsSM/ZU2JH9HTKrJpcLSelg
	PWdwFn6E7uCsgZ4QyvdAYduLJIN62My26rmoIXfWtwyNQPcDRZ1z8pL25N5R85mYTCTSrqHAXEN
	y/Y+zh2wDA+BetLm9YGVbly9T0NC6aWkWjkMhp+otqq+Fg==
X-Received: by 2002:a05:6808:50a6:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-55c002c4d6cmr5571600b6e.29.1793041840897;
        Mon, 26 Oct 2026 12:10:40 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c03dc3524sm5740834b6e.0.2026.10.26.12.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:10:40 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/4] wifi: mt76: mt7663s: two fixes and fewer SDIO status
 reads
Date: Mon, 26 Oct 2026 14:10:35 -0500
Message-Id: <20261026-rbrue-sheldon-upstreaming-mt7663s-v1-0-944b1f7e63a8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQqDMAwA0KuEfBuwKXSjVxn7cG3UwKyS6BiId
 x/sXeCd6GIqjhlONPmo69owQ+gAyzy0SUgrZkDuOYWeA9nLDiGf5V3XRsfmu8mwaJto2W8pRSf
 mEkONY0n3ih3gZjLq9388ntf1A00N4KtzAAAA
X-Change-ID: 20261021-rbrue-sheldon-upstreaming-mt7663s-22c31d3fc68d
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041838; l=2308;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=tyqWodcb4HgA2IBe3psm2WrhLsTpaYYAyzN5LeZv4/A=;
 b=E4ysnrAqpc/wKUI5mzFLxFe8CxGZEzCtxfGQ1JNY+laZcPUAM6KONFWstDZqbNG1+jqMwAzk5
 HJ/ByhvWs+cCbQl2zCyqQISK2s1XAC/Ns8YnvGdS8EMZajk3AVJWTye
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

These came out of bringing up the MT7663 SDIO module of the Amazon Fire
TV Stick (3rd generation, MT8695) on mainline. The board's devicetree
is not upstream yet.

Patches 1 and 2 are fixes. With the offload firmware, a hw scan with a
random source address ends at once with no results, so NetworkManager,
which randomizes by default, finds no networks; patch 1 stops
advertising random-address scans on SDIO. Patch 2 lets mt7663s wait
while btmtksdio holds the ROM patch semaphore, instead of failing to
load its firmware when Bluetooth probes first. The matching btmtksdio
fixes for the same race are posted separately to linux-bluetooth.

Patches 3 and 4 make the txrx worker cheaper on the bus: the interrupt
mask writes become CMD52s, and mt7663s takes the next interrupt status
from the end of each RX read (RX enhance mode) instead of reading WHISR
before every RX read. On this board they halve the status reads; the
link is air-limited, so throughput did not change.

All four were tested on v7.3 on the stick, with btmtksdio built in; six
boots in a row brought up both functions, with each driver downloading
the patch first at least once. They apply cleanly to the mt76 tree, where
they were build-tested with W=1.

This series was developed with the help of an LLM coding assistant.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (4):
      wifi: mt76: mt7663s: don't advertise random MAC address scans
      wifi: mt76: mt7615: wait while Bluetooth downloads the MT7663 patch
      wifi: mt76: sdio: use CMD52 to mask and unmask the interrupt
      wifi: mt76: mt7663s: use RX enhance mode

 drivers/net/wireless/mediatek/mt76/mt76.h        | 10 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7615/init.c |  6 +++++
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 14 ++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 28 +++++++++++++++++++-----
 drivers/net/wireless/mediatek/mt76/sdio.c        |  3 +++
 drivers/net/wireless/mediatek/mt76/sdio_txrx.c   | 21 +++++++++++++-----
 6 files changed, 69 insertions(+), 13 deletions(-)
---
base-commit: 16f56d6e78fb3cdb3214bdc6a61c2b1c567c9aa0
change-id: 20261021-rbrue-sheldon-upstreaming-mt7663s-22c31d3fc68d

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

