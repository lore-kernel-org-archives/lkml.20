Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586098;
	b=a2J2+xQGOw3QuIenw2W5j0l20RO+7zcnfUwrG633ZI6FBW163Ar8tlxmrHCZc7hTSpn5
	 Pvi/xZJZ2CS95rrZTGVqitFPKsXdv7WySppvKqpCNb9siQvYrMhauAJWSKFC96GLdIf2m
	 dNWxnvLxz7Wh1dEj2Q/LCn0PYxM87vNYP/CMu8FR61/5TvlRARFo6wEO6ct1jCpVWW8nF
	 c151SUq5AU8++TjlvGdl0oUP1gEQcCnmDqxofqQe5ttzHT8oIpc46CMOjV05Hhzq8/3oS
	 8VNPrH39Inf3gj5FUUPUe6u429l0P22aGaw4u7a+0DbxL1pG+tKu7k21oOHDGGvyr9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
	b=Twg9Jx3tQ/vl8/I5EfA6+Q6ofX/skHOULccmoe9xffKuI+20u4zVpDtwKygUDCFdkgoa
	 FgeVFrD4+eGM4NdyJAPUr4IYmVMeG+u87h/LDBzXDCvdA5orx+B5kqj2Vso9q7nSqzrjh
	 gCTLFrNOIQkiTPUME5/gyCrjVu9tPrNledDv4wVEuv5qs55+gaU15OnIlaBxZVI+bZze0
	 NFe0ZNob9BIcVLeaggW4JFj4VC3Ewch891C0+YmpOAG9kUu3gwEwpYd9eJjlcR1uiRWFJ
	 bc/eNtAU1B+TWuU6SB88A2dWO44vgWMdvvvqGEJr/7nVddB5zMjHMMNbIp2qBe+9SYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9Uyg5Xf;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0604260A2611
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0604260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9Uyg5Xf
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so650616a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586097; x=1793190897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=J9Uyg5Xfy4/jiXw3ziddiNFrGfc5Q5+5dOgPDHw+oRg+GOIEI/Wvu09zCHwbbOUiaL
         mA6T9bE2vjXyqoVg1NMI6g4BRSQmxgL1N6g3uapZsPUn5Xnp0zf4Nl+F+UVGbCuWK4HZ
         9b5aLiUrsXcnTWpo3ynMOIRHjsGWZ9gndwL/DxvO8Aqdeo6v1Gb/BIwwYv9Fb1USMrJU
         OyBNFseBiSThCIWnq5w6t+aFxy6DyDGU1lkAwuS13IS2u9zjdeLAsa/t68m0zd6vzMCF
         M3OBxPwUQXfZSpGtyPcTQzMlrVT45h0RcjeQ0biMBFbaFDIsuYpi7+Ecg8LXB+Eo/Y91
         VNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586097; x=1793190897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=u1sNUNi3mAj87GNUc/cKzwiUzI+XhDGwX83h2j/aHZjnQa1/aOazeolXbik7MhYYjD
         qv0YyQJGYwVn7wtxlmWkcecbhlxq+xoMRj1jjCtpxHcDGLxe3GEuvRXw+2iWIv6v+A2L
         ncGDjShQVTrRAJ8kSQXECJ/15/otK63/W1i6bMq24Be0xesVEjcQdHLReCWYzDjeo2EH
         83/VYdST1NVJzDQ74sfGGzkgLdSSc29nxYSaArl5QE2U/ZyPJGvcEcSbPFBamOkPtLie
         6HsK5rgGZgD3IIz2vtTjPPoW6HykB4Kbo0FOkgX4QnY/YVTvz1JJ1ivzveBoflj5qjNA
         JQsg==
X-Forwarded-Encrypted: i=1; AKwUvByhfZXyAOZ4zCOk68SH2igH5r/A+tFUSIqpzVZf7xhGnjbMro0WVRpnRSw7FZ4N0yhqbp1xzguVlsewQ58=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMOypViD4ae/Qmqcw/N/due9QA6ovLkuU99Gkv9axS5uTY9Kou
	UDtjCuc4gSdcLraR1GOcoIfyv5by4L4bc5h8qSzVrLLz/n27qHDt5F1+
X-Gm-Gg: AYBFou11bS7BxsbmPOLk5/zLFTOqqkhHNSlHu12NTlc521ARaYjAtHrPtBnhkqLAwaU
	nMTQ8iD7mPQR+1rI+tbXF5/+QuUtYrliHVv7oYBNa77DGXiyQmKGV/7B4VRr5abXyaUh4gYFnTc
	S93skeksA0rA9ZghcHdnA0bN8EUKBQYwPHgyYmPKaciHT2if/8rhJy1ssyXnlWaYMalILLO/SX8
	B1RRYG9OAkLKO78Qhu3yJ2kh0ryQtrs6VA442JvXtR9huxOJCs5YTvgq/6CZoeRGl7iKnvCXHUT
	OWsdz8YbldNe+blKFoMqqCgp0pZ1pDiguuEtR849UPQ5MHSirMwUlz5QljWe1zXQZavIxpOEPJ9
	cuqKoxvk215Nsg6j2yuAQtbghe5uczaKXMGypG5ThKHpfyeON9wi1i35cgIr8nn4emerberqjUW
	2c+MKLRHLAUwRwUO8KfABWJSRDoVkf1QYuxKC9cTwrgCaKCNFP3nuY2q75qOtz9bMQAIO1le4EM
	rxjQLKwUDGLx80vsb6QfGX1gygH3vA6h2fyT0/G1wx1ow2USYmHNYVP
X-Received: by 2002:a17:90a:d883:b0:3ac:17c:6e74 with SMTP id 98e67ed59e1d1-3ad86cc2074mr1452171a91.53.1792586097273;
        Wed, 21 Oct 2026 05:34:57 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:34:55 -0700 (PDT)
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
Subject: [PATCH v13 3/7] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Wed, 21 Oct 2026 20:34:10 +0800
Message-ID: <20261021123414.25516-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
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

