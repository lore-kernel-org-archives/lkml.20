Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05ED3C09F8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903687; cv=pass; b=Z+kP66BHudqEfjhvsLUBUN3ATDT26aWNuZm9zdol5JTUD7NPwjCzQQdY+bSmaxiwuSUKbUEPKWgbvUlQCNHaqye5ywcJuK8KR85pKNYIUzLjVCGC/6y4Op8FLXQuEc5PH8aswVfsifCl8SivsVbcnxgHi1sGbPXqWhhV4DJYOWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903687; c=relaxed/simple;
	bh=1JixTpiJnJVrlw6G8kCLXK3cdOVirj1OoF0J2e51dW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpHNhw6qzMAfXBeHAn+0AfQOAUIBBisGOUX0mR+XadzJq/j4KMW/BIvQUX77lcUwVmTg1bMHeVTIqscuGkFBi/yg8vot5UPnjkHnamPT4sLdq+A94KFNCd51WLwwhCw9u+N4/jHydy/V6vYlTQ+c9lxVVwlGXBlYZSLNd2gZAXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFg6gEzZ; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFg6gEzZ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so519688a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903685; cv=none;
        d=google.com; s=arc-20260327;
        b=W88vNJCxmwgiBrmL75JzzlR7ffHz4Fj0qLYEASGznoTFooPxAbmgT1LOVaJBEYsXNA
         MM4GMMU+oWLCfvgjKAQgCt9yiCpbnzYEeC939mbBJLEKaZfFPFFfWICamAG+i8Xj++Se
         P/L5KPepA11xlci+YJuUrFBuoC6TSPbbPnRmZUwUBgkwasit1FZSmPOxyEubhTIT5ink
         yPFol8ftLYVXuObb+RnhtJY3+FTG4KOPPABy3IoUyke0VoQkSe5+94npAbcj/txRuxGS
         gLPYEe0Y5j5kOnfZ9SjBw7k1B7HW/KYNqbgpR9eD9819fRCyAe6s9Zl7cslJGu0v8I8l
         SKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8rQkd5Au7Y+YHu9zGBjXy6N5KCdPe9r93Bw6y8CKr6U=;
        fh=I6guC2oowAjGraG+Sdoao7y2ZVRpKdLomfnfYmSX6ns=;
        b=gB5q4lHGU8LeFBbGBsgsrBKDmUvCYG0+lnk/kOC2FySQ+QkWw2j2oCoE3CFkUt6pRO
         dpCD5jujlZUbaEb38qTu92lU5AlUZLs2QL9EYM5NpEYmULqKCwfziDW2d04ggNVF3KI3
         bLfhZlNjinCtyJJWhTmaZaLLHy6IHpCw2v/EqbS9nT5SpgPIczKgwhmfrQqNLJ2axmUI
         MGMgtDlTNYJYfJEP33242Kd3Q/OvBllgpdnkzMJieLlSa2xbBjqzQKc/y8YE+dwVRH8c
         otKwEwWkXhJwQZL3hMg8YvvuwQ99Cewq4QKeuJ+k+idDAjClM5Y+2XkFNnhxf0wpadC7
         BOhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903685; x=1789508485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8rQkd5Au7Y+YHu9zGBjXy6N5KCdPe9r93Bw6y8CKr6U=;
        b=QFg6gEzZQ0GxxNPBhsHk+iH0kBvwSMHpVRj0thI8qw7Yw6jzYu2YbQteWSGoxvMEiW
         mABjERkafsp8s/Erkaz2mVbVZzfSH8K/4OZs/MdxRE453S5wtmVXFqHfo18n44DBL2az
         szFC4VqN8wC56zSZCXxtj87pM6n1eK3M4JT8LmaIKkj+hcysDAoS5fCnYqnNvHycrP8o
         H/BholSDH6GpG8MAmH6uBTFygBxh2gk/DWc8JnTl54b0+qikLK2lqqZSj4Y1283bl2PC
         VfFs0t7ds/StT6Tjinkm96scM6tVa5OLVgFtCQyyKEEpt1/blkLFjIemSUYxRsMjrHWy
         zAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903685; x=1789508485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8rQkd5Au7Y+YHu9zGBjXy6N5KCdPe9r93Bw6y8CKr6U=;
        b=ShKxFFsViXHhGbnVqT5TGEH0dTgN0tpTwcgt3cpFgo+drLZYIlSxsz+eKd0TJGt94r
         AfLnEIDVm6zxWOaoUwVScP/HUBoKvrKqtmDzCYUfo1XtNybl5WHeQi6KijhmE2QCS97X
         m5OB0h1oUFDuadWVS7ChU48NHFMGVHKcJ/c3pjOZh+hD/oO0NyHRD7d3UblfU2Y5nC+H
         XC3ecmrTb0uSUp4RWBzTImhtwGDgpuKjAc3BCYClYvbtyxneOSYaKKSKHytj1VQ+sHFy
         WIcEAJxrp0JKXQYgmeD8c6SD0+Af3dqUWBNe5FGGNPWO5zbX9IskEjPltzLvOMfABI9N
         /nHg==
X-Forwarded-Encrypted: i=1; AKwUvBy/lVDPA4QelmyjnwXxOzEYevuBX2+wis3JdrmzZT3FerPc6BF7EALMIbOkZHMWbfebDs33lf5PuBa1Ko8=@vger.kernel.org
X-Gm-Message-State: AFuF++nmrAz81aK2CzR7u4Zm3nn+JpOaluDMgxBJOiFNtUwdm9s2ipe5
	YbXXaa3SFH0Ue9+LYfO9uIbFTPdH+w0Yd00XfR7cCLYRjvgOCt/RrcYmpk+3Icf2VQZop/xAcel
	3ISrycyL2K6k5oAxva3+MzQ26xO54Anc=
X-Gm-Gg: AYBFou3JV7MVNAoQXwROxkBg1qaj5ly8I/ca83JgEXEBjJDydxhq88PpbcMe0aYoNeN
	YLJvo5pwi0WHUSl2CSxEaoxcBKSMEwXuxfZrykVIRnIlBnbHb1U4ajTzIFn80uu5yarAoMselZQ
	J2BJUWQl97+sRYW+rdogW8+NhHIgyDfwFdMEkaPw7Ebe3LJPUGlSOepCZr/oa6Jal63OrbvyPtS
	KVdO1p2d4RjWfdG1LHfZ6lSOLi+zmsf+8mBY6SBxCt/GlYaC5OhZqHuiHdpB0XdPqb57E1IQchC
	k5LgMDpPOURtLzPFuINlrmIyKAalOwrEsF3tIgnybE2HD0Kr2x7Qy2Jk+yhjX6fkCtYUEpOpB7h
	ZoWXkYcMTD3DUGFjjfXtMQbLEy82zCLI=
X-Received: by 2002:a17:90b:3a48:b0:38e:480b:99a5 with SMTP id
 98e67ed59e1d1-39b3d5e53d5mr20820843a91.2.1788903685198; Tue, 08 Sep 2026
 14:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-amdgpu-ras-wifpts-v1-1-7f3b4528f12c@kernel.org>
In-Reply-To: <20260903-amdgpu-ras-wifpts-v1-1-7f3b4528f12c@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Sep 2026 17:41:12 -0400
X-Gm-Features: AcwNN1XCfKRR9Pp_3osr-NXErQWimzUuIEmAIhBaOCMAWbp5aPXAHcWmLCqHV_s
Message-ID: <CADnq5_NZKS0Ng_8sy=AS=Jby_6dCwVKMziyvRgK8XHVYEQRD1g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/ras: Adjust second parameter of mp1_v13_0_eeprom_send_msg()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 3:40=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> When building with -Wincompatible-function-pointer-types-strict, a
> warning designed to catch kernel control flow integrity (kCFI) issues at
> build time, there is an instance around mp1_v13_0_eeprom_send_msg():
>
>   drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/amdgpu_ras_mp1_v13_0.c:157:25=
: error: incompatible function pointer types initializing 'int (*)(struct r=
as_core_context *, u32, uint32_t, uint32_t *)' (aka 'int (*)(struct ras_cor=
e_context *, unsigned int, unsigned int, unsigned int *)') with an expressi=
on of type 'int (struct ras_core_context *, enum ras_fw_eeprom_cmd, uint32_=
t, uint32_t *)' (aka 'int (struct ras_core_context *, enum ras_fw_eeprom_cm=
d, unsigned int, unsigned int *)') [-Werror,-Wincompatible-function-pointer=
-types-strict]
>     157 |         .mp1_send_eeprom_msg =3D mp1_v13_0_eeprom_send_msg,
>         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> While 'u32' and 'enum ras_fw_eeprom_cmd' are ABI compatible, hence no
> regular warning from -Wincompatible-function-pointer-types, the mismatch
> will trigger a kCFI violation when mp1_v13_0_eeprom_send_msg() is called
> indirectly.
>
> Update the second parameter of mp1_v13_0_eeprom_send_msg()' to be
> 'u32 msg_id' to match the prototype in 'struct ras_mp1_sys_func' (which
> was recently changed to support mp1_v15_0), clearing up the warning and
> kCFI violation.
>
> Fixes: 11a948c7817b ("drm/amd/ras: Support retrieving bad page info from =
mp1_v15_0")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c b/dri=
vers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
> index 7aa818a433f6..548594373d0b 100644
> --- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
> +++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c
> @@ -105,14 +105,14 @@ static int mp1_v13_0_dump_valid_bank(struct ras_cor=
e_context *ras_core,
>  }
>
>  static int mp1_v13_0_eeprom_send_msg(struct ras_core_context *ras_core,
> -                               enum ras_fw_eeprom_cmd index, uint32_t pa=
ram, uint32_t *read_arg)
> +                               u32 msg_id, uint32_t param, uint32_t *rea=
d_arg)
>  {
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)ras_core->=
dev;
>         int ret =3D 0;
>
>         if (down_read_trylock(&adev->reset_domain->sem)) {
>                 ret =3D mp1_v13_send_smu_msg(adev,
> -                       pmfw_eeprom_msgs[index], param, read_arg);
> +                       pmfw_eeprom_msgs[msg_id], param, read_arg);
>                 up_read(&adev->reset_domain->sem);
>         } else {
>                 ret =3D -RAS_CORE_GPU_IN_MODE1_RESET;
>
> ---
> base-commit: 8fad652e7235dbf3bebfab1460610b0b0e75b199
> change-id: 20260902-amdgpu-ras-wifpts-c8628642e565
>
> Best regards,
> --
> Cheers,
> Nathan
>
