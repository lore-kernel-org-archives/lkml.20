Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284667;
	b=PALXr0nPGnKt9JKK5xT3FRNii9hmh69e08wihxl9N3NMiu81NtGpbkF3tyapJDnFGM9f
	 ZaGdrpSZ52lNVrU1iIpq+zjVFZpJ5qzS3vEpl2p4vWzrNRYtuXpClkRiI8WJWFHAfjB+m
	 sanQgoMrxQHC4tGWaINvvCIEOJjM11onovJeNxXwvIm2JeombJnCvuRdajHT0vvY9VQQi
	 WuHTaupJyHpOUO93dGWRA51Ace/ah6SUBxYV0DqJrnF4kpH5n7+2NJpyIMn5CCMK/oovF
	 E5CUHz3szry2Utobsuv3vpCy39YCMC+CnwuOcxrvCoJZ8OZvzdbLKGMpe+lX6Q9Km7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
	b=focvSl2HE3wxv9qBr2mU8PjbvaR/Cf5lFf9Zb5y/VDsHrbV4Na+HdgDYYb/1t6dZc2Zq
	 uogiiEFj57R2MTKF+4h475jTaL68zwJo5gUVbz+hVNF2HDzCzbxy1HBa7iTNrXN03W0ax
	 PfzolZp4Y/avnQb2B730wxZ2sIdEjTaSb6FmRoD6Um6e3GDLbZvmiXveEBkUq5H42wBfF
	 341VQ5WETh047x8vD9FNNRjlovZrzWkLKJ0SkOl8347qlaYI3tgzfQRTPxOWPCo4fcAcd
	 LGNVPzan4ysrsk08ZX+B2rZU/5+zy/bZghxNRbax8W+WgXiI5dnqmuOQVgZ6LSglhdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mJf5IPRp;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C51606DE68
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C51606DE68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mJf5IPRp
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso2027539c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284666; x=1794889466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=mJf5IPRpeaMDArP5CRv1jYoN8QYIuoED7cK4e36mKkMDZUJhtn9XjLxGqOvKlh/SvJ
         VbeQ9L1UfiPTr+BZzPCl/sSLBpZ4cfuPErh/REXC37hTMfn067KmiQRjFcsHiwT94ONs
         YZxIjN6BmTxkAZyOOOKxnbGLVMahhWJCE/Ckn3OIstyAkuaAmDUHOQ7HHf8x71jbOqTr
         UV6l0LBgb2nvl2YKJQKUaulw4XRs4f1CT0SZP+Rfs/LzZWtkgDEU27EyHPOWc6MwDMCD
         APl8f6QQ8seEjyP8Rx60FNNuKn63F5bEiAsG0K3rn/6WKIHG2qhjOe3IQNPjW7fr2vIn
         qVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284666; x=1794889466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=hfluNbtIYSWaNnc5Vd14nAHb8nxdhMFBS8sZ4yG01w6BBFILytfjj8A0bzGiq7AGpw
         cLyGz+OHUrbQzPsEuCk+/hUhb5MMWGcEF9YAryOisbbHxzA6MwFgoVIPQ0LMX1y/5opL
         CW8xU3DVXZttg76i1d10/D+AFBCJOeph5FcD2LhTkEp/lIN5wdNFa/WnjYsxOZxz/WMZ
         pJEfBRIyj0cl12a9URd2aD8N6It7Dnm6tnJtpbj48AYlgnKC8qCr/JCWq+Z68z/QjGGg
         Hq3VJcWjQrFujjAqdndaQQOFXxWhH9rctcpartP6vH8aooKwW2NxNb1rU+REAo+iXd87
         5nVg==
X-Forwarded-Encrypted: i=1; AL+hErHRBSCKwyvIzMpyxpEnvqaVRgWfNzgudSaQaZxuAIlwmjoHVoHL4NapNQo7l155+5XvndaA6J1UWq0I0Xk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x1uyuY3pSekC5Ze/ND8Esk0rUG4xCFaHftf3jkP1KW6bz4gLb
	hWUeLF2mtGsEqGzIYsomVaVMvds4A7tG3LsZ6I5e7S5hpQY6DZlierxNML/hZ9b8DQ==
X-Gm-Gg: AYBFou1JxPZHw60JjUsTl1PG+SOFTLkiouZ3p6nZMgRgQix41VtVelbzuP5nMHdksmm
	oOgIjaGoNL8I5q7cA+mIWy99VBA+SXUG8AKFK+XSaBkwm8HseOUgvqtDif9Fo5kTSlwPIq/vz9O
	pQ9bAsmizPp0xeRxj4RM9x45B133jeI0EWzcSyNk7vz1lj5EwSPiJuyUow5Z0nOmJ51ImchEJPp
	NTHdooLqRv8CCshSavDgRQvzMAocKYeb0xKXn1J2o2ZZjiKwrfXBuQxdRDOpHIKfug6EQE+k1XG
	Yjl7N1kUNNZ/wW5hz80z+I3CZPFHYcDfQ6uG1+srldqZ5Twdx3VF+zljoDN5TRXQ+vROMDKQtM4
	bSNSpsKIwEpSwLmNGRihW+J/B7GBKiHQOrWs+FWUHSNr5hSmk+rPQjEeBvF1NB2C4QhbnWK10Sr
	+DPUuFxn8SpqdhpGmlRKVbwUg/grCooOITCB49zBOOA2IgAb9//LkGuwbn12s4WgNZok/i/bL7L
	Dc9e+rNqK+0BaXae0lDBXQnWC3cN6FwH6CL17juL1SR7jGzmRcnSACIrNoALDn2tTDSQ0muLlQl
	QqgMaCYe+Dadp0XospaQq4Im73xNnSrayUBOzwFvOfWJlcEvJ7yKu71m5xvQwa63RTnBjPw6ChH
	Fk1mX3iqgtS55VhOt
X-Received: by 2002:a05:7022:927:b0:1b3:a22c:7f68 with SMTP id a92af1059eb24-1b3b60094f5mr2444679c88.29.1794284665400;
        Mon, 09 Nov 2026 20:24:25 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:24 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/3] dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
Date: Tue, 10 Nov 2026 11:24:02 +0700
Message-ID: <680b4e98af630c4759dbdf73b53926ec5f87fc3b.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794284248.git.jjc@jclark.com>
References: <cover.1794284248.git.jjc@jclark.com>
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

The Global Timebase Counter (GTC) of TI K3 SoCs is the system counter,
the one the Arm cores read as the architected counter. It can export one
of its counter bits, selected by GTC_CFG0_PUSHEVT, as a push event
output, and the Time Sync Router can route that output to one of the
CPTS hardware timestamp push inputs (HWx_TS_PUSH). The CPTS then
timestamps edges that fall at known counter values, which gives pairs of
CPTS and system counter values.

Add an optional ti,gtc-push property giving the GTC CFG0 syscon and the
HWx_TS_PUSH input the push event is routed to. The CPTS driver uses this
to write GTC_CFG0_PUSHEVT. The router itself is configured separately, as
it is for ti,pps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 .../bindings/net/ti,k3-am654-cpts.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
index 3572749147fb..7bf5bedc2b9c 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
@@ -101,6 +101,23 @@ properties:
       The pair of HWx_TS_PUSH input and TS_GENFy output indexes used for
       PPS events generation. Platform/board specific.
 
+  ti,gtc-push:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the Global Timebase Counter (GTC) CFG0
+              syscon
+          - description: HWx_TS_PUSH input index (0-based) the GTC push event
+              is routed to
+            maximum: 7
+    description: |
+      The GTC is the SoC's system counter (the Arm architected counter). Its
+      push event output, one counter bit selected by GTC_CFG0_PUSHEVT, reaches
+      a CPTS hardware timestamp push input through the Time Sync Router. With
+      this property the CPTS timestamps that signal to provide hardware
+      cross-timestamps of the CPTS and the system counter. The router is
+      configured separately. Platform/board specific.
+
   refclk-mux:
     type: object
     additionalProperties: false
-- 
2.56.0

