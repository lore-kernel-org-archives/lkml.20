Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32903305695
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498757; cv=none; b=mUGtxCpb2ypRO2KUsLyBzbpbyEAdaVYSQ1Ty5WfXHYsTpVP2PhtqkSpgLfy3yrDk56rDJTOkDF0M2s6ztsG3mkmC2VyBTT1sxHk8n4BhC9Dxayy6Zn+LWQU5MHGyib2HmP6y7sgMh8WeeCXXV2HNocfmAXUTwZK9rGTNVBhXqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498757; c=relaxed/simple;
	bh=SIc4iwA5XrGPQ2J5CyhQjre/d7+7alnceRYs7l0hTO4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IDt324xsHUmVpkQ/ZvSW+XqM1EPi2VcHOLI4H36tUaQ7dEjO/1loaJqUyIy8zSbC1LULuzTGh4V9KAnpFUd/yrTg+E+LPxtbyUQ0yAWZ4M0sN06SovRcBvT0ymMnu5pJ27esdqYpeEab5/B0KL7sqtQW3viK6l+acbhjvZIyr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bWyl+jJ2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JiGwRsDS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bWyl+jJ2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JiGwRsDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791498752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIc4iwA5XrGPQ2J5CyhQjre/d7+7alnceRYs7l0hTO4=;
	b=bWyl+jJ2pB3KHzW6jXVOADPvy6rN8wKXy0QK9P2jYtnjH/lTFjstiq1ZUT7bR4P9etNUnB
	tRz645CCuBbJCqthT9cOsS4Po4QBhrB0uo3VW8+n77NKYGeRwsqg59RhXY6yUn7CNRO3Zq
	2goVOqfJDMLV/Kp5qBWgzL8/nSs2gfU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-jF4F0dxjMWaz5Wp5AkRPeQ-1; Thu, 08 Oct 2026 18:32:31 -0400
X-MC-Unique: jF4F0dxjMWaz5Wp5AkRPeQ-1
X-Mimecast-MFC-AGG-ID: jF4F0dxjMWaz5Wp5AkRPeQ_1791498751
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso1081420085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791498750; x=1792103550; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SIc4iwA5XrGPQ2J5CyhQjre/d7+7alnceRYs7l0hTO4=;
        b=JiGwRsDS0N2n1fpHdm7Lkkbjgv6QxCvFvtqm5lkl/vJIIt8z2FhggHONvnmTi3sxDz
         PPKXSAAI+la1WuzoEtgvbxxgisdCRRTldHCbgafgN/lMyVhstzSM7cAbiEXaDka7pl9r
         QwKHb80WDfqspfMQMFxNI2xYCVxIoSjPcZRodK49F+4OEtBU+gQuJkUf6JO8BnpBwd7C
         xmXt9t0lb4+aGKIxcJMTTqmJ5uECqg3Vt7twR5eP774/luX7ALR+h0iRP0XALFqcABVl
         ZaJxcpMzN1Z6HyU6Bxh8qSBv1LvoUGtIxGEyoDw9xNs+SQhN1r7RWeKLJOB58G5dbypl
         cwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498750; x=1792103550;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIc4iwA5XrGPQ2J5CyhQjre/d7+7alnceRYs7l0hTO4=;
        b=gZRXKPljalWIv8WUpIAmrkvRcYB4y/Epf+ZOC9mJhhuiRBbWY/sqYRKuP3fYZ2DQl1
         DJeNsae1Dg9ou2eXxmaoNr06+FbGOf6P7cYoshXAhia3ILg7Vr4ycWbQ7OIZXCYW+hP9
         gP5d5IUnMqJiKrVRegAu//c+jRe7eouLURZGPNw9kIKCUofX0RnAr6sDGMN8G7cQYB5E
         7FcDkb0i5luMy8aGKsVhwXnrVcJoSdFOh7CprYlrSPhR6T/evQvBLJTVVOP/sxCDZM9S
         Cs7CCkeCQ0eYENxq2CkI6GrxIRBwKWKpQspaD+0Xa94VFoKWwAJyQEpqhDgYWPJ3ceEo
         NGiw==
X-Forwarded-Encrypted: i=1; AKwUvBwY5mevFnSQSf1+ZjSXiRXOxMw97YcE8ywAJzKs1EXIFql7+Iv8eTwRwnTCXIbT3MykhDJCI0W5QGzunvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lDrYMVVuUAjKTWW6VZ55QGbDS1IPcEU5uj1CTLPy8obsCLkjG2
	GjA9WMekOY/8jb8lQ4NzJnkWcyW+u3LAA9UUZm0R/p1T/Xb/hJGAMYXN2V1Tjp6pnVcUWl4L9Xv
	hib2QI6kJH36ewpvEXclaxzmJN7WY+RiB3TdCjdytLw9qQOMlkErBH2xGSa4vhbissA==
X-Gm-Gg: AYBFou1Wc7HVNeFFv9WsnK1fwjk22Yc14nxO3CTaTOkageDnnLGfWFOcXcuTFERyOS1
	gTLsWOwfMUJ+eMo8QQMkjDAyUf3QG0l/Ft9w1GJ96Az29/C7jvRWxTEOjTAg4a39q/rp0tataRA
	5pHVqeJiN+dVUm+xdQQw8IubqkCPmJ6TEZflV40e1QWpTC5fli5CIKCog9Jg/+23JMiFV6njmPK
	EpY/YxvbvAvVRBDG3NOTqYQMKHp4y8cMEFIknZhJV/F/8jD/I/Beo7/9K6kbQkXYCh6AUnmyUoe
	RxDAXutWKYaa0a2IAd5SLA/ZPWs2GcLKNGjF0mGT3MhoQDHpkdn9WTBoDz1h6noaHZpj8rU=
X-Received: by 2002:a05:620a:31a7:b0:93e:739a:7ca0 with SMTP id af79cd13be357-93ebd22937cmr7032185a.18.1791498750535;
        Thu, 08 Oct 2026 15:32:30 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:93e:739a:7ca0 with SMTP id af79cd13be357-93ebd22937cmr7027385a.18.1791498750001;
        Thu, 08 Oct 2026 15:32:30 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550d394bsm1890416d6.41.2026.10.08.15.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:32:29 -0700 (PDT)
Message-ID: <57528a486e149dc398d0ca443b33b16f805ea4e7.camel@redhat.com>
Subject: Re: [PATCH 0/3] nouveau: fix 3 null-ptr derefs
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 18:32:28 -0400
In-Reply-To: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Actually - sorry for going back on a review, but before pushing these I
realized we might want to do a bit more of a concrete fix than just
these patches. Why don't we modify nvkm_gsp_rm() so that it also checks
gsp->rm, and then use coccinelle to convert as many instances of open-
coded `if (!gsp)` as we can find?

Would you be up for handling that? If not, I could just modify these
patches, update nvkm_gsp_rm(), and send out a new series with your
modified work included.

On Fri, 2026-10-02 at 12:09 -0600, Jim Cromie via B4 Relay wrote:
> These 3 patches fix NULL ptr derefs I hit while booting kernels with
> unrelated work (dynamic-debug) on a 2019 amdgpu+noueau laptop.=C2=A0 One
> of
> them is possibly hard to reproduce, the others are "dependable".
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Jim Cromie (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau: Fix NULL pointer dereferences=
 in GETPARAM ioctl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau: Fix NULL pointer dereference =
in GET_ZCULL_INFO
> ioctl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau/gsp: Fix NULL dereference in n=
vkm_gsp_gcx_ready()
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 27
> ++++++++++++++++++-----
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/device/user.c |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A03 files changed, 24 insertions(+), 7 deletions(-)
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20261002-my-fixups-324d25f3bd05
>=20
> Best regards,

