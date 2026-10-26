Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007082;
	b=U6hDJH3pXoeGw/iKffTgPEdQoIW1I9Xbjq+GV49ssxY+McPsZWvEtSZSVA7u1cMqiMvl
	 tAkVtN/D/Cl4VZn1Vuo9dKCV6voia2d75wEar+6quWtBGAucfJxM6M7Dlse2EoGHlvXvj
	 t0ih6fVDLQ1+9LupyRPxi2E3YZL1W7Qk4sq8YY5F4cY93UZcnGyxp/UukJpn0RZakh1ju
	 rklTt30ZvzMZ2GmWmq6HcCHAySpXwAH/K7SGAM43H8JVL/0huz4DmFW5xEO4U88KZ6Nvr
	 oZT/uwSSY0ysYHwrAJaXviak1MgJ+0LruWIIREr6hFS5jpWd3lqco/jY8a1ZcijZurg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=inG+eG1nMsX+iByUG8PvEF7bboqnh0n7ThmAeiyUE+U=;
	b=jMP9TmrR0sG3LEycW2C2bwBsSGTxH8vCDWvwZFNLi8Rnh5DDeyd5l5UCldvQHEnBX22W
	 i89xZR3RFcgFJUyg6uunBwmrS+OIostUOjfHsaC+zpJHJHxi8QPOCkKlW2t6JV2YQt9uW
	 rOBbXIjwNgCS3os8wtezzRuuerul+KOYd4gEbk6xZXOX6bL2qihK78LzVfoWu2C83UKy4
	 NCAS9h/0fkpWAH40Ld6MHP0zugfK5geD0/C9X61PEDOIg0dsf7DTVhNbTEkHJpnadXLh7
	 1Got+8wrIC9nVaqBPxZupmsJ1Zp/emKys4IGmp9b/RAH9vKBhAvzm13nfSnyd7kz9gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernelgen.org;
	spf=none smtp.mailfrom=kernelgen.org;
	dkim=pass header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kjgYg7Wr;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A1606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8A1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kjgYg7Wr
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c499e0e43a9so2178466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelgen-org.20251104.gappssmtp.com; s=20251104; t=1793007081; x=1793611881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=inG+eG1nMsX+iByUG8PvEF7bboqnh0n7ThmAeiyUE+U=;
        b=kjgYg7WrGEcBuhpl3CUGzxWJjnIK673xx0heVzn3yFtADaSoYkCqrDOM1sBmZ7r3dD
         mhM5pT2HIv0M0zyqiPiBGol2bhRNeagZAzbpiyG3tKlY0jS0lV1Pb1tstAHqv/5q/l2u
         zqjjZH2AaqXWXsaFy+3pz+K7BdenONp+DTYdVl//R4jdKomaNud00OXJBD0sGD8wPnE2
         fFR6fZ1xtCtmjBUiSnqPsFhKdWq7r6oH3S35sbpGeuz2N2JtFIhCJYGqUOPAjX815ypJ
         LorZp1dfg0b+rS1iI9Bi+gWnCgDVXBFpeNFrT0AJhPiFvVoRYoVLnS+PWGAj4l8/rWBg
         oqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007081; x=1793611881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inG+eG1nMsX+iByUG8PvEF7bboqnh0n7ThmAeiyUE+U=;
        b=dtwginCaaNE1pXxoRTQ8u8VD1iaQEpYTJDnAdXxpJtbolknoRnckMiXcvJTt5jucne
         9obsl7FJA6WSFRQqiuf6Yok+Z56JWud5IY2nxKwK+c4usijU0/XQYllZGXBB0LfKZf7H
         kfZVV5Kh2ioypJYhCaA52XnAfLzwH+C3YU25T5a5NuWsxdeBwL7+GxitcATqQtilprix
         2lCeXadontmbRPrDP+8G6OS8ZifB27C4PeySh3OKWKkjpp6jTRRmZt1o9eexT3daC8QL
         4gKdwGRarkXY/USInM5d2SSFsgLKAOBo+O3+yqZvaP5L7WxlfQBuGA8vuwXO0U6Blz61
         cSpw==
X-Forwarded-Encrypted: i=1; AKwUvBzZAl5vvstUpHYWqo3pAGQqjekDjiO5waLwB/XIg0qBZbtqioQbOgMn0SVxwnJ39QdOqiShktQm5De/XTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVrgUc9PzKwAtScxKdi7ZZIBFSaYAYWDQaxXJ19eTFtQE+y0aG
	xeBpkdpG37LAh7bxmj2Pth+GX5rPedswLgbCDUl8Ccsq8z7kzOuaMRfeTxnDzB0Yb2M=
X-Gm-Gg: AYBFou1p0K1Mlp6aXnrD3OKoEziRwmKinOH4n61/DZeqLDvq+D0rPHz7EvffKXe06uV
	vXEDN4rGmy0SVgiw+xG5rgEreRihnoOv83Xp/mEkU8PML54Je8gS5akRp1DUYqriOdYUXpYMxZ0
	4PgAZBHRETaZzToJkNooWOYEybFtR+thmcU2sfqxr4i+9ql7tZ9fMgFyo55Sz+ZeaWlx3zmZOA1
	VDSvtKTfRI5pSTdQA6et6Td1w+Rmcs/1vQCX4PKgf+8zNODmf1M9z3xCkpKnY8tXcCWk5EjEfv2
	EjLLnFv+i4LIyT9Bio8a/q9O7OCKpj9wbLWySJK1khjQdQtdcsRC1r0j682mU83BKdfvsQZGqrv
	e6u19Kd9tYYY/16WNKBVgnnwzOkTtUiokeaZz+9pGxxRyAfwPIk53nqlLa6r0pL3Vh3qtX6JB0x
	NY0hJHFgjCTDhQ7jjLgtiUqvlgKB3WxRRVzyQACNDx3AHaQ7OR1tHen3V1rX5+XpuZEJ8l/2JhI
	BDV+EZD/M3pisS67hF9sTnPUz208PGSDyAfDar3z4PhUTwvqt48cjQImF/ABXGN7JlskfjZobnn
	Qxj/lDEzxI5zW+a5jE4vt7DccPye90QD80HmnlvRDcsOdbpJ3/1sUtlWZZxLc8NyWDA84O0k5ye
	Vp+5g/9EPWJCK2w4fEGwe
X-Received: by 2002:a17:906:2886:b0:c46:b5a7:5b29 with SMTP id a640c23a62f3a-c46bddd029fmr713493166b.2.1793007080405;
        Mon, 26 Oct 2026 02:31:20 -0700 (PDT)
Received: from kernelgen.org ([2a04:ee41:83:91ea:29ae:67de:9d1a:d368])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm14217710f8f.3.2026.10.26.02.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:31:19 -0700 (PDT)
From: Dmitry Mikushin <dmitry@kernelgen.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dmitry Mikushin <dmitry@kernelgen.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: synaptics - enable SMBus for ThinkPad P14s Gen 2i (LEN2072)
Date: Mon, 26 Oct 2026 10:31:16 +0100
Message-ID: <20261026093118.2312302-1-dmitry@kernelgen.org>
X-Mailer: git-send-email 2.56.0
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

The ThinkPad P14s Gen 2i touchpad (Synaptics TM3471-030, LEN2072) is
not on the SMBus passlist and runs in PS/2 mode. Forcing RMI4 alone
does not help: the F12 attention handler reads the whole 79-byte data
packet over SMBus on every frame, which caps the report rate at about
43 Hz and loses fast swipes.

Patch 1 makes F12 read only the object data it consumes, raising the
report rate to about 65 Hz on this machine. Patch 2 then adds LEN2072
to smbus_pnp_ids. Patch 2 should not be applied without patch 1.

Both were tested on a ThinkPad P14s Gen 2i (20VX) on 7.2.9, including
s2idle suspend/resume and the TrackPoint on the RMI4 pass-through port.

Dmitry Mikushin (2):
  Input: synaptics-rmi4 - f12: read only the object data on attention
  Input: synaptics - add LEN2072 to smbus_pnp_ids for ThinkPad P14s Gen
    2i

 drivers/input/mouse/synaptics.c |  1 +
 drivers/input/rmi4/rmi_f12.c    | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.56.0

