Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D874A387D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264546; cv=pass; b=rrmCusu/0OX0pjI9XKw8kEu1Bpbr6HgpyUSjoM/R//tBfdHvfN9CQWlF4ApKJpbjNCN4Wju9z0dcVKls9sQtshFYmh9OuCv26TqC39+NCT+x4mgfFRLuTfRPiZhcT6jlzInOd+62k523fo0xcrlSSm65JHEnJ2+4zRe2pFcoSAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264546; c=relaxed/simple;
	bh=PyIrnipvkBWRV4hHOpoG3qPK65aPl0bzHYIyrKbgTzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRjl7yBoLeQJdlMVtR1lPQ0k+9X2dDnWfhzjkmIcLt2+ygeEAQuCMuHumGIh3OoWzjyEsuA0oJ+e23okKk4Z2D/MxPXEbVOsT/v5q2voIuwkhAExZJSkOnxZMp+MxMGWU6ayIDdukIF2at6YeaE6awKfmznQojanhov8oWwJrQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HKSw5P6M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UiSN36fQ; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HKSw5P6M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UiSN36fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790264543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
	b=HKSw5P6MhqMw/LZ8dVKTlQ8EnnGRUHQgS4wQ6GGvxbdRQ4iOtQx0MiN/BE2AIz2OHdONNt
	w+KxSdrTdqInjs9/n+Ut5qax3qC+3WOZhlMJ9UBWqE9CwolDYWOJtJ+AQPlymw7pzFnVvO
	PvSOPpMGsd7qJuAOekGZasZQJIWhQ3o=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-kGt1yUfrP_GCrGFTUxtCBg-1; Thu, 24 Sep 2026 11:42:19 -0400
X-MC-Unique: kGt1yUfrP_GCrGFTUxtCBg-1
X-Mimecast-MFC-AGG-ID: kGt1yUfrP_GCrGFTUxtCBg_1790264539
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-892be308686so41800807b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790264539; cv=none;
        d=google.com; s=arc-20260327;
        b=MW+SihfsQccrx/uF95WHHXk2O4Xx6wIoSUeB9wSTdPnNyQKQaOQy7ypYEWXPyjft/w
         RCsy+aFFu4Mb3UE7SWJU1Uvjpi9VL0Dgd2jzFnu631qStn1e2VpJchJb6UQWp0pT6PKL
         FhrS2S0ZMDl3uIbtW+TQCIpX+sV6usqWc+N2mMIJkIxX4dX8Unxv1VO/MzQ9eIHkeHA+
         1F2KIbQaAjU/rvqJkzuFrOo22pZ5TJMDcMDAjnOaoHaSJfi+ADU3vuQDzdSa6k0S/0z6
         K+Ni6DY1UQ9UJqMaLOv1vbzEMJ+5f9WiOoQftsObuvOYr5nXezqMtqvrnEZ/fXO1dguo
         Keow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        fh=IbII/G8YmF3KwC1aguphfdjHVAqSg6wE1bgNGLaOiJo=;
        b=W+RufPaw99Rv/whiZ+XyAS0XjLNbaEwYxsck28KqY6FP59sIBDw7MKMJ4JnsNIz1u2
         xU6a1SnQA7nbxJb/r1/WbYLaycv/NedS+GEQIczLTqBertDjjI30jZx+AolRdAkrSUA2
         oSohK1as+nWOk3SaZleSJrnSjyevMCGDNiepo+SGfzuncou4noZWQdhnxbBsZWCY7NNo
         IJAfZC+ynlCeYYL1OR6LSF6IEHG/+/lAoS2gpZaEZ8oCn6nlwaO7k//9DgUPEg7zPGqJ
         vlu4pQ1cY6vR/p466UM5JQaEt6kevSg7ZL5WUVVe1UfYVRMO52/4tJKs5EUzjka96Lt8
         LQmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790264539; x=1790869339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        b=UiSN36fQL6QI7gOFKIRAXpB32KZvpgTZ0bYV/KBNmlIN6qm7jax60KwKrEHg+eMqa9
         udWcnbLBthounfjlspUNpVzA/a3M/L6qNzbO4BzIhnzqgD6x4PLAtrz7dbs16BVvHAlv
         kRf0aJ8GyBaHFCXd5a/GnXw3AuBUbbSzs4kH5Omcg1UxWjIYTVTLXFzBfq911Hg0J1v4
         jdF3NvIiJCHTWsgehT5JMOrPtI/KTgdCt2uGvHlNfNm1ZXHO0vFWZ9SJQXMWytDuNWZh
         54MEXb0EiRLNWgTC8Fbnwm5byWnbinwmAgKv+DglBTsNlbOPHxpIWgvG4r8ffXv1kwBs
         rFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264539; x=1790869339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        b=LtEb5ehe/H1cBlobvIrEORxvATcrs44+8qmchh3ZRCHy8JUPAdRDIPkeQEt9wEYgJE
         AanLvNl57pP9v6FEbuYRv4iNU02fKRjZMNtYnMMisKqL9DGR8DeFP6ial1gc+eyyA5T+
         IMOYMLSOiB/93vRRUkW1+XOVknDUWgVp/C/5KDKEURSqLlied0RbPYxfGoGN7AYkQalU
         L2mymeoGSxG9nfdJg67iqnG70v6xrZiw3b0c6T9NWrPf86NBd3J+s9tngyYpKmC2wJL6
         6nm2OxjMI9q3myL47kvt2vvtjBP8w3uJwv4G6O9z9/H7+vOkF2DkmsUi/LausjbLY6xx
         /BrQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/XxCOcewqUeZ6N11C18OVz9K21n3JGkTn2hDE3S255RawNsmwe0aHDvED9U/wbQ+TDjmbkw/la9CMwao=@vger.kernel.org
X-Gm-Message-State: AFuF++nVuCRMfCRj9Bse44oQ2muFh5C6YC/74TOA6U6QvVwxNOwQVaA+
	wpuphUc2CcD+9ng6ViGj9FYiBT89YSVYT2UrdOC4B6Jwfz7iXYJNEpnyJZZ1gJqUe7i5lcCZ4Xn
	R3aSMuQvKJF46wRWvGbpW39nl0xtIaeWD5Ioff4rwbBNANMZp5v8BJi++uIifx07XCofn3jN/9+
	1KBCO3M7gg9ijagIAFi74D/sWJkJ2Z0Yas2f7X5hwf
X-Gm-Gg: AYBFou1y/j9gqvqxmpSj+Ji7Uls/z2NZol8G7ne7el6Iu9gWbzRBux5aCxmXv3+wt3v
	//6UXnzEwIHMlylYIbSPxwmUoTw3cUUPSLDWnAzrcCXKZZYpEIwxJNNVkGj6mYheeiNrR3nBAh2
	EsgBf5VhC2yvy5I9yb1a42kwdmZ/KjbJ1qLjCxF74My+sLJN+ZQtjREw==
X-Received: by 2002:a05:690c:6e87:b0:8a7:91f8:1e8d with SMTP id 00721157ae682-8a791f82a3bmr9357437b3.53.1790264538925;
        Thu, 24 Sep 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:690c:6e87:b0:8a7:91f8:1e8d with SMTP id
 00721157ae682-8a791f82a3bmr9357067b3.53.1790264538368; Thu, 24 Sep 2026
 08:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <bRb6NzJiFvNGB0X3BeiVytgZNlRv88LFlcaBwwFIFa3GtVZhn5bh9EoRRDliRtgsnlQNMddvcIPK-5HK9x7z9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-2-3573e2596c51@redhat.com> <49153dff-b4e0-43ac-aa82-15175fea6445@kernel.org>
In-Reply-To: <49153dff-b4e0-43ac-aa82-15175fea6445@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:42:05 +0200
X-Gm-Features: AclHuK8NibWpN40MLtS8tk1TsaU8ZJKSI8cLr02zuHOUyaXDRMTCkw3xFezOa38
Message-ID: <CADSE00JcFOY0r6doD1Qpc0xtZ6HKsa4kFGsV0_FsNbb+yemmKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: qcom: scm: pass qcom_scm through the
 exported API
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Brian Norris <briannorris@chromium.org>, 
	Govind Singh <govinds@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:08=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   static int spm_cpuidle_drv_probe(struct platform_device *pdev)
> >   {
> > +     struct qcom_scm *scm =3D qcom_scm_get();
> >       int cpu, ret;
> >
> > -     if (!qcom_scm_is_available())
> > +     if (!scm)
> >               return -EPROBE_DEFER;
>
> Is this equivalent code ?
>
> Its also a bit confusing to me that the next patch adds a .available
> field to the qcom_scm struct.

I can see how this can be confusing. The problem with
qcom_scm_is_available(scm) is that callers did not have an SCM handle
yet. So drivers needed to search for it beforehand. Once I had to
repeat that a few times, I instead added qcom_scm_get(), which looks
up the bound instance and returns NULL if it is not ready (and still
uses qcom_scm_is_available() internally). So, !scm is the same check
as before, while we obtain the pointer for the following calls.

scm->available in the following patch replaces the __scm publication
flag when the global is removed. Until then, readiness is still based
on the static __scm validity.

>
> I see where you do get drvdata but I haven't managed to find in the
> series where the data gets set - haven't asked an LLM either - I think
> the logic to associate the scm pointer and get it should live together
> in one patch so that the logic is easier to find and reason about.

platform_set_drvdata() is already in qcom_scm_probe(); this series
only adds the dev_get_drvdata() / qcom_scm_get() lookups. I can
clarify this in the commit message so the set/get pairing is more
obvious.

BR,
Albert

>
> ---
> bod
>

