Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019812;
	b=TLWod7Z7VGRvnMub4z1PEmqsgpPR5p29EUP66Q7A+qCqbk22UdsGIh4t7Y9pNKmeEEaN
	 gX+AKOwArAp/lHRBa49HjLyh4lhKdMUZsWqRXv2f7xHOyDMp/Q/XEu3yZQbXdm0Ao4qq9
	 nkMGWAiZQ1nYkbQ5fQdpuUSgK0WxSaszcHkaFnH5itc0L5GpRwW/XgvtlIkjI/FnZr7JS
	 cAQbQsMGEFq0KhhomBlOTVW0/y+T3jPZXk9ilEkicHFo1JDUVb6NFsiwP99jb9ZrOsPbh
	 +EboE6MPgAsWdlMB7QcE1KStaGVh5hxeVcm0xz21FlFKk/q6/G8OtFtCB9vo7iBrJxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xDATahJ/W2YtLTpfCyaxOC0Boq6szEi97OuferqWXIQ=;
	b=x/Z5yAeWhy/wXox0o31VoSxWaT6lTYUk5mnPM8rWjz0oOxI1dlD3G62GAmBPbU+8JiXv
	 wM7iCrsYJ6bZPWXy8ARzuGCmnVr9j+SeiCa9dk40+ic91ohmYm5BismzdXUSq642BpP5W
	 nu+b/Qn+j9etK4ztR4fQsYjyrHI04vYWIqdC3f3DfMpVBgyGvx3atWMvU8Yn18feqNCTf
	 0KjNIGTxttiXLfra7mPHsqokWt/sTtImWo+XAMeH4Z+3aDYzHibh4qgnPXWGbaBZefjoU
	 FOshSdh/GwvK6Q33y2RcauX7So2I3DWhNEpe3Xtd3jpXC2fw4b/KdMoc8SNvHt2PhjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="mShoV/Tz";
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D57606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D57606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mShoV/Tz
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so3026186e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019810; x=1793624610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDATahJ/W2YtLTpfCyaxOC0Boq6szEi97OuferqWXIQ=;
        b=mShoV/TzS9PrmQNAbO+ws57U7ctQ2lLKbbg3f4AW/sVW14EXQtgKS47ASTnbly8WpQ
         VGpRADL4Q68WOcw0QUw+DKodN9uKsOr1Lh4n1t7mZoQFQeUkQSmOP/G3fDyv4kdQVL1Z
         ocIpwOom0IBsRR5ts2iE7F9kQ9j9n+pMOmV5SWMPOl55iSfSlgzq8XEb2laW65JvnDjk
         JldtxfYFPlIDBOLJfh7H0B7qk8W8+kCno9bhMS/orU8SLnbidO3dm4XKcQ4mf+ZO13OB
         abwdK0rpQ3GywmUj1l1ZH/lOuso/W0txXM6zvYlHtoDe9TY4zftSgKvYNTAWE8YxEyOW
         rkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019810; x=1793624610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDATahJ/W2YtLTpfCyaxOC0Boq6szEi97OuferqWXIQ=;
        b=RPesJQNTHulCEzK7dpkMP4H9C/5knLVF0nTnXQqjOjMfQkXByDuFoP90gV92QidZPm
         54Fo1IrK+hNjeje8hLhfkDLbPoB6JSnuVft+j+CDmPHVVG+SDoIrVtpy8KTl4cRIRZlb
         UOJ4ojNFCQt9MAcaNP0PRL1vhhk2p/Vhy+gGTD9AMLEge95Ca9Uwf5l7IAq3pw60/+j9
         96ejintsODuZWMy3ai+ntzdBD5lkTFuk+Qqogr9Sjp2sxEF1rSgsvVORuU+9yXp1uKHt
         FdxYx7QVr7GEQpORDjiPUf9AGC7aaDy2592t+fnBrkZU1luRDQ+G46eJgNkouD7t7lyE
         BMDA==
X-Forwarded-Encrypted: i=1; AKwUvBxL7dlkWSjF2ABOjPqCPn+YiedaMIxzSHSIji3P8Edtsw7niSmMS74e6A8tQMRNzElOJ94URxtpdCPsrP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM2rv5ytv6wy1sWX92ZoaG9SQMpqOg0Wm7TzICjTsU06GIxFh4
	ia9+QEJa1yniSdFcFfxPKwsa5Vv5MEXJcECwwgsMejErUsf0RxIWFoFO
X-Gm-Gg: AYBFou29XUi7/dGxFpXFWoo/kc2a+ET2PMFsZaVrUDH3EURFaPwli6202+JdlX6/BuY
	YDDUdEN8rVAsu4w4MVkv3Xo0xhpZ4I/lp5oNcVZk5dmWFCXAUYtRy7vVH3FHrUvliJwTe6oNp+I
	40+JiiMgeMUDvERAnLmxf1GjvBAb6fgLty7BnpZ/GADd3BX0XH97e6fjxU6X0j2q6KewDRIrOBC
	3EmF4imuL/e93EJ8ShsQae61BSLxkKIaTzq3cBr860Qfryu0ZpbfQKErT6heAMruo0GSj5mdVc7
	nhhRsNDJIogcxkWGeEWwZoUUMUe2st96cx6ot4CJq/u180akrr2H7A5yWU1LopITd/E45R49m8N
	Sx/UqVGVv8LNntPaD2E47uaZt2mpASsuC6NA2XtQLp6POoSB3t9nyVShAgw/eiZoJnxjbEGp9EK
	Cx+DU1veOR40jfkhgDSFJg/8c8jzpb1QhQTvYXxzBVwiBJtQqMas7gkHfvue6kbmkL6uqrYNAG2
	2padjHz8/JiKHtghjp51AiirA6AB7+/wTt5hWHHQPom8NqJwmsKfhRc6SpZncZKBJfuzQ==
X-Received: by 2002:a05:6122:e183:b0:5ea:c90d:d1b2 with SMTP id 71dfb90a1353d-5ec232abc41mr2269965e0c.13.1793019804885;
        Mon, 26 Oct 2026 06:03:24 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.93])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec233f5148sm8289108e0c.6.2026.10.26.06.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:03:24 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/radeon: process the VCE interrupt on SI and Trinity
Date: Mon, 26 Oct 2026 10:02:51 -0300
Message-ID: <20261026130254.201871-1-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <88c61950-125e-4109-955e-ce09ebaab7af@amd.com>
References: <88c61950-125e-4109-955e-ce09ebaab7af@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Fixes: a918efab631a ("drm/radeon: add VCE 1.0 support v4")
> Cc: stable@vger.kernel.org
> Please drop that, we really don't want this to be backported.

Understood, no backport.

Alex, you already applied v2.  Could you drop the "Cc: stable" line
from both patches when you add the tags, or would you rather have a
v3 from me?

Christian, do you also want the Fixes: tag gone?  I kept it because it
points at where the problem comes from, but if I remember the stable
rules correctly, commits with a Fixes: tag can still be picked up for
backporting without a Cc: stable, so it may matter if the goal is to
keep this out of the stable trees.

Thanks,
Matheus
