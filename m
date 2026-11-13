Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546479;
	b=02taUaAxc21wRMEUZWzrFvoRuo9hT0Z3X99/WXEa26tFaxmLUHuFtTkwF2cD91U6TkGE
	 S29urvw1l8H7mzP2JYXUY16y1ISu+TgT1GFa8MK1vZwYdoY+ZairHG2QnaIhOu+KpnkTb
	 OJBVa4uf/CsVYgfIVMR0cCB9GIJt83KwaFZKAAyYLQwj859E2488I7igoTLU7JnI/59w/
	 pCbqq0ci4JDN8Dg5Q/5VgORbojU/23b01uaT858m4xb1NCm9C1LjUtu7OE7NQisu5qm+e
	 zBu6sil8ECk95SyAJUyW5gyewTNY4bkq03ne4VJ/pIq/8AQskSGc+x6HoiT1hlXV10A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W2Yp9Za6L9hqRc0w40QLKrtVSVZ2CNI9cglsNjGbvpA=;
	b=eoyjT7vDd631rNPicY/PJMK27kV4OSpA9wPv2BJLyge/zDBmhrA52IRHBpndPWnU47iA
	 fRM0wv1VyG+seeNar8jBvaGwvWRAhDy/iEs49HCBLD87/65l925fcNdwkIoUrloCFCGNR
	 5oAOTx1pIWJtKN1vGyujj5PkOP04sP6cEBaVHxTZ6VZ3O9F7oDSGA/T/TWvWZNILlRwVI
	 rkCXvlWHlF9HApiDHSpSd1lfPb4BPz+20v8RreUG1uMgdV0SblqAlNSfIa6tlX/nlYfzj
	 QCxgzDs3PIHC9L/otNXwB2QTilzhAMETvqKsAQSP5TuBdKhnapoujBxbWOrJlEpPqkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISwb+DzL;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5C606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E5C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISwb+DzL
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed06b725fdso11904545ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546478; x=1795151278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2Yp9Za6L9hqRc0w40QLKrtVSVZ2CNI9cglsNjGbvpA=;
        b=ISwb+DzLyEuCNr+1kReUrfZE6bN/JMey2seUdZy/T6q82QDdE50nkrshvbU8t7Z6VH
         4RuX34WAhu/YCsOzGp1RORwqe5NGypbf9Xdm58uZP1WafrJUKM3zz3OxOjdvFetDuAr1
         P+/0kj68+k+dg3cYW2Dzj5Bot1IwQk2odxKpDpvvHyLn9CtsGJwbu1tTmtriRnKJhgTL
         p0Fo0L86R7uvxlSB/ytc1RFQ85xKu8MlgZwvSOprI5Xoeto7s8i81fCqPkpP3fPyUw5D
         Qk5k/vXQDxOgp8UIF2R6nS7ZZjkvOldzpQCu6RGyHlEcMw1fXpWKUtM54ZrWzf+Z6G7N
         GbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546478; x=1795151278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2Yp9Za6L9hqRc0w40QLKrtVSVZ2CNI9cglsNjGbvpA=;
        b=PP2dqG4QwgHH4FBv+655ccYOP5amgvCXjI8zLcsw4y9MlO24yDoyBXQLYSK+u1KaLo
         Ett/HydJJN+2+BiLL2n6CXVjrFde0iUmECEsh10BfO720lXVKOZSDlYdg2zwE4uJCKOu
         tBAh3TgD2xNEqhseMqF2UvolcburnHivRreFo+tQ1k0zjoZ370aEIBobJ1wpH9RIGTUD
         HQiTymi+ashlWvLpy9EwudqCYoDa0NudyD6c70U43jveYVuXDwy4wBYt28tgGNgc/cFW
         amUguaoUojyjmopEsllbIGypkxvQn9wNoDmXX194o+Qhn/qhCdzBpm0JCCLCx5FH0DJz
         yCAw==
X-Forwarded-Encrypted: i=1; AL+hErGC2N+HbzDDz0J36dl+Sh4AP42lsjOohJPpX5iMSH20qTo371TQxmF9R7WC3haTywtxphsJpmD+PMOFABs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kujmr1CnZT5EqpXOOwMxKtEhuMjkW29ropOPgsQi2VTTZzET4
	Bz7btD+/lPQ4d559f4C1O7cAJrmtA/+B9cyjCBD7rCkACyH8os2rAM7+
X-Gm-Gg: AYBFou0x3USdtPasbEOSuXjzcCTEr/Kmg74c9hSslEciL/dDLeD6ptMBdPcQT2T7/ep
	PPX6/2SheXXI3fQOd/WSQnnQeTAO+arj/8goLkMmiC/SrO8VDrNOVlIVtSdIaosuX6Wfdd8adKd
	D0l0gHC2ab6hCRNcDJ1ETRDoFCvkcuE1iJfXyZjFe1eQihn7oYurI7zwksI9bgkjCG+KVhDGKBE
	SQXV7eYnop/Vuqyx+MLu8FFNAdpd041WUuICyTT6vqYsF+FFlv1WBqH4rZDCj8WPbZDSeE0oCGQ
	o1/SSFNXWGqWkEqIAdtG9dI0LmaCgdoPihJ+vtiAvZ5PWxEvQPZCGmhU3479GE8J76f745RpiPe
	FlxDtah2JZ2FtGk6pzxE5kuXsE85LN+gNQIaal9hQuuvvWfYQ2Gg6u8fMR+ltsvhCJx7VGr+Kr3
	Fml6EAmvXIm0wlaTn6v9UbWqVxHrvqMuKUMBLuWm3Q6olQt6ItRTEaf6MKNL7hXUOvxjsyXZWK7
	rKmW0fJqlui/O5T4Bm5WA823FL7J5Pdm0G04XM3PynploGLu5z/k2taCgAIP1q+c4rmRqEAuTnU
	8g6KgKYdqWDeSc5d5Cfw9sIOC0te1ySS4ok/FnIpIAG5/dI3eSexd40WN8Px49jrqXNZgdTRAAD
	FpaEMPd/2p7Wi+7s/7nXZF474tPX+fsKcZIai3Tap5hKI
X-Received: by 2002:a17:90a:d60e:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3b1b0d7622bmr689241a91.40.1794546477658;
        Thu, 12 Nov 2026 21:07:57 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:07:56 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/6] ASoC: fsl_asrc: Fix probe and resource management issues
Date: Fri, 13 Nov 2026 12:07:21 +0700
Message-ID: <20261113050727.14053-1-phucduc.bui@gmail.com>
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

This series improves error handling and resource management in
the fsl_asrc probe function. It fixes deferred clock handling and
runtime PM usage count, ensures the IRQ is requested after device
initialization, and moves runtime PM cleanup to devm.

Link v1: 
https://lore.kernel.org/all/20261112105116.32274-1-phucduc.bui@gmail.com/

Change in v2:
 - Update the commit based on Sashiko's review.
 - Add handling for CONFIG_PM being disabled.
 - Add a patch to use devm for M2M cleanup.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (6):
  ASoC: fsl_asrc: Improve probe error handling
  ASoC: fsl_asrc: Fix handling of deferred spba clock
  ASoC: fsl_asrc: Fix runtime PM usage count on init failure
  ASoC: fsl_asrc: Request the IRQ after the device is initialized
  ASoC: fsl_asrc: Use devm for runtime PM cleanup
  ASoC: fsl_asrc: Use devm for m2m cleanup

 sound/soc/fsl/fsl_asrc.c | 113 +++++++++++++++++++++------------------
 1 file changed, 62 insertions(+), 51 deletions(-)

-- 
2.43.0

