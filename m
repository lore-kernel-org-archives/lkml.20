Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637234;
	b=wXac//BeeSb/FqpfUz0W+X/TJF+WYBrm34UJnMMi7Ul5QPnokgUNkpmXScJewN6NO+HN
	 I3ruRWE3kv6D9Is+MNJBgZW3/ABIhlS5RPjT1kWZpJfwwGliTTWoRghXeswNknVssZJgZ
	 5JhFfNO9BNWKktg8nYahsj3eRGid1SVf3iwELmKzjpnBu0aPXIws8YnkPueXQzjwW7NdK
	 0PduvIhTrheu82IVq+SC3j+yg91mO0/ZN+Es4ewe7uT+yzUfg2E9zA+/+GdJiQg3HSapo
	 +OFzogcZRdD2gEiQeSboyNAQKweWjnrODRcpG6sFFwQoua38w89j2eagWQR8hEVaIAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qOSRe30ygZ0V1oNf2aDJiBMrnpAsY8BZGQBSNSsgkD4=;
	b=pTj8daszEL21hxmVV0drQCppDKCSVNKKyBhpS7Y9BZHsCHzbEGNZ6NdJ14905owb4N+p
	 7dw4lFwhx8wJpAT/3N3pqiSrRyjbcHdSPDlGbNbFTURwfhCDrQ8DegchJy8JAkeTaiOWh
	 22IVICa0JgmR+4x5y3/B/77o4Ds1QHHyqbqRR69mebePqZSgihI7Qy++1ldVDAWOKpRAF
	 9aJwf9pz17dY3n9jihLACLOkCVeLqhCsOroc3ug8Q7CuCqwQuqe/Hb08zTmOaUEfjht/4
	 xyWibaeG3LyQOh9Su1x4AIkIM0bmtcZ4+7Ih/59pqClDaQpTGsv7nJm9Tj6y8+hxSUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpLywTYO;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532A3606A88E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 532A3606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BpLywTYO
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37628596783so3008699eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637233; x=1795242033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOSRe30ygZ0V1oNf2aDJiBMrnpAsY8BZGQBSNSsgkD4=;
        b=BpLywTYOxSIEVFNoFGesMORxXz8oMXMAjedHZ08uH/Wjr/IjyS90VYJCHgYwvreMY5
         gKN58zWYOGr0AGvsIb9VPFqWDKLqJYgwxkM7Dzxd7GQRM7J6Z/UUe6cFcFWg7OHuebvY
         BqVmDANihYwcjdwBNSejSBMPSFIeFLlVG7KxEYhmjyp6upTvT2Mp6EvHLHH1WIEAhMxV
         asrcfcLxAf7TEazqd1M5cn9XE5v+/EpjbVJVLdLQM95OFKBWfgXo/3ToCqYUtiBOJn0W
         V2qDJ2+SvmWySuypfZrQphP0rkrS8nivV7+ZCug7uZPUmiKQwrJD/xKU8/xXZ1ZTtqQy
         /GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637233; x=1795242033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qOSRe30ygZ0V1oNf2aDJiBMrnpAsY8BZGQBSNSsgkD4=;
        b=oJoNbCg+DCmdAD2QpHr/OSgiaDKiCIXAMTnnE602VKNMRlPQtxcxlaDju43IIaZz1X
         HUNF230vMt8GLMZ0zyU0VwsmOFJPomW41jlFDIhHgnXSuqKYBWAuoFOgSiQYXR7alRTs
         pv0r3P091Fu4IOE9O2UJjzbuKGz/LiEhRAi2FODtZPv5VjSSKMrOm/uksNzbNZ1wzMmv
         XUF7bWW2iwY3ukBV6Tgh9qUlbzVI2m2CmqQIhgy0FMf6HeQscQK+sWGKeTg0SosKBeN5
         ql0UqtHqaX+Y482/UQtbqaRtoTvKs1a54eJVlk9bcVyTuZ6qG5rR8ghx/ovsJ7gd+VqH
         j31A==
X-Forwarded-Encrypted: i=1; AL+hErFngLJCPIdfuZvpy2A3yYf0T0ny7byRyOep5N/sXblZUI/WdoCkPev1k0eYJ7VBs3jIDa7G+FvVuvIFJwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zN1+Vwtnkjpcm8FYtvfCIpAnK3aPdlpOWzcpXbr9j0GjSDj8G
	UtvYgIpTHuNwmXpFw8puXPtsySdmxljQ8j0gtnkbKCOtipeaxYEVh7aO
X-Gm-Gg: AYBFou1Ns3k0zxgZDMHTa/GXifWNdHnq9M9ordw9y/ikjisAfrRoIl64s1ZnazIG+zd
	LRHIBRfnsgY0hXnKVza7uDBHdm56tsTgTMWDPn9bCZrHqi7NeITowkJ1S9h8KzLJbnq+BJwCt5b
	6oluDUXGyJauYHmWNbVXCMJTILhwghLUuB3TBoMgMvCUDwZ4LmiE9KGupiegInt++bXk82CHnwM
	ZhqzF0au4EyakZggDtP+w+AoiBI3djomJdqcvE2/KqStE2ngexOjGh5lJHn8yAkBtk6bzWilQHj
	9eyaVCup4lvoBlxe6pcKBoj19INnpDX+Yh4vh1uORGdyiJI77nVCQxQtjrRPq9isl1tYXXu0zsS
	p1+x9M3n8SieXEp4i/bXgdRa5l8nEQm98nE795mvlB7TU/RNtKXz99I0qRRJ3PbNvkXhXVB57C4
	u9AkzY0njB84ie3yrSFMriEqqP1SHztR/Ky/DbgaUzWpWSIOD8McOjoTdib7/1jIg0O6VgYrOow
	2RxrzDLsO/4qKLdQm5PS9L+Ts8j0SUmK2J/3HStdT+qPeD9oLgWd9Q8rhsdnh8QbJVRHgx0e0qH
	KzxER+auZB/lgecfGyzdcFvD+VGA/dvJS7mal+VUEKIE0Zgi02U7XZdn7OH2u+y+o4mlHZwZDkP
	YmVuceEoL4vcB0aahWgPwn84zi1Wgq82BuDzEpoaVYCuli31JeDMbblhxfg/MQIywQWtB3Mcygy
	N0/w==
X-Received: by 2002:a05:701b:4250:20b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b50312e4e7mr4675395c88.34.1794637233389;
        Fri, 13 Nov 2026 22:20:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm13305738c88.14.2026.11.13.22.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:20:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (dell-smm) Reject a fan_max that the BIOS cannot take
Date: Fri, 13 Nov 2026 22:20:23 -0800
Message-ID: <6d3b86acf6713e9286e60ecf788582e840946238.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fan_max module parameter is used without any range check, unlike
fan_mult. dell_smm_init_hwmon() allocates the nominal speed table with

	devm_kmalloc_array(dev, data->i8k_fan_max + 1, ...)

and fan_max=4294967295 wraps the count to 0. devm_kmalloc() then
returns ZERO_SIZE_PTR, which the first successful nominal speed call
writes through.

Values above 255 are also meaningless: the fan state is passed to the
BIOS as fan | (speed << 8), so the higher bits end up in other parts of
the request. Large values that do not wrap still cost one SMM call per
state and fan while probing.

Fail probing if the maximum fan state does not fit in a byte, like the
existing check for fan_mult.

Fixes: 81474fc2fae9 ("i8k: Add support for configurable maximum fan speed value")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index e8b4e8a29e8b..24a9172b7fed 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1249,6 +1249,12 @@ static int dell_smm_init_data(struct device *dev, const struct dell_smm_ops *ops
 		return -EINVAL;
 	}
 	data->i8k_fan_max = fan_max ? : I8K_FAN_HIGH;
+	/* The BIOS takes the fan state in a single byte */
+	if (data->i8k_fan_max > U8_MAX) {
+		dev_err(dev, "maximum fan state %u is too large (max %u)\n",
+			data->i8k_fan_max, U8_MAX);
+		return -EINVAL;
+	}
 	data->i8k_pwm_mult = DIV_ROUND_UP(255, data->i8k_fan_max);
 
 	return 0;
-- 
2.56.0

