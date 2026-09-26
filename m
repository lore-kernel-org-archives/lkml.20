Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7A440BCAD
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421253; cv=none; b=p/Qk2SfpsMy969WhC8UrkgvKeuU9EfXoagEEE2urvm5uPrxfJwH32PmPlsBsAEO1sHmlFmmeLA/HFJkNbmfX3g4ErVlItJJYmyeOILGMtX0JqxRp7yyoo15OcEDzqwCWkY5gGFwdgRZFaP8fGT6EEy/UjEcxx3u/iQHl4Wis0Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421253; c=relaxed/simple;
	bh=uPv4UccyYGYp+w04C3ZFpYtLkpdFjjqd9/HVJyKUkm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dpcfwWsXWflqBczxqs3olrB4aQ/C091BQ/oywxeePuxVjMV1dkmpB0zwbJibSjnf1dZK5w+o/rMqx8PemxMMBQ1v1FzquUhop81AUwvF7jI+U1Z6U8MAeW5hXxOpJ5kYQwB45YmoTPpTs9xibotCVFM/DGj8NeOp46tEp5DDfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QezUhmK0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QezUhmK0"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd77300825so9634185ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421252; x=1791026052; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=99nH7QFts5v2NXRQt1KjX/jXCkzUNSZrFGih2W857gE=;
        b=QezUhmK0fzBUsEMn3Jv9qb53l0hf2p/4abU3leGtJ0qizYWTuOt2xPLeRPDXbI4prb
         JCsq81bdX2NtVIp4XNPTMPyNpB6pe+b3+q283I4W7zoKtUXp4zruo+0BmslPszEmhUsM
         ULZIiDyWPtggND4+19EbS4mOyolAaTIhn1AGzqcTZz/vUqgQuDTpUUGAuiJ2jXh5uHHw
         FCb+H3Ak09TL6wt90pq49Tkf/7Lp+vP72wKHI1inc+J56VO9RuLWJ0dZLQWIdD1bNtOI
         QAzXpJcpS6yRm4QrW+NrKREO+xhjBjqTZv29I2NtShvlLH2Qma2XTkerwJH1q/zfW6Fl
         8GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421252; x=1791026052;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=99nH7QFts5v2NXRQt1KjX/jXCkzUNSZrFGih2W857gE=;
        b=RKpQUDss4SGvLGTGCvjYWgGaxlLXs9tzNU1SRJCGBy1VtpqbC3NEa0QJLI4ySjGzsY
         YOuy7tRLkEXbhFzupt/2/D8vPaDc0elmmayCYdxRqU2LaCVLQVTWBNggbbTy7nEWc9kr
         EsorQfjQQvU0/JGALPVBlv7z4lmcx6Ax27kwDQ6RESKjRQqhoX291SCP/3/hlUxyq3AR
         6bQDnBp6NnGaTByH8YQ/+OjSUgdjRqLci1S2j7u2aKHOeatHfUj7s1pS1UW2xh575Fpd
         MYDu3VIAu9uSIaDRpQUv/DUWK327KMf0F5BU//brdY1X3Qwd85MSjVhYT2WgbxWvCMHl
         FmPA==
X-Forwarded-Encrypted: i=1; AKwUvBxsa12ZjkKdrHoNKCekzlJwRhtkII6zU8UkJpuAT2PJeLsDC2er2UJS3HJ3XSV6H4cYGjmOKNjgepFtzl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+viHfKqG8unN0vqfRfj0RIamBOqPh7J4ii95lP2niX+CpllSx
	EV8incW1/5ShBEFpgMmI6Vw8HcOzcKBIfKULwsKvzkXf1fv8+g4ZUfCfzW8fSomw
X-Gm-Gg: AYBFou3y+wxHRt/PeLjlAFX6aJuyTKUvIfjPcNxrDy3hS0+tfrjyHdL9nlK/kmYGT7h
	onNXcPfPNCZL87qPHvjX6thiHCHYnbvcx9GBppwuHPlNgfbTw+W8GK3RySb6rCwENUqt8IuCdys
	fbcaNxlHX4r+t+dnw9+KmN7N4hfDbEJLY1fy82NQnJ8EFxWAaNklTQCJbdjrtWbbOg9s20ydEeK
	js5kPv/NWJ5Hrx0dQMp4QeRPC6F5kl2fyW97Crn8Vt51OE4U2TjPNSvRkgbiu0on5MKGxr8aL0W
	aTL0Z8kljyI4x6STy7OyEznky3ijTrQNtbr2ILZtVw04zl6bnPixj4nxN1/OtHXqoV+T17xddKd
	4JaUZvAIZNv/VTIzLw5LpmCp6q0qv3LJzJ5wqxV58AixkBdj3hk/RqFTr6D5v4grarNCfTXdkEg
	2EJkKx+WjrBBQ/ivkWO/HOwvYUOlIjRyMNm2SDiZOMOyntYFGhWkwu4rP7Zs9XPOMOUxHfs4cId
	AVIaR9cR8+nUVSkI8dG
X-Received: by 2002:a17:902:d582:b0:2df:98b4:c294 with SMTP id d9443c01a7336-2df98b4cb7fmr28618195ad.61.1790421251744;
        Sat, 26 Sep 2026 04:14:11 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:10 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/3] Add MT7629 TOPRGU reset support
Date: Sat, 26 Sep 2026 19:13:58 +0800
Message-Id: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBA0auQWTsRq7bBqxgXbRlgEilkppgmh
 LtbXb7F/zsoCZPCo9lB6MPKS6q4nBqIk08jIffVYFpj285YDDecs7Omw7ysMm54jWEwzrsY7z3
 UbBUauPyXz1d18EoYxKc4/UZvTlvBRCWfZ6+ZBI7jC/yFE+yGAAAA
X-Change-ID: 20260926-b4-mt7629-toprgu-3cbf27a7cc5d
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Define all seven subsystem reset IDs documented in the MT7629 TOPRGU
SWSYSRST register and expose the reset controller in mt7629.dtsi.

Add MT7629 watchdog match data to cover reset IDs through bit 12. The
MT6589 fallback only allows IDs 0 through 11, leaving the CONN_MCU
reset inaccessible.

---
Chuanhong Guo (3):
      dt-bindings: reset: mediatek: add MT7629 TOPRGU reset indices
      watchdog: mediatek: add MT7629 reset controller support
      ARM: dts: mediatek: expose the MT7629 TOPRGU reset controller

 arch/arm/boot/dts/mediatek/mt7629.dtsi    | 1 +
 drivers/watchdog/mtk_wdt.c                | 6 ++++++
 include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
 3 files changed, 16 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-toprgu-3cbf27a7cc5d

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

