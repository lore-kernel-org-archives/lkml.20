Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACF53BA225
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476756; cv=none; b=JbqOeDqXOdaZ3zYl051d2IuDEQX9OveB444pHvC7wHBFpQSgbzdnPaUu0D8++vSVQoU4YseI9YU6oIdwnY8ib+cwf7w6UThKvMr0QF6hkUFnsQKBkY09jxlgkcrKa8c9Uapj+We8fm1PnoDhVokmXWswqBXh37sUL3LoNvfTc94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476756; c=relaxed/simple;
	bh=7t0Ob9QL+Lqj43veSyZ1VQ/kSUPHAcWqtSh+yfu47sM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dhgLeoK/m6d35sWOjba+TltdMgtTA4dyaDcJw9egOUBtVSwPiYOKdHXUVElj5iWZNskvtoObubEOUMK3eoefKRzu35ZcCt1DEIbchvRFT0HXGxtH1tD/ExIke7UXtDlIGhZj1IBhN5JybXjnUEUQ9G2MY+4WVS4a2ZL9d6XO4vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7Dr3foY; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7Dr3foY"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so743486066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476753; x=1790081553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMhbkaK56jStijIJwruuJ1OSsbc7L9grsNYLwWglYKA=;
        b=e7Dr3foYNUiVKDtNfkO1Jjpqy75RXD9879XNYDTVRebzR6WkMxaGOlwjyLgXcrWwZL
         aIeaFiA/S+mE6Xfe+0SHz+u+x5rds7bFpOeQtjGyf+R7yMLXjA3zGwaR0lnYrBPbP5hl
         caQ52KaV1C/rThNHiU4JsApOPmvlR7YIPLnRRV/WJuN10dYimIqUvjzM3Fd33dDFT5RD
         Z3BXQrONJtWatFbNbilT3+o8MvyThqMdVsGQT9YFBWshwKf5zs24shvbyypTDZCOTbz6
         3PZEsTrF6y/iGb72h2XPfyEXgKSAjWIaq9x6ltdFRIXSVOGvW9j1UYly7fCw6aFFalYK
         g+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476753; x=1790081553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mMhbkaK56jStijIJwruuJ1OSsbc7L9grsNYLwWglYKA=;
        b=OcQiG+DDU0hgWwjdij4zFlHfIKamzlS2QtEQjtDQQkZ2JY6OBN8MFAyYuMUsJYNjAB
         aSa5SaKtClt1O7sPmvCs9K7PHZIKneabc2FGNWn2A/kegXlDWerVZnvDc8AaeiMZ9wHR
         aR8+eICY7gBQ5kfYa80+IgnkjzdEKkLi3tim5sj6XpV1blUqdbFU27/L0GG8/xESOBJb
         kvTR3n+OLrZOYWhiTNhgdIrIPbPAyHBTsyfNWLcjIUnHnScjBMamd/NWd3BfcKM+i1Ci
         uWuyTbrv6RIuQVzs7Pg2V9elnV6KMvSd+CuR7RLpfqh4KjKA1BM6RoqNNNP+r6ALMKy7
         JeKg==
X-Forwarded-Encrypted: i=1; AKwUvBxF1mrtPkQ2Dt3Rjm5Jeel2Gdi/v4q7b0a+auKmYXVgDsUD4r6P0cN0L9V14Ze1e0b+Wr5Gu2edMljJwmI=@vger.kernel.org
X-Gm-Message-State: AFuF++mWz8ShkhXp6L927kTVbTICrX47X5lo3QJRyZeBk3Da+qHNG2Xv
	8EszyOAAp2X0RJ74c2u994J/FwnQpR5oFZHpf59k2cWZWfbSz9Qs83+4
X-Gm-Gg: AYBFou0DLSMCf7uzZPwej8U2zdtcUBRHac9xUJ2qpIYI+SBk8hKNvObidYFq9W1bgwy
	zY7TGjlO5+rEwohqv8jf2r28jDSU0srRJpTQ8gAVqfAvK0P1ZpbjrBb6GZoH9EMLi2JiJkFROPx
	3ByRmFEKS9Ratkivu0DyBuotoyJ2LKosOvu+e1LBZOyRzUq1KZLSpgQlcrVAugE1jRUalp9OI1J
	c+DHXXVoDmm90u6wPCwer0eGpvlUPflTgoTXxt5wognUgWGrAUvF7hkBG+Qy0oWo+BO8DLFHL79
	YUcTwjDTGe62wjTvBZg85lFrJeWrFrF0pD8b42P8DzdlqqbRrJ8aoxzVBEz4jR702UFjcQcma1W
	4CoaQU/JucprRC5TWKiUhyitkXLZlJiqXwZS4nxcR1PPBuP++44rRBQSl7PE8EfXxvvvqtI3rRf
	t5ZTa+YwUXyzdyiJXcHwnpnE4ax4RfbgJFy5fUOwA/2LKyNYd8O0mgWb5CgM72A3yiFnF0zphS4
	KJ7gYxALRyM9rEi22/t5xAB8OjMePVUqd685E3o7PNducmgsGOz1eTw0h1CA6ez
X-Received: by 2002:a17:906:c103:b0:c29:4357:2321 with SMTP id a640c23a62f3a-c29b8600014mr462144366b.1.1789476752775;
        Tue, 15 Sep 2026 05:52:32 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c296605b9a6sm587969266b.25.2026.09.15.05.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:52:32 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
Date: Tue, 15 Sep 2026 14:52:22 +0200
Message-ID: <20260915125226.20579-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series is a split from the Airoha AN7581 USB PHY series [1].

[1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/

Changes v2:
- Rebase on top of linux-next
- Add review tag for Documentation patch

Changes v10 (from previous series):
- Rework if condition and reject #phy-cells for
  econet,en751221-scu compatible.

Christian Marangi (2):
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  clk: en7523: Add support for selecting the Serdes port in SCU

 .../bindings/clock/airoha,en7523-scu.yaml     |  24 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-en7523.c                      | 218 +++++++++++++++++-
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 4 files changed, 248 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

