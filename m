Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEFB23909F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791000652; cv=none; b=G/0HP9tWHwBPwfKkXKy+XHcxyRjvtuwa9qQtdK4tqnWERxLnSUV+d2JjqwgPULP6feiHQ31ahRh06H4OFK7QXNBCwCDj+14H8CZ9y7Mw7NAzhh0TstGPClmxllVPUpc+9657Ldy/ULTEKPRddEdPJ9ZvK7U9v1NG3vRw02IgtRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791000652; c=relaxed/simple;
	bh=Ub+6vjX4CwzO94wSmlNoiOA5uRtM5sEdsqQUOo8sE08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PfmFjF86eXFOJaeHplGAewqc583vrkjGdP4RY3Uga2zEL+uVUPZEwEEuQiWRJCmIKJDHdAYSHz214PCt4dG9fQGqgCY2bwOElCxZRVEH7CaezC3KFV/MZuQjhFnhrdZVb5TQo8BHUOhQTl560jR+2kigWZBDdtArcvHeG46G22w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uplj0xxj; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uplj0xxj"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-53394335c4cso2384721cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 21:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791000648; x=1791605448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eYVOFUxcrenhJA3xppslG6NmaKa0X7JLpJ2/fTHYC9E=;
        b=Uplj0xxjRDhAsvssuzsCEZpPZW3N9lWOZjSXgvNPASBIwHoZT6ez8J+ARRzmZCpGwZ
         TfB1t1lw5GOOO8QXscArXf5skcFmht9YUnGmpNmu+eX5Bpbq2V6QDddrKB/SdxWfMNgm
         EPFEYqUoK6ho6Yi/BgOkQDbBLCxaJ2FK/yzXD0+9ka3cqEJZ26d0mulNTOb409rhZVV2
         JfBkJ4szeFqDPRHHiMMeCynj9ID7Z3Uj4p34ddJO6gQDNqH2WX2yW9nKyeRyZojw9doQ
         1yZu3Xk4O9IolctMgImoxgGEXc0lToyMDeSS9Rrt9WRElBELxE8ASYxUj9VbFTlswStq
         2YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791000648; x=1791605448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYVOFUxcrenhJA3xppslG6NmaKa0X7JLpJ2/fTHYC9E=;
        b=gNjWw9g/cjYqoemFIIA412Lbp8Zazv2HypmJMAQcTZTFB1duauCp/jtq55gkBksWgO
         nCAYqJ1BtE46X2DT4oZXk5ndBsGQEcgnSEFxGIOOAtfWRQGeVzICb5irCs/omxW8ib/k
         fzLSZ0EcrnnTqjJu8UdUiuNrskdvVdbi2pvqmyQ94eanykBXq/eOU1SDULWl7LJATbd8
         8Pcz90kvFBeC4rzyTXDKxVU79AHVtGqg+0yIzDLxrZPVoWT/vO8ryCRJfdhv3HBFRFMz
         B/1lTLEqj+wsnOk9EbdmVhcBnqTvtwQwu4aODFhsi8ZQa0vIndYarhwuMNcgPAkzczhz
         jb9w==
X-Forwarded-Encrypted: i=1; AKwUvBw8qRd6zLW6Z4+bDtHu27EY9/J0Pyb/U9ndxFMcIkZ4BP6v4Btj8JpEKhEYDWJ9P9kOr80OIaoNm6CHVEI=@vger.kernel.org
X-Gm-Message-State: AFuF++n8yEz3J4z+nPUC6UogsNrW+vpBOtPZ1SPN338NT5nDfa2QIks6
	1Hv5VkUy9bNGAdqP56vglPXoHrdBc5SkHrONe1xL/POrk/nk9gWIeLA=
X-Gm-Gg: AYBFou2zP17B3hXxGkcHJeWMTM/fk8zIj2x6yVjD2xYBFx7rAU+zoaffdu3plmCPMc4
	PQm5q0QStwDDnHEabCQ7ztLMpKgwiRqLhUes2LUB6oSiETSQIiiuiUjeC7Av9sunsnrsmvlZuJq
	VLp8w1obHCvR6nL+zSWczvL/GgqyUX7KSDnAEahJDCQhHWtDmJP1ktk1E6UeNKM9KlKnoSg3vTo
	7dEbb7xllUJHx2BD36NoItM/4TT844BbvG71+5E4elzKG5wnHvph+EnNZERhjq4qyVB2fJDYlF4
	msLtnAJAMulHPLwazjZewaRs8mPm3vjmy6tJEH2AdNkk7TNLND+m8twBNT8K35zHmu9zvLRRIDx
	q6Bdp2CErPYBIyiwbAjRjuHSWyBBWpd357GRdXPgVc2zbygw/DEXSymtHXaNdIRPFGQgYpbkxLc
	b5DEhxSKBPgt9eT+FzKZw1kpUX4oz3u0My5idiVdiWgOt4SOecB011rjak+zblH11YmmKNgID8Z
	flnSRFvNQn/IAfJ9dPp3Job7sesxQI6r9Mw++NPisQNfmvLzQQ9ceF8iCOr8VLPPteriinxBDJT
	ez7ho8e9DOpgV1j1v7XS3QUURZ2i
X-Received: by 2002:a05:622b:4d:10b0:533:2c5b:d668 with SMTP id d75a77b69052e-533cba67426mr63507651cf.30.1791000648550;
        Fri, 02 Oct 2026 21:10:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533988343b5sm42782711cf.1.2026.10.02.21.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 21:10:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Derek Fang <derek.fang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: codecs: rt5682s: disable jack detection work on shutdown
Date: Sat,  3 Oct 2026 00:10:45 -0400
Message-ID: <20261003041045.650207-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The jack detection and button check works can queue each other. The
shutdown path cancels jack_detect_work first, but jd_check_work can
queue it again after that cancellation returns. Canceling jd_check_work
then leaves jack_detect_work pending or running while the device is
reset and, on removal, its managed resources are released.

Disable and drain both delayed works so neither callback can revive the
other after its cancellation. The I2C remove callback uses the same
shutdown path.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: c07ac3ee76e5 ("ASoC: rt5682s: Fix the wrong jack type detected")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 sound/soc/codecs/rt5682s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 34997cfb465b..7a196fab623a 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -3294,8 +3294,8 @@ static void rt5682s_i2c_shutdown(struct i2c_client *client)
 	struct rt5682s_priv *rt5682s = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	cancel_delayed_work_sync(&rt5682s->jack_detect_work);
-	cancel_delayed_work_sync(&rt5682s->jd_check_work);
+	disable_delayed_work_sync(&rt5682s->jack_detect_work);
+	disable_delayed_work_sync(&rt5682s->jd_check_work);
 
 	rt5682s_reset(rt5682s);
 }
-- 
2.53.0

