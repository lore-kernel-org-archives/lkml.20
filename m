Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C652547067
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771646; cv=pass; b=Pgdz0iJbNKIaOclD4/iyvOVWK7EJyzvgDgJOV0ewQBBMxyNt8tXBc1AuyOLazNxrjowIGPJkqEikvCpjXAmVqkGjlg8mAP96rrdrRvkQDZAPlAwVL0szdJVgu3sl8Aq5lOmnWh8F9hQiQ29X3Gy4yskV4nBd4bOi6fNruxMVA8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771646; c=relaxed/simple;
	bh=W2+7bjdeLJB5DriPRtjevhF7uljn15Vp87Hxw0lnlm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kgg37C8Ppp17GauFqG+d388CZivTc5RxoLMg+LQudswlpm5p4m+wXefJ46DQqjkaGRMeK+aooxvsX0hSseuJLRGHwo5x8bOlX4z3m0ur0FqRNT5UAQKhowls/KS5HZwNo6TdA1Y9yxtXa/eAWfkIISawmLbWO8KprpulgvGmbus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uGORNyFR; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGORNyFR"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666eea29cso9531747b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789771644; cv=none;
        d=google.com; s=arc-20260327;
        b=dwWZgTF8zxXWV12sNGWyjDSOXprqyYpffxJGDITbIvQMlfChdeqMIDWwp/w+4k8nq4
         6MZKUiHjT4VFBpgh9wuGENHXnt0XXcsZRLPet1crzxx9jkKySp6HA5O5XYW5OZPbLjmu
         0GuHTOORFybcOgZcfSywPwtd/hVf8E78Dme7KqY9un+lY6YbgEYkgBeoOBhPHy3njAbR
         Ue1/loYF+FeuuCaWwWM3CbS0ipjeXCz2GOA2ANyUcg5+7dbrFYP4Aeib/vt533r5xj44
         iz9DQe9poVxaLTIqCmC+/NMdurZUPZpxOK9MXPqr/6yWNa3ZpmkIQqhGFBuyC75g0gwa
         EAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W2+7bjdeLJB5DriPRtjevhF7uljn15Vp87Hxw0lnlm8=;
        fh=++B1P2wWCTywy90iqDRq6T1CDBweUAizVlGxudMb4QE=;
        b=ZLy9Rf3Xhdas7LkJXsfEji/9u3RMuNYu9hjsE+KxTUrzIMo76EDAy0cgEN+o8omf9S
         LOyYhrRc7t5tT/a8OlmuGBx0pjF5l1NFkJq5mGS16yEyy0Gma1xxgsC5uSxerjqtKG28
         uYNFWaWZof1qIcjrwcfgB1ND4EBlY7Iep38mheR/CFe1Ze8tpYZsYJYKZKeLeN2RKon0
         GRV6a3dY6CbVM+A0NMz323VTuC5E1I89tBuK00uWcgKs453RYkyeYbu9JQ5iosg1ykAw
         ayKJU5izv/niR2TNOjP7yqWWl5oLAtH45ifoxhpmEFh/PQ3/t7wa7+pXEc+Z5DtJvkM2
         VBrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771644; x=1790376444; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2+7bjdeLJB5DriPRtjevhF7uljn15Vp87Hxw0lnlm8=;
        b=uGORNyFRNykkGmOZcWfg+kzgDzhRHNM+8DH6uCfKr7QRenAnDMfs6aaduGTFpK761p
         jS8wf3Hruin9A0rZsJGmncG2Sz2NlbRlPHmdv+FeXSTjHoio8IoVA5MT5vKT4Sh4DZtj
         IBaSxpra6I2Ju+3JDGNuJYo+eITigDVFIozh2gEXHo6/SQqMaMUMcO/9dHy6gXqmZyPX
         PkGOJq1OrDW0rJ3p87duAqzv1vMxMFh87jiLJJr78TwRW3YewEZ8Nu3/uRdMjb4bIAy7
         nMU5qX9eb8APxhESscysKPNfrn+wMmEegZc8qhaePY+6ASQrr1rivpV4ZoXV5dYz2lSk
         Edgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771644; x=1790376444;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2+7bjdeLJB5DriPRtjevhF7uljn15Vp87Hxw0lnlm8=;
        b=ejubE7EWjFY6yAC2Yog6S/Xi2P43BwO2PbnbIRii7YKXsghnZXE+9cOeW7WNO+hczF
         B13L1cd9wKno5BAyr37zUz+HcvrvYCm1T0fsrfUtTr6xVPUjDPj74qO0Y9tdJaBiewRn
         0S0Ysn6o+gafgtwfZeHFJMfv7DH2VzGyiKeWEISjg1ztR6FhD3iYy0NPJ0AHXtizo2Tr
         zHyB2sVoyCQf+C4TbvkyjV2kxwxuORl+rVLx4s6GAXSkLzs5CHfbVm+zBFxJRXWgVKA7
         4k4u+H2pgHpxC2/7so3FayIpwsxWZPukb30YRNNMshvBMO6jsfDu/CBv2RU+Z4e/koYU
         JxCA==
X-Forwarded-Encrypted: i=1; AKwUvBwOMMsVF2E7icZJmXOzi/dOK+ULaxfv1NFFtUDN/eDmv6P2QnRApao6WMIOUXyjjamEvyFBmmNER6AjOYI=@vger.kernel.org
X-Gm-Message-State: AFuF++kSqIRbBZWfnChSddjxDt3lujst3GscoDCRcul0BqESODnZDi3/
	hFlgv3ccSsXzwYfc06kcqaHiv6gpAg93jXzyA/4vJlis2g4CloDseSiSeVsCeowMJ686n70Ogkm
	ARCUIX+GPupotfwQBQ6ykAy82zfQOpSNkHhDrjRZH
X-Gm-Gg: AYBFou29UmJdzCmQ9PKmnnG7EFhNtqO/pjPwyXc/pWfDlvnfPzAhUFgiZiFKEhRtFu8
	HX77yirR6+23wlqv7hCmM8EIDiDbVoS4BThVcVZqdP9m4+JOr/Gf/mQU7oJZSGQtQDarufhsyBo
	Q5dz1qhCS9bQe8TiPr11vWPJb/S5Ob+yGpuM/6A6VMMwJ2RTxYbAHGR4hAciKVrX9658mtQYv1M
	QgU0yJ11RA+OhsxkS1bGhrfblYU0HOdg6cbrDfafVCpmGNevAj1C+/ONY3aeyDRwHzhQzofAObz
	PScGtPFc44Vy9Gyd1QYtzj3fcIC6961N9uhFMnYrVZK3jEntt6vTOwo2zIpxwgHtOsWZqexaZG8
	k9x5zxbt+Cw==
X-Received: by 2002:a05:690c:10d:b0:873:5bd1:98ca with SMTP id
 00721157ae682-897383a138dmr12652817b3.60.1789771643744; Fri, 18 Sep 2026
 15:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <20260911-d0e2d97df458cbf24fa42089@linux.microsoft.com>
 <CAHreonH0b=spgb2LuUbVvWHarJWf3MOyL8qS5k_1X6gb_mjVkg@mail.gmail.com>
 <20260917-b3831e748e890287325aae49@linux.microsoft.com> <20260918-bc8077794cfb7321acf66420@linux.microsoft.com>
In-Reply-To: <20260918-bc8077794cfb7321acf66420@linux.microsoft.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Fri, 18 Sep 2026 15:47:12 -0700
X-Gm-Features: AcwNN1V4di_550pCxty93aMW3Wwt3uO84u73OJWwGphkReG6hvLmsGR_10uXSEM
Message-ID: <CAHreonEaErnUVQp-oe2YLv0VPuFDSBhrq3a7d==Nie5i4tgN-A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	tgopinath@linux.microsoft.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"

> I made an assumption in my previous analysis. I assumed that the
> notification would be dispatched in its own thread. Digging more,
> bus_notify just invokes all the registered .notifier_call callbacks, so
> i3cdev_detach would be guaranteed to run before call_driver_probe.

Looking at this again, I think there is an issue in this area regarding
module deregistration.

If we deregister the module i3cdev_exit calls i3cdev_detach for all i3c
devices including the ones bound to different drivers, which is very bad.

i3c_for_each_dev(NULL, i3cdev_detach);

I can add a private LIST_HEAD (similar to i2c-dev) to track all devices
that are specifically using i3cdev and use that list to manage detaching
instead of dev->driver_data.

I think there was another issue with the bus notifier that Sashiko was
on the right track for.
The core lock being used wasn't the right one to protect against
attach and detach
races. I removed that lock and updated the locking inside the attach
and detach functions
to account for races that may arise from module loading and device discovery.


Thanks,
Sam
