Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045124E06CF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606107; cv=none; b=cWe/HaWqrICoI2ZfMzFVzeVci3NXXmflW5M+c9TtaTx2unieva5Xsc7uBcdL5M5BaLCFnEQT5A685aEY+7JOt06UFqK5OrLnfqVxV/CxGZeUR/r1sPks6qzOKmpHmftAAYouJjVFPBFQ78vX69zRTmElvjFvLB1vb8+4TkzJXq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606107; c=relaxed/simple;
	bh=96+TdOqZAkRS/23bGnYj2WIeluw3dPCFqis+zSJPgEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=butplpIOL21z9d85OJFbjn7h47MHneYPhadQWLXTUa63nZmj02gycXDqa1z6KuHQvwEWrR1EZqMe4Y3FcPv8QonwAjCuQ1aOmoCxZGJYVsRFxGC3tJ9qUUDZEgrOgTotrfoXjzowEtOiLR4hVjSihYk94cVpgcisi3eWCgmhp/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUi4gaoD; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUi4gaoD"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a860e532bbso26348167b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606094; x=1791210894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96+TdOqZAkRS/23bGnYj2WIeluw3dPCFqis+zSJPgEU=;
        b=hUi4gaoDgdkI6810Z4BmPeBBwB6bZPMxmh4qE+r2uUwsVlWTrjqdBTJ54ajoSGU211
         ohvdesZUTryTswuOO2MLEk7iZPe9AwtyaEt/iJJlwSc1VOZ2jkM8yIv36IndmLnuq0j8
         F3AENkifCB4O+MgrbevrcQMNjt03cTtB2I1Lla+zhviTxCuqifmI4QpnhFvXg879Ansy
         C4kdKcJPh+ZWv+7dvAQ/b9LAlS8As6yjbWO4IfG4kFnGWNzXtqH12Al3SeHWvWtJaMBz
         9znI7/CE/0aywQz8TwtBoF7/YcAIXNI+ZcOPQvi6uVWZjGPPxrh373soE3PHEvEdGPcB
         WORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606094; x=1791210894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96+TdOqZAkRS/23bGnYj2WIeluw3dPCFqis+zSJPgEU=;
        b=BIPLWSYtMBcnd1i0Kt8H6SMbqkQrk/tu9DdhVBHFiYQuE3dQ9yek0u9pZf8iME4M/7
         ZsOWjVJ8/9kciAS2oOvw38IAANVCWvNjQOl5k8xEx9vHR0NtZKdg7KnyfK+PWCA96yGW
         sCj+SdHl+4v6wxcM/eUiYEh1PUdV38exF2jtq7SlT1Mpy9EbObbFduVH4zWPKhVLkbEf
         Ffz6oVzahRaRKY1xHBRq3yoB7A8mLHOLodGS4WNQXqcU5w0ZN5qpaikDnZdb77Db5XHM
         CWgrqm5JDHjmxSYyZBsh/p8XT8W7zSvDEabWmVXodCAVqg3pN+dC0YUMjyI2wFiJhMxY
         cSBw==
X-Forwarded-Encrypted: i=1; AKwUvBy+zU0vdlH9xoULWNXWUW0XG9l7wZauQtBQ6wSDfDs9muUyhIZpH/aO3wKn8YSwwavvk+RhJbtCjXL8afk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI8YDeAjNxFUozpVtZTzn5SGvh3MjbdEzuXsKCwLpPH7+piDWe
	dEEPeqGyPcAhKtvSOIzVOSD8DHIknO+IFcVrx9ksKOUfUASRyZZeYEL+
X-Gm-Gg: AYBFou1ure8Vy+P3B0Tura7ckefuUXoLySjXxD0PTxfUCyJsNzslvk4zOg12KbEkGa/
	Y2+XJMdOy9dCum5NxY7qkNmnKqjo4nq1QB1et23hylVqMObnC5oFr0IQGYZ4XPQ/nIMsBR2/qqw
	5HIjiti5tHwjxVJm7VzQV7aBvilR28zb5CVGGqinLA8gA7+dWf9W9wMolbKtm6ROUlZ8xKUZ3kp
	c/kGRGDMLse+kT2ZpfLsO/wj9Yq1gTSf/KH9XjYGwpJ8oNqHfZ4DlCunbN7VTbKUCT748CfL35U
	DZqG+vM/qGBzOvLOGRqK6At47eL3WHH2QPuby5hsidajOqbTaxT1NJkGVML2xYiGJXAhp/dYl8D
	DDwdikqt+pogX/LfrW4wZiffihpcHevvCD3Uck/K+eGVtgkZm8iHgUtnBnt1h0rVtCQPjf+NySC
	HGQ7Q2gz88IFg7FWTVBx5XJCUNcQAd/WtTWQdocQJ+7Ft8u+tmz1fN0HlgEqw2EQbycbkgNfwV5
	gOwESoyC+5a03M0KVuZYdPMFSNXiAclStN5GLAcDH95chTAXduPqdg=
X-Received: by 2002:a05:690c:c4f1:b0:8a8:719c:e4ed with SMTP id 00721157ae682-8a8719ce5b7mr33125107b3.34.1790606093575;
        Mon, 28 Sep 2026 07:34:53 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860325fbesm45609627b3.5.2026.09.28.07.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:34:53 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Mon, 28 Sep 2026 10:34:52 -0400
Message-ID: <20260928143452.757713-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCuNubuJ1RyTT4g4PORoJzEorwH6CFmcPnXrkRYccz5deg@mail.gmail.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-4-jordan.mymail@gmail.com> <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com> <20260927220625.629672-1-jordan.mymail@gmail.com> <CANiDSCsBbns32PGir2JCZ8Ofv9CpXgjV50k-vszmFY-jT-2WNg@mail.gmail.com> <CANiDSCuNubuJ1RyTT4g4PORoJzEorwH6CFmcPnXrkRYccz5deg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Mon, 28 Sep 2026 13:18:18 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> Since Hans is going to merge your series today into the uvc tree you
> should do c) instead.

Will do: the Tail 2 entries will follow as a separate patch once the
series is applied.

> BTW, I am curious, did you hear anything back from OBSBOT?
> Could you also report this to them?

Nothing beyond the automatic confirmation; the ticket has been awaiting
a reply since 2026-08-04. Their support channel is the only way I have
found to reach them, so I will report the Tail 2 there as well. To be
honest my confidence that they will respond is low: both cameras work
fine on Windows and macOS, so I suspect this is not a priority for them.

Michael
