Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A9B36729D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948813; cv=pass; b=NiHF0C1ZwBLYURlr7aXe8eXw/k5P8Xq7VYF78iSs3vZrswQnXYzKpLUPKQziBJzQgHKBg3TjuA+q9FHsLjguxHUcQUTXlzVHZijl9KSK5KZ1Jpz+SSbMgffRn/dO/7L/J3Vtosvw7uXFHAzHS8s0nORNDQC/9VQQwK3MnvbFjCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948813; c=relaxed/simple;
	bh=T1OfMuxccvCVLUQ4ooAuxw1CLcnmWDp/3LEIapIUnyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QB/ZwgqUcB7d1+M5kVsWfiKNHjnKCmysj2xmu+/ulecEkXYm/q42UwhYuuSZW6oPRR5gj0tS9iDq06x9cTAkA6LW7khkCDWfssRq0VqG4HTjs7nJm6wVh4VmRDwvChu4SMzJe2uQfbcwZgbsMuosBsRUqKcWZIEMvOKoCGhEHRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O79BuVsa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UWadtrqV; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O79BuVsa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UWadtrqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790948808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6dEanQnOyXhk+suk32DBilMCW9SZjDiEbY5jKTMsnxY=;
	b=O79BuVsar85MbGK16Ee4gh//sV1xBNXtYiOY7xmYdqWYZXHiJlgtl2N7icv+M59MYFQyzc
	hjRxAIZ5iR6GSz9l2UzCCVWZFn/M8c4Z37Vguf0hX1g1Za3+RgJJ6p1waw59RYMcu2MTgC
	NZHxAnqFH7vubSg48mPGQV8FeVadNQU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-4ASAmfUdMNaW6EzKmCVgFg-1; Fri, 02 Oct 2026 09:46:47 -0400
X-MC-Unique: 4ASAmfUdMNaW6EzKmCVgFg-1
X-Mimecast-MFC-AGG-ID: 4ASAmfUdMNaW6EzKmCVgFg_1790948807
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8ab43f7f5faso70911447b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790948807; cv=none;
        d=google.com; s=arc-20260327;
        b=mm2AOpMyv5OKIXiR3y4WgkokBxyPL9va3qFqGNWO6b8pNGknTp2ZSQLh927lsoZIce
         nYkdONYHG3Hs4EKtmzdMyJPuCcFRtbqVDnlPUkBpoXs7enh7jXQRj1Q7OHXoJbDQ0v7t
         cu2Bul1a2SG7gPqjEUKs1pnJe/0BFN0/hQ6ZfiLiuGhvIChsm4b5SLrqTygHf6ysd4V2
         G8Bbw3I1fFuZvIyLdcrZIZ/8AFMY30Ry7nI6FtHcGCrHg7Wk+oSOJtcE3ed0NPq0DVip
         CZj5PafOxHonw7Y6JYJhCyeh7hZcR4VdwDYxdN4ajDEaWF0pWt+AzGtb/yASgvDoWO8E
         06pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dEanQnOyXhk+suk32DBilMCW9SZjDiEbY5jKTMsnxY=;
        fh=YIuuFLGiBOrPL4r3cE8aJLuuYg2mUBqrKgg8SneVDlM=;
        b=INbOolV2YO2gaoJWs6HWHcW0BJhdqvuQE03rNggJ21ly3gGsvQsYIEnhqCskqW9PHB
         qpDBzjnCgpuNqlXBjWdu2YrRrr+Mv5CODAduC1aKhHQEiiaGApMl37ZHAAmjlaMTjTYb
         g4cBq3pk0FAtGSJGGmnlNF0bcYqn+BxZY3KxuxSC5CEaZUxHaFukgG9Aoq5PX2uFzGhr
         wWd7wG8OJB0uooqeON8LVw2JmGpZfClUOQusj/1+/HBibY0yAHsg5fY3ZZBi391RQ/2W
         IlNLPBSub5tT77aJ5MW7rbr89iFqgkr1RSqisoznoUnJ13Hq4aNMcmmW4YTCnx0LjHbI
         Or9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790948807; x=1791553607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dEanQnOyXhk+suk32DBilMCW9SZjDiEbY5jKTMsnxY=;
        b=UWadtrqVT++t78Sv1hGNoBOOIr4BNlDXfCeVezqWec54LsOUnUAy/eqbwWNYtuZcwK
         rpcmNWeO0eMdOdimRgZHHdLcHUXdX1EL/bUOKpTxrFSb41IFJ0ND1uFXmqoBuxFMytoZ
         uyrnen8x1vdxIRCwm+PdbqHUoWZNoeDkxV70Fy6i03HYkSqfZZaet8oO/Pl0X9Dk4djI
         /xPBif3H/cdyFBSgclpuEkhFy80H9MCoyN8oEhrDLLrVnRJusi2vh9WhzwQMUwwn2+UK
         ZOix6SxBSfU0/UmIsPi6SuW0trWIvIucVKxaZXHjWANZcRyi6d2/5jU2+YaOeOKCpCEr
         +NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948807; x=1791553607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dEanQnOyXhk+suk32DBilMCW9SZjDiEbY5jKTMsnxY=;
        b=aylMLJLe/h8EYTqmwRGI4mGiSXDgMkxYqKVJjt3RmK0xFcV5bTheCvBMJJzPrgaRSB
         W5fkEgXfYcqc5H6LyTwMCQnyFeT6ROerBlwRN2Uuv1RxPgXOt0DCEs047D0E5I+5tpYL
         Sqf7fMv/QSukHR7n6XLfearVSgD19kq0hNXECgA+fkyqJCYuuHkUG86Hx2aPt9hMoE41
         cyokBEm2gLaVOekE+S1Y3HShPj7bfec04HmWIuBP3nO7MqG6GYLmZQWN+clIOaibhBCn
         1HiKDVLA2do2SjtApJTzNyf+NoowOlZbshm+QKDAmfzDM44/yklptImPEhM3QN8EcSFf
         oCoA==
X-Forwarded-Encrypted: i=1; AKwUvBwDGd7P7CdVQNNPPOMWapc9GOrTsoeLKWCk0vBE/5UHtEb98k4ucCxL/r+cKUvCfbWMVljTzJSqkEdX8ow=@vger.kernel.org
X-Gm-Message-State: AFq9FYII4C1/qJnDR4/3YLniA4kLL0YW/V1S4Y6gG0w6euPsNC59JZ8u
	pR9TZckGhceGUSQlZT+84OShTpt275QpkrO1HqvoJZn1SgXovk1oXXwl+kSa2j5fofC9Jllu3BN
	bt00hkkktB4Bz8o74rzFQxjmuLfTc0GZQHoy19U4nsziY8H2hQGuXp67YimMAjiBR8hnuNx/75R
	poY6vA/YbjnQE1E+lFLbtIWLx/uXSDvHuwgYOyN2Yd
X-Gm-Gg: AYBFou2pfgoDynO/UghpvX4EscD+nAajorSK5pxrt//bPKQTow8EJMRHtWFwVcnD3f1
	ocxqw+v/7H1EUI7M/7XACRLYRbCiDdPgxKjK7OAvdHaK5uG1Yt7yRyOajWdMGSwjOOuJLAl/mao
	rf/JpYIJJ4Wk6YWbwu0VBwu9qx+ssxIdSir5tYZa7s6rmdRuJC21RI/g==
X-Received: by 2002:a05:690e:168c:b0:677:ad61:2984 with SMTP id 956f58d0204a3-677ad61357bmr927185d50.40.1790948806609;
        Fri, 02 Oct 2026 06:46:46 -0700 (PDT)
X-Received: by 2002:a05:690e:168c:b0:677:ad61:2984 with SMTP id
 956f58d0204a3-677ad61357bmr927146d50.40.1790948806082; Fri, 02 Oct 2026
 06:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com> <CADnq5_MZZje5XGfYgJ1v4Ts_k+ZyyBtSrSqB5upTEt+AqBi9Yg@mail.gmail.com>
In-Reply-To: <CADnq5_MZZje5XGfYgJ1v4Ts_k+ZyyBtSrSqB5upTEt+AqBi9Yg@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 2 Oct 2026 15:46:33 +0200
X-Gm-Features: AclHuK9i1DaMDvJYQE2Z1NJPuLF2VanTJNwwCXcvdTlybffYDnKmDymLXiGYtmw
Message-ID: <CADSE00L=KGCXqpjm3aiOQ-JwzirXTrvVsd-mNXpb9QDggVs=pw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amd/display: use kunit/visibility.h for test helpers
To: Alex Deucher <alexdeucher@gmail.com>
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

On Fri, Oct 2, 2026 at 3:34=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> On Mon, Sep 7, 2026 at 9:45=E2=80=AFAM Albert Esteve <aesteve@redhat.com>=
 wrote:
> >
> > amdgpu_dm grew its own STATIC_IFN_KUNIT / EXPORT_IF_KUNIT /
> > INLINE_IFN_KUNIT macros instead of using kunit/visibility.h. This
> > series switches the KUnit helpers over to the common API.
> >
> > VISIBLE_IF_KUNIT is gated on CONFIG_KUNIT rather than
> > CONFIG_DRM_AMD_DC_KUNIT_TEST, so the helpers are non-static whenever
> > KUnit is enabled. EXPORT_SYMBOL_IF_KUNIT places the symbols in the
> > EXPORTED_FOR_KUNIT_TESTING namespace; the AMD DC test files import
> > that namespace with MODULE_IMPORT_NS().
> >
> > INLINE_IFN_KUNIT is dropped rather than generalized. It was only used
> > on amdgpu_dm_fixpt_from_s3132(), inverted the original static inline,
> > and is unnecessary for tests in another translation unit.
> >
> > Tested with:
> >   ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
> >     --kunitconfig=3Ddrivers/gpu/drm/amd/display/amdgpu_dm/tests
> >
> > (CONFIG_GCOV omitted; it is not available on x86_64.)
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> I've reverted this series.  It breaks the build when CONFIG_KUNIT=3Dy and
> CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn. When CONFIG_KUNIT=3Dy,
> the functions are not static, but when CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn,
> they should be, resulting in build errors.

Oops! I'm very sorry. What's the procedure now? I see you posted a
series containing the revert. Can I send another version of this
series after that lands to fix it?

BR,
Albert.

>
> Alex
>
> > ---
> > Albert Esteve (3):
> >       drm/amd/display: replace STATIC_IFN_KUNIT with VISIBLE_IF_KUNIT
> >       drm/amd/display: replace EXPORT_IF_KUNIT with EXPORT_SYMBOL_IF_KU=
NIT
> >       drm/amd/display: drop INLINE_IFN_KUNIT
> >
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  79 ++++-----
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_audio.c    |  26 +--
> >  .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  74 ++++----
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 133 +++++++------=
--
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  12 +-
> >  .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 190 ++++++++++---=
--------
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  38 ++---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  52 +++---
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c   |  10 +-
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c |  30 ++--
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c |  10 +-
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 105 ++++++------
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 140 +++++++------=
--
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 146 ++++++++-----=
---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_ism.c  |  40 ++---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  60 +++----
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 104 +++++------
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   | 116 ++++++-------
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  22 +--
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   |   4 +-
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   9 +-
> >  .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |  10 +-
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  18 +-
> >  .../display/amdgpu_dm/tests/amdgpu_dm_audio_test.c |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_backlight_test.c     |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_color_test.c |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_colorop_test.c       |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c   |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c  |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_cursor_test.c        |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_dmub_test.c  |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_freesync_test.c      |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_hdcp_test.c  |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_irq_test.c   |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_ism_test.c   |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_kunit_helpers.c      |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c     |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_plane_test.c |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_pp_smu_test.c        |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_psr_test.c   |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_quirks_test.c        |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_replay_test.c        |   1 +
> >  .../amdgpu_dm/tests/amdgpu_dm_services_test.c      |   1 +
> >  .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   1 +
> >  .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   1 +
> >  drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   6 +-
> >  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   2 +-
> >  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  13 +-
> >  tools/lib/python/kdoc/xforms_lists.py              |   3 +-
> >  51 files changed, 748 insertions(+), 728 deletions(-)
> > ---
> > base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> > change-id: 20260907-visibility-unification-fd358c580447
> >
> > Best regards,
> > --
> > Albert Esteve <aesteve@redhat.com>
> >
>

