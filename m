Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228587;
	b=LvPsqceJknKtcWO5G/EJ3wfhTH7n3cIISv7oeQfprS9JVB7zTokyMPtcdZetVZ305Cow
	 /IN+hSHXZMFn7MEA0ICxUTal/NQkErMQrLYyYKtywh0sadYeQA2PtL3gkBcyXLIgtKfC3
	 PA1FvW1SQz+g55j1AdAa9rRyvlBPrGkTG1y0y1XVrjxBaRhXrwzPNXOsWl6rBWA1E3q9g
	 nJwewz4sxZYT2YVGr1SArOQJ2d60lDbyB/eONnAZVgIKhmk7QIv0EQik+rEGhlgQDK9A7
	 hjE9ShmXUxM5ZZnst54onNNTAdNPyjC2tlB+L/7zWR8wXk+x9NBCqzbcNzdqmi5ipQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mG9Y8k2vnChqxaqg4HKskuIcpQ6X4WU53zywg6kGBHQ=;
	b=2KWR1xLyTOkeULK5mlRSsuWahjtiaBQDMDB3u72AqBoHu/F1410/kOOMDJO8Y1/Sm0uj
	 BoEG31Fj98PSL2pii4b43P6Ay/uG4YyvDlrxKqarREVSm0G8KHuBkkc/Gh2dYxOPCkjr/
	 +rzjisdXxiKeuWAXOyMPpuywjhT3GHIqT3nXGKIanV9mmRtG9xy1KwtgQiEFBEc174o/u
	 I8VxzfJmAJpYAC9s+rVuE5qhucOSmxxsAwU3/Sm9WFg8Hss5xrOXXF/YoDZyZa3QciSmY
	 G6AaE5D2ryAcoqgD1LG1ZCxnggFB1Bh71W9WYWXeHKXo/oocAVy4qAncjyoctpr1z7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oof0SMWW;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEA9606D813
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CEA9606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oof0SMWW
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8439fe796ebso484588a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794228586; x=1794833386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mG9Y8k2vnChqxaqg4HKskuIcpQ6X4WU53zywg6kGBHQ=;
        b=oof0SMWWrTw7FAV1sR7haIUYvt37AGp5bvoFIQrQqKl5y3EQHSNObrqGZoA43pTS6/
         vQ7kyrQns04frayvawgKvXrnk9MiPVvt92jHDHu9jcnmECI53hw4K1kVIzXNEhQLX6KQ
         szK/zf6NWtZOiGpPvIZlEdWYrgCNc7e/0oPsm9fnuurtXeL60+h7Jug7EoeLUoKxrLdT
         T1BTuZIVSA2vkrrBOvrJhpwQM3JonL3TONgmJu6ExAtrP//EsJb1M9piyWeHwn3yrWrh
         mevuVNdPNwX+c4Zlw6GIWl1au12qv6htBKq8z5z6DyvrsB9ZTlsRvQy0RlnTBSsJLQso
         mVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228586; x=1794833386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mG9Y8k2vnChqxaqg4HKskuIcpQ6X4WU53zywg6kGBHQ=;
        b=XtB98yODQJGM6jPGZjp9EHeB7G01vbgbijoHed4uOqr+Uxtvy7+DmwOPA7Fch2LnVO
         6k7KULHpv4VJf+KSBPV7PSDDIwEV7fM2euqomaD8ZQArbCVTSFr7NtZMsU+VP3yNmF/I
         GyXL4EZxgWsErkJAvxB/Gk4KbtILeEbn2Q5mgsgwqogYwFcRaW/6L/kPuvL8Sb7fMcd6
         1D9WoBOcudYIX5O2TEqbnnbobrTqf6Yftj0H2WzoIvY4Ww/vNm3I3JrGFTrtKRuuHwZb
         Qv7eTQ/8DrsCjyC2Fp8WjracTupbzHFCOW2ua9DIe/bAv9aMO2xn+Y52+2bDxXJw7e2i
         NYkA==
X-Forwarded-Encrypted: i=1; AL+hErEy/bwkD2gacussHNx8wYhNGKcVMkXiDRgffmMju0q3EIcr8KlrI0lRj34/sgiGtIpA9Odn3fZJtGXrHSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z89eXvY4ql83m2YvLIFruh38jPItCF+4hC/NVzNLlcd5LFLQtS9
	08LZThTBm2xGb5kUn1TDwrXmnR5PjIWp7LoeO5aa9pysU53Qey6Ct+2G
X-Gm-Gg: AYBFou0wSyWPXB4pp23VxnZX0wvc8oqduW9k3xb30S2wRefafoAbqKyZnm+CNTTTFTP
	NekPRo0FNt9q69UnsfuoGgYJuYXBM0krRFI6jZCQ2jR7CGg7/7q0tlGpvLs0NxFR8ivtTdlloUf
	ZtOaWENzLp6p7kwTo0DA2Ztmg7heZIaNVgBqB7YhCkhL/GPsy1dygz/2sLEFLcExDxGPGPAKz/9
	86F8wahc40eHnqso5JTXhIM+xSoEjyAv1deGgRtbzk5UFO9KvCVYOP4L7lvgkIeRK/1BWWubkPg
	x1A2hXJeK6VEo5eeTdSv9L65CiNFmetbM3AXX6AOeQa3w8+CxOo/d8j1t+pClhqMEHbJcaDMPOF
	KwLpgth2lIBYsYTNVCw+cahD+pYb4/yclmf9S2mDPyK6+wzzeolY1fqYVDn0ycfFxzxs4TASKQN
	fdHpNxIgXrnRPu6YlNdSSmCWIatYranwqct5X03DDaSoj052QIY/wCAseQVTo+9Askt90UaIg1y
	TSIVD4C5DuEpy1r1vswokZE0Qib9HYs+pzMoK8FGJ6MUQtGRLdrVsh9YRtHhKlAq5zGYa5Tpp2W
	sTtQQY6vcgUyhFSd7/Ew+xX1XXC1K9ivVwuu7k97qROlfQcf
X-Received: by 2002:a05:6830:6810:b0:823:38f9:ea5d with SMTP id 46e09a7af769-85f5078a13cmr3054227a34.11.1794228585816;
        Mon, 09 Nov 2026 04:49:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fbce9cdsm3565509a34.20.2026.11.09.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:49:45 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH net] net: wwan: iosm: cancel adb_timer on cleanup to avoid use-after-free
Date: Mon,  9 Nov 2026 21:49:33 +0900
Message-ID: <20261109124933.1603575-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

ipc_imem holds five hrtimers.  ipc_imem_cleanup() cancels four of them
(td_alloc_timer, tdupdate_timer, fast_update_timer and startup_timer)
but not adb_timer.  adb_timer is armed at runtime from the MUX uplink
aggregation path (ipc_imem_adb_timer_start(), reached from the encode
path) whenever aggregation is active.

If the device is torn down (modem reset, PCIe unbind) while an
aggregation window is open, adb_timer can still be queued when
ipc_imem_cleanup() returns and ipc_imem is freed.  When it then expires,
ipc_imem_adb_timer_cb() runs container_of() on the freed ipc_imem and
queues a task against it, a use-after-free.

Cancel adb_timer alongside the other hrtimers in ipc_imem_cleanup().

Found by static analysis; not tested on real hardware (needs an Intel
M.2 7360 WWAN modem).

Fixes: 1f52d7b62285 ("net: wwan: iosm: Enable M.2 7360 WWAN card support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/net/wwan/iosm/iosm_ipc_imem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
index 4405c85..20f8da5 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
@@ -1239,6 +1239,7 @@ void ipc_imem_cleanup(struct iosm_imem *ipc_imem)
 	hrtimer_cancel(&ipc_imem->tdupdate_timer);
 	hrtimer_cancel(&ipc_imem->fast_update_timer);
 	hrtimer_cancel(&ipc_imem->startup_timer);
+	hrtimer_cancel(&ipc_imem->adb_timer);
 
 	/* cancel the workqueue */
 	cancel_work_sync(&ipc_imem->run_state_worker);
-- 
2.43.0

