Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489287;
	b=evzdiqJjIkMrCdfmX0vvBeBcUX8hjmu0+u7wAPBxgTthPZGmKZmBBfskS9CJM+m6A/74
	 wQIUJkLvOf0iyJuKPu15kU9H2bKp331O6uSTRKwKM6gxclfMoY5nVNkP1A/0YVM5vLyVZ
	 gFf9t9Dkk0o5mmcffL6A/0YOTPanizrCStHp5aRVswJYVya+A9n0ES1PTmP3c3GU+zQgQ
	 p+IuKDRIp7kw/dWxHmlh+RCv4wE9TS0/yB+iE6xDcIK6Srti8hmq0winE5+Z0Q6iXRSBf
	 bDoomrcWUf5vSwgYz5/mVoG2AedxnowHMT7rT0BvYaGxHDF6cTUY5ypR9Ttfeh2MhKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4DWrj9scuTY9FkX1CPBn7CvuhBuklco6ob8cgWlL50o=;
	b=s/toqEFK5vpne9WuurhAJCy8a3c5CuepsocN5V3tFQ5nMUlo9s0vIdjWkts9icb4wrEk
	 eJKun8cwIVNJEfbO53QKqKit5XClpBsuARuN3dKhUcjljnYIUa0rpef4yKDairfR91fzh
	 ARYhHdY8Y/u5yFdG3w0la1R1pSixgCSr6XFVvtPPCc26SugbLeI8+X8BGHj/FpLXlcpMo
	 s0ipO1lO4JAqier5G2tkI1cDF0pU6BIVbf1QXqzhpZPFceMAgwP77Hxpgj//6JwwVKJnN
	 iJ0jq5qwaADlbb6t8ptGFW8EwShgjaisUudTmZqKeGcghLTggcxbTE4IvvVZ8FblCUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc7xTBuZ;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC231606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC231606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc7xTBuZ
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso525064c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489286; x=1795094086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DWrj9scuTY9FkX1CPBn7CvuhBuklco6ob8cgWlL50o=;
        b=jc7xTBuZbjhTUJHvTtDhFZKRxdPqvnFkI/VJrp0f+PS/R7XmDEYlECTimB20oR+GnH
         oMw01DI9rphJVXi/fT6j76kbbk1Nip6OI3A3cbD4sq3Vpjrx72ZO3eyd4F2QJZNnewqi
         0q/PHuPmPmNanfxnx+aDXm+Jw7ngcQGkr/VuS2OUertGwJvP0ifuSGvs7j46Vmrse+zj
         UItDQzlpIcvEtoXsL2GtmD8K5aUwmFEhyvqQfXJ+a56FmfukOnLtHJw1EzSHeRJKOEFi
         7pk4R0ceQlfR0d5bPhgxoxV1+JoExXZNL+67KnUaQKYyxUbM7LbEbYucU4UnhTqhCF11
         2tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489286; x=1795094086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DWrj9scuTY9FkX1CPBn7CvuhBuklco6ob8cgWlL50o=;
        b=uh0wb1Xhyfi6sDEYtP2p9uvI4jU3+06/42zLT416yBD/iTYha5vdCQ6z7LYHmVbJPb
         69czMFBXT8+uaXlov21HI/Y3q8J3+qNX+XRBl+3dLe2XVyxmM5Xnutt/JJsM2uZ+OFCk
         xnYYZMPD4zd59en8tgri4SQ+E1ZmjjUcImshZ/uS/VfpWnyDG7OUqYNXCSHQ8LKckCSE
         2ggQBUU/ojQB+UvmmUt6a7fCfu2qpkFqZIBwaLMTrIe0Xs7vgq07JJbpVrTvOtt5gSIQ
         j1vZRMyjF91ct2stSUNFcLO3CDs78jfTz7ehBmwc/bVRelUsOTqGuc2m38YxHS0pJy7U
         8hIw==
X-Forwarded-Encrypted: i=1; AL+hErEKQxtAnnpJuuOoi1zVMTGIXwAumSCdxHY8KEVFDA02CjKvlCnPTXSWHXZg+OPX6smUbwvsA76SK9iDCvg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zfx+Su7YfdrKxqjRiJyiqeAY3ErowSfqo50qcHWAbzutbjRSh
	HiQgnQNkSUEXY59T5inGcNSuEHTtukzyrN/Vag5l5O3uUosWLm0VSdDG
X-Gm-Gg: AYBFou3pd3VoFir1RX4w+nXqyaeOWwHFu1TjVUs0j/qlUX18vocqcAfYRRtZUpcsB7l
	KEZkiiDYwKy56iuueD3aOjk3FUb+sLP1b6RWmPcR/xzDvAraQFhnX+CqfoTwBjZqe0EPVmkkLaC
	6wwPN0lVGYzrlFt+bUG0CVlCxmfMupthn99yC6xT21QM1pH98kvoa3VirVA7yboV1zM/sAjt49g
	54QoSmJypYcLSJHB1X0qNTqFapUgZ+Cii6U/vwAwR0UzGvRUSxXCZurvbmAhJovL/3GDxIKgagV
	bFFttybgPt1nDa6zz2Q37tJOzdKmSuz/dlzCorUWK86nghC7xooUp8MX+xz28y92I/d93i+O7Gi
	LZcQonhBTuhMFciZnZEBBoStP3VUbyER9h50JoXWtZWHws2F4/VZOJ26HECiR4DNXv0Rb+FE2De
	k9GAlZpXCcPPbWaib0s9UX9IMio6XRfOzXv5N3HumJibqW4RSjNEajnrsJgi1iOcQXeSfI4P3q5
	RR51wg4bARgAoRgcVrZuwJnzX+euoQCQF2SmJkkIRVN9GtGi7HuxQhOygxvWtluy5+Bj8PEjHzs
	FV5NvTUKx/86KegfXyaBLA==
X-Received: by 2002:a05:701b:2219:b0:1b2:5ecf:9bd1 with SMTP id a92af1059eb24-1b4f5f1f0a8mr1962840c88.7.1794489285963;
        Thu, 12 Nov 2026 05:14:45 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8985969c88.4.2026.11.12.05.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:45 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v5 3/3] wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures on PCI
Date: Thu, 12 Nov 2026 18:44:01 +0530
Message-ID: <20261112131401.236433-4-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112131401.236433-1-skalpesh942@gmail.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com>
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

A single timeout in rtw_fw_leave_lps_check() does not always indicate a
frozen firmware; in noisy RF environments or during beacon loss, the
802.11 null data frame ACK can be delayed or dropped. Immediately
triggering firmware recovery and a full hardware restart on a single
timeout causes unnecessary disconnections and kernel warning traces on
idle links.

Follow rtw89 by introducing a consecutive failure counter (ps_hang_cnt)
and only triggering rtw_fw_recovery() after RTW_PS_HANG_MAX_CNT (3)
consecutive failures. Reset the counter to 0 on every successful LPS
leave and in rtw_core_start() so that cold starts and hardware restarts
always begin with a clean slate.

On chipsets without FW_FEATURE_LPS_C2H (such as RTL8822B and RTL8723D),
rtw_fw_leave_lps_check() falls back to polling REG_TCR for
BIT_PWRMGT_HWDATA_EN. On timeout, the driver forcefully clears this
bit so subsequent packets can be transmitted. Because stuck firmware
never re-asserts the bit, subsequent register checks immediately pass,
clearing ps_hang_cnt back to 0 and preventing the counter from ever
accumulating. Therefore, only count consecutive failures on devices
with FW_FEATURE_LPS_C2H, where C2H completion signaling reliably detects
consecutive timeouts.

Additionally, rtw_fw_recovery() clears keys via rtw_iterate_keys_atomic()
under a spinlock. On USB and SDIO, register writes in key clearing sleep
(via usb_control_msg() and sdio_claim_host()), which would trigger a
BUG: scheduling while atomic if executed. Because USB and SDIO do not
support firmware recovery, restrict firmware recovery invocation to
PCI devices via rtw_hci_type().

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 2 ++
 drivers/net/wireless/realtek/rtw88/main.h | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c   | 9 +++++++++
 drivers/net/wireless/realtek/rtw88/ps.h   | 1 +
 4 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index a74f199a93a..d6acf33c3c9 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1536,6 +1536,8 @@ int rtw_core_start(struct rtw_dev *rtwdev)
 
 	set_bit(RTW_FLAG_RUNNING, rtwdev->flags);
 
+	rtwdev->ps_hang_cnt = 0;
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 6ecbeb4ffe4..525f17590ad 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2113,6 +2113,7 @@ struct rtw_dev {
 	/* lps power state & handler work */
 	struct rtw_lps_conf lps_conf;
 	bool ps_enabled;
+	u8 ps_hang_cnt;
 	bool beacon_loss;
 	struct completion lps_leave_check;
 
diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index add5a20b843..908d2ea3572 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -166,6 +166,15 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *rtwdev)
 		rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
 		rtw_warn(rtwdev, "firmware failed to leave lps state\n");
 		rtw_fw_dump_dbg_info(rtwdev);
+
+		if (rtw_fw_feature_check(fw, FW_FEATURE_LPS_C2H) &&
+		    rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE) {
+			rtwdev->ps_hang_cnt++;
+			if (rtwdev->ps_hang_cnt >= RTW_PS_HANG_MAX_CNT)
+				rtw_fw_recovery(rtwdev);
+		}
+	} else {
+		rtwdev->ps_hang_cnt = 0;
 	}
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/ps.h b/drivers/net/wireless/realtek/rtw88/ps.h
index 5ae83d2526c..b088fad7cd8 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.h
+++ b/drivers/net/wireless/realtek/rtw88/ps.h
@@ -14,6 +14,7 @@
 
 #define LEAVE_LPS_TRY_CNT	5
 #define LEAVE_LPS_TIMEOUT	msecs_to_jiffies(100)
+#define RTW_PS_HANG_MAX_CNT	3
 
 int rtw_enter_ips(struct rtw_dev *rtwdev);
 int rtw_leave_ips(struct rtw_dev *rtwdev);
-- 
2.53.0

