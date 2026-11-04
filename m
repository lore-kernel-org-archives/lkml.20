Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822376;
	b=15AMQDkhLLe1Ij2gT+Oquk9tjBp6dGAF26FWigskLkwkARlsTOJfW3WBGC5+k2rYeguu
	 +DOmyGYEqEi1hN2e57dwlmjS8PP4XNrHz4mUq1teIlD6vu14F1UvkR7a9QiqImOL3G1o0
	 NkmIN6rXXzy1XlF+vE3HcMqCxFMBQj+cJ6K8GReNSsk/D/OyHgeFlhX2Au2KFZuvwM335
	 UAM9YySElRr0DUwdd3RxseJWoH1MJuwRAMvw0Ii+KT7GmBZ1jp5gM0Qrk5kMy8fJsyPve
	 ng0o+Y0zNmqvwhxB7IDxrZJ2F42mldORgBGqJ8LbJnnRTfdUj1YoiKWys5gj1CwS+JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822376;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ItJWBgurNWrKzbA3+9kWCtCIwN+CzwIffxyCOBCEeZ4=;
	b=YHugIEMLjLisWmNV4lQdwECznRtGCZjdnqI7MCokJg2sUpOkUJyHoBZkifU1buWKClhv
	 9eyPGJXdNtakzDI1G0OISokO9QcONGC9f+3kS7cKgx6skCkCUfNBU1qhSzduxwNYpGLoN
	 WKezrC/okoj0c/niuPVFEeg9SyIywly74/TClcbZngpBvxHqKTEVZ1xb+UTM8vwhzQWI+
	 95c52H6DwM0UkCQ2IOLXOftTi5+zNuXBHipY7j/bebV2UFXx3LfvJJGDUFynMtcxI3dA0
	 2iAVkPXCULDjN250r2wUmCjJq1JjmdosMQhz/7S0qDHC0BHPXBc0ifnOE2tuyr7ycrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b="F/mPSDlc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3034606E4CB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3034606E4CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=F/mPSDlc
ARC-Seal: i=1; a=rsa-sha256; t=1793822353; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=dlV+Ny7hMOkt5HlZXhS26tgvbGlxQSLVURMm88dYkJMHWlULVV0zmrBO9gxBn7WMswHyq/aRkHk/hkyUyvQvScLFrcd8md0fionlD+5VJGGGlpae+fCFMb/iWwjsmTQeHrRisYXN+w2vbaABX7Rhqsco+EvwZnyT7xXZBsWUXTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793822353; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ItJWBgurNWrKzbA3+9kWCtCIwN+CzwIffxyCOBCEeZ4=; 
	b=PHRuyDioZ2UmrngLNTXv1sxpH7KF6ZBwgzXJgOwZ5rnw0a0Aq7NDbBfsyHjNUGBJwUnw7IxEoBUBo73S9YeWNC9D6cNo4Gpp2E3Y92HjLrV1SSKbUriY79tl6jBRoJ2xGgp54GzaX4L/+0woOci0HiY4/Iu0wyvaQGRKFob+b+4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=F/mPSDlc4uIp6nAJHIOr/sNm8CuQcnOjV63n6wSvUpp1rZ03Ldkn+O6DHim38i2EcxTOGPx7aGWqjPccxvtEG+L0CnB5dOhByaaEYd6rxSYmXDvrFrB9l6yiwzpf2SdRkXldpUkcc/j9XVnviticvo6Y8DKw3tzzz0kxkrtonrM=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=ItJWBgurNWrKzbA3+9kWCtCIwN+CzwIffxyCOBCEeZ4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793822350815917.9354164021267;
	Wed, 4 Nov 2026 20:59:10 +0100 (CET)
Date: Wed, 04 Nov 2026 21:59:09 +0200
From: Igor Velkov <iav@iav.lv>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: iav@iav.lv, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/panfrost: Gate the RK3399 GPU clock in runtime suspend
Message-ID: <20261104-panfrost-rk3399-pm-rt-larumbe-reply-1@iav.lv>
In-Reply-To: <autNWETrwrHbD2H9@sobremesa>
References: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv>
 <autNWETrwrHbD2H9@sobremesa>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Adrián,

On 04.11.2026, Adrián Larumbe wrote:
>> On ROCK Pi 4A restore from hibernation hangs in genpd_restore_noirq()
>> of the GPU while panfrost is bound. With the clock gated in runtime
>> suspend, as on the Allwinner H616 and the Renesas parts, it restores.
>
> I find the wording in the preceding paragraph a bit confusing . Would
> you mind clarifying what 'parts' means here? I guess you refer to
> specific SoCs.

Yes, SoCs: allwinner,sun50i-h616-mali, renesas,r9a08g046-mali and
renesas,r9a09g047-mali already use default_pm_rt_data. v2 will name
them.

> Also, I wonder why not disabling the clocks would forestall coming back
> from a power suspension state. Have you raised this matter to the
> maintainers of the RK3399 SoC subsystem?

The kernel that reads the image never binds panfrost, so after
clk_disable_unused() aclk_gpu stays gated. The restored image still has
it enabled in software (enable count 1 since probe), so powering the GPU
domain back on, whose clocks include aclk_gpu, only bumps the count, and
the QoS writes that follow in rockchip_pd_power() go to a gated block
and hang. I traced this for rkvdec [1]; for the GPU I see the hang at
the same spot, genpd_restore_noirq(), and gating in runtime suspend
removes it. I haven't raised it separately; Heiko is on To.

> Would you also mind describing what you did to reproduce this
> resume-from-suspend issue? Lately we've been getting some fixes for
> similar SoC issues and I wonder whether mine also has it.

It is hibernation (restore from disk), not suspend to RAM. ROCK Pi 4A,
drm-misc-next 33ed26235db9 plus [1], panfrost as a module, bound, GPU
idle, swap file with resume= and resume_offset=: systemctl hibernate,
power off and on. Without the patch restore hangs at "panfrost
ff9a0000.gpu: calling genpd_restore_noirq" 2 of 2, with it restores
6 of 6. A quick check on another board: with panfrost bound and the GPU
idle, its core clock keeps enable count 1 in clk_summary.

> If this patch depends on another fix being merged first, I think it's
> best you delay sending a v2 until it's been committed to its relevant
> subsystem tree and changes pulled into drm-misc-next.

It applies and builds without [1]; [1] only gets this board through
restore up to the GPU. [1] goes through linux-media, so I'd rather not
tie v2 to it, but fine either way.

> I'm not entirely sure about what patch submission guidelines say about
> testing information, but normally commit trailers must come about
> last. Would you mind then moving this to right before the S-o-b?

The test notes are below the "---" on purpose, so they stay out of the
commit.

>> +	{ .compatible = "rockchip,rk3399-mali", .data = &default_pm_rt_data },
>
> You're effectively adding support to a whole new SoC. This made me
> wonder, are we sure suspension resumption not working is only because of
> GPU_PM_RT? Shouldn't we know first about its supplies and power domains,
> and any potential GPU quirks? I think this goes beyond my knowledge, so
> maybe Steven Price can pitch in.

The node already carries "rockchip,rk3399-mali", "arm,mali-t860" and
binds through the fallback today. default_pm_rt_data differs from
default_data only in GPU_PM_RT; supplies and the power domain stay as
they are. The RK3399 GPU node has no bus clocks and no resets, so
GPU_PM_RT changes only aclk_gpu here. Steven's view is welcome.

[1] https://lore.kernel.org/r/20261030-rkvdec-runtime-pm-clocks-v2-1-8ff510a231de@iav.lv

--
Igor Velkov
