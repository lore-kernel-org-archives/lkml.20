Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360935;
	b=bUSB4Vt+4d2DJk12ZIHER3QsEIrll2NEJwSFjSYH/V2xLDwQHv1Badw9qeHQGd0W8fVj
	 HxeF2gHM/t0KugysHy3BD0ZRYHDLO3Er5NSNn74RKCTQEnIrplosC5oDcbzdUJgBKiE77
	 LWEZo6nYgjwactLIsFXOFo8QIcB8mSHN71Kyr9cP/B/bSSL3r6kVNjRTw/ClaUuqyRS7T
	 1rqFFMqcnYb7vclWw1tGTpfzF5u3ywXyvq7sgxuvf2bzUsoJfdGN5qjLmzw5p+6M30Zlp
	 Z3w+0gTMl5EqtdA1SJ+Rh4j8Ww1ltlzas4T1EbqLR0RSLEQVhNpV//yJAIFQiFmHzxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UEO+40LM9xL5cGYZjSoVxhOoZyvVXLznRoaksboBZqA=;
	b=StfD8DiyAmlvs3adfEyHxzbYo2W69a3HIzIbBH0w/xeObbxdgLMsTq63lkR/tj9RvrJV
	 i/oVQVdLmGT+pGi4zP7UTj6HJsGUGPZtNhapzTct+nzRgNj5LKWK6M63C8GCuoIlM09Sf
	 0SGnvy7qKrkmVMlWt9BHX+eM0zvLxr3/9OrGHjdj97I4hfp19L/el9abwywE6FL95QaVO
	 9RdKBbAZ7LE+xxIOr7dUSHhqOzlwgzfIpMBFJB/6avTGTG10G1v0WCLd7lH4/RBS2juzu
	 Pcqun4SDtiRXqqE6cFWeBkaxLHK1BtcDI9GzzvedF9Y+njZCOIn8PXJR4xumhEzXX9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b="IEvHeK/K";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA78606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA78606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=IEvHeK/K
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so4242375c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1794360933; x=1794965733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UEO+40LM9xL5cGYZjSoVxhOoZyvVXLznRoaksboBZqA=;
        b=IEvHeK/K451BWvdHXgOvqUyW4JIBZawUbHGh58KycTbae4FGNlcX447ztDOWA2+vFZ
         YLHAEY3lfgNosXik/a9uD2OpQCTCm7lCPhPh+Bei+0DVIvGO3J61PL0wrdZbpZ+LMI6n
         5V8AjThqPrZNWpkmiyP3nbyE/E1k6Vl1CU1BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360933; x=1794965733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEO+40LM9xL5cGYZjSoVxhOoZyvVXLznRoaksboBZqA=;
        b=YfAPF6HS98bxIubb3g81oIwSabm8C1KfyX1jKbOqBUbmc73Qi50MjOzJpB8+2E5pz7
         DusMvm0cjs0FQ3nbSVu3orTU8RbuV2AG7/7h6cNHew/xURgBNsx3t/I3QHLhsz9WfN4M
         bUAhdVGZ58Zsx9zqYwSxlmP7xk68X2XxqQHPRzr7rWq+wcgLlklssRBOPW3WLpDKsL/u
         czZrYyaQ2U9Xy0HjWf+ZN2TCoTQtVcckCaFTv9Rv7XfYVTzRMV/JMjR3oYupTkKvzaNl
         lgtGWUuzJkD+PnfCJI0c3jz+L9o3Bg/2oh5Av94CfV+7BTZGXBl/06NKnKIcFafXtVRI
         M9Rg==
X-Forwarded-Encrypted: i=1; AL+hErFVNiNA18KWIlcfYGZSMwxLlRB0UecNtz1ilwvKxsxUZp4FefMdYy6Wr+TCCn8A+cGSJI15ENc95G08bv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z96rswbdXyVYwxqDhU0UavYUwoMeQew6+9Cgly3dTkDG2vV9XrH
	YHpZ3D4GWax8LQb4sx4ogvWPLrDJIfi6ZSAGwWRAhHDGJTt89XPQCIem/fNA6dt3GDI=
X-Gm-Gg: AYBFou1V5i/rW4yIFztsuGIMIJh9AenMh1oh/VUgMlkv9KKtpRROs3fcK8eCT9qFebX
	+uxOfsfUw4ktL2G1YBJm08N1BpsfHrlVLcbJRctAOzrzCrZ+DA2dwzRhZ4XeE+iyTkd3lvFNHCN
	wkzN+z8VUgwFY6Tl17PxAnI1Jm1cwQFAkwTUdfXbXCze1R/MaHqOBPFYizlbZtN1LTMNwVaCo/w
	eC853EZkJ73nlPBWfzpQI5be70kToMeoKD/OW7/f4Q4aRQfHGltwuzyN4UlHRnEjYN5v+z46tO3
	kbjxDk41t7LKrmGwQsW0w29dBaVBCIlstwERQ4v5jxhTyL/+PM3xpnpef1YqVJaqZ5LbLS1K+fc
	jX4pyVe0bDJq+rRuMHURIc7rhmN18oMjc9dwL0KTE92XGLC5EikGDv0VxzoaiVzHawOO03/GFMZ
	mKYaRcPGbrWhLtj6B+ecf1CKEvp4UWPU9ESfh9hUFUCr1gM3XbKAYmEoWUO9d18hCoykNYW3upD
	K2MBG2o73FgU7eUi58TSzKBk7NMqmq6zdyVVfLZQwP68F4w/amX2bVlItOPtgjtarZXmUJKrESO
	8kvK5e2O8xPndK+1WjHrdPXQ5VilcPl9WiiQ7RFfsAb6DUIaLVU/EXUcHA==
X-Received: by 2002:a05:701b:450e:10b0:143:5cb4:30 with SMTP id a92af1059eb24-1b3c0246c92mr894266c88.3.1794360933275;
        Tue, 10 Nov 2026 17:35:33 -0800 (PST)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9696223c88.8.2026.11.10.17.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:35:32 -0800 (PST)
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
Subject: [PATCH net-next v5 0/2] net: usb: lan78xx: do not use uninitialized data after short reads
Date: Wed, 11 Nov 2026 09:34:52 +0800
Message-ID: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
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

Patch 2 makes the register and statistics helpers fail on short transfers. Patch 1 comes first so
that a failing statistics read does not report uninitialized stack data
instead.

The bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net-next and passes
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

Both bugs were found, and the patches written, with LLM assistance.
v1 to v4 carried Assisted-by tags; v5 drops them following commit
1e035297ffda ("docs: remove Assisted-by references").

Changes in v5:
- retarget to net-next and drop the Fixes: and Cc: stable tags, since
  the bugs need a misbehaving device (Andrew Lunn)
- add Andrew's Reviewed-by
- drop the Assisted-by tags (see above) and rebase on current net-next
v4: https://lore.kernel.org/all/20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg/
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


base-commit: 099e433a8bf4914a727b46e0c8a1a3d96c94b6a2
-- 
2.43.0

