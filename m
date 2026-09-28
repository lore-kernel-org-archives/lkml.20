Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ADE4EFFDE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633212; cv=none; b=b+BqVftdz36pOjgUJplKGbj7yXDhjIbevRLNTLLJmgQlhOh/1S0TCAWdf+bZb57ipCMyzb8zbOGCuvlgAbpUqPYnZ0oTuFomzLQya1IcH5c2t3YLnXH8f7tL10sOkIJRgg9gVxh3Au7ZCKOfQpKIuEXRWvMZZCw8P0PF798uZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633212; c=relaxed/simple;
	bh=VA1PPp1FMJ21LCxz7xn35Wp1a4bo/XM5ylNH+VhiGv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7GRl6blwB6yPTb2lnskBI9TYkra0ALvvmoHdG6rZuxtFQpHa6qddRS0OW9nZGvm7keZyAIlzJbxFTNQ5Ue4R4Xu5m9lutEK46RExeedqXTY25GPA6ro1Cf9IPD62cm24ylgpOCya5HSAHlXUY2ISGcstOVgROcNp8NJhfU81JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNZXCDQ1; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNZXCDQ1"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2cd04e72f6so350360466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633209; x=1791238009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8y6eEk+phFinuim1+Sgx9zrq/h1dTfgS9jzVTEFSOX0=;
        b=sNZXCDQ1C3gzM7jYeFQMPuzJYTUvoqQ5CxMTlpRJiLrEXC7XbsB+4PQaf5HUl1A4ah
         YNwqdn4Wdilg3K9StoOGQzxRF4KLgQkN8bOaoTrwUfkxw9MhjzKCPgO1rMlArCFGeHK9
         7cBUnRgsNlcTw/fKKwgM91kRtF2qTwJreHFgprJDBASwQpuS7EDxJlHn2Msn0EPBmcSe
         nzAfpQy+t5X72IYzA5Yqwa/hBiYsqwAPp3ChDRcWNGip2G/cKb041bNGPPsZIQf2hYfD
         fSSsD6aVZxa+UmYPrlY1A8ufYisMKat0BWWJMAUP+d0ZRBVP/8WPJsVfJ/n8ZYlMvq6K
         6kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633209; x=1791238009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8y6eEk+phFinuim1+Sgx9zrq/h1dTfgS9jzVTEFSOX0=;
        b=z6YtRJa3DEdt+XIBXoRbcPXERGELPrPyZVw1uO/AYCIjcwYVq4grChAjZN/Xf0cOwb
         NmafURmm0nBufzbIXGIlPq+2FEoZkVMLks3wfgq64+MzrjiFIfjPqAJede7ymTBJdai4
         gBHQo5hEfoN5NY/zhAeKH/7DAlfQM2M72IY9zwngLVZhWpA6bJyzPSK47JYMvQ89iB1U
         Z/bIJvW4SXwiqhRakOWN6yXegAAfEM8ho4fgL8GjVHIbIsk7bwYtTLm7znaHYf0+JmD6
         O7K4SHByjt7C0GdcQbc+RB5qVKTyzv6wGVTLOxHPzaVMMOS/7XnYzcAzgMN5cNNpXg5v
         RafA==
X-Forwarded-Encrypted: i=1; AKwUvByIlywo1ygKyExfRWkB9IZjuQRaT+Dit8ShSsMjD6voYJH72RNp/2SaWylFskfNFgyHliHoYcoybTiVo0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ld4+4TasMjILSufVrzVDRnIX4BLsNRJfV0Sc9iQuJPW7CzRysm
	zUgxqrDYdrpKzH8n957/e0rWS+ZcMsFA5b5ELdqBQBSaIuRk2Ps8veJq
X-Gm-Gg: AYBFou0HP/XcSWcikhyNl0QEh3oJM5P/qUF02EgL5IwgD6Hq2+BdGR1JFbicY0FMbpZ
	5dlUCOZYjw536OETazw8gkYyayc9s6O8sx5JoTCS6iMyz6EMcHRLOWednKY0rk65izi6LiABBes
	S9JtXZqI7QIS2f+xVhkCbPIiFOLAzPd+Onj3GBkAJFi6obp/8thf8nvrnb5u0xiWmsAWS/5JeEZ
	V3KiZSm+UuZwDg3Zio1iPyb9760QVGJ3MjO+/3zo68cW9kiBH+xtDGjKrkzKwyLxv6+oyzUxHYN
	4V7C2uxGD4W7B2b/e35AdXghxUwFuLTtxjo3h/iguCTh0VToNNrhev0UamWvOtEBnFP4D5ZSd1+
	PwFYMWILBVTJKJFWoi98LxtL31OZR4Mh/a3xRm8BJnqrvX4KQjTpudst9gDPCNMS0dCg+4C77BT
	aM8MbhMrolMVPMuTVdcHA17w/ro7VGwV/ZsgaIbJ3KwE353LBVsB45Z90tKAH7TCbdyCLuNN/XE
	OoTogQe7m9U4MfC6/Bkkgn4orzYdMDLtYK++J3I9X4DJ1Zs3ZnwGVQ6Wg==
X-Received: by 2002:a17:906:6a0b:b0:c2d:c33d:a9db with SMTP id a640c23a62f3a-c2dc33dad2dmr569606766b.6.1790633209082;
        Mon, 28 Sep 2026 15:06:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm520177266b.32.2026.09.28.15.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:06:48 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Crispin <john@phrozen.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/3] net: dsa: qca8k: fix MDIO error handling
Date: Tue, 29 Sep 2026 00:06:26 +0200
Message-ID: <20260928220629.238-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix error handling in the qca8k internal MDIO master
paths.

Patch 1 propagates MDIO read and write errors instead of reporting
success or returning 0xffff. Apart from the trailers it is the v1
patch.

Patches 2 and 3 fix the two problems the Sashiko review found around
v1 [1]. Both predate v1:
- After a failed page select, the MASTER_EN cleanup write went to
  whichever page the switch still had selected, which can clear the
  upper half of an unrelated register. The page cache also kept the old
  page even though the failed write may have reached the switch.
- A management Ethernet busy wait that timed out with successful poll
  requests carried on to the data read, so a read could return data
  from an incomplete transaction and never fall back to the MDIO bus.

Testing: each patch builds with W=1 for arm64 (drivers/net/dsa/qca,
net/dsa, drivers/net/phy/qcom), and checkpatch --strict reports only
the missing sign-off and the Fixes: IDs that my shallow clone cannot
resolve. A userspace model compiles the driver's own MDIO functions
against a simulated paged switch and a scripted management Ethernet
responder, including phylib's read-modify-write helper as a consumer.
Each patch fixes its own cases; the base fails all of them.

A Redmi AX5400 (IPQ5018 + QCA8337) was tested with a 6.18 backport of
this series in OpenWrt. Connectivity was verified after boot, reboot,
cold boot, link re-initialization and MTU changes. That board has its
switch PHYs on the SoC MDIO bus and no CPU port 0, so it never uses the
internal MDIO master or management Ethernet. On hardware this only
shows that normal register access through the page select path still
works.

v2:
- Patch 1: removed the blank line between Fixes: and the other trailers;
  Cc John Crispin, author of the commit named in Fixes:.
- Patches 2 and 3 are new.

v1: https://lore.kernel.org/netdev/20260923215748.1336-1-yongzhao.derek@gmail.com/

[1] https://lore.kernel.org/netdev/179054715863.3145.10179961093285192493@kernel.org/

Yongzhao Chen (3):
  net: dsa: qca8k: propagate MDIO errors
  net: dsa: qca8k: do not clear MASTER_EN after a failed page select
  net: dsa: qca8k: fail mgmt Ethernet MDIO access on busy wait errors

 drivers/net/dsa/qca/qca8k-8xxx.c | 66 +++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 27 deletions(-)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.43.0
