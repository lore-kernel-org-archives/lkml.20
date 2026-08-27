Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF83E44F3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872721; cv=none; b=IxFqyunMJ87rfn4IUr0x1H3A+pEgNrOiu/hz6k4J8vwVPHPiA311/XWyj69wY0qwXz9GLUUGuPLGAXsv3dpcbtBhtGpEPhXhA+37XWIDPw0QKwch7PYMkWyw/sVh0/FpaY/CpFyuCvkj65tIsRUBKQWhSMDv8+NUIAsV5+LXkLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872721; c=relaxed/simple;
	bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7XuIp0+vVaMUERjKEm254ukLX41QallyQiJAG6tXooTQpu36X7gTU/zVU7NGNjnca8lVmLNL85arMScCw4OevQzIv5wrVXL03xc0NbsuHD4mr1DolRnJepqgWWwiE5sPqGi6wdOi7Mhi5poh8QN9ig53JEv2rX1BQ4HexX5mMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e71RqdlX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e71RqdlX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso1634855e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872718; x=1788477518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
        b=e71RqdlXkOF/7EeOFNo+K2j3eTp9az3iTHHyxN5Vr4Ng2mSLXA0A1lQ+wMibXNjYzI
         GKHmd2SAcznDLEgvfnkSQ1zOtzLQmgljRwdjNEKLolhxQ4FFOo22lgwNpMbiXiMzZPu4
         prTuwVTsMuCSS4s+l6V9CFleK1GSWGiYPjz8NIJyNTkk+2FtaT0ECvFhY7sypCaxf8qu
         JMYKgxpXTStIOLDRQ29F5LRDi91Wt+rzXZfpM1oioLegegFmX3jflw8nJPon6We7aYig
         tlT6Z8zBoCaG0Ts+X88lr83TDdxCOK/tbwtsaLB+WX0oJJenNdfAry8mFLpBVfOM8g4W
         7oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872718; x=1788477518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
        b=WLKhk9EM2H67NI8yeNX+5rNZ2Xplkadf/Qz1T3oMazaEvdbVuJWKgD0qkVTmgUoewM
         yjBOSkWmLcq6V82vZBLzInLwfQRJdVr5gdEamVqxKRS3/ae5ijUOb9X513xgs/Ds8XNl
         fgUgeT0t2dgfwL8ibw1XNgqhR5d6uOTqtaqLJOa64pEqEzds4f6oherA9b2pQS5Lb39E
         B8bO+HA1yKic2EA3wfdKYVNx5rUt1ikqHQvttpa706OCXNnb0H5OZNlzrvWCu2+u13n7
         s/8bbaBotNF/evM8akKhAnxi4f8YcrNJPmDHC5AeISCmdGFYqtpfP8vzDHTkTLi3D/xU
         dazA==
X-Forwarded-Encrypted: i=1; AHgh+RpAVc7KjY+Bv4whio5HcHfChrmORTurHbaESDVPp7vWpLEQDBF4R6JdkT+yWQwLXJX1v1hyRGXDvBk5y9U=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Qrp5F02NLQkR3lKquenpOgZmpcGY0OTSAWabApGrtQ+gcYHs
	LZaw0/Bsyzda4xcpcbjrOQ/pJpFHJB3A9Z+5dghr/lzaq2nqwaqz3h4t
X-Gm-Gg: AR+sD10/uaZsagauxHh12Fsug0uG5LU1buUZJIXu2WbSNOEnhuU5xU76YrOw9vijkut
	EonV3bk4oWCwhLLEEsM7YowLXZtvpb/Q1+MnTDvwzgPC5FTgPvzHJgokgBMphnU895zWDwD4uTS
	vUFZeu6SNx0SzBGAwJfXGhMRExNZE9nMi39QIi68MU2P+8G6RpzppJXs2yEBM5nR2Z/bR2pdZMP
	TfIXOhyRbtsEHDZO0vsvSI9JdznKqQJ5sTf1vp+hCMMj3tN8TiG7jxsHRYYxf814IgFqwnOjE8F
	ir6HQ30/N8NpFx/c7/ooPMr75HMJ+wdT5UJol7Wh5rfQV19SbjN4+wA7K4s7wSEj0/67M+6AeL+
	3i9rwv98+ZC+FxNm2eKrTsa96EgwXmu4iXequuoh7U8tQs85FOAVZDBl/aCQULBV+9Sv0ZFD3iF
	8Naz2uAiqM13otZgV/ndLefvHQOiX+C3F94mYBiNx31LoVhYUv8ky+vtgdH/FePgp6mz1A/IiRA
	7RlY/kr87ewSiYXeTD0RC7rQNOQUGzTVyclhoM7SDcl2w==
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr35819775e9.10.1787872718427;
        Thu, 27 Aug 2026 16:18:38 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm89930315e9.6.2026.08.27.16.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:37 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri, 28 Aug 2026 01:18:34 +0200
Message-ID: <yogabook-media-ov8858-pahole-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apCUKIgOZMoeSAP1@ashevche-desk.local>
References: <20260827181756.2430054-1-mauriziocasciano7@gmail.com> <20260827181756.2430054-3-mauriziocasciano7@gmail.com> <apCUKIgOZMoeSAP1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

I checked the final v3 object with pahole. Struct ov8858 is 792 bytes,
aligned to 8 bytes, with 4 bytes of tail padding. The xvclk_rate field is
at offset 8 and does not introduce a hole.

The original digital-gain explanation is restored and the existing
long-gain programming remains a separate helper. These changes are in the
v3 series sent as a fresh thread.

With Best Regards,
Maurizio Casciano
