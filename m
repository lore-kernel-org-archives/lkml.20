Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB9514754
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867731; cv=none; b=aZlwiHOtvzbgtQvVtsEEhBhVyX3I8JhAPIEmJ/zP5hW1k5aLIVaw2+6z5eCqgxw0Saz5C/PCTeEcx799L0st1CFD/HnHVLSihN2d6C7OtrqRbEn5pmYG2iXXHModGI8WUsG4qJ8ovhwNTzPP2ghiaglWkHtiSmZJhbToM5w8ros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867731; c=relaxed/simple;
	bh=zcxlvAI1Ae/q1EaKnTsv186NHrqAGAv0T8fIeszsq5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JXVPLTzrjoM5+g5qLr07Tba9gBco4aqPW6dXNooisDGn9Psam/ke1w40SN2F5QijiFOD9G4qjhko4rrrSIzBj2slNhMbH/oPfB2BZFnB9lArtEgD51wjjl822Ov3JomZ52f8cFHgsgicPV3D60/MRpzMyGf3QMKnG5wui7ICS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/S5KLcF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NkPT29NY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/S5KLcF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NkPT29NY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788867723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RrNJtw6g290ODPNBtFlQPVdYDxDOj1rXvh8h+/vQvhk=;
	b=M/S5KLcFgMhfhZhOsB3t9TILoJn+aaiTXr4VfHD2g8ekOf+lR+vjcJLkWh0RLfc8Ei/XeW
	zshYvJociPAL6utr0iNoXQ8JkDYoTnpZiUZnfTZPyiAw/BbhvN7D3wAYSOiXf+wjS7rLjn
	9VdemQpmZBX093Jk8EIgk1lSQkA/0/E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-7kMi-LUOPs6jppHIgdBNXQ-1; Tue, 08 Sep 2026 07:42:02 -0400
X-MC-Unique: 7kMi-LUOPs6jppHIgdBNXQ-1
X-Mimecast-MFC-AGG-ID: 7kMi-LUOPs6jppHIgdBNXQ_1788867721
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso26347055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788867721; x=1789472521; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrNJtw6g290ODPNBtFlQPVdYDxDOj1rXvh8h+/vQvhk=;
        b=NkPT29NYx3lUXdkGCPgrrR3RQC/Sw+FUwL5H0Fsfz/LwVRDCSbnHhlV9SgJjkDgiOv
         VHQ2OInaDTPgRDhk16K2hrsb5FFyr01zK3UtAqpZ5Xyk9w6BrgjsFXUNvX1naS5wbAp0
         cZ1a4qnd5xhigaY4sQRu+EOxAYOH0n+inQQCrXHRyOb32324f06OeSm+IJawluME9OGn
         xNTu+Ik518xA9XzZQHiEwEGqNpTYK2LqHfflbLwXQhiNKYCjg3ovCd72cbqqKIpNowvu
         eWGOZJZThXuIewEJXwhikXHxTmwugpXoUQoFHhs92YbQuKNxWm4SNzaw+WIVcPNpZH3y
         NMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867721; x=1789472521;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RrNJtw6g290ODPNBtFlQPVdYDxDOj1rXvh8h+/vQvhk=;
        b=QIwJJPUZ39GrH+l/3j4BSeAuXdLqnL/+LEp9kI038pnovH6NOfBXalJVmfAWqEfivn
         teh2PtUSU2yBH5IAA7zw/FUgPS1KjPTL6IGKl44kSqch8pfjnIlDdxL2AbC7+s5AyZP1
         qmff7TxjiICn5ltOwn9sKKq346sZfHOErNHLuNRXCzPq5xwRPxbJwArMfabViEHCM+Wj
         5S3MidcV/p24ffXIqrOTssYDvZMUG1l8bfaF/+3PEXTxBdEJWAqgTVTF4S95hbW+KIij
         u4c/vt4lo5Kc/H0IcBw1lh63HT6biIZOClZ+eL31mktnWm+zPl4PKr2l2sGTPvUI/NPL
         RRNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPweFDFezohThCXuM4lv2ebdotVdcgCvHklocmeDXmBn2HWlr9dx16KBdeUoQ2p0J4j+j3graxmRMYqXw=@vger.kernel.org
X-Gm-Message-State: AFuF++mrfwRVEMOefwXUnnKMtHi86WLpZRd2lPW/e83jnrqbODH+VWt0
	nlK3MCodAtSU7Ko/prJq5ZkMvltztdb8JpTkGJqovU5VjqxsXc1V4uJCusSiLEMs9TeeG+2dJ3P
	JxKyoRz8f9NQ5V8ohXu9IfrmJZ9iiO+8C8F3G8zT1na0jEoi/jqRTMSDTG3Y+IJY4RA==
X-Gm-Gg: AYBFou1nu0s9NPIu4o5qoQBHWKMSqOPSPMc+qxPHOdZERfQhorgHr0EFvOU1IwKGawe
	XtBCrePuMzY0zhzB/DT7bLArT+V853YHC7bV82Ee8dGD47ymAPKekvvcSiQk1ZqwAaIqHDqcvgm
	fUVJ6DzOSK8pJ+pEBY9WFdyG7q7R1VT/NMLrlt1mHMLVmKR5AZRD8K/P56iiiTsdeOgFPMm7mVC
	0aA5N4eZXZSBTEK5ahAjgBbW0pX644pUeGuoHVv6zQQpYXE5XKy77ygz2WD5UiRMupJB96WJ209
	i2IZelI+uV5nC3AqLwKnKPicBrKQy7WQ3Eq0KejgHyiBEvqTuvWQSIbjmbgBz+I6ZpqFYUZr5S+
	X4PaqgNPTJ5aUxxKpEhRQxTuL5rl7Q0NLZkyb/GAf9uM7/aXTdwmB31W5Jg==
X-Received: by 2002:a05:600c:4752:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49d175439dbmr67724335e9.1.1788867721243;
        Tue, 08 Sep 2026 04:42:01 -0700 (PDT)
X-Received: by 2002:a05:600c:4752:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49d175439dbmr67723525e9.1.1788867720384;
        Tue, 08 Sep 2026 04:42:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm296441395e9.13.2026.09.08.04.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:41:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Fabio Piparo <holofermes@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Amit Barzilai
 <amit.barzilai22@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fabio Piparo <holofermes@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: Set the address window in
 ssd132x_clear_screen()
In-Reply-To: <20260817152500.703770-1-holofermes@gmail.com>
References: <20260817152500.703770-1-holofermes@gmail.com>
Date: Tue, 08 Sep 2026 13:41:58 +0200
Message-ID: <87h5k0dl6h.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Fabio Piparo <holofermes@gmail.com> writes:

Hello Fabio,

Sorry for the delay. I was on vacation for a few weeks and I'm just
catching up on email.

> ssd132x_clear_screen() sends its zeroes without setting the column and
> row ranges first, so they land in whatever window the last
> ssd132x_update_rect() left programmed. A partial final update then
> leaves the rest of the screen uncleared, with fbcon the last damage is
> typically the cursor cell, so blanking keeps the console content on
> the panel.
>
> Set the full-screen window first, as ssd130x_clear_screen() already
> does.
>

All this makes a lot of sense to me.

> Fixes: fdd591e00a9c ("drm/ssd130x: Add support for the SSD132x OLED controller family")
> Assisted-by: LLM

I was going to mention that this isn't the convention documented in
https://docs.kernel.org/process/coding-assistants.html#attribution,
but I just noticed that there is a recent commit 816d9992d9ed
("coding-assistants: simplify attribution").

So your tag is correct and I learned today that "AGENT_NAME:MODEL_VERSION"
got deprecated.

> Cc: stable@vger.kernel.org
> Signed-off-by: Fabio Piparo <holofermes@gmail.com>
> ---
> Exercised on an SPI SSD1322 under local enablement patches for that
> chip; compile-tested only on the SSD1325/1327. ssd133x_clear_screen()
> has the same problem, left alone here for lack of hardware.
>
>  drivers/gpu/drm/solomon/ssd130x.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I'll push to drm-misc (drm-misc-fixes). Thanks for fixing this issue!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

