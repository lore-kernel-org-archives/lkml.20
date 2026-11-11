Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393460;
	b=zgtEptFhIVzRqiBj1rOgxNmYOfmBXLq7pdV1RhOf1u3MnRRWY2SFj92IB3/srWHElBbr
	 tPAgKCoewDwgc30IXzTQEL53ewfOdv8wkaNc56OVc3l9gabY2ALsfj8EM4adHkXnTBRpB
	 Gkq0rw/mKoQq/Qbvcm1BhZKloZrnarfBWZpGVYEb3AgZQobWlY2W6DS9QovfjdU41S6xz
	 NVrPLuvtgeM7HPbM2PYsIwZBf3YaM9bLc7FwaP1EfUA5+RXQk06E7iXOZ8jm9As+iU+CM
	 xmsPHUqRO+9A3S3e3f738LplrBftKD8qHZ6cMDHBnkdxfuN7ubDPMvmVfAQf7WPQfjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
	b=T9Tun8s7iR/fKhKZzxq69KNfsI/ZN+XKzYP5FXPQCpKh6nUbLQs+1wN+Ddqp2bKQoS8L
	 +uvkhLz6CI3ppOyiqzzyyU0RR3VqQPE1F0pl97JeAWDAAOTK3CKMmD/gbp5AZKNO5E+Lt
	 YrhRMX3jV6PxjoAXJ1thKjMuew6KFtsA/TXKa/9vHSXFXphA93uKmik7Xui6flTn4IEY3
	 YMJM7TUm6y+VOuQh/EcCVsHTeTuqfpxC3zp0NDHDxB18eCa44wpOdQb6oD6HL96rFHAAX
	 T4ZBMyqV7qd5gc0y7GtV7mxUA++O1VrKV9R+NCj7NHZepe2vBg9+mbzZqO4OX3cIfdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IQrdNLmU;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6ED606A880
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6ED606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IQrdNLmU
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3acec6677so4682230c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794393459; x=1794998259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
        b=IQrdNLmUkTb0QulDRJPXkTLdVZNJIHZmsCFZg8DmIwe8hOHt38+G1g4Gh8LFJ9XZgX
         ckC1QGiDDqplvyYcReSFKBteQ1ervRy/byGtlQgUftKiu9gTWV2veG1eBb6ffpt0EYXv
         4u7c+oCWTKeV9N4W56wNzW5TO0y3fmyAkqTK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393459; x=1794998259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
        b=nHxmPY32L/elJn3KLVRg0LFp0cvWafYYUtVN0VoFhnh4QFD/clhJ6X8wnKJSaP1kk5
         ny+Mefns1WXgKcJFk0Q0a36K83Ei0Nt0wzurelp5CWfmD+FMiPwwYY1yTXab59XfIVfY
         pS1Xm4QTPqGdYb3CRBOLxscSPZOWnz6bZbellEkGtRARGdBlj93uOBmMeogzNfhklEUR
         UUeQJzM9w9bW3cq/9xOvcA3GDzSnc+4cA4/IE1mzx9Ey5hgDT9SKoonsKD7smF8GTMrG
         nsiaoqixYyHAmZbnwFSpGs6bPErLm3GHqPNv6mRrlqAKUIWkUyAQyMCd2miWxlYFPMoc
         iamA==
X-Forwarded-Encrypted: i=1; AL+hErE9yE2iL20LPUExGNeQfH646m/S1BLboCLuMEWHYs/YmqocHjae1jIjbYneAiVIJMIUmIbrKZCm2KfKus8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/39PxJxQG9bNOg8mL+K0S4rfyyNgO3ZpIz/g6kOu5+IjNbv6F8
	Dcr8VhB15CvciGlz1qTp8EVNrpBtvPWY/wSeLW5KPdoEOm6NkLDgWWkei9yc8h66QOXfmWJIKLy
	nius=
X-Gm-Gg: AYBFou00EruYK/e6Ungz2aoTvAteuJWY2jholRL9EqX5a7nqAtEyR7N9nMhsntNnZBR
	Sv8w7oSflhTtmSUKW8vzDJIkw2dDO0S3jBnMEqXAVG9r8E3aS2OJhzi8OpGplQ1u18v6C1WBd4F
	HkThIUxvwofC4i6oCrCmbjzidu7PV2I481wJ6awE8b8lFuGngWxdTPAji3C1x7lzq1Cu0B52z/q
	/FYNHXlACB377BkkPDV5f49BW37HAqtkuSDDK1FN4tTGzyhSA0YVI+d3oDevysb8wNW/Vnr0B/8
	9j0r90gk3pKjpE/W33akWF1NumsbmmDIiiKekANwN0F/UbtuBpsY7rSjahll/sDUtXJKNMtUjHe
	EXu2GzKKuKKO+UMx4sGujUvt/Cogha8MY526mHnJ6lHOTjkEzUhtbPULfk6qF+7kRpk/qIwylCh
	SSn5UTc7X/hWkLfAIZ8+mFRyacNnHFsMOURYVXIxyQYEiD3soS9br0Jm+MtbSJFEgbJ19IeFbBl
	wOrwszJGg6j/UF9LAJ9jJxQelHg9ztkc7JMbVM3fci+0ZiR7gVzbL35liiP1jFjLJFtesSOSUpS
	lng+fPNNe8V7oYbl0lxuTTC/Edwk6gZqQfhhKhtL59Tba8A2E05fXQN+OEvctAov94pATT+rUCL
	rUx4BCuk9e9QqdF4e
X-Received: by 2002:a05:7023:a4c:b0:19d:6484:869f with SMTP id a92af1059eb24-1b3c02fcd46mr1947792c88.7.1794393459210;
        Wed, 11 Nov 2026 02:37:39 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm14735194c88.2.2026.11.11.02.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:37:38 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: misc: onboard_usb_dev: Add Genesys Logic GL3525 hub support
Date: Wed, 11 Nov 2026 18:36:11 +0800
Message-ID: <20261111103710.1393311-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
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

This series adds DT binding and onboard_usb_dev driver support for the
Genesys Logic GL3525 hub controller.


Fei Shao (2):
  dt-bindings: usb: Add Genesys Logic GL3525 hub controller
  usb: misc: onboard_usb_dev: Add Genesys Logic GL3525 hub support

 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 4 ++++
 drivers/usb/misc/onboard_usb_dev.c                        | 2 ++
 drivers/usb/misc/onboard_usb_dev.h                        | 2 ++
 3 files changed, 8 insertions(+)

-- 
2.56.0.542.g3ef89b7020-goog

