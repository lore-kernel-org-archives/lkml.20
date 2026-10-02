Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987D439014
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926664; cv=none; b=llC3Jr7a8Nz5Z6u6Xtsb7rzMW/k3Yk+ktzdXunO/KvNHaqpDf1NH2Kr4mX5EmXt+G+iYcMxWkru1cJKJegyod9dFaEmhXIxnyOonpvzXMKBRbLnDe91VtY5E4o0iWg8xrEcJq6EF8PksmOUpxbR2BCtPAdBISriC8TF96P6YrmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926664; c=relaxed/simple;
	bh=sYAyqQ6f9bRmVhsxj1veuLunk3nA6ckSjNhuKUxpq88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rS0YeXo3BiwooZ23XUWjRe7o/BFLj59iW75UZAn6oVUiOsOlqZM72dHddtbiN8i1gbiuba7D9prkn2Z+ZbmUblu7m/2zOZDWeWhh2H41WbviD0tnrBSMoNWgfUWGdJFMylth4Gx0DQQ7fd9jIVOKz5h71b4u6r9aXQgoJU8Tmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWZxQ6cU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZeYoPVhP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWZxQ6cU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZeYoPVhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790926662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
	b=EWZxQ6cUE+CJ2uDDFjubjrlIYY3GLy1X3MSekZmdFl5YK8f/4AjYbqTi4QyihkvNhqF8sI
	dhhodhftzhl+TX36Gv3/kWKRlQgDqmYo0wLHC6ncbliWu0yr/wWoLTOkmp2rRYM4qY+M4Q
	SveOuTxdK2aI3nfi2aaXSjWMBZM0gao=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-jKlIcJCyN4mHcwiIWnmGXw-1; Fri, 02 Oct 2026 03:37:40 -0400
X-MC-Unique: jKlIcJCyN4mHcwiIWnmGXw-1
X-Mimecast-MFC-AGG-ID: jKlIcJCyN4mHcwiIWnmGXw_1790926660
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so28102755e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790926659; x=1791531459; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
        b=ZeYoPVhPeBCYI4tJMUHvSWBzHL0JWHBXuNqDLibDCcGpPKpg5NROpaBTSMW2aFKpPD
         VyDJt8AapoKubq7MHS7dqoQtIK/S63mb1iOI7J9my9KagNLCVPGJ9XSlENnUADsA9VLB
         ivMtSeQu5WY0cJYks46WVRAnAHSAR/3d5wC0YssIgl53Je5G0e+aJW20mAt6NRUwvnZJ
         +WntoqaX+z6IJ2zJFYXq0pe2C1/TCnHeUQjVWFEDLfz1Mdqkrl6hUcIwH49nkiyOO28J
         8lnKYe1WRTA06/znEOoGrvxs/vKv9DqYJrAyjDIof5stnVC3QMU7aVUynEMf//T/B7Rl
         ia1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926659; x=1791531459;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WV95wAdEBW1v5k5upi/D6jheWF0Dkl/DxQsG1HnT/70=;
        b=a8NXri9OzJBm2grpUR4/1mpy068XwivHLAu8noSxehss0rp/+bAEvgbyAs0vy3Z6Ml
         2p8nxUUWyWSkoo55uQft5+87bU+R+wl5LV4YzORSmeSLSg3T65dX7oad+F54YUGn+Y8O
         0TuwzoxAKfL/s8MoWfIs03kHf1cz+ieAe9mgmU2HqQ9eRNl9yoFHZkCivu2nHHoL1d87
         qTKKaGZ7oSQ7s80AjU5pe/8dxNEcqxXjinkkbL5KoAYtlB0DojmYmYYsgFgNNfVOEonb
         cX72EznorByFISJbL8ff9NFwpNcRLSwFQK7QYSG7hxORapwemaA6wfZtTrEvp/9FUYiu
         Vx/g==
X-Forwarded-Encrypted: i=1; AKwUvBwoJqpLBzG5ZGMu6/Z0b7cSuY63FXXDZwCe2/bJtnTDxlzoBrRu8M2tHpK+UCn6Aks6/PSEBBOa53WOE1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nLi6v2YPXJqP+AbUN+Bagkf2X8biUywqaWwRKgfzL+1oDf0NW5
	6R+Ro2tVdw5Bwc7CRNUp2LIw2R6fUoE50ScyyosB8h4ysgiwwbOjLtooTgzIsAamFWL9cj2wzAd
	cYJvLbh4oMxhIDgEzEmgozTfsY7H6FHBYAKlLQYOpxDScyhKuwyqqMDRjIHBfzwcJMw==
X-Gm-Gg: AYBFou0/tyI8fZGuRtPRCoW7pUglIH1DelOybGWKZ1PLFT0p4h9Biw8C0eai8J6V0/s
	l4WcIIUfNJ2y6iqK5eI1kpRbn1CGPTQ1uaIRYm/jrhxWJW5iDvp7dCvh6/YZ11fSaWix9pUFd9c
	ZgsPofrt5iYi+40b7PGmKPlqiFoxRUBdZ/wrf5GTmCSQ8Y9NLr0el7RM5JFCJkhq1fvlL2ihVVE
	C50PlgqxPcr/a0Bi0hkRetZUEa4OSAy9+u3lS0i+PZzGsVMMYIGfqkwkiHBpPFbFeFPVk4cSddQ
	bFUOGtwb1nxbxDWl1QsfW5ZwzmxPKXQiEsJmAd5TWIwhtFKCF+xaQE5WMq4Z1Lfu82naZcc3aH9
	ahB50xMhiPWjCz/Xd7VDMVnOycJDFxNlOdO8leqBYA3vylhD4QjFhc1qDc/sz2EXy8w==
X-Received: by 2002:a05:600c:4e8e:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-4a0276afe79mr34251335e9.25.1790926659528;
        Fri, 02 Oct 2026 00:37:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8e:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-4a0276afe79mr34250535e9.25.1790926658971;
        Fri, 02 Oct 2026 00:37:38 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm63581875e9.0.2026.10.02.00.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:37:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
 <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
Date: Fri, 02 Oct 2026 09:37:37 +0200
Message-ID: <xlv1cxtsft8e.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Neil Armstrong <neil.armstrong@linaro.org> writes:

Hello Neil,

> On 10/1/26 08:50, Maxime Ripard wrote:

[...]

>>>
>>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>>> technology which has serious drawbacks and dependencies on user-space even if looks
>>> really cool.
>> 
>> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
>> you can have a built-in panel driver that works without user-space
>> intervention. So this is not a topic of discussion anymore.
>
> It will still have users-space dependency, meaning the BPF files will need to
> exist in the fs when drivers probes.
>

It doesn't have to AFAIU. The BPF programs could be built into the kernel
image, just like firmware binaries could be built-in as well.

> Neil
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

