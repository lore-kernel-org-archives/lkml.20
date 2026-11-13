Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583953;
	b=ukYi+swz0y00aE9WlrNTUvdg5szy5jcZ9LNwlCvlCzn7pgYnor4dRH6VB0n6E3vGCV/H
	 o8fCsVBAdssa55CB5ji+TBFjSmhJgEHv0flEzkk/D5nvfnCnvK6sRjhd7f3iha0wNmphN
	 l/MCLkmy6kzg67gU7fllzXJLfnYXtHDDm3ewKdJ22lx6ZzW4jpuvo374INacxPJwDpgWl
	 Jg6oI1LyMA7SvjWvkIS0wnTsyuEw3jPCM7VNujwvD94M2zDCOt1MVgITPUAzLeGDdLlGO
	 CeG47BESblMKKpQVRm3eGMJ0GNKAbbaydVi+FmGO01zCRjlyZroNaRW6DKPy7ygaR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583953;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=kbraa1Oo2k9WPuG5q/cG4uVfKcbAhsiQ3/8iHYpQje0=;
	b=QPgAgrPy0f7y51DmQS4L4SP2i9OrdJA1HB+LHeMlZqDUdJNcWh8c0Hl4TPpD4w6AwpTR
	 x6gyW2OgQsnI7Jl7SU3P1GvsrriGw4y7ad6yjJjOTjP9S/XcuTtolKqidajzSJGbZaX74
	 Bd4RCILgqXydDLTSfgxq08zq8xuTUCsadipeBqjQDcnPZT6p3Wee+PbzZsC/Dt/bxlPCE
	 roUE6UA9Cm7mkY+RTnOBgaBZ/+ighfKmLFpbNpjTHgSxkGmg3R0NGMZgg4AEXm52aFrx8
	 czzyGnKTe62jCiFVGjNJmeTlcm1WmkBOcjCaQy8jwGcaHlcPgzxbdmf70aGX17R6rBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mFTQVm7H;
	arc=none smtp.remote-ip=95.215.58.39
Received: from mta1.migadu.com (out-39.mta1.migadu.com [95.215.58.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF2606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CF2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mFTQVm7H
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wigmDGIoLzGp/BFVFhke9A8S5TPOzYnAbLU2MuAeWHQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583950; v=1; x=1795188750;
 b=mFTQVm7H0xDZOwVWUT4S4gqE09WKeqsJbQ3Q27SKAVyn2QUd4CICtMcOZxVl8psxvqVLyGfY
 O+6Y24seSqDgCVdYL3tVg+j6qIpi4v68F8BSC2Z3dE8D/RTp6V33+NDjeTdqTR3qACsgM2/tHit
 nUz5syV0bq3MiEQWzXnaB+fI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9770b19fa137c42b;
	Fri, 13 Nov 2026 15:32:30 +0000
X-Mizu-Trace-ID: 9770b19fa137c42b
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:55 +0800
Subject: [PATCH v2 07/10] regmap: factor out format initialisation into
 helpers
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
Message-Id: <20261113-regmap-improve-v2-7-5dfd6a89078f@nxp.com>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
In-Reply-To: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

Extract the two large nested switch statements that select
format_reg()/format_write() and format_val()/parse_val() into dedicated
regmap_set_reg_format() and regmap_set_val_format() helpers. Wrap the
entire format setup sequence - format selection, endianness cross-check,
work buffer allocation and bus write callback selection - into a single
regmap_init_format() function.

The two callers (config->read/write path with NATIVE endian, and the
bus->read/write path with bus-derived endian) now each call
regmap_init_format() directly, which eliminates the forward
"goto skip_format_initialization" and removes the label entirely.

The implicit "ret = -EINVAL; /* Later error paths rely on this */"
contract is replaced by explicit return codes in each helper.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 399 ++++++++++++++++++++++---------------------
 1 file changed, 200 insertions(+), 199 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index eaf7555f9765..ae313a8e4ffe 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -846,6 +846,197 @@ static int regmap_init_ranges(struct regmap *map, const struct regmap_config *co
 	return 0;
 }
 
+/* Pick format_reg()/format_write() for the register width and endianness. */
+static int regmap_set_reg_format(struct regmap *map, const struct regmap_config *config,
+				 enum regmap_endian reg_endian)
+{
+	switch (config->reg_bits + map->reg_shift) {
+	case 2:
+		if (config->val_bits != 6)
+			return -EINVAL;
+		map->format.format_write = regmap_format_2_6_write;
+		return 0;
+
+	case 4:
+		if (config->val_bits != 12)
+			return -EINVAL;
+		map->format.format_write = regmap_format_4_12_write;
+		return 0;
+
+	case 7:
+		switch (config->val_bits) {
+		case 9:
+			map->format.format_write = regmap_format_7_9_write;
+			return 0;
+		case 17:
+			map->format.format_write = regmap_format_7_17_write;
+			return 0;
+		}
+		return -EINVAL;
+
+	case 10:
+		if (config->val_bits != 14)
+			return -EINVAL;
+		map->format.format_write = regmap_format_10_14_write;
+		return 0;
+
+	case 12:
+		if (config->val_bits != 20)
+			return -EINVAL;
+		map->format.format_write = regmap_format_12_20_write;
+		return 0;
+
+	case 8:
+		map->format.format_reg = regmap_format_8;
+		return 0;
+
+	case 16:
+		switch (reg_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_reg = regmap_format_16_be;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_reg = regmap_format_16_le;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_reg = regmap_format_16_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+
+	case 24:
+		if (reg_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->format.format_reg = regmap_format_24_be;
+		return 0;
+
+	case 32:
+		switch (reg_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_reg = regmap_format_32_be;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_reg = regmap_format_32_le;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_reg = regmap_format_32_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return -EINVAL;
+}
+
+/* Pick format_val()/parse_val() for the value width and endianness. */
+static int regmap_set_val_format(struct regmap *map, const struct regmap_config *config,
+				 enum regmap_endian val_endian)
+{
+	if (val_endian == REGMAP_ENDIAN_NATIVE)
+		map->format.parse_inplace = regmap_parse_inplace_noop;
+
+	switch (config->val_bits) {
+	case 8:
+		map->format.format_val = regmap_format_8;
+		map->format.parse_val = regmap_parse_8;
+		map->format.parse_inplace = regmap_parse_inplace_noop;
+		return 0;
+	case 16:
+		switch (val_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_val = regmap_format_16_be;
+			map->format.parse_val = regmap_parse_16_be;
+			map->format.parse_inplace = regmap_parse_16_be_inplace;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_val = regmap_format_16_le;
+			map->format.parse_val = regmap_parse_16_le;
+			map->format.parse_inplace = regmap_parse_16_le_inplace;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_val = regmap_format_16_native;
+			map->format.parse_val = regmap_parse_16_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	case 24:
+		if (val_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->format.format_val = regmap_format_24_be;
+		map->format.parse_val = regmap_parse_24_be;
+		return 0;
+	case 32:
+		switch (val_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_val = regmap_format_32_be;
+			map->format.parse_val = regmap_parse_32_be;
+			map->format.parse_inplace = regmap_parse_32_be_inplace;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_val = regmap_format_32_le;
+			map->format.parse_val = regmap_parse_32_le;
+			map->format.parse_inplace = regmap_parse_32_le_inplace;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_val = regmap_format_32_native;
+			map->format.parse_val = regmap_parse_32_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Set up the format/parse functions, cross-validate endianness,
+ * allocate the work buffer and select the bus write path.
+ */
+static int regmap_init_format(struct regmap *map,
+			      const struct regmap_config *config,
+			      enum regmap_endian reg_endian,
+			      enum regmap_endian val_endian)
+{
+	int ret;
+
+	ret = regmap_set_reg_format(map, config, reg_endian);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_val_format(map, config, val_endian);
+	if (ret)
+		return ret;
+
+	if (map->format.format_write) {
+		if (reg_endian != REGMAP_ENDIAN_BIG ||
+		    val_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->use_single_write = true;
+	}
+
+	if (!map->format.format_write &&
+	    !(map->format.format_reg && map->format.format_val))
+		return -EINVAL;
+
+	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
+	if (map->work_buf == NULL)
+		return -ENOMEM;
+
+	if (map->format.format_write) {
+		map->defer_caching = false;
+		map->reg_write = _regmap_bus_formatted_write;
+	} else if (map->format.format_val) {
+		map->defer_caching = true;
+		map->reg_write = _regmap_bus_raw_write;
+	}
+
+	return 0;
+}
+
 struct regmap *__regmap_init(struct device *dev,
 			     const struct regmap_bus *bus,
 			     void *bus_context,
@@ -854,7 +1045,6 @@ struct regmap *__regmap_init(struct device *dev,
 			     const char *lock_name)
 {
 	struct regmap *map;
-	enum regmap_endian reg_endian, val_endian;
 	bool fast_io;
 	int ret;
 
@@ -879,8 +1069,6 @@ struct regmap *__regmap_init(struct device *dev,
 	if (ret)
 		goto err_name;
 
-	ret = -EINVAL; /* Later error paths rely on this */
-
 	/*
 	 * When we write in fast-paths with regmap_bulk_write() don't allocate
 	 * scratch buffers with sleeping allocations.
@@ -956,22 +1144,23 @@ struct regmap *__regmap_init(struct device *dev,
 		map->read = config->read;
 		map->write = config->write;
 
-		reg_endian = REGMAP_ENDIAN_NATIVE;
-		val_endian = REGMAP_ENDIAN_NATIVE;
+		ret = regmap_init_format(map, config,
+					 REGMAP_ENDIAN_NATIVE,
+					 REGMAP_ENDIAN_NATIVE);
+		if (ret)
+			goto err_hwlock;
 	} else if (!bus) {
 		map->reg_read  = config->reg_read;
 		map->reg_write = config->reg_write;
 		map->reg_update_bits = config->reg_update_bits;
 
 		map->defer_caching = false;
-		goto skip_format_initialization;
 	} else if (!bus->read || !bus->write) {
 		map->reg_read = _regmap_bus_reg_read;
 		map->reg_write = _regmap_bus_reg_write;
 		map->reg_update_bits = bus->reg_update_bits;
 
 		map->defer_caching = false;
-		goto skip_format_initialization;
 	} else {
 		map->reg_read  = _regmap_bus_read;
 		map->reg_update_bits = bus->reg_update_bits;
@@ -979,201 +1168,13 @@ struct regmap *__regmap_init(struct device *dev,
 		map->read = bus->read;
 		map->write = bus->write;
 
-		reg_endian = regmap_get_reg_endian(bus, config);
-		val_endian = regmap_get_val_endian(dev, bus, config);
-	}
-
-	switch (config->reg_bits + map->reg_shift) {
-	case 2:
-		switch (config->val_bits) {
-		case 6:
-			map->format.format_write = regmap_format_2_6_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 4:
-		switch (config->val_bits) {
-		case 12:
-			map->format.format_write = regmap_format_4_12_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 7:
-		switch (config->val_bits) {
-		case 9:
-			map->format.format_write = regmap_format_7_9_write;
-			break;
-		case 17:
-			map->format.format_write = regmap_format_7_17_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 10:
-		switch (config->val_bits) {
-		case 14:
-			map->format.format_write = regmap_format_10_14_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 12:
-		switch (config->val_bits) {
-		case 20:
-			map->format.format_write = regmap_format_12_20_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 8:
-		map->format.format_reg = regmap_format_8;
-		break;
-
-	case 16:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_16_be;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_reg = regmap_format_16_le;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_reg = regmap_format_16_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 24:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_24_be;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 32:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_32_be;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_reg = regmap_format_32_le;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_reg = regmap_format_32_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	default:
-		goto err_hwlock;
-	}
-
-	if (val_endian == REGMAP_ENDIAN_NATIVE)
-		map->format.parse_inplace = regmap_parse_inplace_noop;
-
-	switch (config->val_bits) {
-	case 8:
-		map->format.format_val = regmap_format_8;
-		map->format.parse_val = regmap_parse_8;
-		map->format.parse_inplace = regmap_parse_inplace_noop;
-		break;
-	case 16:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_16_be;
-			map->format.parse_val = regmap_parse_16_be;
-			map->format.parse_inplace = regmap_parse_16_be_inplace;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_val = regmap_format_16_le;
-			map->format.parse_val = regmap_parse_16_le;
-			map->format.parse_inplace = regmap_parse_16_le_inplace;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_val = regmap_format_16_native;
-			map->format.parse_val = regmap_parse_16_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	case 24:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_24_be;
-			map->format.parse_val = regmap_parse_24_be;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	case 32:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_32_be;
-			map->format.parse_val = regmap_parse_32_be;
-			map->format.parse_inplace = regmap_parse_32_be_inplace;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_val = regmap_format_32_le;
-			map->format.parse_val = regmap_parse_32_le;
-			map->format.parse_inplace = regmap_parse_32_le_inplace;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_val = regmap_format_32_native;
-			map->format.parse_val = regmap_parse_32_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	}
-
-	if (map->format.format_write) {
-		if ((reg_endian != REGMAP_ENDIAN_BIG) ||
-		    (val_endian != REGMAP_ENDIAN_BIG))
+		ret = regmap_init_format(map, config,
+					 regmap_get_reg_endian(bus, config),
+					 regmap_get_val_endian(dev, bus, config));
+		if (ret)
 			goto err_hwlock;
-		map->use_single_write = true;
-	}
-
-	if (!map->format.format_write &&
-	    !(map->format.format_reg && map->format.format_val))
-		goto err_hwlock;
-
-	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
-	if (map->work_buf == NULL) {
-		ret = -ENOMEM;
-		goto err_hwlock;
-	}
-
-	if (map->format.format_write) {
-		map->defer_caching = false;
-		map->reg_write = _regmap_bus_formatted_write;
-	} else if (map->format.format_val) {
-		map->defer_caching = true;
-		map->reg_write = _regmap_bus_raw_write;
 	}
 
-skip_format_initialization:
 
 	ret = regmap_init_ranges(map, config);
 	if (ret)

-- 
2.56.0

