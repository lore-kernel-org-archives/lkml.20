Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890946;
	b=BWQS1aEepCD4/y42zTTZkOlCGFZlGmlIT6w3g+uHwJQQvJTc4yJH1M3lgDFr0EWp5LY2
	 jvv/knTI7mUiEgWhgdBflaYLFZW8C4Xenr8tgxpcOIfvyBIoJ49a/g56Seo8OBv1qAQGj
	 /YMnhH9VB2Na/mFK/xalpmUZ5/iwUUmzM28bxsOB52bpR0HdZ+YvOUR79skcuGunevfvE
	 oIFsoOpI0WkCYoh+9/cUiKh9qflW1my7pMeFPFKyOSSxAmB8ESS/m/ga8j9gG0p17Bapg
	 lle91s+T1u3dHVlZdDs1ANXIGdfqrMJK7KuVPPSeIHdsQ9IBWZfAD8pWZxZzL8orqfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5XXfNWmUTdQwwlPTsJIdH+pEsp8jvzlkLP6kkxV9f6w=;
	b=4RDStnMsyFEcPCbJ8hGMgVpJ6J85iiyFeoIQk69JWADk65H2R+OvpraaMv30XrmxA7HW
	 HKBR9GxYYq57/ZIJwbbcS+fBHXOsJachYxOB8S/8IRh6iHFcFC1iZoJ6FF/TBcGOILhnf
	 Y/uwQDq43I0XXeqEls6xCNFa+US0D40F6F33WYcHGyLZvnP0dZXhtv+8caeCA/ulYzOHY
	 1kvklqJPDRZnXdwzMzM3exYXXQUwakDl+Px2FLUT7b0xirjg3W9siZJ9Q8fMeYBE9+Emx
	 AiR1IxNSxJ0WoPIO571y1yqePdRM/0SIAlWJCgzZ5NF+GGjKp9kUGC4qrIral7hnRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ytKq9M/f";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E9606D822
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955E9606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytKq9M/f
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1068878f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890939; x=1794495739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XXfNWmUTdQwwlPTsJIdH+pEsp8jvzlkLP6kkxV9f6w=;
        b=ytKq9M/fQJibzBL1ikjVi8O60EPDMuZmD5vX7jCbFWq7L/oRNpFdLQNzvuWvhVd90X
         N/YLCUCJ2OYpB/RLWFN2+qnKoEv/kBtaB7d8gEKwFIdOugpxEcOrgTSK/ZuHfwJnuNJA
         1vV5evgrd/ZrNLzrFBQO/+74q3slAfoPyb73lz5RzDPfYfy6uk5eRc8HvS6+NszgFQFo
         nx30fiAesFQEtLdz2sC7anOi93gMxP88nX9Wqdi24bGNBeXI0UMzj6HkEJl+6k17Q4t2
         1sjFWaanmIL+1hoVxqMilcHJfXXDnhXwmJlXEAtpt7vHYEt5GeAWSO5aJYyp05EQonPs
         oBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890939; x=1794495739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XXfNWmUTdQwwlPTsJIdH+pEsp8jvzlkLP6kkxV9f6w=;
        b=1CNONsnbo5ppzdms8WzFLVDWeiX2tMLZ/PULvLZ/I7gX45D8ajBVPAJoevSEcF4oXc
         xGvMYVlZkSjVV8BCCoYTfNCJQNNuAgyxnncnSs5LfAVyGqRxqk5oCNsgcz4mg0GUVShx
         flEFFhmowB16yZ/IOYQgC6n/O18AxMVGYI2QWirVIgH85Vy7c9XmYcFgqJpnb3R4snxE
         DkpCsmRSrHET77ZPsMxs1lD3FquY3Sd9CGqotmX44iREZEU5o3duacTKOEX6Sbwgc/6D
         nG+2BKz4FA37H01UH/jcsAGFHVa/c7RihubfyO6ANeRGwddr1ku+AcG2e8MHE3dec8fN
         GSwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnuCfmdDinddvvfGqISZNPtEstBIe9NQh7IFal2OpVtoaTy2aKzTsUBMzGZ2XOk5bX78j0MTMPobfDlmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TCD01c1kXN+Pcpbn4ch/xMscl2uGzVAL7cupBH5BiCu7o97dT
	Up5P70NVAIRkx5DxMl0GaTLEyj8Tlksh1w3ek4l0kRSfkDS7TYuGPvTC
X-Gm-Gg: AYBFou0ENyAa814kE/ZiQAZ3TzpqGN7F4R3lr+PLgVhiBPqfo3iafadJnun/iIwuh5y
	jyyuqN03PcQD08Xm6zpIeRIEyrFCi8sW1G+0OuDBMOqIQT3jmq7ArAXPtybdmD96BIJ3cYrCYog
	0TQOfETTnDgZDKGL8M4cpsoxG02mxmd5MdH5ZkEWonI5nKQDu0AeXOJmTrecT+OMFH1S3cRdjG4
	Vr6CLWNX73BUk1U0XiKba+V+WgKmn+KtZe/mtmgNzNvBh9QAw3/ZrBuJOcOTsnbXcolQ955VHhB
	aD95x3E94G4KkuIRG91ira/r3g8uYjYQUKTVI1+zaujelAi2MHZpVFD0UncN2+rYOLUtsnVTa8v
	gGSmraDANZTByMXBi9pLXSM2HxJhu5mQQZr/U8cUW1DsIJLd7hVlSzjkAYDW7X18vpgqI/11Hgx
	GxRrpmFg/yQ09++B2Jh3pYY43xujnKO0HDiBgk8L2UjRAzjFxAfEbOy/Oj+mtuAbi3clvDZQMup
	SamsoFR53PGZcMJOzsH5wEoxiS7+QyjQPBqqZw7TraKUgxtSiZAKRT+Jw3LuKxbYGFTMVvAkrET
	Vr5Uzxb2kLVHb5CQcvGhFfs/VI14XbTG58prowk3ZWasVFKcKXyjQEDk+XjbvKr/C0UpMJpi21f
	eWBxBRn0kqxzf+C5/RHlEHbRFMMzERJsUmty2XJPICGBTnw==
X-Received: by 2002:a05:6000:29d6:b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-48e6f76f49bmr26301083f8f.9.1793890938744;
        Thu, 05 Nov 2026 07:02:18 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm11042960f8f.40.2026.11.05.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:02:15 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Thu,  5 Nov 2026 16:02:04 +0100
Message-ID: <20261105150207.23023-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 280 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 260 insertions(+), 20 deletions(-)

-- 
2.55.0

