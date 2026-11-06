Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943580;
	b=1VB3e7TXv1vC6mpespJP7gnj6LLaEXPrjYBtuowc5Pre5SlIMVLihVa/PuBjxD5Ym3yS
	 WIxDFs1iATTMJw7POeoxDXB9NlAI7cFvT9rKdrXEn69sG02fA6HarkSY4CY50LjrRbMrc
	 A7ZxDytCmRajMbzoCZ+25vA3chNTw7F33xiXdXYD1/sOOJ9zg+eNg7RnP496ix4joSSQc
	 uoJlnAo+m5hkekzIeGiY6PxPbl6Qp0anPxKzwOQDa6kov6fZPXeNeeuuzj3WIJ37uBn8w
	 mCiLiNukUlGfnM2vxXGATkD8Jhc1A+SHQHjs7+oF07UtfsXDLsg8p1IQmjTz4baAJOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
	b=OUfFWky5F1n5HNvd17UBQEkC0ty9rVPsYiu0PoFM+BEjlqRd0+Hy1EH7vXUx4q0n6N/E
	 zxculH9cWsOWEJuQ7tuSG1BvcTpnNGAJ8Kj9My/UEld0LVHYJ0j00SEPERXQYxM6ZOxYv
	 MGyNNJFlJ+ZYYJLyY8oqvu3Q3ySXvAzvHW7MAfyUTc3aBfjF5Fbo+keSuYmEuXIo3ZNkD
	 8Fp1UGbmUnu/AE8OoyjLk5Ilwbb0AzgvWQGhWXi6TvHprDPqZ0vO92DsEe28hawW8/cGs
	 XR5qPJmuKqTAban8z3mx3khB3w/wF8/CnGNiKV7FYTfeQju51OoZtWVRn+m0i2r4hLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3TdQ2gL;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7DC606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7DC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3TdQ2gL
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-353804b591eso522887eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943579; x=1794548379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
        b=B3TdQ2gL2jHtIo0cI/cj/ubub4s3F3M8j+FQHmsVZ5HYFiR3GBA0tdy+RS25IPtivh
         uuJ8lJaPcEFpzQJ2VdGYIabQH6wSbfMihrkR+I10aKdumRjBNKDsykGTYEcdbUqejEXA
         XMLmV670Y0w1HsC9GjpLVel3jjG6ztsPAgom0XwWNZ1gTBjeAswwf5L0W8AzJe2esbMx
         J7iSLvSD/a23Q7yLm6NFKN+K4TJYWfftBbJn0FBOJvm7w9iKMkURAcQlcxYxgBDwxmIZ
         t5+dNDenB3WwhiWSxsh9PvZIS1tbe8eTuY8wtQds9sE5kZDJpGAKYv5R7Vi7LF3gfdit
         E+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943579; x=1794548379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
        b=2e52HCaRUTqppJABpSLvr6z/GPy5jkWqHT3E08ts85HjJVTXJ3QwHc397x0pa5txMb
         vtmSlPsbvZTog0yr6t/agV6ODlQc2kqioVAMIBz6cX6lTj1JAQGOZ1oalHPFH5JVxoZw
         CIariZqzAOHfTwLs6CC4c/14XwfOWngeYKdDmptayMXNpV/XMQBz0jGngq/4Sr1HaglW
         45hRZUF5+J1tcItD3mUD7ydIDy3pFxBnLhScuRpW2QRqxX2do87H8/bg123Y5O1tLYeX
         2TRQbfOnM1fYPJNTE2zNpJqD0KZDMh629u+SE/TR8q+cW6vyhKNntxFxFMF0RV0pQVLN
         9pkA==
X-Forwarded-Encrypted: i=1; AL+hErFGSCrVB0b9puEj1Yje+3D9s3poGTRy2yI6zhAZVgCLTPUCSxy9OpmY/nsAgh64+id1E023+q30eMhwoTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z80TNyYom7cBGyUuQuxjCLELS/Sieq84I5E2R5/uD3kCRkEvnP6
	FTtWeXA8tFd40plOinrhNhWTiHLAXGt5+NBF7wXbRX6ZDoI1BE0CwjHd
X-Gm-Gg: AYBFou05jPndGVsYCLKGP91gIuak7n3Y8v8cbU4ZnUD7DiXD/eL9Spv8mnrUt+TnGU9
	iUHqclNECHVFNB2dnTX2807q8YcqRY6MGM1+ZOLrAG5gbvapsr1RgDpHYBbphQBPqga25d4ry18
	+9tqCHsgO12koXC+dPfMF0fALg7Ya9QubTwTLwCtzSa2ONvxFpgGTJkiDq0tgKJdPEot4mNbkiF
	CBq0NSwSSpW2a0xNiEoccqGauu8AAl0Wj/1MjwytpQk+IzbC3mybqBFb/ag0iUpZygwwU7sqawi
	3x1Bgr6T+wPoNAWfCb3S33y1cpyGEL4nRaZxHO6/clVg2NrxfIfcheD+NyIW3BATSHJt2alUQ/J
	jqpFhLLjOw2Vk3pu/ytDzUGEdkc/ef9wNVmD5N0T6QXZZ1G7XA7kAWp/p8FZbSZbH+3u6S4hPVt
	YbHnhhqXY9ClTzMt29Bh4XEEbTQQdkp6Mz/32c5lEgkVnGk8ZcDvTr4LRIfgSQI/k1njAuQVI4d
	8QJcRs2g60AlmgZpt15EbOB4NHFfzAXbkl9S8N1Z0X4wgXwiEiIdBod3sZ79uyJLRa1rg10uWOl
	hKBok4TDHtW8UTDThAk+/vuODUp2t8UCkwvRW3JWA4CUO8oFLe/e7jliNHcqLARbShDQ+trWapR
	wnevc4L5QlzXL4mjl4Q==
X-Received: by 2002:a05:7300:ea91:b0:36d:2704:6adf with SMTP id 5a478bee46e88-3700d01f2c8mr152037eec.11.1793943578782;
        Thu, 05 Nov 2026 21:39:38 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:38 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ASoC: arizona: switch to generic device properties and
 clean up
Date: Thu, 05 Nov 2026 21:39:31 -0800
Message-Id: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABNo7WoC/yXMMQ7CMAxA0atUnhspCYKIXqVisIMBMyRVTKuKq
 HcnpeMb/q+gXIQVhq5C4UVUcmpwfQfxhenJRu7N4K2/OGfPBot8c0KDmqOJeCXCgCeiAC2ZCj9
 k/e/G22Gd6c3xsz9g235l6/MLcAAAAA==
X-Change-ID: 20261105-arizona-asoc-ca9bba7a3bb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

This series converts Arizona ASoC drivers to generic device properties
and cleans up dead code and formatting issues:

- Convert audio platform data parsing from OF-only APIs to generic
  device property helpers and drop CONFIG_OF guards across the codec
  drivers.
- Parse device properties unconditionally in the jack detection and codec
  drivers even when platform data is supplied, preserving existing
  channel settings and boolean flags when properties are absent.
- Drop unused hpdet_acc_id and hpdet_acc_id_line fields from struct
  arizona_pdata along with the unreachable HPDET accessory ID logic in
  the jack detection driver.
- Clean up coding style and argument alignment in arizona-jack.c.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      ASoC: arizona: convert audio pdata parsing to generic device properties
      ASoC: arizona: always parse device properties regardless of platform data
      ASoC: arizona: drop unused HPDET accessory ID support
      ASoC: arizona: clean up coding style and formatting

 include/linux/mfd/arizona/pdata.h |  21 ++--
 sound/soc/codecs/arizona-jack.c   | 225 +++++---------------------------------
 sound/soc/codecs/arizona.c        | 121 ++++++++++----------
 sound/soc/codecs/arizona.h        |   8 +-
 sound/soc/codecs/cs47l24.c        |   8 +-
 sound/soc/codecs/wm5102.c         |   8 +-
 sound/soc/codecs/wm5110.c         |   8 +-
 sound/soc/codecs/wm8997.c         |   8 +-
 sound/soc/codecs/wm8998.c         |   8 +-
 9 files changed, 99 insertions(+), 316 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-arizona-asoc-ca9bba7a3bb7

Thanks.

-- 
Dmitry

