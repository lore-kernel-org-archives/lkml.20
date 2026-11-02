Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634865;
	b=XmCBGpQyMRliy2YvFn6g7NwFSLAWlBBRzDU7JbEath4qdZo9m3yagW8cYdzuARQOKrB6
	 BXhQHeXQeGvS13Kw3LMyMlFGDDu2TljcuKPn6E9SGBYgIDs4a8IrH4R/RT1AiZHhyTAWi
	 UdRrGHJIJes+uncehUO9tOXK+0c5numDM1I9KXBL8pV21Nx5wB25G95C3kOPGML/U2LbL
	 mc4bQvJfg0Jskep60O1Q+Ebc10tJPIBggUMvD5RZSNqSaI/hB/qlgDt3sNYsVWqViNOEd
	 qBTA36E48QULx11VddTooEQwptht2rvtZikCParonz3EzfmKIHrLXjGkDOfxROUb0Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=xnOa3ZtGPyqMrk1+fNJbiWllN3BMewNZtqbMjDkqfXo=;
	b=m5i6Gwh5qG1BgwlTPlTjdbbz1ncpTHxUaQ6daIcPLytYPxeLD55nQYm73976a52IJoy+
	 iMBrOnLOsU9FWKcTbz+KMNwKY4kbYrgqmAwVQCXUdBcSYYR+eedrzwk1U0++tUwu2RdFg
	 8JLIbNLcWtRtRkOncxRMtEyyLxYY4Noh5FZw2+RnbGz/2EtR+afuQzEF+c7pEySZX18Xi
	 SX8nPy07hdo6PUdPQVN49tcPe8m9nj8eJSAT8FeknwzePz9M8kGAAsa/IsnWDcPz5ZZui
	 wmz31UluU1cvrn6cVesPiXrG+aZHH4j0mIUY/CjKH0qsiE9MDJd1xT+3XdC/9sjujfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dkZP3Ukk;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63930606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63930606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dkZP3Ukk
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so30620755e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793634863; x=1794239663; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xnOa3ZtGPyqMrk1+fNJbiWllN3BMewNZtqbMjDkqfXo=;
        b=dkZP3Ukk+vzx8LFWtabeKpWGtZgKGIxQkBbFM7Xuy/TJbgzvqPE+so3CIkEhmTTPHm
         5GR18R1mOwULdx6b1F2TuqiK+22VNEIIboec9bObNyGNRGT+0Xrx8VdXFYkUSTwLYSY1
         P/4C++yjyR3Oa4DOE3kGwn6PSzVI+JfGK7mJOufvuPDpl8JySsNcEjmpY4PPNe+wFq7C
         hHYGXCUjPnLKXRxSBZ+cqYr7M5FDf1f3B+xMm2eK4NPPoba/AhWApoo3RXAJ3qlCXZKq
         Pmu0kwxuwcRvogYOQUisMYPfojoGp2+PMNRONeay1eDVaJw+nCoHH9OvRuhDbP6FvxBs
         kHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634863; x=1794239663;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xnOa3ZtGPyqMrk1+fNJbiWllN3BMewNZtqbMjDkqfXo=;
        b=2MN67QEYI3SS8ZZeWW0Gnr9qXlV7Vt5hF93c1aRYqABO49AZai8tyIyIQboFNt97te
         +LnrnxRMx+7GFxl5UEbDDqMjaHtYwBOMcpcPOM9YOjHlZxVDznyMgjBC7fGk7MNwIn2+
         psHgEDJ22hQgCONp6FsXjYOSDV0I3kk2uBenAP1beacsxzSu3N80wesNBuoNcENNgQ9I
         1RsgIlAfxvwQRziwCqGqnyWvL8rq2JeA6CTeRe9Y96xeuaTO4zft4ISFrfhBWm4j6XNC
         xQTkCVmb77E0LKHqxK9NL9Dlett075pICJPTguv5itJ6z7CwG8huuqkecSx42NgGndz2
         OWxA==
X-Gm-Message-State: AFq9FYKCiKQekclbSrqdEQwzvxXGElx+a+F4CMW9QYQU6/4dqK3YEmhW
	/6wDL4OVqGZXG+qUmH85B2pCxoMxmAAzDiAOjuTQkE6N/W+W6BV8xdxlsotR2ZsZsKYB4ple4Oj
	/5d7Y
X-Gm-Gg: AYBFou0xcvBzWWjVrQk93mR7HDqXKoVT7/TXOr1GWDJFvgdQQw0sLE90K5dTv25U0uX
	ibc5/wh3VppvA+l9meTweInjsjSyFUVhSDwzCvtU8I3d/sH2L17W68f0sQV8IwPMY7sOx4wrZal
	St+ndqEQmVaX5Bwx45O3N+qEPHpRepSfGKyAELdvgiAkceO7zFUumG33PI24rQEflUdpgqmnV/1
	xoI4txB+3WdhU8Ol60cTXLKsy9rEHnfm7UNI+CQmDPsHsDaVyOeD6tjDVHErt64LAXD5OPQZvBU
	VrOunqF//MRuQ/cyzgx4Y/ZnjSkoXFMrq15Dn4o7EmMwD0E93CjqnF6ZdRivYtfj9S2CaENEYbe
	BOCSzdZBX9D/BAl246hXQQ6qZR2A6f0E844Xrb3Qeuy7TAQV/ZfmogSz9PAUY8fbCuPAzdbyEL4
	lEu+nWPbduJuG1/8yas8nRDO/yckxGw0LkeuvrAnhD1S9kC/cy/ljSq5EqUc1cAXdxTXt6AL2tW
	C5IzlnMuGqjy48B7jANn1TQCukNAS0gtWuCQnGNZQYbVFRvPCZ4/PCjn2FzpJ75lUeQBIRTcYPP
	K7SjJG1txfzaJfMgP6CPziu1zv9s4onxI8Pnn7BsMzRWjHgF7vp1oeRr
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4ac17ffb07cmr236421765e9.8.1793634862845;
        Mon, 02 Nov 2026 07:54:22 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm21229288f8f.51.2026.11.02.07.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:22 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] regulator: mt6363: Fix register access and VEMC
 voltage handling
Date: Mon, 02 Nov 2026 15:54:16 +0000
Message-Id: <20261102-rgp-67-mt6363-regulator-fixes-v1-0-420789a3113e@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIACiy6GoC/y2Nyw6CMBBFf4XM2iYwhRb9FcNi2g5YIw/bYkwI/
 24Vlyf35pwNIgfPES7FBoFfPvp5ylCdCrA3mgYW3mUGLFFVJZYiDItQWoxJSSVF4GF9UJqD6P2
 bozDsZKOJbI0WsmMJ/Buy4todHFdzZ5u+0v8j8HPN4XTcwFBkYedx9OlSWNcbJsttg+7MGk0tG
 XMCWeqeMknCVqsaun3/AL0Vqb7NAAAA
X-Change-ID: 20261020-rgp-67-mt6363-regulator-fixes-bed357aac42c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?GIBEOM_LEE_=28=EC=9D=B4=EA=B8=B0=EB=B2=94=29?= <rtx4060@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0

Testing the MT6363 regulator driver showed:
 - the VEMC (UFS VCC) voltage reported as 1.25 V while the PMIC is
   programmed to 2.55 V
 - regmap debugfs showing each register merged with the next one

Reading the code with the datasheet showed more problems:
 - a VEMC voltage change to the misreported value is skipped while
   VEMC is enabled
 - disabling VS2 or a VBUCK rail also clears the enable bits of VS1,
   VS3 and three VSRAM rails
 - the BUCK and TMA key writes also overwrite the two registers after
   each key
 - with hardware trap 1, VEMC voltage changes are not applied and the
   voltage is misreported

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      regulator: mt6363: Use 8-bit register values
      regulator: mt6363: Fix VEMC voltage selection

 drivers/regulator/mt6363-regulator.c       | 131 +++++++++--------------------
 include/linux/regulator/mt6363-regulator.h |   1 +
 2 files changed, 39 insertions(+), 93 deletions(-)
---
base-commit: cdfbeace852d9e72b43e23572e37fab433a28764
change-id: 20261020-rgp-67-mt6363-regulator-fixes-bed357aac42c

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>

