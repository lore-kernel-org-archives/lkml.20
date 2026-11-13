Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583937;
	b=3TDHCUGpwnUkB+iyEmz/HXGMPlZnRiwuuQHtGYBzrv3JDqXYXK1PYAO9nzCAZIr3JXin
	 uxoS2LHZiUmTN48caqdncmqpv6PX60+VYFatWs/MmSj6HviNV5HowqmopFMwegpbUOIUA
	 5n/YYL8Q35Hmu+AADEjGhZkpWTLEeeAR/96akNlCrUwHQNzJQbjDSOqRzTlmrNyWVDQPL
	 a640vfYC6qqM+9Q5iVkJ3+dE6iLsg1R913GJx5+6PsqSerm91VwWAxqAOwFictMTGfPyK
	 2LNAFY1ZqHR1KmswbD0zfQ+wSHtkwW4iQKieep3VwG4qrt2u31dmjl/kn4ykNxBAP6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583937;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=ERzH1Kn1Y16W93oO/+2OLuXQMn+6z6tclyWb9WrVbl8=;
	b=cLN/Qg1mbSP/E0t7TAtVVBCMHjkOQ6wWg+2t7FV4T4X2MEOc+qiD2W/+GI3JmG4qGGRz
	 nYNHqg3JKawXAyqrnwhiBHCU1qwBkyJhMekkE5BLIbOfdos4CmreGYS6LJZZrg0vBI0av
	 DHhxlwRiV2s7AOPl5WkLVU7LTBLNevrHIJip8ue9rBw1c9oLiPU93rz2cVdcTtLW56A5F
	 ZL2YqtdQJR7s+ofZFTkULaFpjpw3PK+NlvWCusCnuxYs0I4ZdKatfl8fqnChp0bAZN/AL
	 3do+PGHn+JVs2aDCtekvOAminXGoWBR+Ci1IR0SXTCl7v7ltA9TPUGvdCGid46rPkYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mTU8gMU2;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223B606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E223B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mTU8gMU2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eiQCVAPTFGB4dzwgGOIKbq8pzYm9DgU/Qxt5MG1MaEI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583935; v=1; x=1795188735;
 b=mTU8gMU2LNeAPCVuH7YGE47qvJQ4ykqJpgNraghh0Ajy2t6SKuToRZZPCkZvwJYijf/AKZrW
 CW1up3L4lTgkO3nuGzMTEr9TkjUtg4DXZ0TcPm5wCklG6O4aL/dgOUq4gKVhR+V0xDh9695JzIQ
 KZgtswbnUCPFbSkfrOEO2MDA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e441452a01d0e55c;
	Fri, 13 Nov 2026 15:32:14 +0000
X-Mizu-Trace-ID: e441452a01d0e55c
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:51 +0800
Subject: [PATCH v2 03/10] regmap-i2c: fix write limit clamping for adapter
 quirks
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
Message-Id: <20261113-regmap-improve-v2-3-5dfd6a89078f@nxp.com>
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

The adapter max_write_len quirk covers the whole write message, including
the register address, while max_raw_write is the payload limit. Calculate
the payload limit before comparing it with max_raw_write, otherwise a bus
limit that fits in the message but not in the quirk payload is left
unchanged and the transfer fails in i2c_check_for_quirks().

Also avoid installing a payload limit smaller than one value.
_regmap_raw_write() splits transfers using max_raw_write / val_bytes, so a
limit below val_bytes results in a zero chunk size and a division by zero.
If the adapter cannot fit a single value after the register address, no
raw write can succeed, so keep the existing limit.

The subtraction must not underflow when max_write_len does not exceed the
register address size, so only calculate the payload limit when the quirk
leaves room for it. Apply the same minimum-size check to the read quirk
because max_raw_read is used as a divisor too.

Fixes: 611b7eb19d0a ("regmap-i2c: Subtract reg size from max_write")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-i2c.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index 8663a4ec0a3d..a4a259232980 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -8,6 +8,7 @@
 
 #include <linux/regmap.h>
 #include <linux/i2c.h>
+#include <linux/bitops.h>
 #include <linux/module.h>
 
 #include "internal.h"
@@ -353,6 +354,7 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 	const struct i2c_adapter_quirks *quirks;
 	const struct regmap_bus *bus = NULL;
 	struct regmap_bus *ret_bus;
+	size_t val_bytes;
 	u16 max_read, max_write;
 
 	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
@@ -393,17 +395,28 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 
 	max_read = bus->max_raw_read;
 	max_write = bus->max_raw_write;
+	val_bytes = BITS_TO_BYTES(config->val_bits);
 
 	quirks = i2c->adapter->quirks;
 	if (quirks) {
 		if (quirks->max_read_len &&
+		    quirks->max_read_len >= val_bytes &&
 		    (max_read == 0 || max_read > quirks->max_read_len))
 			max_read = quirks->max_read_len;
 
-		if (quirks->max_write_len &&
-		    (max_write == 0 || max_write > quirks->max_write_len))
-			max_write = quirks->max_write_len -
-				(config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
+		if (quirks->max_write_len) {
+			size_t reg_reserve_size, max_payload;
+
+			reg_reserve_size = (config->reg_bits + config->pad_bits) /
+					   BITS_PER_BYTE;
+			if (quirks->max_write_len > reg_reserve_size) {
+				max_payload = quirks->max_write_len -
+					      reg_reserve_size;
+				if (max_payload >= val_bytes &&
+				    (max_write == 0 || max_write > max_payload))
+					max_write = max_payload;
+			}
+		}
 
 		if (max_read != bus->max_raw_read ||
 		    max_write != bus->max_raw_write) {

-- 
2.56.0

