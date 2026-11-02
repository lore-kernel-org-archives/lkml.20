Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647083;
	b=utNDR74fzxqnxmRTNZwPtvH6dQ0u2kRm3gwCX/MLKnho8O/4Z8S8eMEHmcJzLyacWr5Q
	 XNEPxFyuAT9BpTOau9lHWwM9gaVlONGkYql1tx8fgdiDX9nri7BKiIPxVG46OtysPo+v/
	 MPuU/YbNIjuN74OVT3F04W9pJtoIA7+TMYl+FM2kGBZrZBQElX/xNWNKQaelDH7Qn6mk/
	 3qsQaibWyiQwxCyVYsVRgWFdST1wcVMBV2cJu8mL2wDOMaKivR2JY025n4DPkaBWbgnj9
	 wTYPzixDs7VFTeQ/LvuovnbW2e/q/wCNL6u32mIXI0CFPyJ0nTzkeqFJovD9Mu7OeuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FOqLSFlmXa9VNiEma0WSAldud1u92mwnEYoycTmoyt8=;
	b=tSY+JnFGNayJ+KicRcUMzKBubV4tK7slRCvZau2wo5TtMpmzR7UtqRNHXyT7442Jz6K/
	 rjUwpRw/y3hBBTuWU4ffZaA64bO3+d5fRn1667OSn/9thY1N+IGFnWdeQXBztycjUMMMv
	 5PjZYsnYMNVoO8RBgL3PJGbMMkxI4H1/iSOpGnHUsajuBmxW3vqPa4xTWDAjq16H+7/7v
	 1srdEUwiqqoBxZOO8ZmBL1lqPlRKbtxO+RnzKzmWONAU5R+a8beivKmUXaa5rBgWadOLv
	 IXgaBNuzV/5PbcIzGMsvmgy5fVyT3Fxe/dSu9DouwRzCDZoPRN4Qpl7f1Ep3NeMQQ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhHLn3xy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1A606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B1A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhHLn3xy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so27105545e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647081; x=1794251881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOqLSFlmXa9VNiEma0WSAldud1u92mwnEYoycTmoyt8=;
        b=PhHLn3xycdnqVLb3UZxNFCI2+foitR+doRurslWo5zWx+ZuP9erhNAZazc5g1O0AA7
         X3Dj9KyynQ72xjN8X59OjfADJ4n8/IjNB89lhHSMIcWx9E+B06bZJh/zJyZf85Hz7VWi
         jEN2gJX70m2yjwrEpabO7JETQPqER6gctdfhUkRYvHjGFzm5T9Jl0xuz5CBEgPwNgfQ+
         PetEMH5SSAwzoMGT0s3FOrcikTWDIo+yHfkifKuKR1f+a0h6P/q/Tun6Q/0rbYobI3rp
         //3gM2yDju/NXhqa6VVeP0xHKMpS7vEj2KfNgt/mWHDl8M/CYit+OfEsHgX2YTM00UVt
         c+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647081; x=1794251881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOqLSFlmXa9VNiEma0WSAldud1u92mwnEYoycTmoyt8=;
        b=FxeOAdlCTVfdMcrb6AXXPYumEtt7fRmaWUOBlUMGapABeShQ4LI2gbO7WNedN+ONFJ
         tMToizBaGHpjmTsb8gAFx21qCBhavO5SBKv0Em01yxfs6XWebjndzp4GuPCRXz8eniFX
         TJAvfpSqWIviQRXnAnZ894+wweXlL+l6NWVCAvhkjJh0vUb4wmoXib+RHF6HezZqZdrx
         /m+2YMSMrq0i3isMToz4NEEjLWSPGxzieBfzJediEIZmt9d3IHs6jAvU7vrMXUYgf5uD
         BgMBQXuRQDBKjpexvgvzKG2AJuPC4KIXc0w6/9WGtdyOR93NqrNKG8UsZ/vtNK21yFN2
         D/8w==
X-Forwarded-Encrypted: i=1; AKwUvBwytJyj5DUxVbExGOQViuSbPXIgbQza9bPxmpJPSFqRUQR7f2DZ+4WJWbmr7Hl9vppcWkJZpMhxmmzf5Vo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL326G4qDFL4Hb6rJFQE+7IQrLVb1sfFHxB3s84ita+o9lDkBla
	fDQhFbnoAumJItk1gcgL5fhc+Rg79UYe5jv5SpfQn6mZdkbkqjpNmDM=
X-Gm-Gg: AYBFou2nnYwK6FJ4GGF9i3S2159As4qqX/GyFKndGoEw/jQzZwDqXiK2Prv6Bxq/5RJ
	KOzyAs1AS45OMY0uHDPDWyW0RPSDMw+zrHnuOUzt5YQqVteB9ncS3pY+CGy2cAcfX+e2BW1rbGs
	iZxrtSuTjA0noL7SmVkfngCCDcGNRdSgcqtaJsDI+rGjhVAC1OMlwKb4JjW/YQ+R/e7nPLoLPbo
	9RjPnNzg9og5LZ10CY5ratPYxEHzNTpndwFZdtKzeuk6adBj/WIZcoaL3vEU79kmbYGeEiataS0
	ZeJmn1Hrm2L3FCdhzX8M8UUrSkW6RtHloXtXec0MZsdOJo2glsLTXWgXlJPPDJr5YLrjvuuwUYY
	NGbfEKWJHtN4H5QpAQc7zebju4wczNq3KEajyL3cydPGthAUL+DnA0KgGzM0oINpUm7BKe8cMUd
	D57FkPNmLrLDdmckuF8vHVpli+bgZ81T0O+xN9Trb4i28clbXd4jQKQq8gfTCXslQdBTG+eMHzo
	zjuG4mTqL39hLYQBn5bI1BnxuxmUSqFdzJmZUYm3QwYGQVl7FzAQ8HfVlrRYzUEMsAXCdpuJn1p
	SS1iLQyRrGjGi4GatsCrQwwF8OmDwOST
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr267450095e9.2.1793647081411;
        Mon, 02 Nov 2026 11:18:01 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm21054948f8f.47.2026.11.02.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:18:00 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless] wifi: mwifiex: cancel DFS delayed works before destroying workqueues
Date: Mon,  2 Nov 2026 19:17:59 +0000
Message-ID: <20261102191800.2309205-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

mwifiex_del_virtual_intf() and the error path of
mwifiex_add_virtual_intf() destroy dfs_cac_workqueue and
dfs_chan_sw_workqueue without first cancelling the associated
delayed works. Since destroy_workqueue() does not cancel pending
delayed work timers, a timer that fires after the workqueue is
destroyed runs against freed memory.

Add cancel_delayed_work_sync() for dfs_cac_work and
dfs_chan_sw_work before each destroy_workqueue() call in both the
error cleanup and interface removal paths.

Fixes: 85afb18621be ("mwifiex: add cfg80211 start_radar_detection handler")
Fixes: 7d652034d1a0 ("mwifiex: channel switch support for mwifiex")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index 936939ea9c472..1fe366b89a2c2 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -3196,9 +3196,11 @@ struct wireless_dev *mwifiex_add_virtual_intf(struct wiphy *wiphy,
 	return &priv->wdev;
 
 err_reg_netdev:
+	cancel_delayed_work_sync(&priv->dfs_chan_sw_work);
 	destroy_workqueue(priv->dfs_chan_sw_workqueue);
 	priv->dfs_chan_sw_workqueue = NULL;
 err_alloc_chsw:
+	cancel_delayed_work_sync(&priv->dfs_cac_work);
 	destroy_workqueue(priv->dfs_cac_workqueue);
 	priv->dfs_cac_workqueue = NULL;
 err_alloc_cac:
@@ -3245,11 +3247,13 @@ int mwifiex_del_virtual_intf(struct wiphy *wiphy, struct wireless_dev *wdev)
 		cfg80211_unregister_netdevice(wdev->netdev);
 
 	if (priv->dfs_cac_workqueue) {
+		cancel_delayed_work_sync(&priv->dfs_cac_work);
 		destroy_workqueue(priv->dfs_cac_workqueue);
 		priv->dfs_cac_workqueue = NULL;
 	}
 
 	if (priv->dfs_chan_sw_workqueue) {
+		cancel_delayed_work_sync(&priv->dfs_chan_sw_work);
 		destroy_workqueue(priv->dfs_chan_sw_workqueue);
 		priv->dfs_chan_sw_workqueue = NULL;
 	}
-- 
2.47.3

