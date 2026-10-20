Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510891;
	b=jUIwUYFRLWdGctkP1RIWmv8jieqCz+lRzT2O6ite8BXe/0VuQC2/y+2L6mrMq7FeTqtZ
	 eZ+IILb6jzxUky1TdBijoz+0tBLxXD6se2kAvTHzpB9CME3btYCzQOx7ICe0esgplSaUE
	 6NSXh+Gmq7n1vF+GhyMFBlT7d4ITHNSgp6HHE1cu4xFL1OWakng54ApGhFMnbZQr1oSFY
	 zTWeU0GLpOwvqIwLRrDdJFEiF8gKzm85awyQfPeOkVUIaIUQjvJr4wmvmAufVA6aaK2ti
	 OAN870qczC0dexkEZgYFyrNI9DpB8NnG4D8hFtUp+rtzzetaEctQ1UBZo2JL3KZm35w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1cAWdrIjWIMcTgBz2maEyJC2O8dthVuXFce2HuKPJcg=;
	b=znw2BccVD3BkeHv0Kg9e9K98kRwwtCsulGL/MALUJnEikZmL8prQjgX8E0i71Eh+5zS4
	 tEz8CwDQohkYmC0m6h2iUSnh/7hJtEw9b05dsaMHpkt9LiYPvAeL5zV7Gp1j88e3BV1jR
	 j/GLf4ce1bHnmb/u7TGDQICYDABZHlSyg32lscs0B5uUauXEa9MVRao+OC3j9alu71i6e
	 M9+znPcuEGbatcEZzENZY8cDQqgIWTYviKPYBBCYSNsY6F9jWOZ7iqeUIWFr35cc4MdM8
	 9fXb6RWMjOczsMYfcH16YpGhkFyKx73EzHxyxe8siIP542OtXW5kmJhnDhdwuR6fusw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IRZi3v92;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F860A2630
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 801F860A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IRZi3v92
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1df146015so20796275e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510890; x=1793115690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cAWdrIjWIMcTgBz2maEyJC2O8dthVuXFce2HuKPJcg=;
        b=IRZi3v92SLh3anZ/+FWsWLLdFcePDMCweX8DwRWH2iZnmCqhAXz/Nk37dhAVFpJycl
         h26hSpdt49BmA92NT+ZTLboHYGTdCc41Hq8++KyVooTVettCEr+5p0S2tWlAd+PXRvLt
         cE5lGwLAULKAl7Iwi6dOapz8bflOPjuWLxNU34Ghpv7CzAtugjaU+/UMLeu0Hfz4IWCA
         xmYU6vI5FEFNxDYZWTTFlFVKW8xEK0iP4EZtTHNiEeeeJqdbIwSzEaA5PASG+wEvN2ke
         4aZMi9HqliaeEtNFlUg4KzGPzF8L+kfhWZt9Lw7zTtoEr50Gt76z3hvQiFsJub3SW587
         hMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510890; x=1793115690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cAWdrIjWIMcTgBz2maEyJC2O8dthVuXFce2HuKPJcg=;
        b=zjotbxjime785XjQB/whTL/wiX74Dn6OnAs3r7b9ApUu+v6utHZCnBWoxW/XYHyhWL
         GaSh0Ky2ZoiUNHJijfO6pPRc+ZrQ1f00N9pBc24cDgPfSRSziZrxp1/474ViwmHSg42Z
         VEs3O2CdtCv1aq2YCVM29hKg431V0++sfZ8ExyPyvbog4s/X4JMWK5aln2KN2eZbDJKV
         3+OyJqXxCCVyfRQK+QSTukxu8shTE8gOe7BBJ8+sjthkHleMPJUPSwPt8kdHZmiku/dD
         uBAGYuSo4XuvA4hHj0x/8iRS5wFCoDagWDfAvEpsimUGph59YKoicYV9ly43AxmCA7mB
         GXfg==
X-Forwarded-Encrypted: i=1; AKwUvBw4Ct3/eurz26XgojGm1i1Bdjlf6uGui87t+KhQgRAuNqPVZGki5ZurY0N9QTQ+tBKoJhZkU8Zi7t4QWyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/cr4fbh6guXFySaqjjsGH3iO0a8pmTeQJv3tKCL+cai+spsb+
	iIlG9RJ9u9JkeC65cd/fwOAu9L2ciU8ZdoATPwFZ4I7+WLMGkNLmV+o=
X-Gm-Gg: AYBFou2bQJQ9yA0+PB95Am4yZFKa0GJ8wIuMYpe6+t5YUrlIhoNi8QS98te8As8oqz3
	bTc+37eEyX82rRfRfLVgpdfXjopfQu9lOVFKTCO7esNIhpZjDiPnPdSlDyxvBQ9xiwB0bjfDkvg
	M4VaV7VlOWBDNcqnaHt8nlm7gnTpGrdZpHQIgwhPRIHYszj3EM/+WM/E75w+oiCe2kR8rcVT9Ml
	GLmektO3Wba/XbBDVQrrmzgGoGQtnH8Bax5uKvsRxBNXylbCnE0XNNZqkQrwbPDx6ULmPs3wT8H
	VPtDa9Fmftu4bxBn30BIOPp4YUI142TsjuLvvKbsoW4kmPBASGg+pgkHMcGsVbnSMlsXfbC+soq
	yH87Sw9wPIwFeXkkYOVSL0f8Z5E0FyzzaTHOCUi8nNaDSTOV6QOJ3W0hULseKXnnsNPSu8xY7Eb
	bx27YHVGQnArD2PMYXazuxGKgSGZruCWGWe/6I4ZU5VcXwz2kD9w==
X-Received: by 2002:a05:600c:4e8a:b0:4a1:cedc:ab51 with SMTP id 5b1f17b1804b1-4a1d76315d7mr258936185e9.35.1792510889761;
        Tue, 20 Oct 2026 08:41:29 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm256606155e9.4.2026.10.20.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:41:28 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 5/5] extcon: sm5502: cancel wq_detcable on driver unbind
Date: Tue, 20 Oct 2026 15:41:19 +0000
Message-ID: <20261020154119.2568395-6-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020154119.2568395-1-tristmd@gmail.com>
References: <20261020154119.2568395-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

sm5502_muic_i2c_probe() schedules a delayed work (wq_detcable) for
post-boot cable state detection but the driver has no .remove callback
and never cancels it.  If the device is unbound before the work fires,
the callback dereferences freed memory.

Use devm_delayed_work_autocancel() so the work is automatically
cancelled when the device is removed.

Fixes: e1954452f500 ("extcon: sm5502: Detect cable state after completing platform booting")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/extcon/extcon-sm5502.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-sm5502.c b/drivers/extcon/extcon-sm5502.c
index c8c4b9ef72aa1..5257cb3ca2266 100644
--- a/drivers/extcon/extcon-sm5502.c
+++ b/drivers/extcon/extcon-sm5502.c
@@ -6,6 +6,7 @@
  * Author: Chanwoo Choi <cw00.choi@samsung.com>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -763,7 +764,10 @@ static int sm5022_muic_i2c_probe(struct i2c_client *i2c)
 	 * After completing the booting of platform, the extcon provider
 	 * driver should notify cable state to upper layer.
 	 */
-	INIT_DELAYED_WORK(&info->wq_detcable, sm5502_muic_detect_cable_wq);
+	ret = devm_delayed_work_autocancel(&i2c->dev, &info->wq_detcable,
+					   sm5502_muic_detect_cable_wq);
+	if (ret)
+		return ret;
 	queue_delayed_work(system_power_efficient_wq, &info->wq_detcable,
 			msecs_to_jiffies(DELAY_MS_DEFAULT));
 
-- 
2.47.3

