Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789044F0551
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584743; cv=none; b=he3TrBQWQy/7MaE+1+6QrZ1GGJ7lS5ufP35oLjhEnqRqWGCL7N0LxOdR1sM2ddjdT/quO8x7AECVPKc3RUjRvIpwzQUlRy0fgguErr9iisuWms1lpESU1fut6TYjvTw90OepLC7ir3/aQlmH5DbZXLFH8v08QpcvhtSY9pk+M5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584743; c=relaxed/simple;
	bh=bK4K6Zwn6uj/JoYpayj3VUrzNvyKqfzTmCHlvOGm9C4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aYUPGsJPKX1pSLJMV+jkwPIhF1CqD6lsDQLeYlQE62poYc8pn5iLG+zBRYTzuuUHtFZ1y2qbnenhkOFZzNUQO+QIvrf4UG7k6JkiP+PrAtm82kFwHOyj5h3pVh3JrhjwEU6353W8Qiqv7KyB05kWbRJqJejUMlL6cUfI/QKMIzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CSW45Q12; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LbEFN4OO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CSW45Q12";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LbEFN4OO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791584730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bK4K6Zwn6uj/JoYpayj3VUrzNvyKqfzTmCHlvOGm9C4=;
	b=CSW45Q12oNVZAg+6CisK5tEwsqBf4Z2rA0IbcAc+YmbqBMtl+Q6pj1fj6JPkUAMxfnm5D0
	DNdYsjDiTk3vxXq6gefmYWMbSvJDrFtojb8/+hcbcyfQaZPotVc/z+7joM0RTHrdBVCuo8
	VFTTrokZd1FvOcvzPz6ZibUp0PRgc+I=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-LXNiAJsQNIuq5sWN--7Cug-1; Fri, 9 Oct 2026 22:25:29 +0000
X-MC-Unique: LXNiAJsQNIuq5sWN--7Cug-1
X-Mimecast-MFC-AGG-ID: LXNiAJsQNIuq5sWN--7Cug_1791584727
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3a99420f912so1117481fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791584727; x=1792189527; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bK4K6Zwn6uj/JoYpayj3VUrzNvyKqfzTmCHlvOGm9C4=;
        b=LbEFN4OO5hZmLXctprXIqdMXPqnTrPg/ZalXG870sOdCYxpcWT7Qc7nzRHWZuyyja8
         PfjdTk/vIdt7QqQNx5QeRHN4sVUZUGBWCwgkuguuLwzOwV8dVvtmra6RaJarEjbBPwja
         lgv6Gu56V5bCZLea5FYCVdXy7XPYe+2pKKEbPEruCLm/LUwplnlNwuGqqPkdLfmFfzRd
         v4y7o19u/iW1dkB+D7zWP+zAVE7AgDhxTHFOBfp7VcAkog02V4fW3NzWYnxgHwWPITOh
         UJtdexNvosPpc2GZcEU975/BDGVHCpoBUwsHGm/9JQXfHLjgD/puH9z7MT5Q0Ga+C0XP
         CDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584727; x=1792189527;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK4K6Zwn6uj/JoYpayj3VUrzNvyKqfzTmCHlvOGm9C4=;
        b=bluOdDdLdXGRDxfAfrzIGyvDPNCwy8QaoWeyueK0X1XIGrktGLkY/VYqwUEMz0ChJk
         /GP5JyZkdkmWgXkfq3rfQYPhtFzDoz4soudPlQSWIdTJzFnf4qWrVTr72EbAOc2Y5RbY
         IBrK5fP1ekDh97iUPWptqfCZRWkdg9gjEIl5SxfE/XZasEfpESZOIlmQYtXo8F5tPwBh
         ZG1TCoE6eNM/ONWl+jYTK5SqWF36ZjiXEGqn5P+JUNreUo6EK7xRfiZuG5kMy9QOGRCV
         H/EYIlUCK2ePkgrK6IC7ytc2fWb61WsbRVUOpjXMu9hps6/XHPiuJKjr25P2QKbHq4V9
         H1Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwayPxn9UBbRO0RL4mQ6+xe9CfhsbwnyB1FitUP5jCH/rCMY4ZRP2xEbSOGu7VnSAVcOyccIKsNFZa5g7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK79XJAE5AwZNrUKSL1qPnyz+O5ingPdETmKzPY9qYTRELsaD2U
	+JF8hwHrpoSQ/E2fdqCsir/At4P56tNqTwQlQQJeH1Y9BSVbEqlNhRFtnNBP29qvD2aFkEKdKKH
	T9om66sr0EW4/j/P8p6LjAfa3x5nU43IWOsbPiJb00JYw9vV40P+L0ujBaTxOwCc/qg==
X-Gm-Gg: AYBFou1/Ao2TeomoSEf6pA5UROxyFCjktvRsUsApsvsEYZ4ZN9tXRCtUKCJ/BHe85dV
	xo3ClO7/Pu9lY7e3lEuu7zkRoUG3BvfHDaQT5xINuM8MjxhVFmvEwfUrFi4Y+R0UUq16h/+7oZx
	3eryjxeDSNILSC2fYJuEPRh8UThAxOedS8XP/otySqzdoFlUMQrX0bpD4b0B8JTGc+xeDZa9xVF
	5QJbDlmHc8XKP8rp/mlPTjWKHnf5+OWBSiWtMIai1iKtYj6UIaBZJDgrWxY0fGSu5R1jJGAcQW8
	PhYuuCW4+ZPpOTu+jHzCPkm1cDK464R/9woCXMReQJtDapuYdXkphJgkAxURzX7kchkt75Y=
X-Received: by 2002:a05:651c:1510:b0:3a9:a07b:7448 with SMTP id 38308e7fff4ca-3a9c2b34b4bmr8879351fa.19.1791584727351;
        Fri, 09 Oct 2026 15:25:27 -0700 (PDT)
X-Received: by 2002:a05:651c:1510:b0:3a9:a07b:7448 with SMTP id 38308e7fff4ca-3a9c2b34b4bmr8879291fa.19.1791584726867;
        Fri, 09 Oct 2026 15:25:26 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9af97sm9864011fa.14.2026.10.09.15.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:25:26 -0700 (PDT)
Message-ID: <80477cda2bee82a656b866fea09b964ca9e0b955.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms: defer window LUT disable until the
 image update
From: lyude@redhat.com
To: Solom Tamawy <solom@solom.dev>, nouveau@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 09 Oct 2026 18:25:24 -0400
In-Reply-To: <CACbN=AsQdd1GsAA1FpNMZCrd4YNHidX_dQ1CmBW4zYUnHbrioQ@mail.gmail.com>
References: 
	<CACbN=AsQdd1GsAA1FpNMZCrd4YNHidX_dQ1CmBW4zYUnHbrioQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

JFYI - I will review this patch soon, but I'm currently waiting on
getting the information I need from elsewhere to actually decode the
NvDisplay error here just to double check that this fix makes sense.

On Sat, 2026-10-03 at 17:41 -0700, Solom Tamawy wrote:
> A modeset on one head can set flush_disable for the entire atomic
> commit while another window changes from an integer framebuffer to
> FP16 without a modeset. The latter sets clr.xlut and set.image, but
> not clr.image.
>=20
> nv50_wndw_flush_clr() clears that window's ILUT before the
> intermediate
> disable UPDATE, leaving the old integer image enabled without its
> LUT.
> The new FP16 image is only programmed later in nv50_wndw_flush_set().
> On hardware that uses the ILUT to convert integer input to the
> internal
> FP16 pipeline, the intermediate state is invalid.
>=20
> This ordering defect was found while investigating a Plasma login
> hang
> on GB205 after atomic modesetting became enabled by default. The
> failure
> logs contained window UPDATE exceptions followed by a core notifier
> timeout:
>=20
> =C2=A0=C2=A0 gsp: Xid:56 CMDre 00000001 00000200 00000001 00000005 000000=
2d
> =C2=A0=C2=A0 gsp: Xid:56 CMDre 00000005 00000200 00000001 00000005 000000=
2d
> =C2=A0=C2=A0 drm: core notifier timeout
>=20
> Defer the LUT clear until the image update when the old image remains
> enabled across a separate disable UPDATE. The LUT clear and new image
> then take effect together. Keep early clears for windows whose images
> are disabled and preserve the path without a separate disable UPDATE.
> Pass flush_disable explicitly to the set phase, since the new plane
> state's atomic-state backpointer is cleared during state swap.
>=20
> Fixes: ebf8ca6b3d6d ("drm/nouveau/kms/nv50-: disable input lut
> harder")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Solom Tamawy <solom@solom.dev>
> ---
> Based on linux-next f0406245cb9855e6318335a8a223551354291a46
> (next-20261002). This is the functional fix only; atomic modesetting
> remains enabled and the advertised formats are unchanged.
>=20
> Testing:
> - A focused C harness extracts the actual pristine and patched flush
> =C2=A0=C2=A0 helpers and models two heads at each UPDATE boundary. The pr=
istine
> =C2=A0=C2=A0 helpers fail the mixed-head integer-to-FP16 case; the patche=
d
> helpers
> =C2=A0=C2=A0 pass all 14 cases. The model is not a full GPU simulator.
> - Nouveau built against the matching kernel configuration and headers
> =C2=A0=C2=A0 with successful modpost and BTF generation and no build warn=
ings.
> - I successfully logged into Plasma Wayland on RTX 5070
> =C2=A0=C2=A0 (GB205), with three NVIDIA DP displays, amdgpu active on the
> integrated
> =C2=A0=C2=A0 GPU, and a CalDigit TS5 Plus dock connected before login. No
> atomic=3D0
> =C2=A0=C2=A0 override or USB/PCIe/Thunderbolt PM workarounds were present=
. The
> =C2=A0=C2=A0 expected patched module was loaded, and the I confirmed a
> =C2=A0=C2=A0 successful DRM_CLIENT_CAP_ATOMIC=3D1 capability probe. No Xi=
d or
> core
> =C2=A0=C2=A0 notifier timeout appeared in this boot.
>=20
> =C2=A0 drivers/gpu/drm/nouveau/dispnv50/disp.c |=C2=A0 2 +-
> =C2=A0 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 13 ++++++++++++-
> =C2=A0 drivers/gpu/drm/nouveau/dispnv50/wndw.h |=C2=A0 4 ++--
> =C2=A0 3 files changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index e91130f93db6..b7022a9b6e6f 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2351,7 +2351,7 @@ nv50_disp_atomic_commit_tail(struct
> drm_atomic_commit *state)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!asyw->clr.mask || atom->=
flush_disable))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue;
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 nv50_wndw_flush_set(wndw, interlock, asyw);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 nv50_wndw_flush_set(wndw, interlock,
> atom->flush_disable, asyw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Flush update. */
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 74eb1dfcc043..ac59219e162a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -137,6 +137,14 @@ nv50_wndw_flush_clr(struct nv50_wndw *wndw, u32
> *interlock, bool flush,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union nv50_wndw_atom_mas=
k clr =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .mask =3D asyw->clr.mask & ~(flush ? 0 : asyw-
> >set.mask),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* A different head can require a s=
eparate disable update
> while this
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * window only changes format.=
 Keep its LUT enabled for the
> old
> image
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * until the new image is prog=
rammed: integer formats require
> an
> ILUT.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flush && !clr.image && asyw->se=
t.image)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 clr.xlut =3D false;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (clr.sema ) wndw->fun=
c-> sema_clr(wndw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (clr.ntfy ) wndw->fun=
c-> ntfy_clr(wndw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (clr.xlut ) wndw->fun=
c-> xlut_clr(wndw);
> @@ -147,7 +155,7 @@ nv50_wndw_flush_clr(struct nv50_wndw *wndw, u32
> *interlock, bool flush,
> =C2=A0 }
>=20
> =C2=A0 void
> -nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock,
> +nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock, bool
> flush,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw_atom *asy=
w)
> =C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (interlock[NV50_DISP_=
INTERLOCK_CORE]) {
> @@ -157,6 +165,9 @@ nv50_wndw_flush_set(struct nv50_wndw *wndw, u32
> *interlock,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asyw->set.sema ) wnd=
w->func->sema_set (wndw, asyw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asyw->set.ntfy ) wnd=
w->func->ntfy_set (wndw, asyw);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Apply a deferred LUT disable tog=
ether with the new image.
> */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flush && asyw->clr.xlut && !asy=
w->clr.image && asyw-
> >set.image)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 wndw->func->xlut_clr(wndw);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asyw->set.image) wnd=
w->func->image_set(wndw, asyw);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asyw->set.xlut ) {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> index 7bd8bcc199db..b0b1b10cf782 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
> @@ -40,8 +40,8 @@ int nv50_wndw_new_(const struct nv50_wndw_func *,
> struct drm_device *,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const u32 *format, u32 heads,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum nv50_disp_interlock_type, u=
32
> interlock_data,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_wndw **);
> -void nv50_wndw_flush_set(struct nv50_wndw *, u32 *interlock,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct n=
v50_wndw_atom *);
> +void nv50_wndw_flush_set(struct nv50_wndw *wndw, u32 *interlock,
> bool
> flush,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct n=
v50_wndw_atom *asyw);
> =C2=A0 void nv50_wndw_flush_clr(struct nv50_wndw *, u32 *interlock, bool
> flush,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct nv50_wndw_atom *);
> =C2=A0 void nv50_wndw_ntfy_enable(struct nv50_wndw *, struct
> nv50_wndw_atom *);
>=20
> base-commit: f0406245cb9855e6318335a8a223551354291a46

