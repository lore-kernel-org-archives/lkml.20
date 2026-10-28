Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186901;
	b=dzdkBJiZg4E37xkwfbqv2JbmFfUoR7bUwVHWLrNxc4eziJ9Z8K0UkFIWEdTeHDy4S2Yd
	 jkmB2qs89oUfTmpElzSP0BJhFQBp7+I8NMrE11g8srddjOJ5uutgg5AvYHVm7bRaqohcc
	 ot/xGLmPeDVAiGvrEvcruogPhPGVXQvDnBKZYufn+vD7kxJTmx13iZbfBgqYbkaYiBO5P
	 2qwDM0z5cgBZXxyEsWEcPfrB5pLOHmbvaCjvCEwj1MUVQrtAHDdLSa3SIHrNLO/GWfumQ
	 B1Hf9HXyIPfWPvmHe7nXJJSaEMuBy3dO/yEE8Z3BU7RQY25nE1F7dh38IqW+2XfY0Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
	b=XcNfi8vA72CQdg1j6UhpdqECSLbx3W4BtcNTJnMoOEwlXy7hYV2bT9Yz899J3LMLblDJ
	 bKkQvA/2/TijqrPFM07+aeIiqFsR5plGN9EhniEG3GluXq4oTygXDV7S0eINFamJdAHkC
	 254o/Wfd6X3uSkXE8fFKNTR8fNbFWQ28aA29+NtsuJXElvxri+Tcfiav+JjKJ2IcyLMnI
	 N578NupE0aeRoLA9XsBLUkcXi4koCI8BlnrygVoZnTW7hg2Ra4n9ZIdOR4dTta4TcaATm
	 EqUurkx1Rb1YoEH6/jnJptR92vB7ADgaZ7Hd1MBCIRHVws1+ZNUKfPiFSTn6KEiei5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B/SE6aOf";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255AA606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/SE6aOf
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea7987517aso4978175ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186900; x=1793791700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=B/SE6aOfvk2sT9M4z6LeHHldaHp1jPEIphlBmUxuu/A9m4dJDSF4b+hZCcE01O+Gt6
         Y/inpP8vP566W31hVmfBThGPSCaSRI3CSyQpgIyKrh0HuBczRQsfV1NPxQTw+emWI9x3
         06clqoudzQVsuMpBPMO/bZ5zxSzEe7YL2lwtfC+iZoiySx07wDiyznzf9pGiBU46nWqx
         lh9Z9qvJWyQ1olNtdnYiOY+n84g3UJnjWRAPUlho8XCP5dynDky/s97ZMq5qrgl7kcas
         q27RDSwvNqWofR6pgszYTbbpWSz9/wM4ntKimQU4nyE/7eJ+gFbPnKuavGkycs1kbP8u
         uFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186900; x=1793791700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=nqGp8e44LTH/FxuV8jxQ69VmLcODSnb9Nbzqma+IH7huJCX9jvOV2mDDX6Rb6Uz+Rr
         W2RbKVcp/LHJuM2mWdeMxse3Qtums3Xbb6Az6iT6UHxf+dgO7ZFWjGbw/nPPXFgCSQ7F
         RAs/+iA4+N3aIFTDm/H0NhZO2k46OLv4b1rpzYHBSIcSOCANdWvq16RX2BUwn8FybEoM
         veD4ba9SUG5PO0T62PLA1im2kmuF6rTmcdmAT6Twt/xIcEIy1n62HRl8l4jFKUjJJQw3
         5xUFJ4D+fDIyaZT50x9MILP0D/1ICCb99X3fNrl+PXVgqmeuY4VMJZTiBqPED1oTqOkb
         3Nww==
X-Forwarded-Encrypted: i=1; AKwUvBz1g4GPoV2Fj6SLkC7twV//cPGfbCB5XwfXPdBAxJmEwN3By2n06aT3m36B942n5DRl91W328BvaaEwClU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzXQU151tMw0jjxJaokkQgRw/9ctIZ9wW2P5I/rktN7GP9Rel3
	PeTetWUPO1JT6QU3mv5V6Jy68xS6g4eNC0axPOX1jGcSdc4rh9sNyQw5
X-Gm-Gg: AYBFou0K7s9FRUZeiKfBiw2hi41iBHHjgkEiUFMzTZYdWTMKzOb75egmTl86skXlDBs
	BHfR1Qu+pk5b8L+f3h5rnGsZ6ktIf8h2VJTEwUNb2aDeC/TLo7LjA6oh8YKqP8YwkpY+hNPA6iz
	/0zM0UmxzIZeMrYktLS0cQhtfZJSM2fQqDw5Cx0Vf2C84qAfOBNJwryRt7Ogod9P+roCaSXPR4j
	VZlGVQLRBimMe9lxWtt6BOBN+FRFagbE2UoGgOqs7r+69eCxdAP2TY9NBVCvjeTAN0j3seQ06g4
	63RvTIijch9TtisKcS4z7+pcXCT3045AUgIwxCwzT04y1SRJYdnqS+JLoZ5dqLEWsAlK7cGXWaE
	ZV3uLJcXU3SuAmrQfy87P5uZ9KUgyRiBczyJaRbFJ6kqXymT4qjHMfKTg98qcetHLnLb1Q/ilB3
	Uekh+1VyGPm2JCtTpKHou/OFaZGjtv7k+tpAMw4P+cuIssZXQlw/W3s8QyQE2ThY7dPsuC0OqXL
	VrH7JfL1tTxMnB6xUaJq1wb5dusr0V8FtXfcnAtA+v0IzPYWnPUR0s4icAmT1RqYzQWNCpVLtEY
	Y/Oe2omVG/Q=
X-Received: by 2002:a17:902:da8a:b0:2e2:c283:354f with SMTP id d9443c01a7336-2eb00500729mr19777295ad.28.1793186900466;
        Wed, 28 Oct 2026 04:28:20 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:28:19 -0700 (PDT)
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
Subject: [PATCH v15 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Wed, 28 Oct 2026 11:27:39 +0000
Message-ID: <20261028112742.674847-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
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

