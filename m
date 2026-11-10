Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347762;
	b=i+89yz5Ze7AUWSxCHU1bnjlu8gx4/zMLxQOvCBwI2MGolJ+uu0qqa3JmHyI7zwXSU42Y
	 +ZZFHuGoWFPK/nOyukWOWla2Bssc5oieJF15c4Oqpk30YZ83qOxe7RXwaqkWfMnlfUH9H
	 oDmT0JEqfLrmgHHvTMO5sJL8nubYGAZddGkj/TTDvX4EF520xYbrCbKYNPXOpG4UVtUKn
	 hFSXTldDdEi3o46uz67PvKcCqwuIy7yh6OSGr/AerX6m7YRdNk0Ndfs4pgH8sFos4teuL
	 GsjYSn05sd17o7DRD461mMNNqJ+usNDS/n1PyXwL24umg5BjYizd67K9jQWwsUDPAJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
	b=zdzB/4V2OGI4bBxNMjnxQUOgRzZXo73FWwk7rbKz7rM7J3AC3kqXhdwuNJ6hXjSGtzEL
	 Zn8J3sZddPI+CSzSWmyqQUwsJdyaPLKc3XcXwUnP+C3B0PWQrR6caKuVD/156jGAiETVP
	 CfhDwCWIM7rUSuuU9AjvI06fQ0oRdoDZoM/FFeqWJ0SzmX5PE05fxv3AkDvpvHHVuxxhI
	 W89dy3tNLwevfvkYihZDd9vaNjQW//vLJZkHDTyAXZWjto6sZS4BOvi7yTL8d/FJh6AWo
	 UtZ9zLA8KWdnhHCsrFI8z0n/wJXhGSbkZCp8B2NK0+0Vs4EyPLIsLovgJ5lhB3mpQ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LXonw+QY;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA760A263F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DFA760A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LXonw+QY
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49134c8509fso2094564f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347760; x=1794952560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
        b=LXonw+QYfhKw9JBD8V/vtFjdqGS0AwKeVh+8N392JDHAtx21gMIa85s0DmJr6Kfk4K
         1WA/ThjqVS51qwQAddcnN4CM5b75eLydFNmRHgNZprBBI9cZC3avnr+RJ7PtFwRiIBtH
         iwFAwe+V5PPsFkd9STJZBJYji9xCXEhscDtPsChb+Cd1EeoRvKwrkrFs2iG0gocRLGT0
         2htfvvN55i5hNAzOzgedAeo6fsGPay90dk/JTywf2nnmJ+Pxagqvy5A7u+K8gA569YTn
         Cs9z+u1jdZA5/p6XxxlFYylt5QzttOAAu7w5Waq0EfeDgBV2sJIyQf0EiyiLuKObI7I2
         UyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347760; x=1794952560;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
        b=G+d6j5YQwZQuckE03zLg4YxThZ4Ahz3ksnQ4/TMn6E9/TRrlM4zELfeTshUDbe19kY
         kKCrC9F6uCOO5AT3erU5EPahLsLpNvSWdhHegecxAP0Z9kURcTNkvU4rC8UyMvXZLOdn
         Ap1cCFHO/VOwcY0NNUatxY4wOeAzw4Mu7cvUQ2PKIxVtnNl/JSnY0FaPzw1ypOz/fDa4
         EI/xiHy5dwDroho49aAqem+RoxHxzozdaeaJFEGJaqLpPEQl63uI2sWryWh/tlndpmpm
         MfaKpWAVgQ3yBojZeE+7qdoyWQ3E0FAEzuSC32kigHX5OskiKUuByPDHURTM8Eyb1pMr
         6KPA==
X-Forwarded-Encrypted: i=1; AL+hErHjr/MiHKAjZiJm6Q/KHfaG1oa9H83xb8YkzHkRuIQ+/VPdyxaMSZ9WB2v8sUeJuFwEr0QgBDgeaOjfefg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cerDUcOjDNtlFoSgfPZy8Qow/vmMBjjmEQzZjyla6BUPC2wGH
	s3STlRKXb+PkQOUxohgGS26DikLHYMZM7QnxFHlW3enatj7t43JnIo/V5ThWZkJq5FQ=
X-Gm-Gg: AYBFou2krd+YNjPAuhtUnV37TBqpF3BAMZMtpeMbPk0dJDI0eiNMNIPwv1AIw5pRkXM
	ZLYczejB5r1BdoXVvbPe7pNMgA71cO1BK5oIFei48TvX5pt9AOgEyGSwL5JY4lpg2omj/d+Pqcp
	VAwUwjJBeuFN+9rBbCnO1gwWuRgTPGuJ5h3mZ6x9z0Mluco+FJ0tZ2RyJ8/BvoaLOiJLgblv15U
	X8Cd+CQsNyVLsVzU3ovJkPQGbPZ2S7XQRa20oguq2acuBBlNVdT20UzTbW02IRZd4EMYjHbPFOe
	OBRnlv+auGU3zZPdNIyyvsuauxRBfUYfST1ruThqcFW73huavL/5jm678lB20QeW8dgW4XQcS20
	HaupP8x24Wr8yUNP7YENkzvROTFewuZQm0MQQjIiSrq/phDil7NjogqI8c/Z2Q3Q1sY0c/LJ6M+
	Nlda2jzrmdJxwyWGcBxa5prmRpJr7sYpRQwzScbPIsAbG+UbngUp7QmuUxgEc5rO7/vVcd5Nk2u
	WRBAZIwPLSa8jnMvy4H6tvciR8WRVKO+QXcg8zTWtXxYjxruZklxXm4mjdCKZw9NqXQn6PPjQVB
	hvpbPYrL1o3OQoL9kHAw+FMsx64hVDSI3g==
X-Received: by 2002:a05:6000:402c:b0:492:820d:107e with SMTP id ffacd0b85a97d-499c792ef4emr428787f8f.47.1794347759890;
        Tue, 10 Nov 2026 13:55:59 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4988bdef64dsm5664845f8f.20.2026.11.10.13.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 05/20] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Tue, 10 Nov 2026 22:54:30 +0100
Message-ID:  <f24ff673333c0fe34408abf1a4f013eeeb5b63d2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WVXc1FvtvHtwehAQUPEvKaZfuWX+hZavONn/+2WOSYw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KisuoYTGXVnjuOAoBv1WtV1Dwwmw2ojVv8v Er1hTByizaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSogAKCRCPgPtYfRL+ Tt58CACDo/1F4WSgBgjg4oDThZrM6JlYHXkQrOBvMkMkN/laIz2ikPQOpQcH6kb1HJ8KJICzPkL nfRlyhLgE/4bzVPNjE3WM5My9hgSQ4RpVWEWH60bylCAJ11pxX2cVVohWpRVn+y+R/9aa/4zl3L rvKkcDx2LZHxL/56lhEcX2R4suG/y5AkIlhXL1SAz63gSvvtJJYRPrnEt9TvbnByWDDTe3MYns7 odPfiaSK40lzbMugKCueM5ixaCZQBeGFzfqChaFn3vmtjN/AYYQ+vk2OVcJDXbDbkLJaLH5peEc R/SfnNv9Eoz8HYLAASLC1o3YqZMqweOx9lMdqz/6Z9nDEq7I
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 8a97c30cad3f..8263e3ff8315 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int mt6360_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.56.0.rc1

