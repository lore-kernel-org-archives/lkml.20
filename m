Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5862BE621
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788065073; cv=none; b=ORJ/lE1lgi23nUNO/cC6a46SLSHJkuQlZJZIFn1Ca3U4zdCnxqGlQ7QcjFcuRmbvKhRfmRiAX2ZzILAsnZcg4J5wqEebThhOVqgSRTA5cofaqJE7F16eGfe0Qs7FfUgJ+yjrbcd7E5P7X0Afr9h1cTBLvLt2yagCGU7apMa8gzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788065073; c=relaxed/simple;
	bh=Xt6P3SOxIvT5y0oHDPPWmLVOBwqnNI6prkkrjBhNkgQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qCF5JGWqumyGSO/6fXZWBdSHZjIL6H5Vlndk/NtSP6Kq/VU3SdaR6zBHtXPAP2S4s4V474cmE0AsUbhg3id3I/kroE83inzr5qBfI16dSrsJlQh3VPIgfMo15LTc2KqMOt4U3qSLod4QVtIJpcSOxrEqfCDeoE/0xODc/f7qYoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkjtMtMD; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkjtMtMD"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c79c9f7b54so662604e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788065070; x=1788669870; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qiTTxzp4HXiHHnT6uGxMqgpdQesOTWIkegK+zdcRPBw=;
        b=pkjtMtMDtuRcHIsx5N4IBPdR6XMw7lhxe5Xvu7429wU6iUqQbRTnuBfaolRIIrIi3j
         tXp8DxWKvFXVRAN64Dbmqi2+A4M4CNBKxKxMl7RCLrm4Ob9TOpyURrFU8DMsCN8HIQ5B
         H8UrwZnHkRskbiw4+5Q8pK9Pwg7p/BTKMcjKluK5nDgCg/yv/r9jpwEQwg9giS8oHpWC
         4TYMemBNt8HHO1vpTl478yvek5hZZZY4WFeVTFWhMLf2tPm/JND5Bs6Wgy1bN/eibGiN
         CZHN5IwWK3kouyAaBBQe90cmUFt0BdJJna1THLUMrbE9z0hQVkB4uaPYDfO5mcwIroMA
         03yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788065070; x=1788669870;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiTTxzp4HXiHHnT6uGxMqgpdQesOTWIkegK+zdcRPBw=;
        b=cRBNFRa9kmkMgeBRy9Wvy/OqOzYRVVlaAkTlrh8HJ4VTqnYtxHR8typA3/6A44fLib
         6Torjt+1hswgL3vc1hHK1kf6xbWOgQp/ETPGayl1FV1drmixGw1DwQSybFft7NBijmcq
         IW1piDAR8/Korhr5nY1zu+sOfzKrrNUjlfUXRYSd+mvxBGOKx6vImFLTUpuOJASYfc2R
         APT1CUHX9zXaxtBbdE6jLwnfjYj0IR2Hm/yPLHR3VuZubRm1zHeDl/rkuJ8ahMUbyCRC
         D4KwHrQbcuVVNR6RDvg/KUaxkzlA3cN5Faq+cXe4R/khAheKprK6t5DSZmk07bAZAUTn
         DZAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpM48rgst3jP9+qzlkxR2fyriHUdxUX2g7jikopbJn3sjUPRMq6dv0XOh6GFK0QRYY4KZs9aRDCBZrMu7o=@vger.kernel.org
X-Gm-Message-State: AFuF++mrrJl7693UyCd8EawbmhK20yE9xMDWhn4/7lgXBqpdEvi5jOeG
	R9FsyiakrQrOVmcba3sJi397GAUfCqXrXR7lwl5QOFduY5tQ6a9PjrWp
X-Gm-Gg: AR+sD111QPpONkHz/CnvqaeC+WrAESJbBAnItA6B89rrM1IvwzP0fiimRw5+hLN8yjQ
	R+3bbHpUxFDDZWUm0b+ePYAeepJNkgHkaTtEDvary4eFqT7UWAhTYFS5OWZOKFQP6lvgwrlFfob
	sUrQXNZWqu9laZ8gI3RTeD5YbfnF7WXT/K8vRqkENkurAuz5Z9a/nREEfR4LJyCtGT8lDzcsEsT
	DyHci2nYrgE2fp1y2XN9c4P5tFfp1/zOvfbqsno9YoexBWAYZP+dxDhsC/FR8D0/RHJNGLPEGyO
	wKW15bSj9+83FnvUUXm+5UrUGXSsFefYk0kwo7QWbHN9nWyQsKaautpc2SnVkXkd5gMTZZxPPnZ
	2rsKLNbHdHsnWR3K7QQlKVuBQb2pow9w86dGaO8C2lhmLPAMvvpcZJk2ZvaY2Iwc2YVomCLaxqT
	PtgC954Fyj8ydjkoOZ7XUVSQUASIHqS8lo62/7s3sgYdYl9H5d5w8=
X-Received: by 2002:a05:6102:370e:b0:785:39f2:d80c with SMTP id ada2fe7eead31-78596cced64mr5624738137.1.1788065070467;
        Sat, 29 Aug 2026 21:44:30 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e84a55284sm5275707241.4.2026.08.29.21.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 21:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 29 Aug 2026 23:44:23 -0500
Message-Id: <DL205Y6LUAEY.1ZA0G5ZVUPUN3@gmail.com>
Cc: "Hans de Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
 <Dell.Client.Kernel@dell.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86/dell: alienware-wmi-wmax: add Alienware
 Area-51 AAT2250
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rickey Bartlett" <subtexel@gmail.com>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828145756.341733-1-subtexel@gmail.com>
In-Reply-To: <20260828145756.341733-1-subtexel@gmail.com>

On Fri Aug 28, 2026 at 9:57 AM -05, Rickey Bartlett wrote:
> Add the Alienware Area-51 (2025 desktop, model AAT2250) to the AWCC DMI
> table. G-Mode is not applicable to this desktop, so generic_quirks is
> used. The full product name is matched to avoid colliding with the
> "Alienware Area-51m" and "Alienware 16/18 Area-51" laptop entries.
>
> Tested on hardware with BIOS 1.6.0: loading with
> force_platform_profile=3D1 force_hwmon=3D1 exposes a working platform
> profile (quiet/balanced/balanced-performance/custom) and a fully
> functional hwmon interface (6 fans - CPU, 3 top, 2 front - with fan
> boost control and temperature sensors).
>
> Signed-off-by: Rickey Bartlett <subtexel@gmail.com>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
> v2:
>  - Reorder commit message paragraphs (Kurt)
>  - Cc everyone reported by get_maintainer.pl
>  - Send with git send-email; v1's indentation was mangled by the mail
>    client
>
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index d1b4df9..2b0ffcb 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -121,6 +121,14 @@ static const struct dmi_system_id awcc_dmi_table[] _=
_initconst =3D {
>  		},
>  		.driver_data =3D &g_series_quirks,
>  	},
> +	{
> +		.ident =3D "Alienware Area-51 AAT2250",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware Area-51 AAT2250"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
>  	{
>  		.ident =3D "Alienware Area-51m",
>  		.matches =3D {

--=20
Thanks,
 ~ Kurt
