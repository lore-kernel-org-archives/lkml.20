Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380195;
	b=YANWESqPMB2I9aUKz2VYJStDBeaf/V1v5CyhIk26ZBx5+EEFavGj5bmPIGnO20JjFJy1
	 HtNq0eiyBj3R1EtpCgR10LfB3QUNdOKbxobJLUQV5Bu1HnQ6/jpbBBumXiEHd45CKsOS5
	 F2jBMv5b8hyjQcgew044JCf7cKVUsbqXiM7DhILXqxISxTM98v0kc9G9VY8L05s0x1+tt
	 2UeE40R7GZtiPr3VxeWYYHEgD5bSG36e2YrlIZAloWZKSArFPuFD9zhy5l7pzCBK7A+De
	 5YDCZuSSDI5i1Ef5ieG2s5QFIWC8DucV0CnmxsiCUanteE6WaWRmMx1AADOnllsGpAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=slgCBSKFKl7Q/LA8mzeyeTKZo/SbrLrfaAT37+Tkw8w=;
	b=iLDWgHzJnFYFcrFjB9CKHuoUhPLlYRSOJ1pP5G+LL84u1JHPBzhxFRAUyqYDcPhhhJdy
	 Ww24NLUpLHHbvjK7FMLxfIzqw53ncuOuDSvqyVv40ssZgouinfGhn3tUjUZT8Xrh+30vJ
	 Lyv5Lp9L2E9MVGAXvMpsos2/eXEa8rF8nr4TZpKDBbSMxG60r4blLazqXzE+fNNLr63+t
	 I5E6WWGqtO9Q2x88/PWro9rBwigHxEjwoc6Rr9SK5BjOWoeVQsbBMuVD8SFAIb9oJr1N6
	 AfZZyduUayOd8pZGzS08sb88xQTU4K0eqZc/MTJqDH5VjUSOFqoWgzQcoKck/Fs/qRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgH4CO1L;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C505F60A3829
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C505F60A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgH4CO1L
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso4759068c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380194; x=1794984994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slgCBSKFKl7Q/LA8mzeyeTKZo/SbrLrfaAT37+Tkw8w=;
        b=NgH4CO1L6/IdLdAq0+9WpBqbnVs+8tX53Goq7wZ14nOpJL7byez5VZqqvA+zNRd1hQ
         4ArsNOTRtWHBsUTyvuXab50p19fxL0ehexshnh9DgpdmXtqIGwiXXEHyYHX+I5LxsjHs
         Dlc/xcqKjvKZ3k7EGSa961+Dx9x/r1tDBNsPrx15DoqCOTGZPwf/ttLG1ZNx0q+p40+C
         p2xkHz53ea3MZYUYoFX4qOUHokWfk7VHolb6p9O4I6o60lPLuLtvCMpMYkNuBFRYFT9O
         AdpLrMH9/aoXuD4mG7e0BqUqZ8flktAuOTElJzJdKFfmrCiWT7quxKw6TMtW2G9YqMAS
         t2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380194; x=1794984994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slgCBSKFKl7Q/LA8mzeyeTKZo/SbrLrfaAT37+Tkw8w=;
        b=fASCXnxd8rfmti3+gRL68wMXq5gCT/lBWAtu0yBqnR5Q/kOtFjOs7azTJOsNcUyzhO
         hFna7i2ZiT2U9P+fnmxsA1SO41kclbUvcSJ7VSrXz7OiPn9Zpe+b0Ow0dL2nSwTaInOk
         SRHiVwueGG9dMPZE0Jf+2ZDoLIi4r2MRrMRwLb9cph274nhSOlhcPZJt02Ftb9N9Y+82
         Bjgu7rE+SJXFjuiGp3ADS2CFK3avHZ+HyPtr5Mx+qLrAxf+20CZnQChhjp2LAJA4/UAy
         8CU9AeAr0u5APMuHZ7qdaHzcW5BoL8xIQwosZFyG6TsgxyX/B+5oD4L6u+WBN3lDfxw4
         lTbw==
X-Forwarded-Encrypted: i=1; AL+hErF8gShJqc2mHKCxd3NRtr+J2/QfVDGTb5S7HcsRw4Gs07GjFNEeQ+h+Lw4iJysZEjsWTcQimAoofitSyXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CGQdk3YWQ19CJSkqWiCkAgsbJgz6Mt0vYtr81+t7I9wUsoATH
	zw25v8Z3AJB48UL+TeeKTtl56+KDI+2oTbe2kttURSvYsp/p5/ZjZxqk
X-Gm-Gg: AYBFou3GAQZq/tWJlbWASd3W+XhGvK6szCVAqRouqDUGr9vQrMfbNuipiSIAbRJUvsf
	JKXnh22JEht8jAhWI8ii3/WS/2/uRO1CcOgEfCa6tTGe4cww1Xg/XXKngQK9LhqaFvkU1x4DZfg
	5d13gDf5sWOfzO255k5e743o75pU8qG1birMuxFBxwcrJP59XXAisUscv7esE0lIC7hBAwXFyzh
	T1QzM8n1Nb842hMX3LdarGsIyNg1qj7N4D5aQoaoy7kydB62c+wJRzbOIOMMVC/fIf275TRWow7
	WT+LJ+PKUEc/DmOy6s/K5pohLVHN/Lu7mAowsdMCYNlTGBxKcsfNOuffkb8/TuxRyIo/E7VoNkN
	/VLBFZrL7pWmmKYU0d42bJ2iOe32BZpEh5wJocE1uTuqnCsxFGCoRsmAR1pM1QhV7R5GqExxgvX
	mLGo1V+j7DlgsN3kMasacZvZvkXUVIWp5G89q6cDaw8S3OMprRd3el62suzOIt1ir9lKlVi8Pp/
	LG5VmGkw5QNn4jB9l99pIE9XP6c5oW7+lsxAek2oLDmsZ+rV9+2FS/pANOpL/yrTxSKwAP9LRGU
	bLH9cMX+Te+IzAeocKTnAL5Nd1oZb3HlRo6Cl6rnKDZ+olZ7eHEFJKnlU9mWeZ5JHFm09LVtXlN
	wGhtdEu+FdP//XgdgLw==
X-Received: by 2002:a05:701b:4587:b0:1b3:b6d3:b91c with SMTP id a92af1059eb24-1b3c02ec7b3mr1467863c88.7.1794380192368;
        Tue, 10 Nov 2026 22:56:32 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:31 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:05 -0800
Subject: [PATCH v2 07/33] HID: logitech-hidpp: fix off-by-one in G920
 force-feedback slot tracking
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-hid-logitech-hidpp-v2-7-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Logitech G920 firmware reports 64 total 1-based hardware effect slots,
reserving one slot for the built-in autocenter spring while allocating
the remaining 63 user effects across 1-based slots 2 through 64. Because
the driver subtracts the reserved slot count upfront before sizing and
bounds-checking its slot mapping table, the 63rd concurrent user effect
is assigned hardware slot 64 and exceeds the stored limit, so its slot
mapping is never recorded or released and remains leaked in wheel memory
across device close and reopen.

Keep the full hardware slot count for table sizing, lookups, and slot
bounds checks, and withhold the reserved slot count only when creating
the input force-feedback device.

Fixes: ff21a635dd1a ("HID: logitech-hidpp: Force feedback support for the Logitech G920")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 53c171dfcf96..0264e4541edf 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2872,7 +2872,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 		for (j = 0; hidpp_ff_effects_v2[j] >= 0; j++)
 			set_bit(hidpp_ff_effects_v2[j], dev->ffbit);
 
-	error = input_ff_create(dev, num_slots);
+	error = input_ff_create(dev, num_slots - HIDPP_FF_RESERVED_SLOTS);
 
 	if (error) {
 		hid_err(dev, "Failed to create FF device!\n");
@@ -3486,7 +3486,7 @@ static int g920_get_config(struct hidpp_device *hidpp,
 		return -EPROTO;
 	}
 
-	data->num_effects = response.fap.params[0] - HIDPP_FF_RESERVED_SLOTS;
+	data->num_effects = response.fap.params[0];
 
 	/* reset all forces */
 	ret = hidpp_send_fap_command_sync(hidpp, data->feature_index,

-- 
2.56.0.542.g3ef89b7020-goog

