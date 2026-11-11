Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430121;
	b=yRzZUATPniDliQkFTh8alB+/d9x6WRM002ta/ClKm9xfwd6FgWBVom/wWVFNIFAaiU5Q
	 2leucGENX3Tcqi8rpwjyX0nNb1JFw9NK1P9rZT+SmwIhY3mV0WvdPEoDcgUpKpT2lyacg
	 degSly9w9gU3joKsCJHNI/5rG80XunCen4VGxX051AP/7oR5j7zLEkAbCW/9v05u5QPj7
	 jb6OFUeImhRugOmOq+zWMKT69w6jPweOxxWEXfFvJ/wlDyWpBqV7t9GXlYq0TRs2B59jb
	 wzAsdPV7Pr6XlZqS6jmjW0kJSILV1scUMfVZtSiB2MBGR36MrGZ4/imCJWFQCN2JJOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
	b=nD4TZFNoemORlXtc7EczWwmyAdh1CA4qPh6xkEAZpemNsgWmQEYC9WQ+MWHHp/TRtPni
	 fRNq0wJ/L+Ydx5YmBFQD+rgOVAh/0d5DDdo0Ib8bCC6QVk2hzl875OjcDapTxyAvV00pz
	 chKsORo9mhSVOEnEWLetzHBsnJl9AkxuT+tNTMYtgNCcivMGf0mjmiSb362smu1RU42lx
	 adc0Q19Ku56ZuTFiMxYiiOhHzL0J54N4yRWl6gVdfV6Hfgqx7Vf7Ofc6oXqP15ZxC5VVT
	 Tl2thJ9BpxwIChOQs7FyxZbTh1eQZMztW/uxUcheFQztdg/0nlH1V3hGzHDaw7yNzdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4qCL1v5;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73C8606A895
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E73C8606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4qCL1v5
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so31760625e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430119; x=1795034919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=Q4qCL1v5fIxj8bw8rdATJLBkqyGm6m7VRxVkizxdlSY9MY0bd/7Q0K1UVgFon9Yge/
         VYa1M07KpHocoYsKP4bnYWowK+sSD9cCM5EteK/QA+nUs0+Ts4HvJkHg5EaE/7Wadi11
         UrO5IBN5oeRnp1zJLUm0k52lSTuDwUNW0puM9DdbdyvhPWSJFTVMyfxbHDJ9gheWjGAF
         BfZIU4ToSzZeh+tHH84sBHuqtUSxXCxndDTq/iv8XzU8I95qSkmxqk7spcAuk4ceq0GQ
         3DCtEilHNfD1kfXAo9eQkXrBdqVB2iKro0LRstNkaJ8NeQZ/kKYGBb/cVccUHzn66JyZ
         cLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430119; x=1795034919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIiTR5H2OWjhZVQ9401qUUhteZRrStfHsUs8Xa39Rxs=;
        b=N9bxrAJrQMKZanEZuUO5jDy1wMr5zcAInNtdw6BDDNNQeiJztzZQO5s2QW+P5Sokmw
         HWvU27nE3OJtVu+Ey1s9CVGAyErJltISmpBx+NDbb3Zax8KVOS+0G/eK+nAba3VOTP8n
         UzrppR3MZPOAJ2QqN4oN/LzlpEXkq6Sq+kC7K2f+Z2ee5q7nYJGtZQ6oI6XCmF9ZBa0A
         5vQyye3RIaj0A6CQoYmRUHVAiv/yqETpaOstWWJahpG7kAZ5ZGnpTbpVb+wN1fgvmZTw
         oMQiEtkoSjIEmzCLD/kB2rXatSMocllFdSFhEyfNeYTQfi3Iyefy+2Bl0qVDyqekUdGn
         zv2Q==
X-Forwarded-Encrypted: i=1; AL+hErGUWPegbvslDYLdXqp69j9ddXnJvhc3EfZdQWKGIgd2hCrqge8xP3ULt37fTpwGhTzxrrdX8+UtBh99Es4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B0GbuPb9MfDLntOkeoXvMLp0AfL3pOh0zXx9jd2slV6nLCVpN
	E7daIhaqf1LlWsJmJHeKw4noA7HRrS/o7zS0aY1xuCvYNhsluaKEigSjTV9QSkMLVZE=
X-Gm-Gg: AYBFou20B9SOCBpg/pkOH7b2zPE43NhFOFA9qrI0+SRhWSFqHRGRilBHU42CDVaVSqa
	qZ8MXrLVO6udnumi4UyDEaaP8NWw73v82jHxkxFIRvaBTJIIvQNeY+lFttzKA8MidWibjp4uHD0
	/9tEX23/HRVR2d7a+0WFKwXLx9EuCV/0CJLZQurvhWke7U9H9aISvvDgC6nnul2agvRkZvOHfoB
	SsRow4V38i+79Fz0Z4LX07INRRmXGKekKx/sZrIQJdESXIX5jCh++JhGtodHrVXioF8ouKl3nuy
	v4If4P7QdsTWKvOXZYrcBDS7FyFeME3zeRCqCd/jSiO4yoOxSH15/SpkBaTv6rB79pzrfK0rukx
	nLJ8FaQpvbqrRXc6BzWdEhwPt8e9wPdiQgoV/AIEDIESEv1GNUGAjfgJhfbcOJTYzlYEpf3njKN
	+9Lis8gUsHBXAkRVn5lU3bscY5J13t8yyQw9wxJIEEA/l/2SXCwIzCilvZ/W7uK5a0UFLMTVqCr
	2+m59z6o2V5UxC0hQNON6BGSJ/CpC/a9WpYyCVOGmql1/Z4HL4M7wSF5X370k6l597+SG9lDVyj
	MFssa5DiRsO3C+R4PH3LMxQNcgkZ1NvcZpV39Hza8NsshV9FEHLt6vDDx8BP79W0D4w3U3vA83T
	zyyjroOOWH9g/mUzryJmFkHPDoJkvA09vi/tjEEKH84M6gcflmkSK6pNkk/huId7+NzEGsmYsrq
	33PqY=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ba093921f6mr66956865e9.27.1794430119321;
        Wed, 11 Nov 2026 12:48:39 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (58-119.dsl.iskon.hr. [89.164.58.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm15063795e9.4.2026.11.11.12.48.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 12:48:38 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 RESEND 2/2] wifi: ath12k: use all HTT_PPDU_STATS_MAX_USERS slots for PPDU users
Date: Wed, 11 Nov 2026 21:48:23 +0100
Message-ID: <20261111204823.88785-3-gsustek@gmail.com>
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

user_stats[] in struct htt_ppdu_stats has HTT_PPDU_STATS_MAX_USERS
entries, but ath12k_get_ppdu_user_index() searches only the first
HTT_PPDU_STATS_MAX_USERS - 1 of them for a peer's slot, and
ath12k_htt_update_ppdu_stats() applies only the first
HTT_PPDU_STATS_MAX_USERS - 1 slots to the per-peer TX statistics. The
last slot is never used: a message with HTT_PPDU_STATS_MAX_USERS
distinct peers has the statistics of one of them dropped, and the
remaining slot is dead memory. Both loops have had the "- 1" since the
initial driver.

Iterate over all HTT_PPDU_STATS_MAX_USERS slots in both functions.

The messages with num_users 8 seen on a QCN9274 AP carry user TLVs for
two peers, so this case has not been observed in the field; the fix
follows from the array size.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/dp_htt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_htt.c b/drivers/net/wireless/ath/ath12k/dp_htt.c
index f5c526bf82d8..a0f98259ee64 100644
--- a/drivers/net/wireless/ath/ath12k/dp_htt.c
+++ b/drivers/net/wireless/ath/ath12k/dp_htt.c
@@ -46,7 +46,7 @@ static int ath12k_get_ppdu_user_index(struct htt_ppdu_stats *ppdu_stats,
 {
 	int i;
 
-	for (i = 0; i < HTT_PPDU_STATS_MAX_USERS - 1; i++) {
+	for (i = 0; i < HTT_PPDU_STATS_MAX_USERS; i++) {
 		if (ppdu_stats->user_stats[i].is_valid_peer_id) {
 			if (peer_id == ppdu_stats->user_stats[i].peer_id)
 				return i;
@@ -362,7 +362,7 @@ static void ath12k_htt_update_ppdu_stats(struct ath12k_pdev_dp *dp_pdev,
 {
 	u8 user;
 
-	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS - 1; user++)
+	for (user = 0; user < HTT_PPDU_STATS_MAX_USERS; user++)
 		ath12k_update_per_peer_tx_stats(dp_pdev, ppdu_stats, user);
 }
 
-- 
2.56.0

