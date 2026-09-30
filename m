Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E14BFE8C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766948; cv=none; b=oSTXsoaMkNPW6pnh0mDxdbkcg190HZvqwa4579oDg6WtwONO9x+BI0U82EJGDpv5lzExN9zkb77j4WlEWM49bn4LR+XrhBzw6G5YIM24DXDQB64SsPCMH3Nl+mdCC2z0qCnCBe4H0UeAPPh0bYThPSvNU/pOtR/8554vqZ7nBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766948; c=relaxed/simple;
	bh=m+Q/tTI/o+BXkDEq3cC5VVOnKy49NTSPbpCX8x4nXpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V84okw2+eLLIg8x7BTxFev/yhIck/kaaiSRwPRAUX1wXsXToMGRiuYx8WQalKfAd0keF+zX8YkOtBRIrUjnJlo7doNqtbBJqMo2gxJH3IN8HuJc9xtgJGH2+1T5AQE1rmF+F6lnoFtAsQt0cph25OsT6+uuH68kJjd/Ic75Xgks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlQd9Kh/; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlQd9Kh/"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87c90648f99so3745633b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766946; x=1791371746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DoxbblakwndhV2e20T3viBaOX6/YMFCmPPHjeeAjYNw=;
        b=nlQd9Kh/X0vcqwvSELisMZy3wNNT3nJCDMQw4tbb8ObgJvtjlaoFYMkZQxM/xQL0AR
         XPNYfGb9c3lLMndAST/eTznAMgZAMpb+dP+eKzjAAVbSCtKWWBPmkYmwsfBHtXW/eM5O
         7KYYqRkAzzh5WOWF0q4jQ8MV5Tpya1tzocdMqz92C8nTGf8fFY+xaLC6biPifP87T8L/
         wxXqbbSOEvowWQXZTe9yJFX34Dm3YLkOdxdq8At8G5cMw0/v0attv6Wu4xf/iht5cdmT
         ccO/N4gWgn5e2H6Vo+GzcxKlHEJCLzNxMdJUA/toz9Sr9GfnkzI7kQlkx9wwoNx/06DP
         IQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766946; x=1791371746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoxbblakwndhV2e20T3viBaOX6/YMFCmPPHjeeAjYNw=;
        b=JYt1nd1cRR3+yM1HlG0hH78XSabDGuDlY3esNi2ZC+ng4raQOx8Tn82DtrLLbQmyEZ
         kNBGJtRyZr9Sn/BRLxTQPo68Kx03iWO9Ewh6HHBa+FwncANLkSg1o8y0DwJ5Vlb1rP4d
         ZbQ44UlUm7x+xvuoNfifuH5HGG4LgoO8vDBi04upOhSTlrF5lSbFS16cfcriCo0ysD6K
         7EkIDzTvyDUsXdApvM71TBWW3rpeWAgUXcyX1iRVP8GrtCMZDNop1Xr1kZSwvKaZONZF
         Ma/qwWFcE/f2B2muWIniaEzLDjLO8SpFkjm2VXE3Iujb0pJM5brx0X5ODC+d2ZUpqTIX
         7Suw==
X-Forwarded-Encrypted: i=1; AKwUvBx6CMprgi2+P/LoyZHDCWNnCLk0fsSnIaxe/OEzn6IeF3PMzuTPT1S8L90to9Hiu3yfvvOPk+HOohcrOUo=@vger.kernel.org
X-Gm-Message-State: AFuF++mBP/UtSTWXHI6sEkkrbWdm86Mu7uPTkeocI0LUQCff8uqefG1k
	/ft0USrQpnANutnt+syn9bMcM44HOiZtybqb9N2+Quy5+igqzAvcGDr7
X-Gm-Gg: AYBFou2PntxjI7DTjp3kkCk6ScyKMIjEdXhLeCbWVffRln5u9stga7EhdRvMAsaZl/p
	ZD4nmgR0/ld8BrWAqJUe+ozd0L6ylvM/rxBnY9SjlcB6Q1TJmYnlbgzHj+IvyEBLn/exhBvAqdX
	TXa+f2JkkbjjGTErKDn+n0dRTxVEOJHoGHl1zaDf5dwptUiEAZ8hJIGhohEI4SyJUP/02bC8wId
	0TVM0gqh4fkxNy22RKOElozpq1IXi1MI6DzaoX3xtTx861A6VzSAh48SFBPzVAUwGeEkOM1REmI
	5mtmYe9yopGX9YQMpxUcWUedn4Qvf5+lmmBH3H6GLI3XDwOgYtU/hi+zb5PLCOQZhTdEJinG6j6
	FWEzrDkAAmVB+nrLRiGhFlC2Eaml+bbuae7MrZlphLPpdIuGh25ZIM8jmggY5mmjVFUiqv/jP0y
	Zjq01IoQDYvntwo7pheeqst3m/QG2aEg2GPITua/iCn3CLKwYRZ8+gzQqSniXdxYUsEqvry5olZ
	2MBFHP5UpBhV27qPNx5/WKX4vptnswu137oUI8ievwhjyCMifwr2IX1Bg8hpeb5nVGptp15rBY=
X-Received: by 2002:a05:6a00:a253:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-8874ab8ca2amr690790b3a.22.1790766946179;
        Wed, 30 Sep 2026 04:15:46 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726c07f4asm634108b3a.59.2026.09.30.04.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:40 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] selftests/alsa: Catch writes that silently change other controls
Date: Wed, 30 Sep 2026 20:15:32 +0900
Message-ID: <20260930111534.3782264-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark asked for this in the es8316 thread [1]: have mixer-test check
for other controls changing when one is written. Patch 2 adds that.

Patch 1 fixes a bug that testing patch 2 turned up. With a driver that
notifies a neighbour with a value event, wait_for_event() returns on
the neighbour's event and the next test reports a spurious one.

The cost is two extra writes per control and a read of every other
control on the card after each. On the two cards here, 39 controls in
all, the run time does not move. I have no card with hundreds of
controls to measure against the 45 second kselftest timeout.

[1] https://lore.kernel.org/all/0fefbfe1-021b-46b2-8945-15956e75e37f@sirena.org.uk/

HyeongJun An (2):
  selftests/alsa: Do not take another control's event as our own
  selftests/alsa: Check that a write does not silently change other
    controls

 tools/testing/selftests/alsa/mixer-test.c | 235 +++++++++++++++++++++-
 1 file changed, 234 insertions(+), 1 deletion(-)

-- 
2.43.0

