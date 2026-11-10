Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278926;
	b=0Ruf8BXc8Q5pOY1PcADxOCHR4t6lJqE35sLs1ctHsy2ypRTHGVDulPkFRRF9arSqkYuQ
	 SBQWS0To48MkFflA5aGdFG21KbpjSRKsjfLjkIVQYyAQPYLAwxma8CsG9t8Kcd0Sc/FIm
	 uP980sSztQlaKkvrA/VkOCR4boI5OAqqN6NwN6TEe/PUT+frJv4Zpoau3KAgNdvAoZdgw
	 ijw5TmOa3Gvf5YApEvCKYkJdSRpUzgmodgHbl5tezCTkMoI4VzZWHXBb2Ar6kBnurHiev
	 zQTLEv5Dox+Kr/QFAvuG+gWM6GshLAx1V9LqdwGzjSNyWRtzysFom2hv+6GDl3nSvZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=u1mRfjRp548mQrIu3BS48h/N53IKij7/e2kmO+NoODA=;
	b=PRWgBvsHoQE/xbdbU13KfCLKXUTVIDuEcibXZbvq8Xru/z5RU8T6UasMYCnKmR3zTyoX
	 8W2NAW6SN+HNFuLalpOdyaJh0YsgYaSr7Dp2Pvlfjov8aKYLEmDlObZwqlzqgMa3Cs7K1
	 isOI907PUvrtJtNYuwW0yQXT0RphKVjIEotFnMrQ0Vbj2l+xHkiLV7PeX3J0Q3CxATGW/
	 29GQLbdK0CX/E9nSyWVgUOCrzlXxtI39coWeFQOPWnImBgBA7QdkKp8lSHi0f9CsFhcuR
	 EqZcRBMFfzP1UlduOkWdpMLP+1+ALvzfxK2Envzf0t2JIamPjDzgNMG7QwYLIBeT7Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KgRxhcdn;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E90606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E90606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KgRxhcdn
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-7143451981fso1028645eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278925; x=1794883725; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u1mRfjRp548mQrIu3BS48h/N53IKij7/e2kmO+NoODA=;
        b=KgRxhcdnXtkdCaGp5bqw8j0icuFvS05TJxM52gjAOMC875K5SlLmpxNATd7+krziLX
         CO4azcZgsAbU28WQKosvaeN6buAq2qOltVCGy7NAFdKUvKkoiViqmTfFQg+ddkoVpYw0
         BwBpqhEg6604V7zLHHvxq1YbGqmCBLHV13/ZzFgSYxsy2CF5ikOfNysUYXz/Wg9Xpgkn
         dL5uVHkhEqAbpyl8EVBzSDJWhMJu+benOkcpgEXyx0fZWNaDtJQQhNyOfswzhTR5Rw7c
         CMF1wIaF8qo7GoB2EYcIU3fCbmWCS5j6EgXpsAC6LgQTWABCTX3UJzdJmwtInMxA90XR
         7wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278925; x=1794883725;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u1mRfjRp548mQrIu3BS48h/N53IKij7/e2kmO+NoODA=;
        b=E+N8EKsH1L1ro1utn+BGGp08xIF+HJNnDuhSiL0/PKa1D+mhzCBoL4kqGB9iECA9wM
         e2JRJbcNlGtHaa52vnRSBm5LW/W5YF+6of1SKgbSKJqCtEprFpg8CYh96RYzVr+/c5gi
         t0N3MtJ5FZHN4HK2hZFBKW9iv32ai/8U3SKs2Iez2t4GSFVz8ibTt/6My3p8sCjuxRzN
         /s6z7pAEOX1rPA0HwcX5QojyxC9VwYySA/JOfOK3uCRECdnANzKzAUKYCE16w5FkzA7G
         ZamXDb2hqKin42TOC33X+WNproozyyPJiRhY517pDS8y0tPfRhcfNJPjh3VWGXpjukKi
         LY7w==
X-Forwarded-Encrypted: i=1; AL+hErEfqXwpJb/xMrNMHq3frNCZU2CLCtey96Y7xqTX7Ic4NhT1aieI4nF26gQFXp1Elh8TBEP7pZez5ozUYSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T5ufoAtXrpq9zRRqyWNl8AD/H9C7Byk8bIGA8BLueW6TgqSXO
	53BYL1navn+l78O5KuZGsdewwaFnh4QXCspe8/Wxxt/c/jfeM72Mbwro
X-Gm-Gg: AYBFou3igULz8hwhhqFyu66dRnzj78Dpwt1VNt/bbtyR5HBCf3TRgYKir0ZzyBCl1LW
	1/cECa7yRtbBYShCH4hKUa9d9f4LjUJfoz7DFG8jt6YyrI0hx1bAvrpz+5nytA4FPO2DmRbYDku
	njrR35Q/bKarWsa5/CeMTQsg0rk8i5aYRtPhaO71heXXBWH8q0Wp8q4AZ64Z5Z/K8ISB1AyaCJq
	KC+uWw5mBoLxrR+Lyw8UZUO8Kwpd0r/7P0Paj+D5SL8ihmv/j2dX3aVP6o9TXvM3nnH0w4KhXO0
	SMO1aUtgnXuNdSmsugG6SamKQnFTKigyIiOTDZ8rVCUYaKsaniO4n/D4k4PyINjVAwI8p04+hF4
	o3fmMaLYuxN53GF5lyZmQXf9/voYpECvmEo3kHKSWUcNRHWPYtLCJLltUxM7r3b7ijBnCbWlnJF
	xK1X4iCR5XZeUIfMaVAzRvQlwWcjHA7ArL3K/e/XBmOUi9S9LyZzG7Qs7wH5n++Qj7DmRqPTNrr
	l9mvwxTHAHyYuPzzZAFhUI+YCm7cuMOifWskpsBgoqK6jlhrvimSMtC5pIm9Ygrd4EtkMg5tnXR
	tDa+RvUiLbbzjgiI0Da4TsYf/2wYgui+X27bfkksJGYWM20c3kQqK7Ks9IpLi91JzzPyyIbIn89
	lVWRKhpGgSNoCAPPi4xYjZaMoFZpqwg4aA3EQHgBFf9WwfkbR9zSiwKJ5qwcaaE+QD7tOP3HDgp
	QU/Mwq+dLLNbyO5Nv7wV7+V7eBtsl1upIgfINGVkhPkIQ0Y9Kw7cgK
X-Received: by 2002:a05:6808:1991:b0:4cb:f21b:6f91 with SMTP id 5614622812f47-5683cdec02amr1137185b6e.36.1794278924676;
        Mon, 09 Nov 2026 18:48:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f39c60sm943233b6e.14.2026.11.09.18.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:48:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v3 0/3] ethtool: expose PHY receive totals
Date: Mon, 09 Nov 2026 19:48:31 -0700
Message-Id: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OSw6CMBAG4KuYrh1tSy3ElfcwLkoZpEaKaSvBE
 O7ugBpdmcxmXl/+kUUMDiPbr0YWsHfRdZ6abL1itjH+jOAq6pnkUgsuFcR72boExg6cw615QEw
 mRegFVEVW1HmulMKC0f8tYO2GxT4yjwk8DomdXhtiLmjTTM+3pYkIZTDeNvPoc71tjfPzvnExd
 eGxxOzFIr4T7f4koqJYWaW0QKWrkh/OBF43tmuXHL38SkT9kyRJmS2M1krx3IpfaZqmJ/inzTN
 IAQAA
X-Change-ID: 20261024-submit-acx00-phy-stats-v1-d838f77444e8
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Some PHYs count received frames and bytes including errored traffic. Add
explicit receive-total counters to the generic PHY statistics interface
alongside its counters for successfully received traffic.

Use the new counters to expose ACx00 receive statistics through the phydev
group. Accumulate the hardware counters in 64-bit software totals, retain
them across reset and power transitions, and return cached snapshots to
ethtool.

Convert DP83TG720's existing RX packet statistic to the receive-total
counter, matching its documented inclusion of packets with errors.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Add generic PHY receive-total packet and byte counters in a preparatory
  patch, retaining the existing successful-traffic counters and their IDs.
- Report ACx00 packet and byte totals through the new fields, leaving
  successful-only counters unset.
- Convert DP83TG720's inclusive RX packet count to the new total field.
- Bound coherent-counter sampling to three attempts and skip unstable
  snapshots without making phylib take the link down.
- Reject out-of-range byte samples before updating the hardware baseline
  or accumulated totals, retaining MDIO and page-restoration errors.
- Rebase onto current net-next.
- Link to v2: https://patch.msgid.link/20261102-submit-acx00-phy-stats-v1-v2-1-3c8a664407c1@gmail.com

Changes in v2:
- Rebase onto current net-next and repost after the merge window.
- No functional changes.
- Link to v1: https://patch.msgid.link/20261025-submit-acx00-phy-stats-v1-v1-1-d3d461e46db0@gmail.com

---
James Hilliard (3):
      ethtool: add PHY receive frame and byte totals
      net: phy: acx00: report receive statistics
      net: phy: dp83tg720: report inclusive RX packet totals

 Documentation/networking/ethtool-netlink.rst |  16 ++-
 drivers/net/phy/dp83tg720.c                  |   2 +-
 drivers/net/phy/xpowers/acx00.c              | 168 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |   6 +
 include/uapi/linux/ethtool_netlink.h         |   2 +
 net/ethtool/stats.c                          |   8 +-
 6 files changed, 196 insertions(+), 6 deletions(-)
---
base-commit: e281e85235cfc2acd080093d5deced427c4c9856
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

