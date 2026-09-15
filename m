Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6FB377EAC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481658; cv=pass; b=IFdA77dwJ0nIXuNXOgadB8mIJ/PIEZsmsv5h5ibWOdFEOy/brOz7LPVx/6MBNYd27j/IckAgwgwvzkz8T7MjyZI2YMGU65hpAs4PE8WInDtEl6FknIK1dyq1UJrDozvCcCPoUD0ujKY/hEUD6kfsLDqBGuQfD0/Ltc2oTZeWRJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481658; c=relaxed/simple;
	bh=tFqEk2khVPQVjDBFUGJCwZMC/Lwy8rG2t4A2q9rwZMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUNU4fJUEbxvztWWG0jippCuTB6AgXglTpxWCxONUrIIA0GfiUcRPPQxuGwy9MLTRR6x7G+RCUJR4Z3UPiXT9UuvkoTh6WXDaZRk4A6DGsi0OI1YHUyox0ZpYqvyTlReaCD/3GBB2MyJDbxnDvWIwsE2LLQnedijquqZE0ZloPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rL4WGZRg; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rL4WGZRg"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97cb5c91d5dso79277241.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789481654; cv=none;
        d=google.com; s=arc-20260327;
        b=TTvvaD3Jvi1wCmUXoU+FppH0FGLuCkRNUMyzNeCEYV+kUh/tJIMYcu3yrjlsqOdWq+
         4hu0fz7cn7y0cV7OoQB/+jTm8S5CUiHWGQe8OdcW5XzU48WbW1GyAQDyds95UiH5IgeC
         GSna3/GTGDAbFHcsrsDeHiXfiqpFxfgpZkaq6oKv/Adz+7W4YRR+z+fOnfFQgO9XIbiU
         erowoqgz4F7/XzPnLTXpcL0tcQyX2eJPUbSUzMPpQT/hqGAKSKX7rM6e1gLy+YnuN7vT
         5Hs3OyCGtDY4tnwr4CAyIdApA/JhAF91X3mGysBiPTPqguk6tfxJOt868pOeIdq3Ufkb
         mjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWQQ16n/Y9tSUunBn+e/2NyOzrUzmECVOOglAlx98Qs=;
        fh=nJx/fDFyQbyU1pdztysZ5QC/5Y33Lo3m2shAM0ZI16A=;
        b=RtzGOAJ/bCOdFCnT+DuTUcd7oD82TIxqpztHN5EPzesrY6+WWzeHFaTeZJCKRd5cRA
         ++m8lOkt/z7oRDJD/hRQhMNCd2fCakNetfa2SNgD3Pz9snSKyHM+sj5CrUj1Ho9YMbE/
         BCVW1bIhNA+62TYCmK5hGs2pZTdUv1oc1qb1wYdNhRfgwGq+EKOLxgLj5mw28/RbT7xM
         BMbeucuifLYKCDtg8t6OsXCkNjFIcCyi9VL3lveCEmlAVyXSaJyhiG0X2I7v+0KR7c5p
         +E7EsCIUa6+nysqKirnf7VXhd7e42+s08MH1TeZHWO8AG5sQ3stwA7kb9tUxUJIarDtl
         IQCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481654; x=1790086454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWQQ16n/Y9tSUunBn+e/2NyOzrUzmECVOOglAlx98Qs=;
        b=rL4WGZRgKIPbbZwh+wxIizTCyn7ipa8Z4wDuYDJkDBJOJGMgwhUPpQzVmfQdeYdSfy
         Dmd/q9uwKzvsUawiV8D5et6mO9V9asZ0tEzKt5Pe9OLR8PwuKkDqFNDZCYMsi30y3dUN
         guwnvA9ZaX13KoyUaWH7Hg2JgF3UGULOgfsj17w1N8o0w/YAPkBcuvEzE/55pT3wBYlY
         F6DQGx6aUo/rpl1hGzaUVgUkXNFh5sUrPY7jojSjufgsUpjh0CwCjubpz3mOPsChhoYe
         X/+33n1QnqmiJthCNDisAgMbLYQdweWqsLxXznC4mMJJ09MQT2slCR7eJglUU93WX9We
         JmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481654; x=1790086454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWQQ16n/Y9tSUunBn+e/2NyOzrUzmECVOOglAlx98Qs=;
        b=HWyZpCvrI1Fzj+8DHFMcZ1SUpuuD+KNERCIusqfKRBZ6GPnKJJAOvv9daDPAMLOE4c
         NlIqjwMX9LLvwwfs/1b95J0GNO/oaOAtVAA2ES5ZENIy7mYYmpl7QWuCw9cNcCuEKElV
         7V7Z/GQit8LyhD/3K0yJAe85SH+Otr8OXzpw0fxQLoXzZ8XkCFPwGMj3c1OcLOHyrrLx
         PxPSg0pjxvM2P5dciq+Eq7Y56U1+HRN1Vk3+VLJ8RHbSpapV8ynZPfv4sFuA0U4LECqi
         RlwziY6z286k1I1xrVJu912EPrWgtooiuIMHBmRCbeet9bfklN/w3ocBUOqaZQg19QzB
         PvEA==
X-Forwarded-Encrypted: i=1; AKwUvBwjVlLCBwA09+cK82nMVUjjVk2nVPSF5ZonmvUSl3CUOv4Kmj0VDzE5KBAq5oWoyBm97aOEEqIAKCHQdNE=@vger.kernel.org
X-Gm-Message-State: AFuF++ng9vF2Pafs9/VOaJIMbvogauuqr4sBILxDU8dyLqJzs+RRSTOa
	oJJV1i6v4owPtLP/DHU1kBE5Eg95WJ1mNedRwwpsCb1VWd43VAzWIwAdoQbSF0OSWZaXCcoxm3b
	1zy0v/xA1VwwUO+v7efYtM4Vy1bJAEFc=
X-Gm-Gg: AYBFou0tvgxZjiiCUADM3gQPzBW+EyMqV75UpydJJrn6ix7NoYhG25rgezQFiOUl6cy
	33A+uI1v0JHAHBItQtClhRV023Vv9pPsa5nQ8a/ziglatm6nOBe4M1lppqVuhgmKnzJo/CjYwhM
	70ab9Blf54TXZhEiN7ei7/1HwSTgLivJuD/o4TZ4v/PPo/SMzuqrdyiYw/vwWGbvGPoK2gP3JiL
	5y0+j1xUh97vKPN9JtsxHQ2SZSECPXScojNBSc695kuNFYj4oT4XZgrZMa/2HeQgU7FhH/XCRbo
	qoxK5zu35gJkS+3NMwR4CBd7HRwuaFjqwIGlk0/MktOShdnUBIJmYhsYb7C5FpMavHjlf3xV94Q
	MUlASihiYk8F+ECBDYdIzRD5FMaGRJY/bjqM15UX7Bw==
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id
 ada2fe7eead31-79b53156063mr2222470137.0.1789481654462; Tue, 15 Sep 2026
 07:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915005421.20570-1-emmaonana18@gmail.com>
In-Reply-To: <20260915005421.20570-1-emmaonana18@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2026 10:14:01 -0400
X-Gm-Features: AcwNN1XCYqnubKV6DPknJ8VP8xcUX59hQZqAGMsqaqTYwSEti10uZRVGJHGdrc8
Message-ID: <CADnq5_Orei9+6ZjCC2jTt8jrPM+w6jx5i1WoLxZWj9treOdzXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix kernel-doc warnings for amdgpu_display_manager
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, harry.wentland@amd.com, sunpeng.li@amd.com, 
	siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, 
	bhawanpreet.lakha@amd.com, Wayne.Lin@amd.com, ivan.lipski@amd.com, 
	matthew.schwartz@linux.dev, Jerry.Zuo@amd.com, chiahsuan.chung@amd.com, 
	chen-yu.chen@amd.com, skhan@linuxfoundation.org, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Tue, Sep 15, 2026 at 3:41=E2=80=AFAM Omokefe Emmanuel Onanaroghene
<emmaonana18@gmail.com> wrote:
>
> scripts/kernel-doc reports missing and excess member descriptions
> for struct amdgpu_display_manager:
>
>   struct member 'power_module' not described
>   struct member 'hdmi_frl_status_polling_wq' not described
>   struct member 'hdmi_frl_status_polling_delay_ms' not described
>   struct member 'boot_time_crc_info' not described
>   Excess struct member 'dm_boot_time_crc_info' description
>
> Add @power_module to the main struct doc, document
> hdmi_frl_status_polling_wq/work/delay_ms with separate inline
> comments, and rename @dm_boot_time_crc_info to @boot_time_crc_info
> to match the actual member name.
>
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 3524931451c8..61756c089fcc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -330,6 +330,7 @@ struct hpd_rx_irq_offload_work {
>   * @backlight_link: Link on which to control backlight
>   * @backlight_caps: Capabilities of the backlight device
>   * @freesync_module: Module handling freesync calculations
> + * @power_module: Module handling power calculations
>   * @hdcp_workqueue: AMDGPU content protection queue
>   * @fw_dmcu: Reference to DMCU firmware
>   * @dmcu_fw_version: Version of the DMCU firmware
> @@ -716,16 +717,26 @@ struct amdgpu_display_manager {
>                 char reply_data[0x40];  // Cannot include dmub_cmd here
>         } fused_io[8];
>         /**
> -        * @hdmi_frl_status_polling_work:
> +        * @hdmi_frl_status_polling_wq:
>          *
>          * workqueue for 200ms frl status polling
>          */
>         struct workqueue_struct *hdmi_frl_status_polling_wq;
> +       /**
> +        * @hdmi_frl_status_polling_work:
> +        *
> +        * Delayed work for 200ms HDMI FRL status polling.
> +        */
>         struct delayed_work hdmi_frl_status_polling_work;
> +       /**
> +        * @hdmi_frl_status_polling_delay_ms:
> +        *
> +        * Delay, in milliseconds, between HDMI FRL status polls.
> +        */
>         unsigned int hdmi_frl_status_polling_delay_ms;
>
>         /**
> -        * @dm_boot_time_crc_info:
> +        * @boot_time_crc_info:
>          *
>          * Buffer info for the boot time crc.
>          */
> --
> 2.43.0
>
