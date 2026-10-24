Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792864629;
	b=klHOWlDH1hKw+s91aqUun/EZcGiZEKAA/n5LAcTYPKjzAUn2ufAaSFRU3bNAxkh5fEM2
	 oULc5SDMHGABn9A5nEENcp//GgrLZk7mkq8kIa/ZlnJElha8jvd/EcpNUvloTpuMrd23+
	 Y5WWHk1pyWyzHSkmrvpZfbmtZyG+cpplqYYtP51t1h8UDusbDsPR8oPNUkUpDOshEBj/V
	 dMxrqAh7XWZ/gTEIrba5RCBBROvsLUra+3V0KdqdhmVoQRCVtjKk413H3OZGKRvQMO7Z5
	 4b0DTs+NspGn7yPmbw0aCQA9kf0s4BE6n0dV7LFNAdY33hMj96X8WfrEJwuasqEazag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792864629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gHrHyM/5fyejYWNArNua6ZlvykMFHKuFZPw+M6rELIk=;
	b=oiWnZGGYk2DzWxpeOcMslcDxa4EJAtSdDpBSltuyFRo01SqbQcfY3YkKu26qjiJkb/f1
	 gpxLYTYhZ75u2KrileyTxJmpAdwixvyCnRSLhaimGYjwqXguOOGE4DO+WrWDKX+qqBSMU
	 3SjJonhy6V81v8xd8L8iVC5HBYrMuo+F0sGOh/ZaayMg6rKkWoFSu7Y9NQxs30MB7QoaL
	 e5yDKbXuDWjDGqmH1ApJYYyu3pGoeWV/+cjzXBVqlt7hTJuqxemvxUVAA4l2vl4B+5Ew7
	 8I6K0CfX6OaQz1ijsKq43NZgcC4kiXgAktn9lhdPL6RuINDwA1jFH0dUqZmMk8/sBvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Je60pJkw;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB76E606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB76E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Je60pJkw
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35b2c599f43so726890eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792864628; x=1793469428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHrHyM/5fyejYWNArNua6ZlvykMFHKuFZPw+M6rELIk=;
        b=Je60pJkwg0vgqa2pDwqVNdZXAhghgfLuN8UJmrVfOSukQHu7PRbeMS9eCcC4R5xZf3
         9JLcX51AOLhxYrqn6H0zNlkLtYyd0LKc9/NagG8mtBRr6SbZNTUa0DPHS2YPQXG76H8b
         1dtY1CIeQ3w3QUXwMhYOKlUf+oVPrvYb/bPZEaG622fNrbtzsEq5HHRiVm2682Kq2L2b
         jW3TcjvScO118Qqg02mNgHRt/wi7sQCsQCIz5CxbVQ4MrDhBpHYp7aavDHvf2w+VhlL1
         Bu767YO1Txx0oWvo2loz9hRNnlxnfHZmRFwde92bohGwWngNzoi3p6BEYNSnCBfLPBv1
         kkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792864628; x=1793469428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHrHyM/5fyejYWNArNua6ZlvykMFHKuFZPw+M6rELIk=;
        b=heyBSvPmQ26Fc9IbAXNJ6Fz40rD04O+OIk7TlulZyir7sJE17efB0sg9L9prAeRW4c
         qLljLh5njJdX5IWKq+l3s5BWbrlwX34iV5Bc1DvBF2LWrrc+Js86jbJklGiOe0QYc5Nz
         QXa+Y5IPv2adjuic/TkxAMrSYo9ffYORh2eo2owBFXEW1p4uAUXm/ZeY5pt4HVlvnl92
         +evqfdXMqRE4ZYeSnZ5tWpL+qCzesg4u4Dyd96BNhwGvYRG9VsvMDilXPMwJNX4TZbe6
         I9uciB30GdVfYcDm/8FwbLAtxPd+lFaYH1ohnQ4e+8VPvJzO41tAwjBB5RWHwQ1Gr6/o
         EhzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0nq1Ivri/yllC/C+RTi/bAhxEFn2GcjF9xXhCw665iwjmVsqTuuaCrQqP9MSrqDdXEqOTKk8tMLBYiTM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG5mML6r13Mryki3A/0opSVJ3PJC4ev8+f4Sm9+84TEeRTVSXk
	c9qy9cN9nNr4wopCtP3AzQuvxWcVPXEKfpGRUmh9j5ohBf/MLwOye6x/
X-Gm-Gg: AYBFou3BfIrrg2+aEIqk5Oa3xP2INOS//mqaotCTvPGl+9CmR8wxav4uxUp6/cQ7/Cg
	1p9u6z22uleW8Mx2RdbIyaVqZk/DGgyOvg9T6jCqltEIdlH1RaP/LGMHFc/8KDzGAKGKi0JuqRz
	rYG/utFHQKHsSvtmXFfh2BhR8T2IxAokcYFyHAmcbKkvye/TCO+SsS6YUDpU3hNmZDEJiRI7T2/
	N9uByK2q0tZDdx9EizXHSOfRWvRsxKdJo0vFS3JXpwMi7W+aqI4BD6fcTP5qHH3twdy7ER41SKd
	GUQZ+AOhwx2+ZapXJ50mFcNFjh/+VxoQW54RxyOJU4f/VfGqt1TXr4yfTeGOCzsFhLt5UzpxF33
	+RXM3JtRKikyGQVO/uLFs+OYT6KvFct3Sucl3kMZpnCVoXzVU0H3NkI9ymR0l56XVbTmjMhFSSQ
	KN3k4/cJwicw64rgo41JfHqHvT6kKWVd1Lt8IUkO/qmatAUHNNIhiCMIozoEz83dt6TOQpjinNl
	EY1FzB5W5smTC3sS5+nZhaBfLkoXVIFVgblgkZU6hGbQcJsRv7yBacGuNcbK+TcdkCCPHb+GhzM
	uZXtQ9cLeeM2Q1UniexNd6r06CUiaPf9GRoEWDmiiLYQeQksba96MdEmIIBP8/os5cener/CBeh
	BktfZzhCnXyU=
X-Received: by 2002:a05:7301:fd02:b0:342:645a:5cf with SMTP id 5a478bee46e88-369e830ed89mr3796698eec.1.1792864627754;
        Sat, 24 Oct 2026 10:57:07 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d5b841sm10684217eec.9.2026.10.24.10.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:57:07 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: proximity: sx9500: ignore event config writes that don't change state
Date: Sat, 24 Oct 2026 23:26:53 +0530
Message-ID: <20261024175658.130546-1-kapoorarnav43@gmail.com>
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

sx9500_write_event_config() adjusts the channel and close/far user
counts on every write, even when the event is already in the requested
state. Writing 0 to a disabled event and then 1 leaves the counts at 0,
so the channel and its interrupts stay off while the event reads as
enabled. As channel_users[] is shared with raw reads, those can then
wait forever for a conversion. Writing 1 twice and then 0 has the
opposite effect.

Return early when the state doesn't change, as
sx_common_write_event_config() does.

Fixes: 4193c0f1d863 ("iio: driver for Semtech SX9500 proximity solution")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Compile-tested only (W=1); I don't have SX9500 hardware. Both write
sequences were checked with a userspace model of the user counting.

 drivers/iio/proximity/sx9500.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/proximity/sx9500.c b/drivers/iio/proximity/sx9500.c
index dadce9b44227..26522b6c5a2d 100644
--- a/drivers/iio/proximity/sx9500.c
+++ b/drivers/iio/proximity/sx9500.c
@@ -548,6 +548,12 @@ static int sx9500_write_event_config(struct iio_dev *indio_dev,
 
 	mutex_lock(&data->mutex);
 
+	/* The user counts must only change when the state does. */
+	if (data->event_enabled[chan->channel] == state) {
+		ret = 0;
+		goto out_unlock;
+	}
+
 	if (state) {
 		ret = sx9500_inc_chan_users(data, chan->channel);
 		if (ret < 0)

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

