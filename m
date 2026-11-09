Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221388;
	b=12HrVOSwacIAikME0EMm372jDi0+YzisofLaF3iJ37A4RsCLQ+wccSvbGcTB66neKgrd
	 9mm4x/+iqfSXKjvygW/vJKCXAnhzfLk8fJfTHzYmw2kIVLhpUHhz0fbaHYwOghaf9AUPN
	 wJmsgYRMTprS2eO0qmFNT0RGxgb4mc5VNvdXsMQSZSc6Ybj+YYCUm02mOAkjoC2i65ut9
	 1/FObeywxyBPnJsQnBfO2WgTXI8qj/K3eS2bbYBCM8XFcFzgiCxRwO6KMPWaaNfTyiSrH
	 /wi5nqitQeB0jCQpiREMlT1E6uOYOlbR2nZT3l1h05D9UlVEeZwloUVdmHY5MuIAgYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
	b=TKTQ09GnXgKbcLth8C+xcJ9ycQcxVHIP+HklJBKZiB7x72N4cePoIhDbdPZOvcEGxX7A
	 Gm6uCY7W6j0U5u/HHnzbkxs8YvCWtDUg7G8aOOjwbzDQqEXCQV3LAv9RJCPDosoMzUUM9
	 5fQs4e9wq8kqhkDaqFCBFxAuNzVyydYQT+YhbEcASs3mGwf96BDUwzwzHZkVm7X8v2OG3
	 cB3S+aBdUSK1OKkp7xdn0Ysn0JRNXkj7dnukxissD6Zl8Kq1AOdK4hFo/jhaob9HsTmjt
	 QkWs0G+5HuTh7/Y2ZRDVOn0GevCzuMp2cGtFsU6iuOQHNaGIFif8O4NIumbGRPW/q/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF891606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF891606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9ae391a05so3714865ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221387; x=1794826187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=d3TITIqYEQy2nVPw2nwc3LQqZM4/kzPbuGM44hHPAGvIZFeNP1PUYtBhrYtiGZk2aD
         KAvRce1tF3JXHWqC9dHn7JRr6A4nfBgVAcIEZmrrEtB8JwfNzjNWCETv+AGtA2kJnlS+
         BV+1CPLQwcBl8vg7XDgD3/3aFJlaX892W9xWCtK8oDnivRGcOhOW8yvROkjqjdMITkgH
         BKqq5rDsiEuMwhq8/1EzAjSco3LUB2Nbf+dPtpxSTojqXN2BDmSQRyD8KXML4eOo62lM
         rHGW5+ZO5c3XG37HoOIIHZVD4kpUO8Bfjl9x8UEHpP+lXnTyKnggpXRmmshuqoa/54Cp
         rGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221387; x=1794826187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=ZwDO5VX6FBZpv02IPNISMyqHq4oNDs9cAuruIpM39nSCeIbLYqoWsxi7oECsdXNtFo
         4ZDyLtKFLu1SvvGXGMfMjgp5v4BYSQhLIHWaGESD7YFCiXG7pjrgUmSKlMTv2JIGBuAn
         njpt7XqkjSMgFaIXM70j1jtFuv5FOvR1hEf0lawlLfAqtUGMYLS0IBm84py5xDhPxfnP
         n0KZtqFSLj3DcoDPhu8NK8QnNurEuDk+4xi0GFrw9GgPQL5PV5hYMYnsTSfvYGjLKdfd
         mBKCAbHjnZwj7XEv3IfvtWVEO5GAe6Wu5J5KVN9Ob0Aaif4+0PxqqAf25Ed1U0/ZL4l4
         oZSg==
X-Forwarded-Encrypted: i=1; AL+hErEkuCPbm9lX0gZsP3WdWlcCM9LMxeddvVKde1SzvKj9mNxqh7xv4tT7AIzoOX//IXtyQpmCRLXCjPS9Aag=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+9dJpMvVHRtmBWSI8UNofBgWE6IPDJHb9F+XArcqjpIe64Vsz
	KFmiP8/CFDLsP4BpFL9f8j1SH+jKWivDHc9+d39wusz8sv9FJjjnkHKo
X-Gm-Gg: AYBFou0foaqcOUjNV9ulPXaHhgfNPCk50+Lv+S9dea0xfuqa7W/wE4K4jOWr95oekyh
	FgsivzgZt+LqzJdYQ6E2I1X3k/by9qZ20Z9DOFwwCEV/ExjBHhQDR0l0AwYqcGrrlShZysPh2rO
	Mx1volwm/wYhGqYX4MFaFVHLwbgVK3l0RtCL1cRVAhl3AlKlW/mgdylG5Jn+/z1WQctYjmKE/c6
	YoFgvLAWjVOJL3x94kaKE199IA8NkmN2r4P6COt84Zjw14EDhWJ546GLQ9ItQHKWsp7CvBEOp1m
	0DvSa4JFVgYF/Cmc+YV4UaegTDzWdrD8XJE5Aw02+gM1yGqYN4P8HoHSmy7R6XRVgY4XAJU4BdX
	3BLLTAahDXKRL2QKK/css32WPL47ZkxwY57+6eo4iUvPd1VZHFe88+7yi6IsqYqtMoDVpzp7toQ
	KmOArGRm15VhTm5YwnqJzgh3SDMWUMd1eZy22QiS/CGmzmzhbHWN2HQXa5QyrNjIkHfDupd4XIS
	j+j+xOfQtcyxBNYiObGpbDhcX0EiiXYjCj7IqlgOurAp0PJjNza1NvJCY8vaJbofT4eIb0b797T
	oPZKPha+J41yuOtq11LP6DYBSCWvqMKo/rugTb/N52NzSUR6iU42ypvRFZcuk/trSr2KNM4mh35
	xHEEH2RSworfPqIBPpfAvVlx2nTQoT0QWez0CdR+wOxw+Ibd0i3rLmevPvcCW9/gUIb8=
X-Received: by 2002:a17:903:2304:b0:2e4:cc75:2728 with SMTP id d9443c01a7336-2ed837a7559mr29304325ad.36.1794221386941;
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
Date: Mon,  9 Nov 2026 16:19:13 +0530
Message-ID: <20261109104914.1534-2-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261109104914.1534-1-theflyingrahul@gmail.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
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

The HP OmniBook 5 16 (Snapdragon X2) has an embedded controller on I2C
at address 0x76. It runs the fan and the keyboard backlight and reports
the fan speed and its thermistor temperatures.

Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
new file mode 100644
index 0000000000..be4c845067
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HP OmniBook 5 16 Embedded Controller
+
+maintainers:
+  - Rahul Pon <theflyingrahul@gmail.com>
+
+description:
+  The embedded controller of the HP OmniBook 5 16 (Snapdragon X2), on an
+  I2C bus. It runs the fan and the keyboard backlight and reports the fan
+  speed and its thermistor temperatures. Its four thermistors can serve
+  as thermal sensors, indexed 0 to 3.
+
+properties:
+  compatible:
+    const: hp,omnibook-5-16-bf1xxx-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "hp,omnibook-5-16-bf1xxx-ec";
+            reg = <0x76>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

