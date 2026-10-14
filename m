Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F266566C59
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999264; cv=none; b=rZzJVh8dz4ItGe5pAg9T4acpF3WAI0wz73MNwOAUBj0ax3B22OfqWtwsSUH1hR9Uo2ilT6i4erxARs4nsRHIxwEQrc+a9l6JWGGYWXsXxwONXC4RBN45YeMaSHk3ZJGlRuHo8Grd3ZqR+9VUBR8FOa1+x9spxa3c5JcEburOS+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999264; c=relaxed/simple;
	bh=gi41Zz3zDE0TLM6PlJVKgZhPae/Sjlrnf+I/moH9ljs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPvZJFBGGGUCJo1kRlTsUxEdNQgRYowwaPO9ZiaCQclJVcEYLnNxr1lFk4+cEfG/0T35eBwFxXynOiOtWToHhsdTN1hC56wY3r+SsGPSegYo7kdZ2kgMqV5IxwdPRNA32A14Xxc1iL5lj+9Mbx1yfo16Fp+WlkSLrM2UkRSW9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj6HBSW2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj6HBSW2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso776807266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999259; x=1792604059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6DNgDZcPLM+u9NKiSG5ngG40YZRJno2c69YEg3krWw=;
        b=Uj6HBSW2Yyftmh4qdpBHFjmAyJ+WGEvZ9t0oN6iG0t119cyKaxhkRORyCe88Kc3WFS
         X36oNNJpqEN/jPjdinn6E1MoUvdLX1l2Mxmd4Pil4F7kR3JaDOhhjz9r3qMe8t3Cpu31
         dRfGkkCwARuzmqwRxCrWSIKWBz42OkgSc+tgVl6LnpSvGsO6JQuCpi1G6EY4zffIoT6V
         gcVlHk8KcmlY8sBjblmMo/2RHk5d36x9W3ghrgn606sztXpnWMTqYKoJRv6uRX3YAcJ5
         61QdmShA9x7NxksyRurbmcffYjaz2S9ZWmtkanJgDMt1tSEmxIwcWgUbEsrW+9ziNyTY
         0ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999259; x=1792604059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l6DNgDZcPLM+u9NKiSG5ngG40YZRJno2c69YEg3krWw=;
        b=m9nXkuQ5qKfiJvLc+T1I/QtR0IXSItIFhgKuUjYxcLZWOH/0Bw93haOygS+K9/Bxbo
         7nZqwEVLFllQEIi+zR+LDNn/cKzpDkVkP3SgY5VCojyr+nKaj1s7ix7KPPa8e+FMFM2b
         gfMliXm8PKuDtIPyO9NrM1C7ZGhUtmL/kfpFRnaopaOzVIYzJDkDH+YerZc6TOvZNdJS
         EADvwwNWBdhstD57+1b+hkKrXnI61kftQjsNxEy/w+mqLibIbpB7W4FVlKdOb0OsDdZW
         Lrcjm/+W2mDzZp6bcheWJ++yppavqhm2qs95t7kwPdnhuwa9uQQJh7Sm/8k3xRgXPA/W
         BtOg==
X-Forwarded-Encrypted: i=1; AKwUvBxn75hR1fVRQvgbaIsO5Gh3Gj0vvkzV+YurvSsQqPCxSFNgFSVa1lmvA3Np6DypXy6e7RmMIcsCXGWfE6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbPBaL4Vevq+4+yA1TLo24DIQZkgdtkxzQYpusEdLnP3lnGSz5
	K6/hWJIf96DsW+l5WYu+LgAc5BRpuHSynE1xq8pefj8yE7bz7rzDaTQ0
X-Gm-Gg: AYBFou3n+lpaqECxQt94p/OKXCE+2oSeXMKjXKKridwyBpBczXnle8jFA7KtkT2S3GB
	hoGFIdouTDJ9ACD5QlGhRgTXcuM9ul0id4l4cwdRErf57Ky0dm/YO2SQU+KW5ZsMvIspmlenqmd
	W/guS4UG9fzZGBN3ZZTgMGnm/WtSnUmaMgKsXm0EXIIsAmZb49rxXBPTkjAP6mxHTF6XRxXF85M
	eXCgbXyvc+7/6vNW5jje9KLQuEvnPiZa3UXkz9Wzn5MzHs7AqUvvYGYzMqNPucmgBK+l9bC7Gww
	Pop71uQUPO3wSuY3tsWb4BRVyuaR4ALmO6ASQ9aKWLL5dxlrtRoxFxel/isSmgbqXnGCF89/Wlq
	ko1diwPb9NHOP+QJWpVh6U9vrqjoH/JDopCItHMtDRykqWQGowiYCmqNFTAtRHV4/VccnOrUjrh
	GJV/6vvQoPTA0pNwL0hodEJ5dUj1dg3WwBcdIFVPHFxlZ44sw+HtQ5im+1g0savbvYTnh5ei0H0
	uuvDRcZFxTMAG9yu/fzXxmZHCQ=
X-Received: by 2002:a17:906:1011:10b0:c34:c5e8:1dd2 with SMTP id a640c23a62f3a-c34c5e82199mr623673566b.24.1791999258387;
        Wed, 14 Oct 2026 10:34:18 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:17 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:02 +0200
Subject: [PATCH v3 03/11] hwmon: chipcap2: fix be16 handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-3-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=2005;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=gi41Zz3zDE0TLM6PlJVKgZhPae/Sjlrnf+I/moH9ljs=;
 b=Pa7vuoPzoVXhpbxszG5LXuyA4iAWV9CbQAGUcd5kxNa6Zkabhl59h+H8nVlhIEIGBEQiZ4LrG
 8fQNjMe0G92AZc/aCIeKhp9IkOd0+YwgztKUeg24ZmRN8OqURjLP28a
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

The driver currently only works correctly on little-endian
architectures when writing 16-bit register values.

Use i2c_smbus_write_word_swapped() for writes and get_unaligned_be16()
for reads to correctly handle the ChipCap 2's big-endian data format
on all architectures.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 8102b6851d3d..aec4adf98658 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -21,6 +21,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/property.h>
@@ -260,8 +261,7 @@ static int cc2_write_reg(struct cc2_data *data, u8 reg, u16 val)
 	if (ret < 0)
 		goto disable;
 
-	cpu_to_be16s(&val);
-	ret = i2c_smbus_write_word_data(data->client, reg, val);
+	ret = i2c_smbus_write_word_swapped(data->client, reg, val);
 	if (ret < 0)
 		goto disable;
 
@@ -311,7 +311,7 @@ static int cc2_read_reg(struct cc2_data *data, u8 reg, u16 *val)
 	if (ret != CC2_EEPROM_DATA_LEN)
 		return ret < 0 ? ret : -EIO;
 
-	*val = be16_to_cpup((__be16 *)&buf[1]);
+	*val = get_unaligned_be16(&buf[1]);
 
 	return cc2_read_command_status(data->client);
 }
@@ -351,10 +351,10 @@ static int cc2_data_fetch(struct i2c_client *client,
 
 	switch (type) {
 	case hwmon_humidity:
-		*val = cc2_rh_convert(be16_to_cpup((__be16 *)&data[0]));
+		*val = cc2_rh_convert(get_unaligned_be16(&data[0]));
 		break;
 	case hwmon_temp:
-		*val = cc2_temp_convert(be16_to_cpup((__be16 *)&data[2]));
+		*val = cc2_temp_convert(get_unaligned_be16(&data[2]));
 		break;
 	default:
 		return -EINVAL;

-- 
2.43.0

