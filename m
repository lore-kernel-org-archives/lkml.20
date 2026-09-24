Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88A940BCC2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254520; cv=pass; b=HXdrlugIbIqbJ7WuwAZcZbc8gW6i3wMlWjaS9Mjb1J2BbujLYOHZmK/R4ec4RYta9Rc1SWPDKlXwzZjjWEFeeRA8bxFkPZOTtaawsHzpawp27UrTpoJpMifwTKwjQkNTwb7nEYDDrk47pGV/pTMulx/4wKf3QNK40V6T4PmGdjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254520; c=relaxed/simple;
	bh=9hDFgSWl3UJHIjVr0Mg2vl869gj62O/SKIIKks4VA9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7AvABVlmf3btGIyVihGuc/BgBRJHWTlwUPfJM9JVWbkB/0H/CGdPrnXVYayAyWsniQomhNfdxgRTGUjxsFipgxMsZsck8CtttaT/c6SfJ+ccrDgtdgWNBU3aYoRlQUt/JekpcbPTpzeKIn0GXiS/bCElj4U+WHtQKAXsGcR284=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsgTpyND; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsgTpyND"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c14c9c8ccso160027eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790254518; cv=none;
        d=google.com; s=arc-20260327;
        b=FJiAUe/mu1SIwJH0Dfgm1szKspjwBpdVBvDbbN1EJwGtMhwMkhwNyq1Y8unq+t9Bfp
         I+ENqAROUNIRlJSWtQCruJgx2NHV2uYox4vnrVIO6U2pI6gdy+cKNs30S8NaWDf/Hq1p
         20YJWtZ6/evUdxKDtuxAm9ZkPW9guOP2ARc/haATHjQcpaabFaxv3KoIKCyvXMO2XHql
         hxps9zmxbpLnNX5RoCGA1qwfy5rwczLbINx+dKSHX9jafovGJI7ykOfqyg1qbs6riAZa
         VIHxdxTas1iHgzSxOAYAPYEbqgBau1UCditnn96khiIQSo6BYQDjG3dtUiAG3IbUvq2M
         52bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6rCToHssiWETE8fAeMLU9/8ZLT7uDkl37EA8Ng9jTuk=;
        fh=I1mQtP3ud5IGmP2bpcJuv+4AnLJZOzajKnwdvk+LvPo=;
        b=GVg/Vng6714C5pRsRz3MnZX8vENn8nsmamjBaRNgXd3YhlwgOz8Y1TQGPtbxYwq8Cs
         oP8/JJWHpn0o7gBp1KhM0kgRq97TjhjAOpYpXAFVKjlEChjXObTt7kKocyn6EyeQPe5P
         znyTgoxVGaHvbQBHtsxu5yiUEfjXPmCh/R2S4FVGoFdSB7s0ME2D6rYmVbNrAGK9Yd7c
         nKg7zQE+gC8Fk/LMpJkD0VV1SJXPxNkubLQc6ThZthTLwB34XSlyBsndSdbWBR84ZZL9
         QU83HIMrh7nz/OXQeeBeWjuQ8t6tBvYp6Py9AsH1bQQOqGyQNMNbXsldtlCS4KMwTKex
         /7Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790254518; x=1790859318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6rCToHssiWETE8fAeMLU9/8ZLT7uDkl37EA8Ng9jTuk=;
        b=EsgTpyNDI79g8HQwufGl19JKWAbah+aAvEEyIn7jCRqqCid/Bl4KUdRQfVAkDiqXaa
         RFOI5KbZ1GCSebuoUt62bE6WOcZHazcuXJ4ekHhSPs5lZZTAX290RWnHkaOfVbabu5YK
         hnNFaCwmQhN4q0eFdcdFNfNwG9rQSnOGUnnftFdeIRp7kgPA3u0UgqOmSTO6E2LR1d+E
         b3hGbCPXC4QmN6sEb2deJ6bPfaP0Os/0AP3bErhxOSwPhtsVC/VH+0dGZv/oi7GtcYlu
         Z6kfHCCjWWpiYQA/m45r11kUwEHldjJAniv6674hFc8QaF5gMQwj4IDCsxPglBLajfH3
         xqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254518; x=1790859318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rCToHssiWETE8fAeMLU9/8ZLT7uDkl37EA8Ng9jTuk=;
        b=sEJQ0GdP8HIEGSl6MdBzz3b2q8K7OdvouFqZ9YolH/O5zNBwM3SFQlODOoC49UytVs
         HHYHeSINXBBU2qxVyarxGBgMVNYnEqlo5qdfgwdrB9Z1jSPyQINwuOzM2fCoTblJN+68
         X1+Cnm03NAxDjTXkXeniTQ7XKF/6/NE1NXYjYP3on+qVKx9xGed2AMTx8szfYCTlCeOo
         VAoILrlpPZvI45EWQlHM1vMf5oOi6Li03XhWiytImN/3acdfopj5anuQLgjQMAOB8yqO
         2ZT90u4vAHKP7xWuh8RB4s8/eamD7TaDyD2VpKE1EazeNRIgvzrB7krLhU+pg3ketG+w
         ZFcw==
X-Forwarded-Encrypted: i=1; AKwUvByEEy0AzXNfbuori7HDcvSgG2pG5e76PDHg1jkfYOvEF+sCdT/WA+NruUT+sFJOnD1rjT1rCc8bD7/anuw=@vger.kernel.org
X-Gm-Message-State: AFuF++lRU0h4diCGXlxcU84Z0JIjKYgbw3hOqFmqxmlWhaDgisNlwZM2
	j0Ch9WT+GLRX2OStEIC3mMpWe74oRH+/aF7HOgatidQIVSFGmMMYAFi4e2sbJSOEYMS2ArV84BO
	ZIgxTvsFMLNOVMkYcApzOaHJru/ZHIlc=
X-Gm-Gg: AYBFou0jFI3wmkqw7R1g/Ui32d8AhxoJrjN8+ad3T2dQDLjkejxD7XkTH5qrPTBDAet
	ch7fppHsxixK9sKMm0FwQe5es9QF66fOSVcVVGZAhh4B8Cqg7BMtJ8LVXLbqMjJ8MBcBXHCYbft
	41oZqy++uk3/myKGvaFVUjJ6GtqSiJHFR+OWvXdu7aAqzslDW/oqZ1s6AYM//jWh09OX1jhHRde
	tiqXpp7sgD8TK7iE+uvVfYN5wRIFo10sr1AiVoTlC9DD2217gzy3TA/OWLEKKeaU8/boyQN3Tve
	gDZgPVo9q0x9nNtQyCLB6bpH5lX27+gQC21u//xS/WU1n//2Oax1nt4vOFc0cVfYDLti9bF/9zd
	ucMGSnYyw0niXe96qKBDXXw39fPepEazW77PAY/a6FQ==
X-Received: by 2002:a05:701b:450c:20b0:144:ff51:2d73 with SMTP id
 a92af1059eb24-14503f1814fmr2776445c88.2.1790254517596; Thu, 24 Sep 2026
 05:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924124319.1895-1-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20260924124319.1895-1-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Sep 2026 08:55:06 -0400
X-Gm-Features: AclHuK8rawtFh8RIfYGUl6NWaHxeKlnzIhQDBr80jpvjqrvakm50HhNAyVvXVcE
Message-ID: <CADnq5_MFzY4EQBeDQcR+Ca9y5GXXseKbuKyLgvu_wcmpHLaPaw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/amdgpu: implement workaround for sdma dcc corruption
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:44=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> For unknown reasons, on gfx12 using multiple entities can causes
> random corruption of BOs with DCC.
> This workaround seems to prevent the issue until the root cause
> is understood and fixed.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/work_items/5663
> Fixes: 3a6f6eeb3db5 ("drm/amdgpu: give ttm entities access to all the sdm=
a scheds")
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 3d620ec2937f..a826e091ea58 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2392,6 +2392,11 @@ void amdgpu_ttm_enable_buffer_funcs(struct amdgpu_=
device *adev)
>
>         num_clear_entities =3D MIN(adev->mman.num_buffer_funcs_scheds, TT=
M_NUM_MOVE_FENCES);
>         num_move_entities =3D MIN(adev->mman.num_buffer_funcs_scheds, TTM=
_NUM_MOVE_FENCES);
> +        /* TODO: workaround for DCC corruption when moving BOs from mult=
iple queues at
> +         * the same time: use a single queue until the root cause is ide=
ntified and fixed.
> +         */
> +       if (IP_VERSION_MAJ(amdgpu_ip_version(adev, SDMA0_HWIP, 0)) =3D=3D=
 7)

Probably just limit this to 7.0.0 and 7.0.1.  sdma 7.1 doesn't have
DCC.  WIth that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Alex

> +               num_move_entities =3D 1;
>
>         adev->mman.clear_entities =3D kcalloc(num_clear_entities,
>                                                 sizeof(struct amdgpu_ttm_=
buffer_entity),
> --
> 2.43.0
>
