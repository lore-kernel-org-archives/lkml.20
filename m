Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE754529D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875617; cv=none; b=GwC6GfIk5np2yg3DOD7xIAYiwARZtt2LaW5Tnjt7gv9gENbos/e/NHU9X7lB0SpLHFDw47mwoTNU9O1uhpZE5lvBEM0nOa3beNdJcmLUCAHzCOdkr19GoKziuHpg8pwUZgMB8TuTIZymNPGRPoCK72Edvi8d1blPb340jx8EbYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875617; c=relaxed/simple;
	bh=AMm5/0s+MwH5AZ/fwZK85cp5dRkmGH+8cbgH0A9qRT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcd1tpX4nStso2emB2wMHZ6lo8ss1eFPpt9MIBbHuTdvvpNEzQ7xHboesRCE0gTpHc9ljYbBw7fJEXrimMqliWTyV68cz+eTHRttapXoK1UHWXsM1gkiAw7NSkf4AKqx1DCSzRAoevvr7xyiOKlaBeOTbuOeC1M91IAdzzUDwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=PxY8U2zR; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="PxY8U2zR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso88652866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875603; x=1789480403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+9FqYSQ2L7Zu1nAHB7ZI+rj9iphBqw0F7t6xJ4R1Qs=;
        b=PxY8U2zRuW1e+6xuouy3XN6GaXVICPAS+HSnWZNnL4cvMV+pyFvr2GagE/hIAGbMdN
         P8YEgh5X9CqwgvkeiiuhLl5+w0ESqxOCp1r24SX5Jp/Ct6nYQUc0iWVaFSGcvnwR5AsZ
         LlDba6aNd6icKIgL4YEzzawTFWaWqvN1bPUBmp3gydul+tSukwm92JtHFopQJG2aidqm
         or+SZq5WlsqLvrVqJ4Mh69YYbe/epBrPCQTULq36CVGiRKoW828lBXCyycn22sTIUD64
         93frtwePj9CLBiA+9m76JczyhKYH4lVN8DAOKZUgpaK3lSgOwAeit9ggRnkLD9XnJlgq
         L6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875603; x=1789480403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+9FqYSQ2L7Zu1nAHB7ZI+rj9iphBqw0F7t6xJ4R1Qs=;
        b=G6RymPHKYJsfmNRzPYMxQ3T8L9zBAWakYMahUz9EvP1UC3tkppaJUaLuM0fw6PIl9m
         ebprOLC6L7AutwobDW1z0Z0YkKOfKwN31WZ7fSPKfd2isq+agqDjT4emiyV0LvWEfDrW
         CJxdadItNzCQWiWfuM58KA7toil2r/twbmXvh1oKz3QQiwuTmEq4Gr3kE3mQiEZDaYuZ
         OEH7UyharSeKFO/aGK6w9XDcISWxiuyDQp8Za4FSM1p1ibDdVqhIml4NaO+aWR836iSb
         kbNHF7KiYK5IOkKhld0dhh2UiSwLF1o5oEKUWBr6CheQyStZ8PL90D3XEASgv78CtPal
         FLCA==
X-Forwarded-Encrypted: i=1; AKwUvBzaKTsHRK2L1U6GqTlYzCfkrxHh5EmH+bD0wOD0p+fMXW2Ci8em4Fr+U7dkevj+fkKLoePQc0+EHDLHPQk=@vger.kernel.org
X-Gm-Message-State: AFuF++lQWXX/SKoyhBn1D0UeZoJcqIopKiS0gzXeCqHuVuIQcDAEqhWH
	rUuPcv9zEENQbQpiDpsb4bypRqd+uA4DWj8enRF9m9C7t9EnIhldzCLlQmSxwpdnDQ==
X-Gm-Gg: AYBFou1ygNWJadbzdfw+tVumwUenTgbA8sFVM57k3LJN3v6AXSAMkCp8QOURKo6yqRH
	uzIn8VUx66iF1nICbVeJHCDNT4S1l9KheRKt+XKPGMn5F387UO587HD7lPavHFK+6EL9CjGU8Yk
	SwkSpg9aEROx0CBmuo5xeg1x2cvbBhOjGx+vrnRfvudUBI6za3y6WUJ6V36rxWFRMXJV76VqHj8
	lm5QKsLvxlsPM8fXhMY7u/4r9IuadgHy2d6GvnAm3esVSIeLpLGhttvXl0QFeHuR/6ALOF0kKIU
	2dVP72Kjc5P8YK7TCGUNxTmrDYpXhms6kmKB4ovDfK1MnWZLKoiJQLjd7aq6c69Znzzjl/fY/YD
	0u8iSKkXUJYI6sBF34vGVJXfJsAzTxL5yxdkALmBltoSkWYCnCbojf7UOZlUpV/buWwF4GESinz
	X3QWAGCtnbtCYxEjEC5kh/r1IqZwGz7CEpsB86y8Ms/0iYBiUAsIk+d7beYqrz4Scq0ziOOkaM7
	q9spLWsyJjRasFopKi/deOkxyz6KOD84O2TKr+2+2yjV/pVPp3GSI84WSD5fgf5AeRam5iZfz7j
	gV8R7ZYmoPhX9kKNl78U7biklSWtZQBZdKT5qFwagGq4bsLavuXHbkguyuNBJ/kHxgITc04VyeT
	DkGpdP5yEk8SPt1XptcVBekg5sIEeRpS+kRzoJv4hOgI09s2kF166EgUfpF5DaBQlf1NnLiEtwZ
	CwjpCuHhFcJiaH
X-Received: by 2002:a17:907:930c:b0:c25:f7db:4bee with SMTP id a640c23a62f3a-c29044f2780mr326114266b.20.1788875602673;
        Tue, 08 Sep 2026 06:53:22 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:22 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Tue,  8 Sep 2026 15:53:12 +0200
Message-ID: <20260908135319.754140-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ar->dp.num_tx_pending counts the MSDUs the hardware has not completed
yet, and is used to wait for the transmit path to drain. It is never
shown.

soc_dp_stats can therefore say when the transmit path overflowed - TCL ring
full, misc transmit failures - and not how deep it is at this instant. The
count added here is bounded by the tx descriptor idr, one entry short of
DP_TX_IDR_SIZE per ring, which is large enough that occupancy rather than
exhaustion is what characterises the path under load.

Print it per radio, beside the failure counters it complements.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb..ffe1f466aefb 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -714,6 +714,16 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	/* Descriptors the hardware has not completed. */
+	len += scnprintf(buf + len, size - len, "\nPending Tx MSDUs:\n");
+	for (i = 0; i < ab->num_radios; i++) {
+		struct ath11k *ar = ab->pdevs[i].ar;
+
+		if (ar)
+			len += scnprintf(buf + len, size - len, "radio%d: %d\n",
+					 i, atomic_read(&ar->dp.num_tx_pending));
+	}
+
 	len += ath11k_debugfs_dump_soc_ring_bp_stats(ab, buf + len, size - len);
 
 	if (len > size)
-- 
2.53.0

