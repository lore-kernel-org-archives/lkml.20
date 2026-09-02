Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F86749EC7C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355251; cv=none; b=taiID7qzTbuKNhy1rXDF/D/2UdlVgVldg40qb44jD4bYKzLLLFUL6YUX162Bnfw+pxRM9cSUNthpueYgyhnBhGUxFybdQnvRRAmhxOEsFNe1GYz9AHdit4xP+4Qz81afnp+64T+Agu2OMrGABkhhTC8yqGqbbQSZPQae1OIS2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355251; c=relaxed/simple;
	bh=IDiJnaNSv8jFFSGPFWNKfWyUffWgDIC5p80ME+/KwE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nI/0xhC7DFj3FYyx7ioERhOXEILhsyAZl19nsTOq32rS/ROQqgHh8CBRnOagy4gpg9ILiqV7wOJVgtB52p+E+wKhiDh8PRMtrEjjnRXk+Gw+pB1xOnF4XO9Y8xU9IyF5CKUE37qGw49qsnnHJ3PINuQG6LqkIQP8Aw9zFCiBoF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8c4JS4+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8c4JS4+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D371F00A3A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788355250;
	bh=PfntGK0Pd27yYZmjSOOfteXal6DMATM+F3WKi0aCxxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W8c4JS4+salhXx9/ss4GN+KIjzok8hYwYXg1vWt18YsDJjvN2MyIoY/0FmENCxh83
	 QE1EgIN08S/NGVGMLRw+aWM312c7BXl6DQ1SJkwz4N7H+M8oU42alJIoPJHp4zjt39
	 NyHPMGdAewjPxkdldHQCRZfGqg1SYnAenQhQSltCI7Ou/wpwg9emdllejT6t9b++lZ
	 QNL51Ol0XHszkuu5n0Km1LFNlTTZE0D+CH6K9HES6xA13nguvIWZjNP4HTUTV0lr4O
	 o9F4w3/uUiBiwbSN0g6sUlk2IA6LaR2+gr0Zb3aaQo5i60nM9uVA/1/W0rvS+ORdZZ
	 4GF0pHBGgH9ig==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so1660203a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:20:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0sSQ4GK3/amQMRP1KtiTM5XhtqI2XtpR/yI1OuiyjaKOnRvu3UYh/MmjJds67gU9pC8C00SuHt8lFt/0=@vger.kernel.org
X-Gm-Message-State: AFuF++nzefmOCTfghxEVJiMx3YrpZpJi0td45XJS3pFRaPWCc/Ehv8aE
	0idH/0wxxoO62eZtlNijvhLcsQku3/H8/LpPY1zR8Sm9uimYecze8JTFysNip0pMtZwEC+E+rb3
	BuHC8T2srXTCGezSDMTNj+HDLWrkSFS8=
X-Received: by 2002:a05:6402:460c:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a68313fb0cmr3275027a12.6.1788355248744; Wed, 02 Sep 2026
 06:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902084827.2652-1-zhaoqunqin@loongson.cn>
In-Reply-To: <20260902084827.2652-1-zhaoqunqin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 2 Sep 2026 21:20:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5zucmAMt_AMu7SNSwyba71aDEfNNyCRdB08Aex3mukVA@mail.gmail.com>
X-Gm-Features: AcwNN1U7TpkTh_sAb3V6LXuxIS3qjgjI42abNvvxP1KMRexMBL9pIgjaDXgewJo
Message-ID: <CAAhV-H5zucmAMt_AMu7SNSwyba71aDEfNNyCRdB08Aex3mukVA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] EDAC/loongson: Improvements for Loongson EDAC driver
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For this series:
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>


On Wed, Sep 2, 2026 at 5:04=E2=80=AFPM Qunqin Zhao <zhaoqunqin@loongson.cn>=
 wrote:
>
> This series contains three patches for the Loongson EDAC driver:
>
> Patch 1: Encode node and MC info into mc_idx so that on multi-node
> systems, sysfs entries uniquely identify each controller.
>
> Patch 2: Get DIMM size from ACPI _DSM method instead of using hardcoded
> values, enabling correct display of memory size in sysfs.
>
> Patch 3: Add CS4-7 timeout filter for cross-node access on 3C6000
> multi-node systems to prevent false CE error reports.
>
> Changes in v4:
>
> - int mcs_per_node; -> u32 mcs_per_node;
> - int valid_cs_bits; -> u32 valid_cs_bits;
>
> Changes in v3:
>
> Patch 1 "Encode node and MC info into mc_idx":
> - Drop mc_idx_u32 temporary variable; pass &mci->mc_idx directly
> - Rename device property mc-per-node -> mcs-per-node
>
> Patch 2 "Get DIMM size from ACPI _DSM method":
> - Fix subject: get -> Get
> - No code changes
>
> Patch 3 "Add CS4-7 timeout filter for cross-node access":
> - No changes
>
> Changes in v2:
>
> Patch 1 "Encode node and MC info into mc_idx":
> - Use char other_detail[64] =3D {0} and drop the else branch
> - Put snprintf() on one line
> - Initialize mc_idx_valid =3D true and drop the else branch
> - Validate mc-per-node firmware property is non-zero to prevent
>   division by zero
> - Wrap pvt_init() function definition to satisfy 100-column limit
>
> Patch 2 "get DIMM size from ACPI _DSM method":
> - No changes; rebased on top of updated patch 1.
>
> Patch 3 "Add CS4-7 timeout filter for cross-node access":
> - Assign valid_cs_bits before calling read_ecc() in pvt_init() to
>   prevent using uninitialized data when establishing the baseline
>   error count
> - Add bounds check for valid_cs_bits < 64 to guard against undefined
>   behavior when shifting a 64-bit value by 64 bits
> - Rename device property valid_cs_bits -> valid-cs-bits to match
>   standard DT/ACPI _DSD hyphen convention
>
> v3: https://lore.kernel.org/all/20260812064139.1231-1-zhaoqunqin@loongson=
.cn/
> v2: https://lore.kernel.org/all/20260805085414.1482-1-zhaoqunqin@loongson=
.cn/
> v1: https://lore.kernel.org/all/20260730063035.230686-1-zhaoqunqin@loongs=
on.cn/
>
>
> Qunqin Zhao (1):
>   EDAC/loongson: Add CS4-7 timeout filter for cross-node access
>
> Wang Jinwei (2):
>   EDAC/loongson: Encode node and MC info into mc_idx
>   EDAC/loongson: Get DIMM size from ACPI _DSM method
>
>  drivers/edac/loongson_edac.c | 82 ++++++++++++++++++++++++++++++++----
>  1 file changed, 74 insertions(+), 8 deletions(-)
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.47.2
>
