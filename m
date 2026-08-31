Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C70C4E56F3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186737; cv=none; b=KGUiGIjiGgzUEW5FGlYPy0ts+Z3aLrP0xTtMz+wg0++2vUDp1i26xDWfL4DeEAS5I26K5a3De9lxXHPdU0UmciYLFRkU8VE5LkRdjgT75X47vsrxFnBoG7/jQ6kc70f/QRGddpCT7vL0tTtWghnuSLebj0Dh8XWd/9nV56Qlj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186737; c=relaxed/simple;
	bh=OzOvqUUyFScK+c4Qm0JM+we4nmEqm3utvu0fjkr07bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrQY6kkDwByUJhxhgYC2eMY6BTm9vTF6RH21+lsUl08hFAwytZNiwEVvqcelZYw43sEL+SM9vDh4niDt8l+Hq8iJpY+hUNmSY8Qt375sPSOCYmi6wsD3KDNo62vi/9/oq3Nl3j0shpzvz+mIshuXHlM7+ilPqHUr4ug08oMa51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuFS7zui; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuFS7zui"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so34011455e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186735; x=1788791535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/P140PVQM179Ozwd8WDoSSuyK9DDQ6P2ESr69rhbMhw=;
        b=VuFS7zuikF7DdpJdHg+JELfjNSOvQUwUEw3P5IVqe7DRtCcJLMftwcQtBCnP+gt6lx
         yEh5yTx/M+zAQpdzg+YCt711JxkNRL1mxEFuTR1+aNOSspgLNmvMaLwOGmI53nOTFEBf
         fkhXxQBBRG9BvV06G/sBQX07n72zz88wZE7q7P+RNy2GstNo1zus+cYB/w2kdNVRpaQ/
         Wgm/Zqq4eAZ+2BUqzgCw35KbmrZSBehlT94UNAfNS0Pcja5DJyJbp9odSvEn7ydrRKDr
         mROJJlxTL8J2NBUQuhQAolKFmaGdN/ENDUrnTGZ9mgGm98/LSPMBZ0vPX0FYOq1w3WtK
         SLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186735; x=1788791535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P140PVQM179Ozwd8WDoSSuyK9DDQ6P2ESr69rhbMhw=;
        b=LY4b0fwOUSbEnQ6Y8X80n9Q6KFTRej5Q4KZDMkIP7EZRnmIMCxx4rw9o/0P0PrUXuv
         H0uCNZpjJvcfppsRhxcJAy5wtEXTW0RGpjq6f6WGpK7WFZA+NynKVYptvVkgVXo8pxsm
         nDsIO3ISIhqYKQDFt9HO0j1Pgsq0wQyEVZidInvbDCU92COVdyo78WR/E91xgefvIiYj
         4EFMmpYa6snExByt312Wr/hGhaXx47b187yMnJU7Mo7ZNhgkqePPGD8MI8xN0iYdg+gj
         uqkF/IwqTBgNXZQf4Y9op5YtQ90vGYfo4oOOgnrDZRk/VSmekwoKYyHhU4Zppo/q2qWg
         /+rw==
X-Forwarded-Encrypted: i=1; AHgh+RodjXQk5NlRlfDPqvUKiXyE31J7MGfv75ITG9IGTd4svJGFqoLL0pymIecUWGEWKnmMu5RdSPXf/lmCD10=@vger.kernel.org
X-Gm-Message-State: AFuF++notOFGBtSPRjhwvnavhtAta/9GW+TceEy+Rtjlx72+DG1mb0Mj
	uXQhmjzBNMdfkyx4MGHVKi09rDx8qH5IOiPZvmibiukFCVWN/uaU8kYB
X-Gm-Gg: AR+sD12gI98UGHkAOCqlKcnd5EvOsSp5Eng3YzA2OC4u2sRUsCqvv7t3ZMM7oW7L2Bj
	EjOQkakiemgOX6X3fmccW5Tyz5giHRqIX5/KRIAJycey+qthoGY2ckWLsMh9AVQ1H2WOQt5eDva
	VlvHLRE5nNP1YFXKEH4izMHJdTBeOUukbbDo7Qjui4+Pc/Wdx1Ca+tbv2BvnfLo+Fx98Rqb9zbq
	sgcoQxr70GhbLDnIWgl3TvAsvJIqxJyt8s3gb86bx8X8WUnCd9o99S05TVnpB5riAj5UM+bHXMT
	E9xN6j+cZ5TCi9/p8BpA3IXkzQFsxuezuK2yTLudta87FeOLPrqbD7ADwVqD4v6+286KjSx0bU7
	U+PjjWPK0tcjdoZ3mpvYn2hqZXQr5I0bfm0VBxEuBYtLIND7Pzu/GTg7ZJQqDaLAdpLgp9eZKAk
	Xw6Xd0PT93t34eJL2vbd6j2MmInIixOkPvmAbCy5amkXevxDeWxDo8nApO8i6X9mPnVBTeIZZUc
	P/INoFn2FppFbd5NpYZGsh3
X-Received: by 2002:a05:600c:3b20:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49b91bd78cdmr340102515e9.0.1788186734682;
        Mon, 31 Aug 2026 07:32:14 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:14 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 3/7] docs: gpio: note lineinfo padding must be zero filled
Date: Mon, 31 Aug 2026 11:31:21 -0300
Message-ID: <20260831143125.151360-4-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL reject
non-zero lineinfo.padding with -EINVAL; align the uapi comment with
gpio_v2_line_request.padding.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index f7cb8ae87df7..5515b718886e 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -218,7 +218,7 @@ struct gpio_v2_line_request {
  * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
  * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together
  * @attrs: the configuration attributes associated with the line
- * @padding: reserved for future use
+ * @padding: reserved for future use, must be zero filled
  */
 struct gpio_v2_line_info {
 	char name[GPIO_MAX_NAME_SIZE];
-- 
2.43.0

