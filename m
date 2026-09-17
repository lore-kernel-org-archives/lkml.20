Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064A54707A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669414; cv=none; b=rf+0ZB+oMd7nhbWFDv8tRxJtQifADw8v0RJebqJdy+QBQKgykpz+l9g0uLuIa6AYgeKrTDK0nFs8UdFBdz7QaSTnjuB9bjcW+xsioMDEEGsCpvd5ehlobfFHYAqZDt9s0J9nZ7obtk/4YDpHR0gKUqkup2F2oHpxaeHxMjc+w0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669414; c=relaxed/simple;
	bh=xXBmJEPdDTIauo1QIvoEFRcXpwauiBTUrGweuFyxe4w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i5a76jy+d11L7Nwtr7AJTrDGWRwV6zU3F5Z4PIujuONBu+pO0Ot4/5FdeHbIPeIxvotxUCI3WRHxsAOyrMR4xTSOAImOl56yGPdqT1nGUJJxbZhUepqNpe6QPOBG+X+5MxDwRz0KmjZl6mQqsPDY4DYez2F3RP+YLCqaUbrXMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PusStOHv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xo5Kg2fR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PusStOHv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xo5Kg2fR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789669410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDPWA2x/XShhRvPN2CAJ/FdnJPiyLxgST24Qp2ARue0=;
	b=PusStOHvZpdeo3flxF8JRSO9AwOliQC0+Abg3zpPa22CAX6nZQWJjDetY7YDuvhDQU3UUL
	kvuWGlR7E9SsrSh5bTS1FHgFJmuosphChNnHVPIMojYcHFnVaD1p60LMPeHWYv33li3RJG
	PZZ7EhEvMO/o6YT2+BMsKsXiG9tw0gw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-braHaweDPc64FWBFIU46TQ-1; Thu, 17 Sep 2026 14:23:29 -0400
X-MC-Unique: braHaweDPc64FWBFIU46TQ-1
X-Mimecast-MFC-AGG-ID: braHaweDPc64FWBFIU46TQ_1789669408
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e80ce3597so25178606d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789669408; x=1790274208; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WDPWA2x/XShhRvPN2CAJ/FdnJPiyLxgST24Qp2ARue0=;
        b=Xo5Kg2fRNt1JF+Zowh2pMidPztKCGsvHHRa8Dg8e8/1MZz6HbNqyTS4xKGAFvkR/As
         2zlYAlAdto80Cinu3r8r12UpBXN69B2s3JMBiNB4/xx//U2IeQKSdcm4DtwnbZiSDywJ
         xfr7DVbgK01aPK61xFeKRWjOKQrYP6TchwfUwMYskpNu7HHHSQmAzBubfKYUhQRVoiNV
         e4RT0iuSWgYdY19kmaolzj03q22PQoFXf6MuOr6deAKnNYetlbQE058BWxmhfwBcZ3VB
         ziyvRifXIExfIkFW81O9c0byWgd4HiC5j9YsxBuGbfW0Yx4MLHnQouqAAe4REAnX33kK
         Dw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669408; x=1790274208;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDPWA2x/XShhRvPN2CAJ/FdnJPiyLxgST24Qp2ARue0=;
        b=AZbis7PO/pEpIolGWcfKjyrRASJ2a5O/toPHIBj+nZvapmyh+TiRklsE9HZ5VoWfVZ
         MUVxiOy7ojTOyBGqA5oqDDmMr8FoF4zJ/OrDfFmFOYP0YAUvnAYh65B4gX46fCp+wTSX
         ei6jPf6MImp8mbgfwfo0wXzXN5V7wmlQY96N+hHRDFegc/kfgJWhDRe3MGdmTzu+G5n8
         mamMFRuGpF0g+mAfiiowDCXuvp8dSQFRbvecmY4wNps5uMlGBl+Z6r3lQlUYtQ26mFa3
         npGQcAk5hMSqee1pfrx8pJvlW6XWgE92+SnB4VaCzb7DsaDeGwa+HU6sAHCQgwUuOLvJ
         AnNg==
X-Forwarded-Encrypted: i=1; AKwUvBzOrBzB/1PUbIZPWtnE72RyxyQ0wdR7bi9XsO2cYz7DsCRAM63Y/drflFeZ99IHDhUBqXz74TreEg6wupk=@vger.kernel.org
X-Gm-Message-State: AFuF++kyYtCm1xVI4rZivTDPn7p27cb5zwjeWKBCJhs6OGWvtOnchcvl
	XOvr+TheS751WRi+iYLH3mGbRCaY8kKY9J5LwF7BCIqZcNTnx+GxIqe5ur4xJSavMXvyeWAWB+M
	aSvTKCdplDgkTtyRzmUKhTppPZXBwIQ9XdC6kuHTcmZgxDlMtn43BGG22WZqiDZicEQ==
X-Gm-Gg: AYBFou012ycntlwVozO4WX++VZF2NTBX2x+zO6clYmRjcqf7MEbJs1PU2sbdp5RvUaE
	USu5EkwvER/vI098nwJO0VBsNuYJOgLe8u8nLn7ldPLp5etN9EiFRY6cwpnsQ3g+fi77HMRQGVS
	i04jPi7q5aqBMqO96nHZHKSoD3lTqvwIXsWXSdPJZKHwygiCSBSDp2jlr34R74Hktw1w1UWavgZ
	MjfnK6cm+jEi2cBfjz4aB7DpnVLEfR21HpsrAM6Lf+DEBJr2XQmRsvm/7abxQBN5oICdCY6fIXV
	tYgJXuYSNgReMGAggbD0BjiDWFXmODtc6HzrC4SUwABZvFmZVP0082ZqFPbpyNymQcKxIWRy
X-Received: by 2002:a05:6214:80d6:10b0:90e:98c9:548 with SMTP id 6a1803df08f44-91254ba3a7dmr883536d6.1.1789669408609;
        Thu, 17 Sep 2026 11:23:28 -0700 (PDT)
X-Received: by 2002:a05:6214:80d6:10b0:90e:98c9:548 with SMTP id 6a1803df08f44-91254ba3a7dmr883226d6.1.1789669408180;
        Thu, 17 Sep 2026 11:23:28 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252d17cecsm3762106d6.44.2026.09.17.11.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:23:26 -0700 (PDT)
Message-ID: <fc7bae477fdeab0bcbb908863b4f434dc03844f2.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Fix runtime PM leak in
 nouveau_connector_detect()
From: lyude@redhat.com
To: Wentao Liang <vulab@iscas.ac.cn>, airlied@gmail.com
Cc: bskeggs@redhat.com, dakr@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, nouveau@lists.freedesktop.org, simona@ffwll.ch, 
	tzimmermann@suse.de, stable@vger.kernel.org
Date: Thu, 17 Sep 2026 14:23:24 -0400
In-Reply-To: <20260916180342.2090360-1-vulab@iscas.ac.cn>
References: <20260916180342.2090360-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Nice catch!

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Wed, 2026-09-16 at 18:03 +0000, Wentao Liang wrote:
> If nvif_outp_edid_get() fails, nouveau_connector_detect() returns
> early without dropping the runtime PM reference taken at the start
> of the function, keeping the device powered on until the next
> successful detect.
>=20
> Balance the reference on the error path like the other exit paths
> do.
>=20
> Fixes: 0cd7e0718139 ("drm/nouveau/disp: add output method to fetch
> edid")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
> b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index cc239492c7f0..4a750d4bf1f4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -600,8 +600,11 @@ nouveau_connector_detect(struct drm_connector
> *connector, bool force)
> =C2=A0				new_edid =3D drm_get_edid(connector,
> nv_encoder->i2c);
> =C2=A0		} else {
> =C2=A0			ret =3D nvif_outp_edid_get(&nv_encoder->outp,
> (u8 **)&new_edid);
> -			if (ret < 0)
> +			if (ret < 0) {
> +				pm_runtime_mark_last_busy(dev->dev);
> +				pm_runtime_put_autosuspend(dev-
> >dev);
> =C2=A0				return
> connector_status_disconnected;
> +			}
> =C2=A0		}
> =C2=A0
> =C2=A0		nouveau_connector_set_edid(nv_connector, new_edid);

