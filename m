Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793526594;
	b=gUrokNhZnqDNCmsTWAkt3KkK6Hw0rJae/mb4xwvnOPwCoNtxS3wpcGJHVuqTJB1hzrbF
	 PeTL3EBRJZB7mg5rKw09u5Le5WKEDkCB/+zzHbLRgT+QgsLm3Yfy+aq0z9NRAnFGGXCs8
	 94C2uOzFFp2BeCA7rf9+6vTVNawLyuroUOKO9qcy8xslrpVzMb1RKTGjtPFCTilftprN8
	 mnpWs6FwhXkbznU3ijk3z121F5+c9y+CryY7PZ5KQNlycqPYyRfLi61WH6pmRWk9rzR1n
	 4fWNa0rnEkZcw6SspsMm/KVQ33vqKUfma5DIIF+NUDzG+OndE+j3DTNzRzlkztnuMGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793526594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Rb04uYyCDNp0kza9eq/3plAgmK27vrtoG1ucV5UIxs=;
	b=thQ0qJjmeUfNH9UOvtzeVirnSBQkKoeVcIEIDy0EsV2Il+58QERtV70ret/mVAu8d9X1
	 QDiaOSvEv0WN/Lqy2EcSJk8Gp75Vn2lNdYvR+e42CM+Ac3yfTKQq4ZENu83dvGAZYJikv
	 iZqnpXcKFkAIWnJmem+6P+eAoVaKtBTagcP6cTLUF/R7QJUGmhisVBXG725LQEZ2B4Obt
	 RJP60hGORP1DgFs52jQsqcyrELfc8/8bRnunPSkyl+zyjPAu2/jSFLYsaQ58si2NIXSeD
	 Valc0Pi4S8+qPRZXDTIWANQfp2MWqQ/ppkGxfPBd/tMIkyAo2TkVOCadkfMR0AwKl7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyvGeBl3;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA963606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 09:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA963606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iyvGeBl3
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1233906c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793526593; x=1794131393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Rb04uYyCDNp0kza9eq/3plAgmK27vrtoG1ucV5UIxs=;
        b=iyvGeBl3S3puAIuFJakyY8LXFh7fn8zIaZ/gULfcqHwZo4H9w6fl7LXkTQxcA2wp4r
         OBVqgnqPtZQ4cvoVCZ3M4OD3VgckKFEEErxpFFua2gU4w0u5oiy1hlwGOXUiLte3eUpy
         JgqDzvAhpQGBkd/s1SJcFMVwbqG4lpVuFX+cDXJhf1S1nWOgq4IM3XR+6KstvBP8EMM0
         nx5IAIMSysH7NZW27+t68bn11LChgQDomqs2eHxBd1e5lnCFkdJAID9GmOYaamX4dNCo
         8vPIulKKyHAyM8CMuzncj+D3QS3YXGcUCB3wPjcL3BYR2PiETonSkIqd5kCwSe0uKEYX
         U68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793526593; x=1794131393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Rb04uYyCDNp0kza9eq/3plAgmK27vrtoG1ucV5UIxs=;
        b=1VBA3vpMifqWPHLnDL4Hs9XXgoZ4uwunSh6ppDDobwaIVKym+seJGkii42r7KZZtFq
         wdvpeCv5LwQSAOUEmRfphCSMiShPZ5TtXoYCdsy3OF70Mc0Zza8EdPvnqOzngbHvOak7
         leCzR+zfewrkc1irShthR2fYGyX+WKcNXWHySgs153WsEy0H252d24krr33miJxu83d3
         5TKTfP3eUw6SlmqQoDEZadZvqho5J0Zl6+1bfjAL1+SxgmNp/4D4bQU+4ntdKsMZmp1Y
         sG4NZoTd6ZbRgBE85uyhyjfsaL083aPBMjpKXqhP4skAca8YNbeL22iD3FjFjITXC6sb
         3EcA==
X-Forwarded-Encrypted: i=1; AKwUvBy1riT6+aRuGsB1mZYt4qzRuv5YOAVk7Bg4H8QyG17ooMOILPwwXKk+l8ANsx7nkXgBK95Sf0i3rqoj4TM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfxu4kVY5VccYs5txZrUL0hhaPJAD1jpwBGquJGIEtChJYlYdA
	KSSSztf/Ht7hWxNSBnbMgDmCm+2AWXR2KPqlmyFkB37zbohSCZwqN3yO+lq+IUV2FfM=
X-Gm-Gg: AYBFou1swHeJ+Qjshl60Y1y4XCAxsFid9HRxIlWiMVdewnlXr9qcqhXUbNa6iVKGg7d
	MTmS/uO5a8gvNEr0PYe9QbODJpWNbFch7zWqy8bZn0MRPP1KjuX8nFXD/OM/msAQZrM2K0fXx5K
	Q9bkrEQt9yqjJyDtMdit3K2JK5yvSzFd8gnjUJwci2KnPMDVT9mUg91cJoh57XHsitgph5UU7RC
	quf6po8YsuOoLbi5+PaVHR1tiHA3yyb2KhSDvV7QH7BAxDzO6L0srW1fCcHtWZuVwA6sn0FYr6B
	aPci9lqzzuwal8nyCfYhU6IwaDLXVrLuYWivXwilNdHG6FRPYqAtj/BlSCGzt8CgjkUnasu5ORO
	AESbKF9TmPuhQrSuupEAtpjlOa7V71yy+KsmaD5InzRgn3Vpu7YHYRERRbf18+sX9QBWpsW04t8
	AuTQ8r+In9s7xUYj3R7RMSyvtaL+eAqWDBJHVlOAwy+vnOne6s0sOH8Mg7MmsmNFHLBG9KLLpzN
	4xufEnwiEum/Vti3g2jILjuj6d8BqKyeMxHGYnUzaINK9kcOBJTEPM1Z4aKQVY3d3OgR3iBZC5W
	5ha06i2CYjrGG+0xBtg+r1yJzA58Q8C0K+gekWPNLyXAqYdcDCGjGCz9BA==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr5416974c88.38.1793526593023;
        Sun, 01 Nov 2026 01:49:53 -0800 (PST)
Received: from xploitoverload ([2406:b400:f11:1bac:4040:640b:8a1:8629])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm40740627c88.10.2026.11.01.01.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:49:52 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH 2/2] wifi: rtw88: ps: Trigger firmware recovery when failing to leave LPS state
Date: Sun,  1 Nov 2026 15:19:05 +0530
Message-ID: <20261101094905.1299638-2-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101094905.1299638-1-skalpesh942@gmail.com>
References: <20261101094905.1299638-1-skalpesh942@gmail.com>
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

When rtw_fw_leave_lps_check() fails, the firmware has locked up or
failed to exit its low power state. Currently, the driver only logs
'firmware failed to leave lps state' and clears REG_TCR, leaving the
hardware in an unresponsive state where subsequent H2C commands fail
and TX traffic hangs indefinitely.

Call rtw_fw_recovery() when rtw_fw_leave_lps_check() fails so the driver
can automatically reset the hardware and re-sync without requiring manual
user intervention.

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/ps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index c6360cf..db1e9e7 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -166,6 +166,7 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *rtwdev)
 		rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
 		rtw_warn_once(rtwdev, "firmware failed to leave lps state\n");
 		rtw_fw_dump_dbg_info(rtwdev);
+		rtw_fw_recovery(rtwdev);
 	}
 }
 
-- 
2.53.0

