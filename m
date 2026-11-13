Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590029;
	b=oNmZ7/eytgprMFypgcOfigc67h722v8dSmI+Q1kQDRBRp58k9srrHPLlmXLfAn6Va+Iv
	 hAFyO5iHfFgAhoQzSm7MP0yFZCNwEF5HWLMlB6fN47EzMiNysfsZQJ/pKP4jLgOspnr6x
	 Nsq/ALQysYqKvOP3HwYL16dvV2JVKqdlvUm40lk/Ah2MGxes7UeKs9SoBKHCOAyj/8Orn
	 SAXH/Gwu9Q89zt26s5rv8c8htV2Y8+wWVgD+3ljJ1KMyf58Ae6midMuyQM2yeAJo8cwF7
	 hLcZJufGJcChzGY8Fx619p3KFj/L5UB82OyaUneCHlpr/x7Utno8cey4Bn2RKKvF4bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8AJ7AIbn7+UX8TIEt4C6umThZ4gAFF8olo/5cp650i8=;
	b=T2iJ46gnVdVaRdrnWWlX9CMuw5Gv1O6qC5UWQYUreQJ8s1XLfX3cpzCh2jsLE8PRFd9E
	 4u1cG98MkY4RoBngoD0ImUy0AVtuHCRgOo9MfnWNq/QxjYQtcXEAciDpvE5Bll4+ZzzxG
	 ilQw8AeYiLY/WskGJU5Ww/FI5LBEFkEKo+pG2uta62N+DUkwjO/Q5vIlwz0brpN3LmQXz
	 6fZFqhQ1Ye2ORhcmqXLiVYZWmCtwNsZOaEqNWC6QviCFDPps0SIHiPbu0pgMYSW2T+UAb
	 2JG87Xvetl7txLculI3ihWnYaYGUe3xdkwn9K0jl67SyjIe4Rb/uT7rfkuS8M+4veFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5fGvEqH;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58760A3809
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A58760A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5fGvEqH
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53ec92375d2so1056471b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590028; x=1795194828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8AJ7AIbn7+UX8TIEt4C6umThZ4gAFF8olo/5cp650i8=;
        b=J5fGvEqHCeM3ThISXi2E6ikdnN8jyUfBcBJWUHw/UwenTJ77RX+M0VKWA7ej+7VCcC
         Z8CXWbchjrN/YQkbG+Ka1ukM+BzGWL+dCV825iv1KcOwCsp5DkG32Mw1C7OtvzzC8raV
         M8tBn+PNAdPv/5a9tv3PS4Ee+3eM22w2nM8mr2Cuyd2B+k1Ftkp8BM685RHpcJD5msWZ
         5SnnchAoZ06tOgo94UtE/+VR0LYqSONatG0waQgUxQ0/Zn8kyvkqK6jESmaUabFAueYT
         f/IJI0MFzaO1dI/ST4neS/CsbCxAnlwjcBJ9ZTcssa1orIMsMjmI0iplbZXPWUmePsNc
         9pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590028; x=1795194828;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8AJ7AIbn7+UX8TIEt4C6umThZ4gAFF8olo/5cp650i8=;
        b=T/X3Osnptk3loTl5aWDGYZ5MNFAscOteAUjTvCADZU8AXa6vMiwydCQFx0UwxXE4fP
         ft8Gt0B6y4kxxP8nxP0oMuHcjwhcxlLcjaopEmnQHMYfcSMK6CQOFFL9xlLbA6hFHejF
         gZEz/JjrHfryIjg0f4H4837czK+qqtrIAwjke7Rl9+G2DrfnwkWv7AwEU+zfBpCyh1WD
         f5yE3LeTZ4sWiqutzOjS69WXcJ0SRmkCFWGIsEh7BbyEnwlwqbzgfLgI3qFjoyn2xR1H
         cvn+p5jCAwvZT0mZSYyghla4YCB0QtICKXNgHrlsmznPV9w3honArD3WaA7xrP06MGDe
         fVlQ==
X-Forwarded-Encrypted: i=1; AL+hErFDQTcd//gIEN4uogUTRnse4axOKarvzm17OuEZ6Qmy436tQgjCTDEMscwFuOZzHaMHN0c+M0GJwcVhNLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uQ0k1UfDsfAekLS1hlJM9Rzv26b0qAiEV3sp9BtjQ3VuJ8Ik3
	c9KdJW/+9/slCgdPe3b53enGTxAgRjzjT7OlXdunW/snugMZ9yq2k2hu
X-Gm-Gg: AYBFou2Fp2z54sE5b8ykbdXsGU1RVU5Cc2KWwOZINRnnwXVBc87HXVO1SxOLUit9OVF
	6jkzzOhkz/nqIWeVYfuGZcJw4z+bHqYBiqT3pfkd8mY6lF1kGQssG6LAPIZ+phTYjtzZd2bfEJY
	K9G7o4tgQRQ7NRw+6ZqZVaR7zUSCkatBYV+RZK1cPTfkJK/hIYhlwRDhsYlouXB8TX+XFLDn0X8
	xG/AQB+Vuo2u/JLU7C56eHxISOMAteS8kAlz9Vy8g1V0nQoTr2dYWAi/IGHXNnCEaDSLKSF5qfd
	y7d9QKv4MNB0VXwrSL59EQBV/G9SR8X3QlRZaxktAwav7D00/S7Gp6gI6Q+1nC0fqXLORFP+Jcp
	RglaExe7jVmoAsGqO4IAZAmCvebf9rsr54b3aAXaqoQP7J4TDNVqWzKxoafIAkm5T3vscosv0Sf
	g13+oC/HdirGeZkTEy8oQVPq/Y4NsMUt1yvO1oTuMooCzE4tXj5qHdCk8+wWMBFd9kAh2v/ij9C
	gV4xXgN/Oxyd7AamLxfF8RO47FtGM4/9wnvnJK37ZFwDfA+ZWAunN1dCPeY6LYDQ1UU9YkYm/Iv
	VfUA48P3c/L/bM/y4TSZ6zPL1eLQj72Ml7OkLBlB+V+RrUqxvTfwAuEhbVEi4emiUr5Yim78VKZ
	5G8mlBvlIE8toxDWy8LXdfiKNyyi5zts+CXGbUbgil4P/KTMuDw8Pg+PDzT9w1n0TE2Zpa3qfqg
	3NTfmjdLGQyr5LMcR9ppcx9pfb0QnODVp+FMILp0vF4eWGatA6Fo3I
X-Received: by 2002:a05:6808:244d:b0:564:5fe0:dd76 with SMTP id 5614622812f47-56e63793a9fmr2595149b6e.18.1794590027740;
        Fri, 13 Nov 2026 09:13:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm2565805b6e.9.2026.11.13.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v4 0/3] ethtool: expose PHY receive totals
Date: Fri, 13 Nov 2026 10:12:04 -0700
Message-Id: <20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OS26DMBAG4KtEXndSPyaGdNV7VFnYZgiuiolsF
 xFF3D2GtGrUBdJs5vXpv7FE0VNib7sbizT65IdQGnzZMdeZcCbwTemZ5FILLhHSt+19BuMmzuH
 SXSFlkxOMAppa1W1VISLVrPxfIrV+Wu0PFihDoCmz02NTmE9yeaGXW2sSgY0muG4Z/V6/9saHZ
 d/5lId4XWOOYhV/Eh02EpUqsVSDWhDqxvL3cwG/9m7o1xyj/JMKtSXJIilXG60ReeXEf0k9S8c
 tSQGH1jqtZOUOlvBZmuf5Dk7VdmuSAQAA
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
 James Hilliard <james.hilliard1@gmail.com>, stable+noautosel@kernel.org
X-Mailer: b4 0.15.2

Some PHYs count received frames and bytes including errored traffic. Add
explicit receive-total counters to the generic PHY statistics interface
alongside its counters for successfully received traffic.

Use the new counters to expose ACx00 receive statistics through the phydev
group. Accumulate sampled deltas in 64-bit software totals, retain those
totals across reset and power transitions, and return cached snapshots to
ethtool. Establish new baselines after reset, resume or sampling gaps that
could hide a complete counter cycle.

Convert DP83TG720's existing RX packet statistic to the receive-total
counter, matching its documented inclusion of packets with errors.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
To: Jakub Kicinski <kuba@kernel.org>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (3):
      ethtool: add PHY receive frame and byte totals
      net: phy: acx00: report receive statistics
      net: phy: dp83tg720: report inclusive RX packet totals

 Documentation/networking/ethtool-netlink.rst |  16 ++-
 drivers/net/phy/dp83tg720.c                  |   2 +-
 drivers/net/phy/xpowers/acx00.c              | 184 ++++++++++++++++++++++++++-
 include/linux/ethtool.h                      |  10 +-
 include/uapi/linux/ethtool_netlink.h         |   2 +
 net/ethtool/stats.c                          |   8 +-
 6 files changed, 215 insertions(+), 7 deletions(-)
---
base-commit: 573af801552999954caa8347e4490b04cf4763f0
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

