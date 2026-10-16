Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D2549739D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158938; cv=none; b=XPVJNZi6Ioen155S22ZbbjYFrpb4gp5EI2Z/r6e6ZcJqHyFvW181VMZD3CYMMsJsZDeUKv0ca5gDmSIi1Je2tJ1JNQnkMWPeuMo7+YwqeUTugbaJYwWe2X1WFcXIsGYgQ2DeqouYUEGI+Ik/Xe/jfuecaS385KVaYur43LsXttY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158938; c=relaxed/simple;
	bh=WgH0xFGsLcxChp9qekgARXHm3ntKjhWawPAWTCPfAS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccjzl3FBBxmdheVW48WXHqixETuqBgv8RAsjIh466XY5rGKAMoSwKNJjMxsyU5eA0pAEQPvnF2xlNmmKAM1atSnC6rjZp4a3t1agL/rSH/ZVUw0GwxXcNMDzjhm19g/AdnxPDh7JYFpRQve82EgJWhQCdNXT4yg0EQYzzfXXUio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IP6XiVFy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP6XiVFy"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1979818a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158935; x=1792763735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaG+BrVADgXDwHo831rR0nkrlIE/ZtOkilAp8e2t4CM=;
        b=IP6XiVFy4O4dxgRkddrCfQ8p30NCiUIMrHRL8LLuNKVQzXfRK7QW3z5jjKhMnbM91x
         7xf946aV8eF3+zEDQ9qvvZZMssd3QFkKMgb6riPRHzLrMGI20aPIgH3y4YOZxftfvJl2
         wdaFI+0B2JBI+96USezfU4BOxZIcjvWBztqpii7GTVnk7RIQVeJhHzxxaUaeaHEXYUkZ
         nFjlM1UmwCzEaIrPi1yNJ2IjPU48i5Mnu1vTZvgSQUiHrhfVARbp+p6iUFuJDor9EvTt
         3spGOamte90OcScjnPT7WriLe4hiJkONzRRXs0jaPKqX221fp6J9bTg20j8ZWKDgr36j
         LBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158935; x=1792763735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FaG+BrVADgXDwHo831rR0nkrlIE/ZtOkilAp8e2t4CM=;
        b=NZ0AKLe6oOhlfIa+MUMTSL9JM5WSAR5PbtB4eYRdFVEkfnaaq+gv4L8wBkuzSxv082
         JOS7oQ1XLLY9lMvd+e5DmsBCiNAqe6o/ckq6jI0oGZ+12V332ZDjbMyHLB+jpfG3NAjh
         sBHo1SLLUt/eRZDjIUmZfsddiwnpfz71yF2t4Ab00PQnMfzaiEGXHRUa3Nr50CaZq93/
         sUz2XwTibYtVZQU9j41ik6DlHqX1yvjYagTtNb2Yjdbwh5/i14o6iqkOsAwIWFLROEhK
         8H3O915FKwnBhKClSC+8wRio5lhAAju4ybo20vBQWJ58SEZmAEjdj19pZ3REisMGI+nO
         8IuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzINC4ZGkjOC20+J7cVjCIz03RxeV2COe8IYtIO+DSRKgszmnJ/sHz/6XHwSRHLZ14uOzkrBRiXetZ4hqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3jjGWXWnV1OtCa9RCTNKLfwbZwB/7IDqcCw28DExL2rUY1By4
	Kb0cgdiQm5cvDldSK7a+VwulLGWedTFNlTZM5GC+ryiw8nW86hUFoN5g
X-Gm-Gg: AYBFou2lOfLUhBTmGP33oOfIcPJyuHeJQVGCcuszpZHkUPFuyt/CiGI/Oz2KTueGzDy
	j/QDxRELMKcmaQYSJQSGrG9xczskdGKqHEDVy+SolN45BgPFRhPCmZdaQEC08df6piRN4HMHbbI
	bNWyPRqbv+Xv+cX4kH2LX5NZoFKZqsxV2B7rbiWgmkzwpi2sWGLqkm/UKOZfLYynMawIRAvWYwJ
	HkLgN/66kvyY1kJUV97jVVkxOrfqvnMOD3y/hk+vwpHqMWko2TvScC58La4Uk/x759KhE2+oF5b
	GxAxI0/cg0SqJ2vDSeTtRPkgpdTtNvIfCCakwEqmcr96FFrlf/paLlG8BAitCBTHdtUYHW85MMR
	GeOweRW9DaFKSOfqrNPgLON4aWXFhVz+2zocPpWcurYe5IVsMgyZu+HT5KbH/duukTWpF6WDvDZ
	wtU4ahkOntxPMcxx7iBd/QW7TDj28jKdpUAsMcTrY1oHG4/Nb7luWHoe1yfWTqHUl1
X-Received: by 2002:a17:907:a317:b0:c3f:2:6faa with SMTP id a640c23a62f3a-c401e136d98mr341429566b.1.1792158934663;
        Fri, 16 Oct 2026 06:55:34 -0700 (PDT)
Received: from beelink ([187.15.113.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328775sm75262366b.7.2026.10.16.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:55:34 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v5 0/2] HID: multitouch: fix use-after-free of haptic data on delayed input release
Date: Fri, 16 Oct 2026 10:55:14 -0300
Message-ID: <20261016135516.2957381-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009103333.2476105-1-qwe.aldo@gmail.com>
References: <20261009103333.2476105-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Benjamin,

Thanks for the feedback on v4.  Reworked as you asked -- devm_kzalloc
stays, a devm_add_action() handles teardown, and the try_module_get
reorder is now a separate patch.

Patch 1 moves try_module_get()/get_device() before input_ff_create()
so the old input_free error path (which returned ret == 0) goes away.

Patch 2 adds a devm_add_action() callback in hid_haptic_init() that
does all the resource teardown at unbind.  hid_haptic_destroy() just
sets ff->private = NULL so the subsequent kfree in input_ff_destroy
is harmless.  input_get_device() pins the input device for the
duration of the devres action.

Changes since v4:
  - keep devm_kzalloc, use devm_add_action (Benjamin)
  - split reorder into its own patch (Benjamin)
  - single-owner teardown -- destroy only NULLs ff->private,
    devm action owns workqueue drain + buffer frees + ref puts
  - input_get_device pins input_dev against concurrent release
  - workqueue drained before any pointer NULLs or frees
  - input_ff_destroy on devm_add_action failure
  - no hid-multitouch.c or hid-haptic.h changes

v4: https://lore.kernel.org/linux-input/20261009103333.2476105-1-qwe.aldo@gmail.com/
v3: https://lore.kernel.org/linux-input/20261009110509.2432308-1-qwe.aldo@gmail.com/
v1: https://lore.kernel.org/linux-input/20261009031207.3233206-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  HID: haptic: reorder try_module_get/get_device before input_ff_create
  HID: multitouch: fix use-after-free of haptic data on delayed input
    release

 drivers/hid/hid-haptic.c | 87 ++++++++++++++++++++++++++++------------
 1 file changed, 62 insertions(+), 25 deletions(-)

--
2.53.0
