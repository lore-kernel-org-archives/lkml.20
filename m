Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510883;
	b=qQ+/+ag5PBT4tUQ2MNTGaxIJD9S4eSGMlBUIMRqPILh7K5oPIu3/EBVPB8pY74RsY3+x
	 hMR2YQPw9m6iSDqYsLDJ6ezGSy5zpJaZ2W3NFKDvL7qKzY3GmjzkcfiqKeGUMXr2UAgfm
	 O3/QxE4dfkD4n4orz1KfJQjO83qH903fkoM5w8zNwSHC/kpy0S5Aqao/nlU5D3NlKaUOJ
	 pGwJThmOa1o5Q4D0UvaXcNslAiytIeqC1LmiUh0Y5+3pws7+lAijoN1zZjBHCiHI2Xnif
	 31fSAG5DKZxPY4XAKlPDgXnJ90VtAhwwU8ORZyyQIEDci16TjdO0VMqKD4f6QKCVl0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PbotHI99tftecSRxei/okpKKDZBbbGHapfuivs9s/Hk=;
	b=TM6KXL1yUhLy5c/i7c5sRjWIWqXJmOsmOq4gR6AfL8LIBecuoR3NySQ+9y0rejHD76TE
	 vRpp+WhfvZTvt6t+FThn9w8+o2OSoQ7VXr4w/AG1+1NvbVvHyIaLf/pS3LiExTQkW0+a7
	 0/B6QN7LCCNanzNwpfrIj2ImWzwhx0QSpMpQfv+JneeuKJ7MwrVbkWK127M7CxN1Ufujy
	 lFkfBdU67x8jAQlqv6+JzOrz2geyks1c/zT9xlkI/nAucZm2iVYc+rJYLyrmoVC3YIQUQ
	 4piVpGd1ZQQQoEsnB0mrmWUHTPlb2pRNGzFUZDOfbj9VZV+0wlWiVavAfGSvNAmQ2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EUZoVCgE;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B07606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EUZoVCgE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso34024715e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510882; x=1793115682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PbotHI99tftecSRxei/okpKKDZBbbGHapfuivs9s/Hk=;
        b=EUZoVCgELz3j+oN2CgMRKyp7JaxNmw5ownN9/r2+E2tpmbuT/HyEZcZnsA40fLxwoq
         GFC3DLYvi64xceDDGOE75OTBQgtXTTQ4F0Fd/bjCIkwD18sWtAKJs/rDTR8wNQqcYY/u
         SOyR1I0O16vZxIIyU2xzkddNpoxKJZeyS7mYMQBPZE13YAlqkO6pLXwOdbUWm4cRdywq
         nzyXEwbMw3hxGB7BiBpruzAigNJ/5zSjJ6Cv2EXxsv9MaTj8OXQhj2Eb1jsdrVn1B4Ua
         kEX3309WTkzs3Wr/Q25uHwUDWTcHUpaP+nZMZNFivOYH7bofRA/LpDz6Vy+LJk8UWEZh
         BjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510882; x=1793115682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PbotHI99tftecSRxei/okpKKDZBbbGHapfuivs9s/Hk=;
        b=gJpJgItRGknEdkUv98j4RB7XuWzxCK+ZR3eyBl5AGuZE/PnLM0w+Ds/nLfhdn0km8U
         5HDrdAAeZL16CZWXbEwB2AnCrOxSU7xA1Yscjk/8p0lMKTlJgjpgSSuYAe5WL1Un/Zj5
         ykbCY5zlzCpi6UFQ0G2GhhVvmIyubJvTHtZAG1RbL+NcADUDKUTsov+ftPTcbMtwF3+6
         HB/hppTq8ElViaDtMIiP6rNTDs+/zjDDIe38256QZQX+RGKfMqiu7libpUDF7ZU0NYpy
         1y77C1XLsfNmZSptORIpOYIwKrjX/+eft/ZJfuaIkGbeXp0SYrTdkenOlU5mLnckNccg
         C/hw==
X-Forwarded-Encrypted: i=1; AKwUvBypRaqh0bak8UzcmMLvW+U0Rrh30NG+Qp7Egyhp6FrQkYoJA1lzLxCzD5jEstBPnZQVl/nfCHdC2LKbShk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3FMkfO/45PGHKIOtZhh/KndCMyVMe1R9bPolR4GwrdowT1s4s
	g8oO7UNxiDhyb2xe+mOHTKUHv/ehYjF/dQXjDm5EzcjG3QwZUmsWB1E=
X-Gm-Gg: AYBFou2zeqFZ0vQ9gyB4i7EzmQlsNlrTEMz0Amiy7I7vmyyKZYLJy0n/sECzjP6hO2d
	6TqOUrAYyn8Y+7MVoMnYrCwIZGIELa9DGQnN4mzUQLLJrWllsg4bMPaYA7Uw514aAlSwOHgT081
	MkKJe+dRoyVWlpxC9r9NxBm3c5GzNfWNwNN+A79S5DkhFwGrRkss42huH+QghXpMlv0xgSon0zp
	UROj98JvHxVzdbmi/NfvOsdlH3Xugcql4qc/jWF90rwUy9KG79hiSLuIL/ZAbw53EIn/NUzU2fD
	FBfCYU169wBnRSWQKHAF/XG/DnGj/+UVke/zWkd3YQUDL5NhH5lFXkSgDEFyodiQUYBZQva9kbA
	It31jSi0YlxzgFEAO2ixkFZhka/xBeMX2bjipgwjX7QWQjMopU1r29ILfMNZNxoBcemB/TBSh/v
	Qr2UL17UcvilsjoprK1Z0IH+H1PC80FZsAOm+rpdk=
X-Received: by 2002:a05:600c:820a:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a1d7616cfemr234758485e9.28.1792510881449;
        Tue, 20 Oct 2026 08:41:21 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca31234sm256606155e9.4.2026.10.20.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:41:20 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 0/5] extcon: cancel wq_detcable delayed work on driver unbind
Date: Tue, 20 Oct 2026 15:41:14 +0000
Message-ID: <20261020154119.2568395-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

Several extcon MUIC drivers schedule a delayed work (wq_detcable) during
probe for post-boot cable state detection, but never cancel it on driver
unbind.  If the device is removed before the work fires, the callback
dereferences freed memory.

Use devm_delayed_work_autocancel() to tie the work lifecycle to the
device.  This matches the pattern already used by extcon-gpio,
extcon-palmas, extcon-qcom-spmi-misc, and extcon-intel-int3496.

For the Maxim drivers (max14577, max77693, max8997), irq_work was
already converted to devm_work_autocancel() but wq_detcable was missed.
The rt8973a and sm5502 drivers also need the devm-helpers.h include.

Tristan Madani (5):
  extcon: max14577: cancel wq_detcable on driver unbind
  extcon: max77693: cancel wq_detcable on driver unbind
  extcon: max8997: cancel wq_detcable on driver unbind
  extcon: rt8973a: cancel wq_detcable on driver unbind
  extcon: sm5502: cancel wq_detcable on driver unbind

 drivers/extcon/extcon-max14577.c | 5 ++++-
 drivers/extcon/extcon-max77693.c | 5 ++++-
 drivers/extcon/extcon-max8997.c  | 5 ++++-
 drivers/extcon/extcon-rt8973a.c  | 6 +++++-
 drivers/extcon/extcon-sm5502.c   | 6 +++++-
 5 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.47.3

