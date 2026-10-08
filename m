Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF68472077
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465015; cv=none; b=mdK9YFHPp+vMt+Tm1w6zrWS0PFdYjDZDibKrv6dNUoBB+h4hZaLSJAh3x+/GB3VYpVajylmcxePrb7m4pe3XF3wYB6H20odeZkcx/gunjohwK+A5Om4mmQRCU30aI8NicKfJN4QoTy8dCPE00o1zRM1i/EtypWNCdKBypluXhPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465015; c=relaxed/simple;
	bh=PPO9NfSp85pn54ziFmszdGwes//WPVFfsMsaCovl1ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qffJ8wbd0H7JgW3faWWIBRCKOa/ptAe6gQ8QtweF1FnDJcrIcm87LV79Lom6ID+rNPpdvqrS0DiJQQuZHMtC+41MS+XbtcoH1xgWHBi5z65pncqecUB3Vkmt/gvorJpKw6aj4aNUWvsje3AoHqwqPKxpIPkNdgnok3iCI4YN3/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUk4MzK7; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUk4MzK7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so1840356a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465011; x=1792069811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obZMvcMMDB2/jxIEyX2ryM7+bivQFfQutFGpYAMTjEw=;
        b=eUk4MzK7aHbKgw4H7FgJAgbxMLxUFx06wf4riCzzGJGJjr8MraQbGGKhGOxk4stkNA
         Oym7DzDfBcqGLtayjqZpAefkDwIFOaCnzCxJB4uJaZezNGYxdkniuh0TIeFiY56UKny/
         ehXhB5RuHscooiAk4+ziepXORQyL3Ff2ACZWTVyo3G5utN4CntajECrKsEtXoGTxX9t1
         6bKcxbEtzc9cLoqBzoslp2OKIG418TxXR5g48CL5pr7TcpBXu0tMLuROvBmEwCcBR/Fm
         l4Z/FGjPUkhaPCmzeid5X/pUQw8gWo5fuwan7G990RwJSkmcAc1QpfTrl3rTBCmJBMu8
         rIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465011; x=1792069811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=obZMvcMMDB2/jxIEyX2ryM7+bivQFfQutFGpYAMTjEw=;
        b=oBldrZPiNenV114fl62DDSbKpH+T2YQzR++T78sPIJ36Ga7cdwKMDCsEsJpgWLLjJu
         b1mIxvEn9zxzcCcUEBdRrwnmCHclrUiUbF3bBl3yy0rTAd708L6ml6Etark3uYSJ0yXv
         zgHnDs7appLXAOiBrYDRI6D1ZDwd5WJdnVpuUIJ6BDdd7iYl3lmS2UmzDnIMqTp8J3IC
         MbXNp5jwd1pn8etR0pL/mVPHiEShEfWBchOvwPwnmi1uZ3150rh8anAyefZsjJuuEA0+
         MML/27x8UfymRQrAo7tP7sMw/HUoIbzaibclLoOby5KoGI8LNnSQ0BZpaJ+XHNQYL/bZ
         iesA==
X-Forwarded-Encrypted: i=1; AKwUvBwDhVkYvfFJI1BSvbehlzrbKXp2uf5AT/cMMAepcUQ4UbQqRgz2l73LBo3JhAAMMzvl/pZGNbW36bS1LqI=@vger.kernel.org
X-Gm-Message-State: AFuF++kjq+z1QEU4uoZd+R2WoNQDwTDr4Unf+jdeZWPEslDP5Igsn6bK
	SH0+ofPBZaRgDth7x5A4ZVVli8gmS5Ff38bs+fT4CuCkGBIxiEqugWiC
X-Gm-Gg: AYBFou1BxbM5Ja7hx7lG58VBz36qyFFPbBXe9pGYbfRuqmKMpsrie3PKEdPkNWbZya0
	pI7M1hldR+gKwfRdOmPB4hfVgK5WfM4hCYsyvIIK5/wRQfPNZu04IjVX+X3cX/V/YmqaWK5vq6h
	Gm7TwMHXmK+EjLHumVOvmvk9DgVGR4L+ciRv5stlSB8LlebOfYvIAPGZqo8p4Q5BDEAhucIQI99
	gQqR3DxVzUeZQ1DmhE9K94lnwfjZaBQJZBp6IjBAQS0vqfh+HYu0NFWzdMcVgjabEp1z1Utocq0
	lZd4yXMojzjn5ZTXnLQaRwDsidlO34s81g0C2tAFz5OklqjHHxzNg17UmbUGCCJRfSd6ZkrPCiX
	mboqtVu6alKBxC47nfjtpmz+g6Itc0GXFETLZWMIP1cVDp3gtZgTuqCFdwsG6XpLPjVGtYPt6lq
	hS6CfKNkQa9jrfbpbtlWnTvOKFf9FLhYJwPZLapJSLyvvKbmT3geCt8sL+bNPqLAhpvLOcTGfy+
	Zlsvd2LNOUM6CSVBwl+pR6QTBF9ht3c1GaMzCy4j1m+Uc95L+NvVq0eIDiZla9QMJdUlTAPm4Es
	znvZuLqnng==
X-Received: by 2002:a05:6a20:d530:b0:3df:62f3:9f4b with SMTP id adf61e73a8af0-3e1340ac6aamr4297840637.31.1791465011309;
        Thu, 08 Oct 2026 06:10:11 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:10 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Subject: [PATCH 2/6] ASoC: cs42l52: Fix the NG Type Switch bit
Date: Thu,  8 Oct 2026 22:09:48 +0900
Message-ID: <20261008130953.2446692-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NG Type Switch enum selects between "Apply Specific" and "Apply
All", which is the NGALL bit. The datasheet puts NGALL at bit 7 of the
Noise Gate Control register. The enum uses bit 6, which is NG, the
noise gate enable owned by the NG Enable Switch. cs42l52.h names it
CS42L52_NG_ENABLE_SHIFT. cs42l56 has the same Noise Gate register and
puts its NG All Switch at bit 7.

So changing the noise gate type turns the noise gate on or off, and
NGALL cannot be set.

Use bit 7.

Fixes: dfe0f98b8d2e ("ASoC: Add support for CS42L52 Codec")
Link: https://statics.cirrus.com/pubs/proDatasheet/CS42L52_F2.pdf
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/cs42l52.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 5f033556099a..1d3334886402 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -290,7 +290,7 @@ static const char * const cs42l52_ng_type_text[] = {
 };
 
 static SOC_ENUM_SINGLE_DECL(ng_type_enum,
-			    CS42L52_NOISE_GATE_CTL, 6,
+			    CS42L52_NOISE_GATE_CTL, 7,
 			    cs42l52_ng_type_text);
 
 static const char * const left_swap_text[] = {
-- 
2.43.0

