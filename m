Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284660;
	b=LXGZkA0ji0jhSu6nqJVQJP0lkzkhu2VohIypk78dUcu9LcyF6z+DC5gc/nrQ4550Ql+k
	 laUOSJwYaYAMSgtNZGbcMzoDh9FZ/A4Txn3GQaxK/AKAHAVnd8wJe7E7AFdR3+u+RwcP9
	 inWTg2nXacN/KTYsaPpPUv1rFJ/Jchvhsbg1bc8/kc/y6yK/3vSurt6wfyqcuTPbxzKGp
	 SG+rxzLZuYEPOJFNHyt01zmkjjwjIs7Qcd9np4APT5BkjMfwdpRGQN8Q+GcMiHW4gN/YX
	 AddSkfWR/r9rFT5wh1h0IV9bubZ2wAzFc6Nn7/Alg4VUKPVM1aebU7w9BRDWNXFb4og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
	b=Lsm3to9dx/rbVePefgUZFuC/02G8/L/FYOjbddU4eIJUF9SgGNHfHMQgqaQslQa9xyzC
	 uCvOUjZqBwWWpwowEhGzaO5CIPpP4M2zsCEsyglgl916/6vzvUDWsLhbvsyJlQJVPV1yT
	 hIXUic1eMTszYOW8YTrP9gKCbv3F80ojUKx5r4Fl0YzTkQWIEUI4Ta2B/OUHqrnQO6ZCi
	 KpJSg6pZ739uy5jAHHBBbiqf6CcqJU/RPjmcCnL4vrLbzsu7qYVrrCRr1U5vkOzV2/8pt
	 N9EKMftnkoLnsmNM4iSlC9qz8Hz8PK63w3OtR/m1j5s28Yed33/P4aoPHpQNhwmezEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="XwyaI6/X";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7168606BB1F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7168606BB1F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XwyaI6/X
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2464867c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284659; x=1794889459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
        b=XwyaI6/XFrQ0gxZ3AcLBiIeumVvHSl6ZcTQBvQ+Le3dpOLxS3w18WPNfSHoSmpSIxI
         HLlkGJIw2LDqnhg+BV5kWw5dO0l3X/+D5//sxJoHUe3cRT3aZbOFcp8JawPqxrAiHBFO
         qwvXrkqkkmDCxOt8re+pWIzt3NYonY/hVFzOKsChEcQLXlrdJSQZeJPN3PEghcAr3aJV
         D5L/ghNBnSP2h5e81vwZhc0RuQniSJMzKXjBdT67NJYcY2Bz41DpNTj2CXLEGep5c1YQ
         396c0VROmq0JifqdHPilzDXiW1i2aKldr06eC33FE5uvQn0oOyAQYblhH727OPKTT6Zl
         8tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284659; x=1794889459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
        b=GCIcGegDajiYc1cxjXy63fwEfcJh/mX1TnJRqqhLMgLkWxIr/EHpFErkbJzZbDzD7k
         0+meeiwau/KDeD9ymAAlER8ver9MUV6myWO7Igyws5kYS78d+lwFzcV2k5kbGH9slo+c
         gAvYWb+skZMgTTmDvLlfgY96WpoMPfeg5n681elDz7mosX51BFgZInXiy3kJy5mrfVk/
         +KqEzap9QxkoMG5r9WNeKCUzecqsCwi9jvjmIR4spNC7YvgQqa9TNKYrEIJ1i83UEWCZ
         yXiqvPxafEoEnRZMG39eFHgG89Ab3BuqjMTGfhIhhzhvOMEvsFbPE0AhTx4306OauBlA
         rnkw==
X-Forwarded-Encrypted: i=1; AL+hErGHtP6koNCUwKG/qt25ErveZ5MsXagglWl7oz+2EMcYM2vO78qJ5SePvCCNG1oeMCUsDfwSfqtFkFbg7PQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qgt5HNNfBTknKvkXIn0hI5/XYgvFd3qG+4HqMOW+uV8ZYwawJ
	+2IRIunc7fgwUykVEMKXQJ+YFKVz3iB84K1q6b5m9tkTOFDOgWEZXG7PkmteylDnuw==
X-Gm-Gg: AYBFou2fn8gmK7JCTWZ5JmQiwevoXIK1cUUFB8bio3SYUaGNvcJGVhTbs2Ann3mVPPM
	7WyeqYjmEv97lmh5JFXqpTgZ5+093jDFBvLdGAK7uQiMEaVtHwvTdpKWfGzsCuyXCE+2Lj5fygQ
	4pg7p5BRyOpmOMztOSCsVtHHEeLEyvbmj9qnOvGnxyBWAUtEld5rf50JwPoRvTS82vsMvhIoD2+
	WQyr8DTWVRDZqQCEFnSF9feQvi6w835Gn7+J2Hf2lt4kAM6n8XcDSPcoZzQHHB5HeuUq/Yqjoek
	p/wzdBts6kpUP5MTbC80ej4NlugSD5wQn83T3cRKdcYL1OkRm3ujUARchFgVXukvVG36Phs4YtV
	rlxCtvlRl+cE61i4NIpdsYS9B/zARijdzMXA7WGYSp4E+BH44OX7GzwHIngDg2BEzKdFwgvsrej
	0p2WKOsTRHxi1Sd0Q3mnxUi2NaMYZ3y4gMkfKU+f+dC1IkCYdI7RddH2ZIg6vGdh9FiZ66sQMZD
	CAjvezG96iD7tbqNGc7UgQns0hDZCn4JaOhcrQhOAqe87CDqr+X7/ndiXv25G2aCPo9m5uaL9fo
	JUH/pLOFlNzmRgsgPNumRuW3BqhqFwOxZ7215+N4pnEm1RT031A0phbQtEeTRf3BmnA1UrR55Cw
	+imXVeWRNvO9KLrVC
X-Received: by 2002:a05:7022:1505:b0:1b3:ac53:da84 with SMTP id a92af1059eb24-1b3b603ea3cmr2230611c88.32.1794284658677;
        Mon, 09 Nov 2026 20:24:18 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:18 -0800 (PST)
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
Subject: [PATCH net-next 1/3] dt-bindings: mfd: syscon: add ti,am654-gtc
Date: Tue, 10 Nov 2026 11:24:01 +0700
Message-ID: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
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

Add a compatible for the CFG0 register frame of the Global Timebase
Counter (GTC) on TI K3 SoCs. The GTC is the system counter that the Arm
cores read as the architected counter. CFG0 holds GTC_CFG0_PUSHEVT,
which selects the counter bit that the GTC exports as its push event
output; the CPTS driver writes to that register to provide hardware
cross-timestamps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca2..b1030f11b2db 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -131,6 +131,7 @@ properties:
               - ti,am625-dss-oldi-io-ctrl
               - ti,am62p-cpsw-mac-efuse
               - ti,am654-dss-oldi-io-ctrl
+              - ti,am654-gtc
               - ti,j784s4-acspcie-proxy-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
-- 
2.56.0

