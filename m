Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311600;
	b=45kxX5Etz0trlovGIC+w2Rdf8g8nG6gq0qaoWbKIpwU7T/nHrjhb2emszXf240fwJzb6
	 ci5ctwQEBoZJbr6QJg6EVXuUIu/PFtynhJkIzUhlY/fDkH69g2XVMgmFOaKQcrQEaG648
	 9kG/qziDc+ibrRaCmnQZpjZzBpfIajVoylNsxqAWslc+nPJe9xvNwWhx+qbnoDtBccIOA
	 7QJThLYmvWLdPgilVgX8ttL3kt9zwnXyhig6ADdtrA8+VFN6GCyHQ3BtcLrQM8/6sglcd
	 fPRY8WKVRO239KBuU4w7qzRwmhTLb55Xiswe9Y8pG0KQzrs28KXLrRpttNky/BH5cdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pRlEJMcyxoH1Sz7G/BmKQvoLUKOX5CmF/zOk36T3m/c=;
	b=v04RnbtPUYzL+NcPE5E8v51sU8AErvOOtlGvQaoguaT6FADuL1VkL6nMsEhnjPcS65Pq
	 hYa2E+zB+qRKkvxL41H5pO5c3bKyYJrBsOYAKZuGSMXIVvofkfxMkil4BlxmkWG1T2FRj
	 +i1psWR0H4z4aeypEckfEAGxX+KcLenFmlGmupDcNCMaXsXjtO9x8EVmDETb2uzQ0ZB0c
	 wtYj2a8T5jBPRdPh81/IKsizWsHJO/NMtyn806fY5hZSHSyuFuP8j06DeWec1pMrTFNhv
	 V758e6NxaxkxPDeZ+Rl08XEFA88+lve4Ab2swQnGMUu3BboKnxp/CcAtQTHXDtNBwmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uqDyA+B;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879C0606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879C0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uqDyA+B
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3aae7df0971so1060301fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311599; x=1793916399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRlEJMcyxoH1Sz7G/BmKQvoLUKOX5CmF/zOk36T3m/c=;
        b=0uqDyA+BWerg10l+57wmNs+lI/xBwVdnTCi+ekyMsTTN8mSdtf3VjtlcJLkQBAUFgr
         75xkaRAMMcTvdJpvirT/xnvZHoB27fd3l3y+agHSPw8UmCcfbfqAlyIzTFjNjvBzBm6w
         zgwebkCs7h/KkTgWBSMKI+C4FJPdyq9k3t3CEOF9y44mijPF6WLwjOvhguVQvm4bFRwl
         8/Rye1+vLV/HyB8qr5GGHzktYVv+cFJDf0qQNYZ178UzQN3vqDF9Zlb2nCqmvsE92qzJ
         YUtcYwGfNLgIw7rvH0rubF4g9haF8qZlqDX/z1+pEHNZgKQWv1Y5BEU9KSCOvp89v2QC
         RxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311599; x=1793916399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRlEJMcyxoH1Sz7G/BmKQvoLUKOX5CmF/zOk36T3m/c=;
        b=NUyx+Npj2NsM7DTOvCJ6OGbcESvYuLuBnA7RK1kEY6PIlaWeW/HFf+ytNViFBlzMyc
         UA31c6AOqNdU9pPgeZRApm4dSSQWf3Obysa3HXrz2CWiI+cPe8i8e7FbQT/lJha3bY8B
         ocisGIQolmlPlqR+Tp6yMYjJV4j4JCVP9NTr7Rg1qf4MlCHnDkbAilFJfQ63Ph70Gz9D
         /AK5G8VkKjFxUTuxuJGcrs4GP+Je6mtSUFiP/Z77PGlE8o2bS80zGzvGIx5uQBG1tqLE
         06LJQMRn7t1tAXbJPf75+uEcsork1GAS0tUQ2MbO2xiO6MdwkPR7U1rOI9eUadm5MG8J
         Qvgg==
X-Forwarded-Encrypted: i=1; AKwUvBzbBuGyrWS1cXdPyYT3tO/47gC78s0c0VU3xxDA536kzubVnu+3un64rhovmLuEZxxiA4a3PDRVKex8Fz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv3wASeIrrT51jAktlNkUtNFevAq7MLj/00SPXNAuVPHtSoGGC
	8Hxedvo8BObjjO++ctFTNR9yMoIJFnkIKhQ4LL75r/CBVa7MOhnjtBhrJW3Dk8Bf
X-Gm-Gg: AYBFou3O8rm7nmD3JFweeu5uMzdPxRuuOiQ3xmK3M0YqMLINSUZB8YVK/I0siofoivm
	DYnuYQGhLFbOIP11aJQRra3vtUx3Glwi2GC3AQjm3QEHgJqgHgKe0awNiUvtRSmAt8renFbXU4p
	YL2n/uAUENsdkcdEUtcZBRTpmAl2J1pk/O9qCnqnvm6JfLodTG2Gy+9D+BM6v8BVO25bII58vDz
	G2HNzmy8DF8pOtRQFPa5wvyFmzpz7Ej/k0cpdYaeVKqJA0tLYlKZ25DKmGO8Ag+8kcDA8e+b1vY
	9HaxzJaVBWGumj/xtJZcx4UHGEecM4cBrND287bGfy2L80QpOnq6K/NutuSkVen14lnEHW2fgcs
	+lsaxK/cu7V7OJ5z8uxo5vtNI+Y0k2uyEApAwLLC70rWRDAeFRzw5/WjfykXVvpPsI8l+XiJ3PF
	8Ry8YsRHdReca33m1c5HzxPI+t5AnhCT2riXS4mxhkeADsZlyK9FG7FQuBuLUUO+n7yX2JSdgT+
	OlG2ouyRUWgM2IPfJg8HT8veFwUlALTKGAV3ihJfwX44fbUHWbJtgU5jxZ/t1I2+J3koj2qAr9j
	dU0BD+Nr1x5BxzWfXmowuzA5ltb7O0s/IXy4B7GJjjM7jnpJcEW0CJgtxaNNbXYE++0wCTTC+CC
	G/A4/vek3La1c53a0iH/TSqquZxJxRJwpcSwhig==
X-Received: by 2002:a05:6512:6193:b0:5bf:b237:8161 with SMTP id 2adb3069b0e04-5bfd95632b1mr85554e87.10.1793311598452;
        Thu, 29 Oct 2026 15:06:38 -0700 (PDT)
Received: from yantra.. (nekmmqtmquaao4qwdoc-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:6842:e549:8c95:f73c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd9c507adsm9605e87.65.2026.10.29.15.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:06:37 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rupesh Majhi <zoone.rupert@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 0/3] iio: pressure: dps310: fix input checks and resets
Date: Fri, 30 Oct 2026 00:06:32 +0200
Message-ID: <20261029220635.18816-1-zoone.rupert@gmail.com>
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

Sashiko flagged these as pre-existing in its review of the FIFO series
v8 [1]. All three reproduce on a DPS310 on a BeagleBone Black:

- 0 or 0.5 written to a rate or ratio is accepted. Ratio 0 puts a
  reserved value in the register: pressure reads fail with -ERANGE,
  temperature reads 974 C.
- A warm reboot during a FIFO capture leaves FIFO_EN set. After it,
  every raw read times out until the driver is unbound.
- The reset after a read timeout silently puts the rate and ratio back
  to their defaults.

Patch 2 fixes a commit that is only in iio testing so far.

Paulius, patch 2 also resets the ZTS8032 at probe, the same reset that
remove already does. A Tested-by would be welcome if you have time.

Based on iio testing. Reproduced and fixed with help from an LLM coding
assistant.

[1] https://sashiko.dev/#/patchset/20260921183132.233136-1-zoone.rupert%40gmail.com

Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Rupesh Majhi (3):
  iio: pressure: dps310: reject a zero rate or oversampling ratio
  iio: pressure: dps310: reset the chip at probe
  iio: pressure: dps310: keep the user's settings across a timeout reset

 drivers/iio/pressure/dps310.c | 38 ++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)


base-commit: 7d80b4b383bc53b48abd3a30ca4a91cdab568bfa
-- 
2.43.0

