Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070545;
	b=mYxi1P0HffeMXfn7jmeduv7H2QrtGoQShs/l/+msdpNM4r7vq7FcrOqN4+Hj7/PoPAmO
	 rpAzWw2zjDGJpk2zDgP19KHbDVRkoPB8uAIPQlTDBGTJDwTO14SWfOSa7TCLCU5xSKuC/
	 p+PocJ5ckNyCZRTHiE1qslV1pZQE1lkIXmN5OTtp2x+yTswtK5tIhQObHGuXXOKrSTAnf
	 ehTdwRJVi6Y5PkpIZvtrbdLl+MqfCCurqp5Ic+hgRAbYNzDEaKftSWuIBfTjHjZVNY6TJ
	 OzSI5/rb4v33KhLyYHeB1l3n0GLKihyB2HGomXV9ooA3gaT+7JGnYdT1FhBAFCCIslw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
	b=xF8CFwJtGjitiBH8Cp5KFLAyLdSJPGOIYV6Eb51v2gG4rayqRHuIU5VmwyhnEKVG6Fs6
	 7cz9WsiIwpZkvzvEAdgR1cQPIL/3NGof2uBbA6Q8oV2UO5RylocQv5a7MH46nR9GIgv6y
	 Zzph4y1O9r1xjXTHmEk9BFbR3uOYffXkrhNXl6L3myrO3GK0Tq+MQF4WNLHwtpExeBpEY
	 iXM8rxRTwzfxRncbTo+bUuULJB/rLATL8oKVNDzMVqZdQLkT31Rx+As9zkj0JWF5R9Zhr
	 TMAkCl/y4acMAbf3HTfrysqaHAZLYtB0/cbRQpq0dZKQLFasZxiCJnHyiLKq+sfqUpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wg29UCVh;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DC3606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DC3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wg29UCVh
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so1304038f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070544; x=1794675344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
        b=Wg29UCVh+UBlf3B5/iQ4dQDcH6B0YEWDgtuaVlQuCBJ+4KK6QIHgNINCiJ1pZQQOWT
         xzysJws0wvE3VF7JMYPT/8s5H1CA/0KwabEitUEZD1Y+gUFxMSjdqOelo5xnpOILrNSF
         /dGWc7U3Jc5aT+HelgqJSTYUBS3Z+kjkokECCgEpS/fVADdzUqtZ9qNmmkEZ7pOM2f/X
         HS0eMIcqeyQEoxzJAQMTtMTnqqGEzmmxkHvfr1IXdfJ/74f8XCTwqWrd1ejq7frglgMt
         jE1ZT6qIFJJgW3lBfOjRLOj+SBQGkylFPp/Lg0fotF84rAktvOpauIMCLLaYif0yZMcm
         gIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070544; x=1794675344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
        b=Bcuy24Vig0o9pGqof9cmtbdRX7gVbOpVSx6drIrLjsjG7z5fg0shr4H5eE4ZQqi9HS
         Gdv1LaZlYsuJU4Z65xaC1zl2TMXeTmPbK//JJGuHaLhn4O1PTjxQ4ks10hE+lxwgXe/R
         TLMVRMf9XI8e6BYRwcnU7KOolx7+VIVQTqYKpnenVHqBGuoDROXQvtMtcHToxJWOLeJL
         yc7jKHblT4JuX+RTdlwwcs4fnfy0IbPTx/PJpO8BW+Cf+/E6AAvvK/+vSSnALCIUOdZr
         SFkWGvEcLw32mwsxrudaCf30xNIdtJTzsvRTqHMQ1eBfry607zPWJphLYtt7URRLLwlt
         u/hw==
X-Forwarded-Encrypted: i=1; AL+hErFdorRMeLD8pr1epV6z0EkJo7UrysvMtjmDtqcq88NiOD5hJOomxeG3U2ZC/9/QDQ9iPze490YEHFsBp/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CarT/cOuvvs5pBh01R6yyv/+6FoLxBgOXZhsxEpNg2DBXnMdf
	Z8DSgusTgYgMhgRf2mopPY5ZvveCmpYE2rsDKyI7CgEJPxRROyYG2n9u
X-Gm-Gg: AYBFou3ZfNkq/ZTRPeibGsVb0WxjIf42rTKR89ymVvO88q/8y+CEZXajYGrCmaUqH2b
	9Llfi28yxi7KXKbGmzJadEq2phk0elDDabXxILiOOjY362DXdFXtkOsLv8CIXYx7DruI1nH2KYZ
	rtBSm9f7+Wtdx/PxPBEyLRJh0l6tv8d80aZmRwi5kw9bCyW61ZFWi67gGCDy6tr4WearqrcxIZh
	T+sIyCC7QRmTwplg94ck++DcFWibrpvAm/BPAZfg/2ccoQ7nTBgHCF+HZx6IqG4ht8/4k9XZJyq
	Hxn9PeViNxvc0fhaR4z3+/GrAy8aJiBBGaWScuvfqRRRP+tNk9cQ1r0TbQTFmCgwBuBPZXMxU2v
	VKej3wNoYnPIqDMd834fr8XySL3BzCWYfzMMijGRv2aXrHcMePJHcAsA5uVrMdpRnbOxCvEcwP7
	JQ5j427AnFmPRw55hLl89Tpa6b6dGFdGahCdy71j0yf1kLqT7NlHyS7OLXLfzOulviUSWXSDgHh
	0G80Tb98zSxGwTrsQc3yTXM17HacGB/f3aLijr7R6h83n/wVbRB0xYCL3us1Mf3ZZPTo72n3+8I
	VXYCdm25hR0WZ8Mf4x8/5zzNMW3GB6sS3Q==
X-Received: by 2002:a5d:5d82:0:b0:48e:6092:dea1 with SMTP id ffacd0b85a97d-49277bb30fcmr10474276f8f.47.1794070543659;
        Sat, 07 Nov 2026 08:55:43 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:43 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
Date: Sat,  7 Nov 2026 17:55:23 +0100
Message-ID: <20261107165527.576383-1-jude.gyimah87@gmail.com>
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

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 4 drivers, so they are here as one series.

Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

Jude Gyimah (4):
  ASoC: meson: aiu: select REGMAP_MMIO
  ASoC: meson: axg-pdm: select REGMAP_MMIO
  ASoC: meson: axg-spdifin: select REGMAP_MMIO
  ASoC: meson: axg-spdifout: select REGMAP_MMIO

 sound/soc/meson/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

