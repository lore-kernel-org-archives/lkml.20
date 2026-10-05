Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF174534A7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193102; cv=none; b=A3ELjJTuLBd+VFR7bIcbt/zmMbaOd0Nb+DRa9xIREo0S2t/xuHqqEZ5JdP9hJwlzOz7kUG2/O0bH/IleRWmgrwfHPWG9vlDJv+u7E1SGnwYDlmIRDXCXf3QBkSh3jHniGL/swU3bR0JL0Do6pdfgmt7ybOmWFWa/w1DvxfZ5DyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193102; c=relaxed/simple;
	bh=xqP/CkkXDKW6WUx5r2Zm/NU9mTw5OptnDKy0fMjk3j4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LC3ZPbFEKkuke/AtplXmWPL4YK9/6vQZcBJyRAw275KL6zS0CZZaa4Lpfj1X+NTEJ6pyeksSdGYSKUkcn5iQOc5/jjSmVU6+rB2rW6hJS5JstjPFR3qcYC9Lefb7UrGE/WeWk4ah9tOKRXuXxW5RIl34JI7Vt1C28i27IAAN/S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAdpCTds; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAdpCTds"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7c8d1c17dso87442a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193083; x=1791797883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pizd1CDxJLDh2tlooS3lUpX6Wou0K6RZNg4IvzQLo10=;
        b=iAdpCTdsr/Ro+qABdpkD3fODmrJ3U6rrGUyn1TaZB5rPk+q/YG0MzHnXi5T47Pg6xK
         4bcdSz66WTZAKGH1jSUV7vlVQFhxi1RURdLGBwoQwgfkgRyVXqYInUanMqz/tnt3OeE+
         MGACTXtAg3jmDdy/zisYkwixbRPVFEo8m6y/p5gAJzjkHewB8WSTKP57/KHY9NUCfCMn
         u0upBnlH7u3E7ViU8taxNof52DVIN2uR5O+RMoN2AwWUSoXpmHx79OSVEJEj/xkfYf8O
         cMUBttCRsfB8EJVkQZYXYCBt5xlCx40HK48FG8jNsuEUStA8CYODddOJ025LXsp8Vwho
         XtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193083; x=1791797883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pizd1CDxJLDh2tlooS3lUpX6Wou0K6RZNg4IvzQLo10=;
        b=OrwrPtUvr+zMOL98MLm+sNmmaQTy0+9VhK6VqxyrrGnxT/+262XbXiUCT2HcHj9pfw
         G15GEhWQMPZeQkkhMFxVTkJ9W0/NJsP06Xb8TS6/n7oWtZlqjw2sUASldJPqHdKsUXss
         sErp5sbOX+fwj5KurhnckOp0CD7IHIRe4ru6jXBLjffnjrK3xgaF4vhaUZnJ8o/Qr5oz
         qRqhYH8Lb++3zXB6PPKdb2DKAF2uuCrqIUCNbzij9U9ZhBBSWDTn+ZKCR2yOq1NEw017
         EuxkykyaJS/3CotxzdOZUAs+Y6PZIxp0zxLaR3TsYTqmAAkifel9EGR0dZPYZzgFnqxN
         Qvuw==
X-Forwarded-Encrypted: i=1; AKwUvByqm79nJOLpxFL1og7pi2nDfotP1wVJmF32bNanhy+scR5vdD6XaKOlIb556Iprgoo9nfMAvd9Rd7vq9RQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Fv947j8y3ssOhqEprY+w6fxED6hBESMghsNY0RU4gjoma078
	AHzJEj/hkIFqxgLX/EgrvnDou9Ws7z4oF9r2YmYyc7lKuUvUIzeDp6qC
X-Gm-Gg: AYBFou0bTtRF+rNnCkue6EsXv2EfGBDYqhWvCbw6cDL3mUHFtYVcKuulNxY7OeUJzQI
	hCVBe4TRiUCsGcFvn5U0zK/GrOmdhMQFaUrBzeqALmOjokOXg2hUcRM+R5QmFc6XlAmX/w2SBZ+
	b8Wd7/K0UIgaJIWj1kuAJ3hLbkTg7oK6fjTSJ16M7ymtW0xpbYbqWRhVjqSedRV/VdcPHSv19mT
	MGaSNQuFJJCF/Zw6gKeJGgmTayjCcnPNSAF8bfLJ8P2+aWhA5iCG0+wdCODZg2+DMrOtk0I2Yb0
	Eidhl3/fNxrmuriWLlx3TpIoIN5AJZ8wKRtKP/Lbxdb4F4lorABzRVsvgLU4oM/Jqi0QTX4ar1p
	vY/PGpOvwBUYWu06reZKQQJzuKt6aIzs45i/LTX4q2whtIgYS3uDj2AEq/HClxxWSmgIYLR46UK
	1IutBBS1t01blN9L8tZ7GJg8/2g1sOyCAnazqhewXvTsAI5g+2my/NGOUgxwTaopfKnyGnbmWar
	1sK0ReOGHD87sPxy0vTBSwh1LW+0TcmRDTOyHaPn07ImLVmnCKdn1QzSw==
X-Received: by 2002:a17:90b:4f87:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3a81759270amr2038440a91.2.1791193082911;
        Mon, 05 Oct 2026 02:38:02 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:01 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Mon,  5 Oct 2026 17:37:47 +0800
Message-ID: <20261005093749.645014-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
internal PHY is only usable through the optional USB & Ethernet IO
board. This series adds an overlay for that board and fixes the name of
the internal PHY node it exposes.

Changes in v3:
 - Rename the PHY node to ethernet-phy@1, as the commit message already
   said; v2 only changed the unit address (sashiko-bot). dtbs_check now
   validates the node against ethernet-phy.yaml, with no new warnings.
 - Drop the blank line in the trailer block of 2/2 (Hiago)
 - Collect Hiago's Reviewed-by
 - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
   name

Changes in v2:
 - Enable Ethernet through an overlay instead of in the board
   devicetree, since without the IO board the pins may be used as GPIO
   (Inochi)
 - Send both patches in one thread (Inochi)
 - Test link-up and traffic on the IO board, which v1 could not
 - Collect Inochi's Reviewed-by on the PHY node name fix

The overlay has the same shape as Hiago's for the Milk-V Duo [1], so the
two boards stay consistent. The PHY node name fix is in cv180x.dtsi and
so covers that board as well.

Testing, with a kernel built from this branch:

 - sg2002-milkv-duo256m-eth.dtb: eth0 comes up at 100Mbps/Full, gets an
   address via DHCP and passes traffic
 - sg2002-milkv-duo256m.dtb: no eth0 is created, and the gmac node
   reads back as disabled
   
Kernel log with sg2002-milkv-duo256m-eth.dtb:

  [    1.426499] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
  [    1.426536] stmmaceth 4070000.ethernet: 	DWMAC1000
  [    6.052829] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
  [    8.138131] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

  # ip addr show eth0
  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
      inet 192.168.0.47/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0

With the base sg2002-milkv-duo256m.dtb:

  # ip addr show eth0
  ip: can't find device 'eth0'
  # cat /proc/device-tree/soc/ethernet@4070000/status
  disabled

iperf3 against a desktop on the same switch gives 94 Mbit/s with the
board sending and 70-74 Mbit/s with it receiving, with no
retransmissions either way. The receive side being slower is not a CPU
limit on the board; I have not looked into it further yet.

v1: https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
    https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/

v2: https://lore.kernel.org/sophgo/20261003084627.353899-1-chenyou910331@gmail.com/

[1] https://lore.kernel.org/sophgo/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com/


Chen-Yu Yeh (2):
  riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
  riscv: dts: sophgo: cv180x: Fix internal ephy node name

 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi          |  2 +-
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

-- 
2.43.0

