Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177072;
	b=eERSaSuVpnWZn5b8cJTn40RMVih4pA2SKLVwcTJ39TWYGPf2CPfW3XwyKtN6fwZUM6ut
	 gJCUixCguQTEU1RXLnh+KqORwbr9TTrmH2nDcNcpT9wryRnWaTuEaQW3yfBlbs8x3kDZQ
	 ZoXQDarP3B0E3Q5UrAQ1AnXoFyIOPeW0OxgiFVeF3wQvkZhTC7D/wKnGKFin0YCBgngz4
	 5DhD699e4IHtVuG4nHin4YyxOXCD+lYRxx8XPvEyCD9BWzttm2qaGn1Af/vTzqern1qcz
	 Gr0BK+OsaWB7yCvHxkLA99dozVFyUFEdHaxXyGpCEz9EyOEgMD3F5ccvVYhD/C51Jaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177072;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hrR6uj82ahGfQqaO3EwipOvU/f/xUlTfwnwZhxjl76c=;
	b=EWKYtDtAPxRY99F+V7yfduOBDwuA/t92MhA+3aAVMTnoqrveiv3j1LqecezN5axCACTR
	 BZCgP/B6bYp64JhBbYa3NKZXKs3snrU2tE0983yAz8x56QgRHPG916X7jUOFF+YWDP9pa
	 BcQGYouymXVr1b87PnaMncxegcBWzyOr1cZsw1seAhBCdrVPBHFU933gA8QZOIm789gfc
	 6uVs20lttVYULeipPe7FTkggzbh7YH9iaEVN8X4Xg6BpWAkbF3G+pd2zdJcFdatniLsnX
	 tCP8nBJnCjmVVQpG+Sy8/K8hsTCEW+LWkMNETz8jbtznnf2QZrzi5QRbLD3jEMdEJRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=mFTHf5TF;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF8C606A331
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF8C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=mFTHf5TF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794177067; x=1794436267;
	bh=hrR6uj82ahGfQqaO3EwipOvU/f/xUlTfwnwZhxjl76c=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mFTHf5TFf7pz7nD7JJqYXcJfFZV7+IWxpkOnDapWSq0S5T6VlsdsYlgwuX29P8n3/
	 jIoM6KCyqtl39W+9Oz7k5xIMzWxxUHO/T20keouB6FoEiNOYXe0W9SFzDEeLQXH14J
	 LbGjG3S4+be9QmGGI51K6hDRcn8+QiEAYHTnpB0959bc/GRsjd3tPhyhJPiy2zZJCB
	 mPhFmxFIJ4aUwsqLgrk/XhDnTwydTqsAc2mQDWKP6E+YNgHI0DPyobfVsQbS3hDtzO
	 j8bB7D+D0V7d2BoJL/pz+//it5/2OHEQZrbSRkBJtCxUBMOkaV2LHjfmNh4fzlJxZB
	 GumiUYx0oAzMw==
Date: Sun, 08 Nov 2026 22:31:02 +0000
To: "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "christian.koenig@amd.com" <christian.koenig@amd.com>, "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.com" <simona@ffwll.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amdgpu/atom: do not dereference NULL vbios string pointer
Message-ID: <4VYoOFUjYIK--SKrUsijHVOOHA6ruEc8z_hXR_OMj7syXD6492lPaEKmsRRV3iLW1QAkn2X29F7_-lVKnIx4vUE1KQtKx8Zdk8sX_rFaZIA=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: adc73b7730ce65d5d72be26e93817641b3bd221b
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

In atom_get_vbios_pn(), when the part-number string is empty and
atom_find_str_in_rom() cannot find the ATOMBIOS anchor, the fallback
computes NULL + sizeof(BIOS_ATOM_PREFIX) - 1, i.e. (unsigned char *)8:

    vbios_str =3D atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);
    if (vbios_str =3D=3D NULL)
            vbios_str +=3D sizeof(BIOS_ATOM_PREFIX) - 1;

The subsequent range check is false for a near-NULL pointer, so the
value survives and *vbios_str dereferences address 8 - a NULL-page oops
during probe with a malformed VBIOS that passes the magic checks. The
recent hardening of the neighboring date/version/build helpers closed
their OOB reads; this fallback path was left intact.

Simply leave the part number empty when the anchor is not found.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), drivers/gpu/drm/amd/amdgpu/atom.c:1491-1503 (atom_g=
et_vbios_pn).
Pointer-arithmetic-on-NULL is pre-existing; this window's hardening series =
made it the sole fallback outcome.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu=
/atom.c
index 1a599d5..7598606 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1493,8 +1493,6 @@ static void atom_get_vbios_pn(struct atom_context *ct=
x)
=20
 =09if (vbios_str =3D=3D NULL || *vbios_str =3D=3D 0) {
 =09=09vbios_str =3D atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 6=
4);
-=09=09if (vbios_str =3D=3D NULL)
-=09=09=09vbios_str +=3D sizeof(BIOS_ATOM_PREFIX) - 1;
 =09=09if (vbios_str >=3D p_rom + ctx->bios_size)
 =09=09=09vbios_str =3D NULL;
 =09}

