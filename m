Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380219;
	b=jY9mVB9cuE9ofciab6YbmA3GUE8JHzwK66DLkS+syGmmPRNLQ4HcjwfRTBMyeIcCPDJz
	 UOPdoOTWK+D80bm0P1zY0s7tLFsU8ZfparwB7TLRmSnRAS942gnTs+DNyD/jd29AHPqlj
	 rk9dqpaDjT/VQGNabSivnbCBDFF9yiGVcHLYlrYTyRSk6SE8sfE1W2LMY9cQA/XWCqmbN
	 Kcuqkhji2h4VCOLO/CAYu6VBNAR0bGl4q6pl4KLb6NJPKc3wnWIurs9gfHyhlWLoNGaHD
	 fFremsxm/Cv3IUhl/WRa6qFOcYgp6pnH1Zir9QXuXYkT+d0fn7uID13txS8lEjp9aIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EdW4k8yvohMzIWfj0xykBEvuZwxJL/83yGbzJ2fx2vw=;
	b=sfhdevZTmYRiGszRYh8LdtZXZnWe/LU4rYDJTGH6NZM/oqeY/rfNJlbW2AQpS7eeiftI
	 q8eI9MxvY7+b22gpoCfSZzILC6Wgc9Jpb2vy9Suwg3tv8hHGo3RWvSc/LW2PVZFKiLERz
	 KF/O4UWBsYalRisdc0GFE5LL30WCBCaJNCBtDSGYTiO14WLR7wKrouFazBPEoYD6HVXqX
	 9Fz+Hnp/4tlehIBvL6SKHXUwdKCs19mWIb0rIdFTKPeRLEd79bw84ta4HsZloLW8SI3Uj
	 sBPh4QYgHn/Oz7LUzvVQ/u8vNLkHK2Lm8B8bYnykuwkBcUy3SQFNv09PQCLZny7KtHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c4QJEOz6;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9047606B7CF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9047606B7CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c4QJEOz6
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b244fb7fffso3533050c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380218; x=1794985018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdW4k8yvohMzIWfj0xykBEvuZwxJL/83yGbzJ2fx2vw=;
        b=c4QJEOz6xAgHzizvYunhbVTDP2Nt0YhZ4CmNh0WEHHjCwBZ7qyEal+UkmjiYKhgRcq
         0krEmbfHv96oMWatc5dUA11NYaUcoCt4qklcMyyiXTo542rnBFTQkH5RTdg2lEi7MPLh
         mT2kjXIf9eF/VYe3pdym+56dzCKqo3Pg3fbv6yE18MWPDxZUDYx93dnuvP34WgzA3gYH
         NJiQV/XsfGpDeAvFV+SpsG8ctz+eDRb/EBMyweTntIHG1aqrxlt36IyUE2UHJyMIAiyV
         XVqE2iavSt0dR5tMiTyeROxJnhkIXxwtA+phDzMypcoiKHFo8QGzzAd7A4KQgXcHnVV+
         n74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380218; x=1794985018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdW4k8yvohMzIWfj0xykBEvuZwxJL/83yGbzJ2fx2vw=;
        b=2RVgDeWjwKeDKuZLiqwAnLPS2yY1LC+WfG32SBBIWaTrrfvPt0Xk8x6cuxKR/1UuWG
         x2Hup/7X1D8r9lgdoyRMHs2F+NuaQlWKcYYzAQpVpw/Rv8f8PQ370s5OEobUMsJ4eGxa
         S9qoWj+y6+bYcfN/zXgBFBfgvCe1ia2MAtXSlkxjfxrJrc2c6R/h1jjq5U64/ZN9w5Iy
         m1vFEA2wkTj3CjUZKKanWE5UPTuTAuLd04jdN6owTp0AAc1MPUKfK1V2iy7Emp+kCkig
         wt569x7On2sx3kY20fMcxX7TZ85UoNeDz1XbDFJBsV6Dbpus6/IKvD0c4n15H+ocKtm8
         K/Lg==
X-Forwarded-Encrypted: i=1; AL+hErHDkK+D1ouyI2NX3ed9kNuIjDtesdJBeqf+2hjzK32h2qlkckSKZoUbD9rPtfrIY375BFmIInwcedgU/lQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IuDXwXmtkgag6M+6eJa7G1a/fbysol8UXbJTJMWsooUIG8ESh
	ZtmWtjgXgcPE3GiAqUX/vIP23WUfyncv2BpdbCvugDcBq5Dvrx3YA19O
X-Gm-Gg: AYBFou0r7TtCOeZsc0iu5UjO0L4ceJrkTOcde5Z2rfT71sEIy4JPd5cA+4Rt3guoTcf
	SaJgi1mjB5+k/mO7OlPAMlNDVrLFUzf/M7tnC/Kh9ZWM4XajazBLWgBiMa7CAYsYx6zdCdDDbp8
	uTEyfvAFxYCzEghFAS0FF4+/KkbgM1IUxH+meOEHsyrOLuDX/q0A80jHEwB+LlCr7gPdcPhVfSn
	Fx3jmDXP7pCyzWBs6LzgtP8K4pZdiI7LH+dIw718BHStfi1kyvioWhhzQPMwS+Yb5iqLN3T4uDx
	DQU9yI16EMJBOSgzZYwx+Fys+VVdlhq5lvD9t59WDk4Ym4Rb5EKd58GNlOV5E0bkiQIXyRRfdUy
	QmkHQUZLhfvwlUM/7xbeXj71AYPbQFK58TjrSY1ozv5UOtarRXk6r1ajLq0WLrJzIVtBkaJNflZ
	LPaFW3cS38K/nZ6qvRQjrytMzVTyKNFzI3su5rF+nsmRinmdzNjvjv61oIIZGgd1PkzwxXLKg/L
	AKSkshV9hjhjkexZboLGpqen0XzSNi73CV1LId9GRrjytQZiaw84NZpzrx8LELR43sXwqjo+SgH
	ln2hBGd1RFJwuayzcO0XyIdSXlUZRM8lN90iX2Ok7P9V0e9QE5AVheb1tE6DLsb5foTumS7L4LU
	SeaqhpDaxxxaAFWyp8Q==
X-Received: by 2002:a05:701b:2302:b0:169:9f67:a91b with SMTP id a92af1059eb24-1b3c02f1010mr1448834c88.12.1794380217651;
        Tue, 10 Nov 2026 22:56:57 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:56 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:20 -0800
Subject: [PATCH v2 22/33] HID: logitech-hidpp: shut down G920 force
 feedback on input unregister
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
Message-Id: <20261110-hid-logitech-hidpp-v2-22-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Force-feedback teardown currently runs only in the force-feedback
destroy callback, which is deferred until the last open event handle
is closed. If userspace holds an open handle across USB disconnect or
driver unbind, device removal frees driver state and destroys the
command mutex while queued force-feedback work is still active, causing
use-after-free errors.

Move workqueue teardown into the force-feedback stop callback so input
unregistration drains queued work while driver and HID state are still
alive. Keep calling stop from destroy as a safety net for registration
failures, guarded so repeated teardown is a safe no-op.

Fixes: 08c453f6d073 ("HID: logitech-hidpp: do all FF cleanup in hidpp_ff_destroy()")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index f7fefff0aed4..ceaa57af6eab 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2795,14 +2795,32 @@ static const struct attribute_group *hidpp_dev_groups[] = {
 	NULL
 };
 
-static void hidpp_ff_destroy(struct ff_device *ff)
+static void hidpp_ff_stop(struct ff_device *ff)
 {
 	struct hidpp_ff_private_data *data = ff->private;
-	struct hidpp_device *hidpp = data->hidpp;
+	struct hidpp_device *hidpp;
+
+	hidpp = data->hidpp;
+	if (!hidpp)
+		return;
 
 	hid_info(hidpp->hid_dev, "Unloading HID++ force feedback.\n");
 
 	destroy_workqueue(data->wq);
+
+	data->wq = NULL;
+	data->hidpp = NULL;
+}
+
+static void hidpp_ff_destroy(struct ff_device *ff)
+{
+	/*
+	 * Workqueue teardown normally runs in ff->stop() when the input device
+	 * is unregistered. Still call it here as a safety net for error paths
+	 * before registration completes; once stopped, it becomes a safe no-op
+	 * that never touches freed driver data.
+	 */
+	hidpp_ff_stop(ff);
 }
 
 static int g920_input_open(struct input_dev *dev)
@@ -2881,6 +2899,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	ff->playback = hidpp_ff_playback;
 	ff->set_gain = hidpp_ff_set_gain;
 	ff->set_autocenter = hidpp_ff_set_autocenter;
+	ff->stop = hidpp_ff_stop;
 	ff->destroy = hidpp_ff_destroy;
 
 	dev->open = g920_input_open;

-- 
2.56.0.542.g3ef89b7020-goog

