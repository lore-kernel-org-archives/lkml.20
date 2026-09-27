Received: from mail-qk2-f20.google.com (mail-qk2-f20.google.com [74.125.230.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFE13CDBAB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546801; cv=none; b=bN6znasAG8Y8YOnE7b4U2blIrMvo/9D6znrCZdfNU7CSqhdHbOLBzXSIjzT6S29LgrAltVdmwf2tO3+4QpQnryEcEwAkxfCXe0AfMKec7mjDHocT/9gIMhAAMfHt7EEUIHEERfkkcY2VLRfTnuUuJlmJcTo2iy4IDQPswPPBi/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546801; c=relaxed/simple;
	bh=f1aluKtGhtyCkJUJPoTQNC9FdiG9ehY6s0isdzn8KnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NeHJCMtVziL2RgDcTA2NLMzsh205RrJ/LqnNoVN3KNP3iiHXxE8FqjjF++tm8yeUon9/J+sLhXJyhN18lV/z30rF0diBc3t32wGErjIclOP7sBoL46CJG4lAareknOhaZ8MxVfj+A4frBCAzesnxwDBtm8hMtmb0T5tnJozUzG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRL2oRB2; arc=none smtp.client-ip=74.125.230.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRL2oRB2"
Received: by mail-qk2-f20.google.com with SMTP id af79cd13be357-939656ff6d9so279775085a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546795; x=1791151595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhKzOiaWtqNWwtP31kKM5/1eWEN7caNKyT11TpSUIXA=;
        b=eRL2oRB2aXUromfmdbeZdRCWdUZnXowuhH4fgiFo4pudQV9sbJPcFmUAAD+SUEr6yq
         hnclbfapElrCRtNEOW42ItejvEyJrSlnzZa3r/igMV5iiRGYrYbgRAZ/R+oNSWlxGu8F
         bmKyVb/Dq9c+un7Yj2RmxcMxilGk7uaaGfCFNcRf7UfH98thPhEWHk0KZ1QWbv4FsdaZ
         Y7enO6RNi82NyrDwaxQxVLSu/QULhQbc4arJA71zW4/d1RhvPXvLltf/PRK2G562xKWM
         +//WZPfwR5gvRDse5Ojh1xX2t8ZRaSFoTvKWKGGOTTAa3XfJ3w4Yx0+VADOIRAH93PBE
         Yhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546795; x=1791151595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GhKzOiaWtqNWwtP31kKM5/1eWEN7caNKyT11TpSUIXA=;
        b=x2ToO7BCo4S4zxsSmZgTjuu6gygcorCNTh1lghUdLqM/mC9ly/UGKy1pF93xMkEG1K
         lp6dlqaLhhvi6dQ+QhOHiDa3GN+n+SDL/EGkaSAnwyH2Rzq9kbslPjvzadTBgjKcrZGl
         Qb+6RtNWHBJ5YpbwwA0+VPLMVygRqIahVsMyMOf+gYWLRI0kBZWD7YL7sc0rcrxT6gvU
         X15fc7EOwplHfwJ2nASqbEaZvzlM1C0uBtY9pInm2gca2kNx6/rBReek2OSFkB/eXI/B
         NIOx1PPGBjxt9WEW/ZwOdz0uMrpkpP+GaxbnUmGXmAm2CoUIorS+UHlOiWvxi3V4cI9e
         9D/w==
X-Forwarded-Encrypted: i=1; AKwUvByYKt/8k4BXjYeRjuUsg6x4T4ikeU7ZJVbc2j8wj5dwWby6QZU/O/Zs6OoPoGxRk2Auab70mV7U+Roimjk=@vger.kernel.org
X-Gm-Message-State: AFuF++k+ez+C7YvzAFvRJoADHZHoJ+3QdmBJyLcAJBYhlYV08ZxUSbKy
	XQ+Cz78EG1AUJ74OMWUFYH+kVaosscIRnJoJ+5TYNPOFHxjNzNl2YQhx
X-Gm-Gg: AYBFou2vJ55KKPg/Kruk3KU3ZrofFwzlfi14taN86t5l24zac6d68YvF21k02Q/nUwy
	UcYrX/NdgmLTz77n+WEI5Uqs51xChNsQPniDVUQBVcDa033kYNmxNJs1L9hHe8KqCEq2mO1dRE6
	u3AzXut/zUImM98St00RNfxmv2N22PpVzgPgRK5m65GLcwYoVyE1wVDUH4dgITEr5LZYxNFfshk
	ZtIEsfDjhHlkgLQAuKln1QK1usmXBEBTcBrF24y3ds8CjLFsg6XLdeiLYayrQSkenMrRxsc2dgy
	NKFIAizZHYcVIXU4NKyiuPpNfZZCFcAjRph3elKiKGqyoSR51x4bokb+auOUqVKUI2Ew+a7pHX5
	7ChZp1EplXa0i+nMTMwCygy8MIXPDQepYz9I15RhYu2MgotDg8sFBsWXlpFlJqJBOgNzYFhfMiy
	+I4jO1YaFvQsw4y/mWKy3FkVHRBekwg6ZnLBB4gMc/HNxsb/cOkOq6iNntdWwfECAOhu4yS9k/0
	E/F2tJKc0MmsKRgwVStUhjHNw+Wi9HAjiJRMrJwkJsR3QAVSUXozfjXdCduikW29rQkRtLwi5vx
	e9qIjYY=
X-Received: by 2002:a05:620a:294e:b0:93c:6d02:9d0f with SMTP id af79cd13be357-93c6d02a148mr570784085a.31.1790546795147;
        Sun, 27 Sep 2026 15:06:35 -0700 (PDT)
Received: from cachyos-SlimIce.lan (1841343-static.dvnpiaaa.metronetinc.net. [195.252.229.229])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c44972febsm708092385a.39.2026.09.27.15.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 15:06:34 -0700 (PDT)
From: Jared Wuerzburger <jwuerz@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Dionne-Riel <samuel@dionne-riel.com>,
	Jared Wuerzburger <jwuerz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3 1/2] iio: imu: st_lsm6dsx: Drop trailing comma in ACPI match table entries
Date: Sun, 27 Sep 2026 17:05:58 -0500
Message-ID: <20260927220559.24169-2-jwuerz@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927220559.24169-1-jwuerz@gmail.com>
References: <20260927220559.24169-1-jwuerz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trailing comma after the last member of an initializer is only
useful when more members may follow, which is never the case for an
acpi_device_id entry. Drop it, as suggested during review of an earlier
version of the next patch.

Link: https://lore.kernel.org/linux-iio/aVFmec8JA6ZX18il@smile.fi.intel.com/
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jared Wuerzburger <jwuerz@gmail.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
index edec898cb..fbf4e4ecc 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
@@ -143,8 +143,8 @@ static const struct of_device_id st_lsm6dsx_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, st_lsm6dsx_i2c_of_match);
 
 static const struct acpi_device_id st_lsm6dsx_i2c_acpi_match[] = {
-	{ "SMO8B30", ST_LSM6DS3TRC_ID, },
-	{ "SMOCF00", ST_LSM6DSO_ID, },
+	{ "SMO8B30", ST_LSM6DS3TRC_ID },
+	{ "SMOCF00", ST_LSM6DSO_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, st_lsm6dsx_i2c_acpi_match);
-- 
2.55.0

