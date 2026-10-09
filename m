Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816363BFAC0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552597; cv=none; b=QQ9SHj6XRVKrBNZnCpfkSnm322j68k3zA3DqGYvHm5jz0t/7ppSJf6AFIkIMZlwV1LqZx4Fk+fdiz5mUpuaoql3aeN2lyqElCi3I5r5/IhwAVPm3YcnTHaw9OBl3SRUuAVFvogG3+84ma7K/jS2ch1NkhbJ62vULqZ9js3/Bus4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552597; c=relaxed/simple;
	bh=AjAP+QI8JnYavGL9gJQd7S1yVJL066iBX6Zj9aSs6G0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jaulYZ6MITEGFjMEM1C17GHMnlq1nXB1ew/qxeCdlYlkUd5cwMT1Bj9vCMhgqbqmXHno7xe9V+mZpLlySZr0vHhOuVfQO4OdPOZi5dsCoOQqM2m8ZhZsOALyf3nmgHjhzF6RQzu1NLJS2uiqdHVHjKRTDZ/sxV0X4jM/vOuKfDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=AS3vjR+D; arc=none smtp.client-ip=91.218.175.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="AS3vjR+D"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AjAP+QI8JnYavGL9gJQd7S1yVJL066iBX6Zj9aSs6G0=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791552591; v=1; x=1792157391;
 b=AS3vjR+DGpgj6O2uhrp0VSkLIp1nJ3/d5EGXgEZQldY4rUHgZAUIEZh4Z/F2BW7yvcwGDPcT
 iTlqsWIhtkOHQ7wQD9YTvJ8AM+jcplJYfV9MXZZoFYK6iKzFMKP3bJhfPwwgTza5ArWEvCSh99G
 OJS6kcrKqjTml4CqKrQtYrltESW4aLAgikPNe6gP95T11Gt6CxidGBytZihFMsiZQCVF9WWkIgW
 FD09slVhFfHzX1CtAjF4uJ53NxYSvxOpS8ZUjUwW5Fal/xRACTptb1QWRQR8DHJ4+ukm1rglpPU
 fGh7FQ3/ZpCm8ul9+VrbO48hw0gAhht8KImBzxoBBV/RQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 25315a1375ed6732;
	Fri, 09 Oct 2026 13:29:51 +0000
X-Mizu-Trace-ID: 25315a1375ed6732
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 15:29:46 +0200
Message-Id: <DM0CE087PHFD.EEV8UZ4V6A7E@cknow-tech.com>
Cc: "Karl Mehltretter" <kmehltretter@gmail.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Rob Clark" <rob.clark@oss.qualcomm.com>, "Jianfeng Liu"
 <liujianfeng1994@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, "Alistair Popple" <apopple@nvidia.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, <linux-rockchip@lists.infradead.org>
Subject: Re: [RFC PATCH 2/3] dma-buf: add a warn-only mode to DMABUF_DEBUG
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Diederik de Haas"
 <diederik@cknow-tech.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <20261005064133.7305-1-kmehltretter@gmail.com>
 <20261005064133.7305-3-kmehltretter@gmail.com>
 <DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com>
 <20261009125338.GB13920@nvidia.com>
In-Reply-To: <20261009125338.GB13920@nvidia.com>

On Fri Oct 9, 2026 at 2:53 PM CEST, Jason Gunthorpe wrote:
> On Wed, Oct 07, 2026 at 02:02:31PM +0200, Diederik de Haas wrote:
>> [ 1091.981354] rc rc3: two consecutive events of type space
>> [ 1104.670513] input: EDIFIER e235 (AVRCP) as /devices/virtual/input/inp=
ut12
>> [ 1172.090231] devfreq fb000000.gpu: Couldn't update frequency transitio=
n information.
>> [ 1189.403278] devfreq fb000000.gpu: Couldn't update frequency transitio=
n information.
>> [ 1206.309295] input: EDIFIER e235 (AVRCP) as /devices/virtual/input/inp=
ut13
>> [ 1268.968696] DMA-BUF: importer used the CPU side of an exporter's sg_t=
able
>
> This is a nice stack trace, is that the point of this series?

Actually only the last line, I just "couldn't help myself" to also include
the "Couldn't update frequency transition information" part.
It can be unrelated. Or not. I lack the knowledge to make that determinatio=
n.

>> [ 1268.968710] CPU: 6 UID: 1000 PID: 29025 Comm: sway Not tainted 7.3-rc=
6+unreleased-arm64-cknow #1 PREEMPTLAZY  Debian 7.3~rc6-3
>> [ 1268.968715] Hardware name: FriendlyElec NanoPC-T6 Plus (DT)
>> [ 1268.968717] Call trace:
>> [ 1268.968719]  show_stack+0x20/0x38 (C)
>> [ 1268.968726]  dump_stack_lvl+0x60/0x80
>> [ 1268.968730]  sg_dmabuf_cpu_access_warn.part.0+0x24/0x30
>> [ 1268.968734]  sg_dmabuf_cpu_access_warn+0x34/0x38
>> [ 1268.968739]  iommu_map_sg+0xc8/0x1e0
>> [ 1268.968745]  rockchip_gem_iommu_map+0x8c/0x128 [rockchipdrm]
>> [ 1268.968757]  rockchip_gem_prime_import_sg_table+0x58/0x160 [rockchipd=
rm]
>> [ 1268.968761]  drm_gem_prime_import_dev+0xa8/0x1d0 [drm]
>> [ 1268.968776]  drm_gem_prime_fd_to_handle+0x1a4/0x280 [drm]

IIUC this was meant to show the actual problem.

> So.. This is the exact same thing I need for iommufd.
>
> rockchip is managing its own iommu domain and you cannot map to an
> iommu domain without using a physical address.
>
> Of course it is *completely* illegal to call iommu_map_sgtable() in the
> importer side of a dmabuf.

I can't say anything useful wrt this, so I added the maintainers of
``drivers/gpu/drm/rockchip/rockchip_drm_gem.c`` to the recipient list.

> static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
> {
> [..]
> 	ret =3D iommu_map_sgtable(private->domain, rk_obj->dma_addr, rk_obj->sgt=
,
> 				prot);

It may not matter, but I noticed the majority of that function is from 2016=
:
38f993b7c59e ("drm/rockchip: Do not use DMA mapping API if attached to IOMM=
U domain")
1aa5ca6e3ec6 ("drm/rockchip: Use common IOMMU API to attach devices")

From the first commit (38f993b7c59e):

    The API is not suitable for subsystems consisting of multiple devices
    and requires severe hacks to use it. To mitigate this, this patch
    implements allocation and address space management locally by using
    helpers provided by DRM framework, like other DRM drivers do, e.g.
    Tegra.
   =20
    This patch should not introduce any functional changes until the driver
    is made to attach subdevices into an IOMMU domain with the generic IOMM=
U
    API, which will happen in following patch. Based heavily on GEM
    implementation of Tegra DRM driver.

And I assume "following patch" was 1aa5ca6e3ec6.

Cheers,
  Diederik
