Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19C4519A0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556517; cv=none; b=N3oHRi/DrA6x5r+R5tVkdMUiF4dgHI+blxQyEjYHrjrT4iYtOI74O4DrHeNS21cuWykUeQmHQ0x2ekOPLjEcN+8FVMNlcIcjm0yf465Sa0950sCQRyLZlc5Qx2dgMG5xWPeDPn8xnObsxEk3kAPz5vmbr47XmQe0mUCWT7G7m+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556517; c=relaxed/simple;
	bh=M51Pb28xTuQKlfy45if+HMsxPmrZWTqvJOnq+kRZwfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DB0CvqCICCYBDm4RRZEKMuqPxLMMA/5Hua0/33XDICH9bg/aY4qYCLh3QwBFBGlVaovnwnbwblO5Lh7FI1OG58guV9T+LDVwTae9i6TVDqgsqiTl80rt1/jrJwJyIi8bnm43vmGz9XqHG+jmW2tN8IRD2JBmPaKcEIUxasOd20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=MSTQS0Jm; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="MSTQS0Jm"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-53524092d9cso52857971cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791556514; x=1792161314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsWnTIlvL/h4GuHBlTNOAc+vTPtrPntNGG2ofKxiW1U=;
        b=MSTQS0Jmpdxum5sJQueGPAEtCvPnorFffo0wIUjpQOwfTRyU+8mC4adUJSui5Ar4pl
         gJgeiea5igsWD5RfRxN6jW620F3az755tgolrp4Mj7n+sEdDb+P/9aJWOgZAK58obA+v
         5gNZXoaHZzpLtx4+ohKeWuaI+GgIeRLBWDJWgfZSxUcuy+VY5ewCDNxB4TGpqIu+TrqH
         cJNxPZKJ3JwXqyswiShMD8OfUu/VOjz2TJeeDNyzuzsz9udhtYuLBKlNkPklSzYacJyI
         7iR9czFg4MTamQfoI4J0imKomUeDXDSLibxiRKOkmjpK/TlciC8jv2XjkDrPfflkWbc/
         M0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556514; x=1792161314;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NsWnTIlvL/h4GuHBlTNOAc+vTPtrPntNGG2ofKxiW1U=;
        b=WT7MZAx4FdsV7tzreXqsle/vsNdVKru5B0TcFBkv0fpYWtYbutC0ogLLlZE40vLPTN
         /lCF7snzbARtltWGzGoM9qOIHw1oJuEaUjWuQcnQsBbS+T8X+QKtY5HUVeCW68I9xBkT
         gyNUndSg9Wr9SBfXTkGVCdvGJLdVAeNMqmEK8O/ukkR28FMD7vhpZFUhVeM19cOxwlsY
         UoWWDugN0clu0pYyq9IB9LMJ9VkEqYQBBfvrKCdWjyCEq8TaTqSVNj+f1lJiiohHovLa
         V6k0/4ZoqkvnXyREWcQ4ttWH8fp7QGgZEZmuONYpGBu5bW2DJqFHp3UCGoM6Eyb3Z+Wm
         ONWQ==
X-Forwarded-Encrypted: i=1; AKwUvByJu1WX8F0u9naqIw6x2Yjg0tKEuB6t7DMJAo6NY8LbVZhLGgnmqqIDp37MA1MiWWaeyDuwSNQiE0337Ds=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYq/uvdWXhL9gwnXI/i7EMN/6DZO6Xu6pztx58lARYESZrZKAX
	az+++rm7FcOkt1zAbuWqPWJVj0BUO94jFl1vBt6X7ZyP+RdocPrIQ5M2n0IRVYNnzQ==
X-Gm-Gg: AYBFou2Zq1Vg2T27f7eUE21WkRo9+U9bLszsve1h6E+1Uhf2HWqLfcLRFTIJ3w/pa+3
	PWl4tnefFcCcVAAMeVCkw9I83g44TSxhoNMON8kZirDQHGaqSDr4qqnIrjJHa2u4IH0imObLoyj
	5L3CrDSIdkDHYJEQAytqPeDKZUgpUrk+A5nfsN+lu2D/I4DFv/Pg+b0XhpqbkjXNjOQJu3bOLvS
	di4+IvrKg5+ucXt5AEdQVqbaphwoSUEuMsuw387ntzQp8/ZPyZ9rCKxkvPJ/OA/JfnHQItbS2G+
	L3wLN6ugzPV8itBkN+1O6OMGo+4aVrgkG3zwn6lldKiyeWh0jA53118ZnhH/g2adI5NQDTrwy5l
	HrjFrk/Sx1sxRgRH5bUUd0lqlgqNewFXWr14ymDoRF09hPlu+fvfNxeXy0aL5D5pljZCffyZ9bC
	mFw7tX29D3flIT8hfUwvyhjFXq0ct00zpMrYQRsSOXnIfX8xbbaVxrAwqOfzaL
X-Received: by 2002:a05:6214:411e:b0:913:ffb2:e8d9 with SMTP id 6a1803df08f44-91b557bcb73mr32107296d6.40.1791556514366;
        Fri, 09 Oct 2026 07:35:14 -0700 (PDT)
Received: from cantal.lan ([58.136.72.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501751dsm19769456d6.17.2026.10.09.07.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:35:13 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/5] net: mdio: add timestamped MDIO writes for PHY gettimex64
Date: Fri,  9 Oct 2026 21:35:01 +0700
Message-ID: <20261009143506.2507607-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PTP_SYS_OFFSET_EXTENDED uses gettimex64 to bracket each PHC read with
system clock reads. Some PHYs have a PTP hardware clock (PHC) that is
read over MDIO and sometimes multiple MDIO transfers are needed to read
the clock. This leads to brackets in the tens of microseconds.
Applications that synchronize the system clock from the PHC typically
use the midpoint of the bracket as the system time of the PHC reading.
With multiple transfers, the midpoint of the bracket is typically far
from the time when the PHC reading actually occurred.

For example, using PTP_SYS_OFFSET_EXTENDED on the Raspberry Pi CM5 to
synchronize the system clock from the BCM54210PE PHY PHC leads to the
system clock being 32 µs ahead of the PHC. On the CM4, it is about 7 µs.
(The difference is because the MDIO clock frequency is higher on the
CM4: 10 MHz as opposed to 2.08 MHz on the CM5.) The brackets are about
74 µs on the CM5 and 42 µs on the CM4. In comparison, the MAC PHC
on the CM5 has brackets of about 1 µs. See below for measurement
process.

This series introduces a new MDIO operation that allows PHY drivers to
ask MDIO bus drivers to compute a bracket for the completion of an MDIO
write transfer. It then makes bcm-phy-ptp use this operation, and
implements it for both the macb and UniMAC drivers. A bus driver
computes a bracket for completion of a transfer by shifting the bracket
for the start of the MDIO transfer by bounds on its duration.

The effect of this series is to reduce PTP_SYS_OFFSET_EXTENDED brackets
from 74 µs to about 1.3 µs on the CM5, and from 42 µs to about 0.9 µs on
the CM4. The synchronization error drops from 32 µs and 7 µs to tenths
of microseconds, below the level that can be reliably measured with the
methods below.

Note that SPI introduced a similar facility to allow a device driver to
obtain timestamp bounds from the bus controller in commit 79591b7db21d
("spi: Add a PTP system timestamp to the transfer structure"). This
series implements the operation for only one PHY driver. But I surveyed
other PHY drivers and identified at least two for which this operation
could be implemented: micrel (specifically LAN8814) and dp83640,
although they would need updating to use gettimex64 first.

The system clock synchronization accuracy can be measured on the CM5 by
making use of its second PHC. /dev/ptp0 is the BCM54210PE PHC; /dev/ptp1
is the macb MAC PHC. PTP_SYS_OFFSET_EXTENDED brackets with macb are
about 1 µs after upstream commit 9ca4ba242591 ("net: macb: fix ordering
around PTP timestamp read"). So we can use the following measurement
approach: select /dev/ptp1 as the PHC for packet timestamping and then
synchronize it to a PTP grandmaster; synchronize /dev/ptp0 to a PPS from
a GPS using ts2phc or satpulse; synchronize the system clock from
/dev/ptp1 using phc2sys or chrony; then measure the offset between the
system clock and the result of PTP_SYS_OFFSET_EXTENDED.

An alternative way to check, which does not require a PTP grandmaster,
is to connect the same PPS signal to both the GPIO PPS pin (header pin
12) and to SYNC_OUT. Then have an NTP server discipline the system clock
using the GPS PPS signal, and as before measure the offset between the
system clock and the result of PTP_SYS_OFFSET_EXTENDED. But kernel PPS
has a significant bias (of the order of 10 µs). However, I have
developed a tool called ppsbias (https://github.com/jclark/ppsbias) to
measure this, which works by polling GPIO memory. If you configure the
NTP server with the offset from ppsbias, then you can get an estimate
that is accurate to within about 1 µs. The results from ppsbias are
consistent with results from using PTP with MAC PHC. On a CM4, this is
the only method available, since /dev/ptp1 is not available.

James Clark (5):
  net: mdio: add timestamped write operation
  net: phy: broadcom: use timestamped MDIO writes in gettimex64
  ptp: add functions to adjust system timestamps
  net: macb: implement timestamped MDIO writes
  net: mdio: bcm-unimac: implement timestamped MDIO writes

 drivers/net/ethernet/cadence/macb.h      |   1 +
 drivers/net/ethernet/cadence/macb_main.c |  95 ++++++++++++++++++--
 drivers/net/mdio/mdio-bcm-unimac.c       | 105 ++++++++++++++++++++++-
 drivers/net/mdio/mdio-mux.c              |  27 ++++++
 drivers/net/phy/bcm-phy-lib.c            |  25 ++++++
 drivers/net/phy/bcm-phy-lib.h            |   7 ++
 drivers/net/phy/bcm-phy-ptp.c            |  27 ++++--
 drivers/net/phy/mdio_bus.c               | 100 +++++++++++++++++++++
 include/linux/mdio.h                     |   4 +
 include/linux/phy.h                      |  37 ++++++++
 include/linux/ptp_clock_kernel.h         |  48 +++++++++++
 11 files changed, 459 insertions(+), 17 deletions(-)


base-commit: 45ad84d2800e4a092fb8d96006a533b2d0ab13f6
-- 
2.56.0

