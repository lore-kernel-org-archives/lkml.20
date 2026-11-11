Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430119;
	b=YrH3A43czpag0a8CanC3eT/1YS7Oa9L4xS8EuxfW+v3rrzOVkEX/qogFrO0kXjZXjKcT
	 7/D339RDOKP8XBN45qtOZwgiif4DirUkPb7AFKspMLdF8DzHNZXa4dF99PF1ztg2Xo8wU
	 9TLMmUxGLk1KbfL6mtF/pD8RpmzS8ruyrVJsaGo8VSkPafaOWiZLK4klu3zY3BK6YaYE9
	 It8iAhapQ3aboy8dlCJJsK+7cfgt5Mrd7xQFIToTTUSm3qz5KE3IWOodP/FrQL32N5Q6q
	 soWXgXiJQtsNyoAI3r7oFC4HILqIhEOX1mpukiR/lCki2+GXGAz41J4umVU95fi6dKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
	b=ir/C027vsHir02uGPuWsq//Is6oGER2kJ4TeacLoP595sXFoFFmvQB/zrMAqljRY8Qtc
	 fE0znuysL+Wcc8XEuOz0v/YsWMiarx+TYljE0AD2mZnvryy6woxBdziJDnFa3zeaV/jll
	 nITVp4wyvCzqEPWitL0Zg16sF+KhLOCU6UL6lTteMhtMJoPB0P+yiSEAyqn5VJ1mi4UM9
	 nqsafE4REN+azE5AwNyq5cW8G01gPoXGxZIxwC7AwmPajmvbvrFKpUnuhIh2MX29rN2ho
	 d+yKW5taeKAXm+elrFe9s2jsinZ+AHyyst3A6MGydHdH/z7zLpwDXNcQOqrZ5S2Dg/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1TTK1Rk;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041E2606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041E2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D1TTK1Rk
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490a0e72588so2011335f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430117; x=1795034917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=D1TTK1RkntaqeSIu0pyz0K+rte0HRE8KoF0FVtJ5kJ1LObGSzqW3uU2+0dNdjh9gwM
         PWCyX7XRQ0RXAB3tfrX40Zhn93LfOyD+micHST3Aew6y/NYhCICRyfwqHxLh84su9WE5
         b+SjZrOomipSzzi3PW8MLZ5zOchhqoZq/3R7P16Xhmr1tUJSud6oixsLYPrbSiaHr0ZI
         DIQ2uppLrs0IXkdmscuncpPmhJALRrHZLKD0KCuJpRWP7RFuhR/XgAlhMzWI0dVWUxLk
         DJ29mGG4SlWU9vLemNJHhEBCDoqMHhONCwis0/FWCl3opaiKwGukWBmwMRzOqiif8iSx
         Ffhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430117; x=1795034917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=hwqVnE/kQe3qHTgGMYG+aL8nswDS2IqHuBjRHj4yVaME2I98S9O7fj39J3DIufOcrL
         VWlR0FMeA6SDfs0koV8nlhFMhM7oxl6QiPkjYvK3jkmR5NoT9qlYphJ7PfhCb4JUsNOK
         L/H1h7zpEe6u3ptaMj+4t1wEFwXrEt2tnKxh5mYEB8LWctnn4UtEHpqtX9a+01LYqMdq
         4EZx4Rh5eaBF7sD4pZ43xar6Du3ddRsVTzy/rAp9dsnhcqHlvB6nt5hcVHgycBWhNpIV
         nzIqhwprrZDNB8gGzfEDVCcL8c80VWK0eiM6BNMXM3sgZKabS5Kt7hgnlXrEbXbTwU3x
         /OLA==
X-Forwarded-Encrypted: i=1; AL+hErG4twhm57zMd0srvUOjslaLshmwNVwQZfskRayNpJ9JhBZl1hpLJqPw9RPTfYp8ZTQfSFMBGM7xM45jfNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Oc6ByybSeZv53aMFCh7sw2gMQDKIBSB+blKXSBuc89kIUbgGy
	t7BbzOY0bX0eRAC57fiFgaxIGpfVboe2Gu9xhB5OdGQu9oZSBSnaljk+
X-Gm-Gg: AYBFou0bOojt6n0BkDmYZ488yTBubTVIAkg7vrnSL5IyXsYAgWE3rB96Yo1k7O1bMSO
	bhIFZQHyJuExm7m2mtpGkmclz6fQVWCJtp+7eCRhgEl0cgbB+UK8akD61JnNyYi/bYf3NG872/0
	o9h9r+Jcv5RsrVZ5MSDtYQ/VuRAQ/vy9pILPCD5pCZn2llMvulz0G+0BoB0F6++yiF82LjoD+kD
	UmpAPqjUv1jUp86aYdrMLyvl8kklWoCubbKH54qC/3DDgf3MJkKCKZtr9ZkiZC2W4w7xkAgLchl
	8mZmhn1iv7fi05gcp4v9PoCzRreWaaLUq9/V3sJE3wdJ0cfF9s2uTIEwm/Zk+7XymBo6DO+d4wm
	BnBqktAtAb+LWKJp0MH6HwRbPGJrhKZZlmvpM5qsq30vW5oM7srKm0eEvI4lpPPexyoX2RtMgMh
	pIf2/DKC3OOt0CS010N1VENepp/oifUBO5hK9agLck9jz9RhUNDap6bLLw9QmoiFYGIpmdi/Tso
	r/EbNOwUJH7GbvZXwvE+CEOQCNW+HAA7OrNGzKuVj90XmhkvxQ4LCYLoTom5vVYY2jm6waHzlDP
	yo0VQ05dkoh6XEFEWsRcbyyXA6STnJ25ntdzPmGoA2ZSxeX/CVgw8gnwm9uBxixZmzxwXmFJBpa
	mDZe6hjxzJI26xEsZY5vy21rfE9abqGB+Z7Rl0sIRHWt9hD+UdHz5eRvHI+v1KsMjO+GctFuDIw
	zrQ9HO
X-Received: by 2002:a05:600c:4e41:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ba0939db52mr62096635e9.22.1794430117343;
        Wed, 11 Nov 2026 12:48:37 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:36 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 1/2] wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
Date: Wed, 11 Nov 2026 21:48:22 +0100
Message-ID: <20261111204823.88785-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111204823.88785-1-gsustek@gmail.com>
References: <20261111204823.88785-1-gsustek@gmail.com>
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

ath12k_htt_pull_ppdu_stats() rejects a PPDU stats message when the
common TLV reports num_users >= HTT_PPDU_STATS_MAX_USERS. The check
guards a loop that iterates i < num_users over user_stats[], which has
HTT_PPDU_STATS_MAX_USERS entries, so num_users equal to
HTT_PPDU_STATS_MAX_USERS stays in bounds. Commit 1bc44a505a22 ("wifi:
ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
rejects that value, which is off by one.

QCN9274 firmware WLAN.WBE.1.6-01243 sends num_users 8 in messages that
otherwise parse cleanly. One AP with two Wi-Fi 7 clients logged the
resulting warning 468 times between 2026-08-17 and 2026-11-01, always
with the value 8, and never logged "Failed to parse tlv":

  HTT PPDU STATS event has unexpected num_users 8, should be smaller than 8

A diagnostic build that logs the TLVs of these messages shows that all
of them are BE MU BSRP trigger PPDUs (frame type 25) carrying user TLVs
for the two clients, up to four records per client, and that num_users
matches the number of user records in the message. The same firmware
reports max_user_per_ppdu_ofdma of 8 in WMI_SERVICE_READY_EXT2, so 8 is
the largest value it produces.

Accept num_users == HTT_PPDU_STATS_MAX_USERS. Keep the warning for
larger values, which indicate a firmware that supports more users than
the driver stores, and adjust its text accordingly.

Fixes: 1bc44a505a22 ("wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index 72069640bd38..f5c526bf82d8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -487,10 +487,10 @@ static int ath12k_htt_pull_ppdu_stats(struct ath12k_base *ab,
 		goto exit;
 	}
 
-	if (ppdu_info->ppdu_stats.common.num_users >= HTT_PPDU_STATS_MAX_USERS) {
+	if (ppdu_info->ppdu_stats.common.num_users > HTT_PPDU_STATS_MAX_USERS) {
 		spin_unlock_bh(&dp_pdev->ppdu_list_lock);
 		ath12k_warn(ab,
-			    "HTT PPDU STATS event has unexpected num_users %u, should be smaller than %u\n",
+			    "HTT PPDU STATS event has unexpected num_users %u, should not exceed %u\n",
 			    ppdu_info->ppdu_stats.common.num_users,
 			    HTT_PPDU_STATS_MAX_USERS);
 		ret = -EINVAL;
-- 
2.56.0

