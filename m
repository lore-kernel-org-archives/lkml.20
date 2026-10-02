Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66230496D3B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948090; cv=pass; b=IPs9HkyR0sfUOj6rEN1Ye77V/a60DTMXwZuDthlqgh+UqSFhQLmpllYsBVv+ZhtjcOhMA3V1f5827S228XGYLvz9pcpkre51WR+IEXvd8EzSZN/mqjYEKte1lmI0ewTKF1/adoDGnfpCvAvLMNAIVs1w9tuNkXNRfQtDifSxmfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948090; c=relaxed/simple;
	bh=ptuql8EP/xwC8/m6AyGXvhJvfVbV+wQgTXqkQooIt/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayMaE+JU7hmM6mCl5IzG2cKx0scw1sNfUkDnF3uzpIt01sHlEXj9rWJKizU/bin5LTUyH5Mk93HVWZshIEYKC1gBb7H1jfbZhvnT3mF+DPFuAmA0PY2sDQbjh8+S617nzz1NckqP9mj6Hd20UXGjfjodiFRV/TY2x+0Lg8OMwbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcQ5Adeg; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcQ5Adeg"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148bc4a87eeso233368c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790948086; cv=none;
        d=google.com; s=arc-20260327;
        b=kys60i67iwJUqleWgpAWN6mZCsFZ4nLJ7CI5Mif97qWmsUhsAjMfAKBRrnuU7K6OJk
         1s8EQoMY06ZDiJp6y+rb78IA4gP48VzMzbjLmHkOzZC/diz93IDs6mSX06O7v/ZUVzlV
         1J5fdhvVqV1mJrU2Ek10pU0O1bCn03gfi8Vuz5MLaSqCTEJVsPK9seQgzujNldApSDGU
         +ZqMgwf0qkzrXmRcKLGuJAGbGoTBSbOYIGWlTE/CldsqtF12yZxMQrUuWRDmlUTPyDWu
         hT9pvFwNX6X+USvdIibKD9oG/yvnjGHvMAazQ+fIpCyE7TCzmBcKUAAEA6ps6uldXquL
         OMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yx6G1AW+nvvITgzsA9b25EAkpoWe5JEuWuaZEwVI7YQ=;
        fh=+avS5FrDOS07L3WhpdBDYpiOfjxnq/I54IM+8UFPZbs=;
        b=bGPasTaI7l87KjCQkCnRpYmudcP76B9lOOj8tkF082hj4egZd8ojiAtTKarlvgLIVX
         U/DTl8T5w/LY21FB4q/o3zPknxMKhacOWHM4SXxaPONhl+0n86QZa3vmRmEx3I0VQhlP
         gufq9YIv0XcWdHPfOiTH1VJqh5BHCOPPAfns7vXyOiJr59DSeTiTl765zKtokfle7N5V
         1XeKdczLxtkSTDm1U8DoiEx9nO9pbU+6SJ5n78BrFClanmaOpYBe2UgvW/sudK6FZDx4
         7YhmFlR6oCbPEbqXozKwS6Fes8/Jc8uRtXEAaO5ua0S+30zTFR7eOFD7Vtw1HlMdHmg/
         VSVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790948086; x=1791552886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yx6G1AW+nvvITgzsA9b25EAkpoWe5JEuWuaZEwVI7YQ=;
        b=lcQ5AdegZSWHxI/3afoIRtWBelesyOuzbm/AjZlE3M+ToEsQ8o/cQ6juqrhiwuG+Ya
         zVxqavVOuavXKoq5zvNZ82FaE9LqPMTCLCvZAWeOT71s/u3qKiuz2PYpj36mgXsXITHo
         utuoP45iTXIeMDub1kcnYkk0KcloDDzdyTPROUDwpGkl86b66BAL6obIubtgCEswDEbe
         JlyxL8DnFVo54b7LHNWZ7DTjG/9ru43zdYuBFLq7EAzcrWFk2eRi4wx+L5lbcEf6qKri
         PNY6SHXHSc2D9qAFIaFJCUo3VSbwqBSbiHYFizpV8HjCbh6QEQoY+dPIUOpcSxXSRyOC
         r2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948086; x=1791552886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx6G1AW+nvvITgzsA9b25EAkpoWe5JEuWuaZEwVI7YQ=;
        b=qMIh6hahEN9VA/RsO3ueYcDuF0/KkDNCqg6N7EM+OMmZM4DYN6ZaaI8831VcA8vmod
         B6IuuCDE6ofnNm6oFy0STyZyKd/q9kP4mnB7A6ZT/VsDUKeY44AHEt78qZ8hfNfT/aoc
         FAb/AQkflX6/pGX9fgkQmMCpe+okk0uM7cR9KhngqXsDTFLyoszKa4DzzuNoIMydATNS
         Ib6J8sjSr1YmPLV64c53LWA3DeWkJbTIkk/LhcIDipKT8KbM/BwC5AaHSqJMx/V17A7f
         6Rm3Q24HT15z2aQv7oEKuhRhb0quYXVsG/kyhj/oa5v21r8sio8l0sSI2t8EJ1XFxPlW
         afLg==
X-Forwarded-Encrypted: i=1; AKwUvByNhupTX7TLCnd5hQ4OrgS55cV58liJFT/dx/fzOA17fT1aFoAFxr5MTa8rK/Qje9mH3U2NDpbz1ksABW0=@vger.kernel.org
X-Gm-Message-State: AFuF++lSvN6+OyRv0XnfzqeZb1vg/sCspCE3iiTiTfosFWYbltIGxzFX
	tRu3GOQn9GY6BVXtvFt6LtirZogS5Yx8NwqB9rg3XJwJM+h0U3B3yE5gItDkC8+qrzdJZlSSOCV
	YNXvnUBLdUC9WttanT8OK/6fjXWgDxUStFMkm
X-Gm-Gg: AYBFou094tzMmQOCqldyzfxcnWRe0RoEaLjTKhRlsjzAeq4NPqkOwSOF5AAfRu0l+rV
	uDV1UCfpYzkBW4yp7WHvy+Lb3DynKKqRzPt9hF99xqpFUBlZIH4J4CmHlwCLLdlJSy8wBx+FeSd
	3guYX/13RT/ancrVfNjCGY/LTjwOejSdaE8WroZWz/YFgmmI8PZgVW98WSbpI6FD0kD2BvDMrHx
	HxgrxjdW1Qy8PfebZOCqU3M7U5E4H6Cp0Xtrie0/H0mbAEC6fZ6LI/OJ4eomg+OYHPg8U4hibuB
	7ITcnl0fJT88kJtxNp0Mu1Lev3Y3h+lS96aNgnKp/tg3bWvN4E8yd3GNoONs60FV/Co4FJviJCZ
	bhpwaj44/8BaMXquZntRJB4ff3pnTlEVDzpTQc1uD2yRsFayKPnus
X-Received: by 2002:a05:701b:424d:20b0:146:ffa9:2117 with SMTP id
 a92af1059eb24-14f5aa4188fmr4688728c88.1.1790948085630; Fri, 02 Oct 2026
 06:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
In-Reply-To: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Oct 2026 09:34:33 -0400
X-Gm-Features: AclHuK_TcjLVEROGMJB5lyBOvzPZSfQv2eIf90DD5P5QCDVjEATvEIscfiIQFpg
Message-ID: <CADnq5_MZZje5XGfYgJ1v4Ts_k+ZyyBtSrSqB5upTEt+AqBi9Yg@mail.gmail.com>
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

On Mon, Sep 7, 2026 at 9:45=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:
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
> Tested with:
>   ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
>     --kunitconfig=3Ddrivers/gpu/drm/amd/display/amdgpu_dm/tests
>
> (CONFIG_GCOV omitted; it is not available on x86_64.)
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

I've reverted this series.  It breaks the build when CONFIG_KUNIT=3Dy and
CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn. When CONFIG_KUNIT=3Dy,
the functions are not static, but when CONFIG_DRM_AMD_DC_KUNIT_TEST=3Dn,
they should be, resulting in build errors.

Alex

> ---
> Albert Esteve (3):
>       drm/amd/display: replace STATIC_IFN_KUNIT with VISIBLE_IF_KUNIT
>       drm/amd/display: replace EXPORT_IF_KUNIT with EXPORT_SYMBOL_IF_KUNI=
T
>       drm/amd/display: drop INLINE_IFN_KUNIT
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  79 ++++-----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_audio.c    |  26 +--
>  .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |  74 ++++----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    | 133 +++++++--------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |  12 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 190 ++++++++++-----=
------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  38 ++---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  52 +++---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_cursor.c   |  10 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c |  30 ++--
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_freesync.c |  10 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 105 ++++++------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 140 +++++++--------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 146 ++++++++-------=
-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_ism.c  |  40 ++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  60 +++----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 104 +++++------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   | 116 ++++++-------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  22 +--
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_quirks.c   |   4 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |   9 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_services.c |  10 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  18 +-
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
>  51 files changed, 748 insertions(+), 728 deletions(-)
> ---
> base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> change-id: 20260907-visibility-unification-fd358c580447
>
> Best regards,
> --
> Albert Esteve <aesteve@redhat.com>
>
