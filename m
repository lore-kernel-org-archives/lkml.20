Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB03803E3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411260; cv=none; b=DgJFnOk6/L5fjIWUAPmBV0/PhoKbnqyy6dqijbBLcA8YK/zhGlZaqbHxoh8HJVW4V9uysa+i0Pfb+0wKZRT/3EvLW6+27UJRrUCvamNT8yvI8CnHiuANxu0MtdkMC02evCx6rByne3xKXKhvrDHCM//S/Fxf/GxztRD1xegxj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411260; c=relaxed/simple;
	bh=JJUn9eSW6iCzsykKhT5PAveJpLlBYOP7vUZqlNZQIOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sG4nznDxPlJWSoQf7H1WR7vHCOv9GCT5MMNBtl6ENVsPEmvFn9F1Pp9InEhKAQf8StM0CuJtUZ4b629D2XEoZKvPkHTn9e2qftntt3HSzWAPB2fgA3Ck0836bdT9paJu3kFLJbmv0sf+s+mvshecWhe1pRBLv1X2nYrZI+nCnlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ly8WPjam; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly8WPjam"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-853e2610bb4so431713b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411258; x=1789016058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqB8DCFwpgRgLRXMAdMRzB8MMQwfmI8qgccWP71X6U4=;
        b=ly8WPjameQbO9OcnfZROAzyUh460e1HmrqM6afXpx5teXp0GmZN8Cuuk5u8qraFy4f
         1WZykdgTqVD37cC8yuq4+46y20CqbFmF47KUSGjyUYcyuaRmJOQ35SFTFr50I52Q4Lc8
         IpMZm4mubputu+stFVcNE6EkT8GKpqb5SE2fLjRPOwBRmSiCrsa1xtdY8mCWYmZ1kTbu
         20RtetdoomJgcFBfZZM4mjEhfGR+mMmavvVYBtTEQSbkwxEZ6XZSbkC23SYm0sHyhFvc
         isNe9souf3PQlHnADT7QzUMPoivkzbwkQ9bynCvGRZZPOPE/02oQAfzKFkg6N9iCKenw
         0uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411258; x=1789016058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqB8DCFwpgRgLRXMAdMRzB8MMQwfmI8qgccWP71X6U4=;
        b=nraolzGWmSYSrnJ/jHfZr+0VlhjuBTUPMe3evLD2lbUetJuab8z6/dRz48WD/+zSWO
         zQqqG4yVsbiOcn2GzFHAkehw6SWso9u2ayO8qQYaG3eQDVeJgwBrGI+CzzQj8I+ow250
         uCGo2GDx6urEZCWN9jfYlr6ffT0bAecjxoZ0KBgXtUOnaF2yXh/a9iHTY4kRsGR1mPfD
         JhjYmyAbr4VqUmpriHez0WPhhqshU9/Qhjs40U8/iSSj4UE5wwCVjeujuvqgzqF9wGEl
         x+2p8TB5uapFkbWn2oKZ7tACKf5a6XYlqUjQ5BOVjfCUGM0u8FCQw6NnQL57UWuxLqQM
         yVcg==
X-Forwarded-Encrypted: i=1; AKwUvByEkrYsReTJj88PdpdSah5BVq1zRXzfL2MZ6zNKJsVcIKvWXjLMGrNURMqM/4jR1MU0+VAZ3OaFJda+X/4=@vger.kernel.org
X-Gm-Message-State: AFuF++k1XSNe5+RNQpoAuIGdu4eJRaGps3435x9e9upPyUK9iIeggWxz
	rcN+TqvwMZg2JWXi+9X/mQuH/ClVPa6cydyUPGoBXHrEgAgxBthPPVR3
X-Gm-Gg: AYBFou0MYrIJDkdUxxzkYfCIYMZXUUP2mxRKNAwsT/1H+CO4xqUGZMRftmpDPDP4FL1
	dcf0aKlQUNtDwHjSDesFh/OWLDVuyg5/baL41zdOzRPvc+TIjvur/GwXsaugg7hMAv58e0oZHqb
	7gp1IOPKNZCsTpyRph3BXL+y5ar2TZkkzL0+840W57hO7xNH5jF1wfneNRPdQaJORps93sV6zzS
	4Qevl8ikeTKO/y8l3zERoRAappQFHnswx6RVbKHwpbXK1h6SIWbbX5Cvh/B9TSzpD3aKq91STGn
	O9EcaCzbI/ag+UR8J8SWgkMS2S7Ob0rFZKOsmOS24zAoFxah60N/i+PA5OZti0637iXb9JvEkNu
	EMTbVkN7B4NRP7KrYd860mfn1Btuq9cdo2e7ukuNyernuU7VB2+uiK04iSZkB7NuEzBiPevrkOX
	uhdRKRA7Xbyqne6wrGp2vNWHX7wj8wvgBkly7XyTpyyCxu19Bt5pwDQImJoWK3V1RvPQ==
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1194339a91.15.1788411258243;
        Wed, 02 Sep 2026 21:54:18 -0700 (PDT)
Received: from [192.168.20.42] ([115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8f1cf6dsm2300801a91.3.2026.09.02.21.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:54:17 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Date: Thu, 03 Sep 2026 14:53:46 +1000
Subject: [PATCH v3 1/5] iio: light: vcnl4000: use correct channel array
 size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-vcnl4000-v3-1-5e69c2e715a8@jacques.com.au>
References: <20260903-vcnl4000-v3-0-5e69c2e715a8@jacques.com.au>
In-Reply-To: <20260903-vcnl4000-v3-0-5e69c2e715a8@jacques.com.au>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

vcnl4200_spec sets .channel to vcnl4040_channels but .num_channels uses
ARRAY_SIZE(vcnl4000_channels). Use ARRAY_SIZE(vcnl4040_channels) so
num_channels matches .channels.

Both arrays have the same size. No behaviour change.

Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
 drivers/iio/light/vcnl4000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 336468d59ea7..cf55fe6afcba 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -1864,7 +1864,7 @@ static const struct vcnl4000_chip_spec vcnl4200_spec = {
 	.measure_proximity = vcnl4200_measure_proximity,
 	.set_power_state = vcnl4200_set_power_state,
 	.channels = vcnl4040_channels,
-	.num_channels = ARRAY_SIZE(vcnl4000_channels),
+	.num_channels = ARRAY_SIZE(vcnl4040_channels),
 	.info = &vcnl4040_info,
 	.irq_thread = vcnl4040_irq_thread,
 	.int_reg = VCNL4200_INT_FLAGS,

-- 
2.55.0

