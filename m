Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087755;
	b=qRzyLB7F0M5OPByQCXhQl0YdZQjG5aSPfGLdxj4Unxlabq6K17Zn+eYOmbXUnR0mKwRJ
	 VW21DqWXnwdZ2Jm4OCD28mB3qFuLN73umnrd8qppy5MBFoMfafr6zFzx7swDSA+UIFUQf
	 B4WjfHEdAZstsN86Gv0en2wxLH/h9EB5BUvPrz6G9auQcSWgZRG+v2PBKG3C/2Lhfaq/k
	 9yqjUXpt0VipqFtLPGk861tUO/KBO43HnV3MTghrtUzWHb2OKc4IlivtoQPFioP3eBaOE
	 Uxu4FJWQT0BarcLclPfkc6s87hJ49pGhE4ppzpNYW9UrcDVhvtpJO38q1fpAX9WoLcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i1SNxIXweOOqIgbJIjQEMXKXOyJJ3/czuTf5ENSChcw=;
	b=E8WLRLKYFwT+HYr5oQcmtBBs00x5Dz5X7MugZ1+QQuEVM5VHKRT4ltT+SEvtfMPJi/59
	 OYUDJlt7eiQQmywGtbL1TB/OypC/AdjdoId1gWJuyPWaRhINOEXRChggGMWeRbbKrOhtB
	 wK41GMvWFRcTbPqWpRrWof/2bnmDHSF2SqD80V4/iXu3INqXBYD65m0BQ+IFhGaWA0DTU
	 xgmg1nPgOInXgzbwGhkQxOK5lnLoi+pOK8BVOo74p794e0Fa/4+KNJl9DFiovqw78+tt2
	 o5l5krIVMkC9N39CrltOZVcJjOvtkmZ65PWALCdQfDl0/LNb71GM5OwXnnQButwlo5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=pSY2Q3T6;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186B606A331
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5186B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=pSY2Q3T6
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso5482350a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793087750; x=1793692550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1SNxIXweOOqIgbJIjQEMXKXOyJJ3/czuTf5ENSChcw=;
        b=pSY2Q3T6FDl7dyuG7HgMVjOEE9WHeZ3ynaBIN4Vf1SwMPKIic8k6M/D3ow/y/kWS3m
         s+CHiIXBPPEqBePTH6n8I0+qs9Hz9Dxx9O3xjUvv9T53x1OnEDWr9aCFgWGR6ICZ1TkO
         wLFhkHyOU4Fkwud/SudssFYiMZey6Q2wHigv5nGLIcOOL62kE3+iQHFnzoWAXOMLWpNV
         wyVqEMid2eM1qSmU/5/33ek2E6yWBM6vYjNxTdHmhTM9ukpXKWEJnZDhPBm+NMkxoMJ7
         iXZMYifle4Kf5Rg4tjP0fYfaQHPO0Tky8sH5sdQS8bl+ktw3Fz6bFtKK0y32XWCqByxq
         c3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087750; x=1793692550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1SNxIXweOOqIgbJIjQEMXKXOyJJ3/czuTf5ENSChcw=;
        b=MgDA46U8eU2H1jX8yZL9ky+fpJ1GuQjXD4Yk0KBCiDX+DYyhvy5jWVMB8og/cms0iI
         ETCqzbyudYs2vFyI8POdQWkOCZvR4RTbbRdmgJmRHaEPVCEXMC8smhSCnapKuMC3A++S
         BaqwTet4S+c6QzZ2DWNwmeps1V4VzHDta5Rva59G09zk9XH9C2lc4Bp+qaCOlWEwqult
         WGtV0EGdyTGn0P3faI5Upl2TNV1t6c9+g5rwshyWR7z/sT2Eo598OwFyhSZET3EQc0MZ
         hjrChN0xO2y5Dv1Tcb3ZJRm3DrbQDdyjSqXaQE6ep/tbazSXVr6ST0od2Y9YfIkvFBuy
         quGA==
X-Forwarded-Encrypted: i=1; AKwUvBzq0dsXsDJxFZtG7oHDDq70HLdJ0iCxOgy/li73fRQ1IhgbMadrQTNynHpwz08nlRCEMri6f9wH4PKVzpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsKvXNf5whPVgD6Z/U7wb2IzeXo0J9OAqUq41liZD7SNzdeHuB
	tU+a6404W+yMwlqt5pE43PXL212V8nZUnD+oLtrvAQ1alEKrhtbEEnUHD0HJZgitkQ==
X-Gm-Gg: AYBFou2jO5nvP/RZQu4kHfWRaH7l+I6/HBI6m8nUGTiWydJlPaO8T5SMCLjrSjNiDeB
	cc79azuDivzpWwwoH+20qXeg9JZku1uQODekBlqImn0vUnbzolKBRsx5juoomlTM/rVk2IidJNI
	i2QCm1IMNgWtRvRR3LHzf1Zq+5PJtP1tMB3sXQwd1J9ik6jdUz/AvgQbUN2Kk+l4kbTJOrdh8CI
	GXl33uTlWdBH47cjmJ76hqhcqgIXysPMD8fUXLB+r7vxcBtiRXQdPPLVomzp9nDQuKSbWg644z4
	c24zviBy4a120osdz+1D2bVEczJfwR89qPusd4AP+qUDav/5DpTDofUcNZVhn8g/LwjeiJCkal4
	YeJsLvEyRDij3X8NlO8Qcr0BTc7KNnS1RTWtvjYNPapJfwJVZPmnxGFM8Iq0+JvHSoftEyL69Nw
	wuxPvMw8VgyaUQeJlms8PfqU77Hp6UEILgycudfFqP3C6UvCcx/m1ZPrFMOacL9sWKtMMNnWeBm
	v1WjSLIN7Os9wztnyiN4JtiCSLkHswRjJ70wtDJZpLGZeKm5T5//ciuNrIkfC8NNfXf8DLnsgzd
	4iMQaLbvqOaKtPNKWbjWXGpHc8JGO4LOU0vCekmZXJfWwUsxwU9QZdSe/1L0R6HaURQe6xSsNE4
	uDCQMoW4O5TrqH9IWGJ0VdJsPp9J3dPancn6gy1ZNykimPXM5v4bMFvlRNDVQNLwvOAmaK7WFXj
	3x1BS+kPQMb6Rx0oxq2W7aAtXWmAF0P89wnFKyaZ16DP5QzrlfXR18h1HBp9En9x6kx1fDi9sdV
	rJ4cE+a
X-Received: by 2002:a05:6402:c18a:b0:6b1:c774:58c4 with SMTP id 4fb4d7f45d1cf-6b442fe1896mr5512109a12.7.1793087749785;
        Tue, 27 Oct 2026 00:55:49 -0700 (PDT)
Received: from Desktop (pd9513dae.dip0.t-ipconnect.de. [217.81.61.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4669251a12.19.2026.10.27.00.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:55:48 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH ath-next 3/3] wifi: ath11k: add a module parameter to select the hardware mode
Date: Tue, 27 Oct 2026 08:55:44 +0100
Message-ID: <20261027075544.19144-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027075544.19144-1-julius@bairaktaris.de>
References: <20261027075544.19144-1-julius@bairaktaris.de>
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

ath11k always uses the highest priority hardware mode the firmware
advertises. On the Zyxel NBG7815 that is DBS+SBS, which splits the
eight 5 GHz chains between two radios, neither with a 160 MHz channel
width. The firmware also advertises DBS, which gives one 5 GHz radio
with all eight chains and 160 MHz. Add a hw_mode parameter that selects
any mode the firmware advertises; for a mode it does not advertise, warn
with the modes it does advertise and keep the default.

On the NBG7815, hw_mode=1 brings up the 8-chain 5 GHz radio. iperf3
from the router to a 2x2 HE client with 4 streams gave 1.22 and
1.20 Gbit/s at 160 MHz (two 20 s runs), against 886 Mbit/s at 80 MHz
with the unpatched driver (one run).

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Tested-by: Semih Baskan <strst.gs@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c |  6 ++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 17 +++++++++++++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f43..e1a6085a065a6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -38,6 +38,12 @@ bool ath11k_ftm_mode;
 module_param_named(ftm_mode, ath11k_ftm_mode, bool, 0444);
 MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
 
+/* hw mode values are mapped as per enum wmi_host_hw_mode_config_type */
+unsigned int ath11k_hw_mode = WMI_HOST_HW_MODE_MAX;
+module_param_named(hw_mode, ath11k_hw_mode, uint, 0444);
+MODULE_PARM_DESC(hw_mode,
+		 "Hardware mode (0: single, 1: DBS, 2: SBS passive, 3: SBS, 4: DBS+SBS, 5: DBS or SBS, default: preferred mode the firmware supports)");
+
 static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.hw_rev = ATH11K_HW_IPQ8074,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..0d81212770019 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -59,6 +59,7 @@
 #define ATH11K_SMBIOS_BDF_EXT_MAGIC "BDF_"
 
 extern unsigned int ath11k_frame_mode;
+extern unsigned int ath11k_hw_mode;
 extern bool ath11k_ftm_mode;
 
 #define ATH11K_SCAN_TIMEOUT_HZ (20 * HZ)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index b3c778eb15876..615a8fc0b9937 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4760,9 +4760,9 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 				       u16 len, const void *ptr, void *data)
 {
 	struct wmi_tlv_svc_rdy_ext_parse *svc_rdy_ext = data;
-	struct wmi_hw_mode_capabilities *hw_mode_caps;
+	struct wmi_hw_mode_capabilities *hw_mode_caps, *requested = NULL;
 	enum wmi_host_hw_mode_config_type mode, pref;
-	u32 i;
+	u32 i, modes = 0;
 	int ret;
 
 	svc_rdy_ext->n_hw_mode_caps = 0;
@@ -4783,6 +4783,10 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 		if (mode >= WMI_HOST_HW_MODE_MAX)
 			continue;
 
+		modes |= BIT(mode);
+		if (mode == ath11k_hw_mode)
+			requested = hw_mode_caps;
+
 		pref = soc->wmi_ab.preferred_hw_mode;
 
 		if (ath11k_hw_mode_pri_map[mode] < ath11k_hw_mode_pri_map[pref]) {
@@ -4791,6 +4795,15 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 		}
 	}
 
+	if (requested) {
+		svc_rdy_ext->pref_hw_mode_caps = *requested;
+		soc->wmi_ab.preferred_hw_mode = ath11k_hw_mode;
+	} else if (ath11k_hw_mode != WMI_HOST_HW_MODE_MAX) {
+		ath11k_warn(soc, "hw mode %u not supported (modes 0x%x), using %d\n",
+			    ath11k_hw_mode, modes,
+			    soc->wmi_ab.preferred_hw_mode);
+	}
+
 	ath11k_dbg(soc, ATH11K_DBG_WMI, "preferred_hw_mode:%d\n",
 		   soc->wmi_ab.preferred_hw_mode);
 	if (soc->wmi_ab.preferred_hw_mode == WMI_HOST_HW_MODE_MAX)
-- 
2.53.0

