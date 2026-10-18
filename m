Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28483D7D89
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365186; cv=none; b=WxY62ZAa+WMk+eNPYDwiq9BbCV9Xid5rSCUlOVR4Cr04XXf7Ys6pGUbw4zTgtnDQhMkZpa8Dj6CP4wOAzBzbD9N81I0u5nfPPU07Cl1ZvO7S1DQJ9PECX7WEnIv45WAZ4VNtgrlDd6u7r150/1OQTfHdRsX1l8Q52X2aI0r5D8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365186; c=relaxed/simple;
	bh=Mb3rmHJTR0zoyOC45CYjoEjYWAyDYfWRwLnj6OnHt0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pM/0Nmm3OcJ5C/AVU1IiTfGsPGiAtRXbVU3QTrEpRTFCo2yLfEemh6ej3avjUWzhfpqI9F+cZ4FlHQCeG/6oXMV4izGvfcrNIpyF29jHwy1d9eAQr1Cv6ZJtNruTDus/cKfq37OERyyM8Gh97BpFWVqPQF9F1R/Pd8Jgy5ttoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=xnd1LgBA; arc=none smtp.client-ip=91.218.175.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="xnd1LgBA"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mb3rmHJTR0zoyOC45CYjoEjYWAyDYfWRwLnj6OnHt0s=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792365182; v=1; x=1792969982;
 b=xnd1LgBAEj7VcyOarz3h3bO1/RVUxCzfw5Kc1v3/RJuWlje3CwrVsHGtm8As4+mXcXlAEV8/
 ho2Zvg36SZ2/965zsFnKlPvp2OU7evQqsioBAp9EH1aBUjLf4xH1B5b4XPDXu/RysX64KedZ4Dg
 UTUmb1NAgWJL9UT6LUwi5MhCCqF07Cmt+szfomz8SAXEjn5d9RttxADfb441+/C0kMmpEiaMJeH
 ZzegtSHlJKDn+Jh/8cI3Syzc4j8JSDW0xdyq06oQsU9PdT3cq+gt8iuu5Rw7Xe4qFjhXOZFadVW
 V3BQrDNY9FenUu0r8TVHdmrSuaO3rg76v11xz71wbv8hA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57022a8225cf4c59;
	Sun, 18 Oct 2026 23:13:01 +0000
X-Mizu-Trace-ID: 57022a8225cf4c59
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: codecs: wcd937x: add USB Type-C analog audio mux support
Date: Sun, 18 Oct 2026 20:12:28 -0300
Message-ID: <20261018231244.1266926-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently only wcd939x has support for USB-C SBU audio in mainline, but the
older WCD codecs can do the same thing 939x does with USBSS, with an
external 3rd party mux instead. This series adds support for that based on
wcd939x code.

Tested with the FSA4480 (with the [1] series) on sm7325-motorola-dubai.

[1]: https://lore.kernel.org/all/20261018225906.1265299-1-val@packett.cool/

Thanks,
~val

---

Val Packett (2):
  ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
  ASoC: codecs: wcd937x: add USB Type-C analog audio mux support

 .../bindings/sound/qcom,wcd937x.yaml          |  15 ++
 sound/soc/codecs/wcd937x.c                    | 151 +++++++++++++++++-
 2 files changed, 163 insertions(+), 3 deletions(-)

-- 
2.55.0

