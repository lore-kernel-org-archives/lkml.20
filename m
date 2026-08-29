Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5B2C234E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787969625; cv=none; b=PYHs7qB0c1PbQjpIhwVmsso1kbJ9StUUA0KdEWn0yx5NmuwxBEMdYGlAoQ64bQ+KEwhGI3fNsYAiBmY8aPLg6ZXy0Fm546E1wTCrIt1LCl2CrnoQn4JFz7obclK/afVNdM9g2kKdihQ0SY6V/dwIVN6D+ReAYshswSQM0z7QNBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787969625; c=relaxed/simple;
	bh=3bn9nfKrFnynX3L361IeA7SkPPLZeSBoNKVXABaJAMk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Wm7eGhrKoCWJnIj6tMipDyF+E7JpWAIGlMgoCAgsf99Qy8JCW3w4NzzAL9FCu1aEHxvXw/t5mJr0utC7/fJF1gFMP1NlWMWV5diYNBj7koHvAXpm4AK8U3+mL7ouyg2wyVYtNg7bFXmb+sJrYl/qz6Nq2vG83rvvpOAvXXGrYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mhs1xfaI; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mhs1xfaI"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so1560268a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787969624; x=1788574424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3sLbIgmRC2vdoqzM1soIxVMiMdV7lkHCoeOY4VG/jB4=;
        b=Mhs1xfaIbtngKZU+tFWXRIfEEfjOckHkO19TYUogzuIHzeN+BstSnblKGUa5XTw97p
         thE/49P01HpWiMARA85pEugvj+syAyZ1+ag9JnselOTFRkuhUiS8CZpQ9Z6WmCRnZYYU
         PDT/PD6HFnsTtgeTsRkoJX7/HItYg3EXaOXgLtK0ARdsLxyEgtzO7HQ5Qg9JcWZakblS
         CNVMzUdOx71ME7P+6K7zh5kxp3PrYLcZXm+Pl9pW4LsRjQstseWGXbs7E0IqXbmLSpjr
         OWQMG8NNEseY6g38XmpvsJVAvkFcOdMqz0vGIcPTmc/TsW+ooOCVd24wthNiqHPnONxj
         +dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787969624; x=1788574424;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3sLbIgmRC2vdoqzM1soIxVMiMdV7lkHCoeOY4VG/jB4=;
        b=qm3cH3XDTsihp1dez6mRjlVTUg7rQtYM+CPl2TS5kIh+rUhEPNAxZ8LUJ5/pi6bl/o
         +U+11WqVDnrDPfGJX5shfbC+doGP5feyRGpxiu140nsuxlpCb37bYMFVHL2OWCF53STu
         w1ksYF2O8h/TrTtoUrWUoKsjgtFO+oxn5SdR0C2jfV8d86dWAPJOtJHmqbphwSeZ5glV
         QAe12/T6LhP7CbtNkP+iZ+oR54cQ+iMbAJuPY3DO5+3x1LpLHnqBpyLibu0WCfQoMbnK
         tUKpcYKE//nEQ8S7/3LaTuHf3wda+82C5zkCGEgRyT1vrrwkJJL1TBQohv2B3kZ7djDd
         Yopw==
X-Forwarded-Encrypted: i=1; AHgh+RrdjaaDh3pBw1OZL/dDHsgXdPz4/V6sNSlOknJQJ6kXIqSq7a6D2lUsc5Wsd+LOtmFEpunOaL0DYmvHsX8=@vger.kernel.org
X-Gm-Message-State: AFuF++ncMhEf1SseKIl6TgS6KY5icY5Aa5rh4MLibYm+wv5wOWE8YwWN
	RZ6V+1rImjx3lIqPMxuGpgaaCCtqvGJUh4FZuqjHxIKZOnIV2S01W6LA
X-Gm-Gg: AR+sD12BJdY+IAp7JMw+nezFfdoLBYpeC2AQXYnV7tZPt4poFvpeS+RytlIYgLOVGhs
	4MRqlJPK6gza8ZczHLj+4H/BFFN+UiOG1vds6CC+LBSgemdrg1r//rcqA7k0p6wAhca3Kp0dnCv
	pQhjBd9uYkDRem27Vn5OHodjElhL4mOTRDhA1vRM8Pdecq1sqUaZMIcZxZZY6Op/PKkIeT71j6T
	SpZNyYoSxHYY7wZr35ZXwO68CBQozQ9yReS4x2M8GM8n82vf3s7/Jf3lyYA0BmvZGtcowTjFo6A
	eK85EzUAqtgJJ256yYG6h90efr/2kWBkcNzotsL2SKKXN/cV4If9VG4U5VSbsAXoD0Q291vKdFV
	g3PJESldBnonHKS0wXjNB85CJTDpk7+fhphjbHZj4U9cg3ULDNTue+h1to868+zUX5MhmYH1q06
	jUh6I53KZVjNV+/rpGvf1fZ7/jDN9uyMLEiToTryPFlIVdD1DaCzekjk1HfeqyQo/5EBz5hLTHJ
	P3Iw7JCYDs=
X-Received: by 2002:a05:6a20:3c89:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3d3ae40571bmr5788214637.22.1787969623788;
        Fri, 28 Aug 2026 19:13:43 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([148.222.209.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm10164143eec.22.2026.08.28.19.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 19:13:43 -0700 (PDT)
Message-ID: <6a924057.e22746c9.8f0fc.bf96@mx.google.com>
X-Google-Original-Message-ID: <20260828223002.ramshared-v1-kconfig>
From: emersonbusson <emersonbusson@gmail.com>
To: linux-block@vger.kernel.org
Cc: axboe@kernel.dk,
	linux-kernel@vger.kernel.org,
	emersonbusson <emersonbusson@gmail.com>
Subject: [RFC PATCH v1 2/2] drivers/block: integrate ramshared driver into build system
Date: Fri, 28 Aug 2026 23:13:32 -0300
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828223000.ramshared-v1-cover>
References: <20260828223000.ramshared-v1-cover>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Connect drivers/block/ramshared to drivers/block/Kconfig and drivers/block/Makefile
under the CONFIG_BLK_DEV_RAMSHARED symbol.

Signed-off-by: emersonbusson <emersonbusson@gmail.com>
---
 drivers/block/Kconfig  | 2 ++
 drivers/block/Makefile | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 8e49b12..d3a5e81 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -375,3 +375,5 @@ config BLK_DEV_ZONED_LOOP
 	  If unsure, say N.
 
+source "drivers/block/ramshared/Kconfig"
+
 endif # BLK_DEV
diff --git a/drivers/block/Makefile b/drivers/block/Makefile
index 28cb489..f895c11 100644
--- a/drivers/block/Makefile
+++ b/drivers/block/Makefile
@@ -41,3 +41,4 @@ obj- += zloop.o
 
+obj-	+= ramshared/
 
 swim_mod-y	:= swim.o swim_asm.o
