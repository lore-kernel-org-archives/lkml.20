Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087747;
	b=1lDRTCT2787zhesaratxxwjwC5cttB5EnF3YRw3G6BdHbDRfAjAW1BMAht1L3nKTWATO
	 b4E5tyFjlHqJQf2w9coGIIvlhJW/gSsj7g/41MG5H642/FaKndLHLpl62YGtK++1RPY11
	 pyUkO0Cr1TfztkfJ87NFig32zIJsJ5mRol89ysnFg6O3HawNMGNrV1GZ6BRmfvep86cRo
	 Ul2x/AamjgghXRqOodb/nirXWElDvp7DCRHy3GrjywvoGYysdZ1Xg+mpNtwCNG0FyS7Da
	 Nl9hYJ4ZA45onBhMYM1EQxvorWE2z4ZKO/tyhyz0sBU0StAaqHKbvSDoGFzskjNyO1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cSQTlLG50jQwGPTwtgCEXwH2UrPpxUH5zGtovPPmNz4=;
	b=0AcNKqvJNWY5cGhJ+vr10pfUmRZappFJa3PI+tp4Oa1nfKZyW5yr80BMI90t7pVhOw49
	 5BJ5iZ088hZ0pLEufhpdcC8BIJmUCavpWxPEbcntftS22h6rE4SUzR6VWdaq6QoFu8sps
	 R5u/olD0FB+4ct3xC2RR9lQZrAKt6p/ZoCIO+p3Yp68kBeaJLm5WZTGYk+nxIAV4TJnX8
	 Ua93/0kAWGnoMvSDWagzbCyYxKOlSmckVdsbkefW8pOKfOgHAPQRqHQyxsMkHTY0ZxTOR
	 8bFpQ923njI5Igdz40R7Yy/tfUXvfhQKq4FVFTkn60g9Qs2ulJLna2nIdvAcsDEwaBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HzDJhZxV;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D3606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF8D3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HzDJhZxV
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so832296a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793087745; x=1793692545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSQTlLG50jQwGPTwtgCEXwH2UrPpxUH5zGtovPPmNz4=;
        b=HzDJhZxVmtoQCAIggABmVlcSobIRd0cIL4P2kRfRYD/60boqaR67vwUxeWu0eDUx8r
         sLCkB8xmm7Lei0wUk8Dk3pl+Sx9KJNH+Qb03JhgXh6SlKX9Kep+TrvS5nzczwIPfPbFG
         mUrrGXQm1L5LA+MiotqMX6uKlHe61wCO3sP9JXle/nS38aub8Zy+6JcOFzPuGk/y//3o
         OgE94EAukQeGnYeILirR2O8nuvp+F8HxR2XmK6OXILvdpCd9K3pWOXfbV7TAtzSer0bg
         nSZvil1UCqh9siPkmM/tC4eAr6KjGLE3h2EDNoi4KirWpPu78gafAP5caeDY7eVghR5j
         DNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087745; x=1793692545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSQTlLG50jQwGPTwtgCEXwH2UrPpxUH5zGtovPPmNz4=;
        b=MyGkve8TCAN+1WzddggicE6w7xgsB82QNaDjdMT/j9vCCIOJkyiEOif7vs9vOXz5n2
         O88n0YfGXJmlomX3QSqu+Vu411O5l9t2HM3AvF/p/MbE0UpYQIMQJgQVqtGmwK0iH1xM
         eawbOoD9mF14ijDy/Pxdb/rTtPmKSTYjEKJynABkBwAKOPrNubqwwY7QUojbVjKheEFd
         51N3oHVMxspxpgbpf6FsJSaLn+TEn9TI29IwHK+G/bQJghE1vlqKzdg8iBvqO20lKaVq
         362O5B+Zr8bLZiGlxyxFKkLkirxBgSD1IQdqplRF9TY70b5a3s1+vonNZMZro0ot2soa
         ApIw==
X-Forwarded-Encrypted: i=1; AKwUvBwMtzyrLMeoHYMuPX8FhLYMJiKv+QS7HUt7ye+rPB5aLBnJ1Oo3jDkNy7xO3CEgB8FODVl8ifSev0qK3ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhqKFilUcPTKeGwMgCzIy6xjtxAlusXE1pto9U9vr2FkwuPuCU
	+5ISLEu50cYjfWmdc3GZaLEQJT0fWJn/y0Djvr2Den0a9ujqwH0E3/oqJq9Z6wANEg==
X-Gm-Gg: AYBFou209aV+O2qe7tBtEbXMEp1jjO9wGrnM+dieATDroDZ1Bc/bMaLJBDButcTx0Vl
	w3IEjbZe/9IWNti6NeSjQ9DB1WmfT6+8+ohBDi7RkS1n3d1UK+nPmKBtePE+bLSNy3AvbzyB46x
	jwPf9UBQG+43o1i8Hmtju7s270qy56qFw+1BVtRmoW4hAyK2KfEs7qaJwgdpfGhteEWZZ4Ov+aN
	2qs9ewj0OCkT7/uZo93Uvb6ZtUaxtJK6mu8hzIdNtBE5wsGQ8RvU/NCemGHOgkFr0GeLOBm6eDw
	TU0DLrSs4dJOBaIzOgLALUhGOAK3v0tvWXx29SfS77MbNWdr8Z85wa+Az94iZS7mFyjoH6IER0V
	yOs1QBVcyloZrR62QfirEyOegzigwPM7GTsulVFDT8b3WAnp0ZuAEjqAPPkOXSO32VRjSxtZhsU
	QH+Ph0gE2qKf/I1B1B83PZ/gdhW4+iJY6z1BzbVcXb/dylqwQ/jWup9lV7JoialAOsEwF2EhWFj
	CrD1BVG2bnX3I00n0mdz3zaGgne03JVRGzSrlIRW3YP9V8TkYSJFDCHjmq9atjOV9CgibXD2YWd
	dgODeVCQT//3IbOf976X3IBrDJ6Gj5sELO1k96Lv3vI3NF4WALt0fMjyaJrVUh5H7MbH/9YyBAl
	z+ZlEcFegML/SgKEZCLgnPNKGn8t/kNWlUN68eTX06EEhnwUCnmk1OGaV58PVQtgmyDsc7W9f0a
	bHwA2OiF1nvxcJjqSyjYVhtCn9F/CbPvFdMQSGfqNjSXf5+56/VkwdyP9KYKkLj7U9dcgcrgkQi
	39splxvWNQ7sKB0/gMb9FjMCPoEfw==
X-Received: by 2002:aa7:c405:0:b0:6b1:c930:652a with SMTP id 4fb4d7f45d1cf-6b442fcbaf4mr7007086a12.7.1793087745215;
        Tue, 27 Oct 2026 00:55:45 -0700 (PDT)
Received: from Desktop (pd9513dae.dip0.t-ipconnect.de. [217.81.61.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4669251a12.19.2026.10.27.00.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:55:44 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH ath-next 0/3] wifi: ath11k: select the hardware mode
Date: Tue, 27 Oct 2026 08:55:41 +0100
Message-ID: <20261027075544.19144-1-julius@bairaktaris.de>
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

ath11k always takes the highest priority hardware mode the firmware
advertises. On the Zyxel NBG7815 (IPQ8074) that is DBS+SBS: three
radios, with the eight 5 GHz chains split between two radios and no
160 MHz. With Zyxel's own board data the firmware also advertises DBS,
which gives one 5 GHz radio with all eight chains and 160 MHz, the
layout Zyxel specifies for the board. There is no way to ask for it.

1/3 adds the range check on the firmware's mode IDs that ath12k has.
2/3 drops the regulatory events the firmware sends for phys outside the
selected mode; with DBS on the NBG7815 the event for phy 2 hit the
WARN_ON() in ath11k_reg_handle_chan_list() on every firmware start.
3/3 adds a hw_mode module parameter; without it nothing changes.

Tested 1/3 and 3/3 on a Xiaomi AX3600, whose firmware advertises only
DBS: no change without the parameter, and hw_mode=0, 4 and 7 warn with
the advertised modes (0x2) and keep DBS. Semih Baskan tested the series on an NBG7815
(modes 0x12): hw_mode=1 gives two radios, the 5 GHz one with eight
chains and a 160 MHz AP, without the warning from 2/3; no parameter and
hw_mode=4 give the three radios as before. Both tests ran on OpenWrt's
ath11k (Linux 6.18 with backports 7.2); on ath-next the series is
build-tested.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath11k: skip unknown hardware modes
  wifi: ath11k: add a module parameter to select the hardware mode

Semih Baskan (1):
  wifi: ath11k: ignore regulatory info of phys outside the hw mode

 drivers/net/wireless/ath/ath11k/core.c |  6 ++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/reg.c  | 14 +++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c  | 25 ++++++++++++++++++++-----
 4 files changed, 40 insertions(+), 6 deletions(-)


base-commit: 2c50cd5d10e8723797f28c7978f1f61688e0c0d2
-- 
2.53.0

