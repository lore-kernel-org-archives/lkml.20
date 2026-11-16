Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866624;
	b=0reiMwXRa5F0tkhvnxJJbdJJS+KBovD4LqzX2tT+exFVbhsgRmQGeomWVpvFoASK/lzE
	 fY/2biTxle90eTLOtknzrqUYz0GTXdwAy94xdALq2PMJj2MhmP1UI8igVALgoIn7+mK6Y
	 HsOfaLJ7ItY9B2h0QgDMhKn1UHtdFIBm1soEZ6ls4N6Qh9HqqHtT1I95a9PDNqTxDMjZf
	 Dcuc1jHym/ZvKgaOpWKtndkPQhqCCgjN7RD1FSYwkRrFBff60NpDl6u1gtS8KSAKe6/Mw
	 qKGTCqFgPW5sElZjMmoqmJeJhYRkZzWpuGWE5FaYTCUzrNzmczhiKvCix5ayVfxYruQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866624;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=m+cxQs8yTdgDvbABlUHThuxHL2i4RK+nNcUQlxgwMtk=;
	b=fmqQSY/pPThMhw3VYQXqwIdWrMD97SOdGd/2wPeTWyNrSeNZHWAcomEtLIY3kKrRoW2q
	 qYAEmhvch6xs6+3U9/K/spEi4E32trbQzkg/bSVrD75fzqjB4aIBlHQFDYhSVAp/3/BRN
	 xUliH4Aiu5lsFS1/G8r3GmUcVdkxhF8Zn0OZWSqL4tsrEROiT/iuof/UoLsUcZMmhS0qk
	 JZTsk6qw4TUWT9DlnzpVNLTAh0vCiojpfAf7F1dMyykJHihntrudOviRd7Zv/OIOmT1e5
	 GxxqnKpDgVmtuXE4XccjjOIRa9iqZxv0JRaIk5ln+f0mWu5cvxM/S0JYOz2UX5Q13mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC41606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC41606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67db0791748so2052470d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866623; x=1795471423;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+cxQs8yTdgDvbABlUHThuxHL2i4RK+nNcUQlxgwMtk=;
        b=gSh+yWayGfEwy2Q88giKcajA4HZUDTg5bIJ3ovKj6noAuLDAu3uoLHZ0Qy70zOny1u
         hqkO38lSf51l4eq2NaWavtXiRwivPGqro5fgzxJsAkEd4HVuE6cbX90aM/6O7C1t1UDk
         ZrZ+s6QkNNVWNPNsR+xrnDVOGauYnvtOG3EPz9SfzagaZL9cxWs+KGNV9QCim/Zk9/2w
         TcYRmNOT+xaPmpc/scn0/6pXnqsnt6LmrVCVi3AB8SoJB2ZZfqL7BpWS2X+Z7roFWXoJ
         Eg1OUciFYPRwqAbL5XBTpXVQ20/47HaNc59YozwiDhYVdv0azH8TnYdXs/5hm3HUAOHK
         Gi/A==
X-Forwarded-Encrypted: i=1; AL+hErHW0oe89F0v01uKnWHFtdlRJN/ZyVLviifGT+WSNwZLnoJPOgAglOtOoiayCHfhiQeyubhPaIEcrgPBseE=@vger.kernel.org
X-Gm-Message-State: APuU4Z81S+fMYY4+QuKnT85oW8RWtR/X002cQC4PvmdM95e9DVUEAI/q
	601QwFaeUMFjYauHNV/m9dnI+qlksm+8DWXLjeQDLFdchlN/MwPs+HBt
X-Gm-Gg: AZFdTZfzvwSXjkN2QFyyjKZU9MJTElhcz2z2k/0TvKKqCcUSli6t93dCV4lelxuFdjD
	UiGKZHgVm09qndc7VQOQp/bdlMwwOVWO+Nia01+a9i/d487BTEnGMUXkvGo7y7+aFqes6Mn9LTB
	Qpg/5Xobsa2OX9hrSuSmOqMhqQ1nAxEYQnjF0QRZ+824ndUWk3vyjdM4XQ9D7omQEHbN4rJ+r54
	uiA48gV3L4pssqU2DWYNTGUtygLSfboZwE2gS78mXHLDS0+aWiKSrw/yEC8UYHgr4krWrgp4fKv
	wAprtcJogVSeSc1pEko1h5fqtv2/4UvQDYgx6qCdFsWgBV1knmD6S3RqWrBoGy+4KkPH7vEqpFF
	YOWlaievihLUxSfLQR+BlYiBmDKguza5PfNOg+fsljdNXFGSbPE4ZkrRILPeRpDd8Gl45bXZf3z
	cB5sHyn2pqKz+nb8b9/P7dVuwQgYPDEe/IYQYJ1fumSXo5ChCxby1M29ubm6/HDVZSpoxw0Vjk3
	yM+JDtjNYJKLAnh7k3nXiqGmq+1LbR/yzcPpaHGsF5IUefZkAA54RIQxK83YitG1bSYWQmGswo3
	TYn0xkevmpeRVrUmT3qHsW/Iab/m9/3lbEoRSlMcdBiwUdP4xk7Bny6KzAyh08Sz55xiwBwkejV
	+6GNE8y4Q2FeYnZn6FKDaramiaEVSkm/rg6k=
X-Received: by 2002:a05:690e:169b:b0:67c:3484:f8e6 with SMTP id 956f58d0204a3-67d8963cae1mr7159104d50.38.1794866623596;
        Mon, 16 Nov 2026 14:03:43 -0800 (PST)
Received: from josephs-mac-mini.local ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm11133078d50.21.2026.11.16.14.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:03:43 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH 0/2] ASoC: ti: omap-mcbsp: TDM slots for generic cards
Date: Mon, 16 Nov 2026 17:03:20 -0500
Message-Id: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ6CMBBA0auQWTsJU7Ear2Jc0DLAGEubTjUkh
 LtbdfkW/2+gnIUVrs0Gmd+iEpcKOjTg536ZGGWoBtMaS0QnjKFPGLzThGUIqM9Y8Mxs6dhdjLE
 Oapkyj7L+rrf73/pyD/blu4J9/wCFfJBsdwAAAA==
X-Change-ID: 20261115-omap-mcbsp-tdm-slot-7ee61348226b
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

With simple-audio-card or audio-graph-card, McBSP as clock provider runs
its bit clock at the full SRG input, since only a machine driver can set
its divider. Patch 2 adds set_tdm_slot() so these cards can ask for a
frame of slots x slot_width bit clocks; patch 1 lets the divider use all
8 bits of CLKGDV.

The ADV7513 in the test takes S32_LE only with a companion adv7511
patch:
https://lore.kernel.org/r/20261116-adv7511-s32-v1-1-40ae8228db42@telaak.dev

---
Joseph Telaak (2):
      ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
      ASoC: ti: omap-mcbsp: Implement set_tdm_slot

 sound/soc/ti/omap-mcbsp-priv.h |   6 +-
 sound/soc/ti/omap-mcbsp.c      | 155 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 2 deletions(-)
---
base-commit: 7cd6b1fd8f9c1fcb1da1b761d502649f50b9800f
change-id: 20261115-omap-mcbsp-tdm-slot-7ee61348226b

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

