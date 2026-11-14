Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678001;
	b=1qenalljA05OiK1hr2VkSvtmhGJjY2Wok+QVqQarTO+fYiduFM3KAfo+rJpI4OHY3sH9
	 YXem8HoSSmjpQLeZ0JXzm3P48Bw/LnJjFrvo1K79y/5LqUBvt2fr+gW0Rb+efszhQiNLT
	 fwvBPfXip51YmnlSZxrCehPIct9qLuaENLV5E1Nf6MFDu38hIKmEeXwaHBnHx/3VfrZLq
	 1IFoPIKJZiMAPJzjN20IRbVIeRuqd39DKuEqMZM6OLyKuBnPrK51gsP17HIylvc4JX+cC
	 4dq1dlOmxcUB52cdwEGCkKrqRTGrVB/8EwUr5egsT/h6qDUM1m2bSy7SjwvNlnOUwjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
	b=caRQrDo5X/JMmBGtS8air8ueO12yhMwYV7b4ZFMcnGoGdPxw+cNfHqn5CgQvMAM6qOWA
	 tP5gnXKA4WdzI9hEExjfxT+ptCsZEgFD24f3opYXero+g8/rnLQ2zzHztfnPAzvSCnZpE
	 ZIfU+x72iK96tjKOzQSVdCByhv193pBOdNQ0+V1zEKyXvXR4+C0JbQWNI41o077ktzyyn
	 1sb87qjBeLA1Nk4Q1/mLRnCPyTvsSJrGHLNSPL1yotRgutIR8zTxIKMZKEqtrsyZFEi26
	 /ptNqOVH0+lNlClImlkopIttTx9X//M+ngWshAOxNnnM2Sh8Zo9hQ4tYh87d72u7dOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Js8QzN;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF1606A8AA
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FF1606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Js8QzN
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67dabd38cdfso38590d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677999; x=1795282799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
        b=C7Js8QzNBNhT8bsatWEGhvlzBN6jeTSYgOsPLNr/9v4GbZ1GRn/qzyBEydnjYdBhss
         eUhS/vNq7zC0HatHggHMpI9lUnsudaf9btf3EaEBBP/sFi9BgL324g0N/Q4mknXas4sq
         Dt2zqw+CC7wF4ypOWxOFoxPjnDf7v06nhVgSiWntOD9v7myBlXZetXEHJ1s9Nd1jgZVh
         HRv0W4OcDwg3faMYXRlMU/mHAR53I3kuUNlRowtOIRZ/PbfDrwDUPFItmQXqJ49cEZN7
         2IeHezGihUM2chlihjLlEA6AgKTM+x2Du94fVGjHejoHfS9dNJDNKb9gp/1/jX8s7eSq
         uz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678000; x=1795282800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
        b=WZ+WUTs9yIgGw830rCs8pY9qlxcczNo6D86WvgWD6QVghWCgNnnclrl8XJlouql3zU
         E4f1TK1dmJkHb+4dWrEj8P+68mXHP6bn1aUlDdxFHq//+KhJ404/lUCWLbhe+Bv6H89C
         U30kX7AzNX09cgDjHZSGRutV2Y48iiFqhGXo1bDvN0fNMbZYd+LvhaIksRAG0UU8PilH
         Xj6voC+fZDDeM6/AGF7xBB4G6ze0BQm7e8Ew3q0AvXrT1rUR59X4valcWaZNDrwU9qRL
         NxMN1D0CIuMTOYZf075SoH4R+5ASMQerMM3iH592bwMltCAvQjOW47mdnt17BWJhpe8A
         f37w==
X-Forwarded-Encrypted: i=1; AL+hErE83QGWE0zHTerjA2S2a4k4GHo1wIzWu7ATWbdPUJmHJtGOgXrqqPSSkpmGy6q+VgigOhNxvfc8sTZPe0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JHaTjQQ3+8DSu+Z+xMqJq/hOc9Y6G3/rOyUToZ4ac9lRNdS8Z
	kZijbPZMvVKnS6ie8Hz6b33WkAK2saEE1Su6POIr86waBDvFpT/UtT+aVbzAjQgbg3U=
X-Gm-Gg: AYBFou24X8y8jyihrGjmHEVvp2lcb+xf03ZyMh4Y6TqlJlUv9zvj8MzE2J7Bhp5nT9U
	F62jUvfOfJzRDybg/jwqPAyWcd18nC9bReDFtxrBn7I+7ljRcexXdo+Tr27ZqxyscCL4BHn/y5p
	tgvv9xCX9Y031Ul4mFBHXzJ9Kqn9n7vIIRRY9S7R38DRlI2qzpBW73gKcTdSdVa1OVxUCas27r3
	/Vcx0fvgjmrVF0VuRxBbfc7WrsPTRA/GC1w4oAggFz1MTpPRCo6umzcLbIeAXXxowvyJoVyNWTX
	P9jcLybVWVXImVo5etng6GTEy0Gx454EfdqkqOukjAzf7A1XtWEQi4n95WjCZ7HVaJSt2pN66VM
	cQyyUwp9MS+witfXIjWsbR7pT/ug8w+Xhfxg0EUIBV5cJIHM4ykdMrkR5yzWgkaaoHKNgmHDqYc
	o63XjAV2ZP9nHAp8GZkWr5y2a3quqnOAYeHhsOPfA/euJ/qTXnJg6xC/j9Ad8mrT/dq5N9SLQC3
	5keAvrUdT7y8NO5bGRgyIlww7HVMRSc69QN4x195BgEQx7h59H9FrL/DWJlZgvzcKFlCmkeQ7zR
	bzcr0DhwmZnDPOJ9AG7utSOovaIpJ0gSET4RDJelx6BDX38wUu/YTBBzIV4tBB7a3d/Pnc5/hqt
	sCL/jvtABJdvRJ9OUYgTKSd2S/RiD8OAN7k5z7WD8kmhICFUtz4UcHfJ5lhqCZQ==
X-Received: by 2002:a05:690e:b83:b0:67c:1fc:2a49 with SMTP id 956f58d0204a3-67d970207c9mr2180388d50.54.1794677998636;
        Sat, 14 Nov 2026 09:39:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a55ab71sm5322721d50.4.2026.11.14.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:50 -0500
Subject: [PATCH 4/7] alpha: marvel: register a platform device for the
 environmental sensors
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
Message-Id: <20261114-marvel-env-v1-4-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=mVh4JvfcK0k3ESBDJMdG/SRPetVbGyQ1JJmKBQZfeiU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHm8bJGPx8k1Qg5dEu2+fbeTjyY5LHjjENeTlfdPg
 mE3u3NUx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFxjys3IsOjQh333tt
 0W+8x1PjbuR/OyiMigNWFFrC8Et9yt5NC9eY/hDx/PoUdFf0/1N257rHlpu1WB+6S17qxr9xxom
 J3AJzRZmAkA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index bd918028b410..d2e1e45cdf1e 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1142,3 +1143,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

