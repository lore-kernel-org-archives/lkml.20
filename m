Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924415;
	b=vd10y+R2/2Q5rAlguG/W+ybtLAfdzgQK/CJahAdRxjUZW8LX2Sv8lMIEvZXl27VJgHfL
	 APuEw35yxu4fT4v6dr8y2Y8o3sFuJXa9T7/9kKuYUEplCW9+BUZo9PvH5V0JzxOko7Uth
	 4U5aub2TyXqraLY2+CNZLOj8OgjkS2UYu1nI0LLdM5W6Y6CJu8q3dh+PySKUS8CMgZG2Y
	 DDTBytjf4+2CyEkkpxOt/4p/qKLzIO+LoH77gG1N4nCMwK8ev1wF03odwyc+HDpQfUopr
	 T3q41OwXaJIJ+xagoN/rCB20IUoLdu7+gbuCpwSalhiysMR2FBk42/hbn7HDQK2xWWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924415;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wHctfggOkvMAe1zfcJUWnX6CvpKatwK3FvB6xlGPFcQ=;
	b=vmr1lJYIzfCi3EDddNQSYUMd0PuWfTFm4utNVEq5hZ3pz8trWR/IovB0Xd9N0FaZ5yON
	 uJnBwv90CR39LFyM9vpNq9Bl7kSDvNPeWxJ47WztbRmgCvH+vE1NS4sDBpJtM1si8QSQg
	 7/ZLqvl4VXjLRp55Bc+6IQ+7xUqYVcwSsvb5BHZtcbLGpHGxl3h+rDsQD/C0BScTpVUke
	 jTxonXvmyzDw1F85skT8xDO+PkYqOm9ZBEW4wCZx3Qum2WRIlALzOPxDB4OXC+FFLnNCu
	 Moocd1X0iqJHyxwVQHVyVdzlob0sAnUL7Pjbjuub5Q0O9FERv81CnBthL/E4gZQBYwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=isOtUiQk;
	arc=none smtp.remote-ip=95.215.58.42
Received: from mta1.migadu.com (out-42.mta1.migadu.com [95.215.58.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF2606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFF2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=isOtUiQk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7jFL7fpobI/gZrx3DO1fKc1S5lGoMCFwS2MeczAZHWc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794924411; v=1; x=1795529211;
 b=isOtUiQkztxwwEJeqwUEgXEoCFs/dyZHEQF5FzBJ4+OSYvbFT1Z4zhBcdb6Xvd16/d9hivOj
 pdSI0GPsBzAoy95DWc1bLVPYYqQzu5aNTLNGTcF1cK3AAbJs8YHiZ7d62Xkg/pXsg16XLLcX700
 UVoV1xWFz194dIBLYO+vbEmg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57e14dc29442016a;
	Tue, 17 Nov 2026 14:06:51 +0000
X-Mizu-Trace-ID: 57e14dc29442016a
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org,
	kuba@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 0/2] netdevsim: add TLS device offload emulation and test
Date: Tue, 17 Nov 2026 22:06:29 +0800
Message-ID: <20261117140642.4008-1-jiayuan.chen@linux.dev>
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

Running kTLS over this already found a few bugs:

  b17cf742eaad ("tls: device: fix out-of-bounds write in tls_append_frag()")
  ed642349d87d ("tls: fix the open record check in the max payload size setsockopt")

So I think it is worth sending a formal patchset.  v1 [1] was asked to
wait for a selftest that can also run against real hardware.  That test,
drivers/net/hw/tls_hw_offload.py, is in the tree now, so this can move
forward.

The kTLS device offload path in net/tls/tls_device.c has no test
coverage upstream -- selftests/net/tls.c is software only, and the
offload code needs a driver that implements it.

So teach netdevsim to fake it.  Patch 1 implements tlsdev_ops and
advertises the TLS features.  Patch 2 lets the existing hardware offload
test, drivers/net/hw/tls_hw_offload.py, run on netdevsim as well, so the
same test covers real devices and the netdevsim pair CI already uses.

No crypto is done, like the IPsec, MACsec and PSP emulation netdevsim
already has: TX puts the plaintext record on the wire, RX just sets
skb->decrypted.  That only works with netdevsim on both ends and
offload on in both directions, which is what the netdevsim environment
of the drivers/net tests gives.  It still covers record assembly and
the offload lifecycle.

[1] https://lore.kernel.org/netdev/20260901154914.11637-3-jiayuan.chen@linux.dev/

v1 -> v2:
  - drop the netdevsim-only selftest, run the upstream tls_hw_offload.py
    on netdevsim instead so the test also covers real hardware (Jakub)
  - rebase on net-next
v1: https://lore.kernel.org/netdev/20260901154914.11637-1-jiayuan.chen@linux.dev/
RFC (July): https://lore.kernel.org/netdev/20260728125658.390500-1-jiayuan.chen@linux.dev/

Jiayuan Chen (2):
  netdevsim: add TLS device offload emulation
  selftests: drv-net: run tls_hw_offload on netdevsim

 drivers/net/Kconfig                           |   1 +
 drivers/net/netdevsim/Makefile                |   4 +
 drivers/net/netdevsim/netdev.c                |   9 +-
 drivers/net/netdevsim/netdevsim.h             |  34 ++
 drivers/net/netdevsim/tls.c                   | 477 ++++++++++++++++++
 .../drivers/net/hw/tls_hw_offload.py          |   5 +-
 6 files changed, 527 insertions(+), 3 deletions(-)
 create mode 100644 drivers/net/netdevsim/tls.c

-- 
2.43.0

