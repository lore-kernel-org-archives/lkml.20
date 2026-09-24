Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBA3FB055
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231729; cv=none; b=iZNlqyZualxZqqYXdzTpejjgMT+nPWc9pwc7mCK9Oqz2zhJJfcMyJS+N26XPZ63QAfIbqcY9Iz6HBUr9DrS3aTozmxgoORo7tT+owWB9wDgy9S5LixgOwfJ+UiDTj3DLsGmiml3XcM0xHTvkBVVpMITNAswE24oL14CMi/C3clo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231729; c=relaxed/simple;
	bh=KwdQfLFN9qP1Uy3/R/YcRZOunp2/x7+DEgYdQS30umw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVhTLr4Tl1g7Asi09YMv5hKNXIWewdtRrdA0xpwxTxvAD5FVjvz6Hm1VOiM7WvlVUxoCWnjbn6nynsavL4yQE+OtGgR/IbG38NJ/6w1Zo9dM/DSgQY2w20ZwYQiYcihk4kwgTpW7Ju3rm5Yr8rVGLzBa4ZpevSrKvEiRe2yvyCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB/S2IO/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB/S2IO/"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1240291a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790231727; x=1790836527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Lg8cX0rN3DBpAk0/WdaoBs/N2TVrxi/nNoDNY7O6wQ=;
        b=WB/S2IO//rXoRKsFY2qtbT5OHCjIG7gIDF1KxEOzJEOlWivUzysmjEDZL5E/myYEzP
         iOwBF0iLSus3LUQgxim59rVttHEjXpTfxH/7j9zfjEYq2D+DllREyBfROhiokJyoGgYS
         L/hvmAZJWn4DVwHWmbiBiYpVi6wy6sMC0YJVZ4OOWAUwiE5zoNnTF+yoy9N3c2w/2zxF
         xtoGal1OT7t1U8Es1njO+uLrowjdn3mUDIsYXyoDGwMFWj7K7ITd0mmqZlm8+qMHNjHU
         uALXdzvD6sKn37oG58YtL74X0Fxi+KiPbrQikOMuXhpP8ejRVn7Ov/Zr51nEwGFYesc0
         ERzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790231727; x=1790836527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Lg8cX0rN3DBpAk0/WdaoBs/N2TVrxi/nNoDNY7O6wQ=;
        b=XYPR6JWxdTeqJ1HB4Q0HXN7fJ7wKT+IApYwLngLQlm92c0B3d2UoCdXam8H8TbwVop
         bnAbirkkjuIV2xL0bycc0ydeCrJ542GirZ9Blb5geBPq0A2cv1TIs0TECpoh54J3UEva
         3OCOku3lELVR2tWlAfuBCNU1PfCfh4wshsLR6yQDp9sxGAeU4ZtLulg1axgIRjhQbdAJ
         0V7pJQFV9y5EwCxQ3670dsFghEYawcKvM3RvyjUedn8AvDw1eOiodPl1xZEqiYk6qp5M
         z/9dglysOxxo9mdK0FnxCW2Qf420SOWsl+hSGPOrETYOl+QZvIGdIzJhkovQZSh2jW9L
         spMw==
X-Forwarded-Encrypted: i=1; AKwUvBzX7bkHksgKes1825LHw8BGoP1QwQ0FCBzMQ5Ut7gxONU0q7YBBlUmHtF2hOdU1promNKw5IhtcblfofBY=@vger.kernel.org
X-Gm-Message-State: AFuF++mesk0sKZexRsHsvdJ459G+B927v5DMvyQ4ahnlegQrbCak4OT8
	VxOx8vppqm81nJDCeYVDadzImoeJ8ymsGloG02JNgPw4FSa7uAF5vZec
X-Gm-Gg: AYBFou21fQVCyr+TINEFznD4o6f2/EQWXQ/S/slb9PRaysRwwEXxxmxFjE35nYBMPiP
	AuvUclKtw3KE2yey1XW7NeJ1JA45h7Bfz6oYxm3MOdTpkBnCAIVB5UNvYHzWdewKJNevl6ZL8w1
	GqqUAqpCpXFfXMAAAsH1xLxs4zWJPp+o/dhZ5o0LEcam1yG59KSH+JB3ShnE3LMDtjp4nDOxIcY
	785y0v8nBxA7bdOrG3MNgA/iViakeAiS8fR38E1xnUJiZS7WLj794nEAv+meH6CH2XSUkYGVQ/o
	uyOLhoJKjNiqGxFr1vNi7dc7c9z8GYapymv2mvtokdUZZZvX/UslqmrO1O4sgMBqO0nLmrOm4l1
	cnn8RZkwakDnxi7Pvz0bOEN9uocHwBjxniV2B57iCj15Od5W98bgAlWv1ZgGd+mGUAfAaWOd3bT
	Qmuf2lZyWc1XcliohT3Ho3u+Im0oVcqfmD8AbXP9U+05iEuBe59HijqoMzwaER5T9dhyIttjpXh
	li7+HnZnDWWQ6P7A6hSc8hkvbaUbhdY7XvMixeM6xlK3xQCeC7afsCbgRfZWo440Z5ExY+q0EF6
	O/Ogj2cbSrQ1T5LgDJLX
X-Received: by 2002:a17:90b:55c3:b0:39e:6a81:f34a with SMTP id 98e67ed59e1d1-3a098bb630amr1174600a91.36.1790231727242;
        Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096b8753csm3109897a91.0.2026.09.23.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:35:26 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 0/2] io_uring: fix CQE32 and CQE_MIXED ring refill handling
Date: Thu, 24 Sep 2026 06:35:23 +0000
Message-ID: <20260924063525.2500081-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260919203516.2581409-1-benquike@gmail.com>
References: <20260919203516.2581409-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two issues in io_cqe_cache_refill() and
io_fill_nop_cqe() for 32-byte CQEs:

1. Restrict skip CQE insertion at off + 1 == ctx->cq_entries to
   IORING_SETUP_CQE_MIXED rings so pure IORING_SETUP_CQE32 rings do not
   emit bogus IORING_CQE_F_SKIP entries.
2. Require 3 free CQ slots in io_fill_nop_cqe() before emitting a skip
   CQE for a 32-byte CQE wrapping across the end of an
   IORING_SETUP_CQE_MIXED ring, preventing an orphan skip CQE when fewer
   than 3 slots are free.

Changes in v2:
- Split into a 2-patch series and drop the third hunk from v1, as
  requested by Jens Axboe.

Hui Peng (2):
  io_uring: only insert skip CQE for IORING_SETUP_CQE_MIXED
  io_uring: require 3 free CQ slots for 32b CQE in io_fill_nop_cqe()

 io_uring/io_uring.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog

