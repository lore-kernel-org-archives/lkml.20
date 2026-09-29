Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BD052CCF3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689556; cv=none; b=UGaB/cYiXol9V0gqnyEV4pWkY0zQhJ3hoY4Gi1Y4f+DoUVZJWrehDOyKxlq7gpNLpwbd/kr/w7VdvZiKTB7wdheJsVPPCMN/kGfvvV6zSVRdSLsokiaN3XRBT+9YnuBVsyTlJv1rkmCIY0ucXbmiTPEHEH1+XGaCdkGnrLJ8a/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689556; c=relaxed/simple;
	bh=CkPHq3FUuYucrdqsssRbgtC5+6P2aMT9rT65cSJsoN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFNk2x2/l4Bt/wQPQ8f/UVnz3NtKEHubBZFXQyAjK5NkYWbMsUO1Q0i89I7gm1VUoL1sxTI5NT0f9pDsgH2yZEM+mBbsYH9BTQjt3zojNKtJcQK3U32U14fc+6vZLq3SwTHrkfUfNUUNn10VDUyL42nuy24gLWq80Dnc9kwtm+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlP907yo; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlP907yo"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87fd84c0bfeso1668197b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689555; x=1791294355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLH5W/87FZdmLURDb7OK4+4f+lis6lqDHMP46iSlwM0=;
        b=rlP907yo+SUMvDkAEscuWKL0L6OoK8g17QEyA/Qh2CSZ5MczfpiPzd9S6HMVQTNWbV
         gVQ7P1w72my8H0vAQ6xyRgTmukminm3f4QcUAkxcYp5w857l/5kP1pcGqXvu79273WhQ
         7k4rmfe38k6slzY0qE1kM2NvXluzOyu0uwh8FcbJgBnx/wvvPNTPJJ2tARIZu+L7yNUe
         QiFbhUCSii4BEyD2ys1rWitVlLrJZx75R8Iyyywo1HdVPdTifNUp1x4NECrWcAhaQi9b
         dD+AJwOIr2bawrYngSLlaw5KadwItgsWqVGUW9WEf32sHclUPR4NanOjoIGbyf5YYQWZ
         FI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689555; x=1791294355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLH5W/87FZdmLURDb7OK4+4f+lis6lqDHMP46iSlwM0=;
        b=i9QHW8HOo1Uzk8S0QkuRQNXkOaPQVj3z0SOAhmNqy5oWP0+c0r6RUirPHMVuHYoPoK
         RKx/RKp6ZpiC/2BQVvvWBgf0/gkSMC+KC2PtBFVMN7skOjy/aTSodoJ7az66nfXfmTio
         jz26o5OBY8lM7UYNIJhZZGMYCPdyM9hffAQkfwk25TSUwD+VoSPpynDpbh0Sw353AAnX
         7yWeVsXEvtctWBPwlSE71Rd6clqFVQOsKvEB2z4uecEJHWczdljeCnFRf7QDIb0bdQ4a
         5YdtqPOFQ6xiNESpW0KDzgszqVlPQ6l7gg7sjgi3nI25uGgwxjbg2E/PLHNBrdBul+2B
         Ev+A==
X-Forwarded-Encrypted: i=1; AKwUvBxtmxiCPhPhZDe3N5UWDc4b+WB7SNzRIMMe5n8aFy3nfxpt7JALKm2aLnXPquB+2WE5QWTfIW4M56zL1tk=@vger.kernel.org
X-Gm-Message-State: AFuF++lYDfk7IOKuZkIXSasGbg7+s+IW7mM222e9YxQLsIN1Jb2SAfqH
	00xsX5GMUUUcv47ItLKx/UAWXjvJBlM8tQRv9XwGviecHkjGX3EZhf3P
X-Gm-Gg: AYBFou3CFw9mOFehwGtj1sJ2ml8M5+l6xVXr45do7+DzjGiPreY5tuoeEpi7XAuRhMh
	BY1I6GANAYjlWSNAKJi5hW39gdSzycJ62ZY0HZITsbPUu4v2Q79hNmeDWoVGCuAsYIvPKIiEph3
	VFxVSWSzEgHE/KSjRrf14Pj1uuMz7OYE+kRNfoSTJ3BMd5H1LhbSd37wRTBEZ/oQ9Yr0iLC/QtD
	0dMFVcBK0wqM6GyB8bbCpBq1URXoGeGL5j3Y8ksfyFgpxaW73/Ex2Q/Xzg+brNy5k+qBxpDlQKj
	unJWLpET+dtQaFPoOnuynxLW/as7iXbUqalC+sBkfHGDQHxvMALvTSnHSsFU1Jo2Z4E3UBjr5aO
	a5F19s8EaaK1rZp+wwIS9aRi6Bo1zYA7nYrc16/0EjoOsls0U0N6VDDQRWWPSgPYO7DphKXS8ri
	bquVEJCqDVNJzZ98g60C1o4PFhWISk26SYWCiryqIExfSoxDKrjyQK
X-Received: by 2002:aa7:88c2:0:b0:86b:43f6:67c4 with SMTP id d2e1a72fcca58-87e9869458amr12988815b3a.1.1790689554401;
        Tue, 29 Sep 2026 06:45:54 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd736csm919555b3a.8.2026.09.29.06.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:45:53 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
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
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v6 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Tue, 29 Sep 2026 13:45:01 +0000
Message-ID: <20260929134503.17249-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929134503.17249-1-qby140326@gmail.com>
References: <20260929134503.17249-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index e1a81e89856e..df317aa6f555 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -634,6 +634,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

