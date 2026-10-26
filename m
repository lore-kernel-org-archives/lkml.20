Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038702;
	b=azmVFrTg2uGYIzsuffVxO9JA8SGkkRcCCPBVvyAlbXjtBGS7d5/dNuwjsfOUwDf0lhEv
	 Fz+JMX3sT5YIjZhvtPQr86K1j8BaqXTD30pllWvT1wm9yZYEa0ySLBSdKXCab8KC5DScv
	 dzuf7XKZJ/I6Slum69Zx2hJ9pKpM/z1pFIAeLJYbyOU68D/vMBdzzE3uGR9U84w95VUuU
	 J8OEFCIf0MIN0XNAMmm2z5apZwnP5Pa0Whv1mTkk+ryOwQsyPbE+iQEgfZ1n2iwGAEXIp
	 Si0/Se63zFTc4As5YvdL076D4GJShp2GO0jU4AusX3Ws6+9bh27PyxX5b65K5JNHcpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rUFVEl7fV+HUh8nhoQnb/g9LkM23VhHFCgUj8hV83sM=;
	b=zunx4caK5haHfrNPPwz7gwctXVaoo9b/Sxvkm2mrvZU8N/A3LtGN+daN1lC0DKQriHXQ
	 lBOnjhWaK41q78kYNIR6/0Lq48iwZvqQ83DgJWGn5RP4DjlNO14e+EDmcHwEEUbxDgCRS
	 VD04+sG8mg12Lb1r9E6STFZJtpHbRIRQKdhnQDXcYaEMERfQdn5IiOTzRc83v0kS2vRZc
	 xmRJPmfpnjMuV1efzfPR0+xUeev1sPBhv4uSfgfCG37rYdkVtSCDvrp052WTkCELkHJFt
	 LpwtrFHdPokhttaWAVMdXcP0OL3+o6ktNaUbRCdamF3be3R+aWV7tG90d/G/zN5MslQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fYOX5pph;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28324606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28324606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fYOX5pph
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bb5afa736so528747eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793038701; cv=none;
        d=google.com; s=arc-20260327;
        b=NovVGtJ69ThJaMYBBnTfF/UhKgMfyVhRLzfIA034XguRztwGAXob9CvSUl840pVWsm
         2UXAjgS6Tu93EdzwERPWeem36XzNrQym6/lYIMUN2qcSicUJXSQ1GITtPXOdNlebMon6
         IycAwJMkfkXeq3SNtqAdv1l8iMA2z+k9srJubNzK0mnn75Vqg5tsGjqcx8+8UHee3MA9
         YhP4B3YFfiv8pY5bPNOrj0qtY6f3Mn8uKG36qJ91MlEv2VvOLwR9PGFsexou27LhnWK0
         wWFppev7AVTlWMMzH7A4/8N528Y1JHmsYu4L0V4fWGjpafBZPvomxavrFKLzwhZ8bIWK
         i1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUFVEl7fV+HUh8nhoQnb/g9LkM23VhHFCgUj8hV83sM=;
        fh=E84S+RT9xvJDK83jurSmdBjs10uzrVZKXU6xPs6lZjw=;
        b=YxWS4pmSAaCso/zaT+WtII027kNa5Vik9vHXYKfIolZyckKVlEDqgNMnmNHGonr8H7
         b29mdUt41nLns8k98/vOasFRbgx1OzhX+aWD45rdjQ461az/9pNNzUam9HN8xAuTbb5V
         lrc7tbDM7sqMzOeCeih6KjoR2TKBSCaLrQul9RvQQ2EGdJ5S+z6pZqQcpUwH2MUr2wq/
         rR8XRFJB36EgEIXYNftEe4VIcvSDBOYBwh9at1MIoPlqqKyHmJ/0IggpHDkyKMkNgd+2
         UK1jmJhemzcssOgya8gv18L+4TOf1Yc2x1UVqPY+6nq7VVmUZ0FkHVyaix5m1EvhcbFj
         kfXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038701; x=1793643501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUFVEl7fV+HUh8nhoQnb/g9LkM23VhHFCgUj8hV83sM=;
        b=fYOX5pphsGY/+i/Iy06yAJ16VPzT/i1wL+b30sH0lJqe8b5j0u4TWNje0SRlBJbpNd
         xVPxwEFG9gpIg7TXVB3JP/JIAyAYhYLwAH7rrfT9LYFSLkGi3RYylySiYPLv/ukn3+Ly
         JyseKMEDyDuVup5co5JLXOoLtQQU5jiH+mNAEf6A9yIusnp+kdQvXSAZP8VLEHU76Pow
         51SR089jLzIU4p3Jzib0uunNja3tletM5zojusi7gTZBYNg7T0rv6mVO2U2wp/P0/C8N
         6v2SiKCeY6alA0+WUBcAMtxszynbgR9tww5BjynoDnP1oyhIwpO1dCic4ze44VzEHFvv
         uBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038701; x=1793643501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUFVEl7fV+HUh8nhoQnb/g9LkM23VhHFCgUj8hV83sM=;
        b=Ojo3HQKGMkSlNeRZZRAdfElxUevdfiqwUGTbz03JqooxXyCFR1xhZ5/gvhVPupQSFQ
         7fVwo2MzSzU3HTyKw1mye1vlROHIrpNxXTOjXAEnMr/yOTn73kQw9HQwAj+LJ1I4uisq
         cDVQs/CgyA1OkDO4U3ib/ciLHjTPANNRr/N1FSsYEfjma9o7XtHfSzQsigSujD/YdYLZ
         mt4QlEbj3WnimvryoXjxi+IEdK8z5q8OWZgX6Pc9hss7GnX3ZM2qeO+/U85cGw6fdpou
         eSS/CGL1ycm1aHZEB2pX/lP1eucbFtAMoluZVPNmBFmWZcD39Tpdvnm3K/6jL/J/lGwA
         i8Mg==
X-Forwarded-Encrypted: i=1; AKwUvBxSXbqblB4JUe4wCadjeYzKhh4noy5WmG1fGYJyOQrQUoLXxCu6SWT6dwteozZg4U50dOb2ERQDl3jyq3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSXtVbpBQJqzPTSAS7OfWg2Gl4c/l8yqiuWhbyhi4MBrDOr1L3
	eTtOhUuHu7eFzevinFGWFusAo+HHKRmVklClIzmOqymDaFPWrGj7BP0XXUEZx4Bnt3c7cOa9eDe
	T3j2s3+uqPd25/ou9FT1P8c2qacvmM4Q=
X-Gm-Gg: AYBFou2xNyPkVyyFV9U0wVINSAVxUNDigjfIfU4UPaPe5eb1XpbrvytEBtYhzylv9ag
	Jyv/vTllXjJB4ec3fmUEEVNJwCGqR5K4hJbboTZALrdaTdhi+KEJkK/y97V6IXYem3SHqnyOZgx
	lZY1o4OfdeuM1P5KWoGd5+LDAM3mXuVKmuYkqfAmhPfT+k7FFmX878rK7r46vzhzA9aezsZugdb
	9gzq7gam4DYUxBeQh8G5Zr1K/hVMU8Uf7SVp5gavigtjwvgKnKlZT+RGupqjOcj8KwEAhFVipU9
	6GVj4u9cq0U0LuXSvAqmR5b3ANW8VLkwvTmOSHnhmlw7yH3y/ZIIpnebUIooBVi3j/S9hYtPN8o
	fIA+09X9LmOA1kBIJJ99xkANxc9BlJdUlpow5lIEGVMLhpQWkYyZxL5BuB/lhMP+ioA/lrQKITm
	+MvoF3QOLfrZveqbOtfvFW760=
X-Received: by 2002:a05:7022:5f07:b0:146:ffa9:2117 with SMTP id
 a92af1059eb24-1993639e5f7mr16191284c88.1.1793038700920; Mon, 26 Oct 2026
 11:18:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com> <20261025040046.1602-13-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261025040046.1602-13-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2026 14:18:09 -0400
X-Gm-Features: AclHuK_gGXqjT0cI7KV7tvEEJQhRHXFUqhLnyaELH9XqFgMeuwm1bkZPQKcDe-s
Message-ID: <CADnq5_NLhN4TKH-afTtJdF2d-e0=1kysf=pWiUpXu+bLhJFEeQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/amdgpu: Skip AC/DC notification while the GPU
 is runtime suspended
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Andre Eikmeyer <dev@deq.rocks>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:11=E2=80=AFAM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> From: Andre Eikmeyer <dev@deq.rocks>
>
> Plugging or unplugging the charger raises an ACPI AC event. The handler
> sent the new power source to the SMU without a runtime PM reference, so
> with GMUX keeping the GPU off every SMU message spun on skipped register
> reads for seconds. A runtime resume racing with that left the SMU
> firmware unable to start on MacBookPro15,1 and the GPU in runtime PM
> error state. Record the power source only and let the resume apply it.
>
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm=
/amdgpu_dpm.c
> index 808be6c42..b64f0b681 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> @@ -30,6 +30,7 @@
>  #include "amd_pcie.h"
>  #include "amdgpu_display.h"
>  #include "hwmgr.h"
> +#include <linux/pm_runtime.h>
>  #include <linux/power_supply.h>
>  #include "amdgpu_smu.h"
>
> @@ -498,20 +499,26 @@ int amdgpu_dpm_smu_i2c_bus_access(struct amdgpu_dev=
ice *adev,
>
>  void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
>  {
> +       int active =3D 0;
> +
>         if (adev->pm.dpm_enabled) {
>                 mutex_lock(&adev->pm.mutex);
> +               active =3D adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_GMUX ?
> +                               pm_runtime_get_if_active(adev->dev) : 1;

There's no reason this needs to be GMUX only.  You can drop the
AMDGPU_RUNPM_GMUX check here.

Alex

> +
>                 if (power_supply_is_system_supplied() > 0)
>                         adev->pm.ac_power =3D true;
>                 else
>                         adev->pm.ac_power =3D false;
>
> -               if (adev->powerplay.pp_funcs &&
> -                   adev->powerplay.pp_funcs->notify_ac_dc)
> -                       amdgpu_dpm_notify_ac_dc(adev);
> -
> -               if (is_support_sw_smu(adev))
> -                       smu_set_ac_dc(adev->powerplay.pp_handle, true);
> +               if (active) {
> +                       if (adev->powerplay.pp_funcs &&
> +                           adev->powerplay.pp_funcs->notify_ac_dc)
> +                               amdgpu_dpm_notify_ac_dc(adev);
>
> +                       if (is_support_sw_smu(adev))
> +                               smu_set_ac_dc(adev->powerplay.pp_handle, =
true);
> +               }
>                 mutex_unlock(&adev->pm.mutex);
>         }
>  }
> --
> 2.55.0
>
