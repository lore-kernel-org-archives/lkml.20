Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82A5439328
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497957; cv=none; b=qGv0SMJgqNTvqWVPoftp7VfSe0/2+LwEk2AfpSTlhrpP/yFH6Vr0sNJAJi9f8b/E1gwxwgS0Bo/ql1NLmKfXr3DYRZVDXVdWwAIEoNT0hraNPsINXXUVz0txGuAuenP234EUn4rSFFmq87IPxTstiJfG6bXvkRDLZkgGyJdbsqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497957; c=relaxed/simple;
	bh=gl94CremZtURkglreAs24h0qp1P5+2SkLV1oiWpVi+s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s3KszobEJxwrDN4+I84g6RPMqYkeQLSIAWw0lC7bUoDzB5qFF1yJIXcRyQ6vcdAM+Xe25aKqOsdxgfXxlW+mwt/eK1K1Ge0DXfykc0B9aIqrvqMTa/pN3JUhAhklbKlan6L98WF0SLobSh/m/VNAppWbLFq2q8+ktl1YoZThsws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRx3Cr/O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rdljQXVi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRx3Cr/O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rdljQXVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791497954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xivNdc/2GIXbbGG/+ABdmEro/TPM8rs2SiF4VzboSZQ=;
	b=GRx3Cr/OKkb162SDTG3c1TP03gNllv2FnsVonWFphct4BbU2fwHa2fU7oTRF++Un/7ehOl
	NoZGaP9aS+t71Vkk+qYYKLOBbMZ32PyiDEjO/2msyHfoLS+VpKpIbL7AzBR2dCnT1X7loX
	t+zpLVM6/7vtNPXlaTSM54NfnpLLkxE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-8dyyQzctMFmYc-_Gge7ouA-1; Thu, 8 Oct 2026 22:19:13 +0000
X-MC-Unique: 8dyyQzctMFmYc-_Gge7ouA-1
X-Mimecast-MFC-AGG-ID: 8dyyQzctMFmYc-_Gge7ouA_1791497953
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917870a9be3so27547896d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791497953; x=1792102753; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xivNdc/2GIXbbGG/+ABdmEro/TPM8rs2SiF4VzboSZQ=;
        b=rdljQXVi6EQY0jA5z0rybmjU09KPkzP66N2Pgz+2ijRLj0XlU9zT9jIegfDYcwPulb
         OnpyVP2rKwnqxXsjGYX3oWAD7E0K+QQorGyx0npKTUS8vfMimCJA2dqjSG9xiE01U43u
         q8tRQnJY+r+tMPFrlqTTV0G4c2l0Vepz4Nq+2zkG6FMt/Aa2pvp+WjwxOZLAsHigpFvc
         Zf7NwqQlOibz4hgId4G04NEh2vnG3rXLZCKpWSK40a0GR1RapfimuKq4xMLtqj2f6u8g
         YU0yntpggsYcN2cqw+CnFJpASHOmWx/V+F6iqhv0nZAYJFkNPPDZaCBUdFWk/jQ0qiXf
         Ffxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497953; x=1792102753;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xivNdc/2GIXbbGG/+ABdmEro/TPM8rs2SiF4VzboSZQ=;
        b=pox6AJcb+RqDegpEi+xvoOdoTGJaKt5s8GXgcP+/opAIqbl378wfSOCPXnyQTyjxft
         5T1hEny51d7DB6OKJP6ai4Jw0eQpf7797tXZOGjr1bkS9bFobxSPuCgjZyMuO0Ayr8T3
         gWMWggsItPHfbcbf2mNvwBfbvux6vsFc9OYbNYkpoWl/sc/3/gMmyshPnKrJhiRamSsv
         PibAYVKRGaKdXIBCUVc9smPimNLJ80pfurfqw76ncdeNqm/nANZOVOz6s/1Hq6XO3dLd
         URJGGem1BM8axSHBxmsIU2YA7V33e1n/UGH8zNw8IR9Mxq+ItF0UmcKEwS08hMdb4urO
         RimA==
X-Forwarded-Encrypted: i=1; AKwUvBxIRLIZSYfKZg/MRIQlDIa7vKK9OtHQMhy+UDiyIxn/3NPqPC+vfzOBJowEjoCLnJazlv3K/51wQ3z1lDo=@vger.kernel.org
X-Gm-Message-State: AFuF++nE/8bloPZa1+rejltRG+wK3DMU65pv86TKqeWhwHIPK5NOvdDL
	qy4fs0gfyxUxLTtsbfYXVRJn7WuioDVFEWtVRjd1lCVdkj41fiet0SPSVFgU1mkrFwHZxfMoNiA
	s7cWsnF429tjgPAYk5w4RJZjrWygia4Jf5ARj15lQIWC8vO9LPNh5PysDcENAhFKxMg==
X-Gm-Gg: AYBFou2eL3vBI2IjhFlX+JAnuFaEnMIdussE8Fw9v/VSMncyKvS/56cJttQY2/TlylI
	Oo8XnoljiWmcHeLFa6aYib5qiPSG6dsj6mtIThyH5BH7bvstmHIwQ6pawLiELRcfnDA5xuAkpqE
	/aMgcNoqi1xI2liuJgCeb0MXsSg84IFAaf3SZoTLeAVMryUPGyGXOpQhbtP0WXxEZYS6Ol/tql2
	nbBcsLq6VQUjgrGR/5Dob4LxwpXJCVHkEitBThNIqbEtVRj7Ne0/k4vf0W3yI5FB1Ykv4Uv0p/T
	u24VjO0uoACFlga6OfzKtynlUic89HHwg8r0lvomphuWN5We/QSAjBeFVtL3FLRknjkxTFc=
X-Received: by 2002:a05:620a:8389:b0:93e:9808:2e1f with SMTP id af79cd13be357-93eb96ef267mr79424385a.44.1791497952756;
        Thu, 08 Oct 2026 15:19:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93e:9808:2e1f with SMTP id af79cd13be357-93eb96ef267mr79420785a.44.1791497952277;
        Thu, 08 Oct 2026 15:19:12 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9847f9dsm38714285a.8.2026.10.08.15.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:19:11 -0700 (PDT)
Message-ID: <4e16aa7b2a6bba489326428a4fc7650ae8adcfcb.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
From: lyude@redhat.com
To: jim.cromie@gmail.com, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie	
 <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 18:19:10 -0400
In-Reply-To: <20261002-my-fixups-v1-2-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
	 <20261002-my-fixups-v1-2-a83d20f9d3fe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Fri, 2026-10-02 at 12:09 -0600, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>=20
> When graphics engine firmware fails to load or initialization aborts
> early, nvxx_gr(drm) returns NULL. Calling
> DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
> causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at
> offset
> 0xf0 without checking for NULL, triggering a kernel page fault.
>=20
> Validate that gr is non-NULL before inspecting gr->has_zcull_info.
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> Aug 14 09:21:52 frodo kernel: BUG: kernel NULL pointer dereference,
> address: 00000000000000f0
> Aug 14 09:21:52 frodo kernel: #PF: error_code(0x0000) - not-present
> page
> Aug 14 09:21:52 frodo kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Aug 14 09:21:52 frodo kernel: RIP:
> 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
> Aug 14 09:21:52 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90
> 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b
> 00 48 8b 80 70 02 00 00 <80> b8 f0 00 00 00 00 74 72 8b 90 c0 00 00
> 00 89 16 8b 90 c4 00 00
> Aug 14 09:21:52 frodo kernel: Call Trace:
> Aug 14 09:21:52 frodo kernel:=C2=A0 <TASK>
> Aug 14 09:21:52 frodo kernel:=C2=A0 drm_ioctl_kernel+0xae/0x100
> Aug 14 09:21:52 frodo kernel:=C2=A0 drm_ioctl+0x2e0/0x560
> Aug 14 09:21:52 frodo kernel:=C2=A0 ?
> __pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
> Aug 14 09:21:52 frodo kernel:=C2=A0 nouveau_drm_ioctl+0x58/0xc0 [nouveau]
> Aug 14 09:21:52 frodo kernel:=C2=A0 __x64_sys_ioctl+0xb9/0x100
> Aug 14 09:21:52 frodo kernel:=C2=A0 do_syscall_64+0xe2/0x560
> Aug 14 09:21:52 frodo kernel:=C2=A0
> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Aug 14 09:21:52 frodo kernel:=C2=A0 </TASK>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index cb1810dee8e5..0871ac025ace 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -357,7 +357,7 @@
> nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> =C2=A0	struct nvkm_gr *gr =3D nvxx_gr(drm);
> =C2=A0	struct drm_nouveau_get_zcull_info *out =3D data;
> =C2=A0
> -	if (gr->has_zcull_info) {
> +	if (gr && gr->has_zcull_info) {
> =C2=A0		const struct nvkm_gr_zcull_info *i =3D &gr-
> >zcull_info;
> =C2=A0
> =C2=A0		out->width_align_pixels =3D i->width_align_pixels;

