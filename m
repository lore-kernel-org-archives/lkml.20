Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E436E4D7D53
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580091; cv=none; b=D5ajhA8MJslY3oqnfaAw6NKmfQTZDJo1rW5HuzgnYnAfhlFiYuXX8Em0M5l3ST7ODFS+1IAm4UuGYPYMNNuc+zMwTrUbY/N2RE9b4JqI1HYyksR9qeTLMm+FqIYNV9gx9n2MQ4SDSUYZvBWERF4qePFfk2MdYqwS8/oKv6CAJhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580091; c=relaxed/simple;
	bh=O4fQFptbwIWGrP3i51so22Moy8UsJAxa2WB25LmlnH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FODodj/6Z9cRsz5VQRhZlW4WWou6u8pzT8oZqYriT/YHa/uMUiYBFI9hztwhpP9vyWvAnyaXmuIyd+CQszOkBCKx8Lf/5VmTQcRo/Kzi9zfELHb7bAtPYs3ClMXf+CG8gRQXBHq1UDrqqg3wNw2f95v7qWT9OOyGm1+jTtlc7v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjakcTaJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjakcTaJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso6408995e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580076; x=1790184876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b//GgrHPthUrwrYixVrlFYT/x+uXt+xKgBiSW3+vKf4=;
        b=WjakcTaJvDEo/tboaKFdS/cl9UWHlASfpBtfKZ2v/EmgDeCmOpisQSX48nh5ssgl/3
         Sboh6dMEBy3CHONGqvXLqL3PW14/XuWDlc2KAXStseUXqrGTH69hESqvLU/fmJpZgQcl
         0fH6GCGFr5pm/BNqEIuSykBmX/e7eQIwLXwpa5w2Wxp6tBRFOjKUBiSPggl3GNvLHfTm
         77MiTYzQcJktCzMEL7dEDm21FrRIFTAbUmuo5r6xQ9h8OeBHhBtHFFVhnQZb5Sckkm4Q
         5TIxsHur4ORMPxrzbfD8qHwkRYmuU4sqVsDE3eoRaDumeaArLtSCTub1d520DV+Z3WJb
         1eVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580076; x=1790184876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b//GgrHPthUrwrYixVrlFYT/x+uXt+xKgBiSW3+vKf4=;
        b=wBvZWffeTNELXtPDm5NiKfA5Fz7wAjDmMycV4+5kS+Ubx0kdmWPBXlhskZuQFSPxMJ
         GKMrkvTyd9Uo9HsJtxTXgEU5+ks/G4Chk69VINbiXG8bI581OmzPsra4hxeuIMGae24H
         U5SbeccjVPpTNquZBLotk34DoFttNMMTcn5GXkfzK98101vgKcytGPSljvJ0SC0gU4gz
         iEiE+Q7DUH4myBnwmFjj8YQqdjjlFliZPGuNYYxSr7xxqDmYeF3quvmDWTTWFUnXvK11
         x9AS5LA22nYtLz3qmicS1Gt5+5TMDu46yllrtnOFlrDh8pAy6t1rbPCnU8KQ7gioqnbF
         I0tA==
X-Forwarded-Encrypted: i=1; AKwUvBwHZCs87tAcLUFYGLUiUem2bKmhbg7bUGizxojGVszwKdlRa3hBQTfhyxOttSqBcTGdytJE+/PV6w4d1gg=@vger.kernel.org
X-Gm-Message-State: AFuF++kBs/jSBhq0R2z5AzvWr+SDbzCyYnNYt4FvcgUrHXQEipsyELop
	PF/XvbtX43yv9lIxSjPq1ptKb+a1FZSu2NKj+96J0dueP7RfM5wB3/0=
X-Gm-Gg: AYBFou3vQ7IV0kbwoBOclwq0ahg7/aw0+h03xbW3/TWb3+zq+wNtSc30ifaer+JU/nE
	zqFFC2Vsb1rQtColrLvnLMeOVxs+gb68krGG3ByaG8zxIR6UdvlHTA6a1831g27jHWHUDTwZT7O
	Tg+4ZRvOI77nYi1n0Il5s30BON+v6tz7qlR6zBkb8KtnNW0v7S7nY1zw2a8nCOeCSuSdbyLEuxy
	egO/kFtKh9po/UYKgm7YMc/rGuzACI8hEbrDonYhTkRC6jz6FDxymUvPa0PhlKP6IAZ7y5EDmQV
	F1nVysBCFqZd6nCBnC9rG80ewKVQ9x7X1IDVOThRTbsDPEMxvI3vwwOIYL/ilGNkqJaNDxuFg1G
	ABX/fC11oDJiau3StXxwfFKFLBoFJ7qeU57U8tmFynOqaeLrOetJoPuW9ilG77+Jt4Ld2MZT3hj
	XNof8aNamTDOnfNxUiChLvUVsUXwFkNW8vluNgHyJpt7nktv5FYq6ke84+//JTdm0vWLx/IkVC4
	U7q38g4bL+0F0+qbkkykrQxBnOXw/9Adzw0GZyNxQSlbIyxcC5m3KNnH9cMS1B/gTj7dK8AGHb/
	ESFnpue7B5LMhdg=
X-Received: by 2002:a05:600c:1909:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49eb7339c99mr38436865e9.30.1789580076159;
        Wed, 16 Sep 2026 10:34:36 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:f23c:f0c3:c09d:d6d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm8987544f8f.20.2026.09.16.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:34:35 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"John W . Linville" <linville@tuxdriver.com>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH ath-next v4 2/8] wifi: ath9k_htc: fix the byte count of a full RMW buffer flush
Date: Wed, 16 Sep 2026 20:34:23 +0300
Message-ID: <20260916173429.403889-3-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916173429.403889-1-nerijus.bendziunas@gmail.com>
References: <20260916173429.403889-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_reg_rmw_buffer() sizes a full-buffer flush with
sizeof(struct register_write), 8 bytes, instead of
sizeof(struct register_rmw), 12 bytes. ar9271_hw_pa_cal() queues
exactly 15 read-modify-writes, so the AR9271 PA calibration has been
losing its last five writes since the buffer was added.

The corrected command is 192 bytes, three full 64-byte USB packets,
and the firmware ends a command only on a short packet, so the device
stops answering WMI on the first interface open. Send the whole buffer
on a full flush and cap it at 14 entries; 15 is the only count within
the buffer's reach that fills whole packets.

Fixes: 8badb50cfab6 ("ath9k_htc: add new WMI_REG_RMW_CMDID command")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 2 +-
 drivers/net/wireless/ath/ath9k/wmi.h          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index 3798d3375158..2d9c14006972 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -408,7 +408,7 @@ static void ath9k_reg_rmw_buffer(void *hw_priv,
 	if (priv->wmi->multi_rmw_idx == MAX_RMW_CMD_NUMBER) {
 		r = ath9k_wmi_cmd(priv->wmi, WMI_REG_RMW_CMDID,
 			  (u8 *) &priv->wmi->multi_rmw,
-			  sizeof(struct register_write) * priv->wmi->multi_rmw_idx,
+			  sizeof(priv->wmi->multi_rmw),
 			  (u8 *) &rsp_status, sizeof(rsp_status),
 			  100);
 		if (unlikely(r)) {
diff --git a/drivers/net/wireless/ath/ath9k/wmi.h b/drivers/net/wireless/ath/ath9k/wmi.h
index 5c3b710b8f31..f9c0fe54a884 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.h
+++ b/drivers/net/wireless/ath/ath9k/wmi.h
@@ -126,7 +126,7 @@ enum wmi_event_id {
 };
 
 #define MAX_CMD_NUMBER 62
-#define MAX_RMW_CMD_NUMBER 15
+#define MAX_RMW_CMD_NUMBER 14
 
 struct register_write {
 	__be32 reg;
-- 
2.55.0

