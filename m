Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA4F37882B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184936; cv=none; b=B9W7Hl2KfbtslKJclJ7hXm8L+n7KBMbBwGkzMLklzB+i9tSPXSXrbRqB7wDwun/a6yEVxB+bxLL8wroJAukOlwL5Jvyh31kXcW/POSSSSgZFeL8/S81Vn5K3QcOKMxQobvhUHIPCMC9NR/ftKhmOp8IbrLVKC+IWqewezGADihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184936; c=relaxed/simple;
	bh=Pb9pP7DCmWh8PRBTVTFxpapJkTRbJ69H744kGtzqF8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOYjEetx+ETTRpyQShd69paoHngRXoJv6ODjLKY8cutIxqhgCMFSqpS4H3qzCDGFh94/Ns8mvxjtETiACcVt5iSsMLkQcE4kxKOtJaDKiVVRKSQU36VGu6tf/yUpLGr/O4m1fKh3eIURH964AXdXRCdCek515Bp2lgJ6WVDg/hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djwEgbCR; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djwEgbCR"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af0707d41so644839f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184933; x=1791789733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWSA/QTkYQRPkO7iv6tttaOq45N/puN7vAoxmF26+iA=;
        b=djwEgbCRICudKPvHU0Bl2FI/Gyhxwn7s38nDNeeJ8FZCuaOqpEazFnI/xq2MbLWCDb
         zXqGruTIapVhca2US6tLWwDXBICzkdZeHB5n8Mtx7UDDm+V99EhiZCzOt3N1mluOSnWf
         QRdB5UWiC0yMhqwaCKjQcZnbQYsX9o+ZnrHPwW6h7ChDc4wclMLa21FmXX2gcCxOOUL1
         i2G8btEqC4Rpoa6LitgpmJtVQTXg8gza+YdEGb/jYoUPCg4LUanhRZGXi5kr0w91NTSx
         CdB1jFzvwdQqiaUb+ZSPAmHn/KXaT0+VynmtNInVseRJXORMFESdsM3uDZc1GWi7el2j
         sDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184933; x=1791789733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWSA/QTkYQRPkO7iv6tttaOq45N/puN7vAoxmF26+iA=;
        b=XdwmKtIV9ZMpBO8Dnfbp9WOOF2YlSEoKJsbaGBER7Hf7NxDZcD/oSayx5VwPyElq9c
         dgI7y/wSS5lpqgwLUrgZz1J3uYCVZSdGW/Stv5U0Wvn+xkOnj6Wn/4dX62iGJOEjmTTR
         DG/mYTzyZolVkIxFGF/CE2zN00AnKHUHL4jhhgqOpw9ab2QHkX7mOI+SZMX2EYPVsFvR
         T7t6LbOovRUs5/mqFkm+1AqI0Q5K2TDSEmez9F75wzgGsj4GR4nejCLL3DxOIYxAmZIH
         4VX3QoepcxyBOt8raxWX7hsLa2PyticQ1C1ARbpHj2MYGJ96q64IuDicg0qGbg1/gnFh
         9V8w==
X-Forwarded-Encrypted: i=1; AKwUvBzkUGlv+ytL8ZDr/7JdeLP6lZEM6tUlpdSMjF4Sy6jMsaYnabgDpNRk/29nCY9YKSA9Bu38pEtndbKdcjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa2oWBzhL0wcgYyQO5Yg1kzEwEgw+GD7b9yoHd88rebEMWYLxq
	9L1CqkvXKDjpX/ur8xs52hXzYVR59wUcEPk2dKTHKwQORkt60BgjO6mE
X-Gm-Gg: AYBFou2fiVlaxV3sArfR7tQLxIUUKr4E6lKu90E/1zVLbSYFSDIOBn+ShEsqYR2czWJ
	r9V8Hy3rtP1/2gnixslUhL+9Z7DYdj+jHV17f1be3INP5gwKwjT9VGhY2kTykqid/hNlQPsPKuC
	Stsx7AzgscGYJLKv5E9oJfPed79uXpv0hYM+c3qYwbe3fO4sgsEsMxedS/A+EQ6/0Hcswhy092R
	W6sNb9j7F9stpS+MUmiLj/ldHrmQovPxwGxfGXB1VB/m6+WSTrX10r0K7qPmxXv6VZHEbMJDEaE
	ypM27s0WdMRwrgYnE7Rei65x+fBCLVfIdbdHf6LTaVLferm6KmA4M7tYxRfWwZkjVRCT4F3YKMt
	aVh5CrFxCrQs3vWojMAcoSHZpN18XaFH8VGz7A1pvbF8HCZgiLGDgbHgZeslaYePbXv+wCI3Qaw
	6Thr1XiZUvZpGmqaerJdFuHQbk/A7zNaf2APBs5ac1Sw0rP2TwWDBMYZavt0zoQ7Cn+yNNIDYQ3
	7GG
X-Received: by 2002:a5d:5e0f:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48b1272892cmr11686252f8f.7.1791184932933;
        Mon, 05 Oct 2026 00:22:12 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622affadsm1642847f8f.40.2026.10.05.00.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:22:12 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-current 2/2] wifi: ath9k_htc: start ANI when an AP interface begins to beacon
Date: Mon,  5 Oct 2026 09:22:09 +0200
Message-ID: <20261005072209.4101009-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005072209.4101009-1-mehmet.fide@gmail.com>
References: <20261005072209.4101009-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

ath9k_htc_vif_reconfig() re-arms ANI after a channel change when an AP
interface beacons. mac80211 configures the channel before it enables
the beacon, so during a normal AP start that never triggers, and the
start from add_interface that the previous patch removed was cancelled
by the same channel configuration: with hostapd, ANI and the periodic
calibration it drives did not run in AP mode until a later channel
change.

Start ANI when the beacon is enabled. The channel and its calibration
data are in place by then, which is the state vif_reconfig() re-arms
it in, and remove_interface() already stops it with the last AP
interface.

Fixes: a236254c35f0 ("ath9k_htc: Add ANI for AP mode")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index a86dd28b0ab7..6578114a4019 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -1551,6 +1551,9 @@ static void ath9k_htc_bss_info_changed(struct ieee80211_hw *hw,
 		ath9k_htc_set_tsfadjust(priv, vif);
 		priv->cur_beacon_conf.enable_beacon = 1;
 		ath9k_htc_beacon_config(priv, vif);
+		if (priv->ah->opmode == NL80211_IFTYPE_AP &&
+		    !test_bit(ATH_OP_ANI_RUN, &common->op_flags))
+			ath9k_htc_start_ani(priv);
 	}
 
 	if ((changed & BSS_CHANGED_BEACON_ENABLED) && !bss_conf->enable_beacon) {
-- 
2.55.0

