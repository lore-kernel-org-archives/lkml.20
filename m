Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562612;
	b=38XXjDPf2veqLriXA+b94MGKR5E1BpV7nBBJjLeXjRnHZK5G6VPueXHYV9Y5enZQTcwz
	 4MkgtlEJWPuCnMnwSNfIXpYMgRqUbiutRuVhAqJjAzY6hlrmAsqfj2kd8poY9y2CT66+0
	 Bw/H4CSF/wUbFCiGi8J79qPlKcu7DO/mqKF9rOh26LurwPTVDj/BAO4X7pw6CYOnNTLci
	 CjnxCTFxJuKwpD/ngnQeNwQa4ZnfhpuzUnwzpbtu76I7vlGDB4UJ8z4nG+iXQmqbyy7xt
	 hBCaIJ5w6LrmlbkKADdbuPTjjkthFER4FAXj9GwHaXr/x5/u9iXBHT44fgLjFbY7zZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qsR29nfnZSgq4Ri0x8gwo2H00XqMzrH+moznS7qvuZE=;
	b=w4dyPbU40FlnrhgGumItn2sw/fpkyZEAdlQztdOH4mnEjv6gSD5Nh/WpJNhr4S2mTzFd
	 sXtwrhhZz5JmL8y7iBRz39Lk6wbNgsUc4oOedKbk7+sP0tXzgQhY19YGdSzrLze46b4sk
	 bGBX20SLkgp73MZkU8wyjWjmw6JvAf58p6co8Dpg1lpZJScrEIgCdnpLK+bRJuO7Bisfd
	 sjllwKmwWrW9brM5KQpzWgpZHE+61y5U2wuJ2/qNYnB/c4SzJ7VnAyIEqYKD2qNsJe8Wg
	 HvCcf5FHehxb7pGFHH9ZCgSaGYQ2eh1mS7tBq8C59dRjj1FzZZNsX0vVEy4T+V400Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt2e9AxY;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D90606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D90606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt2e9AxY
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so13797755e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562611; x=1794167411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsR29nfnZSgq4Ri0x8gwo2H00XqMzrH+moznS7qvuZE=;
        b=Tt2e9AxYdsRZ6wLm7iNkygRrz/pNUalqZnm+zzG+3//Afbji7Lx6q7EP6sOoMVxq7M
         rMF5X9KC3egBNzc/l35OrbFGa6uVn+iOPFSN56iRgB+jYA3IHNxSMxnfogqXgg5F587i
         rCGPvwvzx9jgSLCzfS/PB6XLAGNbR76gC5wJEnzLC09vl++F1592jTYzmhKpFPXlJe/Z
         k8NPXZv8YEPRS0C1ExC5PvWxzTi116jaAbgFB+aU7+mPus7BVHdEABQvWdkKiJurxww1
         2r+niWxQCYq1GbR34qBp2M+Bu78U/APhbHpQwwk2kLLTdBdxOD6y13iwksjhnBEe5d9R
         ZTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562611; x=1794167411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsR29nfnZSgq4Ri0x8gwo2H00XqMzrH+moznS7qvuZE=;
        b=BxTt85vD8AS0Aq1PvcGNgcCTsIq8wQOC7jMAckSBAVgqMaMuuYWqVTTbDDjN7lr7LW
         yl+3GICZvgcC2STiZwszhWkCRLbADtJS7SqhkO9x3fclylcvzJAgA3Afm8ebQru6JYGN
         Uj+h0GAaPDBY1Z1m8FTrurP/NbfQvf1fJ19JvEDN8V36QpbVRej5mr90swsFnVrfZIda
         l2nSmmGlqpvdy9MmYw7xdLgBxP5z25ygYvg9dhyiz5Qkx7oO8dwEMtW4HJ9ZNe1gVn/Y
         1Hkq+ec78WiZhmaQwz3DKS4Qsee952ECm0wGbsBV/3+TfRZGJ/ZeBlNI2UojSEej2E/V
         BDoA==
X-Forwarded-Encrypted: i=1; AKwUvBwvo02F65byAOPm2a3vLNIgNWw49xaNl5CsgzeBum5cPvL/+dhD/9fLUaSsOdJN8CmkqYgESkViNH8644o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZzjvRD/92P0k8TQaOXSUwlHEmf82DOoAlPvvsTTS0VvQqm2v4
	elnvrIbN63IAgwg12xnZUsYQN+p2rhdlqYCHR62IT9Q36WqHFPVkCzor
X-Gm-Gg: AYBFou2mEJpY8o3xbe9eliwePqKj4nv83osJEqYm4Ki9kyt18VjhL0sEqYd7CznTjRG
	xdkPOikepLPUHgeBIgL4YIAG5DvdruOu+6UBxdbTY8CNZCR8Bh/8cMiW690c7d7p4CAOLhxpz8Y
	swEGhWM/KAywzIecf0qBz4zfBveBfDJOyRuzuBFK9w03vUDJ2tSS1RxFLsDTfEa/kESDY1sUGii
	uvpmGK9HnSGW1PfN839+pXx9/TamMHpu73yT7NAbuvJfzYdXpm/F2Lx871Bv5/SzhEuTEK1W3N8
	Fqddt1yxZ2okVAsqymqh/FaiDCuoi03N/nBuFlXZ6I1InBGBCBURCiavu4ww+TkLbAL7x/uy8du
	QjpvZK3CqELQnkFR4xWG8yNh4iM9OId/nmI8exV7EgAAlYIo+j8VDlfyQsX1wl9DHb/6eSNxO4L
	0bRA2ikSsT7z1f12Pd/ypqTzsYHMpNhsUaFZVKOUDkSpP+lcf9oEUM4HEdJ/CXbTx9itOdrnoSQ
	KnD8rKCRT6RybeARP3p7BsR80UgN8Ozdp2+aBpf5TFk7a9jDzefGE0Ja6nhthzNVG/tQ0lBC3Oz
	yp7J6qai87+qD5LNG5ym1TVqchJ2Fq2bWrLqKt6tsgemKV5KsQWj4i2+bhQEA04=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr65816875e9.35.1793562610664;
        Sun, 01 Nov 2026 11:50:10 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm281548865e9.2.2026.11.01.11.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:50:09 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: vd55g1: Two v4l2-compliance fixes for controls
Date: Sun,  1 Nov 2026 19:50:03 +0000
Message-ID: <20261101195006.220657-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Two control fixes for failures v4l2-compliance reports on the sensor
subdev: 1/2 marks the auto exposure lock and bias controls inactive
rather than grabbed in manual exposure mode, and 2/2 adds control
events.

Changes since v1:
 - 1/2: dropped the Fixes tag (Benjamin). No code changes.

Testing is as in v1. I do not have a VD55G1, so the changes were tested
on the VD55G0 of a Surface Pro 9 (IPU6) through an out-of-tree driver
derived from vd55g1, identical in the code these patches touch. With
them, the QUERYCTRL, QUERY_EXT_CTRL, S_CTRL and control event tests
pass on the subdev, where they failed before.

v1: https://lore.kernel.org/linux-media/20261025154031.27083-1-fernandorimoli11@gmail.com/

Fernando Rimoli (2):
  media: i2c: vd55g1: Mark the AE lock and bias controls inactive in
    manual mode
  media: i2c: vd55g1: Support control events

 drivers/media/i2c/vd55g1.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0

