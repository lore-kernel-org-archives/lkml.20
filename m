Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622204;
	b=LvJJrSRjNBUcr+eJFdAieC5fPKDMBitLyujDclGtFJNiZvQkgrOFTHX34uvu4XswzDYy
	 PHqev15vg82WPil4zjYh544/R+0SKQuv7vMc4yH0iYSFhjU4n08HU4quuYc4AUOLXoj7o
	 vx8rUu9zIcO0tpkLFNM2jdyiaI8Lw1t239r/ryEmmgG83o0oLWoeRT/XtsecXpJL9x9Pv
	 IZcgn78/uB7czP2an2Q7y7JSvs+tFdSZqy8Dx+jlcG9Gj0eJUqyYy9zxGpxyEwcl4Vdcx
	 tJo2Q/Zy+ZMLfglRwmyfGzNINQknygiehkbXUKFlH/nXUDvbyWbhBM9n8Xxw2QMbyAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gKgdPxUwvGsj1jITDycK6PgHkA/hoEEzGZT6KHBzS7I=;
	b=iwgOk6idCZRe/wn8j99+rITFZX1tn3yFscCoHhBCZH9VH81ZNzJ6ZmsLxkTHPswDpxja
	 nWCuIHLnT4dmOpA+7BwWTNonPEUrkul7VBf5H21hQhMzEu45he9wAj/as1gpx3+hO0x74
	 APkT2QXwHT5ED8jpYBZl7bFf9G6Vwd3bO/4lXfuFZOQqHJx8fqy0dJk3DrnujqCiKR84T
	 PovjemQUBdSGr0odUzJonAGKWHLm3MvhtODs3CO8/cEptdpOZhaQUbFaeMpp9naIqy3CM
	 CrxkzuXwuoYotMXZET7j1Ue+cpbNwIHH7qvJKM4IdMJPg0u07j2IX21aOxTh92RpwKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eqUQ/aSU";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B9E60A6F50
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47B9E60A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqUQ/aSU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18457435e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622203; x=1794227003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKgdPxUwvGsj1jITDycK6PgHkA/hoEEzGZT6KHBzS7I=;
        b=eqUQ/aSUpzOH/ouqbWd6Z6zeNty80SmGLbcaZU3kusNRz+1m/u/i/RSkegJ8/Sou7S
         gZQYnwajklbBSa5Lw5km2FvzhIy++XDjVGW1inLAj+Nc4fh/ih+rswNlYuFPTFU3AZkf
         5yTKbS8qNdo/L6V7n0sIDUYtB+voTA0rt2wx401gMbzpVeP5c4yTJOYAuI52p53ixdj4
         aMbs8tJHwDQvrU67SgmeZI1vrqQ1P5gvnqcP9u5zLRmx42PR8uYlRzFmzDMCRytDvLO3
         NlcGOgBRsBtn8DoRK5r4hs3t4L/hqIWa3zbfZyIKjIWXXLges79hhlvd05RZHkq8lREU
         Ei5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622203; x=1794227003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKgdPxUwvGsj1jITDycK6PgHkA/hoEEzGZT6KHBzS7I=;
        b=AqgIp+3cXemIQSIjOThEulOn2BnS/reOgXClFOxB+crOJTMZiyoBsT4Nd2b3D+knbW
         yyDdIdc8vLUPsBTf2rQWtwksV1fFLjoPhi/bkOJJAH+SEGRsu6pm1y23igWxMlg3HA8Q
         kkf+kD+nW6b4gH4EO90+UviHoqdl+toJqZhTJ7AZx+fQOWNyK9NQQYKPtOZpdTRoN4Qb
         /+QIaNCNxjEJHkN7UpetrP8aE8QwNcRcKIgUyIx//z6F2sQH3ljEC4ivGPA7rERWBEku
         xRTFwHo7IZ5Gdiz6bBzqCmEvb+bPvgwWQt8rqzBT4OOgqcnkkEF/qB9Fh5puQOixW4Ck
         py1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNqPdjeaTYetnRf/wQs+Wzp9lntzbatYfEcqs/zL01ZK4D3aVVEDCtAR1IQ4oEc0t6Mtws9TfwYzeXI7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4DWazAGBbq40ihLzfa3a9R073N5+yZ4hwvQa2UqotQQs/4F5G
	jsEZ0hLPI1xA80jFFcCITYndrfkA7Ah1GkvwcsRp0BYCrWUJnqu3M/8=
X-Gm-Gg: AYBFou3ApXA0THuGjTZ/ANlUr0mJLff2GD8kjfWF1ufFuNF7MGrfwEN7zzpmEQJnxNI
	pLSVlpwr6D+YVc5TL0HNWbrh/Y3uxxzlt2gVzI5SHwFWqe6QmSMKyVJYMr35XulvQYYwRYTDE1F
	OAj82GF+m7locr8AVOAyKiWmOPL2V/2xsDCyJIUalJo+kt+lquhcTKHLKpIjHYkBwa82BglwFG+
	ochdqHSKW9BNMYRODs0XNIYwdtO4Ab9HYjshW/bO7wai9DGakSs3gYGDS1zL3unLUwW2XqDLopN
	a+wRrMESMva3Q5M8zOg0RtMpige4tifDLiceHD8OO/m3ANx4VwnRDmClggv8wnsLtAS0i1dDgHX
	C5MNXS2SD5ieD4M01bDskhARQSPzhnQV6uDMeyNHOWIX3yY6U4uQql/KTzeONsREapzkO5b2kS0
	2w7AAJPXerHNFw3zvyuogRLvoOrBAMZbC6YgertAGehTUYkqp1JXNdglD8a5YV8eB6HRC3XBqKB
	CxKnGCeOi/aAX7FN31y1/6Zj0vp9EaOu8DeHoPbNr7HPc9yv0xg91FgSSxFyIxPL/4BvaOAhzf9
	QQ7K17DVCIDbvcbc1iA=
X-Received: by 2002:a05:600c:4e90:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4ac175669e4mr221304045e9.12.1793622202606;
        Mon, 02 Nov 2026 04:23:22 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm255490595e9.8.2026.11.02.04.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:23:20 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless 2/2] wifi: rsi: zero-pad SDIO TX to block boundary
Date: Mon,  2 Nov 2026 12:23:11 +0000
Message-ID: <20261102122311.181075-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102122311.181075-1-tristmd@gmail.com>
References: <20261102122311.181075-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

rsi_sdio_host_intf_write_pkt() rounds the packet length up to the SDIO
block size and passes the larger length to
rsi_sdio_write_register_multiple().  When the packet is not
block-aligned, the SDIO controller reads past the original data into
adjacent heap memory, leaking stale kernel data to the wireless device.

Zero-fill the padding before the SDIO write.

Fixes: dad0d04fa7ba ("rsi: Add RS9113 wireless driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/rsi/rsi_91x_sdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio.c b/drivers/net/wireless/rsi/rsi_91x_sdio.c
index bfa386b820d89..8bfb08306d03c 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio.c
@@ -772,6 +772,9 @@ static int rsi_sdio_host_intf_write_pkt(struct rsi_hw *adapter,
 	address = (num_blocks * block_size | (queueno << 12));
 	length  = num_blocks * block_size;
 
+	if (length > len)
+		memset((u8 *)pkt + len, 0, length - len);
+
 	status = rsi_sdio_write_register_multiple(adapter,
 						  address,
 						  (u8 *)pkt,
-- 
2.47.3

