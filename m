Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEE137B3FD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670190; cv=pass; b=OQ1xU5CERFjaONerdx9PbsQAnIsgDetzQElWo3phShGJ0y/ym9xHADaz6OOjlOmIWcsqQnwjYFjIkajgYoGTB39mIou7iE7RBHwNTf0BNMpwqvh40Zew72eV8oWt6WH6YuzM5AjjejvP+49oPql2iO0GQwAVboz4haRVJ6DLPt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670190; c=relaxed/simple;
	bh=jihWVSc+QPPY7ukg33wNgmwKvHTeZDPiEessuX+O8hQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LNK2T855DSa0k64G72DoBvna/eNudhcZ6RTifd/+ghh8fuDh0yiK5FJnyEGEX9v5q5mnWSWAZ6fh48R69M1a1m6lSxFk4ynwIspcwL2Bqa8kj8JyEzY8QHCdJu2TEAeaiZzriGPbYhCtYLHS0cvaMJSI4Lpl5TC7XY0spBasObc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+S5Djm3; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+S5Djm3"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa22408406so1915653a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789670187; cv=none;
        d=google.com; s=arc-20260327;
        b=DbebGurmivAkoGb50AnUAmSwwx+i/96xqO+9CHso6caWZUeQrugw4T1rgYzDtc/vD1
         zzydK6Ai8rRHOjR2ECVy7/zwV7TBfjgqMOb42GYYNR4yDMqOX9xppMV8lECq+tLRdd5A
         Gxn0ZR9qIwHVk3Des2Uzo4EUGS9K31HEVcNeShIvxnrrp+OontCGkUMoFX9aUp409zKq
         zXntk6VxPaoZv5/E94ItsqVy7287bjIA2iY3VWVM5YOiRn4+cZvgl2TqtrHFfH5KROE4
         TVS+ovsMbrFGBJNict2I3co9MoqiuoO4Z5Hm3zHye1Ac20KX7xdjNowtSuNuJWqVdKaA
         eGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rV/x6skGKGuWX/Erv1eMnw+O/alVkmiUtIy5zTKCJJ4=;
        fh=dXlSZTTXpeO80db7tYMDc0MKOANwZY0hZ7NTj/81K1A=;
        b=XKk3okWDEM3ZEdKQundUoW/M5jB3/hK8iVgQylGc5P7EnYqKOE4AHxVwoWJ7qyxCM3
         J7Kb+5YOvO7px/qh20oNoLOd8K2aKGF+IuWBWNkNmw8KtuYjKz37ioTeUhILyN+Tt60D
         zpDPaKOv1NUeDhLrraU8AbtMfmiKawXzJI16GuSeeDmbLC6AFpV01rAqb3eNA4of2H1z
         eqhah4ZxcVhZjUye10quzCuSb/Bstp2YRqvMku/5+Ffr800x7V3QJe4pSXZJqjp0VK3F
         bFnaUByK99mG0SBSRvnsvZowkJHUjfsbYpA12l6BXogidaS7vgYksS7U0jqDprL3W4P4
         klJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789670187; x=1790274987; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rV/x6skGKGuWX/Erv1eMnw+O/alVkmiUtIy5zTKCJJ4=;
        b=r+S5Djm3zI9bIh0VYOtc+WizY1i2KHYXZ6074QwTGDUTxosfAde4xPS5i15tyC4MJG
         HIFNCJ10C1DZ5DQ9b5GFzlLwP7mqJeDSyzJhakwp8Xqy2dK6Wfla+RCHZBDAky5I5QqF
         3ttLRU8zXPKxwYcGIclm08tQsRG7Qs/4MpM4J1Dv9kFWsDtqdOTZZyHpQr/qlgI+Linn
         JJrTpPDzmstu4Z+qHZz2kNfVPzWtJHR8rdRPeeCSufvQ3jTfnGcWd6gsc6oT0RbSHyP7
         zSUGSvgPuzCCy1kNcQbtI450ngMv5bpjN3hTUdut1pmpX2dFSOXrUrlLuc8/OUPjk0ZR
         eV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789670187; x=1790274987;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rV/x6skGKGuWX/Erv1eMnw+O/alVkmiUtIy5zTKCJJ4=;
        b=NSHcr4OQRGw83kyrMb2iWEgXg9WyUlJ471cg1M9iOo2VeSZA+IDny7eSk8XOh6qDBC
         2SrabMpFDgI4Bwww4xT1L43qqxH3sp5ScKaw9v2YnlkGqLcJJvKOkawQ7ZtYAhh/6IQ4
         AZV40wuUV9ClZKUHNP0uLvXSdchaUdapjkX7by+5Xqnmffqy3pJUWjDq7D7xC4iP/IH3
         iaNdDYkTuX7oKk5lhCWR91piZ7I8sJ8+C/T2S3wJheOMBldwOHQ0rDrl3yqfR0xH1VbI
         ECsVlFUTICp8ol/BVrp2gk8NOXtYNL3zW87bGMvRh/iafWA3NbcEiVQqgrT3CiM7e0GU
         wuhw==
X-Forwarded-Encrypted: i=1; AKwUvByL99XWHiKG79tqUjqWDCCi7UAfSCZ1fdD/xP8tRLz7L/9zf4PhVRFgjPU62r11kIb3KbiL47Qt439HtfM=@vger.kernel.org
X-Gm-Message-State: AFuF++lUzkpX1S9AEMxQuZx18wmYEbmllJB4p33ObvdYLLTbrKovNzf4
	6Hw4Z0NhZw5+x6pjgS1n0r5T85ywqBR+8cYKwcmdj5M4tWAOk7NSUPE37ToV/eJznmmjE+ACjit
	5hdSTTg3JkOXYBeM3hy4dBOCBn9uvYg==
X-Gm-Gg: AYBFou0oltkPh48CwSmJzipfgJXvOKhU/6RtHYh5DLEFeRzjeVlrReoKDnBhX5jgFDl
	gTJUzWqZtr/zhGuWF7a/cBCtHa4UBsGWLyQP6FyU4yNrd4TTXf9IDWH3n15yQyrPy08NNue3cdr
	Bk1j6f5bu8DuVAgMR6VDLPfIpADdDzPOLdRU7g4NoHKA4/vncOSW7l7amvAs7airGHfc+IQF+tP
	ycUQByedHatib5K5CEtHGfI8q3d6zV00tlqi3+Zur6wCFetyzJEIfLqLUfrMkKsZDTnZxsAaoQX
	bzTUpqHqilTt20XA4fVaNyMbg2gwGckqHaGqj7iCxD+8vqWpSlbQUQhgSbXcVQ1Hvd+3sNidaVr
	pG0SvIPi3Jo9kteEC1YEyHVyMFAGlNe7MRHzgDcj5mrcDMbQZgP5qW+7AcECEBc1SyQ==
X-Received: by 2002:a05:6402:380c:b0:6a7:ee56:8151 with SMTP id
 4fb4d7f45d1cf-6aa22410eb0mr6223710a12.31.1789670186798; Thu, 17 Sep 2026
 11:36:26 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 13:36:25 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 13:36:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 13:36:25 -0500
X-Gm-Features: AcwNN1ULqe71-mtRz6p2d1X2mkQ-K-TqKoo5dGv0ERlOFdKzohIAzuWIAiUp2eE
Message-ID: <CAGEsz8GN7XObjqzMZ1KcghAKH8anMsYSU30PUJ_YXY-zDsvcpA@mail.gmail.com>
Subject: [PATCH v3] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
To: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
after registering its regmap IRQ chip. When that succeeds, a later
mfd_add_devices() failure or driver removal leaves the wake enable
unbalanced.

Record whether enable_irq_wake() succeeded and disable IRQ wake on a
subsequent mfd_add_devices() failure or driver removal. On removal, do
this after removing the MFD children and before the managed regmap IRQ
chip is released. Keep warning and continuing when enable_irq_wake()
itself fails, without attempting to disable wake in that case.

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
Changes in v3:
- Replace the wake-disable devm action with a per-device success flag and
  explicit cleanup on probe failure and removal, as suggested by Andy.
- Drop the shutdown changes and the shutdown cleanup rationale. Preserve
  the existing shutdown behavior.

Changes in v2:
- Capitalize the subject description.
- Use Assisted-by: LLM as requested.
- Keep devm_add_action_or_reset() on a single line.
- Release the registered wake-disable action at shutdown, skipping it if
  enabling IRQ wake failed and removing it to avoid duplicate cleanup.

 drivers/mfd/intel_soc_pmic_crc.c   | 11 ++++++++++-
 include/linux/mfd/intel_soc_pmic.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908116a7e1924f9d78121284d1316b0..2679061f449558e327b65abb2bb4d2ae2e3d9a10
100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -197,6 +197,8 @@ static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 	ret = enable_irq_wake(pmic->irq);
 	if (ret)
 		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
+	else
+		pmic->irq_wake_enabled = true;

 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
@@ -208,18 +210,25 @@ static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, config->cell_dev,
 			      config->n_cell_devs, NULL, 0,
 			      regmap_irq_get_domain(pmic->irq_chip_data));
-	if (ret)
+	if (ret) {
 		pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
+		if (pmic->irq_wake_enabled)
+			disable_irq_wake(pmic->irq);
+	}

 	return ret;
 }

 static void crystal_cove_i2c_remove(struct i2c_client *i2c)
 {
+	struct intel_soc_pmic *pmic = i2c_get_clientdata(i2c);
+
 	/* remove crc-pwm lookup table */
 	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));

 	mfd_remove_devices(&i2c->dev);
+	if (pmic->irq_wake_enabled)
+		disable_irq_wake(pmic->irq);
 }

 static void crystal_cove_shutdown(struct i2c_client *i2c)
diff --git a/include/linux/mfd/intel_soc_pmic.h
b/include/linux/mfd/intel_soc_pmic.h
index 9ba2c1a8d836756a255487f6dceccb441b500549..07308245da28bc0d3f916ee65313ebff808ba86b
100644
--- a/include/linux/mfd/intel_soc_pmic.h
+++ b/include/linux/mfd/intel_soc_pmic.h
@@ -24,6 +24,7 @@ enum intel_cht_wc_models {
 /**
  * struct intel_soc_pmic - Intel SoC PMIC data
  * @irq: Master interrupt number of the parent PMIC device
+ * @irq_wake_enabled: Whether Crystal Cove enabled wake on the parent IRQ
  * @regmap: Pointer to the parent PMIC device regmap structure
  * @irq_chip_data: IRQ chip data for the PMIC itself
  * @irq_chip_data_pwrbtn: Chained IRQ chip data for the Power Button
@@ -37,6 +38,7 @@ enum intel_cht_wc_models {
  */
 struct intel_soc_pmic {
 	int irq;
+	bool irq_wake_enabled;
 	struct regmap *regmap;
 	struct regmap_irq_chip_data *irq_chip_data;
 	struct regmap_irq_chip_data *irq_chip_data_pwrbtn;
