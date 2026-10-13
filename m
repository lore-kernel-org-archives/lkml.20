Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD84F3EA5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892861; cv=pass; b=IOK35AFK4R+tewNNGhzhBqKhMBpNADD5iQjPCNIufdikVABSc77z3CEYSphnbn/rTp9zJ92+psp84FmMR/P409IvQIJWKZVQiYYz4qR2zcJyIIP9kbTPln0zxo2F/dmuqhb0oC2yX6300IWWhWNvPLN9639VsrYgtsL2nKoSdrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892861; c=relaxed/simple;
	bh=1slJAwzl2cxbNdWY1OKZEBi3uDMxGGoR+9c+sI89apc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKI3xBya9fqBG1vgFngQ5hU34Q3YE4wKYh/caxcecG9LilO4aL3Aj9IhWm4cmWPcI80GgQIMbPIB3wRU2iZ/gMPfEMmx0NMvqyyadZBDixLhzILnpF22k/JYVECpbXiNLCdAMtexGFeKEejKjX/bCNyeRCHWka9wXtDHx0pF1CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BCPyeYlM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ff0WNXEp; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BCPyeYlM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ff0WNXEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791892858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MTh6w3t1LI7cFHlFOA6EXonuQhJfRF96d/zfPpAsgQU=;
	b=BCPyeYlMDjOdJ4AKan2uS7TgpZu0Rl8EUHX2kU0zhIlN2DC4p2Hv24QTm1yQykkWR08qmI
	LwRi/wgkwthCiemvaBeL9GSC4EyqZXsmBC7TDvvK696SjKQRLd4TDAnqdT3M4m9Uy1NfYF
	hQdlsIVE2xAUu2KY7owhI033KDb2q00=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-vCezVUoYNPmElG1EkWvUeQ-1; Tue, 13 Oct 2026 12:00:57 +0000
X-MC-Unique: vCezVUoYNPmElG1EkWvUeQ-1
X-Mimecast-MFC-AGG-ID: vCezVUoYNPmElG1EkWvUeQ_1791892856
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8acc7fe346cso40879827b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791892856; cv=none;
        d=google.com; s=arc-20260327;
        b=W+gis5RatVrvv9Ir0j3BsH708/v+oua8Zq+jFj6HT8DsowIFVnIMGfqJjjI7G/bp29
         hZxMTj9y3JHUgKjyy2jpfthPNIl3g+vduda9yPA76Jq2gqxp89F2AQG7fECnHpoJKMDn
         b1SwI4ppNEWAznPBv/hlFGYIDTiJth+dbNWNZMuhOeS6yzzGsZSQBlcTebZAUPbCVFeT
         YQsF7kbUs+2WyNr8DejnH2Ix7BrINrR3dUqafPkrKsilRBVcFvbl5I8BOdA/Sn97uQxh
         ux5wRly0kx6Iv2FlalSVh1AJoCHHR7yRWvJYY9AX4CkttvbuoByxi+Pwl113NFd0zev3
         TFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MTh6w3t1LI7cFHlFOA6EXonuQhJfRF96d/zfPpAsgQU=;
        fh=2nEyFQ6hzzwtfeC4b3104a2rzIqFZTgr6ncky5HMZoc=;
        b=XwozSEYzNDdUtxPUNQxA/FOmIskAwTasnkSnZyHeSMcr9IlSerUfgeXM0hsvhjUnFH
         6z7lv1wx+BkI/FiPGo0yrQGB4xDNY9xmxrsirj00BdZ4LwyFyVUh1/ZT4U7yap1ocDVK
         FLbopQp8djt+KGjzWplJNcGS67ZRKKqlsZe7QBqik9qytd521/rdPByYWhPBykdAw/zk
         aSyGF+e/cs1SwJyoiVvyvqGDFosjdviNEAMCZptWOQgZX5btK9QZCkaNlkY7FVr5lsqe
         wfan4DeZVlZXXYmaqV03JQxdqFMXZQM30fiwZudkVQbcTIyHBg3OHrzs20+oEZIS85XT
         /zzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791892856; x=1792497656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTh6w3t1LI7cFHlFOA6EXonuQhJfRF96d/zfPpAsgQU=;
        b=ff0WNXEpLUUdbEw2A+H6oD/iacV7IFB37i8BAUez0ZKelpi7n1JpuRMJEKN5epdppR
         tzfYXzlfzQAdJQAYl6QGlJTrEVrJKuGzrslsyexkzJbqojp7GMvYU18X7oihEQ5FUq1e
         30bytxjL9JIpNfaSEQbciHtG4eS+Dp+jVDG+hbkNKYTJfaoJvyvkdm5sutJ4qmrIja6D
         3/9RzACw/FFp5IvYvWsCmjJdn9oDIDXINLXXO9/flHQqsgjisihy3biFUi/dWd98Vx2O
         ZoxGa2/WRZ1PhWcWSfxbOY0uMDDMiUfqs2rqcrUsMXVhA8QYV2ObSvnJH4Es1K0LcUbx
         IgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892856; x=1792497656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTh6w3t1LI7cFHlFOA6EXonuQhJfRF96d/zfPpAsgQU=;
        b=drkgP4EzFJ7zxAoBujADfy8uFvFhd8fIehOOncBGal8qEnujZuYWOm6xGEuiRE2p+x
         ZD/5NOdxKrQM51V5o1YESUTE8/ni/qJvlQn6rsVKOJ62CemBVsrgZNrwAaakTqxTfgtC
         EPei4ccm3E88nok8ofKf0A1jF6xuOIDzo7MGPoCwU8sVrVY1gUBZXay1HG/172WcJYSx
         i70XuqQRIUG24JF0TTIzSkq9aAlHiS1xCAZijY37Cm77mV9Wh+tiunn+kyqwvmHR6Fux
         mZr1+vz83JTV3idmNdYmKxAUShR9gaLPpIEMXMdWglGqO2koazW3/+zeJXFPLYKG4dcX
         0/8w==
X-Forwarded-Encrypted: i=1; AKwUvByE8gyj4kavReRU/OQUZL9Jq+tw6Mad8wvI32NQcxZxWtpWM3qLNrZKrb2S7D0cfet4yyR8R38lZb5XNq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRwRascBnhasBrdJoTKe/+G1PtqvVm6/b2OmT5AVVTB1hyMtjW
	+Hc1GSzGS/4pOCxMIqK33TxbRlPgQv0u9he2pJguOTguQwn4hu3Ja6ddq6Irnzl6mvyysMCTTo+
	3ye7i8DFg3YUcRi/e19ADHlbLPrSXk6gWMP44QoOU9PmZFkbJFFJrHX93Y3cBAAhM7uWzhk4KEX
	CexrU/hzwpTxr/+1NGVcLuylf1WEC/HqJCPcgkI7jq
X-Gm-Gg: AYBFou0ojMSXpLlqiKZbVDOn7CZiPxkHWAZJLiujZ3YW3iuJnirPPlVoLDysV4i59NZ
	AFoScf1b8T+ypeEeY+1RSr27wTyyxmo01lqeyqN2xBWY2da5IHTVtuql7YSvkJrdO0sttWGrjID
	wjBgUID7Br+IsFuMeHJaXLHcDFmUwEiprls0w8SY7IBOlGZJ3nOB6Wkw==
X-Received: by 2002:a05:690e:13cb:b0:677:d4b0:47fd with SMTP id 956f58d0204a3-67936270e69mr5009422d50.23.1791892855798;
        Tue, 13 Oct 2026 05:00:55 -0700 (PDT)
X-Received: by 2002:a05:690e:13cb:b0:677:d4b0:47fd with SMTP id
 956f58d0204a3-67936270e69mr5009396d50.23.1791892855071; Tue, 13 Oct 2026
 05:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-visibility-unification-v2-0-3ce8d458bddf@redhat.com>
In-Reply-To: <20261013-visibility-unification-v2-0-3ce8d458bddf@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 13 Oct 2026 14:00:44 +0200
X-Gm-Features: AclHuK_UoITZRIQAG7eVGfp71MDQ0WSmjY7r-ItFN0NvYj_P9B_KTR-tMkVwVj0
Message-ID: <CADSE00JuXFx3vBiUty1A69K8ONuL2DMjCREGmDsW4MxobemVtA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/amd/display: use kunit/visibility.h for test helpers
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 1:58=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> amdgpu_dm grew its own STATIC_IFN_KUNIT / EXPORT_IF_KUNIT /
> INLINE_IFN_KUNIT macros instead of using kunit/visibility.h. This
> series switches the KUnit helpers over to the common API.
>
> VISIBLE_IF_KUNIT is gated on CONFIG_KUNIT rather than
> CONFIG_DRM_AMD_DC_KUNIT_TEST, so the helpers are non-static whenever
> KUnit is enabled. EXPORT_SYMBOL_IF_KUNIT places the symbols in the
> EXPORTED_FOR_KUNIT_TESTING namespace; the AMD DC test files import
> that namespace with MODULE_IMPORT_NS().
>
> INLINE_IFN_KUNIT is dropped rather than generalized. It was only used
> on amdgpu_dm_fixpt_from_s3132(), inverted the original static inline,
> and is unnecessary for tests in another translation unit.
>
> Previous version failed with specific configuration combination
> (KUNIT=3Dy, DRM_AMD_DC_KUNIT_TEST=3Dn). Fixed by changing header
> declaration guards from CONFIG_DRM_AMD_DC_KUNIT_TEST to
> CONFIG_KUNIT to match VISIBLE_IF_KUNIT.
>
> Tested with:
>     # Full test run (KUNIT=3Dy, DRM_AMD_DC_KUNIT_TEST=3Dy):
>     ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
>       --kunitconfig=3Ddrivers/gpu/drm/amd/display/amdgpu_dm/tests \
>       --kconfig_add CONFIG_GCOV=3Dn
>
>     # Build-only, tests disabled (KUNIT=3Dy, DRM_AMD_DC_KUNIT_TEST=3Dn):
>     ./tools/testing/kunit/kunit.py build --arch=3Dx86_64 \
>       --kconfig_add CONFIG_KUNIT=3Dy \
>       --kconfig_add CONFIG_PCI=3Dy \
>       --kconfig_add CONFIG_DRM=3Dy \
>       --kconfig_add CONFIG_DRM_AMDGPU=3Dy \
>       --kconfig_add CONFIG_DRM_AMD_DC=3Dy \
>       --kconfig_add CONFIG_WERROR=3Dy
>
> (CONFIG_GCOV omitted; it is not available on x86_64.)
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>

I have accidentally dropped all Acked-by trailers from Maxime from the
previous version :(

>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
> Changes in v2:
> - Fix build when CONFIG_KUNIT=3Dy and CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn
> - Fix two missed EXPORT_IF_KUNIT in amdgpu_dm_irq.c
> - Rebased to v7.3-rc7
> - Link to v1: https://lore.kernel.org/r/20260907-visibility-unification-v=
1-0-6a962e5b3351@redhat.com
>
> ---
> Albert Esteve (3):
>       drm/amd/display: replace STATIC_IFN_KUNIT with VISIBLE_IF_KUNIT
>       drm/amd/display: replace EXPORT_IF_KUNIT with EXPORT_SYMBOL_IF_KUNI=
T
>       drm/amd/display: drop INLINE_IFN_KUNIT
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  79 ++++-----
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_audio.c    |  26 +--
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_audio.h    |   2 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  74 ++++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_backlight.h    |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 133 +++++++--------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.h    |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  12 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h  |   2 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 190 ++++++++++-----=
------
>  .../amd/display/amdgpu_dm/amdgpu_dm_connector.h    |   2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  38 ++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  52 +++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c   |  10 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.h   |   4 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c |  30 ++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.h |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c |  10 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 105 ++++++------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 140 +++++++--------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.h  |   4 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 150 ++++++++-------=
-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h  |   2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_ism.c  |  40 ++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_ism.h  |   2 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  60 +++----
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 104 +++++------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   | 116 ++++++-------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.h   |   2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  22 +--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |   2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   |   4 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   9 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |  10 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  18 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.h   |   2 +-
>  .../display/amdgpu_dm/tests/amdgpu_dm_audio_test.c |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_color_test.c |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_colorop_test.c       |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c   |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c  |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_cursor_test.c        |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_dmub_test.c  |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c      |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c  |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_irq_test.c   |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_ism_test.c   |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_kunit_helpers.c      |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c     |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_plane_test.c |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_pp_smu_test.c        |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_psr_test.c   |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_quirks_test.c        |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_replay_test.c        |   1 +
>  .../amdgpu_dm/tests/amdgpu_dm_services_test.c      |   1 +
>  .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   1 +
>  .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   1 +
>  drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   6 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  13 +-
>  tools/lib/python/kdoc/xforms_lists.py              |   3 +-
>  70 files changed, 771 insertions(+), 751 deletions(-)
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> change-id: 20260907-visibility-unification-fd358c580447
>
> Best regards,
> --
> Albert Esteve <aesteve@redhat.com>
>

