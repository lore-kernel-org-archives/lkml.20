Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913796;
	b=jZ9PUeAJWtvyHiBkGiy94upfGHYrO3xYuxfRfSh3NFSKCkND7Qf5YtjZ9S+xaOL6W6wX
	 eeutMyjwiYyX8KXFduyuQLtzmsGPg6iV8hmNqGoewOeHgzUYO//1ddePaHUh4xZ1yXEfZ
	 GlNNzvAjcQUnFFdm7OpzclcQ2kTowOVaezouWMKs2/OEBTEnOmivmgu/oYxevT7g8MQ3r
	 qCCSjdndHRFykAEIjPzBJT2ElBY5Kf1RxxlrlojIMNcbeWdkKf3c5lGg+gS/qVuqn5tuO
	 YEXO4UDbpMs3FqzTnzEBUg8cAHbG2VN5QGdt2ydIxhx9uA1B146FMzxr/4nJLTgt2Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
	b=lv7Agblhh0ttgJxNuD0A+GRZ+aVL7EUve2t2OBf2PjaVQmsl/Z8VtwQyzEWLtv+yaW5h
	 hHsPwiZSLChXD20iZZQpGOSCpzwHEGxDG2ERXIuA9KDDWd66MordT5nRsSh0+v7sTm9kS
	 nGoEcd8uWHKo5x+QqwLpCNJSI7YJaEff27pHgkCOFjB39xjq5SwhRJQxc3GmPbQ1qaeJf
	 rSBj1LlEnsirA4Ai9MhnVDK+2OyBEvgyjE9Ua/BiDHuhSdzcb0uj9E+cO7kS3r10vWSUM
	 6+cgg3W1o1JcvTt+Ur/okxPC7GYfSt+qoY11uwKLF+wcvnGr6KEtYF71pY7HBj51FTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMREe3SG;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3FA606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA3FA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMREe3SG
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40319bdso1978095eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913795; x=1795518595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
        b=PMREe3SGV7qkwfAfexg6hLXqIDQVT2NE+9apeRycnZWfK+un0+5zby9JX/IXIRYuX5
         waGPua0sJAQN+wOzn/dsHJitxLf+/PuDt0PNU9yT8Sx1WnITbRoQa1LY4LDyrNaVNsI8
         1h5dsSKFHyv6/bvU1bomDGinZ/KJE4+XOcBdCk73CvLvJfygYr+3StSQ7soCvBIGLmAu
         mFeitgVPOvvjSyJgBsns2LS9R2Mybd5FPKu3DzK/A1edRKySA28GAh64SeEJMulRA1ko
         0hGB+nI1i919xKAYIRECr3TIDraH3ApX2dC54IYHn3sT3+NDC/bc4ucLsPPPFKEdlnFj
         tMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913795; x=1795518595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzNmcmH6DQZPnhRJu7d5EWZ5XHOrbm2NPxIubtKTIT0=;
        b=OMIwvFwtdMGqb6/vrltg1KFpKhaoGTwqXrRuxnkrzEtsmI1/sbUEbwF8CQE5dxIgQ1
         hc20ZrUgJoZUuu1tnsjS6YlsK8g7WZ9n3qjIt/jjqI+RR6qUBQTkdCMepeneBIyGto4k
         fruuImhrc0cMXj2HAaDsyoAgw8I1XrRCyxQp0/lcortJ8HX4zC4VbJK8K5+6kAlSJgVD
         EKKS11TOD7bkd5wKLjbe8/GDDkXoymtB7Srk/7sMQeWJ39TeaXDTGuH4EIn1sFsTp0hv
         jWWkdqPODtsHm+4e96HZ6ppm+qLach9TnOvo1pFK1Ba3upQCaSjw2mdIAQeepVa6m0ht
         cx2A==
X-Forwarded-Encrypted: i=1; AL+hErGCPHPm3u6C0UAM515YhKxBEXMqwOB17DyMXybLg7lhcqIWpnY0zDsPguDlsvMPWtuI34vfa38ThAeZekQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yuVh7k630SLaEzjLv+qsrUavlrrRj60ACfW68mtsunusZ4T+P
	Wn65/4/tHuQDKqbbmHu41fboqAKAtPJ6+hy0GdHnTrdFdB9bkt/OV3lu
X-Gm-Gg: AYBFou2laXsEs2JojU2JMrh5LlD3xkWpuE6bs4pNNbl/kvDr/Kyxlw8p10PAJsngMdq
	bUdwJa3sXzincDUSyaF53LL+CN+ocIs2FyzUMsbgHQLn9MOJFu644yaONVk3osUF+aXbLNSi8EI
	qNZCFrn7K4QDoIVFqCZUiKYtJwLgyhlc99nUJlPtBx+APiViN6AKWAbux8MZbmcGjv28tAQL/QR
	hhZPnytG4iPhZnQSSUlzalhyo/oZzFDk2Q2afu8rZU70BaLYz12m5l3YT29mgXOA69OUzTVbgSH
	7hFoAzOt9U8jIVoyxQ2EKxbKu/qwDIsFVgepzBF+dMnjdUf865PTdciT/HmCrOYNQkYQrIGeZ08
	kJFIO0ZyddOSvjbBAA7EtwghbxMxzDnzhCGJXmMNGB/XEHMMsPeHUx3bWweancSv1wdR7U7+yhq
	C854Rji2SQm7/km1+pQYn3MtErD6mFI7MgLXGprPJ4T1PDybI+Z8UhftTpu9GaAiuBgJRBxFKkw
	mRkM3RsSrSmudT1BRlT+TckPk3m3QlFd8FxUAMA5aJJzDM4Y282+BTttB89EpjuRk2ZHP26KbhT
	rcxeydgfIxSihB5s9xPh/9bUPaYGSYFycc3iM+RuXMy9wGyUJLP7z1LCjdl2R6yptKPjwNk/+2S
	fypi3DYjUD67z6u+ggmGUWOMNDLYjLEKwO8y5tXektvTHqP6tHLu865i3rJwlu7ZrztTZX8E5mk
	8ui/0v7+LIRVNY4WLFM5XOLjnoVzTXt2DBjpMKVkErVwtmRUzauSBOQNaudk0bL38=
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr13060710eec.29.1794913794818;
        Tue, 17 Nov 2026 03:09:54 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm5560475eec.10.2026.11.17.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:09:54 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: iio: proximity: semtech: add myself as maintainer
Date: Tue, 17 Nov 2026 16:39:34 +0530
Message-ID: <20261117110939.214932-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117110939.214932-1-kapoorarnav43@gmail.com>
References: <20261117110939.214932-1-kapoorarnav43@gmail.com>
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

