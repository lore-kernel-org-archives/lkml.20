Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009424;
	b=MCEw8V5L+GS20M79xwYJwEdUnwaEv9HgVhJB8w17OGuzDR165XzqYBZBEdrMPvPuFqBv
	 aAhWijyQ1jjjio+ukEk1nJN2EY1uRkF4C2BA/9lpf3eMZpvdvLdDa/Df8mhhSwXKfK2rX
	 OSRB7U9ltZk/lCCUJJrw6qYBjTsjbnFI7ZQRYwwowqAgFDUemhHjca3/0HfaHhvXW+rCH
	 DkgNcGH0zl1LvDFjBdpg3pyeq/kRJt3hPhkVh/k/IBOE9/5xub3iF62sFYBx4urvYEcYX
	 dGnOYOvos9wv4uM2zCqfHncYBzgPQecR0Tggu96bdN/5IZogsqz3vQISguBcTYnN5YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
	b=hoa4qDLCnTosaP7MJJOD5+LZb/LnWdm+5jhd5YBXb5idB+IddfMuOjuuTdI2SnJHOIBo
	 9IFWzuNObQyF60EHvLBOQ+4ebPQvcZnfvvfm+9aLmUEuIqf9Z/W3tn5Me+0m7q5YKpP24
	 gCjgy3Efrn30GxXcPh1LKisMXcm+jZvaKW3wFNqcmMLxnnu5lqv3zErrOZT5TqWf/MvIH
	 L0zDdinKDE/uQazTkoVgKI8JnMeB501dCedEX7KDbZtOzYExerDKcWdemuoKLN6UOmJUD
	 eZgW15UwRGvLPdQuBM4h38PH1/3fHcnTA+khV8m0WoPH1fC3Ut+B1lFXulLrhjo2mfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDGxZLls;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6139E606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6139E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDGxZLls
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e7e742a2c7so18096965ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009423; x=1793614223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=WDGxZLlsMxzMuqGzQTfHAWtcnH9ux4wc1Uysxni8ZX3pMHRN9ivHckJrvPojNkrt88
         Ud2FEBpoE3oGpAdGsUtrGRhWLa5HoptvLVldlB7uOlcs7wdIqIY2gXB2UdaULaY9lHxH
         ql8w1auXunuElPvhLeSCiUftZtaPljGsaO+RB+Xzpo6wF95t1zk+WTq0U156Y5y4zPuT
         QoL9jcINwpZ0MyURazWwLRJVo1ME9fymbWQ77751ecTjHTWUXkRIudXm1DmpSoUrTJiK
         a0JqPhhJIivwMPDYfDKkZSc3hIJ8j9Fp7SKQMvEwMOYFuaEvf006Sie4DCEHnbiZubqK
         rTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009423; x=1793614223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=GdPtHWZTRN62jolCoe3qiA+pNH7Zytb/eFFoSevnOgnB/sx1RqUyBuo7kWNuLnr4xY
         g+nnmXrnUvzrp9PfRVZbCLECjKthsewQfRuhLnjgt/IVettp3of5qa8LZ0+UhNULDLG1
         o2fdFugMsZsgRc5SeSKH9Ke0ZX00IzctEmacbzBoqV+Y61TpiIrGmo7Wou8Z9MLtow9d
         IT6KvlnjHEGqEYJW8eqPbb/LKmi+dtTq8DhzIAMaaB9RsvdyxbYeH6/EbzEYpmxC8Mec
         WCzKBzggX8kF3K0z/EYT/2sk81Dnhfip7b9j206TzZ0d1affiIJValktW/ip9q30ev77
         Ytgw==
X-Forwarded-Encrypted: i=1; AKwUvBzJtZykRKgSQ7JEjlS33tokW4hxCsGOZZTE9BXoWTWwtJrZUmoN8XZfoZ2jgPledUNNSxdk6dXRtzHTB1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7VI03ST2XWrTsaMlKXLI3Hsmtzvrt6ZoueEitYtqMpdMt12ng
	ufXIZyKZ9Gl7xiyLWjS1TevYijMiLZUzT6Rs3Xs3mLvc9gXYqOtoWgK/
X-Gm-Gg: AYBFou0tKZOiU43xYqoVI67KXvWDDP81r1+ag3MvWqOl4VTPs+eojRgK1VI5IRBNBE/
	jUS7/131/5bQPl/UTxyxHR4lLNoYqD6cQtJeO5VRzzhBY+EGBuhhJj4/jAqzpf6cN5p8/PXlVjh
	G4saZ/Bg5Rz8Az2K0r6DJlCFcWkiJxUwcatDcAV03RavEEOpFPAF4uJpEllIPlDAiEaxFeEtp/t
	u8yVqlEE+ZVLWUxa+1gd35oxzqH6tD9je/WuicoXg4huw321L/DBhk0+LMuA4M1rWOmAgGNlubD
	ECwrPwyMa3iLx2LIYUKi1c6CWZ+XuIwZB8XbgKoKwb5Mx3Rl4u8ewOS7AmrTDSDiHFx9d/g385Q
	YS0OLIRV0adaHFzjAt5rKtyJDExLqQlJaQiqjHAYTUWdetZ1f008MYEjkjLTz+QewIJlcdF7RTh
	AlPHIEF2DDiWD1wSslnCgYc8NInZwzJRnvJ3PUgZsfZynY7qD61dkoDSPEmWI/seE30A9zSaUlJ
	UpijblJrKRifNutVmTTd39ULeIt2CD92BnJ9AF8EuADkKSioCQHj3/d9ek=
X-Received: by 2002:a17:902:ec90:b0:2dd:c053:b9cb with SMTP id d9443c01a7336-2ea9cc455c1mr37566465ad.28.1793009422685;
        Mon, 26 Oct 2026 03:10:22 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1e52f3sm14586065ad.67.2026.10.26.03.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:21 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v14 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Mon, 26 Oct 2026 18:09:24 +0800
Message-ID: <20261026100927.217643-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026100927.217643-1-qby140326@gmail.com>
References: <20261026100927.217643-1-qby140326@gmail.com>
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
index 9afa2e2764b0..0d7815c2faf9 100644
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

