Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127944;
	b=U3N4/014MAfvAnI332m+sPdrPM64qFWtN6ZW1NEcRerFnzkQQVChJONjugHWpTN104MF
	 u43ivJPUdl4WV12fdzS+sow3QGDpfPwrlzFLhJTkarKCBVXl9rpM2tdrQWZGgGu0yV5P/
	 euZfYP0iRHDDTED4EebH9u+cTBxHN8PsmgilsMFIKzkENqS7+6hZDon+9TkXDRN45hesd
	 kn69lG9eG9U1EFHWeYDuDiBAaoNp7xxRTfLcfkvMJohilUerNmYlhs8a6KoN9Z1YxNUMZ
	 yZ1gN57JmTjuiSr30mt8/ry7UPIhBfYjFVxy747lhhBLYbOD/wtGlFeGIslOkbZZ8PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KVLGihen4u+t7vomj3QVWKFhl0WAyrldSCIuQh4Fluo=;
	b=A/0rq+ffFtZQY5ubo4QPa7defZMTj0ief8D9luQ0XsRDrDztipProEv+snZ1r1pdgTL9
	 EwZKeV+0iEbeiiAGF1/TnNMIrd6JmyOvvr9JZYjIaIj5k+5QxNILxEBvsMWPN0grh/Zry
	 FnATJia4nmmOVoQz7XxSOLMFSCSkgOS3v+e6nTkPmGmMdoHs5VeYw2tCSU1lULQs1ob9O
	 SK/ZxnzXzVEzaJQNrZpeb3xANZxOvsJITLvrOetBAopV4W9HHl5evIdNp7MuIoEhe6BOQ
	 E7gZfwyu8UYpWU1d+x8lFjAwS4iYcgL+vO+gjAtytsw2okR6lLHtpGibqF8kwKo4GrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh6Nupwx;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68083606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68083606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh6Nupwx
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso724757eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127943; x=1794732743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVLGihen4u+t7vomj3QVWKFhl0WAyrldSCIuQh4Fluo=;
        b=Vh6NupwxhBlFRBX7v/K63YbgKPiuUfr9LjtsCUWB3WXNNkfRqgYaO3SlXGFl/xArng
         MQ+else5u6dOlK7rh9SY8CXwSa5CE452/wSihdDOqDeUxs5ZRLjNlVY7TVwVtjMKKsJ0
         0JYuINX5E36Cvx4UZ3pTv7KYhvQ3m6rQXkqPINM/VHRENt/km0PuG7HW4XfVxxoegJAG
         6sg4MXsr2ryEWNcE5ZxcOmjgYgKY+JNNMmoQLt99a+vqu3qW9h8ozrPDWDP9moV1sXpW
         /yaq51u+ke/rGmr03CDCLQXMgUxrxZC7E6OKlWLvFM3s7K1xKACdwGGPZBZjM+Hhh61b
         V56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127943; x=1794732743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVLGihen4u+t7vomj3QVWKFhl0WAyrldSCIuQh4Fluo=;
        b=OX11paIX1zvOaS1oypGC/6o/whEM0M5Njkb5TrvzhSyBXFGa1e3LJ4By/E2R3C3nJG
         TK82RabG7+NjevBmC0jWHEsZj1Fn8TstKymS2eWjHdmE5J3Yx9U7bH80ZIgENd6nJNv8
         29cMTKTKhuQtmGnYFj/GKuPZMRuSD9eJq0JTDFgMzgH55FGNWe7WoXNdXSNX2IujfEz+
         Kho+g3VVlsoLE91nfOSv0HYSVcuRE/7r/lXaGfag2WG69/kec+ArHAkKi3np6hL07KVY
         /4ZSkX6HctKYwdZsJJDJCaElNuzDcsnM0FEiqi/8ZHUMigl37hP4MGWqARX+GJuY/fKg
         YTAg==
X-Forwarded-Encrypted: i=1; AL+hErE+dcLnuNg51ubix7E9SGPI8432TzxCb8pePIdnJxAb3oLz6OxN6NhgOI/eCPKBjCvvcCMv+mi02gVQMcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TAkz53yzL4dsNKcVlYRHiFEHMXZQ6qFYXDQb+E5h7El9cUuR9
	gAnHhl4Z8VqRVkQeZC3qfp9bgab4JOApNZ8pX1gpU2sQ+bInmPyk+kjE
X-Gm-Gg: AYBFou1vIl3ExLnmnjPLEcCU97I+BOdqDn9K318RsTIKrSEMK3KeuDkz2I0yLzznGyB
	64oM4wcjOuU0xnTFl1qjelRnFSmeWxnwDkNC676g29/kWVPExvgrx7/8KkT0jREXGbNedzi91oZ
	QXK8Api6TJTmPBrjw05n7G+AaptFoWAFQhC5ei2mfblBRNFrNMvwivEB93+dCHPV6ZDFFdUhXEA
	SwfnqBYXqu/fjqGtYwy0NHoE9kxeNF/OBVsQssCW8GgcnqiWJ4L05jwAYeFkLmU1sC5CO93vEGt
	xjFKm5j20CXxmsNUUN5i8J5hLI4oowjt1dTo7joXC5cE4HGY/EeRj2epi/w/HISwRkW6vwY89vz
	LIM20hEhIZzu7BmbfZdY9Jxlw2NKaa3AgLu8mhNxSRmagIWHYSIXVUB7xwVdQj5Sad5sQN2P1ba
	GAtbD0mqy5EenwkJuAvJ/XIssYLxdULxOVYfAgMjTHCTDr5vlpNSheiDvMt92Zu4Z0YHB5tgBq6
	R0ISqEDsfs8a5K1d4CxLthq38WOHBamllu5yUvoeCVKfQmWf3PdFHC93cr6b3Gc6NV9zeX8q1WJ
	3R88mGc0vY8yatu/mMj48bBzM5pypEOyze0YLBE=
X-Received: by 2002:a05:7300:2153:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3725ef0f5bbmr3340040eec.36.1794127943507;
        Sun, 08 Nov 2026 00:52:23 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm4050694eec.26.2026.11.08.00.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:52:22 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com
Cc: luka.gejak@linux.dev,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v3 2/2] wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures
Date: Sun,  8 Nov 2026 14:21:25 +0530
Message-ID: <20261108085126.331784-3-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108085126.331784-1-skalpesh942@gmail.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com>
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
always begin with a clean slate. Suppress raw register dumps on
transient failures to prevent log flooding.

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
v3:
 - Replace previous single-timeout recovery with consecutive failure counter
   (RTW_PS_HANG_MAX_CNT = 3), mirroring rtw89.
 - Reset ps_hang_cnt on successful LPS leave and in rtw_core_start().
 - Suppress debug dump on transient failures to prevent log spam.
v2:
 - Rebase onto rtw-next.

 drivers/net/wireless/realtek/rtw88/main.c | 2 ++
 drivers/net/wireless/realtek/rtw88/main.h | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c   | 9 ++++++++-
 drivers/net/wireless/realtek/rtw88/ps.h   | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6..0aabd4e273e 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1531,6 +1531,8 @@ int rtw_core_start(struct rtw_dev *rtwdev)
 
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
index add5a20b843..864e2be243e 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -165,7 +165,14 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *rtwdev)
 	if (ret) {
 		rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
 		rtw_warn(rtwdev, "firmware failed to leave lps state\n");
-		rtw_fw_dump_dbg_info(rtwdev);
+
+		rtwdev->ps_hang_cnt++;
+		if (rtwdev->ps_hang_cnt >= RTW_PS_HANG_MAX_CNT) {
+			rtw_fw_dump_dbg_info(rtwdev);
+			rtw_fw_recovery(rtwdev);
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

