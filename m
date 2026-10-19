Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437106;
	b=gFMiuxyE7VHNPWwIkjUHVAV2L6yr1MDcBQ6ck298iFNADu1nUOCU5RKlY0LiCuKLXTOb
	 +LYepdNJmG22A83kMv0e2d25IKpB3YknfVkaHlY6fPvg64NVwibTGdyVmSsvHtSRvpkDI
	 6pmY6CW2+hZeoByC57LqilKptCVxNNf3vrRCMnzFG64doK9uo6DRDc9yO7SgCdiVUcK5P
	 dxByoUi0Kky9ZlWAEvA48l23IGTMsgrdZ5bFq6JiI+Bzo+ccwmwViyEDqxcNwc/8KOsZ0
	 3qFsQTfb6YKzYHjQZNp6qYzGQD58bHDcRsgGJZwkMzDCfmYK6RwyeEe6QlMI7+lNbkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bfu/wzBZOsGQROFqB89zmnlzWOzuKkO4kCy6zSciy6s=;
	b=egPEMRfIcdeQKkjHUYVeOLM0J7MMVBGzkONrqvn4R6BPcv1vbOJgMQ9ENlp98xRJELbI
	 8UDPkRji43E2zXhSo2mPoRzY5YeqRGMb2f0//A7KTIYS9ysTcEs5wOIQ+eAox2Yg/25Y2
	 ofZLbyY7jGyooDj4/ofBFqJEvG/FyIYfn11ICjPxYjIRaDv1JXeqFFt1oo429qZZbt0rV
	 z1114nqCzSJxN97nBcf3itot1SEnzLn/VcJs8IJ4Ad2KFCM5rTrNG5UQkhjJRO4bc4vBM
	 OA2Kxq3EZU82rBPqrTEE8EvvosZidnVAleO6r+X21LGF2r9Ko2geuBpHeD9ZIljKlFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XpDAIt6e;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E385606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E385606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XpDAIt6e
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1230251f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792437103; x=1793041903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfu/wzBZOsGQROFqB89zmnlzWOzuKkO4kCy6zSciy6s=;
        b=XpDAIt6eUfJWGLow8UDURl/6Vo2Cj3WZD4dJyjI6jcLAY2cV0oAkJoN3+5XBj9gNX1
         bvhVIG6VCbvbxn0F+dn0iM4i6+Z+++ACygE+HDoruySjNvgLSbwvda/qkoA4zalO/EjU
         cYrR9/MgMPbJpii+jtpOxmirXSZ0F9fJmiA4i87+FLWHUteIQ5KSn0FZSXwDGuh8+9wJ
         639xTApG7UnoshmRPEgZ0PlwdmMliDp8bOZL7XQ/KbbIgCJg/ixhB4TRfC1RWsaJ6L4D
         c0AEdFXDYAIZ0Emz8O+KX6ycttalJ8+/yBPXLw7VNj8OlboIyRKI1dtWV74masGXelMF
         q4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437103; x=1793041903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfu/wzBZOsGQROFqB89zmnlzWOzuKkO4kCy6zSciy6s=;
        b=1j/M8C77Kj6DImpP5DSOpkc1dH9gO3wRf18UFPGNUruvUnv6WKnrS0acRWBogrBDZR
         roYzNmUOs303x6Rl5quu0wTEQqBNy8pIPEzNVstuoDLF3/Qy9IjvUNfYPotxNWkCWD19
         Jlliexff3YhhlbOcA8XcHjBH+9n0UvPx27vmy2aoSnPHRsfe2AaGjJAbOtKD8t6PuH4o
         4hXqPOTQDcedxp4rzi7MSmcYABFgi57LrkGu8O9YX8LjAxi8CATLXTmk6B28LmsPo/kV
         lxeNgRaP6CsQttBO3UVAn7aHefpd62VWh4OAPIpuAdPubCo1nqfhm2oNC0PYaFoFdmnp
         JFSw==
X-Forwarded-Encrypted: i=1; AKwUvBy2FAM+OEYO4CyCM5hT0mSUsfgUov54i8y5xF13HVGR7sEy+c6Zy31nEwn4lIkgM4bsfYNrD1JVXwisUnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQJc7Zqjo+itM+HSwzK+1djUc2f3x01fFooOviVnyX/Qsdsrxl
	vIvPSDOf/ETOrl4Vih7iMvNvZzLvDRtZekZf2mlBn6WUikInKfuaFHAq
X-Gm-Gg: AYBFou2Zyqdt//F23bAmWPwLyFjDiyYmm+761VTeoNW3rdrQa39F5GQDLMrDksBYd2O
	qcpkP8YzBr6F1RKxfTJlDs7Whjw97+1U39UlFb8EsLp7JMl9Z7Ey8SCoTqMB3vZtnapZuo6pvk8
	3yzwh/nDW9DQaJhlzyz3EWinSnkAckF3pL7jvsdCyqUVK13WzFvilrhLZGhLsdH1WulOYyJ7aOm
	5I7pgBRtPe1mi+3bk+S7HFu21kxckXH/NnFr2kznmw/BBBdYIDrkrWnqKnbejPj2y1ok81Jc0wu
	hg569AdNTr4dcyiI36ZO6ICMwAmgJh9ENT0L8uRakz2MFCfcS97pOHeL+RAEBtP/8h1SiBVDbpj
	jID22bci/LtBhP22MjpIouYXeHWlfTWZRe8Ruwns5lzpd0YCu6FasnpLVY7er22KFMXt/5GL9up
	Q/hZPV2emHrAsbDdIogQwRO1HphZAfbieKLIyubTI4XjkRX8seoPSR6CS2NPk8ZWNCWdcfrls0Y
	E0ZUPAIuwiifWG4tdLq
X-Received: by 2002:adf:e19a:0:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e07fa6ffamr18010548f8f.54.1792437103154;
        Mon, 19 Oct 2026 12:11:43 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:cd2:abb8:fed9:8342:c367:f022])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c89sm804977f8f.32.2026.10.19.12.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:11:42 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: dsa: qca8k: report port statistics from the MIB
Date: Mon, 19 Oct 2026 21:11:35 +0200
Message-ID: <20261019191137.307514-1-kuncy7@gmail.com>
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

qca8k has no .get_stats64, so a user port's netdev counts only what
crosses the CPU port; traffic the switch forwards in hardware never
shows up. Patch 2 reports the port counters from the switch MIB through
a delayed work, as ar9331 and rtl8365mb do. Patch 1 makes register
access safe for such a reader outside rtnl first.

Changes in v2:
- patch 1 is new: the regmap was created without locking while it
  formats register and value in its shared work_buf, and an autocast
  and qca8k_conduit_change() took the MIB and management mutexes in
  opposite orders (netdev AI review)
- read the MIB with one autocast request for all ports when the
  management path is up, register reads only as the fallback, only for
  ports with link (Christian)
- index ar8327_mib[] by an enum instead of a second table of offsets,
  share the register reads with qca8k_get_ethtool_stats() (Christian)
- MIB instead of STATS in the names, interval define in qca8k.h, one
  spinlock for the cached counters (Christian)
- stop the work on shutdown and suspend, init it in probe; keep the
  user port's tstats if the MIB did not come up; read the high word of
  a 64-bit counter around the low one and drop a 64-bit sample that
  goes backwards; take the FCS off the byte counters (netdev AI review)

On the FCS: on the CPU port of the B3000, with an 802.1Q tag on the
link, the maximum-size frames (1518 bytes without the FCS) land in
RxMaxByte, so the size buckets count the FCS; the CPU port's
RxGoodByte also matches the conduit GMAC's MMC octet counter byte for
byte. Please correct me if the byte counters are documented otherwise.

Tested on a GL-B3000 (QCA8337, CPU port 0), three 15 s uploads over the
WAN port per case: with register reads the wan netdev's TX bytes were
TxByte less 4 bytes per frame within 0.004%; with the qca tagger, where
every read is an autocast, the counters followed TxByte within 0.002%
(measured before the FCS change). With lockdep, a tagger change and
three conduit down/up cycles with the autocast work running and
ethtool -S in a loop gave no report.

v1: https://lore.kernel.org/netdev/20261018153658.209999-1-kuncy7@gmail.com/

Stanislaw Pal (2):
  net: dsa: qca8k: serialize register access
  net: dsa: qca8k: report port statistics from the MIB

 drivers/net/dsa/qca/qca8k-8xxx.c   | 194 ++++++++++++++++++++++++++---
 drivers/net/dsa/qca/qca8k-common.c | 137 ++++++++++++--------
 drivers/net/dsa/qca/qca8k.h        |  72 ++++++++++-
 3 files changed, 332 insertions(+), 71 deletions(-)


base-commit: d1241cdbbcf7bfac3e53482b2054504628f9f047
-- 
2.43.0

