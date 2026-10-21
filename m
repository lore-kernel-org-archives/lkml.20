Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627267;
	b=btRpitVBtHtpGF4SxyuQnBXOHU1D1JpeqCc1kR/EXfGjGJnfXhBp1okMnKVIBtYkC4K3
	 YSLd5Yi1ZuON+m08m6c1JixZqeoG0mBcsbIOBUqB+n4hSF4o3PIS19PlmoeHAWtrJtgqx
	 Juy6Rde3cfanomyOaCIbDyERSmLN5dEX2esmRE1pF7oulIC3Me22zWqD6EAl2eZ8VN2UY
	 Mox0FFRgwEoxl6gDethnAr8VvHwlYEHf/K7Cflk8uuqfgen1dDVHpc5SNeCIuMznE/X4m
	 bAsSVQs/SRzRqksrGOdSFGJgIAYxkxUaauqFj5nqVB0UY6k+91mA52kFRso60i419ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Mf2nUSBZHg9n9GyE2dcfq2rqWF1N/c1mtDtHbnucmkk=;
	b=4MqyEkzDEDZo28lwE+ShCX47omCIdteQUnc33NgbeNU2uUo+6pSP3bGczOnuNOk4iJFL
	 2xWm2AMtMV0BgQ9fL5dgypZ7WKhFNiEkvhojIpo1Fz16eOeFnFO7c1+b9PEn6OsdieFFA
	 vqFlVy6/3/neDZ71el0mEHZ1zUCnh1GqRTdO57KJ9Da6IaTW8G1F3upG1Uhu+8ar7xuHb
	 gVuFbDFBkDIODcfbt1HUp03C5MOWlg5fkTXStwxcmmg+2g/F2sB35lkfXj/1tR32Jr3RK
	 olCV7o5SuOBv47w9hZfHr+b1qM42+hEDeKU3vBVRWPnfVnD2Wk372GwRrv7gA1Q3PYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bs7IRrXP;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3AD606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B3AD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bs7IRrXP
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35829219da8so425546eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627266; x=1793232066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mf2nUSBZHg9n9GyE2dcfq2rqWF1N/c1mtDtHbnucmkk=;
        b=bs7IRrXP6KaRq8TCe+cmiL9uWNrA0bUEqu7Jsy8dC0OibGUFzA89HuC9kx0yu3s8sJ
         MJtavlPsc87FCp8GTTmg+P5qrcB8tFQJGops1yPhXwKmvBUlP05CJxV4vEbpSSSnYYN/
         113QKNtG0m2PCxLRcpmSzPcL3C9UgoADd1XsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627266; x=1793232066;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mf2nUSBZHg9n9GyE2dcfq2rqWF1N/c1mtDtHbnucmkk=;
        b=HBSmfpHVJycHlR3nh5tiMcoEUPMsTB8e1JsFbQIeLSdkrcnNHUkDZ54jYNtp377NH+
         XNOwl5XOoIUJceTWF6nME0VhI+bXGauWBjgZtyhm17KOs62ZQAwtVoF1y+5K/+jimWgk
         kiCQAlZhayqxo98HunSKPObxRcvv6SAUn5cfk8eQTt6oCSPU5W27C9KrvYb1wS0cHcYi
         GT1ZN4HK6Osxp0TeajWAwdg1G+k8h++TQt6DsOWOlLnwT89z02j7SnUnE0kJTo/NX4tj
         6pAI2l6pYTI56+vxNPTzo2RBqlCm7/3RGLNdYKBA3qL/NJGcnHSEzQQTxze+vS7ZpPZm
         Z7tw==
X-Forwarded-Encrypted: i=1; AKwUvBwga6zWvUqi141CpGSRG/yXR+aF2ZAAb0E6ZQ+xtiwUbNh89tqAcXFDOtxsdKLBsFbf2h/GtLMXL1FSx14=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgYlQxk2+7eEM6jqoSF7COejoLJxi2/EmmnArq2uYQCQLEIktC
	bxO+aq98e++d/CYFB8mL1q6NsgUXco6LuzFt2nT0dYDVDvAsKH4tYJu5ARvy6q+2HA==
X-Gm-Gg: AYBFou1YDVq1Cg5U2g+xw2wYBTWMw2hnE7V3CCmROQf9dt0Qn5xZPlgnU9XNTteXf3L
	7fEH1sYzdXGSvW728NvLXngPRtAwWsLe2sBBzydEGXLOATS/nIAGdpta0FccRLZJ783hvfJK2uE
	W3jpibsB81SBpRySqbNxQn/8r7wPFxpplK8Ivxnfim008x6xpmdn8i9KgwhV6jKfVDSDt9ZlclT
	N3aHB8bcCDWtt2GFLraaSOYCABzCNv/DW1RY9DPdankR3DhwIVC3fTyVnorSSAHVDGmWMvLIezO
	TdEIglo8sVTibgXEWQydArI5jU1ihBdzEnLI7YMktNk/5sBavC+t1sKf9WOdETvC4CKI01Erlrd
	nqRqiPE8m93ysYavAidkLmJ8lQ/NWlO9JnVs0RO0Ql7L0EWlayD+IOWF7HoueP9F7AH3m6U/YNu
	joqoTBki/FKghOtwacrMyA1wjQ4RlQs3TUH3uJZrz1bsjMVnbQNtWbqmTLP3IaDxx1vkYVP7D9/
	PeEslvL9+YsvNMzAv5AT33OE3+pxE3059+sYu5B/DsdU9LoHCfZZMD0oOYxN6ciF+YCAkKSl7c5
	4fSIumgg4cuLou13cIXh
X-Received: by 2002:a05:693c:400c:b0:367:a092:3c73 with SMTP id 5a478bee46e88-368b065757fmr1049136eec.12.1792627265560;
        Wed, 21 Oct 2026 17:01:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-367411bc89fsm13244263eec.16.2026.10.21.17.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:04 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/17] iio: accel: fxls8962af: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:02 -0700
Message-ID: <20261021165858.v2.1.If2263e6ae9eaa4493881b72922dcde031ce9d81d@changeid>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021235818.3059519-1-briannorris@chromium.org>
References: <20261021235818.3059519-1-briannorris@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This driver propagates the return value of pm_runtime_put_autosuspend(),
which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify this driver to simply discard the
pm_runtime_put_autosuspend() return value, and inline the
fxls8962af_power_off/on() helpers to their callsites, as they're even
more trivial now.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Rebase to linux-next properly
 * Drop a few drivers' changes, as they stopped checking
   pm_runtime_put_autosuspend() return code already
 * Split iio patch into per-driver patches
 * Inlining

 drivers/iio/accel/fxls8962af-core.c | 56 +++++++++++++----------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index 55183c69465d..496e9bf2c4ea 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -205,30 +205,6 @@ enum fxls8962af_int_pin {
 	FXLS8962AF_PIN_INT2,
 };
 
-static int fxls8962af_power_on(struct fxls8962af_data *data)
-{
-	struct device *dev = regmap_get_device(data->regmap);
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		dev_err(dev, "failed to power on\n");
-
-	return ret;
-}
-
-static int fxls8962af_power_off(struct fxls8962af_data *data)
-{
-	struct device *dev = regmap_get_device(data->regmap);
-	int ret;
-
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret)
-		dev_err(dev, "failed to power off\n");
-
-	return ret;
-}
-
 static int fxls8962af_standby(struct fxls8962af_data *data)
 {
 	return regmap_clear_bits(data->regmap, FXLS8962AF_SENS_CONFIG1,
@@ -263,16 +239,18 @@ static int fxls8962af_get_out(struct fxls8962af_data *data,
 
 	is_active = fxls8962af_is_active(data);
 	if (!is_active) {
-		ret = fxls8962af_power_on(data);
-		if (ret)
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret) {
+			dev_err(dev, "failed to power on: %d\n", ret);
 			return ret;
+		}
 	}
 
 	ret = regmap_bulk_read(data->regmap, chan->address,
 			       &raw_val, sizeof(data->lower_thres));
 
 	if (!is_active)
-		fxls8962af_power_off(data);
+		pm_runtime_put_autosuspend(dev);
 
 	if (ret) {
 		dev_err(dev, "failed to get out reg 0x%lx\n", chan->address);
@@ -628,6 +606,7 @@ fxls8962af_write_event_config(struct iio_dev *indio_dev,
 			      enum iio_event_direction dir, bool state)
 {
 	struct fxls8962af_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
 	u8 enable_event, enable_bits;
 	int ret, value;
 
@@ -687,18 +666,22 @@ fxls8962af_write_event_config(struct iio_dev *indio_dev,
 
 	if (data->enable_event) {
 		fxls8962af_active(data);
-		ret = fxls8962af_power_on(data);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret) {
+			dev_err(dev, "failed to power on: %d\n", ret);
+			return ret;
+		}
 	} else {
 		if (!iio_device_claim_direct(indio_dev))
 			return -EBUSY;
 
 		/* Not in buffered mode so disable power */
-		ret = fxls8962af_power_off(data);
+		pm_runtime_put_autosuspend(dev);
 
 		iio_device_release_direct(indio_dev);
 	}
 
-	return ret;
+	return 0;
 }
 
 static const struct iio_event_spec fxls8962af_event[] = {
@@ -840,7 +823,15 @@ static int __fxls8962af_fifo_set_mode(struct fxls8962af_data *data, bool onoff)
 
 static int fxls8962af_buffer_preenable(struct iio_dev *indio_dev)
 {
-	return fxls8962af_power_on(iio_priv(indio_dev));
+	struct fxls8962af_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		dev_err(dev, "failed to power on: %d\n", ret);
+
+	return ret;
 }
 
 static int fxls8962af_buffer_postenable(struct iio_dev *indio_dev)
@@ -889,9 +880,10 @@ static int fxls8962af_buffer_predisable(struct iio_dev *indio_dev)
 static int fxls8962af_buffer_postdisable(struct iio_dev *indio_dev)
 {
 	struct fxls8962af_data *data = iio_priv(indio_dev);
+	struct device *dev = regmap_get_device(data->regmap);
 
 	if (!data->enable_event)
-		fxls8962af_power_off(data);
+		pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }
-- 
2.56.0.218.g1ec904b173-goog

