Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856223;
	b=1g2jFuIl9XUZN2TSlrixd8chgxoe8mWSipLGy+mG1ZRXcYh/q6+wz/TNQcK/DKWnDYm0
	 GbTq4ZfocumxC/fQ2wlTqqz8U7OJkr+bFQIztfUauU68uLGfCgVrlVgjPTLkiHCb23j9F
	 i0J1cMXtoJCB91fFkB7/YEtWZeSwP6TzhKzJ9O3cSdr+XqFeXex1robKIR7UntHKSFgi3
	 j4Gk/BHHP6/fvHyFGVVTQDAwbiBqFwnqLgIPoLtI+vbEdzJKfs9bu9WGZiEMDRfRwJIDP
	 OCh7J+pEMUuT71RYXVHzkyuLrlqmYBcy8jT4RRblklCa2z7UPBPUcaRS3HgmWepLPyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=DQtxOkRhL1RVehvg9axGf3bpjjO1a8C4ieQHWmTRLjQ=;
	b=ha6LDc0yKhM58qsWcbx4IPmRUKJvF6LTG0stjip6Fp2X7lmNSKa0QbQR2tccImvrx5JY
	 YIrFvH6it/l58ZZGSE1DbL0KNl452kVj46zQN0V+y+nntn85LYbuXUK0NEtjkX2ybXVGg
	 AortT/DfoDqqrMv/Iv3i9Gb3LiC4fE6tteDlpAud4L38am4cq28QedgRHo6yqgG0W3KJC
	 DVnCzWU0DnpuzqxwIL3ahol2GwrVtpwUUf+szofZQCNsly1WYVW78Bn+T7hge64A5bpPT
	 +CGsZ9m4mH9TwNnVbbpWGXJMzMMn2ZkYRFFhTCyM4pnYEoFCGCXS86kl5tMDDkRfVdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yx2ZXVk3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313B606A31C;
	Mon, 16 Nov 2026 19:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D313B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yx2ZXVk3
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B5454202929;
	Mon, 16 Nov 2026 20:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DQtxOkRhL1RVehvg9axGf3bpjjO1a8C4ieQHWmTRLjQ=;
	b=Yx2ZXVk3ijNnjMRg1eSwL8bpznTXbuWWLryvGxXFPwCHhksGSus6JCoQDZw6yfNQuqZwbr
	9E+sdq6qjGf3S5NNgEHXUq/3qAVJVQg5OGc43VklpYcxActEqU9AQYfNI+3/zBhpvftGAD
	JnhoGaCOSzFBsUTCdGFmZPncL7zlvs9t9Kxa/MZC+noRtymz5X2WGLxtLtkdB2evA22Uit
	yfYfgGg61tqELvD51FFEEWJI6bnP+vnkET9ODCMD1Q6tayGLe8aAZ/KqwyU2/lQtuin6Ll
	xaSQnupXNyOzBIiiKFtc0EBgn7HdynNT7P70P1IE4btgaW+qEHi9jtKD0TAmgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794856215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DQtxOkRhL1RVehvg9axGf3bpjjO1a8C4ieQHWmTRLjQ=;
	b=PsoaB64ZWk0YQ4Ixh23y6ujtVOT4tef8pYNCWJFahX+I48pYWiilgYHmhU68QBQ//rTsvA
	YJ267fQt+fq4pLFxbrY3UIvJXxKUveyentLYOAbx3reS8vXRkaKRQq4RX2r9JSwaufxOp8
	ZRrFV226je6WrIGJIUVPNO5GpO7CQ4ebITOEqN00weeuO5IbWHyJtwx6Gq0XlmcSZxNi3P
	z1jkl8swi8Tz6TOom0e6CSkbfl8D3O/Jg0HdOuyTarHArZyiRaHcsoSNRWJTjuclQS7M5w
	ubj2s+ohSqa2EJFT5giuplGn+ZsnrqwvCnQ/NT64TJRhD1lufVRsWSLpp0tCSA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794856215; a=rsa-sha256;
	cv=none;
	b=L9yAkcxgR7xY40Phlwt4+0GmJyoyQ1z2gXm7HtuYtA8vXlkqvfId4oMsoNwI5iG8Ea2NvT
	HpPNI3kUoAGWEUi0h/rQ6xiZbFzZiMiNbi7wRqR3s/zjHkAeYLrDPJts+pJd56hfewGf4s
	x71urLx35SK6xiw63CrKCoJiKNjcsOs4dFvsT+QZvaHaIZAWTUdfG/IlDma7avE8dbrpzU
	o6Us9RoPddaJH0KIOzu8o3EmijkQ/rqSSbrClljOlgUlLXpx7Y4E657PW10F4Kxn3VQ/FP
	5X0qLme/gdQDbQ3C2HfYZWsN9e+Mke3oeUhFeLlcM5z1sQ/GKUOTOK1scbB7Kg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1058)
	id AA048380329; Mon, 16 Nov 2026 20:10:15 +0100 (CET)
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH net-next v3 00/10] net: dsa: realtek: rtl8365mb: DCB
 ingress QoS offload
Date: Mon, 16 Nov 2026 20:10:11 +0100
Message-Id: <20261116-rtl8365mb-dcb-ingress-v3-0-657f5fdb4db7@pengutronix.de>
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
X-B4-Tracking: v=1; b=H4sIABRV+2oC/zWMQQrCMBBFr1Jm7WCaYFGvIl1Mkmk7YEZJQimU3
 t0ouHz8/94OhbNwgXu3Q+ZViry0gTt1EBbSmVFiY7DGDn1vbpjr8+qGS/IYg0fROXMpaCKx68n
 YYCZo7jvzJNuv+wDlispbhbEtngqjz6Rh+XYjrZzw/zgnEoXj+ACP7QcYlwAAAA==
X-Change-ID: 20261109-rtl8365mb-dcb-ingress-0dae31a02c0f
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2

Add ingress QoS offload for the RTL8365MB switch through the dcbnl app
interface: a per-port default priority, PCP trust and DSCP trust. The
mapping helpers go to net/core/ieee8021q_helpers.c so other drivers
can share them.

Two changes are visible to users. The driver now rejects a devicetree
port that the chip does not have. With a default priority set, an
untagged frame that leaves a VLAN-tagged port carries that priority as
its PCP.

Tested on an RTL8365MB-VC with eight queues.

ETS scheduling and CPU-tag pre-classification will follow in separate
series.

v2:
https://lore.kernel.org/r/20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de
v1:
https://lore.kernel.org/r/20261002115850.962676-1-o.rempel@pengutronix.de

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
Oleksij Rempel (10):
      net: ieee8021q: print traffic type and queue count with %u
      net: ieee8021q: add pcp_to_tt()
      net: ieee8021q: clarify the tt_to_tc() traffic-class mapping
      net: ieee8021q: add tt_to_pcp()
      net: dsa: realtek: rtl8365mb: describe the ports of each chip
      net: dsa: realtek: rtl8365mb: store the egress queue count per chip
      net: dsa: realtek: rtl8365mb: add QoS baseline and DCB default prio
      net: dsa: realtek: rtl8365mb: program the PCP of untagged frames
      net: dsa: realtek: rtl8365mb: offload DCB apptrust
      net: dsa: realtek: rtl8365mb: report the DCB DSCP-to-priority map

 drivers/net/dsa/realtek/Kconfig          |   1 +
 drivers/net/dsa/realtek/Makefile         |   5 +-
 drivers/net/dsa/realtek/realtek.h        |  33 ++
 drivers/net/dsa/realtek/rtl8365mb_main.c |  69 ++++-
 drivers/net/dsa/realtek/rtl8365mb_qos.c  | 508 +++++++++++++++++++++++++++++++
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |  33 ++
 drivers/net/dsa/realtek/rtl83xx-qos.c    | 210 +++++++++++++
 drivers/net/dsa/realtek/rtl83xx-qos.h    |  20 ++
 include/net/ieee8021q.h                  |  21 +-
 net/core/ieee8021q_helpers.c             | 103 ++++++-
 10 files changed, 981 insertions(+), 22 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
change-id: 20261109-rtl8365mb-dcb-ingress-0dae31a02c0f

Best regards,
-- 
Oleksij Rempel <o.rempel@pengutronix.de>

