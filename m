Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320E1DF261
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948934; cv=pass; b=ggKWwlu3la2IuW0Tzs1NMkiIghRx6Rm2JsmqO1DBkto/RwUzb2vJ1ONLpXsYNTvaq33Ihw8uQOFWFF/EuDwSArTxmXDzeOW16KgR+jD9EoE6hDSb6e4kBzHelDMSmo9h7jJAfED0XaGiQSDak/gXFYOvUHrrEudIMYg8dLQl+XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948934; c=relaxed/simple;
	bh=BHyLO35Wvhtr+fFgyTIl6B//zGulC8gMPyhU4qmkt4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieugr47TyKPGPzePXJze/+8H+O3A5PL7+ul6edypdyQ4HVRBQhhXVN2yEaesNRgMFJdILUaiNjIuvKKjTJEsEeRUDSTSwmENPVxkuH6crSwu8I4MuhyidEKUdn0tI5mxQWqe6PVylBcRaWx5cgGZQfudq9jMUXaFS6O7sdHWg6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqYNLp2R; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqYNLp2R"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso1142380eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790948932; cv=none;
        d=google.com; s=arc-20260327;
        b=s1M3ecQAU0P3Tg49PMgSB+hyiFrhK21XWZlJQERCpfZLp3fRsI3MNbPn6mo80OTyOz
         GPdywrfRmfI1FDmhrWmcuEZbIvztAJtd4Vrx+JHoifW+Z7F+tKJBXzJbHfyF6Oo8X5bi
         RsCzKa0j8ug5a4toBeTU1OU6tsZ2Wgpa4eU3sDDcC87Iw7rRA4a9CneJXVKHBgGiGEw7
         GVvK8xeYDogjZhcmlhKHL6CWw5gDU6QeaxqkHW0FpFp3MqoEDzl6NBSDRiu7EWNjpmvF
         LodqOQ85T5ExqKMPVR9LDeZxhMGfgnRNdifS/uxekvqDmYxn922d9bj7Z7ld+LtJQ+LB
         t8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2DKjRlAzAFGq6y1KL+4ocbnmqLb/iUOft+MhA4fQgo=;
        fh=6cnq7R2HcalIx22owv6/2SAQQTvTRTMRDf/OOZv2GLk=;
        b=OmttO/9I1EoM1Aec71gPG0x5XDxYxQCix32eb4R/Dr7KIJ6JrBFZ2OH6Ww5625xn1/
         iJhhhh6lniWCnmBFDS67L8Ek3W0eYMMikLxCJNVQm6xtH/X/tsi793cvL1OgZwR5yY8z
         iUodas8n+Bp3Pm52mJtC7AxhSqBQBlLkePjvg6YJRvS74r7xLd2vydjQlnGSY9ZvYJrP
         Z8Ng+3T6DKezR/u7dGloAZk7qz/hbjMn2j/1hieWr1CNqw+g3TYrVjgDLJeJ58sQfLrW
         e1UMVXXniCRzyLjenVyVWdjlTuIjTStN+RGbbRhQbV1mAv3g9/nqYoloPCKZw2n5q7en
         agQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790948932; x=1791553732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2DKjRlAzAFGq6y1KL+4ocbnmqLb/iUOft+MhA4fQgo=;
        b=GqYNLp2RKWTo0cWl9l9Fn5M6H8XioY0LRrAsWE5rysFZp4UN/l3tTUdN35+nnOrCtg
         LQ/ENq6t4QpvnoHLTSlGT+iMV1s9SHIOEbglT2+3wGGNi5M8lg6vBSP9rEaEWjevfeaX
         4cm9chhnc0dmYH8/Ifl4ALDYIlDUneSFzEppjl9ow1QDMsbLbbpfk2oSAGKm/ap1LOUP
         Jc4LiLqr2pf8v5Y41QSFdw64YMrfyLbnL3kBSNwef/kSAojE5xduBV6JbRl+kJq1KjD/
         tJc44+GJ1oG2xNS8oFGRNs0hqCTTaEWnmQPUFIapKl3iYVpmNryLSaoTmvvbNo4QUGh8
         pgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948932; x=1791553732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2DKjRlAzAFGq6y1KL+4ocbnmqLb/iUOft+MhA4fQgo=;
        b=bdSi6HjmGEt0lSJM1IIkP5c/tdQZDroTSCKVin2WkbPRwVy/26dQ/y0GqXZcMmGpVX
         nnCXbBSzrgRNPClzGPfoOuOUNjJa30UMigyr0sHbgQGlsBFCO5mjyUOdkzdlcmtl78FU
         qq66JEz0uU5XolHIPr7DE2xs5wVhcA7PZFoVrZH36Cd0+8jg+rzL5ApuaKHrsIyzp+Sx
         COkE4rv2IGjMi0+kctcqiIyzz2snYXFAj988sLMQU/R/ttpneVi/6RkBjh9Z8FzhPa5A
         anrUBM6rg2iMUPM3h5XyD+zfqNVhCIPkwJAtomvZ/lt+93prK170aKtyT80doJ7pGrG9
         Xopw==
X-Forwarded-Encrypted: i=1; AKwUvBxesoLItvwPdwLtwauWgDDZULKLS3vpO0jk2KYtchxKgynqBYCo29LvCHdI0edbCsOwkxQALAn1h6ByONU=@vger.kernel.org
X-Gm-Message-State: AFuF++nxsmwmwaoXL1pTka1kja++jgqLr8yL0AKxNEi3u/tHoyx0y/Gu
	SLllAq0XkfhiuQER9mXClfNjK76rR7lg5n5tgINmoyY8lhBoLUHobHfOGNI9KSQGP0WLc+u1cWP
	Np9dUJ8cb+ZGDe1D770dPV/gdIOZO5vU=
X-Gm-Gg: AYBFou0YQakfmhJVPI2lnZn3HNzVUCEN1vAjKQpPN6O5T7qFA9/r54QE+Yo4+2ia3eH
	fDgTDaGnVok7uyYX4FQWgNPMJ8M2BVbfQ1TG70SVpAacp72JdHWX7uO+3+XSnIfBjEdNXrBBYOP
	i6j1PcmvPb48uW8Fy6zV2jR7mGa1aS3WXInalj+TwX+1vJ2RFlIjejhCGuTRP6HuOLS1WXTjgpY
	qP7NpYpv09kZHb6Rxbpa/PJORxuYCIbDaI8a+1Ir7Ve8jdBK3nf8WXKVni7BgAHgBYLKIxE1k/p
	1t9tFDBD8b++m2oorZxK2vWfov2vxWffVkA8VirGOPsqL7Y/4NixlEpGj5VB6p/sJCSVu/TTL8p
	MvlEKZ+271IGxEA3uwtDX/BNX5ACkHxLxIz4YGjoS0AIYjX99FwNZXLVHy9Mx4+E=
X-Received: by 2002:a05:701b:4550:10b0:143:8212:a43 with SMTP id
 a92af1059eb24-14f5a93aa43mr4045234c88.1.1790948931622; Fri, 02 Oct 2026
 06:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
 <CADnq5_MZZje5XGfYgJ1v4Ts_k+ZyyBtSrSqB5upTEt+AqBi9Yg@mail.gmail.com> <CADSE00L=KGCXqpjm3aiOQ-JwzirXTrvVsd-mNXpb9QDggVs=pw@mail.gmail.com>
In-Reply-To: <CADSE00L=KGCXqpjm3aiOQ-JwzirXTrvVsd-mNXpb9QDggVs=pw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Oct 2026 09:48:39 -0400
X-Gm-Features: AclHuK9HlnwREQSprOE2OEafwiRXDdiofJf8sSV8e9OU00tSYzj35_B2cG2A_YM
Message-ID: <CADnq5_PEun0nB3in17GyBSy2qSF_fWf=40-m2csv=9f1rmr5XA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amd/display: use kunit/visibility.h for test helpers
To: Albert Esteve <aesteve@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 9:46=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:
>
> On Fri, Oct 2, 2026 at 3:34=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
> >
> > On Mon, Sep 7, 2026 at 9:45=E2=80=AFAM Albert Esteve <aesteve@redhat.co=
m> wrote:
> > >
> > > amdgpu_dm grew its own STATIC_IFN_KUNIT / EXPORT_IF_KUNIT /
> > > INLINE_IFN_KUNIT macros instead of using kunit/visibility.h. This
> > > series switches the KUnit helpers over to the common API.
> > >
> > > VISIBLE_IF_KUNIT is gated on CONFIG_KUNIT rather than
> > > CONFIG_DRM_AMD_DC_KUNIT_TEST, so the helpers are non-static whenever
> > > KUnit is enabled. EXPORT_SYMBOL_IF_KUNIT places the symbols in the
> > > EXPORTED_FOR_KUNIT_TESTING namespace; the AMD DC test files import
> > > that namespace with MODULE_IMPORT_NS().
> > >
> > > INLINE_IFN_KUNIT is dropped rather than generalized. It was only used
> > > on amdgpu_dm_fixpt_from_s3132(), inverted the original static inline,
> > > and is unnecessary for tests in another translation unit.
> > >
> > > Tested with:
> > >   ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
> > >     --kunitconfig=3Ddrivers/gpu/drm/amd/display/amdgpu_dm/tests
> > >
> > > (CONFIG_GCOV omitted; it is not available on x86_64.)
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > >
> > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> >
> > I've reverted this series.  It breaks the build when CONFIG_KUNIT=3Dy a=
nd
> > CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn. When CONFIG_KUNIT=3Dy,
> > the functions are not static, but when CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn=
,
> > they should be, resulting in build errors.
>
> Oops! I'm very sorry. What's the procedure now? I see you posted a
> series containing the revert. Can I send another version of this
> series after that lands to fix it?

Yes, that would be fine.

Alex

>
> BR,
> Albert.
>
> >
> > Alex
> >
> > > ---
> > > Albert Esteve (3):
> > >       drm/amd/display: replace STATIC_IFN_KUNIT with VISIBLE_IF_KUNIT
> > >       drm/amd/display: replace EXPORT_IF_KUNIT with EXPORT_SYMBOL_IF_=
KUNIT
> > >       drm/amd/display: drop INLINE_IFN_KUNIT
> > >
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  79 ++++-----
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_audio.c    |  26 +--
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  74 ++++----
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 133 +++++++----=
----
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  12 +-
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 190 ++++++++++-=
----------
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  38 ++---
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  52 +++---
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c   |  10 +-
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c |  30 ++--
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c |  10 +-
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 105 ++++++-----=
-
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 140 +++++++----=
----
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 146 ++++++++---=
-----
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_ism.c  |  40 ++---
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  60 +++----
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 104 +++++------
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   | 116 ++++++-----=
--
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  22 +--
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   |   4 +-
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   9 +-
> > >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |  10 +-
> > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  18 +-
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_audio_test.c |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_color_test.c |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_colorop_test.c       |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c   |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c  |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_cursor_test.c        |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_dmub_test.c  |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c      |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c  |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_irq_test.c   |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_ism_test.c   |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_kunit_helpers.c      |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c     |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_plane_test.c |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_pp_smu_test.c        |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_psr_test.c   |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_quirks_test.c        |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_replay_test.c        |   1 +
> > >  .../amdgpu_dm/tests/amdgpu_dm_services_test.c      |   1 +
> > >  .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   1 +
> > >  .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   1 +
> > >  drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   6 +-
> > >  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
> > >  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  13 +-
> > >  tools/lib/python/kdoc/xforms_lists.py              |   3 +-
> > >  51 files changed, 748 insertions(+), 728 deletions(-)
> > > ---
> > > base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> > > change-id: 20260907-visibility-unification-fd358c580447
> > >
> > > Best regards,
> > > --
> > > Albert Esteve <aesteve@redhat.com>
> > >
> >
>
