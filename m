Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790949EC60
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288193; cv=none; b=V6GRoEN06U3lrJYJMQcmd8JZKNosKCdudiuUL1vAYvQopaX9q0ZMG4gCm9DIEW35qIq7QxFDfar235Zlg5h5uewAXSdh5pV71yQ/W4K6feXOMp1RVMF9tGBbXjg5QpPwF2T3jvcaxgxJ5aMGjPp5RxtW4uQM9CtyuqZjMRActnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288193; c=relaxed/simple;
	bh=DH57RPYRxChSY8YwQPpl6oapIsXNooDhZSIJodJcGq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgDq8Wye9x8+KVphwOFMfjX5Vl3nyqR4rDCEVUWHtATeI93yb+k+5HjDL8dEuSs1Jy5hIk/vH+V/T7eKVBEFwQqw1TuY2y3YT7PQdZC4BhlLTE69kiDFVQKFtbhCwGuYAOED/w+OPQCPCjgsiyOvpxSXb1PqWZrssDUhstsNz30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWX7agq2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWX7agq2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so1166865e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288190; x=1788892990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6o11zFnIa7BvYQwN2OAtZDkmujzqm33bgxkL6mWOBE=;
        b=SWX7agq27EZvnAh0cz8UVwpkbgc1eFQC5+gjkdeML39MC7RT3rO3KlAbOA6hlH8r3X
         fh4Yvfnfox4ZgqmnXmLJ4ePbVHkDK77h+5daB3XE0SxWVG7tQuZ3saRju4goa8lwINPK
         dxcLNNU+9QAvQ6SdsA9KBy7/yDB5a6smtDAXHRxIrT3zo+RZrGqFdW0+FAKZegyMJjd6
         ZmUMU7JBDVY+X19Clf/HFXUdrpqBlYZlYvNL2ZOiLp/Ix8ovC3mQAULNDmivU4kLTJ83
         9MTds8Btn0GgH+IzcceVno0GLpJdrLpX1HANzoU4H+hQXFH3WAcXJdrTWgbjWZVCuoJz
         RfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288190; x=1788892990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6o11zFnIa7BvYQwN2OAtZDkmujzqm33bgxkL6mWOBE=;
        b=dc52Y68cxgE2RIfZhPFHbxXX9G5YFh15d1zCiyakA+q2F/vtkm2BKhKsizrBwIo9tc
         hecyt9j3rXWKnXlwUDpoaiTtDXlUYEf74nuLCgVftDav2UlGhix5uslxuSKivCsB7C4I
         6PMFbweUPzuEX6EbHzh6r/omLwq4NQCSDVG3JtjtaC+BPbB60EHFuKD5MpxVAtgQEuYj
         F8/iGh8iO904hXFBk5JF64QIMgMUP8jWj/p2D+6fp8T3H6pEFjtZG73acV3FrPjviE5i
         /jIAa9914ykG6P3T03a8Jqqdf+DjWx6Xwn6e6JBo/wEp+0ak3zXQK0zmNI22FJCacAVl
         Vu8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr65jRx9PcEZY4/+Ok5Oz8rTVB1Ykn6TQTBD8SmEn4w47837WWL1C5RENNM2CJwZ9+akzT34eKWOzvulVE=@vger.kernel.org
X-Gm-Message-State: AFuF++lepnx9HWMcdo4ahpzfdM3ATNPF5lY2uZd84KwIWukbwXdm0c8k
	dtAV9JBr0w7Es5G7X5ew1ht2+RgYrQ/zTYOZScm7AyVYhouYdm2HXE3ScDy9RevB
X-Gm-Gg: AR+sD12nSNcIVKNZE1OlkO77xUTN3UZrg/kWS+iXuqb46OYPHlBX+G8uSCA/tUxuOZ4
	seON2J+Wv14QC2TmZWZoFZtB/3wpfs5smi7kK3slFjfYmnmZ3b5+sU/ApaiN03XcgEus9yz0dyx
	TgKLKD9789SBbyOtik72pvpNTLwT5E4khiJiMqPPbaNN2iGgtl5uhNHSdyjVLyLKrdkUM205nR2
	w6+ExasfNVypAAxjg/K9cvzraQnU51NLmeLD1dXzBk42jsIb0DuSNDDLjkub5/zl1BYcmyAXUv7
	tf5CRmazpuG7X/ILSaowebkiBqEUmQbVTnYT8lhFiGh821FwrNLnYVgrNezl4oPvtrqTPDH4TXQ
	4lpLtXwddSpYQ0S4StDXOQZsesS2sa/phl0sO60g/LH3P8Hx3pAsqjYhwQo3gZTd9DfK6H8tfz8
	eDOBJGzjqT+qs2LHOVCJWayWGqBY1ko+OZe83OMADpB+bLgbBoWulZSDrk87yXwTF7wxeApIzjJ
	fnB8u+dtT7ibJInde83FjEmJawQAZ/gl75z
X-Received: by 2002:a05:600c:1c0a:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-49b91c1dd3fmr585852285e9.1.1788288189974;
        Tue, 01 Sep 2026 11:43:09 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm822987f8f.24.2026.09.01.11.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:43:09 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] iio: adc: ti-ads1015: Add support for label
Date: Tue,  1 Sep 2026 21:43:02 +0300
Message-ID: <20260901184302.8127-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901184302.8127-1-flaviu.nistor@gmail.com>
References: <20260901184302.8127-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for label sysfs attribute similar to other adc devices. This is
particularly useful because the label can match the schematic signal name,
identifying channel voltages easier if label is defined via device tree.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0fbfa4e499aa..399a3322732d 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -233,6 +233,7 @@ static const struct iio_event_spec ads1015_events[] = {
 struct ads1015_channel_data {
 	unsigned int pga;
 	unsigned int data_rate;
+	const char *label;
 };
 
 struct ads1015_thresh_data {
@@ -586,6 +587,22 @@ static int ads1015_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+static int ads1015_read_label(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan, char *label)
+{
+	struct ads1015_data *data = iio_priv(indio_dev);
+	const char *name = data->channel_data[chan->address].label;
+
+	/*
+	 * Avoid printing "(null)" in the console in case label property
+	 * is missing for the channel.
+	 */
+	if (!name)
+		name = "";
+
+	return sysfs_emit(label, "%s\n", name);
+}
+
 static int ads1015_write_raw(struct iio_dev *indio_dev,
 			     struct iio_chan_spec const *chan, int val,
 			     int val2, long mask)
@@ -843,6 +860,7 @@ static const struct iio_buffer_setup_ops ads1015_buffer_setup_ops = {
 static const struct iio_info ads1015_info = {
 	.read_avail	= ads1015_read_avail,
 	.read_raw	= ads1015_read_raw,
+	.read_label	= ads1015_read_label,
 	.write_raw	= ads1015_write_raw,
 	.read_event_value = ads1015_read_event,
 	.write_event_value = ads1015_write_event,
@@ -853,6 +871,7 @@ static const struct iio_info ads1015_info = {
 static const struct iio_info tla2024_info = {
 	.read_avail	= ads1015_read_avail,
 	.read_raw	= ads1015_read_raw,
+	.read_label	= ads1015_read_label,
 	.write_raw	= ads1015_write_raw,
 };
 
@@ -862,6 +881,7 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 	struct ads1015_data *data = iio_priv(indio_dev);
 	struct device *dev = &client->dev;
 	int i = -1;
+	const char *label;
 
 	device_for_each_child_node_scoped(dev, node) {
 		u32 pval;
@@ -897,6 +917,9 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 			}
 		}
 
+		if (!fwnode_property_read_string(node, "label", &label))
+			data->channel_data[channel].label = label;
+
 		data->channel_data[channel].pga = pga;
 		data->channel_data[channel].data_rate = data_rate;
 
-- 
2.34.1

