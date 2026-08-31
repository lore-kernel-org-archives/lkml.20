Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216444E66C5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186748; cv=none; b=C+UPB54ldyIldmD6bsMRItMkfIGuVNNkjPoMKqpTNcukGcOyyLWPo9pNQhBdCinwrd61g7mTWeHCbutDixtUH8EWWwxHZlgCv6H+kLdyLBfcZGzS6svIT3tpvod4fWLhZ2+YKMR3y3T3Qkf4QjskKvIYbXHoy398SQmZl7StZ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186748; c=relaxed/simple;
	bh=lVZf6gXYP3rEKtgCbZ1/usOfq9IncQX1+3NXISeMmjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9RQZi2hyaUwiWuCrVyvXYczwaUcmr3TNntgCniyqVCVGHSt7faY5xZy5I1KCm8zDkDWNNgttB/zORBIBI8PAtuDwGWabvQhcDN+b9EgSNBsBJrSqiNldszilqKrwxa8oX7hQbOEKfhEh+ZQo3z5a4ToqLh5kTz/C2zQBI/gSEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nkv0toe2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkv0toe2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso20873505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186745; x=1788791545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/OQas85hzDcBR25BQh9+KAtaxVWL/DH8U0ZJQTxmJD8=;
        b=Nkv0toe2RMtu4schcQreMthBPsxhBLWPSLYMWI7zMWjZIQtZwrGlKijoof46rz5sb0
         O4yafgC7W054ts751jRYoD8NS/mO4n/EzzA4eISqkMo9Neop69PdRu0XmvAfhTyr4bId
         XMdo8fZWxF3/4o6oA+LZm4vMs/P+1b+m8myt4l5xZHrQSm6BJ7EUhGDQv28shiV8K+s/
         5WemsB/8beAoC/8e7gCz+5nm2778JTiK4paQb/3x948O7ZQ7BBfttkY0wSA40aPLe5rR
         8aDJAVePcQtN2YvM0RK7wVHgOwX+XHrrHUbQ92x+Qt2yoEQ2JJUbmedRlDj9Zh5JuIFX
         bj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186745; x=1788791545;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OQas85hzDcBR25BQh9+KAtaxVWL/DH8U0ZJQTxmJD8=;
        b=kaPxNlx+udBAcBNhpnjZtiBY1fa5vpXG2uczC3K/+ds40vVOg1qc3o3BgBciESSkKO
         aAzkCsVGpsn1rbrJknEOZ5hpge/u27BH+MGnT8umjZJIhbrBIpcjb3IHqpQtNoyAY2Ts
         n9XC1XftpNV03SSxUUF1s8yx4g/pAvMSAfjJjItbOls9tzgEWL/ukdBKOARxm9m9MRqf
         rxpCwWzZz1I55Q5h4T3BRxvznWi8qgaMwC8MSe0L9XH1Rok92ZHq3seLCG1Vilx2Vg3B
         JqeiuSiqJIExoCzNxQexnsFyYuOHHkIPTxK4RE9I+W4sA0cIUl4fhdDsLCBzZykzP3FL
         TVyQ==
X-Forwarded-Encrypted: i=1; AHgh+RojL+gCoV5CzbcZhmSrF90abjlwKu+jn6YJSP12yFELI9zI4uVdaTxVqhHZr4Q/m42IY7hlYj04fXZMfcg=@vger.kernel.org
X-Gm-Message-State: AFuF++lfQ6Sd7cZ1dCIMRF9IjNpLczhI3hwqdxaMEZH9vHlL+J4+jf4F
	9uojaBXLqxK0ka+G+9Z0TVApPHi0KhdiidmHPXmGTNV6u3IFOOT6Jx2P
X-Gm-Gg: AR+sD13WuvKZf+Mp4LhvRmfq64eYqJFRxf1Zc+Rspq8DQlv2XDyKVzELzux/BUbMC6F
	h7YQ0AVAwtySeNy5Pjk0DiWfu/tjza7crw7hT6JjgDBNA6t++sr6RyJnAlvpEAhHKFpV8W6rOkm
	51lxUR6ucjAZZKw6D55F1Ba/JtTLBdMtFcVsSR0zysDFRbhu1C1vbRXqiH98FGHbuD9XXErvh11
	eBR++hpBngqHGX6X1bGW5uIGDo5pzv+5hi5811EeUk6Zfwjo0j1zGju7jRGgeaisrxGDptg70GI
	/LdIR6jIonZopa+DMeEuHvHa3gPjiG/nveH1C2y6yadTHPvxXckmaRC5dPfH3kagQa895fAJW6T
	7x3nuOk2O+90QAt+hE7fkH8af+9/8GItF0HGmqXJxZlm3yX3gVgKObgU46r46mGr/06v1Zb+yph
	WNqPHbFEXxgyFMlESjwjMbgUF7gMlukUOYa/DRjF5NyzjgA53XR+gJ9JqBbCbuBLhXyI2PLK7gV
	Gygmap8rGh1+AHRhwWbXc/u
X-Received: by 2002:a05:600c:a48:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49b91c3b7b6mr330456825e9.9.1788186745344;
        Mon, 31 Aug 2026 07:32:25 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:24 -0700 (PDT)
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
Subject: [PATCH 4/7] docs: dma-buf-heaps: fix CMA heap name typo
Date: Mon, 31 Aug 2026 11:31:22 -0300
Message-ID: <20260831143125.151360-5-ivanrwcm25@gmail.com>
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

Line 39 used default-cma-region with hyphens; the registered heap name
is default_cma_region, already named correctly at line 26.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index f56b743cdb36..92099188893e 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -36,7 +36,7 @@ following heaps:
  - A heap will be created for each reusable region in the device tree
    with the ``shared-dma-pool`` compatible, using the full device tree
    node name as its name. The buffer semantics are identical to
-   ``default-cma-region``.
+   ``default_cma_region``.
 
 Naming Convention
 =================
-- 
2.43.0

