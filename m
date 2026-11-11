Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794416662;
	b=YR1jDcjEGaDuNwqjYiZL9f9Zs14iw9vN+vqg6vxQ6T7dZHJoFjt9VYfNBJJMHoA6y5fJ
	 M5RY1BwAeAkCSyThsfK96pe6zGDTKMOrGnum/pRvXecvCOF2QlXp0FCIM7f/bFuV3frey
	 PB00bq1yRae6Lq53Dk5JLOqZB0zq2N+nTmcce2XJjQ7JtZxgsOhkGAAPHQ95rFD8HPoqC
	 SYfCyzDtO7D7qUoEQorpyLRhPP3qRQzbQsBBibzBamqxdbkw7yQfH1oBrSpRjIMdw5tc3
	 KK8jlvfC/S6PsLtN5GZDGlxLUEoYqIIACTGa6HcbIcTWH1nVf/x5OEBDmUelP1tQlFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sz1fBEHUL8IGMULI0g/KGEQw0Ms9ofA5l42B+4Sj0Rc=;
	b=zAUxq0iP5LsFkNN4GR1n2T2MIpRPMPcn4J47u4d14Y5lXtPTnFSzbAeM75AzxEUFhUsd
	 GYJxa+zqx+J5mlfJqJDnSbHTjgMAGq++wznAqvt3ttPBJEQTKi4UItUBVBgxp68V4FW6s
	 zh4Ix3vGMwcfbhsGxrSIhytltzk/fivqCjUznvQOQwomMjexN//hllxa2FK+pepDc7krC
	 RISkXsRC0/kVsaRuiLV4ok9dlszpvSyaLyA2k9+chgn1J0MakmGG3Fy7bmZScjU2osXct
	 yEtlxK4sOwYE1WI3VIS19mcFFWw4qCu77VgOs0Z8hF5O4uIf3tNPw2JCSXpf6sFYpQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DbiXO5/q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC9F60A2620
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC9F60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DbiXO5/q
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35159e0092aso77439eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794416661; cv=none;
        d=google.com; s=arc-20260327;
        b=NNnZY/Np/kNbcMSrG+un5wsdlg+4u7BzhIW0lUkh70EPKQqlTNx/XMyViJcFMBXJ9E
         QZxjutX6fqsqaN4rzDS47PI/OcgxVQ13aMuscHQbDep98OuF8u0nDArfd17OEPFCvc4r
         +RLaEWGuS4ITZcNVmWaLI6atG4zb1Ssryv4KoIDfkqjJSipXRdBzTfI8KJjWjVKf1v/M
         1L8Q5R6qkeH7LHONAIwOyA9rW0DCEAHAo6ANLbLzvGGNwjWERGeJ8TvCzRJpRnLJXdLt
         1xm+gYTdvlwpMFD13nFXPfYBYWGBxQABW/7jTAkumBIzG51L5qRwyk6QMuA5msCcZT/7
         LGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sz1fBEHUL8IGMULI0g/KGEQw0Ms9ofA5l42B+4Sj0Rc=;
        fh=oBpdhUEnis8nhJT7qTYckKnZvv+e+GbumnjJYzLgIQ4=;
        b=dK5coSH6X/sD2cd1dxkFzJN7Vrv6uBHD/PFGZvkQB30GYUqPfZX5ksRFTCK4JzNlNr
         OlPVIhG8b05f5MfRv7OE8L2e0rYxqQaakaLQ/W2hYtU0QlUGoD79HWm440AcLLSZHz8v
         PUFwq9Rf8rvRU5isia/t9ZokY8fkWNUNn1z1eR5dvy7Iucckn0rEMAmG/WdWPz8BPUdg
         3Sp4pnBb/pc8/RQLNoqZTDrUAjtor1bwq8LGhzYCMTIgyLa1Sfh37RQ5Ls0X2adNDv3P
         wEfIO96+LMc4YYafCEoG/ZduFMV6HMk1f5DfhUVxnuMXlJ9lz7j7vYXD/d0lpAx7s+e9
         6z+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416661; x=1795021461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sz1fBEHUL8IGMULI0g/KGEQw0Ms9ofA5l42B+4Sj0Rc=;
        b=DbiXO5/qKP5+obHII9O4C5HJTKGFJGcDU6JfqAXM8n9EjMmsFsXtgtHkyDj4n61YHZ
         onMjS738COn4YbszdC9ZRBO4VgmvwPnKesJ93Trq7MDundSCM7HH83n+CVX8YZav+Oek
         5zE9tGRUk3nE84Lp6XShTCI9elU5NB5tLGkMaSY1Grwx0p4smiz0uMapVDT5yOScpz5G
         v4uZ7XksEYy7OkF+dqzwEKq3eA20VZzpsRFeNNAsX8NKMkHlFXUCoOSpGrIchQWffwRx
         Yz5f/Rwmd3/wkz8r+AF5yOo4X8MzTdnC/5avQWHOtMDfyDr6Ms7xraM1/xCyGci+8P6U
         kENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416661; x=1795021461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sz1fBEHUL8IGMULI0g/KGEQw0Ms9ofA5l42B+4Sj0Rc=;
        b=Q4DwA67CVKuMo+0MIZElCRprm6xvo0NnUM0Hd1Y4lPKaHKhaHNrxdjEp98ZCTd7reL
         dAOL0N7b0hEMsOFIBb3gLkrcO98NVbX5YDosi0FsKmVV6buuD8P0wrlcYf2TaCOwdofx
         xYoZHNk+vFNxy6xU5A4s7+SQOwVmhf7r5wtTDwHKYSlxoQszgBQx6lH7MrnlXE9YqbID
         8Fcfw4NMHJ1MCykSWXpG3URn9NwjXT9tvxwyIjqTiZxuW/tPukeJtggODrxS4PjIrs+Z
         MGk7wvN2jO8BBsmhMQeDMQYWsDWhdaPzJFUXMtJoEovyVSyiqi1KEmlrqfJ4T+blRLvg
         daSw==
X-Forwarded-Encrypted: i=1; AL+hErH3rLluehrezW07HT2saVvUx1KzonaifhK8oQhJ0MGHPeCiEFOVHnB2dccMkT3ZsF6iDD707A5LP/04CHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xWWvnMDAeZWef9xgi+CyXsBNtQ//5u3D+qt4p7qiRdG22SoSl
	0NFpefprEavFE21f/b6ZCVUAe+zKvZklWRNI4s3era5mihQN454cCXOMEgOAQFtjMQu13MOfnQ7
	Mzrk2CPf/NWcf89kfFeBba+lKuBSSiD7usQ==
X-Gm-Gg: AYBFou0RHHDfqDSCfQT65yrTIFUbzmb2cXxwAHDlXq2mNwYqXSoem3WmHa6WR0ekoNU
	vJ5cQbRons8me3h3rR7wIVpNPrLfN8vbUhLDRcPnaAz8F+41GDR3QNsrCZgYEq7h5WphYaJYuik
	ZOj8NkvuV/xQ4c5hxO1k0vr24lc8qlad22t8AgHKgf5WSSegZ2L0xN7tAVMWUZ4vRFQMj/yRgMX
	yFAtIf96qteedWAuDbdyG0RT2hgnOXvKqpBpsVG9LzNA5EeB3c4nKv0dIH3Wt89/RfC/UY357la
	psIZFLGF5eNbNMRoLvhEyQw8hJ3japZF73dRoSSwxAicNEoMnZqsKqmnr3p8tSQeZEYNllWT/Zp
	vbNunba3KIrElwYL0fcA4V//jKAPy3Ng97CakIcif8RI+fi33wpV8YZ8kUTzy4cSiDPuGAKVJUa
	xmlSe5q5sI4QQVfj2CEfJ75rQomziB6K0/Jhj2k005E0gkJ54rGhFmuNxqJ9o=
X-Received: by 2002:a05:701b:450c:20b0:17f:641e:7f6b with SMTP id
 a92af1059eb24-1b3c02cf135mr4314767c88.1.1794416660805; Wed, 11 Nov 2026
 09:04:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-smu8-sclk-fix-v1-1-47c6c0c8c2c9@etsu.edu>
In-Reply-To: <20261109-smu8-sclk-fix-v1-1-47c6c0c8c2c9@etsu.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 12:04:09 -0500
X-Gm-Features: AclHuK-qUsJmbGMoQgyzTNraWEn4fQl-1Spvcdq8IIpAnzBeguVmCP2_i5NrNHY
Message-ID: <CADnq5_OQfN6fqdW8OzhPAE=iOmy7OtH9VV=6-dxfwT5=R39OPA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: send smu8 sclk level indices, not the level mask
To: hornejd@etsu.edu
Cc: Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Eric Huang <JinHuiEric.Huang@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

Alex

On Mon, Nov 9, 2026 at 9:21=E2=80=AFPM Joshua Horne via B4 Relay
<devnull+hornejd.etsu.edu@kernel.org> wrote:
>
> From: Joshua Horne <hornejd@etsu.edu>
>
> smu8_force_clock_level() passes the pp_dpm_sclk level mask straight to
> PPSMC_MSG_SetSclkSoftMin and PPSMC_MSG_SetSclkSoftMax, which take a
> level index, as the other smu8 callers do through smu8_get_sclk_level().
> In manual mode, "echo 0 > pp_dpm_sclk" thus selects level 1, "echo 2"
> selects level 4, and masks above the highest level index are out of
> range for the SMU, so e.g. "echo 3", "echo 7" or "echo 0 1 2 3 4 5 6 7"
> do not select the requested levels. The original single level version
> sent 1 << level and had the same problem.
>
> Send the lowest and highest level in the mask, as smu10 does, and reject
> levels above those the SMU has enabled, as smu10 and vega20 do.
>
> Fixes: d7341ef66870 ("drm/amd/powerplay: add some hwmgr functions for sys=
fs interface on Carrizo")
> Signed-off-by: Joshua Horne <hornejd@etsu.edu>
> ---
> I found this while working on overdrive support for Carrizo/Stoney on my
> laptop (ASUS X555DA, A10-8700P); that series will follow separately.
>
> Tested on that laptop, 7.3.1 with this patch applied to amdgpu. In manual
> mode:
> - "echo N > pp_dpm_sclk" for each N from 0 to 7 moves the current level
>   marker to N
> - under GPU load, "echo 2 3 4 5" keeps the clock between levels 2 and 5,
>   and "echo 0 1 2 3 4 5 6 7" lets it reach level 7 again
> - "echo 8" and "echo 0 8" fail with -EINVAL and leave the level unchanged
> Without the patch, "echo 0" selected level 1, "echo 3" and "echo 7" did n=
ot
> select the requested level, and "echo 8" was accepted.
> On amd-staging-drm-next the patch applies unchanged and builds without ne=
w
> warnings with W=3D1, sparse and smatch.
>
> I used an AI coding assistant (Claude Code) while working on this. It
> found the bug, wrote the change and a draft of the changelog, and wrote
> and ran the build checks and test scripts. I reviewed the change and the
> changelog, ran the tests on my hardware, and I am responsible for the
> patch.
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> index 8f82d7c07e8c..5a3f697a37a2 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> @@ -1483,15 +1483,25 @@ static int smu8_store_cc6_data(struct pp_hwmgr *h=
wmgr, uint32_t separation_time,
>  static int smu8_force_clock_level(struct pp_hwmgr *hwmgr,
>                 enum pp_clock_type type, uint32_t mask)
>  {
> +       struct phm_clock_voltage_dependency_table *table =3D
> +                               hwmgr->dyn_state.vddc_dependency_on_sclk;
> +       uint32_t low, high;
> +
>         switch (type) {
>         case PP_SCLK:
> +               /* the SMU takes level indices, not a mask of levels */
> +               low =3D mask ? (ffs(mask) - 1) : 0;
> +               high =3D mask ? (fls(mask) - 1) : 0;
> +               if (high >=3D min(table->count, smu8_get_max_sclk_level(h=
wmgr)))
> +                       return -EINVAL;
> +
>                 smum_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_SetSclkSoftMin,
> -                               mask,
> +                               low,
>                                 NULL);
>                 smum_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_SetSclkSoftMax,
> -                               mask,
> +                               high,
>                                 NULL);
>                 break;
>         default:
>
> ---
> base-commit: 47df73aa49d1988c8f684b7caf8be6570e966844
> change-id: 20261109-smu8-sclk-fix-2eacba2cbfc0
>
>
