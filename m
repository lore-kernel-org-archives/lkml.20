Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566270;
	b=41eGZg0H2c6RgJeqfXhVQU//16mY/mq4iAGZ9/i1YQfr81k/QUQy/lsWCMHkNb0xK/ZP
	 07t67RycOoHUnWU85WVZ7knRbJCcv5h5Zl1kXwQI2gTDaHrCsE6WabCkLEo5QuXvXQqVC
	 1eZR1U2pngENtq1paJYTsZ3eLljjWuDAzOe2CSZGHrDfuldOspT/kxDyqg3J77FoDXgvL
	 idCqPv9mxeHW9LhSyyrR9LT1nNuAxziz7f7IvVLWHPoOOXrgS7O/SA8iVzSsFxYFbJMQg
	 9mnxzS9geMyifp1fDXPGKNPqQs/Haus5tQT2Y5HbQPlheg6qPwSuTAOM8toGjxFyZ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=;
	b=wHDYvbjX+/jHoyzmbGXg1rscF8IO/m9mSIrZ63GTSS5zyqRJZHBp0UiaR5ox2Fq/rxK1
	 ZAAgVpQ0Fr9QItAUBiWBfoSvCU3Rl1MMGyAhchvTpB/K2lqJE5hNw22EfrwQqIuRmmy1o
	 0WK6cV6ZB5rO+og5GpbQpmGkFJ3PF7EO83W9rlEPge5c5bOsO8YMKd/QGMnEMAiGzNvJt
	 bHqoo0WynjLbeIHpcjZuCVJB6TFYQh2UpAy47iYT2QFB/qMzFT2JQQeEmVk9mZSfDD+rV
	 JOIg/qYYvLGAA/71vT/PZs9u7ywKlYwwjyRUi/HccOJzjLHI9ZpfJKq00yPbjMJNctg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Lphmjvs;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F397606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F397606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Lphmjvs
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b6399ebb41so1474818b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566270; x=1795171070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=;
        b=0Lphmjvsr9loP6mt8/CKzEGO52ITAc3bPbxQxcD9q9O/gIDzxKpfjnERU5rU5JOPAy
         K3PYeIrfxUkO+02I5bceCf0m23iw4YQ+d6BxOCQqvfL3wVD/6Iii0bEX/Wj+BFTKW61r
         LHAhfT/lRTMtd0UXuzp4gXTs8WvGTIF76/ILkrzul72UZGyPR7hM63BPtC+XDca15chD
         Q90adJw+XTlaxPDUkwbnzovHtv/7Xnmb7DqWWHJiUtdh0PGu1ukisxVFEsgrSSWh2ghg
         bdmo3W2sY9coGJHS4xCnJS9SB0Ej8wqcWfTmzynzRLgFkg0AYqsRwP2f+knELwB3G42J
         aGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566270; x=1795171070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxRULr6L2s7oj4WrEQj1sjF+5Owee4KxswausHCyuXQ=;
        b=VPs82tstl5gBiRZgDd8wqH/ZFTE+RQeSK0LuThY5tGIUA02EuYPsSAZrBBnBdCKEQQ
         ZLdpHYtxbFoosfScVU9TTo4iJlaDYGRAoZOUMWMcVGmCBGxezA+zh8Rx56bma7JEU7qS
         rNaSQ52oH1cPzTpJeyMIMj3fS5N0AOP/lTbkMsJzgKllCYkDK+gLR5ENj4hL2iXDWWCg
         6l55wDbSzq++jqjg1DQGllPuCdmUNepfNm6+z+6z3g0j7GGw2Waw9EncRz0aHNBUS34H
         +QpwShUazmu6wcSXArWD0rVMOY6ydKbeyu7q5ZcBxBMXt5Gh0e0lTpSC3Zu8X58k5ySa
         UKjA==
X-Forwarded-Encrypted: i=1; AL+hErFc7n2pO/ajaOE90PMRm4lJ9LypL+3ReVQo2tvUCHEeWTmu4+PpTSzPucb13vrxjI4/bgWVZl12tu4HTQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YV+f2bVZitt5VifPu2NNthfdHbUO2bBcSNI//1i3eoV4RcFkE
	7YrDT/N3MFK/GwjPjgf7zoZjr/MHVw01s4q4kVV+FCfkowKEKA7TjBnd
X-Gm-Gg: AYBFou2TnvcGwx9pRkiTNYu5K9bAcQndTLSZVGS6KgWY//zOcwhrzn66s1bu2B/IvJJ
	/4RVq9CCyXkRTxviPp+HoymODjfGnPJc8taDo3sfxl3butZQsbjO2x6pWFb+OG/t+EiWA7tadHS
	bmVs9xg7Ip2zgEogegRmLZLbKKKQFxqW6CvUPwXchqtR8cKvAEaQ0OayH7QPGpSRoDYgbNp7x4o
	WqPGIsTkkMDvswcu6XCeOHNIOj4q5bjLAsty3VX68KiPjpXrscdsSNHlc2E7qlRcppjkOxw9omy
	YyGoR4OatBcTIs4Ojcc4LdUa+3tIm+6FW606Qu2dK//o0zr01Hp6eBslAKtISFoLtGUoi+ykVVm
	+YY+pROv/ITvclyJ8EovztrL0E+G8WL6Qt7yVIsv2VZV6Bm6W19HAKJhYj2s/AgVU765aZH8FIq
	9gUtpVk9GtGb7VZywv2j06u2mx7CQVLCV/Ug8W0fL/5CzPChWvZ1jbkZu+LzbPGEAZbdgsv8hxH
	/KLRUM3PGxWoSbCADh0Jif1glgaqAQxZkqpjCz1ph2HYzSX/pblk++4WFkqgVLjVtA5Egm5yUq0
	kIx4H/g8fah1pBWFUClF+YRotX0TeY+WQYeRPUEOVKIpHNeiR8nJocufy/sezR96AEovg0CDFLL
	S2lkdgqGbn/RiKKXnS2uzeEQl/ob8osSgx8hEO/RDFACOpg==
X-Received: by 2002:a05:6a00:929c:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8beb20cec32mr2220289b3a.7.1794566269836;
        Fri, 13 Nov 2026 02:37:49 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:37:48 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: atmel-classd: Improve clock and probe handling
Date: Fri, 13 Nov 2026 17:37:25 +0700
Message-ID: <20261113103727.30449-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies probe error handling and fixes the 
peripheral clock lifecycle management in the Atmel CLASSD driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel-classd: Simplify probe error handling
  ASoC: atmel-classd: Enable pclk during probe

 sound/soc/atmel/atmel-classd.c | 42 ++++++++++------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

-- 
2.43.0

