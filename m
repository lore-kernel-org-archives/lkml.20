Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82312503BD2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794596; cv=none; b=T++xshN/YUIbnUUMRFcbOM85Hdo3rSpgvLWiau5A0PludhRU6sBhV9h4PtclxWuJfZ2M5+Rsiv97bf1KchRNAE97lkeftcKZMo50ZkPVLYK3XW66cKQwY+Mict5be4YmOx0CAHhSywZcJovNCr56GTTZbTUhL/4ZzUkJFrG9tjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794596; c=relaxed/simple;
	bh=dq6QOnsULa1GJAx3h1sZHwK3pgAlPPHl5DxoXUXImkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyDkUkDfvIc72l7Z7m73VC5z/dXYlL3nZi6A2rJ5i+X+EXyCI+L1FB3seDVd7guqK3Ix1wmcpXO4s+5ZdpZBczVNTtEjwLYqEa/ty5qBclN8ocqgyPF8PcUg/2JTBJGmbH7AAtvGDuB1ZseYjQxJDTXw0NgLCactYb75xP9sLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw+//27Y; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw+//27Y"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e4998d28so2930305f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788794592; x=1789399392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuBDL/aaH1UR1BM5pkVKYW965YZzYu0aSLt8mFhBVfw=;
        b=Bw+//27Y15r/tZ1YTFGV7ja5GQsBZAlE2n239M4eREPHsYH9HILVZvTu4Z7zCpKhf2
         D9Rl4Ji+GukU1S7lJ5idgPNY4nViO4/iEN3lBqv9JWRGJ+vpdwtaEBxinaauIlFAYosK
         c/6l2yLhzszddafnaNKtT4hQ/gn42DsGA818uBizud5abyzmoDPLtIbyOvqCJqh1tP3+
         P1RaOZNkNtaUFn6WzZmHXAD288Yx1B2J1A6nO+kCasvc5qyCUw3U82l7ds8qNoIw8BdM
         Sc2c+j6uXi0R7MjKRzZb3YDOpWG85BYQCdZk9pRnxM52nCFVp1N2xava/MSxLUekPWrA
         WXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794593; x=1789399393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HuBDL/aaH1UR1BM5pkVKYW965YZzYu0aSLt8mFhBVfw=;
        b=Ul1EdjuzaJaEAXLow+BMXA6wQMqA2NjsZ8JpvmtJlBBehil55iVM7eS7Phr0eeDK4j
         2OWKplQ6L650MMcqenFRQ8nmMK4QT3xR/I5SzZHyCI9JGAMEFsGCBuor6K2QWv39dHg+
         lPIF6GuaMnGDN8INyoFLf12aQZuCpVdeh+mSLPFREaOvJ7WK5caoBuPdVagJHvFS0Mwp
         REkpibct5A0hWvJw2edrx+nPfy2S2Wm8M7EUXyjnFRW2BD3PknRDJQFdbJm0sAuX+40a
         UYb0reGrxVejVslxgn0tgTI05jBV1phG572IgmDV1gWU56FejS2AJ8HgG7EHLUbgESe5
         D51A==
X-Forwarded-Encrypted: i=1; AKwUvBzkDHmBdYdYiNS3kpZqrcWcr+1fGW0ipdNtBZUkIc67PoFUcaaIbBEe8X5QCQSAKX00myBmmemgbF2InYk=@vger.kernel.org
X-Gm-Message-State: AFuF++nwkBb+EjsiiUFQMphNoGaX2OadEj0sXs+tZJGFy8ua/8YPdcxI
	DUsSJO2yQOXbEVe2safPpFcBzHdqqc33wz8k24qxCLQg/cRR5t0YIE9g
X-Gm-Gg: AYBFou2Eae+k0TkkLgFY4distEmncFHtZOYjoiiS3w/Jv8JWpOAmoGQIFWM563CmYLq
	eLdPKSObd5NrhNef7KQ2/OudbFtCxJ7DwGhqFnMqchy9vvX/qgxsKw7vJOL+NN0D+v/jnm8UeSd
	3FV7RG5y4nKd9dOfh73jXaERxIdYxNzvvQqMSZQGvST3JJZ4IWX9l7r5w5YoOpAVUzxfpC+cqVY
	Lx7F95k3ejkBpC/TZtgv8TQ+tVuQ0V+6760GieonnyA8C/+fa6eMaNY/YlK2wdP/u1O8JVhXxrv
	V05VhusaRvNtf/Rh17LPvs/xtxOiiJ1+G3exHEtke3REFCV20SZ6xBSjaa4l/1MTCO9jEOhcMT9
	1C056l50dCrE23lpiModyxlrvxliujEpv/xYTToKzPVaym+LB7JwkcclZavr4qkO7MoTwEkv0gB
	4C0eoWbTagHqqTSLuvo5KNT3rh9Kx4dMfxBxpUzW1ObAYOeTbxsaWRgRuLINXbKCA2DDh9ba3oC
	1EmuqBpH3bnwvCoqiuOlL1qbbI5z6kgAjx2beqeykTxfIiHR5dm
X-Received: by 2002:a05:600c:8b25:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49cfc6ea704mr211565355e9.25.1788794592561;
        Mon, 07 Sep 2026 08:23:12 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm413785375e9.4.2026.09.07.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:23:12 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v3 2/2] iio: adc: ti-ads1015: Add support for label
Date: Mon,  7 Sep 2026 18:23:04 +0300
Message-ID: <20260907152304.4992-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907152304.4992-1-flaviu.nistor@gmail.com>
References: <20260907152304.4992-1-flaviu.nistor@gmail.com>
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
Changes in v3:
- Return datasheet_name of the channel in user space if label is not present in dts. 
- Link to v2: https://lore.kernel.org/all/20260902172230.5234-2-flaviu.nistor@gmail.com/
Changes in v2:
- Implement changes suggested by Andy Shevchenko. 
- Link to v1: https://lore.kernel.org/all/20260901184302.8127-2-flaviu.nistor@gmail.com/

 drivers/iio/adc/ti-ads1015.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0fbfa4e499aa..7ad03fa2253d 100644
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
+	 * is missing for the channel, or channel is not defined.
+	 */
+	if (!name)
+		name = chan->datasheet_name;
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
 
@@ -861,7 +880,9 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 	struct iio_dev *indio_dev = i2c_get_clientdata(client);
 	struct ads1015_data *data = iio_priv(indio_dev);
 	struct device *dev = &client->dev;
+	const char *label;
 	int i = -1;
+	int ret;
 
 	device_for_each_child_node_scoped(dev, node) {
 		u32 pval;
@@ -897,6 +918,15 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 			}
 		}
 
+		if (fwnode_property_present(node, "label")) {
+			ret = fwnode_property_read_string(node, "label", &label);
+			if (ret) {
+				dev_err(dev, "invalid label on %pfw\n", node);
+				return ret;
+			}
+			data->channel_data[channel].label = label;
+		}
+
 		data->channel_data[channel].pga = pga;
 		data->channel_data[channel].data_rate = data_rate;
 
-- 
2.34.1

