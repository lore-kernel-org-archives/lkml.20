Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813619;
	b=y7XzdvLFD5AvsXDNDlogw2DVx1KuD4fxee1DkZQA23YBX5HiLV2Nedc0rw/2irgDFXdh
	 DsHT/N9uM9zUimVrs/SlY3XBcn6E7shssGyEyVVtU0isU2T8oPn9vIq/0qtBnxVufOeHA
	 Bm4HBVwt207HAD2Z1vKR9Y67jURHS5Dwm3pV+Gl8LKoI49ZeF2SbsgWJh/SVNaCYYyvVk
	 EIsK1T78JBpg6Tpf89DmMdQLa2TH1pe6Luz5Lxg/pzvG9W9dxO5Jt0SDxyfSgQqIJS2FS
	 HQtuk9w3rCZ14nfdYfZQviewCgleuAtvDcVr9MICpBl9o/ZXQ5bmXOHXM0YpAdAlyIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QOYIpbJdkV1tnbOMqaWFb3IZHweOyEOHG6Y9Lq3iZWE=;
	b=nfnffWAwMOjNO94/a/NebxBHRiKLa3qbRJ0OAfSEQOWBL+Sr1YJY0+DqbrE0/xMeC+Pm
	 dd7G0+PuzTJNZdcmjHOwERAz15ylMiop0S/vVugpVaqjCcbdJsgnkei9yaqR0JLnrsV3I
	 +IT/h3L+WcDt6HEzxqNvQExPeQFMydG14JCxwDez9lLsE/wTP6jHfJhnKP4otXp/DbU5F
	 EDqitv+cYV50wT/WigRsxbDVlVXn+JSOMCR5SqaHRFMQWaulXoQGn/+FRBOfCB45s9pyd
	 HCJ8zb9rcO3rQPvYsb3wvFZ3CPUXsSiEAppXW0CZ9Mdo0RRlCSBziYlSxzR/9LkNcqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/MFUlEO";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE2606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4FE2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/MFUlEO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e47347279so1250890f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813617; x=1795418417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QOYIpbJdkV1tnbOMqaWFb3IZHweOyEOHG6Y9Lq3iZWE=;
        b=n/MFUlEOI8on7KQqVn2mh1KWDpHJU+9+7JNOlYEYC9uGnDumVBQsR8I9BeYG8IJxkj
         1Uq2es3UWn2TAJ2y/1GQ80FPHxlibkz3AjLZ0b1Ucx4mLfGTjV0zdzNj4GuzmyOYWipv
         Qv5OReVtuBrE0k7gZo+WeC6K5LJkFBcWA82xCT6Qnf0eAhwssOctoYaQAqmOelKSAvX1
         2qzocg9dOErHHk2043+Tbeg736O+HmoUpfQZQBiI0zr5hWuxBZFix60qcsbPnI2hT/Nw
         VFaWomjWh4vwHWftESAMNbsjZl7CTP3pJFPh8LUbKvyQ8wh2FhXhbqBLBwYMjbj24Rmd
         e3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813617; x=1795418417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOYIpbJdkV1tnbOMqaWFb3IZHweOyEOHG6Y9Lq3iZWE=;
        b=eOp+LMBazYOOwlDkYtUM/HwRjCwrXsH2/8onDFOlXRpQqyCgHfrVSYQloNpsEM87g+
         lx3splpcbaF+QPp4pJ+SEQB1O79S2gyvGamH27zf9mEj08fp6v06vrsrhGXxcRBnDwdP
         4AjmdHggNFFeMBVJbzOpEQc/Ub2KyFDug1Y5BTZLwhjkXREWL8niLeLSR14vqnRRSOdh
         G1E/nLnJqOepzA1y85wWdOVxzmfdkdmYZhxLgVasEFjsFB52hLpmaVCInFeUkeCHDKZk
         DPxpl9QDWk7Mb+bFqopBkO54mSP0fkBaQ57LxH5hEUo1iqTnuY2RohnFHRV/78Yvq4VH
         w1Bg==
X-Forwarded-Encrypted: i=1; AL+hErH8aXicHCuWGlpowk2Nwha2EblB9bgKVklHCuy3XZmuROCn6OzfRlEiF6JdfjbQ/ZlBA81ym/HDTa9q85E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sYRkZjkUcF1c2Yo8mdQgcwyY6yaMU66tIT8HeLNkTd+85De+U
	XBCbwIOdtAKhAU0ZhZxdjY73DFbkwr9VvQQHqXiWuba+VLXQOMKHRG+/
X-Gm-Gg: AYBFou16CuRckRtAZs2BwfwWeGndM3Oab8paEa6sDB9akhoc7NWSqVSZVSXqG7Ttlwe
	gHNa3VfZO4BcaElBqp8j4rEKdRVCAjb1Iab/lO//AhWq/lcCOybPA3mKIkiyiu+2pFePuWZMi4E
	X1Hu2Gy/i2SQj0PbHBchD7+TFTgpLObRje1zV/g2/83A9Y1h3DzzibKmFG/NODmFYTtAxWZ9wAS
	uyGoRYb2oJ/LdnhpU2rydL0Eu6zZYlgaVdskL7C/AISB93P+08tOlyaxFL4vCKEYIJB0IAdMiCL
	l95ksJiT3XiKTOjR0MvtFAy1KTz4fdw6wkMNjEiOFhps26V7iDruBdBcc4LFjtG8L1FVstzDoQq
	64fJxRKG/B1Ak0JnVv2UJ7+oOm4r3lOE4yIn3slWID0ucING0rWpj4eTrpmbgUjcCwX3Ga5Aava
	VgUL5OoSzQeoIq8s1ckUWB08VUnUEx4S4pE57mCUnsKf2qHGuL3/QY0g92LzZlkPw9Kur7Gi5jp
	7Sid1P1ZkBKqKW/6nuZnlh+ZurN8Tl8I6ueC9Ry3WtgoQiLgYBxQZnvM/gni7YYh8rcwHIzxdLB
	bQ+xrkqxpMq1ZoZGZu3N3ih1KtyQ4bES/IE=
X-Received: by 2002:a05:6000:1a8f:b0:491:3fdd:af37 with SMTP id ffacd0b85a97d-49c71d490famr20261299f8f.28.1794813616825;
        Sun, 15 Nov 2026 23:20:16 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm22953761f8f.1.2026.11.15.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:16 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 0/3] wifi: rtw88: three fixes around the firmware recovery
Date: Mon, 16 Nov 2026 08:20:11 +0100
Message-ID: <20261116072014.1142494-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Three fixes for what a firmware crash test showed on an RTL8822CE.
They do not depend on the channel switch series, but patch 1 and
patch 2 of that series (v11) both change rtw_fw_update_beacon_work():
the one applied second needs both conditions in its test, and I will
rebase it when asked.

Tested on rtw-next on an i.MX8MP board with PROVE_LOCKING,
DEBUG_ATOMIC_SLEEP and kmemleak, with hostapd. The
firmware crashes were triggered from debugfs on the RTL8822CE:

- patch 1: three crashes with an associated station interface lost
  five reserved pages before and none after; six crashes with an AP
  interface lost three before and none after. A test build that queues
  the beacon update work between the reset and the reconfiguration
  warned "Should not have an empty reserved page" with v1 and did not
  with v2
- patch 2: an unbind after the crashes warned "Have pending ack
  frames!" before and did not after. With a test build that drops
  every TX report of the firmware, the unbind of the RTL8822CE warned
  before; after, neither it nor the RTL8822BU did
- patch 3: each of three crashes with an associated station gave the
  "sleeping function called from invalid context" report before and
  none did after; the link was back after every crash

With the three patches, AP, association, power save, firmware crash
and scan tests on the RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU
(two adapters) on both bands gave no kernel report and no kmemleak
report, also after the rebase.

v2:
- patch 1: the beacon update work does nothing while
  RTW_FLAG_RESTARTING is set (Luka Gejak)
- patches 2 and 3: Reviewed-by Luka Gejak, no change
- rebased on rtw-next

v1: https://lore.kernel.org/linux-wireless/20261111213239.569224-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  wifi: rtw88: free the reserved pages of an interface on firmware
    recovery
  wifi: rtw88: report the frames purged from the TX report queue
  wifi: rtw88: reset the stations outside of RCU on firmware recovery

 drivers/net/wireless/realtek/rtw88/fw.c   |  6 ++++--
 drivers/net/wireless/realtek/rtw88/main.c |  8 +++-----
 drivers/net/wireless/realtek/rtw88/tx.c   | 20 ++++++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h   |  1 +
 4 files changed, 24 insertions(+), 11 deletions(-)


base-commit: 61a5eb87b2d9b4d5e353780b781cf691f39ba9e1
-- 
2.56.0

