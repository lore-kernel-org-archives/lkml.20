Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348405;
	b=Wb8oaRALPsnFJ5ibpOp6kixbOcpelCDqaCmCuEFoe+QIg/9dmu4UR/AnJ3tpz0c/Hqdq
	 wtIl1b8i8p5bnvWgPM5IRmclMiiQ6JQT0Ts1KlS/+pLX8+u+qDyC7M2sdTgrO/mB0FiDW
	 OuMSPG2gkQUiJMItk00H22O/Ccl+eId7akNhHGUjHnI02PhVD4OE5m78r0ybJtBr1mWQT
	 mlNpLi5cLQcscoHOxb9BTYZvLal/ydoUH+Jurf6iLaVKjTdDzAod1++JcqoHkUd/Obf7F
	 qhJv6NPBGrd+5Quhoy1UpgXA6mroye+eikSlj0/ztxCFHtx4RcEfuJGRtA58l4qOIsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=kEjK2T6kz9YShd/Epo4oqsZZxM3NGAQxYmS9vMoCEcU=;
	b=d6FgWopPF6gcaD7PMnYLS5nWCb/Sosgst9StFNgBKtaacoBhpijBbZEY5JsqPxxT8O8f
	 JaE8uZ9yFQoSQF5PO+LFboFSs4CwaennFzKBzXW/eENVeFy2NgBdCiPpwAjbpGROHuc0Z
	 SvAaU+gahZWlO1hUzzjCB276qhk/ODGVKcTBkfJWpt2S4csr5Kr9LBvl+o2V3YxLAz9PU
	 mUA86UQe6SRi9G4UZSoSXBzchXcydr07gh9ahsyk2+xH5dT5WNlbSNbhUxyOmMfKrn6eq
	 t4cSDwaFzvkz+aUfmZgZpOF18TsCqt1ZlSzsN2MhgvjLCEd1j1eoeUnOPDewEvoUg8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2qLec9f;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D391606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D391606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2qLec9f
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b331cad3cfso21079117b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794348404; x=1794953204; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kEjK2T6kz9YShd/Epo4oqsZZxM3NGAQxYmS9vMoCEcU=;
        b=d2qLec9fBP8SI081bvzwMjw6fndX+IiRdR1eV4GVw3BAQ8Q5KVIxOBKlmf2+hpa2NB
         W6fkZUtI6ExrK+C88gyfnaQwemJnhF6hIntEXn9mLihCIuz5XyoNMV/Tc3cPyrtLmONN
         STrE1tW15TQ0gYcKrpQNYJLWov/Vh7zQDDPA09tIf3TSMDLNTkkLQeb3kcRkjDsXP0l8
         ELcUEePMKD9gFxoPR+fIYLhoNYXP9ghJq5Js9+yQrqyiG52vOMplCA3zsPlLVQGdLqH9
         NSs9RoZngg+2YQbTS7QH8ySIoAFfVVUzA8M7gmotFkJ/PFfksO2ICOaDKiNfzoAKy0b2
         7gRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348404; x=1794953204;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kEjK2T6kz9YShd/Epo4oqsZZxM3NGAQxYmS9vMoCEcU=;
        b=NBBOLiI5VL+fRUOyyhgiJlnWFoEh9HRhtQikZFyNdfcDPUpoPY0tnLjKl3ST+tKxXo
         93YvMZLZnzBlV0lOkCuU5FXPnc+NmQm/fluMZ/W8WEzip6FUorDQ5f8SSBQ49h7S8pnn
         ovNM29gGL4vPqYk5xrAQEDEUxLc+oJSUIzDMz7J8qVT97NVvRhFBJ245vaT1NtyoVMZZ
         Om/CkvDTe3HeDYiUMN9UWzzPulOZXeJwUUi1cOElFAipjbmuSi5PjfPtt8efkO7RKPE9
         Sg3m5EgCjlUtNwBpgJfdTJpF5EzCd36KfHspaT16TnAztzSE+j23ebluHs8Gcssv2WKb
         82Gw==
X-Forwarded-Encrypted: i=1; AL+hErH3efzEvrowZH7LOY7NbPxUDa6XMBfvxdsxgNltj3qFsS7I3S+nSev7ep36tZWOgxehshDN/KdbcC3Ie6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kGHO1otr4DQu7EPAtsQCt+9kHg0jidEH4H58TVH6zIYihB56V
	SQsK7e4YcpoZRX6u90alMgATV02jRiuzxiF0vFVIY7ansxIsR9mGCg1A
X-Gm-Gg: AYBFou2pd6i4IipWUVQq3f3H0Me2bJekcqtbZAB4iRls75QA6hG+PIdm8WPdJrmid46
	GQPNU1yQsu0kAW/PXXO2joNrCDqGlBoMBVuoDZd63MQfMJhv1SmXSMlsyHGzmf2/V9iH26ZJEs4
	Qe1czcZQpa+lyKppUg3bSNegSEKSPCYP1Sz0c0mdYj3vTPGY6hG0oGKxyldOZ/8T13iZ7WsyHS5
	Vv8kBuBFV8JqaYaHbmQtLkAnKwhRzbc/jTNs+yyPiLnKwL5J18Oxtq/Cshb2ew4EDJ6S1uWq0SE
	LJCUG+XIKKXoxZZoTPiUmH152X23jLd3q9ac42FfENLk1zsx4DXhBkUxS96AOooUE6tMXPfo0eS
	/8Me1P2zKmu245Sao+WuiArVOnE5fK6OmI+QBJwv41CxyXijrnffWzdbzyZXEWGOqXW/+DUBFX6
	ly7lrF3hLYDzRKa1gf15R5p2FIyvg+mR9vS5iTRUomwJgdfXxBFV+KMnFL0KkUMhpzdvQgQYfbf
	/u5caOnoLlO2NTIQw6GJktM3TR9e91ro6a+5xJIsG+SAbL5vjFuNwQQxvBE9IG/14jYAgHlhV9D
	65u+XD9IpjfXkjjZZ4qCK2i+yw==
X-Received: by 2002:a05:690c:38b:b0:8b0:c71d:2b2b with SMTP id 00721157ae682-8b3a8209ea8mr5614887b3.45.1794348404380;
        Tue, 10 Nov 2026 14:06:44 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39339cc9dsm30081607b3.8.2026.11.10.14.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:06:43 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v2 0/6] eth: mpnic: checksum and segmentation
 offloads
Date: Tue, 10 Nov 2026 14:06:33 -0800
Message-Id: <20261110-mpnic-lso-v2-0-ccd37b051d08@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAGqV82oC/02NywqDMBBFf0Vm3SnmUTFd9T+Ki9SOOqCJJEEsk
 n9vkC66PJzLuQdECkwR7tUBgTaO7F0Beamgn6wbCfldGGQtGyFqicvquMc5ehTG0ku1dGt0C2W
 /Bhp4P1tPcJTQ0Z6gK2bimHz4nCebOP2v1/z1NoE1ktFqGIQ2ivRjXCzP194v0OWcv5bOg6GsA
 AAA
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Add checksum and segmentation offload support. Tx checksum offload
follows the generic csum_start/csum_offset model. Rx checksum also
follows the normal unnecessary/complete model. The device can validate l4
checksums for tcp or udp, when the l3 type is one of: ipv4, ipv6,
ipv4-in-ipv6, or ipv6-in-ipv6. The full l2 checksum of a frame is always
passed to driver via a Rx completion descriptor field, which can be used
for checksum complete on other packet types.

Tx segmentation supports tcp or udp in ipv4, ipv6, 4-in-6, or 6-in-6
natively, and can support most other tunnels with GSO_PARTIAL.

Counters for CSO/LSO are exported via the netdev qstats API.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Changes in v2:
- eth: mpnic: Tx checksum offload
  - use skb_network_offset() for the L2 header length in
    mpnic_features_check(), since the mac header is not yet set when
    called from the IP GSO slow path
  - also enable Tx checksum offload for encapsulated packets via
    hw_enc_features (moved from the IPv4 and IPv6 in IPv6 patch)
- eth: mpnic: Rx checksum offload
  - convert l2_csum with cpu_to_le16() before csum_unfold(), since the
    device reports it in network byte order and skb->csum was wrong on
    big-endian hosts
- eth: mpnic: TCP segmentation offload
  - count discarded skbs rather than segments in twq.dropped, matching
    the xmit error path and the core's tx_dropped
  - report only hw_gso_wire_packets; drop the super-packet counter
- eth: mpnic: UDP segmentation offload
  - fall back to SW GSO for skbs shorter than MPNIC_MIN_FRAME_LEN, since
    HW LSO would segment the zero padding as payload
- eth: mpnic: IPv4 and IPv6 in IPv6 tunnel segmentation
  - derive inner L3 header length from csum_start rather than
    inner_transport_header, which can be stale for DODGY skbs
  - check the outer header is IPv6 in mpnic_ipxip6_gso_ok(), since
    SKB_GSO_IPXIP6 can be set by a nested tunnel under an IPv4 outer
  - move hw_enc_features setup to the Tx checksum offload patch
- eth: mpnic: add GSO_PARTIAL for other tunnels
  - derive the L3 header length from csum_start rather than
    inner_transport_header, matching mpnic_features_check() and
    mpnic_tx_lso()
- Link to v1: https://lore.kernel.org/r/20261106-mpnic-lso-v1-0-e943ff1493e4@gmail.com

---
Daniel Zahka (6):
      eth: mpnic: Tx checksum offload
      eth: mpnic: Rx checksum offload
      eth: mpnic: TCP segmentation offload
      eth: mpnic: UDP segmentation offload
      eth: mpnic: IPv4 and IPv6 in IPv6 tunnel segmentation
      eth: mpnic: add GSO_PARTIAL for other tunnels

 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  41 +++++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  14 ++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  40 +++-
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.h |   5 +
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 242 ++++++++++++++++++++++++-
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |   8 +
 6 files changed, 346 insertions(+), 4 deletions(-)
---
base-commit: 97ced2c090bfc2156db31fca9f52cf253e4bc186
change-id: 20261102-mpnic-lso-19aeb38e5648

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

