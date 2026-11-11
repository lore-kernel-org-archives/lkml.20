Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381440;
	b=KxiKwYcg5F6ZbWE6AhrR7PyUa8hrY5FtSUbMqX97FjdZ6iDYggYZBux7L3mv7JFcOtnU
	 19Tkf3J5i03XWwSBXf95oIm/bBvZXNsx+2mJcTQxiRO1sh1RX5kNldRGyIdeLSW4++evU
	 8dIFU3D708J2v2J24eKxK9msDJ9i/PjTWU3JAvmmz/6i9cMGB4ndgLwiv3gAnVSRS0uA1
	 rSdEQ/6lLSVR4Icz5+6hVCHONy6lMFLVhQwTqHWOoVQy6g87j9Am7RmhgxnT23Kgi4zTC
	 c+KPSZYKAxc9oUROWqVFt9S0EUa59K80Nbk4XF298pMckqvhRKkSIFk9OM8an1Dw+tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fYOrVudE7xuehA9OMZyQ0/ibtLJNVSQpw569GxjS41o=;
	b=TMcT8QnlrJsB4riFLTVfuOCK5THqvtN2Jan6fKSH/dNy1KDJdR/NseC8g10cSUNoJrs+
	 zyGr/IF95d5lvF2rfd6xm81f+dxggjCEG9O1CWm7kdV4ohcmq2qm4DL1HB/yu0gu1Vm/j
	 RntcJb9PzFwakg2vg3nqSNOy2zstUBWXU7zfRCX80ViaCHmp9lUDzUDI3UYzZ2CsIbYNe
	 YCYRgl+bp/3xjGQpvpQhGLdlLGdaQ10fIg6VZOC7G405K2GYvXyaQrbgTPRcpqq8jx/WI
	 Jg17QjtCm0AJDHWlTt47mNfKaOE42ujnwOk8UEUmJSvEvY1miQTy+6VS3EU+aPQREeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwAbvcGZ;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4210F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4210F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwAbvcGZ
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2015353a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794381439; x=1794986239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYOrVudE7xuehA9OMZyQ0/ibtLJNVSQpw569GxjS41o=;
        b=ZwAbvcGZkHg9Fcc7kNBAM599TVbm9OVCd00oyls/jNEgkZSVDQVAKvhDETscAjl3DJ
         wicbwXeDB2q5bMEC5MWobAzYaMiT2tQ/+XEDtD1cFIgASBm9PUmrU1h4D8TogQ9UWHJN
         pp+Nfi3u7pzpxw3GwGm3u7AiyN/d4GsfCHjsLB2WneXDSn7/XRGor6E53ZqN5xX6unjv
         YtU5fZkQ0TNi9cGqnY3z/h0tS47kEOLJniIf30OUdYcvQkwZa3PdC+aw8n8tai8p27BL
         tO8Lg5JsO1GYUltKo8T3xwvLwUCpoofJWSTZFc8h4HoBA8m0Z0rxKdh0eZBNUMFq71v1
         /04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381439; x=1794986239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYOrVudE7xuehA9OMZyQ0/ibtLJNVSQpw569GxjS41o=;
        b=m2YiChwe2Ij2z/Z0fp5cDVfaUJzMImxkAgON/gd6aNVwMlfBNoEXUZ5iM1m50DQ8Xh
         RYShYI7MeVrNY0CK6mgkJxL17ZP7JFohNHUdAzjHnips9LbDkGYxQxPnfzxqt+9tGQQC
         zicsd6BG3QYxbWf9cH47xcHoxbgdHgw1Uag440kzBpbu2xKP21oPtrLzE6h9j0AQU8WV
         s/MqvUdZXq+WmzbzWyYVmSaf8bdmwg7NF1qDhlnD5uR4odEZVLrw6NgSc0lQzdVuLdja
         EUoLYlXz1cMZtcFd8oDcww3IX9HAQO8QQwV3PbmptCpZUJLAAhozqLoCRpyGGo68xJAz
         kquA==
X-Forwarded-Encrypted: i=1; AL+hErEr50yK9nhK9TA78T7YiiPaIZyj00DaX1TkKL9XHzHG3tZDkTFGu19ewh/e67yySYt1/lVYfBquFiajjGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LnCLoZHHfdE1ukHiuA62Q+zwB1+446CDJ90Nte2nU/emLykAd
	WziKm3EfyW0/DwhL5cb7LMVb+3/DIHYBeq8u54JT6icBn2UTwmrknxlSBWZuyw==
X-Gm-Gg: AYBFou3jBZw0NoJNJrXjtSSqYyfvO1Q3Xk+w4vKuzdLzPpblGUIXc7cGzrZC/Sw0REs
	4V+kdL10RRMzj88QN3HFaMC0qrGss1Gga7XsxEKEBwKc4PYGbOl1a33rvrLAGh4ZOUjRopBpaz1
	ipFh5SUNRxZNDQDNWwf86FxuMWTq9MemOOZg1VT9CqFV3E/+G+6BhBHHUywXRU0xl71TRI6TieP
	uCY4M7Yppeen1v7FAKwT4TF84Zg2PycKBxc/iA+Dbj2RfeiQYzfTQ8v+yVllFAn28rtDY1xkWbF
	zs98M/7T4+dfFICNvodsf9QB/ovkAEVTh0ygnaTMaSFXjwAtGI3C+Nx583OtDuQNd16QaUTWHHz
	TbTvgVbMQKlA7A0O1S2PFCl39GqPm4HQttD0GANn3sVbVAv+TCEmtwxBVzY37Z0UH59fe3hO1Yl
	1kh6bLKdpDLEnq3fKqdk3m/h+9Ycn/IOag6B5jejC4mB6FCKvZtMOqt21ots1ASt4/VzIRZqbHo
	SE1kfUoAK2HNzxziihNmYsxCx93KEhsCO8oEpSLeZ2iM2QYvS0oCQnTi01AMqseVro3adcKI7OZ
	eXVVGSl0gKldOlaJ9rTvKnQ9+Zt72iVVpw==
X-Received: by 2002:a17:90b:388a:b0:3ac:6fcf:91d2 with SMTP id 98e67ed59e1d1-3b182e94544mr1680100a91.19.1794381439520;
        Tue, 10 Nov 2026 23:17:19 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7d964sm17688565ad.32.2026.11.10.23.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:17:19 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Account for a MBWU overflow before reading the counter value
Date: Wed, 11 Nov 2026 15:17:09 +0800
Message-Id: <20261111071709.3115172-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
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

While checking the driver's overflow handling and NRDY behaviour with
the design engineering team, the following problem was found in
__ris_msmon_read_locked():

__ris_msmon_read_locked() reads the MSMON_CFG_MBWU_CTL overflow status
bit, clears it, then reads the counter value. The counter value read is
where the overflow is accounted for, by adding the counter size to the
per-monitor correction value.

If the monitor reports NRDY when the counter value is read,
__ris_msmon_read_locked() returns -EBUSY, and mpam_msmon_read() retries
after waiting. The overflow status bit was already cleared, so the
retry reads it as 0, and the overflow is never accounted for. Each
occurrence silently loses a counter-size increment from the accumulated
bandwidth count.

The overflow status bit was read before it was cleared, so the overflow
has already happened. Account for it before attempting to read the
counter value, as the cleared status bit cannot be re-read.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 27abf60f4d67..5384c9a4a1ad 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1528,6 +1528,16 @@ static void __ris_msmon_read_locked(struct mon_read *m)
 			return;
 	}
 
+	/*
+	 * The overflow status bit was read above, before being cleared by
+	 * software. The overflow has already happened, so account for it
+	 * even if reading the counter value below fails, as the cleared
+	 * status bit cannot be re-read.
+	 */
+	if (overflow)
+		ris->mbwu_state[ctx->mon].correction +=
+			mpam_msmon_overflow_val(m->type, msc);
+
 	switch (m->type) {
 	case mpam_feat_msmon_csu:
 		m->err = mpam_read_monsel_reg(msc, CSU, &now32);
@@ -1569,9 +1579,6 @@ static void __ris_msmon_read_locked(struct mon_read *m)
 
 		mbwu_state = &ris->mbwu_state[ctx->mon];
 
-		if (overflow)
-			mbwu_state->correction += mpam_msmon_overflow_val(m->type, msc);
-
 		/*
 		 * Include bandwidth consumed before the last hardware reset and
 		 * a counter size increment for each overflow.
-- 
2.34.1

