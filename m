Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A84D17BB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163637; cv=none; b=YbHYY9rGpT1UaHTozEnUm6KhCmXAOqLsyUjkPLgJAZy873Eccs6kJf2wZHF5oaT2c/1DErUj3tZKMbhKFyQu1vDy/0z2oQt5uT3voWj9kCrhuQwLTvZ9nUV0P0l3BvpO5jBcAuPgYqlo+Z4iha6AAVo84F98QgoUTxuIqRnBe6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163637; c=relaxed/simple;
	bh=SZW8P8HaP/6LFI6azkqEpyOh628pL3diXyOw+JET4z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nesmThmuWm4EpAzw0KxuhvWOuSAP8/9+VScgzRG6bw3JhEClTuas5Hi7VYWmEAbt9459nhrz9t2v+CIAKBi9a2eQULk2R8C5b8WlWQDmEYGbPAxp+NG/u0Cr17P4KBamUFKxW5buUCiFkewAal0J3N+8HkOMfYJ1kYOkA1tz+Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9GxdE3A; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9GxdE3A"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5363c8de563so143061cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163633; x=1792768433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zv8TTKfbeUYEMQDxnGPnn21N4WT11tkkmWwxYn+nfTY=;
        b=g9GxdE3AnRDhHpq2JtaRCYRYwahCYQkCA3QXNcwF6kEOwQwcumkcGMnpeA2Czi7GYt
         ETmS/mozBP4P4/Ab4vFaC6b59nN3r8zrMKTCFUqKas/EJW2cuEGnkbc20aDwDis9GX09
         ZHKjjGJ8PgEp19cBdweQ0ZRUrhYPHa4RqU/e06otogoNHOWW28dIN8ijmK8qQcyRQae1
         3B8z1LBOPz4o8Po4vE8Kj5N68X9E7pIK4xbokGliEiS1fNVtLJwo77ZF1bbRAdlef1EI
         w9LX4FgF8ZgZPtthQCbt6nGwxbzbjJd2ihG6+tG5sQuQte60/Bc7GtOJ3m5YGO+ZVM/8
         pN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163633; x=1792768433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zv8TTKfbeUYEMQDxnGPnn21N4WT11tkkmWwxYn+nfTY=;
        b=wGCPJCo2TCteNGHiK9o/LQ1mrU8yb6UcarxWL0dUa7nuDOx63P7t8k3MFvCSnZpXuv
         /+svAWKlTBXXUBl7lVnzVya8vIDWEBEk8EwFGMSK0nzTd1ZFilzWesSH/kOKNJaHisKY
         gjEJmD/gmRz4f21r22C9SSChpXd+tOFluSGD5/4x3e8GDxPL9l6SZ7pM0wMkbOL9H/3O
         YxBEyAwvQ0Hqm0IJDL5CMaub95ODww9GWX8pjM8A+DKltmjKWqNc7AQU59nTxj8gRNyb
         qnNVXd4QqP8hiqD5RHNtjTD2fZFcakhCDWsYN8URMk/QcN8p3ysN+PRMOYR/SdgvKreJ
         M7QA==
X-Forwarded-Encrypted: i=1; AKwUvByhwu3WX3xwjsMYxMXBQBDIV1SMVZE0TmYK/ishkPBPZ/xoVH0eNHAeXU1Vh8rJuREVvIaorXQ1FBTyeaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp+KCsuRlkjRNSxs2nW2NnvA+KhdR+jYF93GarJMrcHNq34782
	T5sc7d0QnpLKAOo8p5DPGc916n/PcRCzT7/SSB0xy2NJoTgwYk+HEBaO
X-Gm-Gg: AYBFou2Ao2jg+xtaf6HC/JCvD+/gCjNfWuJCmtew6lEP9HO5lui79FTyo8AClzUUqIr
	sIbjzP3XEZ98b6EIxeBBvAtTbJU5ymBi72ypH6PdeTb0MgsOK5ZFkWnbRzil1ScqLTr2BaE1GmG
	5opMWCwqk2eRFgM3YDzl2H4pLQm/iNqYxYZGFamAJXhRrWczEQPXvW+3VUcAk/h3wg6ewoQ2J1S
	4x2hvDR8tmpgjgL0tyt8fkh1uDEXBSSUa9CztBjnSfu8XUQLSctb7SLFydlrvrcp54GRh013WvB
	lduKde8MHUQAHUcQfWqTtm7o+qVOJUJoku5doflgSEwlfOYFtREUthU8ulPuZOhsNVFNiZTH44Z
	aeoZMRTPr8/TQ8poKaT1cJ4TPK74Mycj+Ty+Z6tHDlUQeH4+mOICn1JQB0tz7xfHT6YKbWjSnxC
	BZGgFhfQEWdH9UFWysub6CkL3FcXdMamuFgKgFIPAqITYrSDuaEONkRz2B9z6WNmc=
X-Received: by 2002:a05:622a:260b:b0:535:8567:662 with SMTP id d75a77b69052e-5359fe116d0mr371801881cf.62.1792163633191;
        Fri, 16 Oct 2026 08:13:53 -0700 (PDT)
Received: from beelink ([187.15.139.183])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa59b03sm24674041cf.27.2026.10.16.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:13:52 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v6 0/2] HID: multitouch: fix use-after-free of haptic data on delayed input release
Date: Fri, 16 Oct 2026 12:13:40 -0300
Message-ID: <20261016151343.3120300-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016135516.2957381-1-qwe.aldo@gmail.com>
References: <20261016135516.2957381-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v6 fixes issues found by Sashiko on v5.

Patch 1 is unchanged -- reorders try_module_get()/get_device() before
input_ff_create().

Patch 2 keeps the devm_add_action() design.  Changes since v5:
  - module_put moved to hid_haptic_destroy so the module stays loaded
    until the FF subsystem is done with the callback; a second
    __module_get covers hid_haptic_devm_release itself
  - guard against double-init (return 0 when haptic->wq is set)
  - NULL haptic->hdev and haptic->input_dev after put in devm_release
  - restore dev->flush/event after input_ff_destroy on devm_add_action
    failure

v5: https://lore.kernel.org/linux-input/20261016135516.2957381-1-qwe.aldo@gmail.com/
v4: https://lore.kernel.org/linux-input/20261009103333.2476105-1-qwe.aldo@gmail.com/
v1: https://lore.kernel.org/linux-input/20261009031207.3233206-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  HID: haptic: reorder try_module_get/get_device before input_ff_create
  HID: multitouch: fix use-after-free of haptic data on delayed input
    release

 drivers/hid/hid-haptic.c | 93 ++++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 13 deletions(-)

--
2.53.0
