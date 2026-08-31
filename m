Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA4839184B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176743; cv=none; b=EY9NzvM4GfCc0+FUME4i7+01q0RvCJpPdn148rVBJG7SpMyVCgszlG30TBuJPhHpnzY3lpOAw+fTkGlwVjcakEGvjGrpP2Mp8M/7SOWieEMWM6TgrGyIn//NDmxjQnSJZ/2DHkywsrz2FMfHrrJtcNmye374y1SvqPtfiaw/abE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176743; c=relaxed/simple;
	bh=BEeQAQ40I0LV0aGncVgyaQlkRdikCzo4unT8jnz0Nbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9hklooPZtRvMgJeJuCyXsGQpItIuLzKmppsNw63GaaigZSbK33RgWvXWA8uZUmYzL8icpyfpWk9LwwZu1Ti0BQajUiSQuHIVVy/CXjB/rRu4q9Ke1Uza4KtOYLJhuZRZDWN04QZn/VB9nNa00EbxFv9i0eNzbs7UJGMiDBfN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oEWF01Wv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oEWF01Wv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d7195706f1so32455455ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788176742; x=1788781542; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIGBSwlzLQ3JNiD8igYqt5VspQFX9U8fXgxj4FZ+S/0=;
        b=oEWF01WvD8Ovwmas7DXsVdkjpdlvp+zdCRUDy9G/YI8YeLTOkR2jNiLUozOaRUtKql
         dSo/NBLVqMPaz09ONU5eyhhuh0kNCvD7uTsPQ6aPikGDwsI7x0H/+cbWezrRPhs8Ce+K
         3ctkf8cZ4NT5pzBOCYKumK6zvl7NxHrFebO5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176742; x=1788781542;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GIGBSwlzLQ3JNiD8igYqt5VspQFX9U8fXgxj4FZ+S/0=;
        b=YQc5k24cckEV697PvjGhNWasAehaU7m9oRsOvXmKKFYdOoEyco6Sv2GRp5X6Et89Np
         QcRPc9yZreJv1hMD7rpZpjATlU5+sQBNubj6JopxPyT8Dcr6XTCeNoyDGX8dKsJQRRId
         lH07ej9I3x/DeNQJ2GbLfyekzP6tRE+WsRqu0/76+6n31vYhpU9RZu0R9XAN+UVAvVAI
         DGX3Wla4QTk1uL+Iq5jEXN8KfEodh1HrkM7IGKn1zrRXDPwlO623+nMoMlqZS5yQrM2m
         Tp5F2eoHE3lRBPWjQnT6ui6zwnAJ04afAq/XyyLzsmbmocTj0/q0uzbgfhm38My6adlm
         t/JA==
X-Forwarded-Encrypted: i=1; AKwUvBxuzEHXqKJ1xqB4og06gxaxkQ20zBjugTN+uYFWm94lHK2GKxfMUHWac0qqyHeQm/6AsqZ0SswH+SdCV5E=@vger.kernel.org
X-Gm-Message-State: AFuF++nMwklthM7b9xSNt2pTlJl/E+mbIc9zbSHXa0XTlQ+Dp0nn95FH
	zKgfBxqmOvImEa2YINW2k7wB7tfeIM4rBkzzYDftu/0lLU1NwuxKlDVGtQr9/kvVweQvfPFiWdw
	yrg/fY3TS
X-Gm-Gg: AYBFou2Wq3Jh32fiiv7u9qUltQe3D5OZ727QBRGhu5gsZH9Ql3Z7iQilh8CAVtMcTwX
	wSKl3fllh3D5af0mEt3pt+5adGywQY9bXxltR14gL6Rrxg4u1ro8sX+pLScLaErCYuKG3eNUemE
	QNcjgPRv9DkpSu3stbiQLQX1ibEr85K9j0KlbI2cl3GVQTYexFqHVzJLNTlYiV1IeSKL+8XbHmo
	kkgDT24K2jNqHdfpffRl6EcCz9dQpyNw/zdqhNLkmqW4/WFsm69lcg5sQE0hc+Jbt9VpWENh+l5
	Gsc2majfzEmDe0yT/Jjfm11Nvoz7vN5Tkn/PiR9u5hXK90I3sH1dW8l2VZNPIb0X7Ry51yJr0CS
	yElCqKjCrHO4eyygvDKn61+WN6Qo8+cxEp30PTQlggHmuIn6fl4xpRv/FKSg1pZoH64kthChXuM
	YH4qeOWDM83gPOxnJDZfPf07alGTzuIOn0u4IyUye62jk5RxLmTUykdEv5i37VWrpwot9/pHnYV
	UhOGvDmzFhHzokC46XekaP5Vg==
X-Received: by 2002:a17:902:d542:b0:2d8:d4cc:be67 with SMTP id d9443c01a7336-2d93fa4eaffmr38512435ad.20.1788176741746;
        Mon, 31 Aug 2026 04:45:41 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75986d3b7sm33944195ad.41.2026.08.31.04.45.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 04:45:41 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3792996a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzagBtRG/l2evnRTyVdZmkpYyqbbyTV/Y7caHNjn+FY1nys+x+q2eK9zHnCNHFQMclfaT5p61HSnNBtdmw=@vger.kernel.org
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id
 98e67ed59e1d1-39907e0f87bmr182688a91.14.1788176739296; Mon, 31 Aug 2026
 04:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822112256.12346-1-jeffinphilip14@gmail.com> <20260827035155.10725-1-jeffinphilip14@gmail.com>
In-Reply-To: <20260827035155.10725-1-jeffinphilip14@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 13:45:24 +0200
X-Gmail-Original-Message-ID: <CANiDSCvPSF85ztR7XOvOmhRN_i52etjS36+jXmUAE1ci04mXgQ@mail.gmail.com>
X-Gm-Features: AcwNN1WLAz6VN8qw8vpP77AnvuGLGadWRBZtJh28ci9mCBTda2OW0XvkaTo8pN0
Message-ID: <CANiDSCvPSF85ztR7XOvOmhRN_i52etjS36+jXmUAE1ci04mXgQ@mail.gmail.com>
Subject: Re: [PATCH] media: dvbdev: fix uaf in dvb_remove_device()
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: hverkuil+cisco@kernel.org, kees@kernel.org, linma@zju.edu.cn, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, stable@vger.kernel.org, 
	syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 05:52, Jeffin Philip <jeffinphilip14@gmail.com> wrote:
>
> On Sat, 22 Aug 2026 16:52:56 +0530, Jeffin Philip wrote:
> >In dvb_remove_device(), dvb_media_device_free(), device_destroy()
> >and list_del() all dereference dvbdev regardless of its refcount.
> >Thus, if refcount for dvbdev is 1, it can be freed and we
> >operate on freed memory causing a UAF. Fix this by moving
> >dvb_device_put() at the end of dvb_remove_device() so dvbdev
> >members can be safely freed and assigned NULL when dvbdev is alive.
> >

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> >Reported-by: syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com
> >Closes: https://syzkaller.appspot.com/bug?extid=37578f730d38898f4b74
> >Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
> >Cc: stable@vger.kernel.org
> >Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
> >---
> > drivers/media/dvb-core/dvbdev.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
> >index d753d329502a..9aa4b8fd7379 100644
> >--- a/drivers/media/dvb-core/dvbdev.c
> >+++ b/drivers/media/dvb-core/dvbdev.c
> >@@ -598,7 +598,6 @@ void dvb_remove_device(struct dvb_device *dvbdev)
> >
> >       down_write(&minor_rwsem);
> >       dvb_minors[dvbdev->minor] = NULL;
> >-      dvb_device_put(dvbdev);
> >       up_write(&minor_rwsem);
> >
> >       dvb_media_device_free(dvbdev);
> >@@ -606,6 +605,8 @@ void dvb_remove_device(struct dvb_device *dvbdev)
> >       device_destroy(dvb_class, MKDEV(DVB_MAJOR, dvbdev->minor));
> >
> >       list_del(&dvbdev->list_head);
> >+
> >+      dvb_device_put(dvbdev);
> > }
> > EXPORT_SYMBOL(dvb_remove_device);
> >
> >--
>
> Friendly ping, let me know if you want me to fix anything.
>
> Thanks,
> Jeffin.



-- 
Ricardo Ribalda
