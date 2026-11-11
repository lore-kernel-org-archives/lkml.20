Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406406;
	b=oLYirwPbYNSneasS/VjJ7t7sfQklJvJZ+w4AHRvzkuu0uAeKVkGygpGzaRGrBfN1YA4R
	 fE6J7rhZ7n5Nie4F+ESdYFdPMFFSMelgyK9D7eo0G1Zm1/9z9Q5sidlJcqUe4TRggdrT1
	 BZ/foMJWMOaWWcpxHLURW9mksVrnYzFUMqbQdQi4VrulrVN8TM9iZWWi4EcSQdpdjhAAq
	 XA5f/LnpyGa+DAl3e/YsFLSK7QyvLN9VjA4rMV+JtCqH2tz4uODXBYZKIjTT0MgC1+5T9
	 /gXnDjqAhWq/oLh+o7aDC6DRFnq72MnLqfV4VNOhBWAV6fqlM9hQXLxcS8yT6lo4OyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oO8bzIPeevhw5WYdeSgRvpgMT/FxpDOZ2PUW72UZblw=;
	b=sG9aaw2FTduoSJ22btJF+djrhp4OfIKvBnAIen45vbOcvLjK6uHrUhvGjRn6jz3Wlbwe
	 KCHlcAsQsa79XQytJciS7L2mWJF45M13fvLqLgbqwrNM7nunEAaA6lO1cBr/YWsLuodQm
	 xl+boN3MdoJKkRvHI3w1OIm5+Vn29l1R1EkkguDiMjtJzp9I0NcQqiXKdzkuki3rAjmvX
	 AyLTpL2N9+JVXM+KH6fcaRGIM84vmQ4C6gCyVIGt/J/2IXxDA3uZn7BPZnHsxDgyt8w/p
	 9k3Dp0vSl6Tk9KQ/ITGLieaFX61ZWiN4RwSrm/x2kqXQd8LpgqqKVR1lIDDfw5t6C3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7Hipcsw;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCD6606A889
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCD6606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7Hipcsw
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1332171a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406406; x=1795011206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO8bzIPeevhw5WYdeSgRvpgMT/FxpDOZ2PUW72UZblw=;
        b=E7HipcswdfbRiy0VHFux3K1DgUnTdbfMIxMCi3RCrpi79Zni5z/Kt9HcoX8Bc/VBrO
         lsh2hN1b5yquu8crVIAWhnvhmoQ6JtQl0Ab9vmc1mBOhonxk/9laRmXTTXmhLFtXgHMx
         yUYg/j0NRC5hNC6/NeG857hJ4dDmbWekdgeAV3SqOGTEwit/b77cUPwHX/KZjsapN1CB
         zUPK/l8tu4q3P+oBv1/acMIbGF0uoGa7kHBruVhP5TfDqbHeqC7B5lgVDSPXCGljPutU
         tQDxO5JGwamNO1mjx+2+yMSmGa6Lsyd/GDtafsC1403qpSU4OdWL468Y1v6JUudfZc9k
         SB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406406; x=1795011206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO8bzIPeevhw5WYdeSgRvpgMT/FxpDOZ2PUW72UZblw=;
        b=AYi9mTBOGiOvjPAj4TnplaxpeCB0nJ7+6wLrlvscPt2qEBZAG0LIofGXn+f+jAtAIs
         2dk38l38iZDrxMgEQKHmK1WjigciXUziwugB3ldeeTioDc4NwLAlVFmDR5uYwTDyQ8nX
         3NWv2oKVK/cN9nNO0Fu0wK9rOQ2U0VDzUJY9rdTH/CJTkcayz/Iy5LWrIVis03oZzN7U
         sQ1Y+l0ktRMOxgR0mrzRc1Hb+qGDVP0niZRu+l9rKABzHQpFKvtItzLBu+nDrqgWGJHf
         LbqQ9NRLumghYdynMhwmk32JXb+zuWCuO4vhFVM9hVEhne/3u+GP3KxfNuycLOU1eNww
         Vvog==
X-Forwarded-Encrypted: i=1; AL+hErF4RuYIi4W12OYc6Jc4EwyZcaJ/gEkdRVjO8VrQRZlHW6DeR+k9J0xuZF4ka3b+k5K6U9gKsARidpwlTks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eeqbABBHZsmxDoPP8HiqIvcRYLSn4oNrdZ+U2p5IDOeg6erMc
	ZcynZCVu0kpTKqTEfdO7iBABSmSxFuFMB5ThR8VbjTwmJUCgCOrFoSAe
X-Gm-Gg: AYBFou0/Oa2sWud/XnGeZ79FYm/TBLxOv6DhwklOjS6EgJS15/DQBkzdupeEDG3JDr7
	Gy1TIr5IerCfCAe/bqAfGxAAnhGmUkkn8PHvyii2uC86shd0SbAKM1YHlyc3I0RhPrPNyVCayZ4
	K7cxBZ/v3RHmKmjT3x4PjWz7j1ErDz78Pz7Ds/92S5edGmKROV0y36/YiBdD4GCHFWEMzNUHjDe
	ybCy6tLP6awpfgxqx34DpTv55wLbq5crjzZPpCHvS2VrKXZOCzPy4IdpwfCkVNziELvIYu+mxfO
	Fh9cM9j5aWxuvN8LArGz1Dpfl5YeIXvetmrjn9VhsozhBG/ekYIH/XvuV7T1hd4sMB0gAvSgq08
	UiimyyViY5PAFzGUPgxg2cnwcl9lN9K+KA7jRfC/Fq7yLZalmvk6vCDnspheYiQlKHEyaicHHdI
	R/GMFylGM/6RuPE5hKdacsOuowTTe8AfusugPghARXosm/Pw3dJJKxdxvgUha1RZofVznIzVfq+
	xjq3HfMpZu8qfBt8cGru859nn4xSWYFOQfn2BtNeefCQUzvpDtc+sIqpZxAlfto3W3rkSwJKe+H
	48k=
X-Received: by 2002:a17:90b:1a88:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3b182f6a75bmr2507396a91.62.1794406405675;
        Wed, 11 Nov 2026 06:13:25 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:24 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v16 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Wed, 11 Nov 2026 22:12:23 +0800
Message-ID: <20261111141226.9482-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111141226.9482-1-qby140326@gmail.com>
References: <20261111141226.9482-1-qby140326@gmail.com>
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

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101
- 0x00012101

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 013e19395d71..1f7f2fd5ce5f 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -111,7 +111,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_CPU_FAN_SPEED		= 26,
 	WMI_EVENT_CONFIG		= 27,
 	WMI_EVENT_GPU_FAN_SPEED		= 32,
-	WMI_EVENT_WIN_KEY_LOCK		= 33,
+	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
 };
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 0, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.56.0

