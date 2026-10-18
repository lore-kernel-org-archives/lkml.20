Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A316E4D9F87
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357322; cv=none; b=TD8Yv2Ig2/vCDUSfWUpf5sm/HvUvVv5K07QE+se7aXdEGN/tMDx0QxXxvllSjQdt+Vpp9CUI2VzHQMbkwxyx8Io38r2CeMTJgvP4Ni+r93urRNEuotzNt38hVT8tzl253b/ZxyqrtWkPwADGEb5Oyd9bnhGXKiZdFJyezcfHFlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357322; c=relaxed/simple;
	bh=Z8uu8fH6aki/26UfA4EcczhM/EQOBVog5Bvo8BoUrzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+xHNiiCyLWod9JC8ooTI8ynsVNflESwvGF1mfqIxn+nSwmRIE11yzEh8uRtws8wN4aPlo5GWrZZeXdN5EA+1PPy2T9nXpojkgevA38CmOuODPx1NmGlBXYu0FFFJa+xmhn4iunjzp9IOldqfZS6OEVFhzSsxu68bHqWVfpl438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=NXC2tbfW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="NXC2tbfW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so1299587a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357319; x=1792962119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oo0PqywFNeZrvrmnjqdyWLME0kdzU+Bq4MvwdsJPtA=;
        b=NXC2tbfWweoCgxLjFTVWG/Zh6fdIPas9dA/qLk9nIGAB/Ih3NWoTziq0UaTYczldM0
         tQiWHTX0sSIcYQlEtOTTii5UG+LtNW+W78kUG9GicZvKlqRcMn0Ynsn+Bp32lL9NlLoP
         Fh7GI55u6gO2OTO/Q5079vO2FUK46/d5SZRRwQWDAK7MIrzl8QkLq0en1RAN+Md8ZvRR
         L0YH0sLz8VEalphdmWc2mlf6HuFlyg/aPtKSKKT/tHXbBi2WwaZdPbEH2LlDJbWeARfc
         4AtBTZmeUIo2iw7qwRvoxndAlXcZfFC4/WJ4MPAMrvHVklooTgIz6ZaCC0XMn13+JTms
         0NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357319; x=1792962119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oo0PqywFNeZrvrmnjqdyWLME0kdzU+Bq4MvwdsJPtA=;
        b=ViTNOwtz1sdFr1QaIycYWW5cIL156l4GW7OSuSLMtvdHIjY1FsMEHcMLSpnwj5GmM0
         EPmwQk0RjqzMJio6bYSCzzHYxsKJpQ20l60855cQEO9tptZzfp/h4Dod9/ekNiRLq7do
         V1dzo2YeRU+4R/tJbk9Y3weg3RUKZdSEL2ggwvLwT1SVPBPTxE9/T9mE1C/581i3ckkr
         Y+WWdPOv1ZAhhUo6H/0neAXifWWjCOjdx7eucNPJ3M15AAOp8st3/PxFcyifTikKfu/L
         4f0NVTX+3ZNU8k8vyPGAwVT5N9Jq0OTmcLoz2tg9bDbVTDvHOodlzFuY7x7nN1nDgOGi
         crZw==
X-Forwarded-Encrypted: i=1; AKwUvBxIvImFvJNW6Kmu1qw8FThW98bKhTLMJeAPB/xy2uZSBDVdPO5t0CAbKZ1TJFYjThcyZ6Ch0a2aR3kl5p0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1WeZhug6VgkeGwV3qT3KxS+2/avwFplOeFLro6NeKfD2ASFt/
	Vjb1hYom4gINdrFo75IBsYskVXedYRnhdXVi6uXV/zaVm9W+dR3RTntRjsc3OlSqkA==
X-Gm-Gg: AYBFou29p/EC4YtwtVkYxJ2RCJ0lbYFXYl1doUl89PlrafgGi99MnvZyhJ3CPB2c2Ot
	8eWYmkjL6qecGEp0M7yfxjqI33jbsV2SqYB+lL+4VEok1WpfbKi/a4GTvVwUigOdJWoH0jXCqic
	Fyx164m4B4Xb0JGyZR6oHaJfS3kPvA37w4W0MN1hUHHVxkuJbCmGDSYGpUdmaMlMrYgpIq3RIai
	C/LIY7XBgOVGm1DAJllUSIWDpotLhXtvVgaGRixROi93bWLQMWcAPpFCOckLO1R5xcCeV2qVsBI
	tJFsx7WLwn+l1iqsKrFe5Hg2hBp7dP5rX3+npOEsHhh7YEeXrsLOvcBd/jWC1OxvITwBQPSXMct
	EUWJX7/Z7SWQYmHi7WQJ5FkVMf/a5i4Z7TtUv0hSj5qAoYyYRnpEb/cTIKDjuce1LgsB98ZuU/F
	modmwujNG8W3juincyih9Gn2D7ht5NT4jrTTkxj9kMVcmcMQhPlYBp0y5vRKvHBbhd38W+Up7yK
	JFvYhgorZq8du24LCvCRU6f4e6ufp+EnkurSh4S4EjPqOZ2PiaEwInaXCyhk+eX3mdMH38BstLI
	92ArU9dRTL7Ydyh3HF0sgwzBZeIPYVAwcRhR0blLECGO/EL1dLiGtm4pygFpszrLwMWdjvie0j0
	iinMLN7UsiVLfUD3DI9MgTf2h3ULBZR8bPbKIbhVkP29fstsfxtp2nDDa6d0FftMGVsWfoLFKjO
	AJ/plPD+7h
X-Received: by 2002:a17:907:2d92:b0:c43:bf29:152b with SMTP id a640c23a62f3a-c43bf292f40mr113631066b.40.1792357318362;
        Sun, 18 Oct 2026 14:01:58 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:01:57 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/5] wifi: ath11k: initialise the CE descriptor waitqueue once per device
Date: Sun, 18 Oct 2026 23:01:49 +0200
Message-ID: <20261018210153.1925962-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware crash recovery reinitialises tx_ce_desc_wq in
ath11k_connect_pdev_htc_service(), reached through ath11k_core_start()
and ath11k_wmi_connect(), while a WMI command on a device without credit
flow can still sleep on it in ath11k_wmi_cmd_send(). finish_wait() then
unlinks the waiter from the reset list head:

  list_del corruption. prev->next should be ffffffc084293648, but was
  ffffff80075109a8. (prev=ffffff80075109a8)
  WARNING: CPU: 2 PID: 1782 at lib/list_debug.c:62
  __list_del_entry_valid_or_report+0x134/0x174
  CPU: 2 UID: 101 PID: 1782 Comm: hostapd
  Call trace:
   __list_del_entry_valid_or_report+0x134/0x174 (P)
   finish_wait+0x68/0xb8
   ath11k_wmi_cmd_send+0x150/0x2f4 [ath11k]
   ath11k_wmi_vdev_set_param_cmd+0x64/0xd8 [ath11k]
   ath11k_mac_op_bss_info_changed+0xe8/0xf6c [ath11k]
   drv_link_info_changed+0x128/0x180 [mac80211]
   ieee80211_link_info_change_notify+0xe0/0x100 [mac80211]
   ieee80211_change_bss+0x1bc/0x250 [mac80211]
   nl80211_set_bss+0x1a0/0x328 [cfg80211]

Initialise the queues once in ath11k_core_alloc().

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 +++++
 drivers/net/wireless/ath/ath11k/wmi.c  | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f43..8e4dab61a3009 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2743,6 +2743,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 				      enum ath11k_bus bus)
 {
 	struct ath11k_base *ab;
+	int i;
 
 	ab = kzalloc(sizeof(*ab) + priv_size, GFP_KERNEL);
 	if (!ab)
@@ -2769,6 +2770,10 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 	INIT_LIST_HEAD(&ab->peers);
 	init_waitqueue_head(&ab->peer_mapping_wq);
 	init_waitqueue_head(&ab->wmi_ab.tx_credits_wq);
+
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		init_waitqueue_head(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
+
 	init_waitqueue_head(&ab->qmi.cold_boot_waitq);
 	INIT_WORK(&ab->restart_work, ath11k_core_restart);
 	INIT_WORK(&ab->update_11d_work, ath11k_update_11d);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e7..3d5b6605eace8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9101,7 +9101,6 @@ static int ath11k_connect_pdev_htc_service(struct ath11k_base *ab,
 	ab->wmi_ab.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
 	ab->wmi_ab.wmi[pdev_idx].eid = conn_resp.eid;
 	ab->wmi_ab.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
-	init_waitqueue_head(&ab->wmi_ab.wmi[pdev_idx].tx_ce_desc_wq);
 
 	return 0;
 }
-- 
2.53.0

