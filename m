Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F0E41228D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424335; cv=pass; b=uAeH5gZa1FDlTMM70sAAXyo3DOVZPlfCalrKxSD+BBK7MHCJvSgCWsXcpy4KILQxtWIFEiHUGOAu1IHgd+qE/YnUqk36bMDnX1pCme4JejtpmLte/vIRyDtv7yJpaMl60xxzq6Md7B0xKw23opDDjj9Y4NCNF3awluqoGF9Av9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424335; c=relaxed/simple;
	bh=jFmNWvaBAxwDm5cBVjlIlJI9ulmQUsGEij3E1B5AyR8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qhaKRD0UkzPlRO3Apy7HcVoqZdfWD0BF/L/tggPVDY1xEjKkIM1OO4Hnwe5Q+O9MybmkoyvnQpZRpIVvqlbjnCOTXZv7509BmcSlb5SDMa6KyTwUFioTXCU7IGAnswOljscMNN9TAKgbSJpmKR0o2D16bVfSG/EV4qVCYk/CfKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5pCn1HJ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5pCn1HJ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so197094066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789424332; cv=none;
        d=google.com; s=arc-20260327;
        b=Cv2wu5Ir4usRq9ZqPvMFBc+xPiRvomfCBtvjG24Ibt1t/7+WGhJl52cwRAhiLcfdvi
         fH00uJrMW/sqosD6xzzmkTvybzeE00Srw1sDwzFVbCBMcebnZiW/JoYKZ/Tu0ROJ4bWt
         wHmAkBKh/pXvqahm0Hfm87co/FmFdb7FwmW7dJaEDPJJItlzNv5unflE323FQJVo6EdF
         53vgZyqJofF9MC4inpD50zWVH3s0Iwb4wRpPRGSGgzjHtMUAnTxjehfagceyt4d1qNsZ
         k03os53erTOMlnkI0b96oWSiyBbJ20TVdSJZ1jshjmUFAlL/TzjljBAkDqEEkeYmr5lL
         6oRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Dur5Fu2GMjpcmKKr2J7I2ozUvCDMZmY/nJkKClg7DFc=;
        fh=/A2MqG/pAzNT087AK/AKVsHITOZt14nzy+pGZOih8RY=;
        b=dFMgiGdHT8AgSY3JVOovDh2QpTFHXoqArjiR/V7krT/M98aKyrRMV+yqFWBfkwNi68
         1B6YclPoxSISgt2fZSzGD5TRarv2gGlwiiEh55QzJlJYWXLYXoLExO4ibshMP5JQnluf
         s2LSXAZpRezEzM00/+wGKmB/ZNDD3ZlUmUNeVUNJphAL+aOKC0/jfWfPOJxj+RBIX0rt
         ihrvTuQ8AcuZsKbYM7IoeVK9epse8ckdvYS7b7EzBfGIY5/4DjhU04+pCaBW4+Jzjf9J
         5QLQ+Q1UZwVydCm9LrL0CgcmG6SKilgJBFhDQ9aB34RNhoivKdaFC21ndpBjRMtUynZM
         ZfJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789424332; x=1790029132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dur5Fu2GMjpcmKKr2J7I2ozUvCDMZmY/nJkKClg7DFc=;
        b=a5pCn1HJz0ZJdcBGnbaJmU4Y+b/Twgm76+Y5IIBk5Cv5Vvs2qbGl9/uvKgN5IRgAzv
         GEWN4bergE43Jzi50dxiFzLQZAel2eFOrYOmXbfL7qStGV32D+sWsSXvQ/dcXcDmmii6
         hxJQJZQQc1Yl2qKjt7/ENmTOmn3qoB6+A7hPyTTYwG3CZG/7uHaYPge27+eK6DGwzJHV
         7W+ippKWpDqMBqvaPBbPq1e4bIWI/KFcaoi2DyX8Wmi4YIVMmtMggzQ0ePY5I0QTGd2g
         aLcDhlPgwJhcXAUPTh+9eL2X6APh1OgGolW9HWzFlZKqj5SSqvteufNSyv1yRt+u/Gqt
         HKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789424332; x=1790029132;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dur5Fu2GMjpcmKKr2J7I2ozUvCDMZmY/nJkKClg7DFc=;
        b=saAt/k5jU9GoWCK2HidRT2QJnm9uG8rq3AvY/5XyXYhNYQPAj9L+kEKEMZkXnIF7wq
         lyAlvaea720vLnNDvALCx/cWh8fWSSYV0vidbArTDXM5WTlDSAZQTp+P014xRgdqCnRT
         3TiMEwXpex4byDK05nUaQx83i85Jgy0qZgpkRhOBy2mR7qy8aSel/HG+FoEbZRWCXm61
         +K6wfYUxRyk5l3B5hVxXqj12Vc3DATk68E94LIbWALRJIO50lbNRqR7wbEvqGmxkjkUR
         MzX7oYac9R0x9EF2IwMQj32ZArWamuyvgLnkzIFm1TI9kFJli7p+HQotGRC87Ulxt7W/
         pp4g==
X-Forwarded-Encrypted: i=1; AKwUvByQJ65JHiKG1zyJ4jsqM29gAjEpuRWNxgPDAnYJ5tJqYMy6wIu+TBgSEzVLHoSCqZTOvTe7CZ0cr7480nU=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ5/8DXpNbjRQCVwZDKOqpVlG8fnBuyd11gtshp7e7blMWs/wr
	2BrRzZOYbNBX96LQsiUfJ2Yx6Gsm3fs2BFo0QoXd5Kw+72qmqTvBeLJoLJkprYUhVBxi9BfCHgN
	CZ3LFLyPffRzpJghxhX39GNSV9f7Oyg==
X-Gm-Gg: AYBFou3w4oV4bJjeoUTwfxfVjZeOs6g/wDcaz5Oa3eKzgjy6PvBqbXeR85YMtSNloaw
	q5rMiQZMWlpviO2spG0HoiyOFyiZd9QpSXk5epUkX5D+twicndGEN5DfDlkSJp8BF2WDzdICoQX
	iMceVyoQmVNIJENiAybR7S29mBDfh1nTiFGKjJfPFQDvNwWzJPS/oGsSsrKhPVHRojFDdnk7m3t
	jp6eJyapOMY0Lc82fqApplv0Iw/XHhLa1F38baJRFzppLXPPAYx0DnN3pa68sVTSX8x5prnk4jy
	F5Jjt4q+amAn8dKnPZQXO6qEGK8RVem/v5BrixTbpYyksCmEG48aq0fdLHZe8s7PCgj+yaLBct3
	pWPVs8WTGuLMfeAV5eCyUKTLUIqu01nVn9Ot+kknYau8ES87y1RyQnmcqEiHAOAvh
X-Received: by 2002:a17:907:72d5:b0:c25:f7db:4bee with SMTP id
 a640c23a62f3a-c29c8b863b8mr101080666b.20.1789424332207; Mon, 14 Sep 2026
 15:18:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 15:18:51 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 15:18:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 14 Sep 2026 15:18:51 -0700
X-Gm-Features: AcwNN1VN0O7fE6bk_HKosSCAS64b94u9Tx-e4YchHq4ZThm38SfgOVDyogY331A
Message-ID: <CAGEsz8F1hk5UpR0tJ6LjnbTKTyfKAxu6E9=7TLM_ABgodF9TdQ@mail.gmail.com>
Subject: [PATCH v2] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
To: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
after registering its regmap IRQ chip.  When that succeeds, a later
mfd_add_devices() failure or driver removal leaves the wake enable
unbalanced.  Shutdown only disables IRQ handling, leaving IRQ wake enabled.

Register a managed action only after enable_irq_wake() succeeds.  Since
the action is registered after the managed regmap IRQ chip, reverse devres
order disables IRQ wake before tearing down the IRQ chip.  Keep warning and
continuing when enable_irq_wake() itself fails.

Shutdown does not release managed resources, so explicitly release the
wake-disable action there if it was registered.  This also removes the
action, preventing a second disable during subsequent managed cleanup.

This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
variants using the INT33FD ACPI ID.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 516523846006 ("mfd: intel_soc_pmic: Core driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Capitalize the subject description.
- Use Assisted-by: LLM as requested.
- Keep devm_add_action_or_reset() on a single line.
- Release the registered wake-disable action at shutdown, skipping it if
  enabling IRQ wake failed and removing it to avoid duplicate cleanup.

 drivers/mfd/intel_soc_pmic_crc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908116a7e1924f9d78121284d1316b0..c082d7aded92eb418c0619031641a614e4989290
100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -164,6 +164,13 @@ static const struct crystal_cove_config
crystal_cove_config_cht_crc = {
 	.irq_chip = &crystal_cove_irq_chip,
 };

+static void crystal_cove_disable_irq_wake(void *data)
+{
+	struct intel_soc_pmic *pmic = data;
+
+	disable_irq_wake(pmic->irq);
+}
+
 static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 {
 	const struct crystal_cove_config *config;
@@ -195,8 +202,13 @@ static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 		return ret;

 	ret = enable_irq_wake(pmic->irq);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
+	} else {
+		ret = devm_add_action_or_reset(dev, crystal_cove_disable_irq_wake, pmic);
+		if (ret)
+			return ret;
+	}

 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
@@ -226,6 +238,9 @@ static void crystal_cove_shutdown(struct i2c_client *i2c)
 {
 	struct intel_soc_pmic *pmic = i2c_get_clientdata(i2c);

+	if (devm_is_action_added(&i2c->dev, crystal_cove_disable_irq_wake, pmic))
+		devm_release_action(&i2c->dev, crystal_cove_disable_irq_wake, pmic);
+
 	disable_irq(pmic->irq);

 	return;
