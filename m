Received: from mail-dy2-f23.google.com (mail-dy2-f23.google.com [74.125.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B90F4DF4AD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286769; cv=pass; b=b4x7UVv5xUcw47Kb3rYcB2Ju/eDa3NcXTEzETUAL5+JEL2euXyVKZ2SFH7AfOI+J+vjTK8nP4QGEshunmYUY8S2Jw7sirJ9Yp2X4C6XbuH6WBm09i5i7P0HEg3qR8H94+OGpqaCQRrHplnnSh4Iu4mtv0/4a0Hq3Mfzyy+7sLAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286769; c=relaxed/simple;
	bh=5MoVjcGWD2Gwwyui2ffRscfzcOMfm+L3vnHEanIaSVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyCPn+g40UI8VJIAfN28THIMs9/9Agx1GjvuJsvWq8K4XgOdIzEyiL8Lt2mHNq5sPAt8hUyY/WUO9LWIU8YbnEafLCzHieQNxECHLoFsyZrHMdsMH3FejCadOAboEHOXcdEtzepARkSc4WtbuMaYcK8REo4tUM2qSQbQRf6Jsco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFKUwhip; arc=pass smtp.client-ip=74.125.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFKUwhip"
Received: by mail-dy2-f23.google.com with SMTP id 5a478bee46e88-32be7127c64so19742eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286766; cv=none;
        d=google.com; s=arc-20260327;
        b=CYCvoFDVCCswZSHZFEm6MV832Wl1H2wemBRjy4jOggPDmtx8f49/bmrYht8F90Mgx1
         0FZaoF2nofEXkZNP58bSVRUpzIESnG4jxR/UGnm/v636N+E3m/WgQpHu0QsT3bair5FD
         xuzilA9ZqyObAeBj7LyWGanbOPqn8mui7XcxzOrxkngzgu1jQok2fXyyUv/PsK9JERa2
         JPV5etfRqzHJl+r0WzyR/27dgrt4ar8KNaQVxtvGaKMB93SgT+YzT9/hHAoguuj/vvGY
         HmhSa6Xp3Xgl6WO8QWUwh+939YuFQsrdO/49SE3Qy5UuyuHe3k047sr4zrrsrw0zmt1L
         thSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8lhG9wb5QlfLqgt5UEaJmUthOlH8IOrrPdU2sMoER/4=;
        fh=X63/M6gX05HxCTiRyEz/XbAGoUx98Ba43L8jMQt2/Q8=;
        b=YeNzs5+/9+3dJCMfwNdfINK8uaxZeoJpDWrs5H3AV/Nw1GnX5dhdWzfX2ogrb94HjK
         0pvdlbu+3QC6EtWwrs9ROToDtCGRStljp1hrXtV4NlXkCSSuq+1O7HSq0WLRJS5SlNEX
         q3d+zQZUjDqioRh1J9J6Z+q78UAaKwl4sHITqkcSv/qQwYUttSpk2eHg6aBRg0zSON0T
         EjMnkNEcM0NgpAZQEUBJITwFqKgq41+Ahb0yCatXnnas7AjVOC0bz94KHGvzLryCQU8W
         H1FkGQOrgdQJbSRVNnV1qnt93Nojyv2N4DGzDJI0RAPnt/nRLXMOMrnLGr9KK/3LF+tH
         MTog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286766; x=1790891566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8lhG9wb5QlfLqgt5UEaJmUthOlH8IOrrPdU2sMoER/4=;
        b=LFKUwhipJyreOxxk/CD0TMclYjYziT4QLwTniIW3eSg0IU/NESXTlWMe5DL4D0B/W0
         7jvdRxodO+DOWqVqpiorbQQMGIu7ntprm2iuxF7JFETOMfYz1IyLG4ighkwOG+PGyxPQ
         of/Lyn38eZI5fUBrBTaLEqfnBKGP0q4C2SGqBRz1WbxHWUuwz1ig+NITQ+JHQCqqGD8b
         DQLq1ldE67e3WU5G/U3Gy78lmdwsNB7mE6JhrzgEBOiwFPi5bBBgXCqm/qmTOi/MOaT8
         W6l2kyCeL6aUH3QkhQVhfykh7+E1jH/TXnDjFn2icJ3/o01aqkw2KjKjJKpMhaCDKty7
         QtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286766; x=1790891566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lhG9wb5QlfLqgt5UEaJmUthOlH8IOrrPdU2sMoER/4=;
        b=Ub2hMcT0Cg1T3QrWPHEApmwLafCOHvb8Z8Aziy+qvQEoaq7Sw2p4pfC5BMr80Dw7ru
         JWiVDHYD1DcSFoqaFymICM0Y+fhuQ3CP/jd1bQJ+tFIUg6JCCkB7JtpJkAFBWKLoAXVZ
         ORAuxXgb+XFh09SOcDSFu+c2oCZzUte0gZt/OXy+uZhzEfAuSftVv+cxnr4bpUIFEnLe
         Pc1+TS5YPtx5tovvMLl52owTifXKn3RMhi1pwJo6OOQsuqBqCuy0B/WKuPhaDmGHkYEI
         FrzdK7fgU3qC+OMwKdcyMrmLd+9cwE/CdLmTFuLxB4VFwWOEQw7W8TkLjkd468y51ut5
         cXSg==
X-Forwarded-Encrypted: i=1; AKwUvByukVr1YT78L3LTj0OcnWDvESOLFmNUjEsWV4KdNQ+HB5DLpkoGPbG+K09Tgf+ZRx04XQIfUnBOkr4XDys=@vger.kernel.org
X-Gm-Message-State: AFuF++lwG3SOcacPsGeq4JRxKCv2tnntukARdvKyRaUQw2FXWGlXsCaW
	JOE3QrOn1RTScA82k2gaXIlqUbVi3zJhgLkJ2b2xhDh0ovZVfjTkTS+nDdbv+Wrp8F74DJROAeY
	yW1CfYRHyN2Q7QGu5KoQ97xMwU2efz9I=
X-Gm-Gg: AYBFou0VUHxcVhS70TPHfFzF9pVdGR5Frbx4gHiyI3vqyrsg63fBM9gnyZ49AebaCgf
	A6iuyKHrVOcnrTePq9mhSbL4vPLjVHMwzoUgy6pelotaFjQfwoBPJESZDGcY9UM/ipCsmFAarvn
	wElXsY2Q7/7RMHAlPIFyEmpKiKywhFjRPhhcDpcViacu3p/xyE4ka24FZr9ajLg8RPHiKZWrdul
	7iU1lkJ36+4pdR66handpGH66h2VL0hoRWT8FXx5NlTCGCronUZ2YnoO0ggaJHGHzcoHzjccwKY
	wo2EmhKiO/SecNYde6WYgpRbbNMP2X90Ky3XvCoVix7nI7bZxeH9gzqqVxCBXi16oPh3loyqS7h
	UjdQLRYblW3B+E8COutL3mn7HVkWuwgqfwm+OrH7g1Q==
X-Received: by 2002:a05:701b:450c:20b0:144:ff51:2d73 with SMTP id
 a92af1059eb24-14503f1814fmr4390022c88.2.1790286766083; Thu, 24 Sep 2026
 14:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923152912.1296884-1-qwe.aldo@gmail.com> <20260923154357.1319689-1-qwe.aldo@gmail.com>
In-Reply-To: <20260923154357.1319689-1-qwe.aldo@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Sep 2026 17:52:34 -0400
X-Gm-Features: AclHuK8_S3kMABiU0QTNjcDgoAqPTQebAhSNKvPGJWpzU2O6hEoWY7qZTP4di-8
Message-ID: <CADnq5_PuveD6MFtdLFkkHk24jVCQqgyC1R6pUy7ri_RyWVSZXw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: prevent parameter-space underflow in
 nested ATOM table calls
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Wed, Sep 23, 2026 at 11:44=E2=80=AFAM Aldo Ariel Panzardo <qwe.aldo@gmai=
l.com> wrote:
>
> atom_op_calltable() invokes a child ATOM table, forwarding the
> parent's parameter space with an offset:
>
>     amdgpu_atom_execute_table_locked(ctx->ctx, idx,
>         ctx->ps + ctx->ps_shift,
>         ctx->ps_size - ctx->ps_shift);
>
> ctx->ps_shift is in dwords (set to ps / 4 in
> amdgpu_atom_execute_table_locked()), while ctx->ps_size is the
> remaining capacity in bytes. The subtraction therefore mixes units:
> a child table requesting 60 bytes (ps_shift =3D 15 dwords) with only
> 16 bytes remaining would compute 16 - 15 =3D 1 instead of the correct
> 16 - 60 =3D underflow.
>
> Convert ps_shift to bytes (ps_shift * 4) in both the guard and the
> subtraction so the units are consistent. Abort the interpreter when
> the request exceeds the available space so the parent table does not
> continue with stale or uninitialized data.
>
> Fixes: d38ceaf99ed0 ("drm/amdgpu: add coordinate ATOMBIOS table support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---
> v3: abort the interpreter (ctx->abort =3D true + return) when the
>     child table's parameter space exceeds the parent's remaining
>     capacity, instead of silently skipping execution (found by
>     Sashiko AI review on v2).
> v2: convert ps_shift to bytes (ps_shift * 4) before comparing with
>     ps_size, fixing the unit mismatch (found by Sashiko AI review).
>
>  drivers/gpu/drm/amd/amdgpu/atom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdg=
pu/atom.c
> index e0e585f..af283cd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> @@ -646,8 +646,13 @@ static void atom_op_calltable(atom_exec_context *ctx=
, int *ptr, int arg)
>                 SDEBUG("   table: %d (%s)\n", idx, atom_table_names[idx])=
;
>         else
>                 SDEBUG("   table: %d\n", idx);
> -       if (U16(ctx->ctx->cmd_table + 4 + 2 * idx))
> -               r =3D amdgpu_atom_execute_table_locked(ctx->ctx, idx, ctx=
->ps + ctx->ps_shift, ctx->ps_size - ctx->ps_shift);
> +       if (U16(ctx->ctx->cmd_table + 4 + 2 * idx)) {
> +               if (ctx->ps_shift * 4 > ctx->ps_size) {
> +                       ctx->abort =3D true;
> +                       return;
> +               }
> +               r =3D amdgpu_atom_execute_table_locked(ctx->ctx, idx, ctx=
->ps + ctx->ps_shift, ctx->ps_size - ctx->ps_shift * 4);
> +       }
>         if (r) {
>                 ctx->abort =3D true;
>         }
> --
> 2.43.0
