Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506220;
	b=KgQGrB+VHjDvmeWrqo5NoiVVi0mtpWCcrFDLwR/uk+TOqFs1HrfrOcYAUy0EhQ1+egdM
	 YdP/MrO3NsTNuBFxaNwUkuRXMrU4kZkTYRBVJKaZWHAWx9KWdIYet4BRdKj/i8N0HDFyj
	 cqK8z0EUN1xOaARGQibEe91BxHH3oDeJD5W/KY260suyXlCrqLuLIWoRbXhSCoQH19R7e
	 MkodzRt01WB6/bVCLPTO9D5cVcNXU3nF57CdmlGLuP+n9Qw34XSN3aacOytAG9vm4y8DK
	 lhzvEDQ3+5REezzULHO/W+DOxWMJWfp2uTpdKpPrFArZfYr0xUGGKlwh3nswDUML8bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TETUUjEDSYeWqOu+yo6YINSK0fK0s83/dBCWh+KW/c8=;
	b=dOGgoGHT4M3PvdqSl1q6XiMM4TKksUSWhB8swhfor2IBWivMXmgbI/jK5xCEZHIPdKkK
	 9o8XgfwfmsAZNgxOvvnHkN1KZgUQa8Q+3GCsRBPPWk+T7PvbrwVaW1RswSgiojn5+JNjG
	 YgJG8Gv35K4Nn+fHjp4KCOSr15jR5ObLmIvdK9hVpuqN5CJB5WguqiMSsgzwivLIBreTo
	 eLK7wGldFSfdnRu+CO8w7tcepOIyjVYuty2BJqA29TOQUkhOKJSYbt6MlBgKl350TQTev
	 QLWO8+2fGNvvG0L24zN0jDArhJLtfbzqM6Yd3OGTcCwt7K3W2Ya5OjYyn1gXOtV1Euw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X58pAIXZ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC15606A8AE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC15606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X58pAIXZ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so664495e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506219; x=1795111019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TETUUjEDSYeWqOu+yo6YINSK0fK0s83/dBCWh+KW/c8=;
        b=X58pAIXZp3A7bdjGwOrM+Ngedur5afq2frk7IlGbTgZ8tgmLg9o36a03EIbw3GY+TM
         Lal6RcDLKRr39HT4BdIZ52G20of6KFuypquEX3fptvLqO99EpVbrhTS3Xy8OMy4PUi7y
         l2Y8+KSFLrgzbgXjlbz8yBLzvpcCLCfmL0pV7AAVf9vo0YOfy0yyB5CO05ikNRmD+G6t
         Hx+ebJk3dFORTJpNCoNX//bNUWnM7Yjnn5Zn7aubdxecCHfzX2IPYmZ3bcEWLw3qIePM
         ZwcPWO/j2CCnrsgmRVDqbbHd87OT20NwmEEAkBJMwu1Go8JZEPzXNYigp8Vwx/huqZWC
         q+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506219; x=1795111019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TETUUjEDSYeWqOu+yo6YINSK0fK0s83/dBCWh+KW/c8=;
        b=SZUQx9RFxnvDkLdBeAFJyxEbK91lGqUUr4XpiuzIbSpH63zDUFR2PdZdYxgQs2vHNf
         pEcNxR2P9ssOdsiBgxGaa72GkBNqsNoeaRufJcUn/MOk90oY3la+fqO55i6ZFAcuZ5TC
         2nqUHPLi1RfhlD2NVV1NTMF4IRSHgdo2/fKPtSuViCZul2+WJbDSzJoCe/HgpUvG0OHW
         i/lAKVK/61HNs2k/l8I2CsRirdKOfUciwI52qBBrQIGyxs01ff/D+CaxP3i8u0Sjf+yQ
         y1kUFiOL/B67QltSG0p2OGEVB5R07eQMVFQW48uUikLEYbIqC8N77gCCdAS03Srs3abl
         cTLw==
X-Forwarded-Encrypted: i=1; AL+hErGXw0ydrrg7aaBbzkIMiz6Dpru/dTkYW0JfY52UAQmqo+J2GWdzmGQDjD2Bbp1l+5mOhunShhDxjkqUCFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oznH9vEsy4ogHFoqbLCRL544WK87PfGnhLB7MxOJ0vsP9cmx+
	8a/HG/XWvv3+fKPso5LI22WfstBDf31ZPNOktCgd9hzqyCzlOMf9ukrR
X-Gm-Gg: AYBFou3lzkUCCXuQnJ1nyD+cV+FFiNFZv9eexMs1GwAMgvRag3/8Yr+ZBi0ZriKQkTT
	F0I1480xuf4ItxhSMuOjt0HakN7Cz9P6WmnLD56vVZFezMTKxFftIVKZ5yXxaXp+0j0MiymNxiI
	iLquLQmm1haNcvPgMXhTq8cNr8QBDkUJsBdVCEr6pADvNgWBkKYaTMITdPAmWiFPInaxe1nIecj
	dK3vQzxxejzyc3BMX2k0rVblZ2DLjxkHkm/dvPxUjJiFaRfyV2GUABzh1JU/KXhRva3nPS3pGaM
	eyoIjB4jzV54pGlOMxe2j0BLxe5aaR05MF/HFcwKOssurUK0knUvvun1NmyjXw2utGmsb4+dVt5
	38+y/aaXXFOJEcxgheN9T6r+pqXArRkLwaxUIDP8kaZ/2gY0fyQb7WMyCuNAip6/u1OBjBWUruW
	bwDVse7YaQNqSpfU6PJnQoUWpbN8o0GwEI7fCT09pXTeBIBw+e4Hl7HpwAKgGSwYkn5zNGF0+E1
	gRgxKaWd85yXCr3b3O03vGFi7IBwnZIfzKKCES5x827HLuhqINSK67MGpHQ3Nshir75J2+0Is2P
	BUqJ0bltwDw9gfbSxYBp/2HDXM9/jCs65dttYbJmi9afMIUpXSTPGkTsSUWYwGCh8n/x0L44lgT
	90WdIyWC7wnLbtUd27z1dVDvBtSt7PP3IN7HNNWAL4XHu6pA/DaFQm4jlmStFy6w+p+v9+8tvzA
	uUepZ8taJ+50t0aPl5aQCEZyb6Tb0T7IUzMtp4di+nxA==
X-Received: by 2002:a05:600c:1c25:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ba093a9f02mr139408685e9.25.1794506218938;
        Thu, 12 Nov 2026 09:56:58 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb527c755esm31491425e9.4.2026.11.12.09.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:58 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 0/4] wifi: b43: AC-PHY support (series 4/4)
Date: Thu, 12 Nov 2026 18:56:52 +0100
Message-ID: <20261112175656.40686-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Radio 2069 and the AC PHY: tables, 2.4 GHz and 5 GHz channel switching
(5 GHz in 80 MHz mode), HT and VHT capabilities, and the removal of
"depends on BROKEN". Based on series 3/4.

With the four series b43 brings up a BCM4360 on 2.4 GHz and 5 GHz, with HT
at 20 MHz on 2.4 GHz and VHT at 80 MHz on 5 GHz (40 MHz is untested), two
streams and A-MPDU.

Each patch compiles on its own (kernel 7.2.10 headers). The four series
together were run on a MacBookAir6,1 (14e4:43a0, BCM4360, core revision 42,
microcode 832.127, 2 of 3 chains wired) on top of v7.3-rc5's b43. The AC PHY
only comes with series 4, so the earlier series cannot be exercised on this
hardware alone. Association and traffic with WPA2 (software
crypto) on 2.4 GHz (HT, about 54-63 Mbit/s) and on 5 GHz (VHT, 80 MHz block,
two streams, 40-70 Mbit/s at -78 dBm), no errors in the log. Not tested:
suspend/resume with this exact series, other boards. Not done: TX
calibration, hardware crypto, power save.

Known issues, which a review would ask to fix (pointed out by Alessio
Ferri): the number of AC cores is forced to 2 on the MacBook boards
(0x117, 0x137) and some init loops assume 2 cores, which is wrong for
3-chain boards; and SROM revision 11 values are read at fixed word
offsets instead of from parsed SPROM fields (the parsing is in his bcma
series, not merged yet).

Where the values come from: the register sequences and table contents were
taken from Broadcom's wl driver running on this MacBook, by tracing its
register accesses (bpftrace on wl's MMIO accessors), and reduced to what
the hardware needs. Parts come from Alessio Ferri's AC-PHY work (the PHY
init sequence, the 40 and 80 MHz coefficient tables, a TX gain table, the
Farrow resampler formula, the VHT fields of the TX descriptor, register
and table names), and some formats follow brcmsmac.
The result was tested on the hardware as described below.

Andreas Wendleder (4):
  wifi: b43: radio 2069 and AC-PHY tables
  wifi: b43: AC-PHY init and 2.4 GHz channel switching
  wifi: b43: 5 GHz, 80 MHz and VHT for the AC PHY
  wifi: b43: enable the AC-PHY support

 drivers/net/wireless/broadcom/b43/Kconfig     |    4 +-
 drivers/net/wireless/broadcom/b43/Makefile    |    2 +-
 drivers/net/wireless/broadcom/b43/main.c      |   69 +-
 drivers/net/wireless/broadcom/b43/phy_ac.c    | 1263 +++++++++++++++-
 drivers/net/wireless/broadcom/b43/phy_ac.h    |    4 +
 .../net/wireless/broadcom/b43/phy_ac_farrow.h |  260 ++++
 .../net/wireless/broadcom/b43/phy_common.c    |   25 +-
 .../net/wireless/broadcom/b43/radio_2069.c    |  862 +++++++++++
 .../net/wireless/broadcom/b43/radio_2069.h    |   19 +
 .../net/wireless/broadcom/b43/tables_phy_ac.c | 1273 +++++++++++++++++
 .../net/wireless/broadcom/b43/tables_phy_ac.h |   31 +
 11 files changed, 3801 insertions(+), 11 deletions(-)
 create mode 100644 drivers/net/wireless/broadcom/b43/phy_ac_farrow.h
 create mode 100644 drivers/net/wireless/broadcom/b43/radio_2069.c
 create mode 100644 drivers/net/wireless/broadcom/b43/radio_2069.h
 create mode 100644 drivers/net/wireless/broadcom/b43/tables_phy_ac.c
 create mode 100644 drivers/net/wireless/broadcom/b43/tables_phy_ac.h

