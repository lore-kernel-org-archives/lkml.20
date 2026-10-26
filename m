Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030497;
	b=Dv8jtcXd9mLTqlmyfz9lqbu+SN3sn4cdiJsFDfseHwcqG6pnVlKetQyB6P2GX1bGg7WI
	 0qinyFPWL6+i4zWnllTtFn3MdMN2P/KAnSj/XVyhOJw0r/gZ1OheJOjtIT774NJUqVDqo
	 ZuR3dFG284jB3WVuuNZOrnRZSgwsbXEZqL64s/1y3va3GkKh5uYj/UdiDkVGSOF3MBtwr
	 ZMDlzauPix3a9eyHRHjb3rxdXxk66u6kLpsqtf7QshKxZBnQx+r4KFuUUXVbwDtQmZwjS
	 lDukdVD3Cl15mZz8eQtCCm/yNWT1uh/dzSuhnlXDEPXa1NokkSyb7BHqQW/On1EvyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=;
	b=PqYfNeXCyGHsYJ1ijZZg6/iVAxQ97fhTsDhju6IXro9QCCfkrfmsa5xxi0b+Qyp4bMja
	 4aeK32RbyT99HW4RE/Mr1VZOjAEr8PB/RSO9luufhkOQnivfP7eH2XQgAoISHbndFvgDX
	 uPqJw1nuVdl05YGHFcyxr01ZCP6jek9JXQqmaLQ+8ikm2XAWJtuia1s9hiou1ldZc9bAV
	 axC/YQCX2sI8vmbD/m9tZvW8bR9307zq41B4x3ImYRfw4bz56iSa1w3qHOBOZDBl7DORM
	 tx+Ko6uiC1nA4NSuL78ar9pTZ9Qjuw9I+qVBk0EYfgO1m5ORrO8pVp0Z7lSoZ8uFFCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pn+IUgFv;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A535060A5BC2
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A535060A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pn+IUgFv
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso487780466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030495; x=1793635295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=;
        b=Pn+IUgFv3ihsFrujjLWPVEANrB2ZFyUCoWIZUgTylairSLFBYGHxWQI/rU2Lk96xM2
         y39wmWgvbJztJltyJ/DVWgRsvyD89PcpWnPfWyEVKgWhFLwLGaQY2GLArR8qRobvPZaB
         Jt10M6ey0INtGaXCOwP9j2GjW8Whex/NewR684yHuDNJorf7EQavZRfdI25dLIrDftY0
         fsBZh+tD0hQYnPeoPm8BUvi9UUgfXl+IgdhfUecfP7mRLog8L9MAE3TVmSUV/0O1YFRq
         AhGTkiWcjcbyeCQG0JQm9dvzXG3TsOnlvNckdG1dv86hVoa1zxdEPDmh/eqVWK9twZZL
         71JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030495; x=1793635295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=;
        b=KOzKgDpBdW9dusuA4zLaU/HH8LA+RrApIYY/VMmFguIW8sLLrdU54imi7CCAWZ5eqH
         cFQds9OsnRf0no/CIVqa7qUK2JToixUW2qiO9v+ZFK7IeEbHN7I2tw63PJ7cOzMG/mOP
         pWMhbygtmgMXM37K9oxOPOq+3hHg2NFNtBfQ9PnGXTdkBDt+m70c0/sBwCDZcfsxyTcp
         aVxciRBpy+zd7Q4rUjcHI5jzhTY3bcnyXtHSsUjry8gDzaN0kXczr4UJgg4UiTwabTMl
         TBoLilWGHyMFMBp+5WIgm1KOka/fg0TUPQmXMosUjLrQVfelsvEA/LttvwT2VQxJKNBv
         PNqA==
X-Forwarded-Encrypted: i=1; AKwUvByLN+kPSNnUFy1tj4XGd617ZtPwO3NQkUvwomXwsLVaZN6EfTHvlIrTa1w+L70PZXCdyKy7LXdzvv5uv2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp0GSjc0pQDln9WaQ10AsJTyUXABPmtLeKnT8PJAFOJX4RgVD7
	qUYo9+z9EDH4FcXvsxLTzNam+Lj/p285hK7f9TKS+sKAv0aY59MayOEeYHgcdIjeBrY=
X-Gm-Gg: AYBFou1bETx2H4ZWxC55QK4KnpgCJhB8qCpaS6rIYa0Ux04aVIWNqG3d0VIMiK4lkkM
	M/Uo5cXoegHdozyDpV1tpXKjqRF+c0GBrrGqcfF75XDOwoi8KSi7YF38Qh3sCZHpwwtA+UUH/W8
	QdyavEtC0C3NhodCMbwRWlQ3VjrNwdLmytUoIsuem4nHB7gNXnHEdknPCi7FOuq1xJZBy/Rq5fo
	cmb6CmebfDdnfyScYkiC1iOJ2HxMshEwYh4L1Nj3EShqN46iNlpfgkXsJXu/xPMT+tk1JU0kaUr
	RvByJ8eVwwSHjHfAIPvz2RAfM6aJvVmeBzcX+RKr5Umb8yiFsvZn7Ihyava7I9VG5zY0/59b1Ni
	CgBpUrmUSC8yxhC6tIy6JfbQU5iEjqqbB8dNehrVquD1zH2ZV8KgyUNdJYaG2ERhiXK8ybm18uG
	S0QdBYdCDZSaYH/0x5RggSYT/FVhnddFHDKDVfJddSUu1YWaDf+PSYk6OTVov2iMpTzelCvOqQw
	ReALlW0YPdtuOWbwpN/61EGJY6s0y4PTCp9cMXcxNR2MO8Sspik+Ny1N7rHpOaAc1SGOc0eA8ej
	9sAOHpE4+Vqr2HPdtkWA4/wEaAgqZnT4Y5dK
X-Received: by 2002:a17:907:7b9e:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c46bdacc54fmr886243166b.2.1793030494893;
        Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:32 +0000
Subject: [PATCH 15/15] thermal/drivers/samsung: acpm-tmu: Simplify
 pm_runtime_resume_and_get() error checks
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
Message-Id: <20261026-acpm-tmu-fixes-v1-15-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1473;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=lZVnFDVBHj1aJ/e5MIesn7vTgTEf09TNxBZ/LEj/mAo=;
 b=xzafQuLI4krITcIxtfwX7fRea8cl4qpZS/PU5TktcAFB9PnVEMuhm60+zlPME803xQgfWT0wq
 lnW1Df98m27DbAa2fERE3L8ODpFo5YZ7BhXIFwJqK9CL46OS5TS4oAU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Unlike pm_runtime_get_sync(), pm_runtime_resume_and_get() returns 0 on
success or a negative error code on failure. Check "if (ret)"
consistently across all pm_runtime_resume_and_get() call sites in
acpm-tmu.c.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index bce4674be58e..7c30401f8fc7 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -161,7 +161,7 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 	int i, ret, err = 0;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	for (i = 0; i < priv->num_sensors; i++) {
@@ -205,7 +205,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 		return -ENODATA;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	scoped_guard(mutex, &sensor->lock) {
@@ -463,7 +463,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret, "Failed to resume device\n");
 
 	ret = acpm_handle->ops->tmu.init(acpm_handle, priv->mbox_chan_id);

-- 
2.56.0.257.gf7497c7d27-goog

