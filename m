Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121893;
	b=3V1iy2lQZTQFebVPpFYqL5fe7VG90Kvg09whDUjN0ih+BprBuiXygObW25tPcFdIWrvA
	 byI0F8IcgXylq4IFrPGUmG9uQL3Ww4goJ7wB/wkXSNmPAbFErZDimpYEZX479hJ9R6L2B
	 hnIg0UpVw3FKyk3JkLd1CtHPRyOk7Jo1yuvKUU8HJK2z9mHhkZ+x3LJmcCp1epqzMlpT1
	 U8z1lbw4+PiTU3nLN8S+FuWL6HI6HgqAME69KD/SRuuJU2E90Rm0YK/uxrronsTnk4Tnu
	 /ltMyFwi5Sc+zzMzKFM7ZUXujI9N0p5Omx9nNAkpvhZBaTLYWfDFxFiz4UKG3T6e5zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121893;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=/DvVtlbyT0nF+E9JOjJEFEvCJ/30kVZRs824cszDUkA=;
	b=VHmKlbtrD1MhrJm15VXBhVBsk2tUKG9rau7tejw5Xxb0IOreP11Z0d5Leeqo1YPCvlKg
	 WI1g6oQpnp43C+ZkB55vUyeO5qMHWsWnbN9QzkN6z2qh1xr91DxlRTU8d9WXOcC9wKZFX
	 x+UbrpzhJg15Zqb8VVTAxN+TqrnFGnyI/ubTrXhBEFrPbUPij+z5y9DIJgphvI9TdWP7S
	 VlFteRY2oFE6AHpT3a94UNyxsUCooOBZte+vzyTr/iD2PJWHsfe872NiI4+EvQQr7Lfej
	 l22+GmDe4/SLtffIoPzzl3EUKE84lvo+asS4fW1nMUx6xvbOzn9KBYbJrFk0JUn0ICg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682A8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jMkc16RtMz5BNRf;
	Sun, 08 Nov 2026 15:11:29 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 6A87BPej021080;
	Sun, 8 Nov 2026 15:11:25 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 8 Nov 2026 15:11:25 +0800 (CST)
X-Zmail-TransId: 2af96af0209dce5-4e3cd
X-Mailer: Zmail v1.0
Message-ID: <20261108151125513PyebyF3QC3r_DTxS9ZMf6@zte.com.cn>
Date: Sun, 8 Nov 2026 15:11:25 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tharvey@gateworks.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBtZmQ6IGdhdGV3b3Jrcy1nc2M6IFByb3BhZ2F0ZSBJMkMgcmVhZCBlcnJvcnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A87BPej021080
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 08 Nov 2026 15:11:29 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF020A1.000/4jMkc16RtMz5BNRf

From: Shao Mingyin <shao.mingyin@zte.com.cn>

gsc_read() retries the I2C transfer but then stores "ret & 0xff" in *val
and returns 0 even when the transfer failed.  regmap_read() therefore
never reports an error: the FW_VER check in gsc_probe() and the two
GSC_FW_CRC checks added by the previous version are dead code, and on a
failed read the firmware revision is built from the low byte of the
negative errno.

Return the error from gsc_read() before touching *val, so regmap_read()
and its callers see the failure; the existing FW_VER check and the two
CRC checks then work as intended.

Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
This supersedes 5/5 of the RESEND series; 1/5-4/5 are unchanged.

v2:
  - report the failure of the I2C transfer from gsc_read() itself; without
    it the pre-existing FW_VER check and the two GSC_FW_CRC checks added by
    v1 are dead code
v1: https://lore.kernel.org/all/20261107162125044ldKkwYPQxZOTWg6IDe_LX@zte.com.cn/

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -62,7 +62,10 @@ int gsc_read(void *context, unsigned int reg, unsigned int *val)
 		if (ret != -EAGAIN && ret != -EIO)
 			break;
 	}
-	*val = ret & 0xff;
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
 
 	return 0;
 }
@@ -219,9 +222,11 @@ static int gsc_probe(struct i2c_client *client)
 		return -EIO;
 	gsc->fwver = reg;
 
-	regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
+	if (regmap_read(gsc->regmap, GSC_FW_CRC, &reg))
+		return -EIO;
 	gsc->fwcrc = reg;
-	regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
+	if (regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg))
+		return -EIO;
 	gsc->fwcrc |= reg << 8;
 
 	gsc->i2c_hwmon = devm_i2c_new_dummy_device(dev, client->adapter,
-- 
2.47.0
