Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A243E071
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827413; cv=none; b=rFPOvDmclMXFyWnJOws1u6gAzGvW6SAKyGoOARUccC30sN6WkjnqMhmB0dxYr/+Q0RHDj4vexD1PhhHRS2umMojTOyy3PxFXyKbg/25f2A+6w92Tvi/jdaoRALN2qz4PvDZWalhQ/jCxj/HQDQPNXGLui4ZIclr/vr+PhuNnCiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827413; c=relaxed/simple;
	bh=NqmzE/pOKE5LuH6urLswzZwp6HqGLA1qIc7ZyPlaAqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yqh7YY4TNCHrCVO2vBCgIsfBJl9nEwtLHC8Bq0H5N23ioi8BO9Jq84pxGr1mt0NCqfpsU680O7tt7EfPohuaBID77hF8HDdUrzw5WrYKvHWfSEztrm4uP1eyzuCUG0996ohXB2+Jl6tq7Wbt9H5ggxkxpLylxQ6IOMPVJRULDWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaeWuf4P; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaeWuf4P"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso403202a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787827401; x=1788432201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR+R31UmLdNq/47JB2RO+SmIFiCAwIdUTOKseODOfow=;
        b=EaeWuf4Ph6MqnbimVX/WT/aRTtclQ8+ANBI/57M9wIQIzvJmp45bHnppkdyPXNA1FJ
         POqS+HV2vRbV5l1gqBmMDxUF+kaOStIwxQbMB/TFwjKYaqanIH6M/GU4ZlCbvMPHj9aM
         sPnG21sSD1ViSNbhW+2VexiWJrrL1c/VBINLGhHhyOrmfKlCm3xoE7NzKoGOKsyFrmM1
         GFZa5Zvbnj2KeOBDZJlX7pZAtvNt82p0tzdAUkbWYojIU9aW06zT9kbNkSGwGOLPyEhO
         URTKgaTsfuAAO7sl8K83FtQp+UKVLY0L4JNLSmRTakPKAyuAZgwRJI7dCOaLHTrYp8PK
         7Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787827401; x=1788432201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dR+R31UmLdNq/47JB2RO+SmIFiCAwIdUTOKseODOfow=;
        b=B3kQPSmeFoxmfPNz9jkr2HTAu0/TI9u+WFtsGvxNwtJ7a+3wACFAt6hZsok1YRxRA1
         ZGOCc64OkRn14wvL7pdHK8frnMr6gvXmJEPzDLtr+X7YfN2C0zQ3j6xgNAQrmffTxcN8
         svuU927fxBQp6yFHmu7wfATznbDhmKPSKiKxgaYQ3NMS6PqH6k44V4ghYTW0PG5hAHUR
         3t7EMSp3NjspDeV8hpW+b4dJ2sbaYsaIE9ugghQr2I4NnMZynXaKDotgMP+h3005xsY3
         WJdgtL3vXxMGe6AO4HOtZ3ZrJvfuz3EYXONEdx8y87njJP+kfn+0cVEF/+5MwzI19nw9
         s7Cg==
X-Gm-Message-State: AFuF++lRvNYyBzHWd1qRHxSsWVWGIDcHzceEPqospUppyUnHVJi3bDxz
	YqaO0/BsKEleVTpLpnwEPvJdYUpqhatr1qNpU+JmhSYFu7yyfSbHI6fp
X-Gm-Gg: AR+sD134CGO7nL/zIfXU4BATYfuTRrQMYbL8iF5zO1MQ4s4o1MBMPl6G4GH7pHmkhUo
	VKPwhBtSY+lVC7pTVrUoLmJfhAKA/5NDMLjNy+51Q9/Zf3RU3fgyd7HP3APyOJdjDcnKFpFTZiO
	oz8rENjxV33gno2YzfHVN8oBmQskgexY+6WvpksFx6s3upcuJj2j3MXPptPJaHU7A5VWj4JhplO
	8eXahgbGo8fDoLEVLUIobyUrZxZO6jg+bsOYq6JMzMBFFMblbVqzJ2eh/2RrLXF0+ZD8alGgY9L
	jr031z5N0XIb0Hcxr+Arif0PPwlKkhSTOJHyUWs0XL/DPRl0yXeI74nwgxyK3iTJotviOdnKKoR
	rG1GC4TlgLJM4orWXY3tUbIdQDuTI1QTlIw9xU0iZ4Bbx7oyhC04A/c4dZHPKTe6yWoQ4+y600L
	ID8e5G4qf3AmN03/b/5OOBB+f5qt6n4q6TnUQNPZUGGASgCyVSsMpjPIFbW/k+SYLRvg==
X-Received: by 2002:a17:90b:4e8d:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3966d400334mr28906835a91.1.1787827401171;
        Thu, 27 Aug 2026 03:43:21 -0700 (PDT)
Received: from Default ([2409:40f4:1015:7531:12c9:ad3b:96d3:4379])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a907c682sm15103423c88.15.2026.08.27.03.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:43:20 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [syzbot] [sound?] BUG: unable to handle kernel NULL pointer dereference in snd_ctl_led_get
Date: Thu, 27 Aug 2026 16:13:06 +0530
Message-ID: <20260827104306.21231-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a9007b3.1d9ded08.62e62.00cd.GAE@google.com>
References: <6a9007b3.1d9ded08.62e62.00cd.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 818bebeb63dd

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 8cbacee57ce7..f6a46ed97d37 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -114,13 +114,11 @@ static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
        info.id = kctl->id;
        info.id.index += lctl->index_offset;
        info.id.numid += lctl->index_offset;
-       result = kctl->info(kctl, &info);
-       if (result < 0)
+       if (!kctl->info || kctl->info(kctl, &info))
                return -1;
        memset(&value, 0, sizeof(value));
        value.id = info.id;
-       result = kctl->get(kctl, &value);
-       if (result < 0)
+       if (!kctl->get || kctl->get(kctl, &value))
                return -1;
        if (info.type == SNDRV_CTL_ELEM_TYPE_BOOLEAN ||
            info.type == SNDRV_CTL_ELEM_TYPE_INTEGER) {

