Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728758;
	b=IvUHciKZWyExtbhgrFCCNJ8zNHAkMKxdN2bMxsmrP54JPSvQkYIRHAXRDl6Y3/lRUvDD
	 m1TaxzFAonEnkZWRjMdHCaj3ULfrkDq9HUm2hDlrREDOPu+udWTvOy6zXCe90ELqDbNIP
	 UdV8RBUmrmTprYYq3UOKApdCeeunDqc+kqGizw1ScLMyTr5aw9CYlwsgn5UvfHXL6N0cC
	 AhlzNIsQ5Feiyvd+DAZRtL7JGm42MDtauX9IAGZHOWeJ0WHTPeA7aF34bNhsT/IatooA5
	 JCJCQ6yMpMRvxcj5z4MM2FUpwnWyh6+m18Q3otcEbbet9VbmtyumHsJeuyg6pfl8XXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
	b=xEZhFyXAo8g9fqYcWsozlKXZjDQqvSneD8zl2NkgY1tsCKc7EE/skye5TD24UrQt5Bua
	 7u6ZMQJfzQjWSTgy+6dp4f3G+0g7l0iTfppIJSUhJ3/PnA9F9g+8R3G2J/fkOh4f7BU8F
	 AyjyqLQU0inC6kl74olkZivMpaeNAUVyugFHqzaot71NybHXdgS56CVo/1ZSJYUvrKf7f
	 sNYRSO4Y6p3zM2GY50zutBfR/zZDDBnQlNIOlH64ZCJIFdKdp6NL8V7RiXv+OpOxKtXer
	 0npGM5OPzJCKOBgEdv6jMHJb3feBqnExrzp2ZJ3U3tkVS09CtlVn1ZUlI3w+6hMfphA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJk4uMWp;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E68E606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E68E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJk4uMWp
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f84a55cc06so2137808a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728757; x=1795333557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
        b=xJk4uMWpCiZ6G2s7rWpiHLeggzGdvma3jmXAmPOpY2O78sYu1VUmxlkqnM2JokxPzy
         S1puLmfRw8juF9iirGOyPmagsn0Ot1kxHjMmyVV/tH28ykkb9PzkuWRTO7pjAiBxWEBR
         zTatD8bXeza51KycKCM5eHAqCkYEQLa/AeRrJa7DKDPVcTHmb2eYCPU3CZI7u3MGsuUU
         WypEQvRT2TE1CGq2Hu3/62nuRGc7uDrbJbn1jY3Q7dI9fKmsEpvYl47z+8oSHBuy+68z
         3RfIeWfI3khlCJYpdGDOu1pU850bTONLyfdE+qEw/lblH34Z0bgRSHAde5yCsSxnLy0t
         1QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728757; x=1795333557;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PleiPueCH9hpIoxgC5EU+oGizyNRMx9QSVsy9vFMuYc=;
        b=BkuXdF4wsI/QbVqqUYI6okiNi9vdy1z/17fLydKqo8FMiYQSxBmQu/dkdQLkfVzkR3
         hMvF4HzAR5DPQXc/mPHH2rF7xyfQ8IR7DhGV18ziLVZ70ADw/AQiiZ11xQB1aJkSGjL0
         91RBsCqtfHBf5nsXL7i9kprkV5uN1LvVXyHK5NYNDMBzk6JaW39/l8aY5Yb/dm/c8u2W
         5VRuyAcRKECoq+ErZ42NlsxrXWTItdaRrOSbBdFDBF8092A2BIzT+mgxs4e4K0f8w0bT
         T+xxunDa+1mrPqWAW2Gd7wQFA4+pDwY3Z1VBq469KlDuvAUg5by5n3w2lAzqi/V39Kwj
         +w3A==
X-Forwarded-Encrypted: i=1; AL+hErGDkYxAJpPi9IgJoWfUx8hVvyDO5RiHAcFX8zAguNpVU9dyzQY4l5eBy/5C7EYdqxWYhM9l6LTzibjJkNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rQOb9No0CPnbf8fbYj8QyVqhf61q09iaHelb2UYKuGclPeGVr
	u1taHJnwX00ObHSXSEgthWwfaLcWy885+LiWLMZxf93l3Zb+HQ/5lcBV
X-Gm-Gg: AYBFou3YNdNry2IXSo0Dw8Qw7jXkKZjHmRg/cgAcspNuGcbAiiqPXAZVwWbDIjTqhnH
	ui/HMQ6XhynxSeeGe8G4AYEoW9ocXW1MxKCPHg+SymGS4UPe+ZFCMBNSfHqRwftIJLDExyZ6Y3Q
	yqn/GNZSQubqQTHAsDTfc/JbasbVspu9RBhjqyq+SFW658vNF5q/W1riveUG3n/HylNBh5EdS7D
	PnxYELMCRz0YVqhd/Tv9xtTxNSPqTeobQeK80LEUKJMpDMQLUwIBSQ6//3PftefDd2Orht90x4x
	LLW4xMSy8qo88Gitm2QUFParRiMr2fTKEVmH3wt1hN9K5AhOprS4VIhIXRg+Q1433ADyK6sieAO
	UmNueJib68T/VbU4VxxQV3+YKzckfLdO9aBM+rDvuHcY+j5nInne1CbxppOxKDns1NX+hhymVBw
	00VVm3ZREIQBto4Fz+PWiOl3xneXdN9LNSlfUrvuKGy1WbF/h8upp6HJQjAHIwJEhGbsPVY6tT2
	Cv0YMgkqyhIHAjA9ejhLSQNI0HOw5Q573tyk+gZ5229lGtUaK/xNNHBMUQ1XQp+eY/H4AfjYwd2
	zI0qlx6OzBtTMUzAKPQUn2SBRGeOrhE2z1RB89n2D0+X9a6sGEd1qDcqWNYsuDQbi/g7h89p45D
	5t07R9xdylvfKHMBghSUTsGEwA4tsq8Z0401YCMLCHuaC+CIftHWpkIyz2MrIY4AFKDVjDvhCUm
	ZLrVCGoM4LrydZAQf0Q6favNmrpsxNgcOPgPmSRS+cscOQObyuvYo=
X-Received: by 2002:a05:6808:4f5e:b0:53b:11c7:2da0 with SMTP id 5614622812f47-56e63285bd9mr7499537b6e.21.1794728757024;
        Sat, 14 Nov 2026 23:45:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v5 0/3] net: phy: report ACx00 receive statistics
Date: Sun, 15 Nov 2026 00:45:44 -0700
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OzU7EIBDA8VfZcHaUjyllPfkexgPQ6RZj6aZg0
 82m7y6tGtc9NOECM/zyv7JEY6DEng9XNtIUUhhiuVQPB+Y7G08EoSl3JrnUgkuE9On6kMH6mXM
 4dxdI2eYEk4DGKNPWNSKSYeX/eaQ2zJv9yiJliDRn9vY9Kcw7+bzS666zicCNNvpuffrdfupti
 Ou8CykP42XLnMQm/hRVO0XllCzVoBaEunH85VTAj0c/9FvHJP+kQu1JskjKG6s1Iq+9uJfUrXT
 ckxRwaJ3XSta+coT3Et5IQu1JWKSj0c5YtMLU/5qWZfkCG3yqydwBAAA=
X-Change-ID: 20261024-submit-acx00-phy-stats-v1-d838f77444e8
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

AC200 and AC300 count bytes in received frames including those with CRC
errors. Expose that hardware total through a new optional PHY
rx_bytes_total statistic. The existing successful-byte counter cannot be
derived because the hardware does not separately count damaged-frame
lengths.

Report successful packets and CRC errors through the existing rx_packets
and rx_errors fields. Bracket the raw packet count with matching CRC
counts before subtracting; bytes and CRC errors can still advance when
sustained errors prevent a coherent packet sample.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v5:
- Split the existing PHY statistics group-name documentation correction
  into a separate patch, following Andrew's review.
- Narrow the generic statistics addition to the inclusive receive-byte
  counter.
- Derive successful packets from a coherent packet/CRC pair and report
  them through the existing rx_packets field.
- Keep collecting CRC errors and inclusive bytes when sustained errors
  prevent a coherent pair, with separate baselines and sampling times.
- Skip invalid or unstable byte samples without discarding usable frame
  samples, retaining the measured byte modulus and sampling-gap limit.
- Rebase onto current net-next.
- Link to v4: https://patch.msgid.link/20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com

Changes in v4:
- Invalidate the ACx00 baseline before accessing counters in soft_reset,
  since phylib may already have reset the hardware before the callback.
- Start a new collection interval on resume and after gaps of at least
  320 seconds, including system sleep, preserving collected totals without
  interpreting unobserved traffic modulo the hardware counter width.
- Clarify that the byte modulus and frame-byte boundaries were measured
  on both AC200 and AC300.
- Specify matching frame-byte boundaries for both PHY byte counters and
  explain that phydev corrects the documented name of the existing group.
- Mark the DP83TG720 conversion as unsuitable for automatic stable
  selection without the new receive-total API.
- Rebase onto current net-next.
- Link to v3: https://patch.msgid.link/20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com

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

To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
James Hilliard (3):
      docs: networking: correct the PHY statistics group name
      ethtool: add a PHY receive byte total
      net: phy: acx00: report receive statistics

 Documentation/networking/ethtool-netlink.rst |  15 +-
 drivers/net/phy/xpowers/acx00.c              | 223 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |   8 +-
 include/uapi/linux/ethtool_netlink.h         |   1 +
 net/ethtool/stats.c                          |   5 +-
 5 files changed, 246 insertions(+), 6 deletions(-)
---
base-commit: d1f4b7c6b997c29de67ad7178ababac2328cb1b4
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

