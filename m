Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794521881;
	b=4dcZesWlUgEAFF9RmlhGkSMeEJyl1C+d4yTNS7vEMqoGwnQDsGQEpPS5enk7ZGA2/xsv
	 /LOy6aH2rpDAt9jFjY7uszj0RQv6NTSNK7mMBUrpBXOFrLtSGnUOaeXBpQh7GzA/Zpg+a
	 NvXL5/XuhejLt+kzPp+G15/3bPhvOZv9qEDFevu9kFnFmX26KbUrQyP1sjF3ogHfXj0tS
	 BQioOlkY061eUUpqmZsMucOfGPI32X9kAAHJMvGMoZzACxzeGKLEJge+3LJyAkYu5urwM
	 zgcVw8suYo4M0eXimxB9KzrwJ8J0WTV3Pfx/ShPGEKcbqS79C9Aj/gnxiC/EkmXjz0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=psdFpjCIYItqoCV3zld+fU2KEcPb1MgRoHlxQPHBj2Y=;
	b=q1FYwOzKHmAi5cLeJSuEvJ1GK1ECnczm2R5+N0hh8zLLbQwhetHb2hj/BwR5nI+2iVyj
	 WBM0ZMEu1t+rRvSJkrpXTn/px8gThUGTedEZ2I4PDPLDCu7dYKjj38Y31VpsjsbY19fza
	 7V9MX++0xrBhi/Bt63elqL7dUQKKF58iZXUtOeenwT1h5ezkDuFXoHwfV3dOqiXULwAXU
	 keg78Srm3GQUrsAqZTH5uCSIfFECYkT8S68euaTXCCNLJ239K7ktAzhKct1K+sNNsb76p
	 BLV35eni9FDTcha2FIcC5cFPpaowATf/pXmrH0M/dYEBS7ydiCVOKAUlkRP+175hJZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ79AB8w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ79AB8w
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4f56acebb5fso27965b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794521880; cv=none;
        d=google.com; s=arc-20260327;
        b=cVIW26XvWqy8c5NEaDAGpQHUmTXK8lHP4jTT187hvzGRMLeSf/t2RFUQjn1EJV/BMg
         oTiDtWYl5eH6BrmYZffTZXWkCqZJ/zFqSH55ufzsO1AcRV0egSRvecvTDWKJcIoHzjAV
         dUBIjcrUiTTpP7NnAA6Kp8L70/UuBoCvKCILsaM/ngupxpTcyrlpiNGqXVRDZ7NamFNZ
         HEFLO/EG8j8nq0P+4HsMRpXlPmstabtSJUMFS0UlM9SJ9RwSMj5FyGF4+PyP73wBZanp
         kyDVCtrGoZej6N8rsfhWEeoxeijImKAT9uuFQrZDoirizfwfYs2sZouX+BLb4e5O9USG
         X6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psdFpjCIYItqoCV3zld+fU2KEcPb1MgRoHlxQPHBj2Y=;
        fh=SgygGeJg+21xF/NqKAlB9jR6jnTwdLsfmX3D9GdDaVY=;
        b=psxIBzuyDXcuO8u1exto28VI53cxV4lvrdrSZhOJWFRMmWNh57Joh1J2EuVq9Xgf55
         HEp2DLuWcIPJDPM9lNDHIMZhUBJ57/hWJSYQ3LNbc++vnw+D6bA/N1LWXrPejfGXzleg
         h1dH2YIEMq9ANSVJmVG15ky+33QNHmC/hEpuXbVjiY9IQMBrq1Lktk1zNLqrm19G7W1D
         9qfPXRvI3vKuRvJudTHv0IDxB5OLagzneGyWfgneDAseQhGPYujP53Apm4f/KfmUc/Nh
         tMN4Av5VgyCjhpbNrOQTNZ5DAN/XAV7XL+CUBsM9cij2LI55hIRoWrhIvwPbiPlT7YIT
         epGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794521880; x=1795126680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psdFpjCIYItqoCV3zld+fU2KEcPb1MgRoHlxQPHBj2Y=;
        b=gZ79AB8wb2IJPm/GjpbnMT2b+9ZD7ZlSf6CtLvr8kz8OJhBlMQRysJXtF3ofRFbNQa
         qO8gj1gsrxI9NPN/GSFXPDun4D9C5XFj4vulci13/YfwAznnhsKe8v4h8sZzCMltz0eM
         j+5qag6K/h65petITICqPr/Koblvam3W72jqsnT1qScijfdRsLaP1xgNlxsp1KqWyQAM
         ar2es0aIVPdstYk0rAHG41g+7t3gOD6Hdrm/Ap6PraULYZRYSiYi3lz80GnApwD9k+AU
         4gPoYycLBpnmjrZLe4ZrygGc9PIudFI6iQj+e683x8Hmr7KYBkjVx6Kb3p5DmDBtkWXQ
         zjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794521880; x=1795126680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psdFpjCIYItqoCV3zld+fU2KEcPb1MgRoHlxQPHBj2Y=;
        b=jf75NDOzZ7H1cSlk2yqkQpejDayY0r77wX0u0YmPz2LWf5nkEVjasdMfRvdwyPKG90
         DgaT0ug+zemqQFs7wi3WX5rZZqXNs+TBhTiNUsiyDvd+PptTKUw1KsgVg9MvDfXJKNfi
         BtDCmkLXIsYB1S04cL5TnUSi5UH1tqDCTuoH0sJehf7bMjlBCbVraAWi4OltUeqvuzF0
         cYtbIoSE41W0G/pPFzfQXYxwRIgOmO7+efiq0yrwrDBhy0Og+lqt+bX0wkp7xK36d6WZ
         s02HGrYbhpyu2VL0TBZnV/cmhWX3NyvQRhcJGrIpvYMos0/vwmNDxgWMkyEAlz1llFHl
         JdvQ==
X-Forwarded-Encrypted: i=1; AL+hErHQzWkU1nX+ZWunsg5cwY3FJDXrR9rRcMNKnAxXJVSMaDGZilRzPff2wMJf4MAK5VpUKnmHut8Jl6/LeaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dG8PPITj6eWKGwnZhbvBRBrjGK3nCgavyJy680nd5e36BOD85
	CWQLrgBE1z0eL6ded1SoBvwleYJeg3/Wjc8LEOSRbVu9XsdXlLKb/soAaivvN5TN8ShGN5WwR8K
	MmD9fOSpyBfvOi8ba3LFJqDba/0BwMD4=
X-Gm-Gg: AYBFou0r7+U4zTIeX/tJKfYR7/IG6gPZHNinm0zgl5e7LqG0xN9LW25+/sD52jqw7NW
	h1jEVj+inDa5xppjntoEgHwaQmt6LlHIqPCLv2+LePafhAg9QjQ8KJEjyDT1icM63VYnuNeIrD2
	nNRiIMkwR5BmgkAmvPLLqKe/6tNQh+7TduEhRQlest0gzkjevIo47ERMFCVzco/m03FGxYmsxhn
	2SjXz3XCCYDDoRZmWyAGQAPUS7v10j1XZ6KTC/9kc8JUFT2bwFLh5WJt0Hzu3bpoIPbLUO14ojk
	WDNZ6PKoEug3TAIJb8YbjWMWmam+Bt6iEN3Ft8SVCXXGi9FbfQvG6DZPdcKbs+2p7sDLo2t28vK
	RQGaHJRZs7LstkgUwDvqb7t54exI0z0Su05Rcb4W+ltCwlYJM5tTGR9n7kbAC2wou1qAJsbBtUr
	Dwwth66Rvk7vRvJNL8IvNjqTShVKRLa62bMfYneLkJ012DzMYYj6bbD/fCl5tv
X-Received: by 2002:a05:6808:2220:b0:55c:866:20de with SMTP id
 5614622812f47-56e61801b33mr711596b6e.2.1794521880319; Thu, 12 Nov 2026
 14:18:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110011256.157652-1-ayush37735@gmail.com>
In-Reply-To: <20261110011256.157652-1-ayush37735@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Nov 2026 17:17:49 -0500
X-Gm-Features: AclHuK-df_vccOaqqVAFUznT-7qkiRVcZLObgYhZxxXeA24pixt6PcSBum-qZPg
Message-ID: <CADnq5_OJSeR4vKDUmYXRZMTzftFuqzPPumMmYAubcDTd99VKVA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix kernel-doc in amdgpu_gfx.h
To: Ayush <ayush37735@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, 
	christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked and applied.  Thanks!

On Tue, Nov 10, 2026 at 6:51=E2=80=AFAM Ayush <ayush37735@gmail.com> wrote:
>
> Fix kernel-doc warnings in drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h by
> adding the missing 'struct' keyword to amdgpu_rb_config, properly
> formatting and aligning member documentation comments, and adding
> an explicit Return: block for amdgpu_gfx_create_bitmask().
>
> Validated with ./scripts/kernel-doc -v -none -Wall -Werror.
>
> Signed-off-by: Ayush <ayush37735@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h | 31 +++++++++++--------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.h
> index 5939e1fb3..96f4e4ce2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> @@ -181,7 +181,7 @@ struct amdgpu_kiq {
>  #define AMDGPU_GFX_MAX_SH_PER_SE 2
>
>  /**
> - * amdgpu_rb_config - Configure a single Render Backend (RB)
> + * struct amdgpu_rb_config - Configure a single Render Backend (RB)
>   *
>   * Bad RBs are fused off and there is a harvest register the driver read=
s to
>   * determine which RB(s) are fused off so that the driver can configure =
the
> @@ -191,34 +191,28 @@ struct amdgpu_kiq {
>   */
>  struct amdgpu_rb_config {
>         /**
> -        * @rb_backend_disable:
> -        *
> -        * The value captured from register RB_BACKEND_DISABLE indicates =
if the
> -        * RB backend is disabled or not.
> +        * @rb_backend_disable: The value captured from register
> +        * RB_BACKEND_DISABLE indicates if the RB backend is disabled or =
not.
>          */
>         uint32_t rb_backend_disable;
>
>         /**
> -        * @user_rb_backend_disable:
> -        *
> -        * The value captured from register USER_RB_BACKEND_DISABLE indic=
ates
> -        * if the User RB backend is disabled or not.
> +        * @user_rb_backend_disable: The value captured from register
> +        * USER_RB_BACKEND_DISABLE indicates if the User RB backend is di=
sabled
> +        * or not.
>          */
>         uint32_t user_rb_backend_disable;
>
>         /**
> -        * @raster_config:
> -        *
> -        * To set up all of the states, it is necessary to have two regis=
ters
> -        * to keep all of the states. This field holds the first register=
.
> +        * @raster_config: To set up all of the states, it is necessary t=
o have
> +        * two registers to keep all of the states. This field holds the =
first
> +        * register.
>          */
>         uint32_t raster_config;
>
>         /**
> -        * @raster_config_1:
> -        *
> -        * To set up all of the states, it is necessary to have two regis=
ters
> -        * to keep all of the states. This field holds the second registe=
r.
> +        * @raster_config_1: This field holds the second register for set=
ting
> +        * up the raster states.
>          */
>         uint32_t raster_config_1;
>  };
> @@ -587,7 +581,8 @@ struct amdgpu_gfx_ras_mem_id_entry {
>   * @bit_width: length of the mask
>   *
>   * create a variable length bit mask.
> - * Returns the bitmask.
> + *
> + * Return: The generated bitmask.
>   */
>  static inline u32 amdgpu_gfx_create_bitmask(u32 bit_width)
>  {
> --
> 2.53.0
>
