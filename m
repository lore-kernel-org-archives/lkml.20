Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030493;
	b=1FShxr1Kwwkbui0uIao/OFMcBqYiYWoC6gNj++YEJqhe/Q4yAfGhFfbgmxqdNETUnKoQ
	 eTw7teCFzGRMR+0O40V7aBs7vp2omeMidhNDTCWn6EQLSM1w/fxxPCw5whynEuNVkoUap
	 6WqRH1pLdosjnE34jEQeoxtATNPWwrQrWfqdD8amuPJVF4FdxHC0RvVXuApMNCaEobDZb
	 uft0FHh+DarAlwDhSyS4KWgJQhYsYtMo+4v7jnT4wKixI+4a0nxuBfuttJNi4yDtTVpkd
	 wFdvIwW1Fsys584MLObosQb9Tvzix8Un+oWEMIOi43rfUqp73/CqJZ6kaOaKpGuaXXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=;
	b=ASpZqND1KzQLnaZTgQWz5g/SMJ9090+Esj/LYtoOdIpV/0kMjpW0c3yiRuWgBbNouSha
	 CpkLiRmxpgOkDvyzdYOnoOg9LQHF3csFigR9/XN+QbRrYmrFMpu12cdp+Gkbchb+Z8NUc
	 YAXNXf1HIIzpPsEjQZkS7iMA9WjJUbNgzkDlyib/5lDjHf38PMHjCiGu8k2Wx3u0K7+EO
	 WGJAJFYTn2Jpsb/R6+oTLS9YsFGTNrhAPS1VmwI0oBM6zuQW23dCadF9+5Upo7LdGD2Dn
	 GXFwySuM8IY9qpi29nffqDTwQu0Z0LFjJRkp/i/d53Gj4ON8NPAZG9um875gH9gs5cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eDpLUcaz;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC17A60A2607
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC17A60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eDpLUcaz
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso490158866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030489; x=1793635289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=;
        b=eDpLUcazRiDZjBah+BQ+235CtKqivKy8dizImoSIltUcxBLs9P8eFG6BcUeCLcoEp2
         zHHosODwLt+i8Opy8qQpkEOIeI5lmN5CwO2SzdIszSeyUlPLkm/h3AzYL0dTaEkqSz/i
         I1ECbT4WkAbvaP5QHxK7gw9MiFoNfCdslNnlz8uGBRErtMCuqKXL9R2nqoPDWUXR2WsJ
         ScqpjU3oGwDKvWyu/KXBLqWS1KlnkPSDQeiHuxs6Eaa/56c3ZNDBboaumElUAZ8hQTma
         6EU6bJp4MMwS0p5dxPfcYA/zaLjJ+NK5n2Qk2VjRCYJfcVxP3mobukyeWZQZNV1XQRT8
         EVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030489; x=1793635289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYYENz//Yxu5meUYT9GGLBnB4hd0LOVAJcrkVCx2F0o=;
        b=CaMolHtROGllB52hnfkdXOyDGtfyJuFzPLkofglVQ/qdAWrmyTPhILrTfOxoOJnDQw
         S83SZnDujLrOfkERSKkRIn2VVFID8qk610De0vEQdcZgFllBd+cCcz/L+ZEUD/zWEkbB
         ATsHaXLgc6v8Va1d0NWkdA48iXFfq9paLo+iK0Ji0IFtoro7+je+DexK29bat5ys6qqs
         OwzoTrpQcBEWuNSkIKm4tVgkO8sPfIqylD74voFCc8kvXrPjI+k5/eEEyBjc/xhZ2c0l
         XWf6Yzz/lTzmzta3/AzARrCim+KA6MiEFJrXq8R1NizZRDFUn2wGV+HWYXJrLFzSjDuX
         DJNw==
X-Forwarded-Encrypted: i=1; AKwUvBxhTZEFOZaRmgI4Iza7qyNsULGz3wXDKltoMLbmvsrVoxViZXQPfBYDkUcYWvVbLw1d4ZetdQ4M0lRQtdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw4PBgOTvjWnB53LgXgjpWzszZkeg4F8MYUn77rLsLxP7zA79p
	a7EbNhvzQGZWzX2DQ5/UHBv7+NcE+p6nPMmSpqTKqzNFsgDzhfqOKP1YDk/lAS7YH0w=
X-Gm-Gg: AYBFou0pv18MIShXWSChmk3OaEMEYzuGzSB1dH99IX2kCuIOAlF0IcZuehH7oxn7hj4
	eBv2RHqvbzkzl+tRnJIT2JK6vHJbvJ1X1BYRaoPsXsb33LwCSBOh940AytQMlxruVKMM+Ssc3de
	7zN0Tu9AGv0exTHZR+qS4TdVEJBJn5eVT6MmTHav7MztdlJ8h78KYeIoOtdNmVlvCHttB95YwIj
	l+PYEJD28f6xnFu7zhrb2hZe62VxOhU9scdGZ/QVqr2gENXIx0ga/pxjmlZe5KvU9dVLmFuTO4f
	PERDYYc2DPucHKMIKeEackmvvWlTx40JWfju2/g0UMtW1bNWaShsTA+qiIAgD0/b5pdqig4/rnU
	g+MoB8TOVo6nKJ1VpA85NJu4lBpnLpXdex/Wq80A7TCyFFxf14+3/Zkqw3Kt0HsIsWkJi01b6id
	LVmoLRfqMjsJxJrh5aAVjCHwdNSt8mYVvs+TgBpKS4JEPDCUIj5zoE9sxK+dtQpQxdmRAicZW7S
	fMumALnk4WlvXmKRveGXw5FSBH5dPgyEU3hW+9Xph7jzZlvozDq2I3z9+cbpb607vtlHem7AnfZ
	rVUoo92XBlJc4LPv4JqAxzUZcCvXtkGsadw3zATTTCED5/hi31lTxcM5HEu2nT/ADDBPqaOdBxv
	eixhxaCLuTg==
X-Received: by 2002:a17:907:724f:b0:c3f:cf2a:76a8 with SMTP id a640c23a62f3a-c46bde8b95fmr863838566b.28.1793030489246;
        Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:24 +0000
Subject: [PATCH 07/15] thermal/drivers/samsung: acpm-tmu: Return -ENODATA
 when sensor is disabled
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-7-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1760;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7lM3qIErXOkLrWCUvTMJgQuGSIk/cFpH48BW97n5ryc=;
 b=GQSw8sx0872mm/sZpXZuyYhnHTCUuT+ksnT5U3IgLXaQ+PhbVK6oVjYCsZsjB6Z5+rZvYxMqS
 7YQOm8auVUsDmEyQYgUOUVjIg/WNDpL9zUhK4lgRBg+nrXwLcA1OoQY
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

In the thermal core, returning -EAGAIN from .get_temp() instructs
__thermal_zone_device_update() -> thermal_zone_recheck() to schedule a
250 ms (4 Hz) retry loop with no backoff. If re-enabling a sensor fails
(for example on resume, or after an acpm_tmu_update_thresholds() failure
when polling is active), sensor->enabled remains false while tz->mode is
still THERMAL_DEVICE_ENABLED, causing an infinite 4 Hz retry loop
instead of backing off and disabling the broken zone via
thermal_zone_broken_disable(). In addition, hwmon's temp_input_show()
forwards -EAGAIN directly to userspace rather than -ENODATA.

Return -ENODATA instead of -EAGAIN when !sensor->enabled in
acpm_tmu_get_temp().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 4257bec802c1..1f56c69af76f 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -200,7 +200,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * after PM resume.
 	 */
 	if (!sensor->enabled)
-		return -EAGAIN;
+		return -ENODATA;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
@@ -208,7 +208,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 
 	scoped_guard(mutex, &sensor->lock) {
 		if (!sensor->enabled) {
-			ret = -EAGAIN;
+			ret = -ENODATA;
 		} else {
 			ret = ops->read_temp(handle, priv->mbox_chan_id,
 					     sensor->group->id, &acpm_temp);

-- 
2.56.0.257.gf7497c7d27-goog

