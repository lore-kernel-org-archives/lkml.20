Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576513;
	b=uAPwFP+lgaAqvx04QhkgfIg407A1gRtVJwaXqAY6LDPfcpQqJRYLk9iqQRMGC30HaEc/
	 xhTkYkXw4hlC0bh8gnFSx5FbedpKMkPhxoOTFtWWRGOXuC5ntzRosgmOMZ3QNtkIPIPeZ
	 Tu7XiaNzxegZmG3yBJsUzDDbRp83ureUX8sC48ZUEUwpbs9ASP6qeBpYJIqSmdL/hoScO
	 xThqRstSUNNuMkwU3tdKir1XDMCN43rTL+6AEw7uI2/OIlUtMJ/E87Moqgn7kvb7xS7JN
	 lyRl0fmBD2DQinVlyE3hMAhrfFvttEM5ESVEdgSTuFaTWzVQSQnn0ViU2uLXbKQOHAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zMluFC78cIvBikYbcX1+ABfXuc1qd1361x5Cr08z8xQ=;
	b=1TLnOEZMHKXkjiwVTnQB7xguHHvagTOylTIcXw3MynUYu3Yn3hK0a98RSXkRgnuixGYf
	 piWmLutmNZNIQ8WYeJ7owJfR40mjSOjHal14iIjcisv0R+WDhuaG0gftNjLO2RHfqHLO+
	 FitnhKb8JSe3HmCXpRiXK7IzLLsEvCBDFRN/2rBfVuVVeP4xauNQ4iXwdqpdYBEXPbYob
	 mFuC84VNeU9QSDy872BZp4LesuLF8d4EBcWDkzY/DYdm+i/iCkbqQCS4p6HF6f3PKGlM5
	 R4QbkBIr702VfLno16mDK3JrFnwaYewxx/CD4R2OZVIrz+m76r2f/55hh6A2EuWE4pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UsiZlsgi;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE5606B569
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5EE5606B569
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UsiZlsgi
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so3721755e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576511; x=1795181311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMluFC78cIvBikYbcX1+ABfXuc1qd1361x5Cr08z8xQ=;
        b=UsiZlsgi4djgwH6PPrZ1X68lT5Vjzz6Q3gxyfVJUsXIiOQZsLpsIr9+xIfUiaLZbSY
         nrRrJucUs4qGn11nRI2VWqFw6YLjn6YngeylkeS+LErX0ths/K958JsuKPgakJBSBJzq
         5Ft6463aw22L52qZAb6jvrGkZ0h8IMvXEDIPbGPSHXkqlTblE31FKZF7x/qJ1m1Fzgfr
         EpSrL/aUoOUedbuteH7hybEHvIP6paDyj6e3m0I+wRKWSXIo4BLUR4ksqKjU9NwE03dM
         fGilGVsqbdqs9GWpczccIJKuAP/hF7XDqLkG7QAMe9zxmSJG3UdTPuAW3iwrzqtFSBvC
         3YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576511; x=1795181311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMluFC78cIvBikYbcX1+ABfXuc1qd1361x5Cr08z8xQ=;
        b=dAMx06pNNKNOPCLlAUSTJt28Zs7NONoZW9xR3/tVFZgT8GaIt/P5xuPGfrkOfu1Xkh
         4neuTSso2dyBs2Z8qnRXromE6+5SHzq26WYlOh0fgq+Ba+Fp44quAaaD81l94PnqZ8k+
         z2B2gbSC31ubvUVMyX/O70nyKNiBTQ9gwWnsT7AhwG7zvgchJSEhoZ/vT5u3EY/wN14O
         ILV07rp7bL6OlU3OGbW9Te5C7viNtzk6eauW+lOBdtjUR50F77HxaNSHZMf6a5kv6Y27
         JMiFbhc8/Ph4fSwkbvgdSO1eIiZ3d9JN1TA5t3eocsEhCQ9WpEgG3wSfDoVUjX76T4ZG
         lQ0w==
X-Forwarded-Encrypted: i=1; AL+hErFlIlaaOFLAG4o+eB1p31qHLRYrGZAdxsavQk3Lcsel/nmbD2FgKpID5fHB89ntZCxaVO4X8+j+zN8g4C0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DRG5V2esrVDFn9AHfVCjFeXPCLvNMhzamvRc2c19qSRpT1Ifq
	xcoJqu1CCgVhqPIdL/tE640gBEU5WLhSS4Os+jH6cUgIMS3OQslSMXdp
X-Gm-Gg: AYBFou2wpdDeNKy7bYoH9UUGOunqrw4VZSHvWlEInlcAcXm0yx3wSPppv4U02sZYujt
	uKdpuSJBMBUnu83fnxk2jV7OdRBCtu3Dlu1zbLggsX3CzH8nMmsR0wX2hQHXrpO8+hkKnuAKvbV
	ACh2gs1GwZZ1sHCH/AD3RBAyENiK00cgYvU+yjwRQmAOW7fesdqisGSjkmXtQ4onrQEYdbuMamv
	Zch2IhBPCdpaHc6nalYGEWrpxV8Fu+Rjmdv+UPAFngFpJ+G1PIp6eC+JfPIo+tJMfBU0gPTyLsC
	85KQpuM7mI0LVHYwvfsytApigGFoOk98NMQebdFE5A/MSeuwPrJBrc1nBO3IU9TwBie2VhLBnGc
	gWRe/VtVWYG9aOa2uMmmvhg6jkXYOCpj/IgnMjNZP3/IA48xVP8tYkdgsCpLdngFW3a98n1FKo+
	luOlHlNd5uP7expcyRNIuVctn7p0XO6O+tz4il+2JmZufUlc+C8fq4hnq9Hk5/jV3XL4NiM72yg
	B+6cgypDtcF3TeT0RRzyQoa33GY/9EJlaV4E9n5O4kPWSyhA5oe/3UIm3aGXjxy6hbHObbBQ5nG
	1Keycw6TnTLyUWObMg==
X-Received: by 2002:a05:600c:8905:b0:4ba:4395:5755 with SMTP id 5b1f17b1804b1-4bb55a6a5fbmr35028905e9.5.1794576510932;
        Fri, 13 Nov 2026 05:28:30 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4802673f8f.27.2026.11.13.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:28:29 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Ali Tariq <alitariq45892@gmail.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	leitao@debian.org
Subject: [PATCH net v2 0/2] net: spacemit: Fix TX timeout work deadlock and RTNL in PM callbacks
Date: Fri, 13 Nov 2026 18:24:33 +0500
Message-Id: <20261113132435.434615-1-alitariq45892@gmail.com>
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

This series fixes two locking problems in the SpacemiT K1 Ethernet
driver.

Patch 1 fixes the TX timeout work, which ends up waiting for itself
through cancel_work_sync() in emac_down(), so every TX timeout leaves
RTNL held forever.

Patch 2 takes RTNL in emac_suspend() and emac_resume(), which fixes the
"suspicious RCU usage" warning from phy_disconnect() on suspend. It
depends on patch 1: suspend disables the TX timeout work before taking
RTNL, so it never waits for the work while holding the lock.

Tested on Orange Pi RV2 (SpacemiT K1) with a lockdep kernel: 12
suspend/resume cycles without the warning. The board loses its network
after about a dozen cycles with or without this series; that is a
separate issue.

Changes in v2:
- New patch 1 to fix the TX timeout work deadlock (reported by Troy,
  approach suggested by Vivian)
- Patch 2: take RTNL before the netif_running() checks
- Patch 2: drop Breno's Reviewed-by, since the patch changed

v1: https://lore.kernel.org/netdev/20261105123441.2524171-1-alitariq45892@gmail.com/

Ali Tariq (2):
  net: spacemit: Fix TX timeout work deadlocking on itself
  net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()

 drivers/net/ethernet/spacemit/k1_emac.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
2.34.1

