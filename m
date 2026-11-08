Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162542;
	b=15ueVyh6IhFDcJ1jf5lfHEPv9qKqlrDhcVNC5I3RqJArfN5RiSTg+jDqQPIAw9+XhZJD
	 jpPmIFBKTrk+A9lWgVuPmDLKmdZQNkprqAdbZ6XbcH9cQGzHMILBIh9wFZY2bRMrdTVXF
	 AizjkJHN7w2PMua00ynqJJzHtxlsXRqMYTbBbR8Egou4+tJdTO+JFqxg7BtipogcIbm0r
	 5SlTqYBtOMFW45s7lsncpP+0xcfGs4YvdGoMko0JxrIZUhpInWWMTR2YwQLYKnKmqFI7Y
	 MAByOHe4GwmtPi2utnaeBcZ0tL1YFjgBRHL8dneTF7xYcmj9BOLZVjM0vBhORUpWkRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
	b=utWWBPWvO3ObhT61OBZ991DIj2dsKVCAbLXYeKc5EFsKkflWENFWsBruqMDTKsiXmTEt
	 bMdHzyclrDKYIjMAUSziYqghryWcBgBq03QK5jF15IMywtupMZ8s4iwXjmdKVauvTXOh8
	 fcDTnHvrSiqHEC/VoIM+VJiRePcNTC4KMJbLdzpyysvZEfSd9vZevcbpc/LuqSm32wh2i
	 Pf6nu4Uo6xLJSpFEX0MP1ZjNEX+B0cZU2wzmnJsveYAy3SeFW0fl31K0Jece5VKsulZtM
	 jdc7xWzGa3u1xUKe/rxDIeGwhEai49feA9xeNkO0n2denklaosMxC5CMLTg62rNUX7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j3B/Ou3N";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28361606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28361606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3B/Ou3N
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb684859cbso108487a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162541; x=1794767341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
        b=j3B/Ou3NGC3oovPaAENOTC40CRU9zYt1RQilGxXqeMdF2vcZeZqdARzdvf3wrjYqLn
         1k9QSImG0K4GqKkxiGUmM5zrIFEclrqCpuKkLCjypvktUTLjSdYPPupirHZ9URvc1uLx
         qSWqJxEEH4/CHkCi04YwBmMW1JcbrqnHUWoJ8wy/G0gSaF27hEeUEdiQCMs15B/BgTfo
         3lmzKbJpqPKftvYXI/gCbo/ekYrN6fMQ+hhAIQg/0QOidXmOU4KpbJ9E6npG2d+7H5Ei
         m/T7K1TMTSbSBiNVABX0B+bby35Qrtc45UfZJvCEG5Pbo57JL4PxmulpsoRCCMKxTXfV
         anrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162541; x=1794767341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE8fsj1NIaKRva+QOmPHFRmITtv9VE51RjmDOs+p9WA=;
        b=gNl8lLBfbNZQIPa0VR7gsyO5KXea7aExytO/+oB1fbwhDoer8VWsXZ2V5M6q4Uqis2
         QGzFJp8khhqsa6+2o8jGufGOg8tQOpMIhygQEdH5sgW/xP2GF+k4MUVW362CTvSbpQ/H
         NO88dYCJLqyV+tr5wAnBAzArThb950N8vVSo4xLlUyRl4a61aZhtUtw9HJB/PWQoyvlH
         qiCe9lJ22kmxwlwKqAmme88ATKK5eoCeJ28RtMjCPTUsWyyEZ9KY33bNoQLJ+4AS9ooA
         SMU7a31TpMXQAyWDOdhJJG85m+o/A4wsLyz+dKBShCA701zmzFA/RZCKr2roFyz8KW8V
         82EA==
X-Gm-Message-State: APuU4Z/kIw0qyfMRG5+Ar/6frMx2EpXt+E88v9eH5btzQyDbVJnAVdk6
	Wsjl404UveeTGy07ODYDUSa3Vu8cMCjqlMjLVT6byK8BodjN5nwUdNXlpOT40Nsf
X-Gm-Gg: AYBFou3ZO2uVpVb+GveY3xSby7wuB6HA/dRup2TA24YmqvC3Tg8BuiRLZDmHMNPWRd2
	aA3P2IBJVyNK8Q2mM+9hoJ1tRJ2lbZsXNGR+7ZRdLaiOcXhoXgrttZDufwJpNgifq5BT6ZCK4bb
	1m4eaQRywh8OcCdSo0YqnbmUhPtvGh2qbYUB+i4MOQHsY1fuDoIIWB8U+7nRNhEna456FfP8JPc
	dSICADxOvfGnpffoyu+uZzsJUE36VW4zkBKq296koN0nl6WNsTJ5u44PnwNmDddBOOx3Vjspn2U
	EWdkCpALL0WMCi9oqLBOZ5xccBLnFNAL9ChxejAhztnd6hRA3ee/RqiF8217Bv7oo01pnfOfMoQ
	6JZwJVDBpzyh5iVEVjWpvc9XAs8ZNPtejBPqNrtFtBgdlhB2v87LNj/SPE/TUPcTAT1XcqKldzk
	ms+MgPW7nXNg/G+RUz5Gs6ypgAPiTE1VaeWk7FFfWvn19znIzJ4oxibW4+Ypx6KEAhPk8wbWL8A
	TTVU+4qYhoURQu1vyFjav4yMby/k17ED3P711hDJWHj/u/gudhtOjkITCtnRR1MJUh8PyOt7RMT
	6yaL/0M0kS3BYLM5Pb08Q/JurssS5JYddNPoyAk6H54uvCg0xhpQgT9R2B2jnbjHtdf/zdqXu1O
	RDathv8BG2JU2ZYMpW/FJIG2PJkpIEQ==
X-Received: by 2002:a05:6a21:3d83:b0:3e2:8f64:e4ff with SMTP id adf61e73a8af0-3eed3c67fb9mr1458487637.31.1794162541173;
        Sun, 08 Nov 2026 10:29:01 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:9:5496:ab84:534b:ad67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b6498209a5sm692938b3a.36.2026.11.08.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:29:00 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH RESEND rtw-next v2 0/2] wifi: rtw88: 8822c: check register values in cck_pd_set
Date: Mon,  9 Nov 2026 00:28:35 +0600
Message-ID: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() indexes its tables with two values read from
the chip, bw and nrx, without checking them first. When the chip stops
responding, both can be out of range. Patch 1 handles bw, which goes out
of range when an RTL8822CE drops off the PCIe bus. Patch 2 handles nrx,
which Luka Gejak found while reviewing v1.

v2:
- Patch 1: move the test data below the --- line (Luka)
- Patch 1: use the preferred multi-line comment style (Luka)
- Patch 1: drop the nrx check, which can never be true (Luka)
- Patch 2: new

v1: https://lore.kernel.org/linux-wireless/20261105113415.73184-1-zeshanahmednobin@gmail.com/

AI assistance: I asked an AI coding assistant to help find out why the
RTL8822CE in my laptop keeps failing. It analyzed the kernel logs and
found the bw bug (Luka found the nrx one), wrote both fixes, the
debug-only changes used for testing, and the messages. I reviewed
everything and ran the tests described in each patch before sending.

Zeshan Ahmed Nobin (2):
  wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
  wifi: rtw88: 8822c: ignore nrx values without CCK PD registers

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)


base-commit: dc16902cad9c6b08df9395a510c7be44fbab545d
-- 
2.43.0

