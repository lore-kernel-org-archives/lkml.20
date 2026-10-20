Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533939;
	b=MJZGnu74I0LnM+xJqXu9EJjkBKM2ZVBilC2NZS1MddjE4H2EUQxQO5tPx8/1W4T2siGB
	 sPUsmGqEnDuxC0wpnJIy+s2vxkf8/z78gd7ZF4yRG5BHzcKEaYuMtSihmN15akiySweRz
	 4UMQ16whqTuCc92efe8/qvhTDkmb8bTP69w+3rGKRN7riSHY4jMcrK7lFV7ACTX7Lqagi
	 Yy5lp2YArwIxBYoRAqeyH1Q1Fad2efiVJr3PwiFgeCIk0tL6jBJk/M4R9cFEh+2sSQLV7
	 hODJkhE38whTGMGEZN+o+B/Wl60TP184hOYtjfN+5Yscy/+s2Yzq1jgcRtQQjEG5EgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=sw/sTVaVAh1ozVDxMtFee+X3lBeJjJHJtznriDn9lzkmBrwOsPfal6k0phxwPm7VRG5w
	 f5R2y5K9cy7dETaZD0IEfmjq4OAj2F3LmrpQ+wUe7CzE4iimQizpA2SmFQPj63E0TPmiM
	 6+clOS7TofvruRQYT4pevlhUhbbDQtd2TSbcm2uxhl/Wxs/JJmmSer2a7i15lRvS+spp6
	 Z0ilTcUxzZEXaKkKJ18jDUGAeZ/2Sl8xisEnKEQq17f2sALOGNtoWVVhZgaq+fJniUnHu
	 PYLdqMnSaAr8lIf5PYD2GG63n18ay8qRebihv+9usRrdFAZrtIXxNTNXlRjB8WNIKcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="AsV8CSY/";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D5C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D5C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=AsV8CSY/
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35f036b17easo113904eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533937; x=1793138737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=AsV8CSY/FdkRK3D9/1KNe7BgVcelwRhs1z0mHznTdxwQMr2iFbwwUB363Vf/p9W9KX
         8fS00qkgynfdEfGy6SOYp8MxhNrU7cn3ddfa74UpAzElWvKuf139ystaiXV3nCUylyA3
         8qqDxRQh0zGIhkVCWgO7Dddtrjjns1+8/StDLU3JgXwU2YSK3uCqkLdyYylhtJ6eUZga
         Dp/cgvsKpzWR0AoHd9+GAAQon9o1sSSedj8aGuCU24TQyOEB0JymXZ8kS+/eBQTYNNHZ
         AEd/ddl0aYNJzOcDn2Uf356RCVarHLYaN/HSVH5q6UkejoqdNucHypbK05mH9+E/lsbl
         czsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533937; x=1793138737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=gGNyTXiZYeJtpqEhfJeL3Bc82bWWBcDaaG933r9cqpqCJsWozOojtqBVf1AHCvl0pP
         2eplDlGx7B0G2bC80nMrxNp9iRjyuhqZE27XuwF5Izzu3pX/j2vFf+MQYP+JOgeUuCG2
         P3Ar2Xb5joQra4PXYWWNL8gyLAAVnPd8Fi33jnvBq7crLHaHM6JiVBtLDlSCmvlMm3Cm
         4ctNaOCqZt/T44xdzeQ6/M9ZB84NLAHp0eklyjkDyBK7DLKL/WKNNiMyM+votNhw8zO2
         SnCe5kKarNhpOYeBjF3Pg3gqpWUE6F2Nrut8xI1xTsQCh86oADIx436KkJ0TEaHKl+O7
         mMAw==
X-Forwarded-Encrypted: i=1; AKwUvBxNiqLCdWI6hvJcAOnQVcVjU82EzWXlVMy/xk/OQ5nZqlF/Ywdw6kcTl0FYQz0riaDNWfqz4x74OrMl+c8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvuj73PhDff3aefOezl32x1vWe79EsiFu9lj5Z3xrGcc8V69Tf
	wPntfOpB5fh/9LwJclUMNVxfqPMpSR9Q3v/OrjLZ9GW7/5cX87ALWGbreQZvof6/gpo=
X-Gm-Gg: AYBFou1rRDbkdrQnIlO2KgYFQGrQw8a07HRva02YVVjMXmNu6WnqAuR4swHPr9hb4vg
	SXE7umdAi9ypN6DnjSFQKJp6kLKHZJNzruW3J8782WEsQvbVs4ghJB0jRieDhwHPQS24LilOgLd
	DLwfwRhDmyltmG2iXPguVTgxdaKvRUF4wTjpnASakKLYp/CcBCoObbBv0yBGIPrR1xuLiRg4o4w
	5ShFIhJCeqtFLUcwkZ6Wsd8Kr7kQHjvejB7zRBoLKN1bN9TTbx7aHgok8r0i7tRhWZi9DXwq//h
	G384LtWmBJV0xoSBZs6Bf7e7KYazn2al6LJcs2qdmODr0RLJvY/4L4CRCM4QKmBkmmkORa+uLPC
	5F6DNUY3OnEVtEe67Y/Qea1jMXpfStATbEo/OTU5vU2LGa+WF1vQWy7sQslv0hIsqjDb8B7NRj9
	vGJrqobeDgJHnitgjwnYAyHO4Oq9ILgYjj7wv6u+U/1Zi1v9ZI91BweBXmLa+YcPNfF0WMbS2hr
	yWFgcdDGqMm
X-Received: by 2002:a05:7300:f3c7:b0:366:3257:771c with SMTP id 5a478bee46e88-3674eb33844mr720723eec.16.1792533937462;
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:30 -0700
Subject: [PATCH v3 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-2-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=rZJt5k4qDB1MMTkhJjfIYX2LMM4Ew4G5PDKXZLCBM8NiAQFJTDWyj8o51aUe5b5PQWBLGGThR
 +D+asvvMwBdCTWgGnz439D/A/lN3CURvvsvaFuTkffY1vlFLkAIh0Yu
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
interface. They need only a reg property, so document them as trivial
devices.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..996e1eab52bb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,10 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
+            # TDK FS1525 25A uPOL regulator with PMBus
+          - tdk,fs1525
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

