Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2274C33DEF7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468434; cv=none; b=RRydYbMevsUfnpeIdfVWCUMvuLzGNllC9X9tNIgay4SXFkcL283GKYgR0xm7yrIndaa46Cl9COy2iALz80iZF0/+hPM4ONagSNzOhQFMeW/ohkbxTutdef5vH+t60Bt9UEnI4mbnyIAMoqpGTlHqHE3HPWRkvxxLN1h8mIlnIas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468434; c=relaxed/simple;
	bh=rMBxBiuiDq4omRt4799HznSfkajEM8cXWvJc5zo6Fcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lV/UU6M+a9xiDvwTQdS9ln1aUQsdwikwLSM2/p2OFirOBGXBF45N/ATF5cnkU1BZBweQ6KKSLvNOp4ew8NScblZDoTF/CAKeKKjMUQ84Nu38QU5seYRXVF5N0it9UsL0W8xLIEXDhbFTiNwsGgszh1fK51nUGQqTovIY9/f2Uug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdRFWuia; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdRFWuia"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so19962666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468431; x=1790073231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=;
        b=QdRFWuia39XWvJOOhE9G5ozho//qCq38VCwn8Rfu49EBNeTOZffNJ5fAQZYscu5MpS
         eqr91eL6pBLxPujcjS2fTL/+KXaeKrqHXiCcVTVjLiirD8YachRPaW1jA1onTGHI87ei
         b5eXNiLj2iI7t7unWQ8zFFU/5aNQPequ+/at5Jj0dTr+LvfU0W9S5+gqMQVzG3SWhKmU
         6nBwcrOAa+s8kQxo+lrKXWq3ZovN7CEKSOQQYyXlh9Vc1J2YQU2uSTiXtdcJWnU+XoJA
         A9hHpk6Xvg9YjCe4HaV4v+xPRqpF92beogzUUbKu5CE00aALIWMrGnByszFn+Jlix5k5
         Z/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468431; x=1790073231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f75fQgzk5PMT2bUGTVE35Rs8Li1ghntLsZOgXFHTcEQ=;
        b=tD9Tu3+md1HjzUIb0oK8mec0uyOYTOIHAf4EEG3osL/d/2KJINLyFlSkCOaeOI8Q76
         4Lu8DPO1UsOvGNUDjoZ9trZrNi9d7T1LkwY3Eha8iDZ5EKW/m6Bbqt2vyxfpSPrOR56S
         l3cccvS2rlpSmACwYteoD761ZX0wicmmRjyV6wmkG7AqXyVyKGr1/S4q4B69/M/OHdau
         L2UOJwRtT/okWUMotNukgwMSFSy8V11vPIOsx1uGbl3XlfUejK5WgYBBX/2lO7QyPIoi
         YyarXtTOeZxZoBf8cJgkneVDqyai6QQLsoncP67YQREay/OkO4/9nD40qKNRi5ZFYqf4
         ZpYA==
X-Forwarded-Encrypted: i=1; AKwUvBxrstxOLt1TZW2hcqvCNOwRW//X+RjvEceBCJaz1BP6a3/Je8jAwd/tWG9QZKJwNXOChDLaJW83TxdzM3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kXOnW1yLQIzZDP20CQ+3uoMtyjPRFe8vfeiA/LNwJXE0CjkbLX
	beFZgxwR0N66ihyKAr/ECEhI1Jk7t2JPQiAA2I1hy7qFZ0gz35q/G7sp
X-Gm-Gg: AYBFou3S4PzbifptkA8ySNR66a5Fxrgxb3FgZattoDpJyyA7LCN9UwHEcWFUFaTxQ+y
	Xa17WKV0Rb7KjpHIOXwBoTAiUBxdYCm+D0f47ooiX/V/lvz0GcSdfzY+q13wxX4kwN78fjSdZyP
	MvEqKpZ2xAPTC9ImgEumWNDqxLkrQMU/3fnIqkSdSmUFDsDWpfprt53O9VYUbSo1pqpwSIPN4NR
	5cDnEQkcyTyhgQHRB6KHq14w87HSUKtZKACvN5cQAdVwKxtsuLJhbx2O+FNTgDCdEQ0OtkfuWWR
	SRkqkzEp5e8wK6JxTDlmCfrRUkpXKE/xub3gjrAc2HrMknVPEtJ5bSxspbDwust2auKRxcZeDDc
	Iw7yGmRW4qtrMa6h3sBiKZC/D5FFm8hnKTX8xQgBA1W3z/PRednCPi3Z/nV8WSEEHp4zwNa/5F9
	pko/JNGlkMd8Qr1F/cvQbNDzI60gnnhXQKUpt+M4SNnDS2r+h7DYcjh0k94ZO+PBc4552HEAgYA
	pWwc8HPgnRuUazR19Bke3IiA5u0w+jNTUVuS907MzEZ/9TiqE77rEi8oV8cZqi4kvF21lEe8bvt
	vrrkYK7JzGRpHwgop5Me+9v57lIi+b9OIEE5ikAa9KDXD7AEacAoomEh0+d3ZnAcRK3bJa17Gql
	Yc66lFKubHywM+L7TUVoE52tTdE7eCKQtLvHJTg7a8cdwffY4zFXt9hyg23vZPvdZBXFtsO9d1K
	SZMc2AWaxmvJeUkfydKmP09DRlq3EZImDxYCCd9AJayia1lp3M1gmVaoA2MVh/Ci28hEj5ogkOy
	3WJoS5ELtqmXc9g
X-Received: by 2002:a17:907:6d1d:b0:c29:44b0:1428 with SMTP id a640c23a62f3a-c29d79b8aa1mr40465866b.42.1789468430983;
        Tue, 15 Sep 2026 03:33:50 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:50 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: imx: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 10:33:43 +0000
Message-ID: <20260915103345.1334-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers in the clk subsystem forget to call dont_use_autosuspend()
on teardown or error, causing potential resource leaks. This series adds
the missing calls.

The offending drivers were found using a semantic patch for Coccinelle
I'm working on [1].

[1] https://lore.kernel.org/all/20260915064327.1377-1-joshua.crofts1@gmail.com/

Joshua Crofts (2):
  clk: imx: clk-imx8qxp-lpcg: add missing
    pm_runtime_dont_use_autosuspend()
  clk: imx: scu: add missing pm_runtime_dont_use_autosuspend() call

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 +
 drivers/clk/imx/clk-scu.c          | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.47.3

