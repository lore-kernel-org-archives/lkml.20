Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35145505FA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083309; cv=none; b=aZkHoRaLMMPYc/DzMfXkGgs4E+EUJKJVzHN5oQdw8QNVwsOW32mxm8nfYgeH2XMUXawtNXg9II1B6op5ux8BgMKu0UJRBbM66QM9GW4ucMfORnnk8C41Ut6k80NBdCbxnW6iVGgCZLfhG9QhZApojb638UiBHI7MG2w72zEoxvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083309; c=relaxed/simple;
	bh=2inYdETjS1/0iXkUB93PtZKo6J17s5dPHUL/VIsncwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjOQsb1UVrH0kwGTQdVdAgfX+fQZMyiXXUKpubLpAo8IcWAvu1owKEtAlhfci2r+9Xy/PkTbxIXM5tLKrJNs6nTpRH8Smv98VNd86juRiA7WsaHA7LVONge8FfVowYSbxhUm5N1g62NRHqiC36gh7QYV3TrmQv5e3R+j8OK9xEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IGEslRki; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGEslRki"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df8fe8513so644292f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792083290; x=1792688090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOQQ4FV9ljkth31bB4LLMsIJDcvWTQeL1zQqaIAUkSI=;
        b=IGEslRkigK5qf5tPYJAaK2WsSFRbsNtb8EFl5Py9DCeE/I4VHBTlJAwbh6dvdqy6EM
         vaBmfY9X5OM6LEUIWk/A79d7DoVtTYSTddmsmfRuqQClXd0Ugh+RA1/Uw4O/nUaLsmdo
         2ciGx4yqcPMvbf2JOK1jbP9WTT+njoQxSxwEto8Fmw/ZQ/DAwXAOURwTBgLLw9ixnEHR
         bPqiaSpwUCuQyBSgguhqiVz9sfRWzlRy0IN5qbB43mtR4YpNtDacImnzTB1uw5f7Dgy7
         vsdyDDsL0hEfeWPqb1xk2NX45AsET2b43bl7BL9aNLH48eYl9fO5smN4g6sWCNxipROr
         6//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083290; x=1792688090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOQQ4FV9ljkth31bB4LLMsIJDcvWTQeL1zQqaIAUkSI=;
        b=cZEzFAUMixKARBCrDNz1GcXPKiVqvwChUyTHwVbjQzJaL0I4lp78IxB787vIVF5ApE
         Nl6HkrMnnJkCagwFx1b/fch4qrifYax70wIPc+wqdyfHWkgeTBPEUpTba/g0Ed1Vn04I
         ubg5Bj8tT0uus7MHIFdwnY1Q7ttmD1O9ufR5L1n/2cjyz7GaNMA84ghRfGZ53dS3LzNT
         e3PmN8c4diSfSEFjn1R3ldY3kHXBf/zu/FlSe/4udkRqgVrdvvSUOxuBGQlJZyvURLEG
         bv7LREexJjDwfgEah/kTWI8TJ9HfE7Z8oMHirzB+/W5bxMPTOLxArclyNyM1t+ig6Qky
         xPcg==
X-Forwarded-Encrypted: i=1; AKwUvBxUs/4AV/1khtoj/NEeOAlWGB+goZpgbt0N3mxaVF8W2DuL0aJrLnRZpqj65Ma4qmj2z7sFMiZZjS/Cles=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9zEyjA6orS0x0oqmbjjIYZYdvJ/6j1B1JNsETUPTn7bdsRZOw
	ppC3dATiFt26I5UbocFiX/kkaH4v/IiHU9jt09h3qAoOeko5LOkp8CLcbeIbKvGu6Ok=
X-Gm-Gg: AYBFou0SaUR4gBBLbm1vXS77mjh2mABDpezDBcGRM70tjTCYIyo17un9WWq3otFXzLF
	dCLLOjnlHKCBna6Sa6Zftg8EOZfJddyNfGVh4Fi25mBua7wOjNgZseNQHETGmJtnTwmnDXJhioa
	NQ3lENflQRgE7K70Azl2qNHpCzVB1o6nI0yUrZN0yDiKEGhvpaIm4QQSXU4D0zfPybZXmJ1ALhJ
	P2iojPrBN45BSMc9OKAh0MqQKNazvdFrje4DMl3NSup+OPpooTOMcQBAd3bcE8/XViVXs8NzZhY
	vJrmriEvUVqQzhaaHV0mlh29e0FIGdS0ZL5DXaO0z8x2hi045vPkE+kMlPQ0GfJhV6Ql6DEHvWo
	eEiHdAVcxu6V1hP0bA88HxMrrh9Ici3pGLrAl4BYi+s8rJ8w5vzi0yrjZsvMUB5S3Yxx9u4fdK1
	3RzHt/1Yi2WisBcoSG6DaiSECdsNUrq2kv3HdldgJHDYJFsIBUyw/jqldS4cMyaxE4O0Jl3ywwW
	tKv9KZec7i0SptAYBmjmkv/CfiNuK3RojyZsE1u4hpmLWY7wVCiM9k0fXdB7x94vPWtxA==
X-Received: by 2002:a5d:548e:0:b0:486:fb08:2353 with SMTP id ffacd0b85a97d-48dbaaeda2amr27025205f8f.31.1792083289768;
        Thu, 15 Oct 2026 09:54:49 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm20775664f8f.12.2026.10.15.09.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:54:49 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Thu, 15 Oct 2026 18:54:33 +0200
Subject: [PATCH 4/4] clk-816x: add sys_ck clock as sys_clkin_ck alias
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-patch-ektor5-dm8168-clk-v1-4-8b99c5cd5541@linaro.org>
References: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
In-Reply-To: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792083282; l=1025;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=2inYdETjS1/0iXkUB93PtZKo6J17s5dPHUL/VIsncwk=;
 b=1O5ZnXuEuCnMjVuOJ4/eQtTIjxT1rnz127MjHOzITCjBaKT4WFTMzwIdwSnN3JBq7HUuWeMkK
 TtnNlcvtqHgAr67OdDdCYKEthyZ5kv0y+0ALBbuBnHrA6OOgOB7mXzO
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

This patch adds a new clock alias for the DM816x system, mapping
'sys_ck' to 'sys_clkin_ck'. This change is necessary because the voltage
management driver searches for 'sys_ck' in these systems and fails
without this alias. By including 'sys_ck' as an alias for
'sys_clkin_ck', we ensure compatibility with existing drivers that may
reference 'sys_ck'.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/clk-816x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
index 3b8e483aec92..fe6f66fc5a05 100644
--- a/drivers/clk/ti/clk-816x.c
+++ b/drivers/clk/ti/clk-816x.c
@@ -57,6 +57,7 @@ static struct ti_dt_clk dm816x_clks[] = {
 	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
 	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
 	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
+	DT_CLK(NULL, "sys_ck", "sys_clkin_ck"),
 	{ .node_name = NULL },
 };
 

-- 
2.56.0

