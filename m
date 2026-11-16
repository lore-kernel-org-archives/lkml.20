Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796505;
	b=VRomVZFqPX8m75NtStSLdEfhlQdUGnUFXGVpnvtwIXxcbGBmb0/Ab5lTRSs48X0mOE1y
	 JZm81i0R6cI3T94iabkdA5N0jlgxajKYNbZp2g34IsSUJ2L7vEnQSHX4NZEvkDZjbcNLK
	 Nk4mhak1dKsdS0iZ/FeDiGZ01ZtEKyj9EDRZ/m+sd0NFmAYW9xteiDjaDAlh30syifckY
	 LWV+7qmNvZpEE0wp4GIvJokCwQowJ4HEsLz3pfi/g/q5VsnU4gb5bryW4/VXk+pKbERk3
	 oKqjrRg2z0/zp2NmoeXRD0RSc72ZhLg5Rg0wFi1uKA7WDsIAsyeVdKvJjatD6h26aow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+30GbQt49RMaQZxcPWjKgejVf+ly98xtC7JnE7Ukrtg=;
	b=rovdL9qx8ISK1xEVbow8QKdtHUhkESpiMO4fMg+5aV45UakQLzB441UTYFjrJ4Y/pRqz
	 ILsPU70YjT5PUmrQVEaUfqZkX3VL2RXK82B2FGAjSJGZfcccHb0b1u8ZOk6bF8UZoC5C9
	 92+xHecv1P1NPqFWfAXpO0I3XmEwF+29VgWSgiMO015Cr7ivBbkT0q/v075fmZIyGbz+O
	 IOWD0a1wTW9XeOqEJbBMp6K+w5x2gA1k4YSyz8ZA2rIC4a2lLGoCdJNjebunwTAfBZ/bm
	 6gTMWqsZO8hcsbz+f069zcNcDjIyml20aYSE2h32iu9ZqdZ/gjcg9CLF9DmcbNbWLTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O1T/RW2g";
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44062606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44062606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O1T/RW2g
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55d2d380f6aso11517371cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794796504; x=1795401304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+30GbQt49RMaQZxcPWjKgejVf+ly98xtC7JnE7Ukrtg=;
        b=O1T/RW2gTXx4anSr+Sd6NniszdjK7SXAZfXCoJRntf+SMTcmG57/3zTxXRTXC4uB6n
         dQ5MfWwtVFhRLp94mePLJrZ2N8AKvJgAlSDA39Ef3Jp2IIDX8sB/VvTvmrN4ySvf2FMR
         hg1j6vQSdJ6m4Ui7mmJy93E8cMSnnRfIJg1AoT879CBOepsk71N304AbPi+7YqIqqz1p
         zK76Trq/c3r8fa0178lDDf2KPjG25/nRF63xEw8ET0qPeGRHwEJ9iSzg0/pYK22zH1bh
         U/vjzL8aCQcpTS3NBh/1Nl10pbsevl5AcvaGFf5cOrRDfKP75zkmOOptzNVGRr8NMR3E
         wTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796504; x=1795401304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+30GbQt49RMaQZxcPWjKgejVf+ly98xtC7JnE7Ukrtg=;
        b=mV3rKek34jCILRMEU1uf3TU9YEhY478Yh60TQxsVEf0fsNikmbhCcQBZ1iTyGb58wE
         EZP7HaW9TKhXZvkxR94XI2GmLJCMpBFVIOU3iPAIYp6qd6z6uHSkoR0UmtqaqyugRYvk
         WCXEID7UC2qQ41SiZqyurLIJ+hL3oXUFA5A4zWt1RIgB9uLyHGvcM9NGLarDT/NdNzXg
         IJUbdHlllZEOV2P9MnGTIiywsBQBOG1YzixekbBfffrCzvlg/ufCUXOVUBKkFXgkUcou
         dvFMj1Ss1DKTDp8yTwig8wK7ztECXt+I5M3pqkWAJag3UYsD4RV+ti2225XrJ9twUjB7
         btjw==
X-Forwarded-Encrypted: i=1; AL+hErEAO6/ATcDL6rEYI0wpQU3AscilzSHQz9QgKWby4lYi8FN+evTlx8K9QfgVDsrWbBaH711m55yeW0cvY1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qBbArUm3I/zmsvM/ICeVMVR2GGN1j7HOP0zmkrmWRMdV6K3vG
	1AB2+8ONTeGOYVmgpXX6fJtklg2ZFtBhZjpqpUN65FOtOk7Yq1gf3Jl8
X-Gm-Gg: AYBFou0pYShOlqqk/6VtV5XCntuaTuAXfqnVtcMzM+i3fy7rvFnuFRKXzWvZWcLkTmi
	ukLKCrakHI90s74dJ5iHZgIdB0U9oyWPPDLIBDVcptDUhseQeeX74HT6uUmM31nuzUpP6MQVJgq
	/nr56frgdPv69MH+1Crxo9ywO+Epuj4xzupT+9iSdl8mI4AYc4Vn0rRSXpr3Ey0sg+5FzdIz6dD
	QG/ApmUKb/dkxoWBYa5JfNL2K7L7GkZ4ghFJez9VTglPvd2Adf34kYRgYMzIeWDo3GISRx0OYBy
	3gnGL94O34cYuMna0j/yVC/nfSRPhnVtHOG4Qsr57689CA1uOMWw9qOXs6iGq/UnQTg+JEHKbim
	d+oeiSQCbstiiEIyEvRPyLzzqDAu5MSN5yBv6p6lGueEr8ERfZvazkeA+hmixTL/uFssDHDJ2G0
	FNpHpTzK0PphuUK8VFDxPG8ShqIvv4SBd6tcpWgsunuv0py5Lr4oiRfWfMZZkU/VwqkNj4pXVgd
	+XbkAJFaxGCilLr7PKVnzCxi+BE5RB/3WHp4tPTWB1nDAQ9gbAvj37Uf1zD9yqrB7Tmcme/54Tf
	jVO9vn3x0xNfGoJ4+BPT4APQDgLtsAN8qvWp5hT1bWbl4LgKPLr4m/Amm9GnYoYvoH+HnWKnd9E
	=
X-Received: by 2002:ac8:6f13:0:b0:55d:3789:8c8e with SMTP id d75a77b69052e-55d37898ed8mr37604981cf.15.1794796504192;
        Sun, 15 Nov 2026 18:35:04 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b11d9csm72535261cf.28.2026.11.15.18.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:35:03 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH wireless-next] wifi: mwifiex: hold ack_status_lock while freeing pending ack frames
Date: Sun, 15 Nov 2026 21:35:00 -0500
Message-ID: <20261116023500.577610-1-lcy8047@gmail.com>
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

mwifiex_clean_txrx() frees the frames left in priv->ack_status_frames
and destroys the IDR without ack_status_lock. It runs on every
disconnect from the event work, while mwifiex_clone_skb_for_tx_status()
can still add an entry from the mgmt TX or data TX path. idr_destroy()
then drops the new entry and leaks its skb, and idr_alloc() can write
to a node that idr_destroy() has already passed to call_rcu().

Hold ack_status_lock around both calls, as the other users of the IDR
do.

Fixes: 808bbebcc8fc ("mwifiex: add Tx status support for EAPOL packets")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MWIFIEX_SDIO,
MWIFIEX_PCIE, MWIFIEX_USB and W=1.

 drivers/net/wireless/marvell/mwifiex/wmm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/wmm.c b/drivers/net/wireless/marvell/mwifiex/wmm.c
index 841505e83c7f..b889a58c7f6c 100644
--- a/drivers/net/wireless/marvell/mwifiex/wmm.c
+++ b/drivers/net/wireless/marvell/mwifiex/wmm.c
@@ -611,8 +611,10 @@ mwifiex_clean_txrx(struct mwifiex_private *priv)
 	}
 	atomic_set(&priv->adapter->bypass_tx_pending, 0);
 
+	spin_lock_bh(&priv->ack_status_lock);
 	idr_for_each(&priv->ack_status_frames, mwifiex_free_ack_frame, NULL);
 	idr_destroy(&priv->ack_status_frames);
+	spin_unlock_bh(&priv->ack_status_lock);
 }
 
 /*

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

