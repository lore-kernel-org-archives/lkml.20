Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3248B57F734
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171875; cv=none; b=jKRDGSNLqMy8OZQuTrW/ZwkTvQFuHGf9DsrM538C/Uggg6xs2DHdVlrECa23uRPm2lkLIvpZDRzjFwa9fQlnHzWwUk8DE8HGGkW9cxkpvV93vnZKQaOLjCG3M9M/aZzKh4eLchozZGJm8sQwd3yDTv/eCBgqnXH7UMvxL+yCyt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171875; c=relaxed/simple;
	bh=GS/EYR98hY2wryjgXLxl9nwG+m2ja9oOJZKWvsufTwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aikLmcSYDuHE0pzFmUA9FZO5364CXI9RZEVDxX1fH49iZOP/WNeUuc3CcSb76EZlwqOhKhDQEFAvAxCxUHRBIAs3sxpp1uoSnEUqToZvl3B7l3Nb83BMqFszwL9CcXOWbjTHKTwxndAbpTqTB/h9X5HP/YCSQQ/IFnzZO3BM2pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rgj8YaVP; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rgj8YaVP"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f079a63b8so16872685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171873; x=1792776673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TReqZzgYDqKUCRA8nMpcehhIY4deNasK2PBu/OtaUHI=;
        b=rgj8YaVPjyJJe2jhDcK+nRaeEgbVLVGUvEYtFIvCjOrfs1eq6SWIxYIQSLzSme6iTz
         EQU3r+m/SQz6xahvsEF4BPGLJQMnaulTfqKbu/SvjHn9o81UbNt4iuRyxJQfRU1krEmJ
         2pVryk5/vdZXS5uEqVqWJYGPgtW/svQ7SlVdBhK7e+6FTuBYPvEerPOsHVdTo5Ngv8q+
         FpJv7wTA8o68f+uuEjoObaehGZ8VGgTJ6pZIWJ/qFVf5RsI/elqulmzdIDxSqyUpNNcq
         cxAKL7XQn+b5tcLjXO9ciXrSdR0I7UjN9IGA0kyUP9likfUIVC/Wbyoi74Xk8Auod6Q2
         X26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171873; x=1792776673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TReqZzgYDqKUCRA8nMpcehhIY4deNasK2PBu/OtaUHI=;
        b=tWVT9uySYQj8bePaMDVniHJ/yLIDNqQLI6CR0iEWT/B0pWrHCu0HdSrXU/n/ablyZx
         AFaTjfStwrH8yIU7YN4Hy5Lf9h7lOzrIBW8/u1Ix06p4uDbhH/upNYO22wh5AxX8QTcq
         IH/QVku5CVp6gTVGmUTtVdEYvWao2NSe6TuoZ1iMAQTUl64xWgKFjk1ZgFClt+C4id0b
         mqP/AdyLxYgYjpWTc0SS9L1gW86CUic70HwUlV+5/JgDJfEomsL1O256K3kLJgJgQVxJ
         +mgxkMaiaYw9J7fSg39tPSjnJfzYDVvxubgkWKhTMCx1dY+ynyVzQkD2726C06BxJFwM
         IgSg==
X-Forwarded-Encrypted: i=1; AKwUvBxAdGDqexz8x76kpsnYYCjPzHibLubSx7EmNIuXhoqrSlL2RK7fmL7j10B0MyM61tjKGg7C6V93ZVQOo4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuGp7fEsrSXm0DXimB7xxNHgoIGPEL2ZEJCCf+GLHln2Xc8974
	nYWTzCiwXsV+zayLADfuGRwGM9aPLeZQjBFh3sfi77h6yjC6AbCbPKG+
X-Gm-Gg: AYBFou1MlfkWF/b1bEQU+RZbloyri4Q+22ueuzSpY5nYKyq2eN1e7EQ+KDHBGUGNSvJ
	mUrqOb0a41AjmEGzz8ebtrrnO1w6d6efKsmWYL3PZaC86gaYshXRh16R4adMrKBUXr3GG0Qn+Ed
	f7zEvQaZgglIjOE9XsMZ3XRek3DT7kr6FnrcSDW1h5i52tqaKpMsaUiPLhwvh7nP3WuRJetsBKg
	SNKDM1+8VSgtSjYzW/0SmSqkUiLcp7pQbBoxtZA96Tyx7mTa06Dlb59S3sGrzOVfejv+aF3M1qF
	JHzr4et0G8eu90CBP7P3B4ighqeuyKO1mPuieUJ6QnBmHngbfQf+HQ9t8Qbwzn5zZWxg8nj1/1M
	uXqApPYBJ8+N2XW/wHvBjcrZKDfszqK2Zu3W12rFxG2WpN4bvy/bMZfZ35gRyS8sCs/lc1wtugX
	zKyEsiUi78WzKQ2iw36DUzuVkIxrZbZyADMiYFbrfeoR7lAmth958Bzt+vCjB+uyU=
X-Received: by 2002:a05:620a:4547:b0:93f:2610:fb6d with SMTP id af79cd13be357-93f29cc832bmr99546585a.13.1792171873049;
        Fri, 16 Oct 2026 10:31:13 -0700 (PDT)
Received: from beelink ([187.15.139.183])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a18510fsm262760085a.22.2026.10.16.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:31:11 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v8 0/2] HID: multitouch: fix use-after-free of haptic data on delayed input release
Date: Fri, 16 Oct 2026 14:30:54 -0300
Message-ID: <20261016173056.3397211-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016163349.3293666-1-qwe.aldo@gmail.com>
References: <20261016163349.3293666-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v8 fixes issues found by Sashiko on v5-v7.

Patch 1 keeps input_set_capability(EV_FF) before input_ff_create()
(ff->ffbit needs the bit), but clears both bits on failure via a new
ff_cap_clear label so a masked error from the caller does not leave
EV_FF set with a NULL dev->ff.

Patch 2 keeps the devm_add_action() design.  Changes since v5:
  - module_put in hid_haptic_destroy (not devm_release) so the module
    stays loaded until FF is done; __module_get for devm_release itself
  - guard against double-init (return 0 when haptic->wq is set)
  - NULL haptic->hdev and haptic->input_dev after put in devm_release
  - restore dev->flush/event on devm_add_action failure

v7: https://lore.kernel.org/linux-input/20261016163349.3293666-1-qwe.aldo@gmail.com/
v5: https://lore.kernel.org/linux-input/20261016135516.2957381-1-qwe.aldo@gmail.com/
v4: https://lore.kernel.org/linux-input/20261009103333.2476105-1-qwe.aldo@gmail.com/
v1: https://lore.kernel.org/linux-input/20261009031207.3233206-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  HID: haptic: reorder try_module_get/get_device before input_ff_create
  HID: multitouch: fix use-after-free of haptic data on delayed input
    release

 drivers/hid/hid-haptic.c | 108 +++++++++++++++++++++++++++++++++------
 1 file changed, 82 insertions(+), 26 deletions(-)

--
2.53.0
