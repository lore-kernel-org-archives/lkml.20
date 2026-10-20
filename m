Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792501713;
	b=CFfPlnPSNdEA1ia4C0DJvpPJVLjUqaj7HWm+MF1oOuNeO4hX0Yiovk2njXIuz/KRbgDw
	 OObimGVSG2w9UpqxWcsYHobKCm9pKcemgWCg4SKzovH5h5Ei5RrqgqnZclu1MOSZlwBuH
	 ERuM6bmf3DfJjIq0c6R13XQTMnpVzi0x2+Aoz6q2h+6lc+0Y2D4P6E7JaQQL6h1iBLKDT
	 pThMwfmJeNF3xpR8akbeNRSR2NA2gOJ62P3v/cj47MrOC7bBF9xFovvWrcByLeyVuP6SH
	 Zv4FzJfhl79LFTZPibndfpCmoB8vk7MyNpKXNQ7wKzTRj+h5zj1ecPPAlWNnQKtY+OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BQPT2RK/Bsa2DXu0Idtw0TN37aSAQhniynYTnVnEFQ4=;
	b=ACxdIzrUVpz6DRmZR8rAA6ScryfF7soQpnKRCm+9N8/Ma66DILlM1tQj9owbctj5P/sN
	 4d/QSTBOz1jkc8JrJiJd18hvw1/2B40nyQb3MdSYnzXZuDETHot6aEH9xcP8aA5gB+wQf
	 mNmJrxAZr90w5A5H8/ihKst0OTtgm6tVEmwINfuP+FaD/exeIZlTOxq5th4jk8GKo5TZI
	 sSh6/S6mKoMG9okB/J975eNF2rWagLS/Lt/KntIPN9jl36nKPUKrvaZ6dWZYn0IVYHqyN
	 I63pn4c9KNL5FtT2+l3xAeAcEuCYpafVlL09r0RbR48vVMhFMBkLDFbbJdon7PXZdzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lCwJbreo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E0606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7E0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lCwJbreo
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1438dbb05c1so107888c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792501712; cv=none;
        d=google.com; s=arc-20260327;
        b=dz0Hvv0/B8+ZneUNa35CSMouMkSv/DAWOi8sG55FBgBa58U92A43vkcY4shtVzKS22
         C4X1f8nLw5QAVV6CcPZMclDpxWMdFqPRaK+LfPwCzC+vQtiUUEqEu/kv2Txks+rwYrfA
         /Om6G/aP43QMCwUNpKrOSEXu7vY44psKh/WbFXkUBCCvfI1FwOCZCOqpMjW6A47/Dli1
         MVswYA32Ec+5YCwgK/1ZYU5HQKcMJ7romfwlZui2vjxLo7KOaCQ/2tiWgganwNOMXVcf
         YDdsQVg0O+GVgeXmt/vsfBySdohAbQ3LUU8YwJ9j20HtO3+9kNUEIUNTLcMih+PchqEQ
         lKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQPT2RK/Bsa2DXu0Idtw0TN37aSAQhniynYTnVnEFQ4=;
        fh=ANiKS9PJOQ5QfbDDGjB4LpnVpjxuiDPrIt76cwKZ+V0=;
        b=lTKWKk4OV0h4adee1sbgFCxa51N9O7tKz/aBL23SFRMiN5A5ZhY/jVpG5xNe1vfSo6
         LBmOmBIysaWjLJWXltc6/yvl4nFqtaH2Bfe3kGUzHLyEBKPKDya2xuMpuhH2r81Tsmxx
         mOZ4gVvwYvUdVln5z+6goy0wYAxk93Ldwf8Z4niB2XwwggYzdEe0kOzsqx8lfwX6v9fR
         8QKqE88oYuLoo920GIxNU1xuIq4pV1B1uvszF9zGZ5n+oiws7+BBqBW/FeIHIVZup5nj
         aSB+IUjtzCxqj3eOYJUE3rPl0JjVQ2mp8DbqsA6ZP2CIuxYpaHDlMTpc98L34+jIxoHw
         APOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501712; x=1793106512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BQPT2RK/Bsa2DXu0Idtw0TN37aSAQhniynYTnVnEFQ4=;
        b=lCwJbreoD6jkvC9iHztmBnjisNKCUftji9Tiz6MgM3dsvC6aIN+CmtmA3yN9gmYCJj
         cCRPvWaNodkcakLRRWYj30Yv3kLvz5j6UiZ8ETl+Msy7pdiY5THgTE/A7M5rr403ohY6
         9Iww7Rk1ZhX2kxHIo5vsENaAJDzfI8f2Rygv5u36njcQJ/O9l1R4M2i/INJswQstONIo
         St4Xr6o1OBT66dZ/oFfptx5PCOMzIvMVR/jZtM1ix0n4MGnLDjOvdzsj6GHkeBjpalaV
         ovPT9BO5pQNWKOKVLONc5iG+HSVjs5O/goqZDM4B82Fdu9ra/gNk3pNFUkCh/kC/OLlt
         Ze6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501712; x=1793106512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQPT2RK/Bsa2DXu0Idtw0TN37aSAQhniynYTnVnEFQ4=;
        b=yXV/lYJxi9Z2cDMK90fdmXxmpq+X9N7VSeix2A22nFDOlDkFeIhjcEQbkQdOn/FGwI
         KyVaWzggdSGQC9W6K+uqk6D2+k9wgivrY6DKXf5Rg/UL9ks4Fm38eMAX8VRubztpHpR4
         2RhImuOvV0Ms5qlafVTMuUsRxz/FhRhekWb8VzNUvkWHUKrJrP6WNa+uTa8wJ4k62QYC
         bZqXeOYvpnCbPQRPNYQzVFsPkSx9Upo2SDIExfSzXjZEaAA8YfED0WOm69997I2rr708
         rNPlzCPrAmdlvKGCkoLcD3ac3i+3baIDaQpOxpMYg8I80VzFiIjT+DD/IFJbfTpWBN6p
         U9IA==
X-Forwarded-Encrypted: i=1; AKwUvBzphxcdxisI1u3wAv1jpgx23nh5DzAHDb2/5R1hTNKi6WhWXcML/viaujWeYTAbWOHgjHbJBCUESMjNW3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVhb4bCIckkcTbRWaiGwFITRE+2qWCYUPmJpC5iu+lSsscfoxU
	VqocZmrE9BtCdqxbiLVPI2XCGH91QF9OhkE0PHKbECnbybJ773Tlse2+uDWRNO/ZkxdlyvDPHO8
	JoWNfEAFEKI7j2ezse3ctyjLFqTRiWXRZga66
X-Gm-Gg: AYBFou22KLi45BeTUbKnWvdqKFo4G+6Zcah80JDSlc2rhfsLHjgLlEuFQXL33hdYcWJ
	7Cbe+vA8Zefo/Ylp3AUW6EKcnRnd8mEu/f2R852zXKxGu9a3bFgp/HVvaGvU7HPetekxCK1mswx
	oVx5GpXcpj+z3ReJLyIzN+5UZH9hpNmBUik78TIERIXF9E3nncusQ2eUjpFw/p4bvfM6ka34cix
	ACLdsLMDSIeWK90+HuLr/lIuzEK4JXr2c/KiyUeaKfrMUiyQH6xkTD7RbxT10ETShB7V1jLpiVb
	OIGqhEne2Hc5/j/I7Qm4xkDML7q8ufAB3rESWDpC9H+C2UhoFEWqNC1boF8khbPuJkh3BLjU2ih
	f4NM8qSSxOu4T42F6FkU2Aw+9a7XShq51DANiwrz5KfSrnzlxGXUBU6QKWXN13+rqxUFBZCod8k
	ssPTJoKZ9FHYmv0aTgGURuZB8=
X-Received: by 2002:a05:7022:170a:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-185106a1606mr23666645c88.2.1792501711533; Tue, 20 Oct 2026
 06:08:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017130047.42080-1-emmaonana18@gmail.com> <20261019163538.28793-1-emmaonana18@gmail.com>
In-Reply-To: <20261019163538.28793-1-emmaonana18@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Oct 2026 09:08:19 -0400
X-Gm-Features: AclHuK8lOvRZuawupQHM8p5lVPKffeC8_Y4DUib8gb6AoG1RAy7GmZeIuewnb-8
Message-ID: <CADnq5_OP+ogqr8JHRNvqE7suYLjmyogWPXiejZJrSUv7KS2DZQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amd/display: remove unused cgs register accessor typedefs
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, alexander.deucher@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, paulmck@kernel.org, rostedt@goodmis.org, ast@kernel.org, 
	peterz@infradead.org, gregkh@linuxfoundation.org, skhan@linuxfoundation.org, 
	Arnaud Bonnet <abo@medichon.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Tue, Oct 20, 2026 at 3:37=E2=80=AFAM Omokefe Emmanuel Onanaroghene
<emmaonana18@gmail.com> wrote:
>
> kernel-doc reports prototype mismatches for the cgs register accessor
> typedefs, e.g.:
>
>   drivers/gpu/drm/amd/include/cgs_common.h:89: expecting prototype
>   for cgs_read_register(). Prototype was for uint32_t() instead
>
> Each of the four typedefs is used exactly once, as the type of a struct
> cgs_ops member, so they are merely an unnecessary layer of indirection.
> Drop the typedefs along with their kernel-doc comments and write the
> function pointer types directly in struct cgs_ops.
>
> While at it, drop the unused cgs_handle_t and cgs_get_firmware_info
> typedefs, and document the members of struct cgs_firmware_info.
>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Link: https://lore.kernel.org/all/981f01e1-0c3b-4854-9d72-8bf22af9fc64@am=
d.com/
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> Tested-by: Arnaud Bonnet <abo@medichon.fr>
> ---
> added kernel-doc comments for struct cgs_firmware_info
>
>  drivers/gpu/drm/amd/include/cgs_common.h | 74 +++++++++---------------
>  1 file changed, 26 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/cgs_common.h b/drivers/gpu/drm/a=
md/include/cgs_common.hZZ
> index f40b6a03fe63..79522e1bec4f 100644
> --- a/drivers/gpu/drm/amd/include/cgs_common.h
> +++ b/drivers/gpu/drm/amd/include/cgs_common.h
> @@ -63,6 +63,14 @@ enum cgs_ucode_id {
>
>  /**
>   * struct cgs_firmware_info - Firmware information
> + * @version: firmware header version
> + * @fw_version: firmware version reported by the IP block
> + * @feature_version: firmware feature version
> + * @image_size: firmware image size in bytes
> + * @mc_addr: GPU address of the firmware image
> + * @ucode_start_address: ucode start address (SMU firmware only)
> + * @kptr: kernel virtual address of the firmware image
> + * @is_kicker: whether this is a "kicker" (k) firmware variant
>   */
>  struct cgs_firmware_info {
>         uint16_t                version;
> @@ -78,45 +86,6 @@ struct cgs_firmware_info {
>         bool                    is_kicker;
>  };
>
> -typedef unsigned long cgs_handle_t;
> -
> -/**
> - * cgs_read_register() - Read an MMIO register
> - * @cgs_device:        opaque device handle
> - * @offset:    register offset
> - *
> - * Return:  register value
> - */
> -typedef uint32_t (*cgs_read_register_t)(struct cgs_device *cgs_device, u=
nsigned offset);
> -
> -/**
> - * cgs_write_register() - Write an MMIO register
> - * @cgs_device:        opaque device handle
> - * @offset:    register offset
> - * @value:     register value
> - */
> -typedef void (*cgs_write_register_t)(struct cgs_device *cgs_device, unsi=
gned offset,
> -                                    uint32_t value);
> -
> -/**
> - * cgs_read_ind_register() - Read an indirect register
> - * @cgs_device:        opaque device handle
> - * @offset:    register offset
> - *
> - * Return:  register value
> - */
> -typedef uint32_t (*cgs_read_ind_register_t)(struct cgs_device *cgs_devic=
e, enum cgs_ind_reg space,
> -                                           unsigned index);
> -
> -/**
> - * cgs_write_ind_register() - Write an indirect register
> - * @cgs_device:        opaque device handle
> - * @offset:    register offset
> - * @value:     register value
> - */
> -typedef void (*cgs_write_ind_register_t)(struct cgs_device *cgs_device, =
enum cgs_ind_reg space,
> -                                        unsigned index, uint32_t value);
> -
>  #define CGS_REG_FIELD_SHIFT(reg, field) reg##__##field##__SHIFT
>  #define CGS_REG_FIELD_MASK(reg, field) reg##__##field##_MASK
>
> @@ -133,18 +102,27 @@ typedef void (*cgs_write_ind_register_t)(struct cgs=
_device *cgs_device, enum cgs
>  #define CGS_WREG32_FIELD_IND(device, space, reg, field, val)   \
>         cgs_write_ind_register(device, space, ix##reg, (cgs_read_ind_regi=
ster(device, space, ix##reg) & ~CGS_REG_FIELD_MASK(reg, field)) | (val) << =
CGS_REG_FIELD_SHIFT(reg, field))
>
> -typedef int (*cgs_get_firmware_info)(struct cgs_device *cgs_device,
> -                                    enum cgs_ucode_id type,
> -                                    struct cgs_firmware_info *info);
> -
> +/**
> + * struct cgs_ops - Common Graphics Services operations
> + * @read_register: read register value
> + * @write_register: write register value
> + * @read_ind_register: read indirect register value
> + * @write_ind_register: write indirect register value
> + * @get_firmware_info: get firmware information
> + */
>  struct cgs_ops {
>         /* MMIO access */
> -       cgs_read_register_t read_register;
> -       cgs_write_register_t write_register;
> -       cgs_read_ind_register_t read_ind_register;
> -       cgs_write_ind_register_t write_ind_register;
> +       uint32_t (*read_register)(struct cgs_device *cgs_device, unsigned=
 int offset);
> +       void (*write_register)(struct cgs_device *cgs_device, unsigned in=
t offset,
> +                              uint32_t value);
> +       uint32_t (*read_ind_register)(struct cgs_device *cgs_device, enum=
 cgs_ind_reg space,
> +                                     unsigned int index);
> +       void (*write_ind_register)(struct cgs_device *cgs_device, enum cg=
s_ind_reg space,
> +                                  unsigned int index, uint32_t value);
>         /* Firmware Info */
> -       cgs_get_firmware_info get_firmware_info;
> +       int (*get_firmware_info)(struct cgs_device *cgs_device,
> +                                enum cgs_ucode_id type,
> +                                struct cgs_firmware_info *info);
>  };
>
>  struct cgs_os_ops; /* To be define in OS-specific CGS header */
> --
> 2.43.0
>
