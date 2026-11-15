Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743759;
	b=QKcVGGq/GOBZc+m046oKn6baavwn+14APucpKD3tc0pCFkuye457rwKOjk/LLz6Mxsou
	 2ucBQj5qxCKi+38rOzkEeJgIdP2VUQJm/MVPIfVx6O8sg2Zm/RHKyl6zMNk5qaEoVwP0R
	 EulltgogonCDUe9hChRJOgieLXLBec1DZTPjIQ5l/m+3Ddz5elerYeOjjJORmkMx7aZFs
	 HH8lejmhDhQ5SRsQTkcQcqpW08JGXRMZIFEX57fCQ1oXML48oBgpw9dGrjuKzAt/qPuIr
	 +nJGfqV+iBkP+ANv1ZnRugyr9FLJBcTNAL6pM8/LZPtnDrHNi+FROXWgqon56ZFq7iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U4XOjwAQ2BOIbW/PJ0TA8j9BUAT0ghRUzuZuG7wBy1w=;
	b=o7JopuIzokFD7skKLxLZzsR5N+CKL7wp+1F+Qzywy0Hmgmcrcdy6TQePmtsvg1Y+kMpl
	 INV2icBqSj6dhTG9rWRcaXC8m7mjAhbWQDMQVM3yn7oKWoWQLOAQZtNjkR811KYF9w4MT
	 9eCDs81JYP0e/EURDznzsh1E4yK+41mWSSo0rVGzIJ7v5oKS3k1dYJKSul8cl9ohS4wBW
	 cl2H0iJcqFjSG1Wv9Ftl1fLfi7ZpW6cr9gBsCeSunwnHcFc65i6R/CCgrw+DQZjvTk53A
	 A3/Gce84zXPPcNMC7XPgsrItvrRKGiFyehRHkRFu29dbO1yZGYMY5R2J36w87F0zFKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1wXDAzh;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61740606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61740606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1wXDAzh
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987a2ba0cso13478145ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743758; x=1795348558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4XOjwAQ2BOIbW/PJ0TA8j9BUAT0ghRUzuZuG7wBy1w=;
        b=Z1wXDAzhjNVI10WIK7v/6AqSuIruRxpc0Sbim4L5OLsdEqHcPd2U7tyQu+itwpcOI8
         Fle9AwKV7de8cp725gHnsJkpkRWJmNiYhyBphFBjExB+GmIG0F/VVwBuClxlYvogXA3P
         HNYhNW59TFSoX/Kzf/90k9bTRK4teCIfcMgtPFaTD28u0jM4e9KS33O7wVFRSB9rtpml
         6VY10sdSCgnU/oXhSOn3vm/18C2C7Ma7k+kcRaEZzebYACJqza34wN8TJjzeeBYO4bpK
         QqqtOWGx1hq8tcP5/kefneB4iQfbH/4p537R8wf388nF3JIHF5DgYd0iJkaraCIYBEXH
         a9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743758; x=1795348558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4XOjwAQ2BOIbW/PJ0TA8j9BUAT0ghRUzuZuG7wBy1w=;
        b=Np3o496Wc8NxnrRIeS7XPsXbRJSWX4NQ0E0OvU5NMaCF82iFEzrFoDQK0gizERT1Ow
         5GctPdXUBtY4wNJ0jpLyc7ajXt+0Nd2+amIFriFVmO12xmZ7uyFSPb49v/cjZdNEnJNu
         NSf0IxStGWYV6jJDFUPsskvLanpg4AM/CFxGaV6gVsrRWSoidyFKGygZr8CzWD7McShG
         vTr3zUEXQSnHmuuSM/X2fnjH0miyN1q40Pi6yXnEsAgWOwlZTnwY+aKSV84USmK3OIFa
         hnL5nr5aApvJZKnFm4xzckpQZEkbTczbFkOCkzdn6rAOoYKCvGom3CGY5iB48mq5M/9m
         GYvA==
X-Forwarded-Encrypted: i=1; AL+hErH4fmEJiVAnr2lnuefCogG0sN9CbxCzlstVeeQNJ84KHbToXm70GrVaCUKlr5Sa+k6U05B+VRR3izUJaQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l+yvbX8OlirjKfCS4aIzG5yw+zMU6ntoddGd9X+UZ+W5m7fUb
	NNyTJhb1Ala90bmFlPv4CumjGIbGSRA2oIVHEXJwXrVPJTlEwNfhqgInYmaua+pDetY=
X-Gm-Gg: AYBFou3TlOchIF/mH/tGvWMEa9hdaETqPcR5A0X27PSAiGAFuV9ALhC84hQvGKtp3+j
	Jp3y3cGjwHenOtrEZUV0h4vP5XRaFiO5Xn590afz6DfGWmZW9NnYRyyWRcEpDdoUluSHkBBZeyN
	SIYWua6rWpBvC9S88oOQpgaFcPWD4Acu90vCSPru4mfkYRpMGEzdPe7/ymPRq6DurarecaKsjTj
	R5WDDMZoveHuwNPSh5JidAjkn1lB6JKLRAg0XIKIb3zTjkvsrY1xOPvDUiEUzl+3OcponuOCZZf
	FLRBLLSIglOK7humOLQe5OjlcydYXlACKWZvI2W/j95TWJkEB7Of4f4/aAOZQY/41HqwslfvtjD
	cIh/XANS6N+eyetdQqhnCPhPnqnz4+lQfdb0mMRsozLojAQSaM/eEIjryB/pLHpiBZC6MQKmTOQ
	WlErdD4C4Q7kGlpEwQ812HgRLw75qWdfYkxMiq03twGsJE95KytLMQVQQwn0OWrAgGn5odUq79D
	fytkyoztrL6PEvm5XZ3Wpzjfkc/Jwu7q5otsS85WljSlUK8PGfxnoGlmFZ11eGAoKyHqNOauugm
	GOWWnI39AneubWbhGN6hDOwZszlAcDKhNqnCTdUczueG3qEDowdIotODR7S6g4U1bQ/7+MGi0Oh
	0ubaOKtYpChJKa4H5f5nF8VbDPqIinhAqWxx3dYOMSs26BakXof2i1m14SGpg3JnX
X-Received: by 2002:a17:90a:e7d0:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3b1b0a1be73mr6848483a91.18.1794743757542;
        Sun, 15 Nov 2026 03:55:57 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:55:56 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 0/7] wifi: rtw88: extend 88xxA support
Date: Sun, 15 Nov 2026 19:43:26 +0800
Message-ID: <20261115114336.1739863-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series enables HT STBC transmission, VHT SU beamformed reception
and carrier-frequency-offset correction on supported 88xxA devices.

Tested on RTL8812AU:
TX went from 136.0 to 144.2.
RX went from 215.5 to 249.2.

Changelog v4:
- Restore "wifi: rtw88: correctly expose beamformee capabilities"
- Add a patch to skip the dynamic CSI rate on chips without a
  cfg_csi_rate op.
- Describe magic numbers
- Link to v3: https://lore.kernel.org/linux-wireless/20261112173246.3201729-1-hjf3108@gmail.com/

Changelog v3:
- Remove EDCCA commits since it causes problems in some situations
- Beamformee: gate on spatial streams instead of the RX antennas,
  in case an antenna is disabled
- Beamformee: writes RTL8814A use rtw_write32_mask() instead of
  an unaligned 16-bit write
- Beamformee: drop the chip ID from the debug message, style fixes
- CFO: add RTW_XCAP_MASK to phy.h
- CFO: use 0x20 as the RTL8814A crystal cap when the efuse is empty,
  following the vendor driver
- CFO: add comment on why min(...,2) is needed for rtl8814
- A-MPDU: set BIT(31) of REG_AMPDU_MAX_LENGTH, like the vendor driver
- A-MPDU: limit RTL8821A with IEEE80211_VHT_MAX_AMPDU_64K
- Link to v2: https://lore.kernel.org/linux-wireless/20261031070950.425176-1-hjf3108@gmail.com/

Changelog v2:
- Split correcting beamform caps into its own commit
- Adjust EDCCA threshold on scan to avoid high latency
- Link to v1: https://lore.kernel.org/linux-wireless/20261029055212.84711-1-hjf3108@gmail.com/

Ho Jie Feng (7):
  wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
  wifi: rtw88: skip the dynamic CSI rate without a cfg_csi_rate op
  wifi: rtw88: correctly expose beamformee capabilities
  wifi: rtw88: 88xxa: receive VHT SU beamformed transmissions
  wifi: rtw88: prepare frequency-offset correction for more chips
  wifi: rtw88: 88xxa: correct carrier-frequency offset
  wifi: rtw88: 8812a, 8821a: respect peer A-MPDU size limits

 drivers/net/wireless/realtek/rtw88/bf.h       |   7 +
 drivers/net/wireless/realtek/rtw88/main.c     |  17 ++-
 drivers/net/wireless/realtek/rtw88/phy.c      | 109 +++++++++++++++-
 drivers/net/wireless/realtek/rtw88/phy.h      |   8 ++
 drivers/net/wireless/realtek/rtw88/reg.h      |   1 +
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  17 ++-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c |  75 ++++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  16 ++-
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 100 +--------------
 drivers/net/wireless/realtek/rtw88/rtw8822c.h |   3 -
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 120 ++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |   3 +
 12 files changed, 353 insertions(+), 123 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.53.0

