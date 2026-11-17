Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936389;
	b=eBKHCJgOUzYRjT2IIQFpA8JZU/GSKetI5swiAd5z6XmHdBzLWBkyhSxYLVutyfkgUNad
	 ZhIPc2R7sJZMA1lZa+ZWzoGuqj/6VqO7wPhFZwVi0zztvAWUJO/1QtGgiOALp7L9Oc9be
	 1cZQCvt/czZ2HM2pgJRIZsxzEHUXDxF0RVQaeuILHNqMbT8XqMHEh9/TFUeXpkO7CwTQ3
	 o4+uVSxluAxsCKPYXFaRmNGxVfCGWyLAhiUYg8QboSjIhtyRXY++Zm38iR9p8hwSYFiIh
	 c1fmkP02f2OIJsr1FAP3ZDHPUPRRQSl0qjctNBbS3UYF8jmFvkWdbWw6/UKpiTvoDDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
	b=e4UAFn23ttZvy7OA0mDwAFiB3T87DJ8JJxGbN9oIRfgZNGcC8nI/G+CRFH0+NeMzQ6Zu
	 pNM3qxXysnOIvQTuPkAgGwLPX3Uk5n3cg0NKldYojyLfIieH/DdOJOnblCXumhSxCIAGc
	 yOtwQaemSipSgTCX+09BM0s4Tf0BQ8vCA9XODplBRX368xV+6qVRkVtaOPMphhsKRBG7n
	 rhe5NBuBPvPBgf+bTvXJBVrpLyU6XwNMX5qLzzH0cBuwM/Y4Me57ASu77Km1wgKqilzfT
	 1zDwBxtiHc+cJzRInmB/aOG5QmVpW/wWzFSWAUUnFUWtm1/DPNUVjKHVLzN3s50y29g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aw0y2bKS;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E4606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168E4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aw0y2bKS
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so95470c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936388; x=1795541188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
        b=Aw0y2bKSmjz+HizsOZ8/Yw8i/5rgZp54UcB4X7lTBil4We0qmgDIZXhr85S/K/itdx
         OOSqfIMfxWVQCLTM5zlXpSE2mYbwJ+lVexBTP3DtEKysNRaQCfwnQlVMmgSujP34UhtC
         iqRBqHDgyfIsJCuX+n6Og8bl1vCdtHZX9PoUZ9gBtwOIYrIXBFNS9RbMMifZ5yaWvwdB
         wykEpAFmPPHzNJw3TfKAwCn3ynzXo0TLrDxQAZtAg2tR2uz7iKe8hsz0VPWLN4qya/ly
         lLvkYTLbnuu5CgNUZ/u4RoUe3Pzax/6o5FOTNou/N+sOzIliUHOk2221xP6ceKKzF1wb
         w6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936388; x=1795541188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
        b=0bgtic+Qvl11tL/cs5HSIqDUFMAYLBjign7rnrthpeF+Y4THx1iB1StBnvH5DIQTOC
         T1D6RrdIgKEyaWomcx7jenI9yPEfgPciPZHMBuMLw5w7/C1VyD2kN+1wDupDK1qyTKHt
         P4mom3nCown3i7wcn5AfGmO0fWLzCPQBVD1caMWMXm4s7YZeSKSqoW1XLSPMssFxG4bW
         D+zRXWaO4L8n9nQgAS+Ivr9flMNyEtboNBTZiDjEWXr7Fnc1U5jPiV2Fm0V3taOJEIJI
         letBNj673BUsxUgow/uEkIp82jJ3MZeOVeQCIt28vNjiObQgOjOtIE/CT6eyWvwIAnrW
         sRoQ==
X-Forwarded-Encrypted: i=1; AL+hErF9hHfcs5mFwTMjKnEySIv1HNDDPbTdMO9xairxPs1e3S6EN1luboCiGhHBDyeCK1oEce9UjQABgd78XYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WStqi5ya32N9qyFektYp8nhrYPaVQbDkh6KmxjY6G6pgzP5RB
	eKFXRg/OgySxaiNiCm3T7BW0qd6ymirwJgjubzXm+hm1iBM67jt0KLK2
X-Gm-Gg: AYBFou0FtOLMCssSjNT4OzSU/OXuHSBdJE7jLPCvHhMwE/fEYcQmfWqShW4LBfyO5b2
	WwNtii+8yLwpdiD3UPqabTzLlV/7iYcQ2+yqdFSZr7Y5a+ciU69qfwtQlv1MJPHLqLYExqGgUbQ
	oVTYuRK74HAItQMcGVBIQ97JizFN4zFAXdR3cOUIVfr+bIRiXIXs0tNdwcSwgFJF2YJF9sqi1C8
	wmcoJN9ycRnvy/wbg1+be8DLr76TG8Ju963N9I6N2B+Fp5VAKwShAs92cI5hLTeQE1/Zu3CSf3R
	Xd/1z+SOBOXj9p4ysat+PU5xqgJrlsB5t9k1XMCNFoUFIc3GPIHh4pt9gsPikL4jSgcVnDy6udW
	fCJr7yEcQV0GqeAEnAcA4pdSufsvMDA0QrdyEZa+yCTbhJuPDiqfzd86qK82X7ZmTu+lTQ+1EPo
	AGriTmbaLfulwNmH4uaxC45yoXKpICb6IaB5W6xcogQUHtxKFBq+WwUASI3PSZugdb6t3ismJQI
	2wkVZMSS9wrJqynQwpqgoFIOdR8O1JotIZqyKzo9PyWUHHzoiGlULjFVUDz31P+mJsEsl6rOmR2
	osXykIuhiTg3UabuFPWeyltxOGbz3BR9IqXLDF6XKizBgOxudgw6Vv2jbbGnHNvu2BxfRAGz7qb
	p0TampooA0Co9i1a7Z1twEJwi9KG1zZoz4uXElOSD+Z180ADq3FPK6t0PXlbM24Axq3uJKLlhDT
	06zk7aJM5yq73pabjD6k4hl6yY/mY+zfG2HxH0NKaACPM=
X-Received: by 2002:a05:701b:204d:10b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b543beb56dmr256212c88.33.1794936388092;
        Tue, 17 Nov 2026 09:26:28 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm14263079c88.0.2026.11.17.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:26:27 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: proximity: semtech: add myself as maintainer
Date: Tue, 17 Nov 2026 22:56:08 +0530
Message-ID: <20261117172612.25535-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172612.25535-1-kapoorarnav43@gmail.com>
References: <20261117172612.25535-1-kapoorarnav43@gmail.com>
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

I'm adding a reviewer entry for the Semtech SX9xxx proximity drivers to
MAINTAINERS. Add myself to the maintainers of their bindings as well,
so changes to them reach me.

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 .../devicetree/bindings/iio/proximity/semtech,sx9310.yaml        | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9324.yaml        | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9360.yaml        | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9500.yaml        | 1 +
 4 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
index 775555d147bf..39059215cdd9 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
@@ -8,6 +8,7 @@ title: Semtech's SX9310 capacitive proximity sensor
 
 maintainers:
   - Daniel Campello <campello@chromium.org>
+  - Arnav Kapoor <kapoorarnav43@gmail.com>
 
 description: |
   Semtech's SX9310/SX9311 capacitive proximity/button solution.
diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
index 8fed45ee557b..301d502f210e 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
@@ -9,6 +9,7 @@ title: Semtech's SX9324 capacitive proximity sensor
 maintainers:
   - Gwendal Grignou <gwendal@chromium.org>
   - Daniel Campello <campello@chromium.org>
+  - Arnav Kapoor <kapoorarnav43@gmail.com>
 
 description: |
   Semtech's SX9324 proximity sensor.
diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
index ad0bb44f41b6..2ac8bab30cdb 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
@@ -9,6 +9,7 @@ title: Semtech's SX9360 capacitive proximity sensor
 maintainers:
   - Gwendal Grignou <gwendal@chromium.org>
   - Daniel Campello <campello@chromium.org>
+  - Arnav Kapoor <kapoorarnav43@gmail.com>
 
 description: |
   Semtech's SX9360 proximity sensor.
diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
index 66dd01506859..cf05d1b0b1f3 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
@@ -8,6 +8,7 @@ title: Semtech's SX9500 capacitive proximity button device
 
 maintainers:
   - Jonathan Cameron <jic23@kernel.org>
+  - Arnav Kapoor <kapoorarnav43@gmail.com>
 
 properties:
   compatible:
-- 
2.53.0

