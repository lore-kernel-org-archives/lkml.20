Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792562613;
	b=jaGTuszG9X4dKBNVTWk6GcRbOYcUCGbXnO+0bttGtCY5jErXkTzIGiR9n8x1R9Y44ILp
	 IT/c2a/HOZjmVDULgrIyQIFZe5XinyRrB+ogAXLlPn95J/bKDJWym5h74cuxBibCLJ0Iv
	 6zFpl7gXCFoEPKf/4WXz/W58olV3ZhARJyhpp9yhuR6k2fDagUwxHw4mIImL2l+QdLv/T
	 mUhVJIudrgwyDAodAj5DMe/lIs0xfoCJvQqzh3kD+yxcRtUwoEfjsKLfcjabX+8tx04GN
	 zstOWLKwH//KIginXtJbVa9T+Z9fhoPbMrnoy8rmEeHeav12dIlNnwv7VBnvJAsPsQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562613;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9Fx+jayWo8XRY39kjogNkj9yKF1VjiRx2Tqy87Qk5Kc=;
	b=ChZlElAyKLH3e8+T0pwKmRn1cG0wFnGLQJBNvAwI30WuevA0Pl2LzFZLzmxstkuN+Rxh
	 bn7kyYtete0kPLIBR9uDppMVHxXY1tSAQjGAsEwQrSh0wL+2QGDWU0FF/M6IAsZ3fZ7XC
	 KTQWtWiAjs+hL0EeWRt4npoc1xhBjATuIP5aVuQe43an1TI23M0Gg1sQM83riQHjqKPvm
	 nNTUWrbFCIqKnGcX0sZz3v1gJzqwjEmH6R3OhIdIMWLmyoqQUeSLzLqxLGRSNNQ2qUz7m
	 3fjh8FOZYgJVr5VyH1a97E/gjP37Q9H+KlfGvbN81O2p0Ft70u3VJJxejDgwmQ25akg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tfgar6fm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EB0606A332;
	Wed, 21 Oct 2026 06:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tfgar6fm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792562612;
	b=JAyaYI66DYenSIazwwLbAnOzlkyzKEd0S9s959p/8f4S4mgRB86zEIDqekJn7axT4Otd
	 GkGpJ7jEp91HRchUJBR6D8GcqF5iRWqCBS6ZqIdzUN60Vv2uLSQDnZJLC4oR6U2VR6r8t
	 Oyz3qAJUUNbshk2b2eg4ZdqVbT288hVW4g7fu40xv+5yvZRx+AlreA9HXZ31/0B/T0sUk
	 KdzsXmfF6o3GI8Ik2lQ7d8lYvY690gP/6Ad0X10I626njgUeIiEsdJuq7hzKL3uq0PDQD
	 Ft4SHEbe7U/vr04b55GwsvQHHpeIZqMHb8HclO2vfaHLpBP23TWUSqEt+EgBA3wuZJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792562612;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9Fx+jayWo8XRY39kjogNkj9yKF1VjiRx2Tqy87Qk5Kc=;
	b=CbSKRS13Crw2SCAszTkKlSTht8lYo7a89HMtYePxWuUhd3TMpChr0/gQrt9GxCp4ayFc
	 AVINcMefqHKe20MsH4yqAwqjrboJlx2tGESs1wY+ofuxhzY5SzW8SjrneEmgReajYjZfx
	 AT0pHXkC6P9u5nj6DKX+Y/M91VJuyVkOIEankD+MnGs1ioqaDmGZYdz3sdMAYYsnBsnyL
	 usEWKZbmmnqVkeQqwHnsa97aagntw/vGZUQiDZA7l69R/69a6C04G+lObDJeIPLz8Q/yH
	 HLSdGS2GiQTdV5DlX97gv98zaSBiyI/VBXiKSomLPAaBIDWsdH8wlY13iIBoIhX4j2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88ECF1F01574;
	Wed, 21 Oct 2026 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792562612;
	bh=9Fx+jayWo8XRY39kjogNkj9yKF1VjiRx2Tqy87Qk5Kc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Tfgar6fm26vi50kuVhHKWCSOYf8zJLOj9WfUlFmtDSW31JW088b2hyRtlkkpz0+ru
	 W361AWYPEkvUy7XyHs6841fsl1KJq+xHBlyR9mTe4A2iC9JfTV+UH3mqQVAlG8IeW4
	 ycodQjTYdQ06Y5UajqS/I582nrc97ollLQRIj8ulkVl6Vs3zZfsetFBU4tB3YBRz5s
	 X6D6x3KAOl03e/S3+odHnIcL2i8MsoTSLaqjv1P35MZQjnSJiCAWghI4V+mB3pmrrQ
	 W0B0DAa9ICcYDLcgxxf2FTTYjb+dzLdQPUHjeDguGP6t0inRqentTZrW2T8k9F1RZB
	 i3ZzYH8sYGaLQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 00FEE432DF;
	Wed, 21 Oct 2026 06:03:29 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 21 Oct 2026 14:03:27 +0800
Subject: [PATCH 3/5] media: i2c: it6625: report the detected sync
 polarities
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-upstream-it6625-dv-timings-fix-v1-3-5881babdc4c2@ite.com.tw>
References: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
In-Reply-To: <20261021-upstream-it6625-dv-timings-fix-v1-0-5881babdc4c2@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792562608; l=1444;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=HPSgHM3Y+fd8cDiU68xcmrplgXw3v/Q6cYK/4GDwOYE=;
 b=Fltqk1otKEOcTWFe2uWOLbCSM/tnXN1Ur6bY17AZWt/DkAoMX3p3QWS99VERVYZ+RWHR12951
 BbxRiwUeWLFBn1KW/uCwquCqtRZ+Nd/xu8aCSmvASztP4JT+5bFLGb6
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw
Content-Transfer-Encoding: 7bit

From: Hermes Wu <Hermes.wu@ite.com.tw>

QUERY_DV_TIMINGS always reported negative horizontal and vertical sync,
because the sync polarity bits of the video info register were never
read and bt->polarities stayed zero.

Bit 1 of the register is set for a positive horizontal sync and bit 2
for a positive vertical sync. This was measured with
negative/negative, positive/positive and negative-H/positive-V inputs;
the mixed case shows that the two bits map independently.

Map each bit to its V4L2_DV_*SYNC_POS_POL flag. The register and the
UAPI order the two bits differently, so they are mapped one by one.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Assisted-by: LLM
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index a499b5e39acfbb1acaffc077d4f1fbdca3071a40..85f10d10337130565a0799daa32311510e312a68 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -818,6 +818,8 @@ static int it6625_get_detected_timings(struct it6625 *it6625,
 
 	bt->interlaced = val & B_INTERLACE ?
 			 V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
+	bt->polarities = (val & B_VSWPOL ? V4L2_DV_VSYNC_POS_POL : 0) |
+			 (val & B_HSWPOL ? V4L2_DV_HSYNC_POS_POL : 0);
 
 	if (it6625_read_bytes(it6625, REG_H_ACTIVE_1, (u8 *)&active, sizeof(active)) < 0)
 		return -EIO;

-- 
2.34.1


