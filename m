Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432763;
	b=CW8TVg+zDDCbfgxMyYglYEgXcR3REM15fPQwJM9ON8SVjAFLT2nWe2uVoIGL3deYWV4S
	 SW/49iC2nShkHHBY6WewYMSRGiD+Bxg2o6VQeouea2loleB+sknzmFCfKqIa2RR/5IDVV
	 qWh20yQtaJoT2X56oNOo1o2k17K66vpMXur1p5O1ZjvEkIDNtHuwpKxp3G+usdU/cRSaI
	 NY0DAYTDP0UDU7TV+C0XtkWjFpq8GUa5+lvN8j/WTC9UhOLufTeR76VolIdyGiHCw2uH1
	 XSks3dDuNtSbpzafm6gDe7ibu3Di/XZzyNlfr6A91V7Cy1ltEUTVeBQ6WfjXZXND0zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tpcEjWIOQm4GrhqiOryBSA+1vEUFEHl+y2QbhN2/yOg=;
	b=P6CmBZcFrudC0xc6djaCGnRhguaEgGWzAN6awBnXbo+mhXKwQiYAMhyPYFDu8okS+3tu
	 nkzhGhWoOzbsMJi/7L8KwcQzOySCiVfPSUMjyqJ61AnzC2E5flnX1oFbec3dfdE2puabK
	 9TFoxddGGLjlM98MGa3hi61lKWqSg91qEQziud4ybfwnwyJtAsyRURS79ibHQpBtk9Qu4
	 hahHUrahlS8MMKDNS4a6Bphp7fpmbC7LdV2yblvaEgBPvuGFO382hmHy3NZapVXBiHG0q
	 Kq3X24oYLpLFUgsoTjc72ttfqoHm22ipx8SQH6LogFJ7HpP9wLt7n6IjXjZpVGnAOVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzlczsnD;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7AC606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC7AC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzlczsnD
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so39217055e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432761; x=1795037561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpcEjWIOQm4GrhqiOryBSA+1vEUFEHl+y2QbhN2/yOg=;
        b=uzlczsnDtyqMB79F1SPzfSiKvsaxSztkSTc1leJX8Iqw9Jvh+39SADp14fxg2enCMI
         gYNk0s1Joq5RN/v5fXbjB74DR4B7AsURSN8cnBsRLjrg1z/clUwBDNHJoQkTmvjeGsyu
         R0aIRIMAqMARoufcYIlfFB4JhRWakfGFC4WA8aQS7I6m/xJqcwmYsX7FdiXFumvTJGct
         KJ3mG9I/zub18/DV6fvhB2Rcet+2vuJ5UgScsmmFirT8moG4PQPUAPOQGYXXlE1aKxbn
         h5FQuE13ci/blUwJegotGXA+kpm3B0UZSB9x8W50Us2pPA9xRZS6ccwWOWLhnRkdF9Oy
         E7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432761; x=1795037561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpcEjWIOQm4GrhqiOryBSA+1vEUFEHl+y2QbhN2/yOg=;
        b=z0ql/DIHIGT9QOVWIT7CaS2rsBcYcMxQuHdutuoUnSBlMByPoGVwRNsnOWPQ0DwSaS
         8NwLSMDq1McpOB2s8CoByTY9jA/6hPl8YlPiXzYhcbnaV8v8O8LeBSnrtomXu41TFMIL
         qkNBlEyA+hYjSlaAD/PKlfk/NhGSglSua/SBlFGmGBtOsKfU1Gd2WU56ZjLaGHzhL6fW
         knhiUreYVYT6lr3+NmiQNOr84AnC6bQcj+FIoa+jz4yzl0N6P3dUSqXnHTrcEfuM6EyP
         qduDNnQ5aThh7+B3TTlBwYwE+no5Xwu0r3BCUkdP5497RoOXI4yFt4rup4RGUs8Qw9Z4
         hxfQ==
X-Forwarded-Encrypted: i=1; AL+hErFWyS6PU8jugkiuqxOiRciHKjMvEznkXKHTEAKBcADlXtghyt9YGHYPPvf8eRiHRWihQhtFHsOvsfIEbRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vC5g5wZ98pXScMmv0J2FGEVmbJET42u3zkPl9VnrIXLIlp0bG
	U/M7whw2JktVu/4/BdanOtk8ja1TowsM8YfotCmUmFGpubvgZ6hICIUZ
X-Gm-Gg: AYBFou2ORm9cZznZw0CW+0Mep0LFiZvNVZ0SRygj2aT6Wvo37r8VS+bi9oZaX5he/1J
	PakvG3epbMNDz7EjwzcHnF29WBRa+IZJP5VuDVtyQ8TUA11GGA8qTV5PkH3QrnafSgNLX56J6Wo
	kzQnxvGbgOh9ep5KUy+izgy4U/dCu9q4iJ5asBvUyS4MHLBHZPetlvK4RUglR5Co4CgEiIu1Wym
	TA/wH8ul/7hdY2D18wSPY1frm4FVBCgjeHF4tXvIp1F3S7QPwJUZ+8V3cBGjWJdLB7YZtjS7Jnb
	nhpkEIdLFWsl1e9hD+pTWtAGqh1TEP6/7XBaIk6ABMDwGgzZ8leMAebzlmbsvk0fPvfkDMzXjNc
	1JhTrxzTw9wgJVm9g3vm6b45rSXNKpgmJSMuQKwvTQHhSBOXg8u0T0V7/8Piijq2iRfQyKPNPcC
	U6Jwhy1aLu7Icmr+IA9NVfg6405QtQcZGpGbItxnm2+tarQDc0JSmEY2IJBhqMaiznJOTjfnFPx
	mbiPKwEgkU9gK5lD6AU2yQoyFnmM1sgLxeQiWfd8VsFrtH+YkAZi0u7VIyxRT1YiRIgN2Fehdyl
	4yMILiT2ZP4Ru/kdtJtqSN+iqGJ/HM0WNWs=
X-Received: by 2002:a05:600c:4e45:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ba0936efc4mr70914265e9.14.1794432761116;
        Wed, 11 Nov 2026 13:32:41 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba095200c4sm36726845e9.2.2026.11.11.13.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:32:40 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next 0/3] wifi: rtw88: three fixes around the firmware recovery
Date: Wed, 11 Nov 2026 22:32:36 +0100
Message-ID: <20261111213239.569224-1-mehmet.fide@gmail.com>
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
They are independent of the channel switch series.

Tested on rtw-next (04c998418722) on an i.MX8MP board with
PROVE_LOCKING, DEBUG_ATOMIC_SLEEP and kmemleak, with hostapd. The
firmware crashes were triggered from debugfs on the RTL8822CE:

- patch 1: three crashes with an associated station interface lost
  five reserved pages before and none after; six crashes with an AP
  interface lost three before and none after
- patch 2: an unbind after the crashes warned "Have pending ack
  frames!" before and did not after. With a test build that drops
  every TX report of the firmware, the unbind of the RTL8822CE warned
  before; after, neither it nor the RTL8822BU did
- patch 3: each of three crashes with an associated station gave the
  "sleeping function called from invalid context" report before and
  none did after; the link was back after every crash

With the three patches, AP, association, power save, firmware crash
and scan tests on the RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU on
both bands gave no kernel report.

Mehmet Fide (3):
  wifi: rtw88: free the reserved pages of an interface on firmware
    recovery
  wifi: rtw88: report the frames purged from the TX report queue
  wifi: rtw88: reset the stations outside of RCU on firmware recovery

 drivers/net/wireless/realtek/rtw88/main.c |  8 +++-----
 drivers/net/wireless/realtek/rtw88/tx.c   | 20 ++++++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h   |  1 +
 3 files changed, 20 insertions(+), 9 deletions(-)


base-commit: 04c9984187228904f222681661c50db3f0c50b71
-- 
2.56.0

