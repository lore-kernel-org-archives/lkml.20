Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364633;
	b=VECONdzWnIyTs9X5+MbPb4fP1d2LqnY8yqPDb3y+Wz6TOVQ55hi45bR2KkrFTCfiDlU1
	 2V+LwGDt8yC9akOhbWFr71WN+3l9PtQy9zfi4xFDt9754f2GYAN5i7I+KrdawMYnfm46l
	 RF5FHmsPcEITkYA0Ltx/KWEF8q/BVtIK/UHu6XX+mK/3TXlLyyIhCNVlkuw3MmTGOP9kc
	 F/nFjqPVuiDIKylqHeKFlG7y9PTy+hYXbtQJd/iNKWQk8+Er2/JtsuhFgCdclIiVLG0va
	 B2qIAz+5HcPDyGgz6Geg7YANb3MOOTV+OrHPR3KcvhroeQrShPNiCWlUrICrId0O7bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
	b=lUT/YOFzEFaNwU+BrRLwInqf+7UN0A+EaHqzE9NpRVyJN0bHefsfMBzOqmEExSmDyvkG
	 3uocp3mSLrObeg9s8EE+TBlOMsrKYJNKROdI36jJD6aB2CUPl30FXvuEiHnxE5E/7bz8U
	 vPj1SXtjGXgXzx58Ym+lm+oBPJz/ZNe0SabrZ0b8suW7auQklbeVUgta/YDkEnSsRon3t
	 WqRJn7+1Zcxf/7BjzxG/Pcz60Kvur4dwyVBicv8AO/T+Zn+GaExtLx234n0fCCkY1pN7b
	 Z8VgBQR8r/PZeL177B1T86FudAtX20h4KU+H88Rjp7kelYKmC9zILdAtoTPvdIQlCHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SYbesSV1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4CE60A2602
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4CE60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SYbesSV1
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso850324a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364632; cv=none;
        d=google.com; s=arc-20260327;
        b=ScuiwC4Kv0SQk7noTeJ2PM+XbGgZmkVo6UPwE0DusbkoFWQMtInvogsWBg4/ajRPDf
         M6Z3h5o/FyLp2hsY5GPJQWVM6XoNd2pdvpkWBNL/W5q3x+dKzvPZ2WOJWRCA4DgEDlo7
         dFfgT7ThtReIchYanREzt1oNo7BxMN9DBYBH7Z7gRxc+Ca6Qx3gSrLoAVAtex7n8BnkD
         sxUwChnSGDYCxzh1RYpH/PFZm3y5H7/wsgUYYNCT1aYy2GJyDIWA7ifjjcoJVa5hoRTx
         jgW40IfL3Awum47ePjlpZqZSPahIlF3ncpfyyV+IcjdT2Afyr8wbep+2vPQ9qwSjBVRF
         qpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        fh=vzKjYAc3iLBbFvUUok7pNjYoTBs7lpUA6kCQ6PsADCY=;
        b=M5xRlazIW1Cu8INuImcQCy1aqHzIPfsVSxGrYJAq83x1CHx5Azxqq9cdGq/Tq6AYcV
         BNMhX3PTQYfQUSCCNWv179YeEogVYJf6eGTpN8j479BbM0eSG/uhbfPpnBQkv79QbSw5
         6mxbRqaK7Lh0yCPWzZz0NR062rfXmhVJY2+OPh3jR/H5f5JiZlA2N46x5qcVq26Xqjj6
         AQRYLu/3xP6r3w3OH9PouFNu6GwDvMCHN9Z4GBobM8bj3XODrcjZbzV0TvDrc6/9UKUh
         x8JyY3kKpy3ZONm0QgAtc88B4z+jXbiHvpuL5ykCFoaSfEnqbm+GqSmNJnwI7LBxarfK
         iYLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364632; x=1793969432; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        b=SYbesSV15T5/9mZIx8kfcRNmn6l3YY8QGeI1q8Hely+8rS2podieFf9mOy2+xsDRsj
         U77SNQy5fVGsS8tR6YhEeb++HJ5Oyn9vwVGmcIRXhieoNGGDnTKkc3HaDUzzXbgMzq8F
         dYVn/3f8xOtoGt2MJk/Msw8qqcBWv4EKr1+wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364632; x=1793969432;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NfpnBNATdJxRwGxwDYzc8qVCy/56bkd+pdGBxDe2S28=;
        b=kix+EjRnL/W1NPe2O3GurzSyErSOkVZKP/43v8mhqgN/xunTiuZruMt6/k8vrqPHAy
         RUtmAy5ED3crwaDipxXZUJP2QaolWxsm4Ybm/LUCx/D9hQhNyyhp7PO77sR0XkLtl40i
         26oER6LxPf7b6WbF/TDECwzbaKrX420e+5q+6Us2VqSexsHDXipuF/bc7HHGFmGgaS19
         W4MicGHrNTRrMgscszI6iq7opY2+RbTrYjTX1sr4i3LoCcOBaD5yB8SPF+kkd1Q+eowx
         +huoF8AgCo+qrFl/wMcNrHvWIQ3Z01hm7gs87SBJbZBI61OwGlhMzga5YlR9lILUpd+W
         kApw==
X-Forwarded-Encrypted: i=1; AKwUvBw64AbfLuyoXvvKyprvBrmlIlOofXfv7Y2K/7EeNs+8BU8D1VDgbLeL3HbJKMSolyYAUy5WYgECTilr+s8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPJmWBYhNSoPiUEnSli91zS685QmEgkXW3OyR3i8HYU0TAgVDT
	Ae8qRnpu0BRrcDketsHA2K2ciLdYJ92Zq4SRyur6ojRt7TJ4I9IGjPAPKQ2vxhTdvihdTCEVTSo
	ifn3oAG4a/hgWr295ZfZlxWif0IVhuVapaHhm3Sb8
X-Gm-Gg: AYBFou0DKtAqzQsMXzCiugaxhmcHjrGLVx0tJALPidE2WqhMaZfAqmgxxr71gpBiSK6
	dpqm4i2KDayA5m+YM6l+S623nwrljYYazEa54pZgPnc1DSMiTvAoSbQ/MIbSBP/5WOlJaHldV+I
	uTi2yJjyCWMATFGRgPRagXkvi6f7uOLONjxtSQNiSCFRI0yMgC8DZ0eyG3aZNrO9vxsiYArUSft
	lsjZ/JQX6wLKphi1gNoWnyREs1sUpjwzT3jNKD+FF92QbOLkkx1cWjbwp+sa6umoSeRi90L5BRY
	QiVlQi67SVFxthbJHdopH4GVcdSHidQicPyb3Y6n94HUMZM7sQjOAR9s8piQoyfEvkIMFuE/+qS
	IUmF4LpL3ne+HrU2Y1Mw7eWm4rBQw0ZdS4Ori/mgxNdfqqxy8WGZggrCWH/p5LMGFzbQ2FVQ=
X-Received: by 2002:a05:6402:234b:b0:6b3:c499:457b with SMTP id
 4fb4d7f45d1cf-6b4d5ee4694mr1571580a12.37.1793364631626; Fri, 30 Oct 2026
 05:50:31 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:30 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:40 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-8-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:30 -0700
X-Gm-Features: AclHuK_bLtvWnT_sBBLVpqNMOqp9dk3T0gTPOazDaN2_jgPIOOOV0mKPKAh7ZHQ
Message-ID: <CAFLszTjddQakuBaj3UYk0sKxVsOvhrE0+6KnGOQ6tQJ2o=aVng@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] fdtfactor: Add tool to split DTBs into a base
 DTB and overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add tool to split DTBs into a base DTB and overlays
>
> When shipping a single firmware or kernel image that supports many
> closely related board variants or SKUs, bundling a full compiled .dtb
> for every variant results in substantial duplication.
>
> Add `fdtfactor`, a Python tool built on `pylibfdt` that takes a set of
> compiled device tree blobs (.dtb) compiled with `-@ -L` (`/__symbols__`
> and `/__local_fixups__`) and splits them into a single common
> `base.dtb` and per-board `.dtbo` overlays:
>
> - Common nodes present across all input DTBs are placed in `base.dtb`,
>   with each common property assigned the value shared by at least two
>   boards that maximizes byte savings across overlays.
> - Using `/__local_fixups__`, phandle references inside property values
>   are normalized to target node paths so common properties referencing
>   common nodes match even when numeric phandles differ across input
>   DTBs.
> - Any common node that carries a phandle in any input DTB receives its
>   phandle in `base.dtb` so overlays only emit `phandle` properties on
>   newly added subnodes, matching the requirements of `libfdt`, Linux's
>   `drivers/of/overlay.c`, and coreboot's `dt_apply_overlay()`.
>
> Add a `fdtfactor` test suite in `tests/run_tests.sh` verifying that
> applying each generated `.dtbo` to `base.dtb` with `fdtoverlay`
> reconstructs the original DTB (verified via `dtbs_equal_unordered`,
> including across input DTBs with shifted phandle numbers).
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  Makefile                           |   2 +-
>  README.md                          |  43 ++
>  fdtfactor                          | 814 +++++++++++++++++++++++++++++++++++++
>  meson.build                        |   1 +
>  tests/Makefile.tests               |   4 +-
>  tests/fdtfactor_board1.dts         |  38 ++
>  tests/fdtfactor_board2.dts         |  36 ++
>  tests/fdtfactor_board3.dts         |  34 ++
>  tests/fdtfactor_board3_shifted.dts |  34 ++
>  tests/meson.build                  |   2 +-
>  tests/run_tests.sh                 |  65 ++-
>  tests/testutils.sh                 |   1 +
>  12 files changed, 1067 insertions(+), 7 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
