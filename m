Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222852;
	b=G4/Ld7VABpVN96RccbvQfT8N89doM2os2BVnLtH6jPiD2C7o0GET0FV2OdOZ7H3JNIFY
	 asUm6FtwKhum1LRh0TuowraEanzUFHfcpXXKjhF0PYFnJJ8cF5lIuo9tTqQBzCT7AZfAL
	 +DP5XCv+QPU2xY4YpNW7UY48222x70CgmKUblI0vMgbLmxMv8Au+TAPmIb1xy7Lb+tJYS
	 I54N63Rvqp/t/tWP0FzedEo6zXlr/eRyYCmSDFvLdzybi5h8KImh1+aZfdDqMTzidQ6Rm
	 Rd6gOuqfKOgzXhiw6hIghcxb63P0dfK7DlaVBGf19/s1Nl69fa6N3MvBG3Ib19NHfbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=tTNfa5hmF9EXcEu0Xs0yOZZwkvidyxQ14heDcTr0gYA=;
	b=stzkgCwfIboOArb64LkPsZgi1OvksrKMWB5oqzqRMb8p9uR8wFViYxGf6l2vJ4rP/g2M
	 FZN306ul2i7qpUHkoQgD8BxHCwkbkLLBlPlMSkg2nfxbQaggpZD2u6aaeRzmxqkY1j8HR
	 yMsgqtNNM/+4BZO/3f/8JL5HjlUCnQItcoumFnRWiwfXwxCq21l5zKf6e5u4sKDunbxa0
	 XnybUd9bwcN2+EACfj1EKl04Wkh9Q9XRpf5rua7+zDJZoNKzcMWHhalLfnKDau0WgG5Y+
	 dn9RhjRREILzfvbTXxvYJJeOG9iULT6Jrv4kcArR4NPY/phw0dasXbSqALg8tLOT3AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=AhVmPB2j;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023C606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A023C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=AhVmPB2j
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jNRxX4M8kz8Xrrb;
	Mon, 09 Nov 2026 19:14:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794222848;
	bh=dNeGC/NTxCDserep3Qm6Hbpv0AIrhmL5t1vOqkqODxE=;
	h=Date:From:To:Cc:Subject;
	b=AhVmPB2j+fjC0zwxOLlYx9gpZWepIm1PfA/wfKH7EAgCND/AcoXmAyRjWHwmH/eBb
	 NL+7tQw0jf+cbBqH3vUyq1gCeA21MmnC/FylwflLveLrSGJMmP3th27tcO1lvpbglw
	 L65Csi4e6F4PBfI62A7jhdRbSK19gclg0n+IyCHsT4F0dMKcCIwJ9ESMpaDtSSstwo
	 pjvoz1qCT/3eE9xQW4+97eW1kSbQX1rQEZupjOsuQ/P5XPed4yeb4z7JX+u+qYlfNZ
	 5+cRcTLVNmSEScBC11UvBkCwvVgnfSqlwQKdtjU3UVpB47gfmGV/GCVdSEm3uIN5BB
	 rHC/ZOdhFc5ew==
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6A9BDxgF037747;
	Mon, 9 Nov 2026 19:14:00 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 9 Nov 2026 19:14:02 +0800 (CST)
X-Zmail-TransId: 2afc6af1aafa7e4-3c6e5
X-Mailer: Zmail v1.0
Message-ID: <202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn>
Date: Mon, 9 Nov 2026 19:14:02 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIHYzXSBtZmQ6IGdhdGV3b3Jrcy1nc2M6IFByb3BhZ2F0ZSBJMkMgcmVhZCBlcnJvcnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A9BDxgF037747
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 09 Nov 2026 19:14:08 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF1AB00.002/4jNRxX4M8kz8Xrrb

From: Shao Mingyin <shao.mingyin@zte.com.cn>

gsc_read() retries the I2C transfer but then stores "ret & 0xff" in *val
and returns 0 even when the transfer failed.  regmap_read() therefore
never reports an error, so the FW_VER check in gsc_probe() and the two
GSC_FW_CRC checks that this patch adds are dead code, and on a failed
read the firmware revision is built from the low byte of the negative
errno.

Return the error from gsc_read() before touching *val, so regmap_read()
and its callers see the failure; the FW_VER check and the two CRC checks
then work as intended.

Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
This supersedes 5/5 of the RESEND series; 1/5-4/5 are unchanged.

v3:
  - reword the commit message: the two GSC_FW_CRC checks are added by this
    patch, so say that instead of referring to "the previous version"; the
    second paragraph no longer calls them pre-existing.  No code change
v2: https://lore.kernel.org/all/20261108151125513PyebyF3QC3r_DTxS9ZMf6@zte.com.cn/
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
