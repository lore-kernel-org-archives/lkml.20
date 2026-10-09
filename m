Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD42F9D85
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582239; cv=none; b=XDwSHDQYyfjhFCLTM28CUHJhYpPhdwSgut0me+3v01uZ9dI+63F49GxqY8BmLJpQWeTzflinCfeDKoongVPx+IF9UUO2211e1uAc3TwjKw93V7izjMMcu/9w6qSsVL42WBwigHE4QpZYJWbHdcDbtQNOgCNJx0yTRA0jN2OB5o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582239; c=relaxed/simple;
	bh=Zu0HMojq54+g3/8p46ih3C6jdzsLJb9uoo77H+0fS98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pVIQTrOHdNPTv2emWJpr1vU0OMk6ZYZGyu0IhECgnD1HEE0oEDhb4+T5uffkv2ZfYxQ+qnIdgcGHGUFjSuu35//oy37xuWZ4iooG9FCEZ822C4RXOX+0LtVlKmU/36QEaZqLaztGAEm9hcIRWr4xEEQLsJliyfi36PHktfHaot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W7wlvkiD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FL485xi2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W7wlvkiD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FL485xi2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791582237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DlNSozwHWelaDwiAeqzmQRLEfEKU54b/1DRu7LW/zDY=;
	b=W7wlvkiDmveYUmbXMjvh5HeIVkn4KIuyWCLLc+fRXop6xmKNGvY9XAue/1CxuhPTZriUop
	TfYfHt4yB3ggnm4LS7ul5wo21bflPBvvYV6ts+YfbVkEu87q0zvkCdLlIx+OuuwMUa6QEJ
	9DNfTSimt97ga2aTQI+a0UGfS7g4CTM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-BO8fv0f9OyWRE43KGelxqQ-1; Fri, 9 Oct 2026 21:43:56 +0000
X-MC-Unique: BO8fv0f9OyWRE43KGelxqQ-1
X-Mimecast-MFC-AGG-ID: BO8fv0f9OyWRE43KGelxqQ_1791582235
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53514fbd4a3so3377201cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791582235; x=1792187035; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DlNSozwHWelaDwiAeqzmQRLEfEKU54b/1DRu7LW/zDY=;
        b=FL485xi2Qn19Ei5tZXhGEBLitif/n1A1c9gzkKOKsfmRj9gzeLl9ptTeOrh7iSzEnX
         VnpIJLZ6hz4W4/u7hSPlSUiYCntq9O3DGRxS0uw4uhShuiaQIgoO43VyL4RZeDm9Yget
         2ViiN1BWIKgekR99aNLPYioonuk1YmE9TITyYvFr382oQwAnqo1MsnCCdjh4RZGTWyic
         ioyP/bxyIqqUMP8cl1hK8cTfAYtMPedAUiG01Ue71AU7gjwftK4gv4+xDc7C38FL0bu7
         /yA33JGTG9LBLbeor7gzuys0js4Srs3Az2F717nurn4WKpQbm8H/IennS38XdDH4L8Rc
         mmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582235; x=1792187035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlNSozwHWelaDwiAeqzmQRLEfEKU54b/1DRu7LW/zDY=;
        b=KPP+34f6eSfvOTXCXpBqNEV2Jkmkv+9cPNoqoG5NW1cCDMt2PHkeN+EdRUjEUSdH8B
         hxyc8LekUJZdBa9JTZt/67p99Vir/H1EgNjsPT6c919QBmeo6vuebNw/kMVcNI8ZgqTm
         OzoGKtKG+yOcC7W/ZKrwXj74+zyZ/OgCSQedSYoPd2pUFFZ+e5ExsxfArFCQ4aWuupme
         +Ub/mh+nKaWXkVQ1g7M2qldW6x3FZvT6aBM1D8RkJsKoHwfvaAyPdPvhTqb2dmUmjlY8
         n9ZR8j9b3FwNNhVv34AALKP4MsSIBXYFz86GbLouAVU4/OS176CfwRir+UoiIL3g0Ccf
         1/ew==
X-Forwarded-Encrypted: i=1; AKwUvBzkBjZ3ckGSd50kFZChJ9emTOyV2pju8AUFkfPaD6eoYUzEn4wPU7Rv1xOs6FsTDel9j7WPrbU4rJGIOXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHxx/9EYvQwrD91MeEluMxLQgec7OCun9xjRQDdMsHogLt4N8B
	kfjJXGmfef5CueYnBKq9tF+PYe9wvRVXfuYslmaKvBnUyCO89K4hSX2yNauekDn19frYS9lz31W
	3d8vTRPRi28XtdM3NN5yYDGS5yvarLvT7DuJc08S9OLutXz+AKHf8+nODKIDmhWsSkg==
X-Gm-Gg: AYBFou1v30uw9BAsWgq7ggw+S57tYDZ2JRDUn/7xATueSCidQqn0bgTzV6WendcX0no
	G1C79VI77PEXGNTMVRh0btU1keNO1xqi8h8QhdVyjmJN18RSEfL5Ey32X2n0Kgzd72G8tZGThqK
	TMBbEzbG4kjI6lJRhEDLRD2CedDZQnzeANJa3nMLPYg21Fc+Ycdet9BPM3+ozhlE1lXIpaA+Qr5
	1rx012fOF97Ui5oMe44BfYlNVSv8vraU6xIdg9kjVUOWQNlSv5jluWbMiyi3fPuc0LdRaWvtnlQ
	NkHZuVvZa1ybWop2UvVsC45aajlZ4XA8M6VGh7IF6zkD+QertudOBjRnGhYP1mKry6dUKbY=
X-Received: by 2002:a05:622a:58c4:b0:535:a5fb:67fb with SMTP id d75a77b69052e-535a5fb8494mr34446251cf.71.1791582235411;
        Fri, 09 Oct 2026 14:43:55 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:535:a5fb:67fb with SMTP id d75a77b69052e-535a5fb8494mr34446061cf.71.1791582234996;
        Fri, 09 Oct 2026 14:43:54 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55092856sm28672986d6.35.2026.10.09.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:43:54 -0700 (PDT)
Message-ID: <b4cd38b48d85298a7a99cf30fbd8cbbdb34a347f.camel@redhat.com>
Subject: Re: [PATCH v3] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Cc: liupeng <liupeng01@kylinos.cn>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	linux@roeck-us.net, nouveau@karolherbst.de,
 bskeggs@redhat.com, 	dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 	linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 09 Oct 2026 17:43:53 -0400
In-Reply-To: <DM0MU0O43EB9.3EEKZ4C2IUP9J@kernel.org>
References: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
	 <20261009115151.13877-1-liupeng01@kylinos.cn>
	 <25778dca265f58185917c5948490e76184c778d3.camel@redhat.com>
	 <DM0MU0O43EB9.3EEKZ4C2IUP9J@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-09 at 23:40 +0200, Danilo Krummrich wrote:
> On Fri Oct 9, 2026 at 11:35 PM CEST, lyude wrote:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >=20
> > Will push to drm-misc-fixes in a moment
>=20
> Please wait, those are two unrelated fixes with two different Fixes:
> tags, so
> those should be two separate patches.

Thanks, I think my brain just glossed over the tags while looking at
this.

liupeng, could you split these patches up?

>=20
> I'm also not sure this is -fixes material. A memory leak in an unwind
> path for
> -rc7 feels wrong.
>=20
> Thanks,
> Danilo
>=20
> > On Fri, 2026-10-09 at 19:51 +0800, liupeng wrote:
> > > In nouveau_debugfs_init(), if nvif_object_ctor() fails, the
> > > previously
> > > allocated drm->debugfs is leaked because the function returns the
> > > error code directly.
> > >=20
> > > In nouveau_hwmon_init(), if hwmon_device_register_with_info()
> > > fails,
> > > the allocated hwmon structure is leaked because the function
> > > returns
> > > the error code directly.
> > >=20
> > > Fix both by freeing the allocated memory and clearing the pointer
> > > on
> > > the error paths.
> > >=20
> > > Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object
> > > for
> > > debugfs")
> > > Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything
> > > except
> > > the hwmon interfaces to THERM")
> > > Cc: stable@vger.kernel.org
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > Signed-off-by: liupeng <liupeng01@kylinos.cn>
> > > ---
> > > Changes in v3:
> > > - Drop the extra return in nouveau_debugfs_init() as suggested by
> > > Lyude.
> > > - Add Reviewed-by tag.
> > >=20
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | 14 +++++++++++---
> > > =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0 |=C2=A0 2 +=
+
> > > =C2=A02 files changed, 13 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > index 47d5579c568d..338421e52f69 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > @@ -295,13 +295,21 @@ nouveau_drm_debugfs_init(struct drm_minor
> > > *minor)
> > > =C2=A0int
> > > =C2=A0nouveau_debugfs_init(struct nouveau_drm *drm)
> > > =C2=A0{
> > > +	int ret;
> > > +
> > > =C2=A0	drm->debugfs =3D kzalloc_obj(*drm->debugfs);
> > > =C2=A0	if (!drm->debugfs)
> > > =C2=A0		return -ENOMEM;
> > > =C2=A0
> > > -	return nvif_object_ctor(&drm->client.device.object,
> > > "debugfsCtrl", 0,
> > > -				NVIF_CLASS_CONTROL, NULL, 0,
> > > -				&drm->debugfs->ctrl);
> > > +	ret =3D nvif_object_ctor(&drm->client.device.object,
> > > "debugfsCtrl", 0,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVIF_CLASS_CONTROL, NULL, 0,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm->debugfs->ctrl);
> > > +	if (ret) {
> > > +		kfree(drm->debugfs);
> > > +		drm->debugfs =3D NULL;
> > > +	}
> > > +
> > > +	return ret;
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0void
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > index 726397ab035d..ffbe7f542ab0 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > > @@ -697,6 +697,8 @@ nouveau_hwmon_init(struct drm_device *dev)
> > > =C2=A0	if (IS_ERR(hwmon_dev)) {
> > > =C2=A0		ret =3D PTR_ERR(hwmon_dev);
> > > =C2=A0		NV_ERROR(drm, "Unable to register hwmon device:
> > > %d\n", ret);
> > > +		drm->hwmon =3D NULL;
> > > +		kfree(hwmon);
> > > =C2=A0		return ret;
> > > =C2=A0	}
> > > =C2=A0

