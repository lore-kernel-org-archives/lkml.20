Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325380;
	b=u4NtPKZdcpL0hbDUjzDZZzv6+lTUKsqCNxBSmeq9n3iyRAz7tbfcsha2lk/6E+Bn4svo
	 3nL+752TbrPuFyIUWwIzAY0xobnjCgC7KH6GInxRd54ShXs2rUygA6VUkoZPI7B3/bJs7
	 H/DobOg02RpXcsB4LloY6iWuQJ/OcRd4yOY2em4ibypmjvbgWzcywN+Px6USkx0la+RQ3
	 bqqKRsRYACkflQ3kKytUUkGws5Cn1O6VIk5TLpD/8zAxW7pYbqu/kRFoHlkcvzavpP7rD
	 ET73G5yqKip84+osTqsgXZPuO15R4V2aWMluqlnDxloaIQPx3J01b0ouiUogQEsoVDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4jRjHl81EF7Up+etusJDBfF6O2vx8cD/qRLceIcvSnE=;
	b=qQ0PW9/m2xdE2YYfr7+k6nWo11b97KqjDZc28j3QnTLIxRE/kHNMMAtOkp7ZexIV5aoN
	 swQJuRQTfaGltubUJdflz6u4NcDVQ0wxTmpsAYEQvEViQEzPfMxpziUQ84v+X4KOeeSFq
	 OAg0m3qHg7OugdxvWUCFPV6OQoZ2gwA70By3vUAtvXFvkvkX1J8e/mtVK75oXDtZrwTVl
	 8Yb2ZkVSO1XFPz1aPaj55Na5KGPMv1yOoLjcYt0WMHFbJ4O0BZt94O4vAWPHazibczTj7
	 P5d2se17Cpfonl1l9iWmPIPF20Z+zh7w7zVCDPZODj3VFqcuRJ9cOCBgoVN9orLpsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5AEAHyv;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D042F606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D042F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5AEAHyv
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a49a022221so19006701fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794325378; x=1794930178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4jRjHl81EF7Up+etusJDBfF6O2vx8cD/qRLceIcvSnE=;
        b=l5AEAHyv8z+xulJVwemyoKO1nMLJoW+0E/Ca3zvhcOYCWcwLTpnla9Us4ZMoYZhRwt
         7D/Bt7S60gk5MjmfbWwFBma7zl4e+M+3SeYfldkBWxgY+g9v6lgfKF+FfeyoxMsIp17i
         IX+nH54etlVjQl5/and1ir8fTJVCeTVV5MXnQRsjxDf5vW+iKaIqR4uAhRhOWKChdmX+
         Iyntsj6tex8XP0yk5L1n1DblWV7pVcDQ2YEjjhsTrv/VibzeLYiZg1MFsZMMNJXSi3qF
         nA3wkyWxZBeQtkT+OBHdxH3R5nFzWx+LojB6FzA/xmcP0V4jUdPA7Ka8EqIdYoevtyho
         xE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325378; x=1794930178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jRjHl81EF7Up+etusJDBfF6O2vx8cD/qRLceIcvSnE=;
        b=s3Af8LAkUyW/MM6PVcdPgyNLB5EpZs96zXk6cZgD4bTPnrj4To7utZSfog4vIzojud
         Q3M9r2IEblUGBjGO3clJhJmvcTrLMkq+EwVw5MHjjut27ldlTeyLwOJgggMKwHJjI3xn
         3vh9SWBMUIgB9TD5cho3eP/aZsihr0TYHIvo+PrPee+PGUHTXcBNYTSD49giPduCwfuu
         n6jCnVfLUBfhkCmJBE0+x99CsS5M7bInUbcwdECaXlAHseiyZqW+D4IUanB2vP2rqgl6
         EK+Xhu45fPXFIOv8drcSRX+kPjC3cyxduxPJhXlPzlQlCLqa9AYsq+pt5BzDfNy12n59
         5e1Q==
X-Forwarded-Encrypted: i=1; AL+hErHqJoWpZhitHgFRCrJSDBA/TfoLm3r04NLfHfELX2r6Xdz/JiZlAlf6wJJCWtf0oVUvyVknnOwY2rGDvrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RmzaUZlp7OFILsIeE6iRy3EAFMhcU/BPhwrXWSJbNwewsLYSB
	w6gaQ8x8DbM4qWd/qOWU0qHsnUSgam/nCZmcrN7PLwJYOMu6xmYxWnid
X-Gm-Gg: AYBFou2UhKusoLTz8qF14QoQL7TvZLRvDBOJ1wulGaIWRJVNvh1Nv5OkHuIorUF2GXk
	cd0t3S025vZJps3z1Kj+1omnQ0XGzso29nYAB3Fumiwk2ZKIMN/JWyLnXHj9bF5mKhLTc3V0QEe
	+824mrDORokeah6M6vOl1XxRhAcsRrPdtZwoLmWQ0+bP+EVUePfD9Ka6sdCa7tWWOAWuLTLijB4
	JTCissdqB2yxYPb7hqaKq8Q8e4hV4vsW5bbTCI2kR09qHHm4+h3CmS1mzFm5GFMf+oXaPjAbK49
	iF3OLE6TvqOxKiWVXti1rS+V0G2obT0aK5J5OKtvSMHRFHvjNErDyOB12CaEs5dd1ZWcH1QsqZz
	y/AY6qZSyyyRs14lHOzEclz9dhKD6c4fvrZQuL09A+pMGWlbpBT7jwoCQFeNiNwJ0pg8R5J5u6n
	uBt7pxQy55o/IDLvsHCKM455/ZffUqHBzzXBO84++btZBVwSrtHHCl5vhsFXDSKFDpyC5rJFjoe
	GYYhz2a3Na1Vy740VLv6k4NKRAdzgYSis6nIUX9p8/Rjv+a1//DbpqrGObP0/4s3jCGFJ9pfBsk
	4DvKMq2+soNihDCPPE/JMkqMEGzs4xJx3CGReSbQFHbujnEH1lvTmEh+fi7Il13vaSnervL8W0+
	1nliN8pRsomsyhEl2wI0TXVZt01bNvgSvY8N1Kw==
X-Received: by 2002:a2e:a9a5:0:b0:3a7:6d4a:1c9f with SMTP id 38308e7fff4ca-3ae0963162bmr6483001fa.15.1794325377875;
        Tue, 10 Nov 2026 07:42:57 -0800 (PST)
Received: from yantra.. (nekmmqt3kfwnocz4ivv-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:453b:19fe:80e1:2b9b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0923d583sm5751481fa.21.2026.11.10.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:42:57 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 0/2] iio: pressure: dps310: data-ready trigger
Date: Tue, 10 Nov 2026 17:42:52 +0200
Message-ID: <20261110154254.39092-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
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

DPS310 can raise an interrupt on SDO for each new result. Document it
and use it for a data-ready trigger, so triggered captures follow the
measurements and are stamped with the interrupt time.

Tested on a DPS310 breakout (0x77) on a BeagleBone Black with SDO to a
GPIO, level-low and falling-edge: one scan per pressure result at 1 and
8 Hz, gaps steady to 0.15 ms where the handler timestamp moved 1-2 ms.
Without an interrupt nothing changes. Not tested: active high, which
needs SDO strapped low (0x76), and ZTS8032.

If the chip stalls, the case the timeout reset is for, the trigger stops
firing until the buffer is disabled and a read resets the chip.

Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Rupesh Majhi (2):
  dt-bindings: iio: pressure: infineon,dps310: Add interrupts
  iio: pressure: dps310: add a data-ready trigger

 .../iio/pressure/infineon,dps310.yaml         |  10 ++
 drivers/iio/pressure/dps310.c                 | 129 +++++++++++++++++-
 2 files changed, 135 insertions(+), 4 deletions(-)


base-commit: b70566610b48ba49dec636019da4d696db64b085
-- 
2.43.0

