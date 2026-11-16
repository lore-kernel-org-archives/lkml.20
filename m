Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870010;
	b=xPuJOPaFaygYmSZiB/jjjxPVJcFAu8ydUMpcNBQJ12EcZwFw0S534O1kgqqfgYgW0OtO
	 qGVEnHVZj5AYH2wN5/83r+mss7ZS/J2uBTXNZp6+q9F4ixS111rA6AErxErFmWuovmQbp
	 eFzyNYZLhcUgVGbA8S7+Ipx4qP1M7Snsfz0NNDUmjyq8ea5fj5xnE4CGZyRg2Fzvf4wzr
	 mrbYXml4XZ04V5eOlvI3hD/bL9r0/KDEnjjCGcZDy9LzmPIsAZfgv97zEn+3lgI6q7kbS
	 blfOi2919lFaKqIKCz+ckT+yoQkeIrUF7l/TAOVjpdtO4P5OaYq2v4xKU2no0/zSr2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870010;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qec2792BZT8xMgh2a+hcg7RSIyutDzwTcHaSiTYIrKU=;
	b=h4o5NThmHhCx9rBotz00dmZZu2AwemdiDyTeTVwskzHmnm6+/UHw7yjQsrmzXjP2T6Hw
	 8yW78k5Ifzl+N+JbSfe9QadNrf+gENLjjzckv8WUVRaTxuX10ojeiOEDLzd7Em2L2kAAM
	 HvBsJrAMgyAB6qwEDDsba45OQBlsJARdubCUHModKgDPwnoof/YTs+a+yUZU9O/XBwjWg
	 FMJQNwkrFSxmETZzMqUdLsJGIM6L+crbsqPsyQurh2u0vo8FlO2pDjrEjYevMT/wSn0BX
	 UOWjkaduSr7CwbnJC8ceKjBQXBubj395beSV42KzIn+VjqN0BqCwmtGYJuCTW5bkHlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9A606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE9A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b30cbfa628so32515137b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870009; x=1795474809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qec2792BZT8xMgh2a+hcg7RSIyutDzwTcHaSiTYIrKU=;
        b=hIB6Gm4h2Z0xynihxdgKNWKrB6aqgHc+m4otT+W3GfIJMBlB65zU2PNnnFwwSE/Xnc
         Ya0VG1VzcXobMGFX9xBBRyjyuRo/keumtE0YQcGPBkqUS/MOZv5tYnM/dQ69GvtzdVhy
         pAIWp4oTJf+Yt53l31MDLBfcUAEyCIv1SqGesTSdxoP3BBnAKSIBE0BWJTfFybbocFhu
         z7702VL0jWs1bSLlB66b/1CINcVkOiUqnu5XXHfYgGxoth1M8qS8bc1soia51AbSgD+N
         cPFkucijEWLqk5q4HKGU5hi4ulal8PoqLUI4OgDp3N4oiSQdBoPSsxvdZnVhGJrFTHqn
         BHCg==
X-Forwarded-Encrypted: i=1; AL+hErENYLGeffF4hkzeeBlygGgfRwqrsB8oHl++f+AbkKfc4kVq7aQxhyQJEDC5WQbZ65MDZHR2XziyiUduil8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88HzO9x0erUTDGwC7NrFEQCFD0/WzKbsEVhMikEbgiccnU0pgP
	BTlOsLmmJHJ4xvitWDsn4dfuvwUr7NNNToFm1A2cuCvcr1vEvBAbAQds
X-Gm-Gg: AZFdTZc4zvtuIIdiwlAGk3+JkYNU7GIvZTl9nf8FPLWFGcLGn0sdafGOMqjuFhBVIsn
	lj0j8D1G3oOoI/UOY9tg2SHAC3Fs7+vvs2dAUVbkAaJx41g6XxuovRHrE5AAPGSv4saq7mf0f34
	C80xAd6wXUR/PX5IyCz9NdogdNP/TVWKSxrvfh+PTpy/LXYlGHv6b/xNBj8ixi0aHKFH1ZRi19/
	VqsB3hsibk85waKXXffjG+dIAupnGEZw3u5Z/laz/mu6IdJ8qa5uEB1LTFBD1wiR1UvuDXczXvA
	x19Fu9yN8sLe+B9c84WZLGbjUzVoG2lWa+0BAXGpmvbDatC8UtN0Den2Qq4TmF258AnBDnWJIjh
	i4yvq/UNklrFkezVGSY8DXhHMW0UsHSCumdTD7mJRD3ENwXNo30Xhe109NVdSHZd7csR2vHkllC
	qrwwaDqsJRlWpItBl/6xt4Q372SxKwavidRigBZoy6dBdnxOEjrWDLzCxyvdO+gz1q1fgAXiMVk
	izlezn4dA3/P43bwoXYxTwaZ1x2AC8eqENtufUNCOdxhKM/XkVBn9KrF1P39okH8adjVe048g48
	Tb5hkfiOTb+Dp2vZCSQohIwZW+iCh67ADtGtwBMfoHgObgFt3QBOsearhiDap0Dt7LaAlrBxQSi
	JUXxL3Jd64TI5wfHoWBtEJmTnm+0r0jzC
X-Received: by 2002:a05:690c:e3e7:b0:8b1:867f:389e with SMTP id 00721157ae682-8b4aa0cf270mr66552587b3.6.1794870009077;
        Mon, 16 Nov 2026 15:00:09 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:08 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:50 -0500
Subject: [PATCH 1/5] iio: ABI: Move out_resistance_raw_available to
 sysfs-bus-iio
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
Message-Id: <20261116-iio-ad5246-v1-1-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The available raw values of a resistance output were documented only
for the mcp4531, without the channel index. ds1803, mcp4531, tpl0102
and x9250 all report them, and indexed channels name the attribute
out_resistanceY_raw_available. Document both forms with the other
generic resistance attributes and drop the driver-specific file.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 Documentation/ABI/testing/sysfs-bus-iio                       | 9 +++++++++
 Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531 | 8 --------
 MAINTAINERS                                                   | 1 -
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 5e987c502b13..28ce219caf81 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -2017,6 +2017,15 @@ Description:
 		Raw (unscaled no offset etc.) resistance reading.
 		Units after application of scale and offset are ohms.
 
+What:		/sys/bus/iio/devices/iio:deviceX/out_resistance_raw_available
+What:		/sys/bus/iio/devices/iio:deviceX/out_resistanceY_raw_available
+KernelVersion:	4.9
+Contact:	linux-iio@vger.kernel.org
+Description:
+		The range of available raw values, as the minimum value, the
+		step and the maximum value, all enclosed in square brackets.
+		Example: [0 1 256]
+
 What:		/sys/bus/iio/devices/iio:deviceX/in_coverageY_raw
 KernelVersion:	7.2
 Contact:	linux-iio@vger.kernel.org
diff --git a/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531 b/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
deleted file mode 100644
index 2a91fbe394fc..000000000000
--- a/Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
+++ /dev/null
@@ -1,8 +0,0 @@
-What:		/sys/bus/iio/devices/iio:deviceX/out_resistance_raw_available
-Date:		October 2016
-KernelVersion:	4.9
-Contact:	Peter Rosin <peda@axentia.se>
-Description:
-		The range of available values represented as the minimum value,
-		the step and the maximum value, all enclosed in square brackets.
-		Example: [0 1 256]
diff --git a/MAINTAINERS b/MAINTAINERS
index 02015eaec312..9cb91ee8a56d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16680,7 +16680,6 @@ MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@lysator.liu.se>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 

-- 
Git-155)

