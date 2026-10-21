Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627287;
	b=cVCYF97WV0ys6yUXwIZpyjHg/IGJdIkGPZMJFceO4ucuH9HiIcYkqtj2Kqs8Q+IjqEGf
	 +Av3eZWcZzabsghwz/2+jxrbBJ9DeZy7PC1F5a9xrvIYhmYWj+kLy8662/BaF9W+VgdkY
	 taR8CeAbOsc0p4/kn0e7p92IxEx65nSNt0amZlg9nDYLBrl1xP/qGFJXbS/3bMhIZvMjj
	 1d1pr2crRcbwq9WNLVd/KX87e+iwGPpAmdxj+ibBDDi/H9YogLAOJ/wEpzzRRIYn4+iqo
	 9QmYMMhe93/On/bWHqFyQxRznxj3yRs62LlF7ywQ4tyjhxnAwRPKJpifLTi9lrvca2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1uqPCq3qxm+fw1hPGBE2UXSjTZOflrZR/TS0Ft0vAgA=;
	b=SqnYg1FvBPug0aUXHUQzzbHg+uDflHX1bSP54dATwYmyfg0l6B6lMZIx0W8ayKNfuvIo
	 Eq0BC7/cGEv4hIbVC5RosomtabW9gQXzMIcW1hPG7OBifVMdgyO9K0wto9Vy107KQzmsl
	 zgFMAd/WqarOwNR2xJnSTUOkG2i7QpP45whHzw7miBhf7XDU8xuMSUdAXG5B5zRP/mn59
	 +T2Cg/ZHmuJaSccXDVcXGZUoqjNNECNEbUgaHNOzlsg9k2M8RFnHQ8ZMC3lg1Hl0hddQm
	 JULgZ85Sria5CfucpMMFGDkaJlqLR4Zay5rWO7uBKtZIm7KGbqfhl3KdhDHO7wa14hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="buQiQ/D3";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54860A2631
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A54860A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=buQiQ/D3
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36661f953e4so2433637eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627286; x=1793232086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uqPCq3qxm+fw1hPGBE2UXSjTZOflrZR/TS0Ft0vAgA=;
        b=buQiQ/D3DAXlEypzLtAc/t9usf8mNTUED8VNz4jhlaYhRYbrcB8G2APPcGr7JXYBdV
         z6cysmNgjTPY/AjuXOHTwA+xfg/2i/tYOGz4RyyEXjexC2X6BmAYFze6sZ2cYSaX9Xq9
         q7Yo4+2gAFIsEEy6rcf9nfXlWOKkDSqe4UmqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627286; x=1793232086;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uqPCq3qxm+fw1hPGBE2UXSjTZOflrZR/TS0Ft0vAgA=;
        b=dHtX/S4KixNjXJqxbBieT+GeJeMasCNn4AUa39JErtt53t6EC8RdwYbNngb3Z17p/5
         N4UaVrG47+sk20JFjdXE/8qyI+deR718Ve9i0ujIijOemq95tj6k0EwkKVlG7wzS6gZV
         EkfVGwXFdMClV8CdK3lwDZhXMJPDUCV+NEn+OVYIzGjdCCoZy1Mmiw8ttrJHNqaFb8eP
         UU/iBfyJluzHwO3NV5y3Mspu7WqRyiy5dg2BlvmyeeZPuJI4U27AdIo72/M6LOEK6pHB
         a/Gst77qJYP1uQXebROyad3eppuXwiteztK3MouB/q2VlXw3X6YrdTOuKDhZcPSDH19m
         VLMA==
X-Forwarded-Encrypted: i=1; AKwUvBy/2zuypu44Ytb2miN+pCjc2o6/pQAvO4BXYQ4MbvCezdKOFFkZ52bi+CUeBUkevkOQOpmwXQFPdEbW638=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5JcgIP0cqffcejOPCo3suwlFcasanu/yG0OyJaAcDNTdhaB/m
	qlTi/Irix6XbHkD6+BkhGOg43xMunRJNBVwqwOzTsrTtIRQsQJXr8XCTqKHg1+ikJw==
X-Gm-Gg: AYBFou0gQfy4unKm2AcjIrZLvag4Pxct8VufjjiyWKx7rphGWFLDjbOzMVEJxjmS/5d
	WQf6JYZiMk/Ss6JTKo779S/2VLvldnYwrcuBbzp0Lcfv622PVLV6S5Xwut8QQXsJaxymiV6lZFn
	Oy3i6Cg0f76sNV/I8GnI3D1HEa0hg1hqtZNVMbrS+3oZsTWlg5VNugIfTtIbidXGwFRpqVcEUaJ
	FsuKMQA7ygnA2dF9jATIWlT6oKWFugF5K/45KS7yvciyLUnH5i4r0XGtxcaopusdyDTGZ40nlif
	VCew1gGEEUCsanwnFfdg41/ZrYbIeSu4HD98utqXf6CEBzDjqvFsr7rPQBxwsZRiNJ+W8x1In2y
	i/b2+XnGEJCOLfRhgP9ErH7y+Ljn5WwjO0QjK7Fl/HaIWdAEKGNVhDkPYGhL56GNpqQ8FWqeQfU
	RQBsW2yZR7ACAJmqXUiVSZhJkZZk215/hLmcvXvOt7Q4mPsh6j9JiyJR3HVqryVkval7G7HxdLH
	3YdJPPfm3ywptgGmOcKvUKsbnhGgXA4pU3Qw8GtceWr3yh1YcH43n/UIqFEZG1gO66acwWH5NsU
	Vl5tRIyoeTpEuLl2bJr1bjBa2n5kAdzHhfESgfzn
X-Received: by 2002:a05:693c:41c2:20b0:366:2893:7429 with SMTP id 5a478bee46e88-3674e0501e2mr4574299eec.24.1792627285985;
        Wed, 21 Oct 2026 17:01:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3674198f1d8sm15879892eec.24.2026.10.21.17.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:25 -0700 (PDT)
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
Subject: [PATCH v2 07/17] iio: adc: ti-ads1015: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:08 -0700
Message-ID: <20261021165858.v2.7.Ib4e8fc11192ec5721b98bd85fa9a68d3349ba9e8@changeid>
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
pm_runtime_put_autosuspend() return value. Inline
ads1015_set_power_state() while we're at it, since its behavior is now
the same with and without CONFIG_PM, and it is otherwise trivial.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Split iio patch into per-driver patches
 * Inlining

 drivers/iio/adc/ti-ads1015.c | 50 +++++++++++++-----------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0f9244107c6d..a677ec7abda2 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -367,30 +367,6 @@ static const struct iio_chan_spec tla2024_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(ADS1015_TIMESTAMP),
 };
 
-
-#ifdef CONFIG_PM
-static int ads1015_set_power_state(struct ads1015_data *data, bool on)
-{
-	int ret;
-	struct device *dev = regmap_get_device(data->regmap);
-
-	if (on)
-		ret = pm_runtime_resume_and_get(dev);
-	else
-		ret = pm_runtime_put_autosuspend(dev);
-
-	return ret < 0 ? ret : 0;
-}
-
-#else /* !CONFIG_PM */
-
-static int ads1015_set_power_state(struct ads1015_data *data, bool on)
-{
-	return 0;
-}
-
-#endif /* !CONFIG_PM */
-
 static
 int ads1015_get_adc_result(struct ads1015_data *data, int chan, int *val)
 {
@@ -533,26 +509,29 @@ static int ads1015_read_avail(struct iio_dev *indio_dev,
 static int __ads1015_read_info_raw(struct ads1015_data *data,
 				   struct iio_chan_spec const *chan, int *val)
 {
+	struct device *dev = regmap_get_device(data->regmap);
 	int ret;
 
 	if (ads1015_event_channel_enabled(data) &&
 	    data->event_channel != chan->address)
 		return -EBUSY;
 
-	ret = ads1015_set_power_state(data, true);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
 	ret = ads1015_get_adc_result(data, chan->address, val);
 	if (ret < 0) {
-		ads1015_set_power_state(data, false);
+		pm_runtime_put_autosuspend(dev);
 		return ret;
 	}
 
 	*val = sign_extend32(*val >> chan->scan_type.shift,
 			     chan->scan_type.realbits - 1);
 
-	return ads1015_set_power_state(data, false);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
 }
 
 static int ads1015_read_raw(struct iio_dev *indio_dev,
@@ -708,6 +687,7 @@ static int ads1015_read_event_config(struct iio_dev *indio_dev,
 static int ads1015_enable_event_config(struct ads1015_data *data,
 	const struct iio_chan_spec *chan, int comp_mode)
 {
+	struct device *dev = regmap_get_device(data->regmap);
 	int low_thresh = data->thresh_data[chan->address].low_thresh;
 	int high_thresh = data->thresh_data[chan->address].high_thresh;
 	int ret;
@@ -736,7 +716,7 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 	if (ret)
 		return ret;
 
-	ret = ads1015_set_power_state(data, true);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 
@@ -745,7 +725,7 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 	ret = ads1015_get_adc_result(data, chan->address, &val);
 	if (ret) {
 		ads1015_event_channel_disable(data, chan->address);
-		ads1015_set_power_state(data, false);
+		pm_runtime_put_autosuspend(dev);
 	}
 
 	return ret;
@@ -775,7 +755,9 @@ static int ads1015_disable_event_config(struct ads1015_data *data,
 
 	ads1015_event_channel_disable(data, chan->address);
 
-	return ads1015_set_power_state(data, false);
+	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+
+	return 0;
 }
 
 static int ads1015_write_event_config(struct iio_dev *indio_dev,
@@ -836,12 +818,16 @@ static int ads1015_buffer_preenable(struct iio_dev *indio_dev)
 	if (ads1015_event_channel_enabled(data))
 		return -EBUSY;
 
-	return ads1015_set_power_state(iio_priv(indio_dev), true);
+	return pm_runtime_resume_and_get(regmap_get_device(data->regmap));
 }
 
 static int ads1015_buffer_postdisable(struct iio_dev *indio_dev)
 {
-	return ads1015_set_power_state(iio_priv(indio_dev), false);
+	struct ads1015_data *data = iio_priv(indio_dev);
+
+	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+
+	return 0;
 }
 
 static const struct iio_buffer_setup_ops ads1015_buffer_setup_ops = {
-- 
2.56.0.218.g1ec904b173-goog

