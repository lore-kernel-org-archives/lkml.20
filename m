Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570620;
	b=LnIsZk3iAOvQCDB+TLfe7VTj1PXb1Dbk8XIKQ7sR3126iu0R6KWENpINRPQbzP6JEHiH
	 6JFgWHfg9L4cZMSTffEVPZ68BJZfMcY9MTA2ccl0Z1BVFBGTVNkC6LY4cTW6tDGYa90FY
	 uN9ess1g7+nU9wF2S6/7B8UihMmH3gdP4da33oAPBY5kyWdIrxPZm/S6JP7ndGALVFKK6
	 pw7i1imoJFB9uaV18K8hOyRrL5RevqKvv2qQCeLBwTMd0XOWjdceo9GQKJkVe9iY8Pqu6
	 xYxIspg2o8M+lBr7TONVzRpqzmf4vl0FIhMlYiwRscjoMe2bx/3saq1EERnuWOzbKWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570620;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UY1okyns7NT5FQLJrKgxa/NNPq2GQbKS49c7wYd8HH8=;
	b=As9zK7gwf71ZnBcIOvRnhI22rjrB7IurewQlMJYguxwem9L+gDKAFTmM/97EibUbOFkb
	 +h1HXfMTkaHUduTCR4KifOaL2LUnWExWVa9dq4LAWcFaRHP0SfWUsBbPMljK6XXHhFc4Q
	 DDxhvu6cvzHREgG1kCGM+DHotfT3vJsHyZA1UZ8MyuHbgmD3vFfDDsm7e02BMQ+2J5zYp
	 TEgRDS3PFlpjx0wGBlOz7RXTVZwhgARC4NlavbUWjiQR5Rb9WNY67ZKagVZ1O9A0qdkiQ
	 eqyiLqx5ZuHb0ar18bLVFrL+f6rNt/wKK1NwU2/NQSu1TEFumeUFbUDmwkKfzHyCckw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=sErYa9zu;
	arc=none smtp.remote-ip=91.218.175.60
Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86999606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86999606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=sErYa9zu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZU8JJ4+fzvklfFdZSX6U7Yd3ZSn55WdWlpLFwkW9Yuo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792570617; v=1; x=1793175417;
 b=sErYa9zuKrmVyKcCPwOSAA9a0RLPQ1Z+EoaP6VhbomaR775C5UWPjkiMFYyI5A9J3XnhbvtE
 5nnjXf+TdE3t4dlkJljjA9LloqHa6LlFrLBNKjKlIeS83Fr6qto/M1H+4owc5WUDDT5WDGqSAK4
 tErAA9tNcMK/ot4KYyOOMKP2+laCZlXL7J/YUXMsFC1I13ZrQxwjXipTvZy94M5/64yoUM1L1qJ
 wdnIIUyq6X+h7i9OmXHdeVc4DsiZ0pQjNBYalJrSeglipjBQc3KDs1P0jwsyOYRZ496wntQY63X
 A/Fda/IFpBvtrdQC0+lfXXB5WUwIXgDNZMaDFteMeA2hg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f61deddf70fa9354;
	Wed, 21 Oct 2026 08:16:57 +0000
X-Mizu-Trace-ID: f61deddf70fa9354
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weijie Yuan <wy@wyuan.org>
Subject: [PATCH v2 2/2] docs/zh_CN: remove Translator field in header template
Date: Wed, 21 Oct 2026 16:15:58 +0800
Message-ID: <89d676d79f25e12c1dcf19529f695117c7983263.1792569583.git.wy@wyuan.org>
X-Mailer: git-send-email 2.56.0.379.gc618271300
In-Reply-To: <cover.1792569583.git.wy@wyuan.org>
References: <cover.1792569583.git.wy@wyuan.org>
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
Content-Transfer-Encoding: 8bit

The credits of the contributors are saved in the commit logs, thus we
don't need to repeat these names in the main text.

Remove the Translator template so that we will not sprinkle our names
throughout the source for every change we make later.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Weijie Yuan <wy@wyuan.org>
Link: https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/
---
 Documentation/translations/zh_CN/how-to.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 9ec2384e1e76..d448ae69e48c 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -203,10 +203,6 @@ Git 和邮箱配置
 
 	:Original: Documentation/xxx/xxx.rst  #替换为您翻译的英文文档路径
 
-	:翻译:
-
-	 司延腾 Yanteng Si <si.yanteng@linux.dev> #替换为您自己的联系方式
-
 翻译技巧
 --------
 
-- 
2.56.0.379.gc618271300

