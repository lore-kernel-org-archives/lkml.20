Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819606;
	b=Caz9TqZp8Vg75KncmA9ybeFOFDjG4TYwY1Pf92O19MDx19hycUSA1+iiV0+LL0ODXN/d
	 PrK9aJQmER4pJjkbGRd6caDVBkggfKS+J/w4CG6la4g5W49Y1RDMih0l7+PM9IYVUObml
	 oeZG00xa6o3cPeR4Kl2/n9gFqnkZ8Ri4V/QtVhqNFxVi5fmJL9sTtvaWIcaYS7Jf3jShO
	 CpQ6aKOFgo45lLslOzje1CsIFpam3ko98/ebrjCOQUSpbA4cf14YqXLkiY75vqpUkB/+S
	 ncCox7eeJ91teUhkN7sDyqiZSNZbZN8A1HjIiseAd1MRVkAkzLkUDSbWirIcQwE/SWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
	b=vMjrqL8r74W++56uyN4acIxfuSVzVB1f1YPf4qGsM1vwFNSgVu71CRVBNGRMnvcsbL2a
	 80AcQZLJWIEANjybaXhDlkAdNUQsXzZ88u0T2KXbOo4x6TMx79Mg3FKSJQc4KW6go1zBH
	 BoDczSb00Ae599V7i9M1XLqg0Wuabm2J+c7wwgIJ0R/HGyjifktW9MLO/4p/UDRV87oIt
	 SZQXFgep+kZBzRKk3NuSKMJj3sTx70Qzppo4sk7Ur7e8wiDoTR+cGSBHocfVwkf4lLs/X
	 XZ/Ix8WuJIBnhbsTazBit8bhxCokUmkG0mGSAUmsR7bFzukOMo0YHpctN2QJh1ydsTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+4V74VY;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29203606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29203606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+4V74VY
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4b28d9537bcso2744419b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819604; x=1795424404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
        b=o+4V74VYHHGEwhhJlNUfTApJrT15j5GcawAo+tYJ5Cwh4eCSxw2DFkjvh3s1Rpjaqc
         CYutTqg5MNgSF+d/0tsK4el7Oyq/M+4zKiyqTREVC8wa6sd2i+t00qsqz96u2a7Do/T0
         S61bloURCFvfTqbXq0Ivde3n8DJRjFyxYeWwkz66nnloFZwncVFMCBsyiBbwObOuJkz5
         IskLk/0fnKHf8yEKHIselPnjHkt7keVKHGti9IJMT8vSs/NaEStLdb6Peu9/noldepLy
         UEO2OvL264NrgOsxdAkcu/rXYYC9kHJI2VxxE/B0xq3H4jvCfG5U2eQZmRLR3I14tg3/
         agVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819604; x=1795424404;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9zCEEgHyfXsOU4IbfkUeeAj9HdWSAkpM97GgxzjpQs=;
        b=xKW6HFFoZSY5YP+m/egadjpQUpfaO6X6obuKd9840vV+HnJE4orvA/Cox9bJott4XV
         Oxx0jNhn71nTlwMOSy3C4H4gQZtBS6P4NBcXFeZUHF1wBNNGRwvGI5RYGNIB6fU1JUo6
         k2O14rA8reBxqSt/qwJUlX1gxDeeRPYq4BR7HOkDjoHcZLjv/csif2SMqsXmAEotx+hx
         Vw0qjzCGd0EaXt/jShMzLxMCCinJCsYOeoFPCXxTQXGJbicPc0kDqetPfRMBMNvGIkqY
         hRCJ/04feek79lMaJ5iDY6jCCIIgMCZGdMJnBLwFM7qowwqRN+kYQO4hUzd105aZxIGz
         qGlQ==
X-Forwarded-Encrypted: i=1; AL+hErH6OWrK/dLti+gimmEjH2EL8X9oO6LfxE7uJ/VssQvkpvTmzyAt6JcXYnze8hlYcgFTl+nOgsd2dYiOlZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8SL763N2Zv65zMlmxmAW1u13KT4jTQep9a8GjMl96N/XhGHnZ
	1/UczvZ6bG9zJ+fdVAO640f0gUIYRjysi17N6jJNlOGW0Exdsu0u9wRM
X-Gm-Gg: AYBFou3kfc+bWxHZuCrDQ6poQSXFswWsvu19f8oFGnlvLEXKHFDvWFxj2KLRVLhMXty
	ya/b1GsE2ev3VP6fSwmS3RJHd6PCIbAU3aZePVSWG2duuYYRGzqPNVmfo9EtNDHBAYlHJF8Ekcf
	K19BuhLw1MlXinqFf4H3yw1NkRznhhI8FWLCehIi7dDFnB93B24T88GSVOD4ne9i/RD/VbNwRUL
	wFdE3x+dZK1NMNvm8VEXfGsZOQqzvW5hsSzlHt0NhCJ1FjggRh7cZzZIluqaw9m/dFFJgzMvfKB
	KYZ5cO4JAWqNjlBcj8IrWef4EtfBJwVaZV+j0yycDjOwnhIHha1ebjtqp/QAOY8qb8Y6YOND/gY
	ALMQcM7FNr+0knFmhTc3eaaxlSTccfAzGtVsGoNhc0is3LyGfkniSeo3EteWTBk8XOZeBt/xWRz
	0MfNyEd3OEuTK/I5GtQsB/OpQaZ7Vpm3V2v9q0+imDeWCipa7EydeXqoizUVcOmDbuI2OSnG5ZR
	1kBX3y3Lur4u6KTfGH08AvBnq1VllQlV0BZb4+Sp6srXlueqD71v9I05gsOPyEIVMpyrK/QEZcU
	yCmwLjp4HshdOq1rHi+maLm+RrdBas2xfrj2zlkJZaTGeTi2iBb7aPnnStw171MyEJj4MIv5/6R
	8psIheX3qHuA/qXJTlrfS8JFMYV4eDjLg4M4SbxwrUxRSZBszjKNUNCu0Y/2zzvf7YDRpBwoKat
	W79pF4rVIMclRk6LEyXrVejKrxErI94LNGJsU+OhRH1A2rBneovA==
X-Received: by 2002:a05:6808:3383:b0:564:3e9e:b498 with SMTP id 5614622812f47-56e65624042mr5371665b6e.22.1794819603048;
        Mon, 16 Nov 2026 01:00:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v6 0/3] net: phy: report ACx00 receive statistics
Date: Mon, 16 Nov 2026 01:59:56 -0700
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QzW7DIAwH8FepOI+NDwfoTnuPagcgTsO0kCrQK
 FWVdx/JNi3qpEhcjO2f/vKdJBwCJvJ6uJMBx5BCH0uhng7EtzaekYa61EQwoTgTQNPVdSFT6yf
 G6KW90ZRtTnTktDbSNFoDABpS9i8DNmFa7ROJmGnEKZP3705hPtDnhV5mnU1I3WCjb5ev3+mXz
 oa49NuQcj/c1pgjX8WfRNVOovJKLFmD4giqduztXMDPZ993a45R/EmF2pNEkaQ3VikApj1/lOR
 WOu5JkjLaOK+k0L5yCI8SbCQu9yQo0tEoZyxYbvS/TNVW2r1TVSSsDbe6qUBquZXmef4CKiQME
 SYCAAA=
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
X-Mailer: b4 0.17-dev

AC200 and AC300 count bytes in received frames including those with CRC
errors. Define the existing PHY rx_bytes statistic to include bytes in
frames with errors and use it to report this hardware total. The hardware
does not separately count damaged-frame lengths, so a successful-byte
count cannot be derived.

Report successful packets and CRC errors through the existing rx_packets
and rx_errors fields. Bracket the raw packet count with matching CRC
counts before subtracting; bytes and CRC errors can still advance when
sustained errors prevent a coherent packet sample.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v6:
- Define the existing rx_bytes field to include bytes in frames with
  errors, and use it instead of adding rx_bytes_total.
- Collect Andrew's Reviewed-by for the PHY group-name correction.
- Rebase onto current net-next.
- Link to v5: https://patch.msgid.link/20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com

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
      ethtool: include errored frames in PHY receive byte counts
      net: phy: acx00: report receive statistics

 Documentation/networking/ethtool-netlink.rst |   2 +-
 drivers/net/phy/xpowers/acx00.c              | 223 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |   2 +-
 3 files changed, 222 insertions(+), 5 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

