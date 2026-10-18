Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB74DE712
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357337; cv=none; b=JZiy/ezW51xOKIicvqrpTEAhXSs02CbY2CpuOHFY4BnZRVCyX3BDj2vavfx9l94Y0fz2yHsSd9uJAYAZFvptbjF44vav4eSTxgWCM5GnJTUFYlKM+20QcEkSUHRBy4AFncbHrOJ+/fFQR25dMezFi4kNhqKNUDTnG+UAAAU6JeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357337; c=relaxed/simple;
	bh=Bh0G+GiW7IdzC2VLw1OK+qEnICaHtllRiw1SW8B4yCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMTRNdbdEV5Sl13f3OO9YXQigjrsPlvY78SSjMm3h4uWLDJTdfRdhzuOv3ccsbImRo6vLLR/IXRg7N9Zi07TZxS5NcAHeAs5KLUwDeytMujqsdrAQ32g2Yq06OPCXkfHpfd8IB/wWTpelDies4vovd2fakTLXnyhjYuWy71vBcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=na0wPMid; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="na0wPMid"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c20ce3c118aso275995666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357327; x=1792962127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gp82D46O8wvY4gHZCDROdmv/VEli/DkrbpYd3Iw4T+M=;
        b=na0wPMidcfaG1z09rGfd8M+tncj+amL6W9WXqXFVF6OWIUkmGgxWg3ri1Gl+SrE2Vl
         uzn9EqU/RWoQ3IZ5e84xO+LXQ/nHJsd0tYuTlcj4Hg+qcua2RmovQdDDuOkyCtQZ0ly1
         S+j5V5gOMSGh9I86gt50GmThMZKFji6tNY3GyshApwhvLGlK6y8SSNNA4T/xk+W9i17K
         2i1KEykW2FtwUh6wCBTSb8HIe9mwpHKVkXSrIjF2DoB/BpNZTMjAcMORpUPA64TRswfS
         PRMQ1MnMGbFIDRgcEnM7DBjLTLlWHHWx/s+avGuiEAse24zPXzoT9rz/YFhsI7FlEkC3
         kpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357327; x=1792962127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gp82D46O8wvY4gHZCDROdmv/VEli/DkrbpYd3Iw4T+M=;
        b=Sh3i2QklUAbXFQelZIa+/8wdkyPLFg4KrbedtK3wEVklhDA0avdjOcpgUK3rI+cWfE
         /pQeOBWPKK1/ipiaRHPoVohtQ94qtWPtHiR8s+HS5LCGzp1EuRQZVznE86dc3rc1t9WN
         APP4FYg5UGJgC6PCRWc1TRbEu8M67Ta6GD9Bx6YMi1Kx0uV1fPTSlGCvvrWvW9+0nwGj
         wdAeRAnRcpCP6HQ5uaas8FoFIBV1EYdKLlgjEV9x+pCgPEuR0DRAoeKPnC9MCw/HOxoR
         DdLhFYRvrjdMgbpiU6Tntpjgshcsc6dptEaveGHuy6tFtOsLCVxjL3PY3+gZAaCBLwzZ
         c3zw==
X-Forwarded-Encrypted: i=1; AKwUvByoW5lp7oFCEUP8PeUns9It9M0RgvrVEoNDa3F23d4G7/PDigT7gMzVibZnZDArMExNTYJXBgAEk2pO3yg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbJSKpISXUIkLrPeznseJYfeagOG7+8mA/+SZv9aFND5fuO5oJ
	MPvREvNgWaU5hj7X+kdxfU2QGuKa+UQqYqLW8fkwJZpOjBiLTEnXTQ4Wjcgci1c8u9RWmmSzSt6
	I4TuONI472oo=
X-Gm-Gg: AYBFou31W9pglzGIekLIAyL4HhAr0Au186OB6cjYIeC4MDSR3F57J0aUcqzJtslL9Z6
	0ZfNgpn911bgUQUHfeUJEBBidj/40VSQbeJvq1jzGzS/AJgV0zQhycTPO4EO5jBqBvGQPDXkKgQ
	CY5OnOeyJlGFVLw5coivrRQulqjdIa+aMYzkkYr43IAPz30NvgJZF/HftahNxCpkHJugXQE5gsc
	S9xg190ZEqJdYPAJRkJ4EX3jI5Zs8t1rTNFBkedhkwOmjD1fJfx7OmxSbXkHnE3Ub6DOQUWc8Wf
	RN8SOliXm2PMA50tQvHGMgqloZQgkzXzF9588ls/b7JM6T85JuAraCYsNHEfqazZiMb6enJlLol
	bdXVh3sTevDIDMNIZ/GmOgK0qEhH1knniuX9QmLcV+sD50cE7Nrq951oIqeL4pBhY6D6GK1cpyw
	f8zzp6s/VdjstzgeKpv6oBrkOpVGCJcgLY6gZvMqpKY/LUDCJhgBE4uXWgXg1Vcsd67EzbkBKzV
	rCYIQgy2jKEUWj3IIT3RgeiCQz9suVzclCK0xYXbWI/yHw1GpuA3ZXiq6FW+Puf84qoGB8eaGvB
	MCJt1KKuqxCvO8MjnEgkDs+gsCoeQ0PbzsndkloWyXYLjM1ML8+IA/mAPtkByQbhvEgSMIZQ7DV
	GOcoD9q7Lj+4sBcTwuyUz01GluIWP138lPPQa4SyUmtUWfgnnBiIKl4LcLZkCE+ueNFvNXxq7/U
	a9lXtD/kT6E2H4nU6BTwM=
X-Received: by 2002:a17:907:d19:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c419e23799cmr365428566b.11.1792357326420;
        Sun, 18 Oct 2026 14:02:06 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:02:05 -0700 (PDT)
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
Subject: [PATCH ath-next v2 5/5] wifi: ath11k: hold back WMI commands while the firmware restarts
Date: Sun, 18 Oct 2026 23:01:53 +0200
Message-ID: <20261018210153.1925962-6-julius@bairaktaris.de>
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

ath11k_core_restart() brings the firmware up outside mac80211's restart,
so cfg80211 operations keep sending WMI commands while the HTC services
reconnect and before the firmware reports ready. These commands crash
the restarting firmware again, and recovery then fails on the unified
ready timeout:

  ath11k c000000.wifi: failed to receive wmi unified ready event: -110
  ath11k c000000.wifi: failed to reconfigure driver on crash recovery

With iw setting the RTS threshold in a loop from the moment the firmware
stops, the firmware crashed 15, 15 and 11 times on three triggers
before recovery succeeded. With this patch it crashed once per trigger
(5 of 5).

Return -ESHUTDOWN for commands from outside the restart worker while
ATH11K_FLAG_RECOVERY is set. mac80211 replays the configuration when the
driver restarts the hardware.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3d5b6605eace8..5c27e7057e6ad 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -312,6 +312,10 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 
 	might_sleep();
 
+	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
+	    current_work() != &ab->restart_work)
+		return -ESHUTDOWN;
+
 	if (ab->hw_params.credit_flow) {
 		wait_event_timeout(wmi_ab->tx_credits_wq, ({
 			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
-- 
2.53.0

