Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8BB38DC64
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168447; cv=none; b=ZRSPdYFeVMkbkl/eK7v8PPDU6zy7QcuvhwIWOi1JC2UGxVUyZZQ/M8/3+cTd4XRWp95CDpZAftPOisJYGGsImX96NHbB+kR9ZkyKroWYItlSzq2y71MdkHIcE1WiYBmHVUJ3z8glEPz6s17gmN6YeGUhPQH+onbg5WOAb3b0Vns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168447; c=relaxed/simple;
	bh=qiRAXZkRJEXPmqs8IIFVKCH0Z9Kb5ltx/zf1mIOnkpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7pK1110r6baHK3JpOvk3SB/s1KX8V2wqXvOU9vgtyh0dGS3kSyHMGl0Ffboow0gRx41r1N2p4PiMNj/E0xMKdayGP1vMkOiIAnMxumfv9SkNYRdLM3MaAPCC4nfHX3RvxBHFs6fQscMtKZ/dCoXCcU6amAK3v6iywT14ikP8jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMryacOp; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMryacOp"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e503815adso9817185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168445; x=1792773245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHrZ44E7mwbp2nfJxIBL5668mhyMNf3IrRHINSdc80I=;
        b=gMryacOp8OWOdnsjDfFoTn8t8hmkzwqNlobI0iYqM7L86wd8LtgLd9xDswuqApgHiT
         OqJ8mcsHshjwy9LbrNuu/JYC4K3SMkLY7RLcJmkt7pcRAs9oyMVGyVKibvaB7pTl4eS9
         oznDAaLfB9LHGYgVA9IxXyuA/Eq15F1kxhnZppNHTMY6/pLRPlKMw2409G6mWEjhVCzK
         khyy94UVbgzDUjAY4sjwefWJLpfQARWUWPat0aYwAc1G+jitJAUk8Mk8x+Fw6VHr9Q2f
         yFMA4jyA3rNdbP3+l+B2Nh5HQAjSPmRZ+kH6N8GnPlsiWeYtVM92Ma1ywOriLhcsGmOC
         /r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168445; x=1792773245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHrZ44E7mwbp2nfJxIBL5668mhyMNf3IrRHINSdc80I=;
        b=nYo3zOY6Yp2YzKchNPcC/FEkFhsR9DW/jMLdQZ9btrQXzr+rflyabxy9lQmYz2A9Bc
         Z2aQ+X3JsS+PHwyJ9I4Lc5NN0o3ng5ZtsCCniPsPbttdC0Q+7uEnTCSn9+ElrL6uaIdM
         3BLpd7CMuFDHf/VZvZf5fpYSE89hXrSxpinRR4MJbuZVzPDDs2YtfEJisFVAiWtfxPM/
         HtUjlPHT2OpF4VqAIEL5UPKKM+wMR+R/bYXNTdZ4ltjC18JCB+hQXPXZQ2ciTOqFava1
         o+pE5tMFNSO1hMUpDH+ISk0kIMxSQisrzXuw6htSR+4jvQ9nORkRLYkh+pzXsHghkXMM
         f6Yg==
X-Forwarded-Encrypted: i=1; AKwUvByPA3ve2/i6N8hJon5Rs91hHbBJeiRmCGgKDstpcCtNZk5gqiICLsIhl3RYPmVqzbAYQPrt9om/49ZGLzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ27OBAWe/S2GesqORL7SQ5c5rVyrhLMTkQXM5/ue/4WuZbqd3q
	4pJIZIT5hUVL9s14AaoE4/o+PAJBLJHLycBG8XcKvZVCHDIyi2ImcnnJ
X-Gm-Gg: AYBFou3mwU/cia3WrwrYeyMy4Em6ZX60R6JVqvYifECLq9ptrXE7dfawntjwpEM43aB
	eYjkRWGrFj6Bcp8+0UMFKnrdxmtLpa9VAD9oIBbsl5rudO/ZPWC8Es2025f8jHZgzT7E782sUIy
	gd5EoD6I012JHN2rhOUG9/i2BGV/b6Gmvvj+HKjbVR4PT+cWX1LX9fiyf/buYF8sGpt5el8WflJ
	LymaWJLqMMUIGHcXdYvAJb/ZkoEZxb6u1SmNxyJfNlSKs+dnOSKw/0z4qPqD4BmOnExWsmfKymy
	+Gr+yOeYBeNGyekhtdzZgP78w/H9ta1vGecM9O7WYzp1U1R5NCfLBFIxNJNMRCJEmj+2ZMwzQSI
	MhWEDEe61BrtmvhJFOtJMhf+kb2LNidfNIDLbxn5tXdkp9dhsyYDuI+MUvZNK1ZjFdJbocyO9iV
	snX7TYwUMrCqkg/wP+K1ZUgkr1vOiGX3ObXeTp2MZ2I2Bxgw1O86tVXqnSPCtYB9Y=
X-Received: by 2002:a05:620a:439b:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f29b7eac0mr63046685a.10.1792168444661;
        Fri, 16 Oct 2026 09:34:04 -0700 (PDT)
Received: from beelink ([187.15.139.183])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcc47bccasm25272806d6.20.2026.10.16.09.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:34:04 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v7 0/2] HID: multitouch: fix use-after-free of haptic data on delayed input release
Date: Fri, 16 Oct 2026 13:33:47 -0300
Message-ID: <20261016163349.3293666-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016151343.3120300-1-qwe.aldo@gmail.com>
References: <20261016151343.3120300-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v7 fixes issues found by Sashiko on v5 and v6.

Patch 1 now moves input_set_capability(EV_FF) after input_ff_create()
so the capability is not advertised when FF setup fails -- the caller
masks the error and EVIOCGEFFECTS would deref a NULL dev->ff.

Patch 2 keeps the devm_add_action() design.  Changes since v5:
  - module_put in hid_haptic_destroy (not devm_release) so the module
    stays loaded until FF is done; __module_get for devm_release itself
  - guard against double-init (return 0 when haptic->wq is set)
  - NULL haptic->hdev and haptic->input_dev after put in devm_release
  - restore dev->flush/event on devm_add_action failure

v6: https://lore.kernel.org/linux-input/20261016151343.3120300-1-qwe.aldo@gmail.com/
v5: https://lore.kernel.org/linux-input/20261016135516.2957381-1-qwe.aldo@gmail.com/
v4: https://lore.kernel.org/linux-input/20261009103333.2476105-1-qwe.aldo@gmail.com/
v1: https://lore.kernel.org/linux-input/20261009031207.3233206-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  HID: haptic: reorder try_module_get/get_device before input_ff_create
  HID: multitouch: fix use-after-free of haptic data on delayed input
    release

 drivers/hid/hid-haptic.c | 105 +++++++++++++++++++++++++++++++++------
 1 file changed, 79 insertions(+), 26 deletions(-)

--
2.53.0
