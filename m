Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B37387341
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001168; cv=pass; b=q6cPrLvIbyo3t2Q/eLysoynN1MTjJEKMrynMDl5/GiRC3FKn4C4AeTHvBdY7CPFWT99tIC1/eDqQYAzoTLEBT6pekVxlWbdrqKTxxdghX7+5kesBkK0lRovlvb45rDaat5buVAjftNjib/plWrBzu3bnoAj8mae7p/qtqLHJdyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001168; c=relaxed/simple;
	bh=oW+nFZqJCysGp2rFfmkjy6xQ4hJcmsjzsI4DvMsx5Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZrWmInIsvUffTu2rdnJ9vcf41LVVGNvhXglWeOLKphN3kKxBlM5U9KQLpuDpHZOXX7usmjJAKhGdE1LYmlhyTEMxlnemaXSIJqDLIGGhxFBLwNyvkJP5z9ntx5fLJZfwsFh4jHs6AplTfndG9v4h7mHWpcVciJQQVDPNOXdmVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=K8EQHOYY; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="K8EQHOYY"
ARC-Seal: i=1; a=rsa-sha256; t=1792001148; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NsbQnA61ZTaqYF+Ge0WNhwJd5YjHvf9TYlu1ewi6OD1Cndwus87hYBGwTtQHEQJRhsIGVoE8mYzhEamYYZ8F9Ae7c+AH9BdqLIqbcldkvSQZcHjBFVhfiUDoFJmae+4YAPqnaig+lBtq8INM/5DjQi/1xebQl7maeJD4R8JP4HI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792001148; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dRfIeGV/wzE5R3Fwbev1l1gvsAUF7ieD+3RdpMlIcgg=; 
	b=nv2bl2nv58kTurIei8POC43BW45ZGp/na0+le5Kn8V6g2t8CBFYfPisxX48Rq5Pg8lHKpPNyFC07E/yVh3VQSFtR2jXjAlsZT1h585NNe5AeeLYRknBw9QW3FAzNREcpf41qTSpDSC7NjA7D4QEHfJAiFVi033JzRkSCkPcMcqY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792001148;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=dRfIeGV/wzE5R3Fwbev1l1gvsAUF7ieD+3RdpMlIcgg=;
	b=K8EQHOYYr2a/EMtti8/EF1DJZu6Ysl30J0wM6vZ12OqpA0h5110EH2XDyL0dHAtF
	TwP7KKGrFiC96fSBh/+XpNTIYY6kJshfQb0N2DdEw8b0ULH9EEfxFnTqMdM0VFHDrw4
	2p6VUsEIXdNsSojbNNon6HA+4cH/KjC87WUEHdko=
Received: by smtp.zohomail.com with SMTPS id 1792001147041308.53039111812893;
	Wed, 14 Oct 2026 11:05:47 -0700 (PDT)
Date: Wed, 14 Oct 2026 19:05:42 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: reset the Amlogic GXM GPU on runtime resume
Message-ID: <as_EPvb8S2rYmeRj@sobremesa>
References: <20260930125629.2691968-1-christianshewitt@gmail.com>
 <179184031154.1056803.12154076398577087527.b4-review@b4>
 <6B9C57A7-8BE5-461B-B44B-EF91FC2D2D93@gmail.com>
 <as_A5ygwMkEgGeP4@sobremesa>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <as_A5ygwMkEgGeP4@sobremesa>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.982.13

CC: Neil Armstrong

On 14.10.2026 19:03, Adrián Larumbe wrote:
> Hi Christian,
> 
> On 13.10.2026 09:02, Christian Hewitt wrote:
> > > On 13 Oct 2026, at 1:25 am, Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> > > 
> > > On Wed, 30 Sep 2026 12:56:29 +0000, Christian Hewitt <christianshewitt@gmail.com> wrote:
> > >> After its first runtime suspend, every power-off of the Mali-T820 in
> > >> Amlogic GXM SoCs times out and floods the log with shader, tiler and L2
> > >> power transition timeouts. Following a soft reset the cores report not
> > >> ready but PWRTRANS never clears, however long the driver waits.
> > > 
> > > Would you mind building the driver from the latest drm-misc-next and testing
> > > whether this is still the case? Today I merged a patch series with a fix
> > > for a long-standing bug that prevented the device from going into suspension
> > > because of mismanagement of the PM refcount. It might be that what you report
> > > as an issue triggered by power transitions is something altogether different.
> > 
> > I’d tested with the v12 iteration of your series in my amlogic-7.3.y [0] tree
> > before generating the patch I submitted. I’ve now tested with v15 (as merged)
> > and other recent panfrost patches you submitted (which v15 depends upon) and
> > with this patch reverted, and the timeout issue with T820 remains. I also saw
> > a splat that I wasn’t seeing with the v12 iteration [1].
> > 
> > [0] https://github.com/chewitt/linux/commits/amlogic-7.3.y
> > [1] https://paste.libreelec.tv/desertic-cataleya.log
> 
> Turns out I was wrong about having easy access to a Khadas VIM2, so whatever I try to
> gather about the existing bug must come from these logs. I see one very interesting
> warning in [1]:
> 
> WARNING: drivers/gpu/drm/panfrost/panfrost_device.c:490 at panfrost_exception_name+0x1c/0x30 [panfrost], CPU#0: swapper/0/0
> 
> Something's causing the GPU to report a fault whose status code is at
> present not documented in the driver.
> 
> I think that, because this seems like an SoC integration issue, and because of the unknown
> exception being reported by the GPU, we should have some further input from an Amlogic SoC
> subsystem maintainer, and also Steven Price himself.
> 
> > After reinstating this patch on v15 + dependencies dmesg is clean again [2].
> > 
> > [2] https://paste.libreelec.tv/leptosomatic-cherlyn.log
> > 
> > >> The transitions complete normally when the GPU comes out of a hardware
> > >> reset, as it does at probe. Use runtime PM with reset and clock control
> > > 
> > > panfrost_device_reset() is always called as part of the PM runtime resume
> > > operation, so I'm assuming what you mean here is that reset control is
> > > deasserted at runtime resume when the SoC supports it
> > 
> > I’m firmly at the hobbyist end of kernel contributors and I’m not able to
> > technically explain the patch Claude created. It’s entirely possible that it
> > pokes around in the right area of code but is not the correct fix, but I lack
> > the knowledge to dig further without explicit guidance. I can also give you
> > remote access to a Khadas VIM2 board if that would be easier or useful?
> > 
> > Christian
> 
> Adrian Larumbe

