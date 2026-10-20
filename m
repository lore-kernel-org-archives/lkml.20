Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455550;
	b=qEv9ocB9anojsAeOM9A2ej/91yFBroRp0RsXcXsJgk5k9Q5Ud3roVH4z+AjRpjyo+b1A
	 h/8+EqAJL2E82x3en8seXV7pG/viu0wPQCY7e4lKqF0Os6AxMYYfws68Zb5O4y5wntyOH
	 FjZ0YtBUFlYpZ11vwx65DwlbC3opGogeSaPJPqmfUXxFfoW8X8kuxtkRaiwgSVOwXFzUL
	 S9KVRBpF0J74wKjG3Kj2ADU2o2GWiqPE36938PWfw81OpqM/dT5OtxXkAcnHAps0CywDh
	 Yj7wCDxbj1y5IKSkf4nKHTTnpwfcfuZ16jbZiXxVYr52QMH5YF4huvUC25bpwcnv9Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y/N7egXXa0Sj44BdKsS2Txw/MVlcyRGITqcsndVmdeM=;
	b=PtJN7NBLyZTY82RyEiGPE4FL913RX25f2ftpaU2DIVFP6KSQ+Nnw9fudGhnu2MAW6IVO
	 fzUJBv1m0l1B6ULj+9f4FzBwqUoODOJCc8wPS7izdW2xjQ/iapQTWzKl0Md00akPrOFq0
	 lWFmJxERv9ZcI/uEO5gb9WDsbYDELC9mpq1HPzIUgRetQ8qncD6VvS03nRcMtcHT0kdlm
	 jMdPS/FHspxPKkSygF7PEeA+HX3ounQuP7XYIeyOdF9jQGNy6sL8NYSyUdclwDOlycvG3
	 +bcqZmsbrCx5xyQjMZZw5K/gulj3bIUpEtJb6lVx9Fhp+R4SkXtP7G6Zmmrb+Av166w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=Rx8unDJn;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE217606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE217606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=Rx8unDJn
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab41538192so2010569a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792455548; x=1793060348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/N7egXXa0Sj44BdKsS2Txw/MVlcyRGITqcsndVmdeM=;
        b=Rx8unDJn3OHrbuPKB3uN1v7u5AVU79xe3gRaIRde/W0gSe8MKluBgonFrJyOC7FHAq
         oJhGCHx5x3ATrJqszf1CEpLq0qWJHXfXBUquZSrLxBrdM7SFLGFmoFY8SBaTISsqmyjK
         Lr+MM89snnceR6haMaqmUWp6dr1dhmF/fmRus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455548; x=1793060348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/N7egXXa0Sj44BdKsS2Txw/MVlcyRGITqcsndVmdeM=;
        b=0JV8G7aUEy7bWdAfCDqpR/ZjH95yTJbcD3gL5/X4CzdWmZC7297S/ghoiGRpwEdUFl
         cnqKtqoosqaRlZGqWpzZrH5Gl7mT918pYfxb6S2pCNxkvkc95vjjgx8iCbHeEK3034Dy
         4ZZZX2TqIn8G6APntlhq9SHszJTl6bEEKkPuLBckqhlpXQLE9c08h9PQdiw8JdPMYIcF
         TCPEGnGHvlK6lSwEB+99+iTi9Jg4YxLUXsA4n7U/fL5czxVdYgREwpFmGRZh36C4NLOQ
         YZ/9stja/Xyh+FetFB00+E9qLHKyEoBIo8HKIeDAC3lpRjN9lvdSGIkiBzDvlV7Gvl3r
         4iQw==
X-Forwarded-Encrypted: i=1; AKwUvBwcpASIb5BGjMzNq50mt1uVyE+95WnilV0jcVQddy6D3Ig0oS6q05dG/vZZX3XxNmkZT5lWMAbm/KYasWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbwDRaTZBLxiRWFgEcDB8FIk4mI9JZS2D7rl4ZEr4QJaWzcQ5V
	vXttzmv0uQxgYoRjS4rvbZl7zVeduhnLdI62YSvNNnaWrXJmAhbckujgS73KPFiuUNo=
X-Gm-Gg: AYBFou1ife1YJbwMxPWd9uaQyzIxQ+FK/+lsRRYklxkLekhIxzW/4VSXFDTSSAHFeFm
	Uei8F3HKpB2DQCPWJmrLv9k0jvREF5y+EBNQWtmD3S55P8NGW4wbFJgSLTsPy3hzW94HK8j6l0F
	UyBvXdqj+bo0V87yOpTYsansTJnGui4aoiUTwLuWgfwcLFVwlweUVVFIRbHktbbbn82twVaf81q
	dIaYjxnFG4xdoUIxxw6Hbtv6lyZaqatmvXN5Y9E24GszgEGDFCGxSyyYxkC/tydcOu9h1ySZ8bS
	mtlXBPdmUjQGbxYjzSo8HBAX/vFz2kSwLex32PmnSGs1zJiya4KL1wn4nf01NgHvmie6Nkf1Foj
	RZlDSmMcvYDiL7dZ7i0VK7csb/1j1UXBkmGtkzvVL2NwC/4fL4y9kKcyuW4kW5EODO4yzWjlDIS
	nL/rXAk6KHkYpX4AE+k5oQcP76/7XX9T8HjpfMNZCsnF8NMWNiw23uuVbpnHszxEvEnVdgj+toR
	ZUTKBtpuF48w119P3rrAQhWHA1547iQNH3gFTtUp3QtixQBcF9IE8NYZiO4LCweNA==
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3aceeb91898mr7922087a91.21.1792455547951;
        Mon, 19 Oct 2026 17:19:07 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d6df89fsm1694273a91.11.2026.10.19.17.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:17:56 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net v4 0/2] net: usb: lan78xx: do not use uninitialized data after short reads
Date: Tue, 20 Oct 2026 08:16:19 +0800
Message-ID: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
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

lan78xx_read_reg() and lan78xx_read_stats() accept a control transfer
that returns fewer bytes than requested and then use the uninitialized
rest of their kmalloc()ed buffers. A device that sends short replies can
get stale heap contents used as the MAC address of the interface, and makes
ethtool -S report them to unprivileged users, including kernel text and
direct map pointers.

Patch 2 makes the register and statistics helpers fail on short transfers. 
Patch 1 comes first so that a failing statistics read does not report 
uninitialized stack data instead.

The bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested with a LAN7800 emulated by raw-gadget + dummy_hcd, booted with
init_on_alloc=0:

- Zero-length statistics replies. Before: 40 to 88 of the 235 ethtool -S
  counters are non-zero, including usb_api_blocking_completion() and
  direct map pointers. After: every read fails with -EIO and all
  counters stay zero.

- 100 byte statistics replies. Before: 110 of the 235 counters are
  non-zero. With patch 1 only: 29 are, so the stale tail of the buffer
  still gets through. With both patches: the read fails with -EIO and
  all counters stay zero.

- Zero-length RX_ADDRL/RX_ADDRH replies. Before: the MAC address
  differs on every probe, is programmed into the MAC filter and is
  used as the address of the interface. After: the
  probe fails with -EIO.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Changes in v4:
- 2/2: drop the examples from the commit message and move the note that
  it depends on 1/2 below the --- line (Andrew Lunn)
- 2/2: also fail on a short transfer in lan78xx_write_reg(), for
  symmetry with the read helpers (Andrew Lunn)
v3: https://lore.kernel.org/all/20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg/
- add the missing Signed-off-by; no other changes
v2: https://lore.kernel.org/all/20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg/
- 2/2: the commit message now says that with patch 1 only a partial
  statistics reply (1 to 187 bytes) still leaks, and that patch 2 depends on
  patch 1; the MAC address paragraph no longer claims a write-back to
  RX_ADDRL/RX_ADDRH, which happens only for an invalid address. The cover
  letter gains a partial-reply test. No code change.
v1: https://lore.kernel.org/all/20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg/


Wei Jie Law (2):
  net: usb: lan78xx: do not update statistics after a failed read
  net: usb: lan78xx: reject short register and statistics transfers

 drivers/net/usb/lan78xx.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)


base-commit: 7ec48f396a1d89532c0537bc38b408b8c31ee37f
-- 
2.43.0

