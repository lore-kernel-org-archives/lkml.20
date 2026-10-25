Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=145.131.90.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935521;
	b=4jnwjmmwzF+plGnoAl4nzi5jcNbP55pKQvQdsqDUgMgSGaZJM0icSDUo8hEhSaOGNPdH
	 RGQcaYWhgNq4FJwbX2ZpxpnlfSyP06I3maopoDyee2ow9LspoGIcTY+57VYzWss+VeM1+
	 tNKFpbi2iBCS15rChiPo0x5j7n3tvnTqQrFqi3OKZTKzqozxNkeLX5QnW4xHP0GIJyVNr
	 9nwRevdrIePKHiepcK5WRSXkcIbeD/OelOPjErrQyPpo5hVTutdYaPffpD5Z9DEt1gEyT
	 uNmsEIPRu3j5l1Mc+wwswtvTUR8e4E5NeQi2f2rDpIQ8ng/Z7lX3ZNAiardQYMPsMZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935521;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 Mime-Version:Content-Transfer-Encoding;
	bh=pqxz8tLX7ebcqdkF46g3geLYrBK/2IZj+ZWtkgQ9FzU=;
	b=HLvxC4WULuvjmqS3oM18VSMx1y3HrXCxrxNIWcGKZJoQduqRtkv8Y+h//CQKMQYjhIcj
	 uv6UKNjDzRTJLeTnuhTSjRNsor0YuE9v4JoTPUuPnvrENt7HG99X83TVBZrMtALlAkQPe
	 ZhN25LJxx2VJVstLE8OH9a8KzBqshdcPOOwyVS1iauuweM0r8+st30dVxBqY/UmjJgJWa
	 +RTu2B42Bx6TfECMCcYWjeE6zowofWS2eWsVP11ES4Jerrj1wmB4ces9IW+NDwko1Y72D
	 vmkgExnGw2HiCaowu56HGIyLuWHuDOP9NxdHsFVOAcmZa7XnSfYM7lAvmEIonCGu94Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pyk.ee;
	spf=pass smtp.mailfrom=pyk.ee;
	dkim=pass header.d=startmail.com header.i=@startmail.com header.a=rsa-sha256 header.s=2020-07 header.b=AJAMsJcg;
	arc=none smtp.remote-ip=145.131.90.139
Received: from mx-out1.startmail.com (mx-out1.startmail.com [145.131.90.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8C606A31A;
	Sun, 25 Oct 2026 13:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pyk.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pyk.ee
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=startmail.com header.i=@startmail.com header.a=rsa-sha256 header.s=2020-07 header.b=AJAMsJcg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1792935513;
	bh=pqxz8tLX7ebcqdkF46g3geLYrBK/2IZj+ZWtkgQ9FzU=;
	h=From:To:Subject:Date:Message-ID:Mime-Version:
	 Content-Transfer-Encoding:From:Subject:To:Date:Sender:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition:Mime-Version:
	 Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=AJAMsJcgPl4OLWUGrz4u1lLJx7RAfxQ7x4CSU5eqkK0IwEUnXFflyuFRIu5FjzmQM
	 oTLnq22Iw1vmCvgXatNSMb0dVsaQqUpISn4Y1Nuioi8IAKMT7KyYMnZ4PEwuoUP1ot
	 0sSbkxfetJMZBeUi2gaUnHCkuIJ3aPMDxMiq/KWec0lhSp0IU8FT6Cuk06k0Mviafa
	 Zj0n1AcrGmp7tVwJR6HGeIM+BjslQu/IdTAQ91OyAkaDxqhamo+oibY/FjiOygujI6
	 E5RLHrEmXq0nTWc32/ZZE6XdxaqX6b5Yq7F3kWy2Zsz+kz20xwqTvvS5bk+UYpCs0L
	 LngjnJkX8ed2A==
From: Jacob Pyke <jacob@pyk.ee>
To: neil.armstrong@linaro.org
Cc: jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	teguh@sobir.in,
	Andrew.liu@moorechip.net,
	Jacob Pyke <jacob@pyk.ee>
Subject: [PATCH 0/2] drm/panel: Add IL97680A panels for Retroid Pocket Nova and Duo
Date: Sun, 25 Oct 2026 23:37:39 +1000
Message-ID: <20261025133741.100490-1-jacob@pyk.ee>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds bindings and a driver for the Ilitek IL97680A panels
in the Retroid Pocket Nova and the bottom display of the Retroid Pocket
Duo. Both are 1280x960, four-lane RGB888 command-mode panels supporting
60 Hz and 120 Hz, with DCS brightness control.

The driver is based on Teguh Sobirin's RetroidPocket implementation.
Display operation at both refresh rates, brightness adjustment and panel
recovery after suspend/resume were tested on both devices.

Testing on these Qualcomm DPU systems also used Teguh's command-mode
MERGE_3D fix [1], which is not included in this series. Board Devicetree
changes are outside the scope of this series.

[1] https://github.com/RetroidPocket/linux/commit/b547718c91dbaf8fe27745afced8de00d1f7415b

Teguh Sobirin (2):
  dt-bindings: display: panel: Add Retroid Pocket IL97680A panels
  drm/panel: Add Ilitek IL97680A panels for Retroid Pocket Nova and Duo

 .../display/panel/ilitek,il97680a.yaml        | 121 +++++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ilitek-il97680a.c | 433 ++++++++++++++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il97680a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-il97680a.c

base-commit: 17bb0e2f6c8043f70a693a5f3797471cbed354c8
