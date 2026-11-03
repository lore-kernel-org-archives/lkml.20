Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706585;
	b=tFUHtXOtLERe69vN1/d+0n6KbLGypoQF8k/+HK5SWjXVvYvuKDkq6wfvT29AXqzCwAT4
	 c5kSZ+63kp9eqvShk6Fd+yiw9NvzQluaA+Fi27dATuGIv0A4tYfimnYXMzlwaEH2GBAvj
	 PvxBttXm2kFAdzXwMXMc0sba/405FHA+GauyoT3q7UNucTTG2XqW9s5RF398EDAwk1b4Q
	 XFfvb/huaa778Pigu1eOUFi1SN91jTGUZ4lsxWALoUd4KOSnYsMRfFIAdGtR20aTJwang
	 zBXpBq1ihyhPsEcb5dB4esb+oKobSp/kQ2FZNjXoYOIuJRWAzFHuvKdCdbWYCV5+pvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Q+oLP1OEwtePBrYrElNROHr+q71h1tBToe+zpCw5khE=;
	b=b+TBF+o/GayIYKKl03FaEHFae1QGysuvk53TePpCvBmXYhWcnQhpADCET6I35C5n6PK3
	 hjwD/MBJ6sU8Gu+lYDTY7LHn6+Mxzq5LSlX7xnDyPArR4Iro73jxsVFIlLP6gAvKF3pcy
	 Ynyr+F5yiKjLFqrYdMOSYecCItVgXr8TdnMMs297jdgc+5K4KG9fWqkgvmn6M0MEiQOsH
	 19ljIr6NuJkxsvYCqoU11zo2KwkHhFq8j6xrXRFpv7ZaIHiWsWEdzxfoCTuJ66Ft3hbF/
	 4jyncFTlo+yxij6kw+8+t/Yx2yqA8r06eyb4w2K72asyudXfuIutdYAJCaCxoVBRG0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzD9qNM6;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DB7606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61DB7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzD9qNM6
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6079825e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706584; x=1794311384; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q+oLP1OEwtePBrYrElNROHr+q71h1tBToe+zpCw5khE=;
        b=JzD9qNM6RpV88GkWHfULKtjSaEAQMrQye1soENW8DfoGD/ljSXfdE+3T7Qirz9b3sZ
         THlInnnrRlzmj+QQwIB0GeazDvKZj5BW35v48UBhOPOWG6UU4JdUPJrQkdcgdRobSGYG
         uBkUTDIbO04E53//4sDn0A4j50vyjIh9wJp91vbXL+hMWZlKD5gJ3Ql7R+htoS5sR/A6
         FW8X78VcsQ8F810onSoLA5GMzFpmBKK0bYYKM16MeIVofoWVa6cHaHfGPt0uU15USrGY
         2U61wKKrNfOFHMGquDGSF0wTiY5/Ulh8ZnLojQu3rUCEIBObGkxptcULHGYIyS4szKpe
         8ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706584; x=1794311384;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+oLP1OEwtePBrYrElNROHr+q71h1tBToe+zpCw5khE=;
        b=1IyN/4hgheV7Zj57iaVsOm0UKkJucQG9EZYZyFzjEqTY0ZJq3GeJghw8z1OyV2Q07c
         Va2cLTE7cmxBofLbjEazg+Oyhjv6I3jaNDoUNodjXG54finnAZkiNaiLteSRKkTZuaPq
         Nzym/QwZ756BPKacrEClrFyFdZM9tGX58G0L6MveYH+zOIPJC257qGD3VEkIZS9soU9R
         0UD1xOQbSPTjvVOc9u554VNlO8FWMfmWnB4L0313SuG2YnXy8UUxM8GJWuwfDLzwJ9OA
         xgK8G1Z3gplBJyZZRAD/B4bAZtShTDqdyk4WyCPZpaqUo4g3TCslAYv68m+Nhu9DTSdG
         jhYw==
X-Forwarded-Encrypted: i=1; AKwUvBwPNltXCULsTgXLHnXAzK/YYnGoRmxqTdxxkBoix/oCHQvpdS+RxmbHN10sY/y3IeiFzvH+fqIeKhDVRVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EMm1R1SX9gdVXwQzM2YAjOXPG2o8Kn44UQODR5SGifkYo5CeP
	dhRp7mZtLu8quVQWjERDtc51dFO8D8su8XDhinmJQJNeJZzvYg4dGguK
X-Gm-Gg: AYBFou33LcZefl7cKTNuUTgP64fGjJ2idRiADbuxTfsfBf6N72UajZgZZSvmPbbKsXl
	p3UaSn8rzyjERzeKweUXv0ym6AgIY+WLfUppT4jT7oa3V1kzjVxRxr5EC+Sd/bDWTPxirW1zh6z
	FaStq2CIDI3FCcF/go1CazJDWa5rouH8iMR82rTuz1TWJBboV7QnnhNV8seyMPBhPA6ZV4pvYAn
	3/0k/mgjy0VNXiITt39iGBY8zfcq6b+r+qEBdVcSKVUhJYD0Nrod29a4I3xjmFDj+Gpg/ijAe97
	8u53I+jbNChwFUFld0Rs5qSYgFS9NL9EoyYF+vPm/ywkYtHZJCRdySA/WiQiVN4E2TkPicWW0tm
	ZTo++S79cc+mVjVibCG1dMTuCo7FTeWS/hi0MqZDxeXmQatTWzAm4yR1gzIZgrd5mYGwQBSmTch
	m+91i1f1NnPUuKaoWbdoUAQFT0aetlen1rxd9Cyiu5u179XsZ05PUZZDktsZtYXbm5XHVsV0bI7
	qF7gjv0LZiHfVz//Ponkz2zeneC7Nalh67gZ0E94bumVKxgo8QmKxlh0wh1OFO05UiFzGSVWEVX
	3+YHoVX7ELP6ZZKsVkcLuCpjjagEw6ChMDhmJcIBIFa337+hUzuDy7YiFJ/Kf61QusGljgwqoP8
	b+kSnrkoG
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ac1793e81cmr309764195e9.13.1793706583552;
        Tue, 03 Nov 2026 03:49:43 -0800 (PST)
Received: from [192.168.1.86] (240.red-79-154-229.dynamicip.rima-tde.net. [79.154.229.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm446345565e9.1.2026.11.03.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:49:43 -0800 (PST)
Message-ID: <be6a9d3074290c030a6dcf9211a02fe690fb5696.camel@gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: Only enable HDMI audio if display
 supports it
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Panpan Ren <renpanpan@kylinos.cn>, alexander.deucher@amd.com, 
	christian.koenig@amd.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, tzimmermann@suse.de, 
	lijo.lazar@amd.com
Date: Tue, 03 Nov 2026 12:49:42 +0100
In-Reply-To: <20261103061147.25827-1-renpanpan@kylinos.cn>
References: <20261103061147.25827-1-renpanpan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-03 at 14:11 +0800, Panpan Ren wrote:
> From: renpanpan <renpanpan@kylinos.cn>
>=20
> The amdgpu legacy DCE audio path (dce_v6/v8/v10) unconditionally
> calls
> audio_enable(pin, true) at the end of afmt_setmode(), regardless of
> whether the connected display advertises audio support in its EDID.
>=20
> This causes a phantom HDMI audio output to appear for displays that
> have no audio capability (no basic audio bit, no Audio Data Block in
> EDID), because the GPU sets the AUDIO_ENABLED register bit, which
> drives the HDA codec's ELDV pin sense, making the codec report the
> jack as audio-available.
>=20
> The radeon, nouveau, and dw-hdmi drivers all gate audio enablement on
> the display's audio capability. Apply the same check to amdgpu's DCE
> afmt_setmode functions, while still respecting the
> AMDGPU_AUDIO_ENABLE
> override for users who explicitly force audio on.
>=20
> Fixes: e2cdf640cbb5 ("drm/amdgpu: add display controller
> implementation for si v10")
> Cc: stable@vger.kernel.org
> Signed-off-by: renpanpan <renpanpan@kylinos.cn>

Makes sense, thank you!

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>


> ---
> Changes in v3:
> - Also gate the initial audio_enable(pin, false) to avoid touching a
> =C2=A0 potentially shared audio pin when the display has no audio support
>=20
> Changes in v2:
> - Respect AMDGPU_AUDIO_ENABLE override for users who force audio on
> - Add Fixes tag and Cc: stable@vger.kernel.org=C2=A0for stable backport
>=20
> =C2=A0drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 12 ++++++++----
> =C2=A0drivers/gpu/drm/amd/amdgpu/dce_v6_0.c=C2=A0 | 12 ++++++++----
> =C2=A0drivers/gpu/drm/amd/amdgpu/dce_v8_0.c=C2=A0 | 12 ++++++++----
> =C2=A03 files changed, 24 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index f2977fe6d824..a8f5eb2394c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -1555,9 +1555,11 @@ static void dce_v10_0_afmt_setmode(struct
> drm_encoder *encoder,
> =C2=A0		bpc =3D amdgpu_crtc->bpc;
> =C2=A0	}
> =C2=A0
> -	/* disable audio prior to setting up hw */
> +	/* disable audio prior to setting up hw, unless the display
> has no audio */
> =C2=A0	dig->afmt->pin =3D dce_v10_0_audio_get_pin(adev);
> -	dce_v10_0_audio_enable(adev, dig->afmt->pin, false);
> +	if (connector->display_info.has_audio ||
> +	=C2=A0=C2=A0=C2=A0 to_amdgpu_connector(connector)->audio =3D=3D
> AMDGPU_AUDIO_ENABLE)
> +		dce_v10_0_audio_enable(adev, dig->afmt->pin, false);
> =C2=A0
> =C2=A0	dce_v10_0_audio_set_dto(encoder, mode->clock);
> =C2=A0
> @@ -1705,8 +1707,10 @@ static void dce_v10_0_afmt_setmode(struct
> drm_encoder *encoder,
> =C2=A0	WREG32(mmAFMT_RAMP_CONTROL2 + dig->afmt->offset,
> 0x00000001);
> =C2=A0	WREG32(mmAFMT_RAMP_CONTROL3 + dig->afmt->offset,
> 0x00000001);
> =C2=A0
> -	/* enable audio after to setting up hw */
> -	dce_v10_0_audio_enable(adev, dig->afmt->pin, true);
> +	/* Only enable audio if the display supports it or is forced
> on */
> +	if (connector->display_info.has_audio ||
> +	=C2=A0=C2=A0=C2=A0 to_amdgpu_connector(connector)->audio =3D=3D
> AMDGPU_AUDIO_ENABLE)
> +		dce_v10_0_audio_enable(adev, dig->afmt->pin, true);
> =C2=A0}
> =C2=A0
> =C2=A0static void dce_v10_0_afmt_enable(struct drm_encoder *encoder, bool
> enable)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index c68de0fe1d7d..3cd9f1bb3a70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -1724,8 +1724,10 @@ static void dce_v6_0_afmt_setmode(struct
> drm_encoder *encoder,
> =C2=A0		bpc =3D amdgpu_crtc->bpc;
> =C2=A0	}
> =C2=A0
> -	/* disable audio before setting up hw */
> -	dce_v6_0_audio_enable(adev, dig->afmt->pin, false);
> +	/* disable audio before setting up hw, unless the display
> has no audio */
> +	if (connector->display_info.has_audio ||
> +	=C2=A0=C2=A0=C2=A0 amdgpu_connector->audio =3D=3D AMDGPU_AUDIO_ENABLE)
> +		dce_v6_0_audio_enable(adev, dig->afmt->pin, false);
> =C2=A0
> =C2=A0	dce_v6_0_audio_set_mute(encoder, true);
> =C2=A0	dce_v6_0_audio_write_speaker_allocation(encoder);
> @@ -1748,8 +1750,10 @@ static void dce_v6_0_afmt_setmode(struct
> drm_encoder *encoder,
> =C2=A0		dce_v6_0_audio_dp_enable(encoder, 1);
> =C2=A0	}
> =C2=A0
> -	/* enable audio after setting up hw */
> -	dce_v6_0_audio_enable(adev, dig->afmt->pin, true);
> +	/* Only enable audio if the display supports it or is forced
> on */
> +	if (connector->display_info.has_audio ||
> +	=C2=A0=C2=A0=C2=A0 amdgpu_connector->audio =3D=3D AMDGPU_AUDIO_ENABLE)
> +		dce_v6_0_audio_enable(adev, dig->afmt->pin, true);
> =C2=A0}
> =C2=A0
> =C2=A0static void dce_v6_0_afmt_enable(struct drm_encoder *encoder, bool
> enable)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index c3906270f25e..eb1fcf0b39cc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -1523,9 +1523,11 @@ static void dce_v8_0_afmt_setmode(struct
> drm_encoder *encoder,
> =C2=A0		bpc =3D amdgpu_crtc->bpc;
> =C2=A0	}
> =C2=A0
> -	/* disable audio prior to setting up hw */
> +	/* disable audio prior to setting up hw, unless the display
> has no audio */
> =C2=A0	dig->afmt->pin =3D dce_v8_0_audio_get_pin(adev);
> -	dce_v8_0_audio_enable(adev, dig->afmt->pin, false);
> +	if (connector->display_info.has_audio ||
> +	=C2=A0=C2=A0=C2=A0 to_amdgpu_connector(connector)->audio =3D=3D
> AMDGPU_AUDIO_ENABLE)
> +		dce_v8_0_audio_enable(adev, dig->afmt->pin, false);
> =C2=A0
> =C2=A0	dce_v8_0_audio_set_dto(encoder, mode->clock);
> =C2=A0
> @@ -1653,8 +1655,10 @@ static void dce_v8_0_afmt_setmode(struct
> drm_encoder *encoder,
> =C2=A0	WREG32(mmAFMT_RAMP_CONTROL2 + offset, 0x00000001);
> =C2=A0	WREG32(mmAFMT_RAMP_CONTROL3 + offset, 0x00000001);
> =C2=A0
> -	/* enable audio after setting up hw */
> -	dce_v8_0_audio_enable(adev, dig->afmt->pin, true);
> +	/* Only enable audio if the display supports it or is forced
> on */
> +	if (connector->display_info.has_audio ||
> +	=C2=A0=C2=A0=C2=A0 to_amdgpu_connector(connector)->audio =3D=3D
> AMDGPU_AUDIO_ENABLE)
> +		dce_v8_0_audio_enable(adev, dig->afmt->pin, true);
> =C2=A0}
> =C2=A0
> =C2=A0static void dce_v8_0_afmt_enable(struct drm_encoder *encoder, bool
> enable)
