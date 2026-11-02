Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632936;
	b=atJ5keigQee9w/Z4L1LDwBRqTIiegh21gymGiokvYCRBvaCJmXJLbf82YUtdAj9q3JjX
	 efTrhKzfWDVxY9qJjEf6QfSbi0CexAeu7c4wmsfBkgVzoN8NpOSxN4MbvxU8n3h1Oo1x7
	 nEbHY9hB3wIV0FzRorTQbXVytLmZZ2LdAP0jk7Mmc4tBw0d14BZrSt9ctPf/7TCXYOgfC
	 dgxw7ic2ZXTeo7jYQwEh4zYtQTOSl1lxRiFsWAx/Bnzcg+Hae5D/m0icHLx9y9Bjvj8rl
	 +t5ujvCITFjXosE2OqvmdL9Nx/ttsYyWky9rq9ZnmdZIGQ8yA1eRnfrBDFOUt0EI8vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632936;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=C2mBpbnVLemM5L5rEiqeWTkY0TlHmQQvKvlHKTMt9FA=;
	b=d6B7/0+4zAevF+rnMofVWSJeQXPDIleijb7faf7vWuWlm4WmbtjKDYzwXmnq3smlcafp
	 u9NaQJSFlrDRxHMvBBt+S4yLTVeOgHHksmOZrlF7gOOn+XDE8MKxqOk9MN0+KSRnvUiUg
	 klbsVpfTpXgWJYEaB7tckvNjNmR24nMyb0W+IykZzJndb9BIyHSL0at0eTVRk/FoPaCIS
	 BmcwnlXhnbbDNiOCVnQkFWdLVJGQLTAF044g02hn4MAs+rzW/soEKfaTTzJNYC+5Zte/i
	 rxLlw/b6F9kFCI/TNgyaUsqidIMuOp/l2F0CWR3h//156BufKClN68r0A0IRmoIO2ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMsjKUlA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05956070DBB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMsjKUlA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4BD1F00A16;
	Mon,  2 Nov 2026 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632936;
	bh=C2mBpbnVLemM5L5rEiqeWTkY0TlHmQQvKvlHKTMt9FA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZMsjKUlALHJTXL2C+cLO6xveiEiR41h2heUC87xOvZ90decxtKsVYWOqFBo83XULO
	 rBx0IxyjLliwHWXscjG2Z/eX+w9W+L8Oqs1IGFtDDtarKW0unQdzrJBKYC0E+7XwRr
	 jOpzvo8+wFLTUuNTWhk+y6bhViXwQ5r3iOc9zqgxafApxfqyI5Mx9EWELTLkWQauCy
	 r0bDE+64QMsveuj21znMm8FCo12VY2u2c2Ke37lzWYZqR0AEmuB/aE5SUf42FFnjZu
	 i/PssNhfVY7H13cP8xc7H3YtUzxIcySbHT01Z0SAANkQd8RiVbLa0bRzkb13M+EGKk
	 /9Adb5zu7qmkA==
Message-ID: <991e63e4-4230-40c0-a18f-6c0103bd225f@kernel.org>
Date: Mon, 2 Nov 2026 09:22:12 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Clamp the ATIF backlight curve to its 99
 points
Content-Language: en-US
To: Hugo Sales <hugo@hsal.es>, alexander.deucher@amd.com,
 christian.koenig@amd.com, amd-gfx@lists.freedesktop.org
Cc: lijo.lazar@amd.com, harry.wentland@amd.com, alex.hung@amd.com,
 kees@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261031153948.127016-1-hugo@hsal.es>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20261031153948.127016-1-hugo@hsal.es>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/26 10:39, Hugo Sales wrote:
> amdgpu_atif_query_backlight_caps() stores the firmware's number_of_points
> as data_points but copies only the 99 points that luminance_data[] holds.
> number_of_points is a u8, so a firmware table that claims more makes the
> custom curve code in amdgpu_dm index past the array, and
> dm_query_extended_brightness_caps() copy past the end of the
> data_points[] buffer it fills
> 
> Clamp the count to ATIF_QBTC_MAX_DATA_POINTS and warn, since a table
> that claims more is a firmware bug
> 
> Fixes: f729e63743f0 ("drm/amd: Pass luminance data to amdgpu_dm_backlight_caps")
> Signed-off-by: Hugo Sales <hugo@hsal.es>
> ---
> The other ATIF checks log at debug level because they make the call fail
> and the driver falls back to its defaults. Here the driver keeps going
> with a truncated curve, so this one warns
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 63088c072087a..4874ee864b807 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -406,7 +406,11 @@ int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
>   			characteristics.max_input_signal;
>   	atif->backlight_caps.ac_level = characteristics.ac_level;
>   	atif->backlight_caps.dc_level = characteristics.dc_level;
> -	atif->backlight_caps.data_points = characteristics.number_of_points;
> +	if (characteristics.number_of_points > ATIF_QBTC_MAX_DATA_POINTS)
> +		pr_warn(FW_BUG "ATIF: backlight curve has %u points, using the first %u\n",
> +			characteristics.number_of_points, ATIF_QBTC_MAX_DATA_POINTS);
> +	atif->backlight_caps.data_points = min_t(u8, characteristics.number_of_points,
> +						 ATIF_QBTC_MAX_DATA_POINTS);
>   	memcpy(atif->backlight_caps.luminance_data,
>   	       characteristics.data_points,
>   	       sizeof(atif->backlight_caps.luminance_data));

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks; this makes sense.  I'll get this applied to amd-staging-drm-next.

I would like to know though; did you see this in the wild?  If so I'd 
like to hear more about the system that had it and the system firmware 
on it.

What model?
What APU?
What system firmware version?
What AGESA version?

Some systems will publish this to SMBIOS and you'll see it from "dmesg | 
grep AGESA".

If it's a problem in AMD AGESA I would like to get it fixed for a future 
AGESA release.
