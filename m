Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510890;
	b=SE2o3n8/kA++H5QD3m4xtMJiph6RQz4ffrYYpCoeQ0z1v+bYWBY1OOg/UvD58ygplJP1
	 hiJausHS9abVQesu/gkUWZEikyX+VZB1Ggfn445CfKiMAerlvry6BABLtfj66Dld7QEEY
	 Wy0rRFF2CSqW7VrexC1jsk2XQWjwc9x3eZy5401vIK/bogU0SHZ1fc8TPcnK6watH6vhV
	 7AQTmlGt+jWEBIT3pYzM0Ba6C7msc2zn13ULMemYGfvmr4EM7LYpZmpgvS0qo3cSLtk+l
	 aCNbTepTCiqhmAeumh4hmciAViHPJ9MJc9Wz6AVjmctCDLCkz7m05L1184Jo1bQX+Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hhz1fJyJlcO5CAzjOhZ0iixB1CbZDmg3HwLXlzLF10k=;
	b=lJ9s6+vV6j391GA7opFNpPY8DXxYFR/nXUDDGJmKuf0sC59ppQNLTDiuMmbknttZzeTm
	 aL0bmDAX/iJqCClZ+NHDflPgC00tr9CixuugLg5X7rsfEsD4DyAGV55ushWwLtAc7kGVd
	 W203TQ+jjMBKA8drbdXE4yYRsQs5/TvfT3VFmPWCfHn6gavOQbVIS64unuhGUKlxVZdJY
	 jQNK1olOH5mo4uTmNCPHJJQnELdQ9A7RTYKy81P3Um4jz8h/MsuRIOKu6H1ppdr3HM18v
	 /dA8nyQBf8iD9pFjmOPvWtBY6FU/2rGymaUr5IiQA3gGFZmnX5MowFAaAdQiGd6ciPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MPmiLQ03;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D4360A2636
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D4360A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MPmiLQ03
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso27498125e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510889; x=1793115689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hhz1fJyJlcO5CAzjOhZ0iixB1CbZDmg3HwLXlzLF10k=;
        b=MPmiLQ03jKBu9Up7Co1AR3HCCe5/NHH8J1NULRy09TjXAJpEbfZqkulIm5SZBBMKz5
         BohxsiApvkjeD+yBDUE7f8QOGnqdSG+aV386iBnVFI/PnEjv7qmEZ0rnz1lwWmvHMyv9
         z4FNJZZr11Fmhn3tWgjP4CvziEvtLC3zB9Be/JDLwUVWeEpwA2Sy4f/MlNtUnh+qXJde
         HNIEdrQ6Px/D35gLnykPoXWlgmtv+Y/Y9MKu9QIKwCmMI2UPtvXcnT+OmDyv4t5HBGJR
         E4BwULAWFCnQSzthPZWuE+JAOWVF//IcncuzSZuu522KJIE5nUwGHUFuH444RRTYVhLH
         lZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510889; x=1793115689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hhz1fJyJlcO5CAzjOhZ0iixB1CbZDmg3HwLXlzLF10k=;
        b=QlumKLownVJwi4tlGPhOEmbR6prdZZ9JSv0pYd847xNCA8dLShiGNEvbSOBGOiE6Bt
         1ZMYb82VfEAEXjWOCyKQckhcx+cnJ4HdIJqagXarXPQt8CQVRSelNLNeC10WmSq1eoDe
         1fNxT0ORnuwe8xRG/HZkNWcH7MSF1OEBxY5C+gxJB0NAJFo2SXord5leaigZLpsbTHl9
         omJ3Wwb8vYW6knUW6xjDPk0t9nN2HfGAS0yzz/nLF6KjukfQinIbRIh1opS9uUhq4XXT
         rcKpGa5jXxrk+7TNq+e0CMxDKZiyRza8gkZjRI5KwBMO8yIUic1DHUudeGyMawZrDqIh
         ljng==
X-Forwarded-Encrypted: i=1; AKwUvBxFPsUS+uFxG3e8vFonLWYD4n3wzRNiaviBXPerPb/bR3vjw4upAYfmKwQ5f17YEQ6fsNiANo718+eC/Cg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrW1melZnins8lwMb/6/WHGMPb57ucDSCoSsy00G4l8EPcjtDm
	n2pNWIxmKnelwRirXWI2P+1QJF35mhloa0DhOeKq+Wbv5SR0mTCK3jw=
X-Gm-Gg: AYBFou3s1kJ3+bWe+5u1GVon5ogThHZ+Rs/KvNgeVk8vy+accZt5iFWrjxnBm3QLY0c
	6ZkgcmHhyOMVYwxagcLefNNrsYU4wxnbKHEaCCpkaHEToOS6vf2en2JVRmMK7Tm/dJ0z2x7in+i
	TwOf6uawnN0+ukEu/7wPErpXGFzhhMrRYj/huU3VcHvdOsQTiT/EYzzT12dUL/F/i6AEBH5eABy
	5zetpDu1S7nK5X6t5aKXIEaPH/sSEHx1IZHjWvw9KfkCppoWbMWxJLeCkvCmG05uL81gARvtr3d
	cnUn+w9vhjjdzddHHnxBC63+r9Bfyse28+9r3g1yma94nvsvMWJrBoFYLamsKE1oE7JGB8LATp1
	NbXmVUXzmknxg6LaZz7pRNdpOZQ1SBUIpRo36JI4v5bM34qIWm7f8/KSpmDAdNg4tLk5jqRFILu
	cS6ZRcFnRoW2UlCVyM7+SwckrZdIRmVpDwCXx2g7E=
X-Received: by 2002:a05:600d:82f1:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4a1fa22013amr25711045e9.9.1792510888489;
        Tue, 20 Oct 2026 08:41:28 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm256606155e9.4.2026.10.20.08.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:41:27 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 4/5] extcon: rt8973a: cancel wq_detcable on driver unbind
Date: Tue, 20 Oct 2026 15:41:18 +0000
Message-ID: <20261020154119.2568395-5-tristmd@gmail.com>
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

The driver schedules wq_detcable as a delayed work during probe but
the remove callback only tears down the regmap IRQ chip and never
cancels it.  If the device is unbound before the work fires, the
callback dereferences freed memory because the driver data is managed
by devm.

Use devm_delayed_work_autocancel() so the work is automatically
cancelled when the device is removed.

Fixes: c03e017c4d3d ("extcon: rt8973a: Add Richtek RT8973A extcon driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/extcon/extcon-rt8973a.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-rt8973a.c b/drivers/extcon/extcon-rt8973a.c
index 19bb49f13fb08..184e9f4c16ce3 100644
--- a/drivers/extcon/extcon-rt8973a.c
+++ b/drivers/extcon/extcon-rt8973a.c
@@ -6,6 +6,7 @@
  * Author: Chanwoo Choi <cw00.choi@samsung.com>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
@@ -635,7 +636,10 @@ static int rt8973a_muic_i2c_probe(struct i2c_client *i2c)
 	 * After completing the booting of platform, the extcon provider
 	 * driver should notify cable state to upper layer.
 	 */
-	INIT_DELAYED_WORK(&info->wq_detcable, rt8973a_muic_detect_cable_wq);
+	ret = devm_delayed_work_autocancel(&i2c->dev, &info->wq_detcable,
+					   rt8973a_muic_detect_cable_wq);
+	if (ret)
+		return ret;
 	queue_delayed_work(system_power_efficient_wq, &info->wq_detcable,
 			msecs_to_jiffies(DELAY_MS_DEFAULT));
 
-- 
2.47.3

