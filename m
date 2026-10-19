Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792424628;
	b=HVMUkveqMeSy9s6VEu/rQDhFau5kHhADJYo9rGVh8AZQCOuAstF/zYY1khm6HnY2WRCx
	 FcqUAZnMlM+eudmIJ4DSFrP1LCwTtFK0bwk9RySHszqZxI8aD26plCJJxaZaURhV/atIr
	 TYyJPjjKcJEdOvu7AfUXG0qD6tA0xWduCPKxjkqKOWUDbLj1dK8sOM0D1XJmIb4V9ATGQ
	 4IoMo/bgPVJ5b/EvriL99yWRDgzI/N9XwlByCr1GztyB7uhEVKEosCAPHSA8xXIR3WAJa
	 iZjv/eJ5cqmDUNZXWiEFQSsAjQurs+5ubdZPmEwNhyAaiznmXZ0xixhOfibcWu9L/Fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
	b=yB3YD/jTAPKnHCi/i1S37/SrmCcXvwYWgqxUnNINaFsN5AmIVIEofz1lyLog3mqT4Mzi
	 oHV0s+BLsQkGFfz8y3VKtp05jC1TvIeLOJ3CZzFt2dSVKlPao1G984MtRqsU0yOHgGlf+
	 acXkVvfzYmLrQqI0fAq+3BAgaGXSya1+g4nZ4GQQg7PeIwVjoDJ7PM6k1YdKWTwn/rfnQ
	 1LBPlvZO0uOYbB2CCTKmogv4/Gsh+kgS4X3y8hlnibBGRhWnhMEWT4jBHiXNzsBfLkGsf
	 aACQVlvvAl6W5lLHU/KySzAho8t5XKmqji8oIrRscUOVoPLMMNBa5yuyGFUHI6wFoQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=gfxstrand.net;
	spf=fail smtp.mailfrom=gfxstrand.net;
	dkim=pass header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=aSaNBc7i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A16074088
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C4A16074088
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=aSaNBc7i
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so4195445c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792424627; cv=none;
        d=google.com; s=arc-20260327;
        b=Y0wDI4C7FxHfIh+K6cvG6TMEkxD4uElpwVBmi1IXv2oSfRhFcO012UBLlZZQN+YIbK
         qXlM3eUcFCTcWjdhqaW26lYBFsaEEHq1hQO7NWTLRTxr1vlyBXPTQDSL9qUwWCIgxk5O
         nSKqvxTCEaWlwxgBVrjCTz8COZpYFOri3XiYg7plrNux7R2exE0FLmIxPsbhqged6jwH
         zSRlcgySGFkYvDAFw+bT3pJDQocDM4W7EvBItpC5jjaBiAm343lbqmtJ4QKaju52DEIU
         3Tp2h3GrrGQY54rdVg0YtLMo67ZQfGHHm8ih2r4LxggjZioNJM7i+X+bOrMRL1yBBiys
         p84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        fh=9DU1WOkPAMXyeDif0Zq/4mMldKdflacbxFwtzPZJvp8=;
        b=bsN6KwT394YkGBF3+vsKBHBleLhmgli1PA1X3t/jc+x1+Onw/5ejwNH8V0qXP/bSAR
         eEU6rsI+O4lrNiCJvv1giFtpwY4HC7RJvFV5HSUuve9cZXWnz5vuwVi5xPmttNPcTksc
         1myyzi2yjuniLOFZFp46R6ft35VSzFqb+SXGxADtVIn0x47z3p0uGPLf3nfNAV+ZUdUz
         t47FVqwlW/SvNGPRby5moK9bcOlUO918JbtY7jAAQwe6q2wiVUJz0gGUTid2emSg/kj2
         v8bUZ9JwFL73gCUA8ZP4NQLTl2p2w7fqxlucoLFfeUPJ61lKxIZkZ5i4Mi3hP1IAwiT8
         PIhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gfxstrand-net.20251104.gappssmtp.com; s=20251104; t=1792424627; x=1793029427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        b=aSaNBc7iEPgwSopvk/ii4OoA36zmwyKQRCaW47C/zpkxnETyA050bJvURaTHTqknVz
         AazM2FcM7xZPRFZHnSwc6V1mXrJD1Y1G57vlOJ9zQc7CGBWPCUwi1XDkaNSa1wwNcknP
         9uwNHc2uZ1LGKJn/lQl7bpelJurIt3WlcpR8dBM830Q/DOGvjVJMNH2vWkyqb2XrEGsT
         /f5JIH+klJq5vxcTejNyzO52VrQQ+jZRycadhbPBICA4DrvVM7XO+Lqb415+J69tTn3J
         2hR0xqq8t0j7C2k5QjZRJe0JCZChqwNKdvSjRYUM4e0UAZtlmoLJrfbZ9EYfdp7Mx7Wi
         n1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424627; x=1793029427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        b=sF/InX8ELOOS8B/Y0Df8aer9E8UiFrsTDdtj6YeU9khY9JuyCPakaw/SHUvDgCmLhH
         pdPLtxVmrB8wsXSiMK4jLm8byl44foSx4Bnpv3XRCSB9u8bV7kg+UJbFoCFEFJclbI6H
         ReinWcxxfG9yqiX32lhYaPaBbU1ZloUDquj5M6PRTmJ2EyKgXQoLDzVI5adIaDdA0Xit
         4AAfC5dlct9ZgczZJy0g9d/5xOE85jQIpaUTECZBBLJfwzo2PhoLyd7bdPXVGVCICL6E
         Ra/JfiNCdNCE8OewcHSL8wMOXU4xBpCgpQ780FgSFFotdaM59+BXV/EJdyHiwd61ocD8
         8TxA==
X-Forwarded-Encrypted: i=1; AKwUvByUesjkojoj4FpRMRntZFHleZaFx8R5Pb7G8VIouxeaadzbMwasOB7B3YKhPw+43Tsy+bjdXfj0zrhreZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDHeC4UmgnQZRrDT0ZYEttk1DntwZFIUnKSbBLvWTa3TLeyopU
	eDinTS4kRjHLNsNEouTGalHu95gFtnv7rfDlpuNZt5hyR7bHc1Hzfu6pThEB1tcSeNxzsrX5W3G
	XYnDHSemx9FbN8YRPx0vVT+uMgm/z2q08nx0aIzQfJQ==
X-Gm-Gg: AYBFou3cMIvQZC0KXisBujtkwH/yOkJ7LekHOLyirH94HDQQysAGUNanlHkFXzaL6g/
	Au/PGLUYXgmTH7W5oBdSdiI29TVtW59J7gwk903Lr/QajCiKeerBQw56IaVmQUkuNFWLB5V/kSG
	n6OGemEVTN8EolWmEOfoft6DhTLIqsXdQPJT/mv+lOCyjPj91U3YtLP6Tyz/GeN2OSaL/7OuwUa
	SvyX1GxcLjCLYRcgZkFnsCqTAiXQUeT3wLYuH8AcO6ZW+2QdDKV1zXXeVIxvdLHUk953IBEB1mj
	n5E2vNfqtewnCbYCqFaIu6KAz30WyvXw5jQChCgTOpnSqdTwjeeg
X-Received: by 2002:a05:701b:21cd:b0:14c:be8e:69f2 with SMTP id
 a92af1059eb24-18512b3f773mr11411490c88.21.1792424625673; Mon, 19 Oct 2026
 08:43:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260909064506.910162-1-apopple@nvidia.com> <20260909064506.910162-9-apopple@nvidia.com>
In-Reply-To: <20260909064506.910162-9-apopple@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Mon, 19 Oct 2026 11:43:34 -0400
X-Gm-Features: AclHuK8wgzDeroqopGem9K3ppSyG5cc3vLnnGQN2wHpX-RdNKKojDR1u5BsOoW0
Message-ID: <CAOFGe97oDdZP-XDhthZ-5tuJjuJyKxvLq9YqvWaTApZE6B8exQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] drm: nova: Add usable VRAM size to GPU info
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 2:46=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> Add a field to the GPU info structure containing the total usable
> framebuffer size. The usable framebuffer excludes GSP carveouts and
> other protected regions, so it may differ from the BAR size and total
> physical VRAM.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes since v5:
>
>  - Expose the GSP static info through a NovaCoreApi::gsp_static_info()
>    accessor and read the VRAM size from it rather than adding a
>    forwarding method, as suggested by Danilo
>
> Changes since v3:
>
>  - Partially new for v4 - previously a separate scalar GETPARAM
>    parameter
> ---
>  drivers/gpu/drm/nova/file.rs          |  2 ++
>  drivers/gpu/nova-core/api.rs          |  6 ++++++
>  drivers/gpu/nova-core/gpu.rs          |  6 ++----
>  drivers/gpu/nova-core/gsp/commands.rs | 10 +++++++++-
>  include/uapi/drm/nova_drm.h           |  6 ++++++
>  5 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
> index 4a65bec0fbce..d0ab3df6bcd2 100644
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@ -38,10 +38,12 @@ impl GpuInfo {
>      /// another documented default instead.
>      fn new(reg_data: &DrmRegData<'_>) -> Result<Self> {
>          let spec =3D reg_data.api.with(|api| api.get_ref().spec());
> +        let gsp_static_info =3D reg_data.api.with(|api| api.get_ref().gs=
p_static_info());
>
>          let info =3D uapi::drm_nova_info_gpu {
>              architecture: spec.chipset.arch() as u32,
>              chipid: spec.chipset as u32,
> +            vram_size: gsp_static_info.vram_size(),
>          };
>          Ok(Self(info))
>      }
> diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
> index 876451dcc051..64f9ea442278 100644
> --- a/drivers/gpu/nova-core/api.rs
> +++ b/drivers/gpu/nova-core/api.rs
> @@ -15,6 +15,7 @@
>  pub use crate::gpu::Spec;
>
>  use crate::gpu::Gpu;
> +use crate::gsp::commands::GetGspStaticInfoReply;
>
>  /// API handle for the auxiliary bus child drivers to interact with nova=
-core.
>  pub struct NovaCoreApi<'bound> {
> @@ -28,6 +29,11 @@ pub fn of(adev: &auxiliary::Device<Bound>) -> Result<N=
ovaCoreApiHandle<'_>> {
>          NovaCoreApiHandle::of(adev)
>      }
>
> +    /// Returns the GPU [`GetGspStaticInfoReply`].
> +    pub fn gsp_static_info(&self) -> &GetGspStaticInfoReply {
> +        &self.gpu.gsp_static_info
> +    }
> +
>      /// Returns the GPU [`Spec`].
>      pub fn spec(&self) -> &Spec {
>          &self.gpu.spec
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 91db64dcaea7..b9fba3a79b1e 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -301,7 +301,7 @@ struct GspResources<'gpu> {
>  pub(crate) struct Gpu<'gpu> {
>      pub(crate) spec: Spec,
>      /// Static GPU information as provided by the GSP.
> -    gsp_static_info: GetGspStaticInfoReply,
> +    pub(crate) gsp_static_info: GetGspStaticInfoReply,
>      /// GSP and its resources.
>      #[pin]
>      gsp_resources: GspResources<'gpu>,
> @@ -422,9 +422,7 @@ pub(crate) fn new<'a>(
>                      dev_dbg!(
>                          dev,
>                          "Total usable VRAM: {} MiB\n",
> -                        info.usable_fb_regions.iter().fold(0u64, |res, r=
egion| res
> -                            .saturating_add(region.end - region.start))
> -                            / u64::SZ_1M
> +                        info.vram_size() / u64::SZ_1M
>                      );
>                  }
>
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index ffc25fd8c47b..5c1f9d296198 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -212,7 +212,7 @@ fn init(&self) -> impl Init<Self::Command, Self::Init=
Error> {
>  }
>
>  /// The reply from the GSP to the [`GetGspStaticInfo`] command.
> -pub(crate) struct GetGspStaticInfoReply {
> +pub struct GetGspStaticInfoReply {
>      gpu_name: [u8; 64],
>      /// Usable FB (VRAM) regions for driver memory allocation.
>      pub(crate) usable_fb_regions: KVec<Range<u64>>,
> @@ -261,6 +261,14 @@ pub(crate) fn gpu_name(&self) -> core::result::Resul=
t<&str, GpuNameError> {
>              .to_str()
>              .map_err(GpuNameError::InvalidUtf8)
>      }
> +
> +    /// Returns the total usable VRAM size in bytes, i.e. the summed len=
gths of all usable FB
> +    /// regions.
> +    pub fn vram_size(&self) -> u64 {
> +        self.usable_fb_regions.iter().fold(0, |size, region| {
> +            size.saturating_add(region.end - region.start)
> +        })
> +    }
>  }
>
>  pub(crate) use fw::commands::PowerStateLevel;
> diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
> index 26a5e7ca5425..946bd4bf8fbd 100644
> --- a/include/uapi/drm/nova_drm.h
> +++ b/include/uapi/drm/nova_drm.h
> @@ -180,6 +180,12 @@ struct drm_nova_info_gpu {
>          * currently known chips.
>          */
>         __u32 chipid;
> +
> +       /**
> +        * @vram_size: Amount of usable FB, excluding GSP carveouts and p=
rotected
> +        * regions.

Does this also exclude the compression tag carve-out?

> +        */
> +       __u64 vram_size;
>  };
>
>  #define DRM_NOVA_GETPARAM              0x00
> --
> 2.54.0
>
