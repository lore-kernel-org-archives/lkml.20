Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416674;
	b=NmGcBWRrMGyfcRxOef6B8IqUQEcdTA8UP16doLS1D12vz2Q6FCMB2I/BRfocfB1+D+cS
	 /zQCXwuOOmUF9yZZtFMKTyBNth7kADeZj+4z1SNs/s7nqYoDIHYOugT66icLuQj0Rg2nh
	 nnXShAGrro8Nl1kqdGovZMAEdv2VS+cQKiD7C6/o0PExUp1yCvT/Bgt9cDX2zKsrTu5Nn
	 7LWTvKeMoq/ssPn8YtVIXJRlI+sNDcjH31q0QSuT8YHAGGtb3tLLdW3rJbNJh1T8y3/K+
	 3O7gwpT7CbgHoSRQvabgZJZGHFULRP+QfTrwnx8J59+2CBoj6nrlZIKI+IQ2D/QWpFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RolEAT4+t6FcylhdOYbXrrJ6X0Zl+7zwEfQ3Dec59yI=;
	b=yS8GGpLAU1GzGcmW+XLWw7a8HIWXGD9zhF7f/rXOEYiA97Nimltr1MQv3ePH0HDGRV2z
	 Aji8XSWCTn/fkx9uTscegCy6DOvjR7DNDCLYtxneBI3Bv5Qo8wVZ1zmt2kuH1ZDqDFzjc
	 pvU+AwtwPUhwJ1hnZ2np75A628LpZSFF3u4QD0vHUn/NHkI3tU/MuQ1TT8ZMt/Uke3IRU
	 MQg8lkRdhr1K5/6ghyfLlKIMiT8kE3aPVt0Ynf0pJIFrY/UgQ65V2/4PvPTWfqiBDFZeh
	 CAQtC9VuXUISsAurJ/OfxXMKf6maKjiX0lL/y+zgMnxZw4Q+zAlyosaORp5fGC9cPXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=BPNAVtcV;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305D606A8A5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2305D606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=BPNAVtcV
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5344636a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416672; x=1795021472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RolEAT4+t6FcylhdOYbXrrJ6X0Zl+7zwEfQ3Dec59yI=;
        b=BPNAVtcVa4TF0xfgsmzPm9h7etfER7IUsXNjJ7yc7ShID3+mCKHoNhCde1Ks1DEnkW
         2rtVawodx5A/MoERBlgBXviG+w8JthaTk7dW8+SnfqSZETz0UtfV2UV0g/LYz8NkH03T
         zLOMrWqffgrq8k50vPEk/yNHIxKkl0Ttu95WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416672; x=1795021472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RolEAT4+t6FcylhdOYbXrrJ6X0Zl+7zwEfQ3Dec59yI=;
        b=1skwCaW48caJZv6JNgbP9YGi+LjcTIH7NANuBuEZRCmXF95nNPztl6mFYMcnX2+cb6
         6m8W1YjCQL77Sh4620ChOd4zS43g9nBnzahxjNob74W/VXkICZzLooRLbAPCcMw89duP
         dlHhtFDhPnLlpNdU67UdaZa8d6ifZ7M3YgrN/c+x7J3sgS1DguOCqNFczyf8dP16y9X4
         q4LIavvOB7uID51eBtOQGhlCKEx8liEY7MuHy1qQJAfVAVOf/u+pqGA1Ux07j5IY24QN
         Ruqab6DuS80m2ubEy36NIbxpKwHTOywJcJ4Jyx5b5ht51oSdYvy30+HQy2Jaf58XxJIs
         6FoA==
X-Forwarded-Encrypted: i=1; AL+hErFkhViAqFsl2d799qGNHKzrsDpdbHQ4Rtc62RwasiQjifOM/uPjrwzOT97CQ0Y3SkseAiMvZpgQwxzX5bE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wSBDgSwJ9WjRbO68vUhG+3qIwp7hK9/BnUrn/HANZDSa3xMRq
	RsynvEiTgW/Vnpjy1ZFfSzcP99bPN8LmKmXS3nQG7e3uZlhi+E3AvFPu9thNztbCE/A=
X-Gm-Gg: AYBFou2brxbb8UeZC+HJJ0f40EzBZ8B6i1mDiji2AdjNlXiGG7+sniyiZl+nKE/ld6c
	/kMHGL/UswxOHcH1qAlrr9PE37GuymKdzrpGk6l4Fb7lBRMP7XkfBHVwkGTn8n4RBNPvoCt2iRa
	DQFos3b23Xq+O7jfOYjuUC7fanFzRnGyhfpa82NQ1KehRfVkYjWyzNiMX40T4FzYRiRJ25+98UC
	5cAWrtee4/U38Rmc0DPzqUoAysJch0KkBZiv7TxSJij0P26+vgsfPOLd2tSz/kZJhZFXss3kI/u
	lCe3JRemc6IIiJzsaSkXSiEJXi/es/fNalDEUBtHUawDTKLXcaUXkcYD0cu81zvm4+RYitbU8x2
	qqZey5MItJ+13waPihQqG53T8m52+oI3LzytKkZ/+vsKub96jXR4Uuzfb1jDQbnR0Yyxbieg0LO
	oUUjNe2H2pLuuKypFZpmeEuekvFNeJxa+banSWdNxRI4BTFD7m+LAQiRPEt1AGmm9qwyML4a2Wx
	2lfoesUF4zpDF1TM3dW2WTvZdJ9gAqPboZCpOJFqql/t5ZSyzTXu+5G2dc6Jp0s4HXATG0MexlA
	191DXRC0hD14hl+/dY3GfOY00qR01KDPfoPTFjflukXDVibtXES5J/Mc8rjxKly2q8zaRjjJa0p
	4heLw5xdreyN9TLRNvmDHXMmzXZpND8fuVOD4
X-Received: by 2002:a05:6402:49:b0:6b5:74dd:37ec with SMTP id 4fb4d7f45d1cf-6b77733eafamr1637097a12.1.1794416672438;
        Wed, 11 Nov 2026 09:04:32 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:32 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Yun Wang <7z0423arsenova@proton.me>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v5 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
Date: Wed, 11 Nov 2026 18:04:06 +0100
Message-ID: <20261111170406.1634428-5-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111170406.1634428-1-chris@miget.com>
References: <20261111170406.1634428-1-chris@miget.com>
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

On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
the firmware does not change SystemPerMode itself. The event is a
request that the vendor software acts on; without that software Fn+K
does nothing on Windows either, and on Linux it is currently logged as
an unknown event.

Call platform_profile_cycle() from the control device when the event
arrives, so Fn+K cycles through the profiles that all platform profile
handlers support. 0x28 is not used for anything else, so no quirk is
needed.

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    v5: cycle on 0x28 for every model, without the quirk flag (Mingyou).
    
    Retested on v7.4-rc1, on battery: three Fn+K presses from low-power
    set 0x09, 0x03 and 0x02, each followed by a single 0x16 from the
    firmware.

 drivers/platform/x86/bitland-mifs-wmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index c25b4e4c9b3c..d8341683819e 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -169,6 +169,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
+	WMI_EVENT_PERFORMANCE_CYCLE	= 40,
 };
 
 enum bitland_mifs_event_type {
@@ -217,6 +218,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
 enum bitland_notifier_actions {
 	BITLAND_NOTIFY_KBD_BRIGHTNESS,
 	BITLAND_NOTIFY_PLATFORM_PROFILE,
+	BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
 	BITLAND_NOTIFY_HWMON,
 };
 
@@ -869,6 +871,10 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 	case BITLAND_NOTIFY_PLATFORM_PROFILE:
 		platform_profile_notify(data_ctx->pp_dev);
 		break;
+	case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
+		if (data_ctx->pp_dev)
+			platform_profile_cycle();
+		break;
 	case BITLAND_NOTIFY_HWMON:
 		fan_info = data;
 
@@ -1043,6 +1049,12 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 					     NULL);
 		return;
 
+	case WMI_EVENT_PERFORMANCE_CYCLE:
+		blocking_notifier_call_chain(&bitland_notifier_list,
+					     BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
+					     NULL);
+		return;
+
 	/*
 	 * The device has 3 fans (CPU, GPU, SYS),
 	 * but there are only the CPU and GPU fan has events
-- 
2.56.0

