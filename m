Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7BA411FBE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376164; cv=none; b=XI/LcWmhq/RlDK+k+Dg/6quNOf2DAkjroGoqou2+/89xWBalaHv8MOh5gtzk9BOAXpMFKz0y4Q/jHBSKqR3KsNeLcRv7OcVwL21JdMtRMZAyElTkPpSvcnZSuWIpTOa44DKuzrfSEjzE83xXHUAKIysmjj8nG18c8MxYcp9kxA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376164; c=relaxed/simple;
	bh=2AYNHPYR8DvZ2JE4B5Z+TBHCYoIrFkkHKs6JSZq0e6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GEiz145UMtdkfBjH9AsLPBqaf2cMS0iT0sS0QnV/qfttOi+ZuaNLKkVIoK4TydEyyJJ5LRvzPBHe6FCb1mC5jT4JZ0qwffKrGJapff700Ni/mD7DTDH9DtBId+JphTteS4LYTHJsOR/ecaxt/T5uqtjs3RRPrb2JP715VfEJiHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eODMheeK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eODMheeK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd6665a10fso6220695ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376156; x=1789980956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgNNFPbS45QrfrwS2UlBvdfwDy06m3LBDa/zfVAjFa8=;
        b=eODMheeKNUy2rphMojiQGxlLs8Uzx8QLR2MjUrClsavf25XC7T7FZDkQxHlAxsk5hU
         4R5UClfqxka3a+9M8MzSPi3iszZJUy4ik3fbDegyZNOwyAOAtPdxuf5P74kJExexN1Ma
         RWHMDBH5VyIwHLuVRQLYyAF96m1PiZ5hV/sfdUR/ONs/gK9+aTpiCPJ1dSfiUrxDdXsS
         EIMmUn/4a57AIXexvSH1hpweNRPvtq9dPkZHl5VXFM8cgBX4CVFpb0Xrr+gf8hGB56aR
         rwiFBsLS5yfM3MVpO4V09++NqZZeo17yvioYku152O8AxEdHKP5sR+X9hGaxAojInRv/
         uOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376156; x=1789980956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgNNFPbS45QrfrwS2UlBvdfwDy06m3LBDa/zfVAjFa8=;
        b=Qcs5buc8KS1zP7uV9u/espmioLf+sSv1uoaz5TDFUSKH3kQeNOVByTpkWB53mthZ3f
         84sPqvyh3PPeoiLq9ma37tKsbTCgG0PtPZ7OukMUMEQLj6Quz0uRFCrMPXUgG0xzbt3G
         WVvTDUvr7p0AcX/uUSanMpllnz7+LO4wDWbavNCYb4cUoKrFw73iI0/8HG88jC/H2oyv
         H0itoLIN2Y6VgWOt9ndSMSIs59SUMOKwPOhscOnzFWQfFNDM7xvOFHZ+v/th6pqVdKTW
         bxQPmY31p76+ahAPMXSzS7S2i2+t8AnN5Cvhr3BhvZ0bnYhXGPKs7U8VqOeA+tJccczS
         kSbQ==
X-Gm-Message-State: AFuF++mu2nWlZXsECPM9DjWpIvOR4C7JoKtuI5LZ20qCZIdOL4qHnY4x
	xj6ikJJuKisTDvvBjJhcjnNhZ+Cy//NyObMqApDiEV2jOi7TbNuMGmQ=
X-Gm-Gg: AYBFou3C+jeCIi7YK2zgTlGOQieXVRsnpztZhutGyqwjTi5pcC+bFWBNBYhpgYOSavF
	syoYQwlAzJeQqpy/kgsUvShKh+Q3wIdZGui+txSxmj3jrYp8eUHfybY5PqGPhGQzMx3V52Vl/W1
	6lEcUAt3E12xNIC5/N2JRWvudZ/xKpVQ9uvfZToO29bn4dHZzrbIZqYnMJhgpQTlpe5EvA+a5S5
	v/f6rq95PBv+EZ1Ui79BY+9/Cke38VA+RPfJUnnOg3Y31A1fanPtGibO9nrTIFn0KLNipppwBKs
	hRs22nLDHvKEmOtxMb0+F0hT1cYxw8Dvu6AKX8HX97CHcmiSEcXD5toZS4brjFw5ok6qTOU39Df
	LU5JRRDKlHSLn1lvhg+aCb3k+PkqSn26/b7JFQZEw8CX0NViNpC3EpEVSqP/RtJXP18v2S+ZOCf
	QKROJ6SkfWZpvB9c9qUbz0zieY/hiSJIWwBcq6VeB3zXmQfmfNQA9ZOUuQTNUgsK1p8cM+rBOtz
	hoOa6F6Z02A
X-Received: by 2002:a17:902:e950:b0:2dd:3d1a:6958 with SMTP id d9443c01a7336-2dd6c5f4ef5mr37059965ad.6.1789376156080;
        Mon, 14 Sep 2026 01:55:56 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm44569105ad.62.2026.09.14.01.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:55:55 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: linux@roeck-us.net,
	tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: [PATCH v2 0/8] watchdog: Convert drivers to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 15:54:43 +0700
Message-ID: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the watchdog drivers to use DEFINE_SIMPLE_DEV_PM_OPS()
and pm_ptr().

This is a straightforward cleanup with no functional change intended.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Link to v1: https://lore.kernel.org/all/20260826060839.203297-1-triet.hoang.dev@gmail.com/

Changes in v2:
- Use pm_ptr() instead of pm_sleep_ptr()
- Align formatting of DEFINE_SIMPLE_DEV_PM_OPS() usage
---
Triet Hoang (8):
  watchdog: cadence_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  watchdog: da9062: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  watchdog: keembay_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  watchdog: msc313e_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  watchdog: of_xilinx_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  watchdog: pm8916_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  watchdog: sp805_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  watchdog: stmp3xxx_rtc_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

 drivers/watchdog/cadence_wdt.c      | 8 ++++----
 drivers/watchdog/da9062_wdt.c       | 9 ++++-----
 drivers/watchdog/keembay_wdt.c      | 9 ++++-----
 drivers/watchdog/msc313e_wdt.c      | 8 ++++----
 drivers/watchdog/of_xilinx_wdt.c    | 8 ++++----
 drivers/watchdog/pm8916_wdt.c       | 9 ++++-----
 drivers/watchdog/sp805_wdt.c        | 9 ++++-----
 drivers/watchdog/stmp3xxx_rtc_wdt.c | 9 ++++-----
 8 files changed, 32 insertions(+), 37 deletions(-)

-- 
2.53.0

