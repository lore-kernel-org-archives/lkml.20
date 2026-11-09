Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264850;
	b=t2m7qKalW82oZTKwYtTq5lfTvzsFI9je/l/1C643UW8+oidbsSvuythwMUTlwTFWfKJv
	 VZZH9rLa/E9XmmH7ksviDgXwDePrlqEZL1iFEiDqNRS/9Pipmyn0cUnzdimWstBLCmfIT
	 QU5LcIHUCuS7k++bl+2oOzjAs+JYVJoNi9Ed8vEXPcMAlUZ/9ygeirn1WfTf43BXIobuA
	 baYXdittonhFIsBmGVZa1byp17iGQNQFAqGqA51y2EiGHjPcrLfqJJys1nfiv5IsxChCa
	 Cs6+b9+KEf12z5I4EaIO3GIZbHHCxmJNE5lHsGnROYujeyDM+C3CE2TcvlAIElpo9xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
	b=CssTY3ldpsJfwGG8Nt2paxgpVK0gSv0mbqdh1UXyFC/8I8MQp3e9D/UHmbRbEpQsaY+W
	 amwdzzO892eQ7H5wtyu+p/O4QgS7SgalMyPmMBreRPcntilZuuqMbmOWjGTgqsyd4RmLx
	 biyYF4fhFfey94dAVB8ZKi1sPSvdKlUgfIjd715sh8q0UeG/AWMmjyp9Ht4VVTcmGa53D
	 c4lFer+ez53kC8idgadfn2ac+F6L6eqLV6I2F49Z7uBxT6ND6OFSPfHwciVNmEsZPiaQY
	 CCq/f6NHuJNZMbF5Bw1Wf/T6YycVI1uWxI5lo50OAaUBTuLSv3OmnByZR76XLBAzzhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPq6WZvN;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A37606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A37606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPq6WZvN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a215e64962so16209235e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264848; x=1794869648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=HPq6WZvND8WKGs8x61EfcbU1tTpqQCaT004vY4afRh/RaPz+vr8+/NfAGCrqHl1FUF
         R2hScXb0CJDoQ0E/QSvLPtUwQNd+n8Mpkuu0AQIIX/8QawijVGqZa9RlMeejc28hBGxH
         1KpB5dFRYaW66E+9Cng7JtSt9BtKl2jYp+zhr3P8rHZe+CuZ7OVheiGHLejVx+4B3yY/
         4Xh19eYRzRdG8C+TF6IWM6dY2Uc7QfgbfAUbeZaMcjJ345g8Z1/Nx9nSi7lqCKmIQthY
         2mnbBN3UwcN58JgPAGFTQyEY0UIFyrFJW73GR7sbB9eiVFZdfVNQtldhMAXyP3DXNgdS
         lMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264848; x=1794869648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnkXez8y7K75jEjF1rYTf0IDzIs0hIqe0bwfyGr8AZ4=;
        b=UPeukA9kQEv0Zo2+93uxnkXB73FypdodKat5941UlLop+gSL6MnhTy+l5bwmkNzxYl
         KiTrmf5v66kwqDUmE3PjMaEDhP3Dk1x3KJF4q3PfZJkmS+tH5+XYAbhaNBW8vemAk7p+
         aoNJOKTpmdKi9W/WlVgbnusEprH4U2KO2B40yNtVOApbLEnkwGoa6SuM7GJBdmp5SXYT
         4m6KVqXtC2UzOn0GOVqjjublrVvMMb+3ABlA/cpPqJGFmh5F9mbLQW8CEDGBYtzLZlWN
         90GngQSRTFQfoLySyxWAnWj4MdtFlKIK5p3qutWofNyqrnOMJ9+DEQg+zAKI+wrFAzPl
         3wlA==
X-Forwarded-Encrypted: i=1; AL+hErGMEob1MeD9iokWhY34/f7SA/nMJG4VfEEYriZUTD1LMMSYfYixnpbWM4k9AViXLUHhHLRn6rwD6I3WIQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BbxiF/T2MUq7Isjo9/HESC87hfM9PwI9LGyqypKPm0Z18WdtG
	AIxhO9TlwZ+c617o3wQt4DalxZLyzKXj2WZsAegTGKPowd2n8DlE06dT
X-Gm-Gg: AYBFou2cyVzxibPmxjNi+RRxamf7lVyM4GmzSy5aACavAPsavgIQoMrq7/38iQ/PnuN
	S8pc2XOBOPyJinANl3wdxg+cwP1TBiEi3jdROHPnT27EVOD4t8hoQyLs1A22DJvuncXibAGFN0K
	OOL/8ZVgMvBuPoJxedoF9UfjlaoefP2vX7GfagiH7mxz05ai9OyFRtl8G8gqqSAlmRmEMRKv79M
	p86N4aVgSzhkLkqARJ0XiwOsVWh7gqHokQm7g6czlf87KL4rrhc5/A07p6cLZ9ayqrtMrVMJZiM
	cXsx2gMPtebdBPmnZOq5bobFeNWQnVZ/7OEF9W6r2yHxPrNd3Z0zd0dUieZ1QhWMSiwEiH6OtwH
	Cl4aUbwYEamy5szh6YOTI0U45vYoZzlDhrujObFfAkXNpFv7oHem7Ia3UN8iKumW3BNbvTYCESh
	uChmxIu6bPlA85vjKpwlay+BpUIpkdc1mz4/3kL6pZg+s2pB7+pZWL1weCICg62WzOgmf5LRTEv
	aZ3ExpCKfnvkysVNX/8eg3vHeN4pBwsclPs9Bs2LmQVde20JDwWJbIPkgpgxheh9VAkvYQn01zZ
	bdRabqBPI/fkTUCuqSSGhMfGfJBB8Csvi1OuhmKIsemk33rDlQ/UoJ+QwoBZ3H7lBmRoVPq6t+4
	CaXs6TclIKT9m1jGUqmqwQ5f5O55fofKUmGyqvH8nTvE2CvjhYUUlOr0aL7mYGcM31nkVyJgX3i
	cx2ipyeYQOmUBlePdbPLSjrvI=
X-Received: by 2002:a05:600c:350c:b0:4aa:15b1:d4fa with SMTP id 5b1f17b1804b1-4ba0233bda6mr10446175e9.5.1794264848501;
        Mon, 09 Nov 2026 14:54:08 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm21435365e9.6.2026.11.09.14.54.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 14:54:07 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: accept num_users equal to HTT_PPDU_STATS_MAX_USERS
Date: Mon,  9 Nov 2026 23:53:54 +0100
Message-ID: <20261109225355.23161-2-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109225355.23161-1-gsustek@gmail.com>
References: <20261109225355.23161-1-gsustek@gmail.com>
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

