Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794131;
	b=jiG51J/hVIQ/SuNsib0DPVtgq7PX+S+qSNt+RvET3r8apAoH+/lQSuUYv/UG5fcWpxwV
	 80WRV3Hjbk1WbVnY0N0yjFCRSerxNyzI0eF+VQPqWrNetPL0REZ3oF4R+D6zM8SvvxT+a
	 q6aAhgPoE4D7FR+55+V5/daPUoIlBajxQH8aeAxz76iDa+UMbV5dLT1NfIj0euj0R5VxL
	 K4Iakxp+wo18sGWT2zj5C9pj+3mmt5tGmJMFlRt4ur1byGVLSxEO29gskJcI59Qrvi+gB
	 SulKm/cCo55GimP38quq3nI9LmwTlyqyUPnyTAjl2xjRbBu3iOkq5wPR/71aYbAWXyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794131;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Ha95tUVFvbef8Jnm/EtOJv0oztJbiVeJR2PUT0pSnG0=;
	b=vM400IqaPi8YJw+UZwQkufD8VextGWNX4seK2x0RsJsAZPigoPMaB32n4BJEeqrsZXZu
	 5wMBM3ANI9sT02pYfG96KU15VNW+SnaEbl4SmSTp44VBzs/rvWu9Emx1ubR/IM3yoLxVs
	 3T/ufsnPvS2WNdFiHfrLhTRA43sfHYDMmvpeCQpWrstgDumPzbNqX/jAfYPzqImtUEAIb
	 HR3ZXfbSnB5EmaiA8+1qvUin0Kf5UmzO3VMIy9CwqnMOnj/szdzW4L/8Cuphh2ti/N/b1
	 ShTloEc76F8/0w/ltZvwbAulJIY2QOl2+VvWSTkohdIyktwcEviQIcfIOrosRK6cAmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=temperror header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b="nrgc2LH/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iC6+m3yf;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F91606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F91606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=nrgc2LH/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iC6+m3yf
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 645C07A0181
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:08:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 04 Nov 2026 07:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793794123;
	 x=1793880523; bh=Ha95tUVFvbef8Jnm/EtOJv0oztJbiVeJR2PUT0pSnG0=; b=
	nrgc2LH/rQJsCgvNAfVOYZmoUmpMb9J7BQ7InLlrz1Si+6xNHp7IERX47mmjlLAE
	9FfpzBeD73OrwMNR0zfL7oA265j6/iMk+ptaehDTK8ouDgskNmG+2EkunjH/axOX
	qaD5GhplQ8F2MAqzPqM7r8ycdIcEwX5LKp2UwEih8AcXdP4AWqgdwRiPztgAniqU
	l4m3BonTqytxRltRAONTl6BejxAJ8tZO8yu9ILr6fKZ+xBP1D3zKx5FK0wQ6Pkgm
	kp4RvIujKIVJc8omn6LFBjlTpuJfuAuBqb52Dg/dYX2zfMGM4UdsigpOgtlP059T
	Fk81MUCnA00iJvEK9M4A2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793794123; x=
	1793880523; bh=Ha95tUVFvbef8Jnm/EtOJv0oztJbiVeJR2PUT0pSnG0=; b=i
	C6+m3yfjbGEE/k2XkI0ccU+F3Fge9LbXJooUVCDbV5sEP/Zld7R1o3oD65+zZRTT
	19Fk24F9Ix36Dd2nJhMFo5GtqiJJBDVaJEtqNgMEXx5jdrMpsRiK8N53EPE8NxL2
	T/+Q6Dw/YP2OVCKu0Osenh25i0b+Enrfv2jJHSz0oepu7eayRQjn3KUSVqNMks2n
	gsMUkgIgxC5j5uMHpt0OEglw5w/Ywls3LDdI3mOwS1i5Mx4V7p9bAOLy9blgKpvu
	2TRYjNYR934snzO4vk5GumsGfoLxii0m7TjefAQMYDeOWwmN3m3UunVW2Sxdv4/J
	RZiyC526+EYSahZDrvaIw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793794123; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:V/wMhsjfSvc2EFlaXLynKjXP7osCNC3ahx7eIpiR35vM/4k
	y1ytnBcmz9XnofsAU5wsedh1ICT6/strVaz2gV4+F7IUuBoNEWMBheBl6XB9rS8r
	lrV8RhxhqnxAOcbGNPWw82GnOihh/Wbgyb2LhBo+YF0lJs01+IrjOA221e6N2E0a
	sIagUTOQ4w+2n9mRnkVWsiXUm0Ii/lj5ZsEzVu5zlPcOZ1VRXAyo5W8hiQDPerWh
	v4iI81vBtZtHG+U9TVfZWoDWCb5yd9nnyvQHz+Py3lU9olg8A2E6I0crl1S8eZOz
	KuH70LsS8LPRH5ItI4KMW1NLrx1IjH2qjnCMfcQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:iq7+eC97MvUIif0lc+C0hsEZz8rVt1oD+bG8YPcKuUY=:2HP85t6sUSrQXl9dARzlF2lfNnykW6yC3ekysC6UnyU=;
X-ME-Sender: <xms:SyDravvRE33Lo8IsuMIL8CFIK7L_1R23bmUIz1xlLRAr-dvXsPQKUg>
    <xme:SyDrasW8YESNolcPzjzmfaDHr2nGTGOpwdslgGsfERsWHRxQjC6mo1bb_YTjr07RO
    ybjLrCeZIou7XDDGJ7iBKgjh3J34VmZGZsgYLKcg3teW1BpQLcBVGY>
X-ME-Received: <xmr:SyDravx4MLJW4Vo53dSLMXrlWt1U2TD8VCrrEDWXFlTyG2raGX4r5Md1xQYNMgVVN0YY4ozyxeCyeIMg5RjyNtFvONnf7w0>
X-ME-Proxy-Cause: dmFkZTFWBTx2Gy3fgW2vFvqZLUtP68yO2YegaBBKFyM+kvOL1Br8KeTM0G7Qtaectxl2+/
    kI10Osb9hxILD901OotKT/HDXw8oVIf7wdN1ZnQa+yb3BKTx06WtpATuifZYXoXGUou2Ij
    dV6OqEQnYhplXaN+1DYFn/nvpdTZG4KAN3npVyEd+KrBQ7t2IKDfAnm51kfpHYR/6oWkMf
    99XpxRSP7VV0G7d9nVJgic8Ux9sWwxSTUAObRNmMgV5z7/LJRvxtzxlsdeoTGc9cWCiFj1
    iuFxY7+8iUIx+FZmvDHrJDoRR88eqz6YGHEsbnxHyn+GXkjD9KxeTiGyezU5AShEBLRqX/
    8tmWVSS8OQKn8dOAcSTxBZH8wgIMClax4aSh+ITOwt51tkYsPD8tEpJW9BcQLxrvs9PWjg
    ueoosDc1/IeUtL8z+4f79Vc4l5y8kI137AWqXGBsA0lZyQDYTSprU28FNDNevsnHCjM3s9
    wSd1ajHN2wy9wxcA9/0BHfeq0uNAvhbM5lnP7yyV8FVm0qopq25ebLblfTiAzZj8eOkclK
    pvwhpmO/vmqVuyFxA/qx2QsgrNfjLSPVcdoNrhDSHW/xi/Iqj2w7NCR6ZyMZxgrLZh1oJ5
    Te2esut/6Akjb36ogEB65IWbH7XV3Edl3TGQLfJllYJ8APuIJ/w/gNqrIf9A
X-ME-Proxy: <xmx:SyDrajFW1zhJ8aHtLNOITIwYI7Cm2cG48TC7yRhjKfVtnn4UK84I-g>
    <xmx:SyDrakvynGbd47RJnroA1RWhov71XvMph0vc05aNOK0PD2S58-fAUQ>
    <xmx:SyDrajDJVExbXNegCByGeffnJ4j5Bx5qzOnHYOcqdszsX0gU18XjXQ>
    <xmx:SyDravBfpQvzHl8JpyI-lYI-qJbr7M9wyt59nCExslv6t2eFfoMgMw>
    <xmx:SyDraixuYMMP7YTXznjAlOCsDZHkZ67HFNi8rjYtX2GG-1_6tFOLRwVL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 07:08:42 -0500 (EST)
Date: Wed, 4 Nov 2026 13:08:40 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Li Ximo <lixicaicai@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wang Haoran <haoranwangsec@gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: fail probe when no
 sensors are probed
Message-ID: <20261104120840.GJ1959885@ragnatech.se>
References: <20261103084604.700540-1-lixicaicai@gmail.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261103084604.700540-1-lixicaicai@gmail.com>

Hi Li,

Thanks for your work.

On 2026-11-03 16:46:04 +0800, Li Ximo wrote:
> From: Wang Haoran <haoranwangsec@gmail.com>
> 
> rcar_thermal_probe() returns success even when zero sensors were probed
> (the per-sensor loop simply falls through with i == 0), leaving
> common->head empty. rcar_thermal_suspend()/rcar_thermal_resume() then
> call list_first_entry(&common->head, ...) unconditionally, and
> list_first_entry() on an empty list does not return NULL: it returns
> container_of() of the list head, i.e. a wild pointer into
> struct rcar_thermal_common, which is dereferenced at
> priv->chip->needs_suspend_resume and in the MMIO accesses that follow.
> A malformed DT node with no MEM resource triggers this at every
> suspend/resume cycle.
> 
> As suggested by Niklas Söderlund, fix this at the root instead of
> tolerating an empty list in the PM callbacks: fail probe with -ENODEV
> when no sensor was probed, since a successfully bound driver with zero
> sensors is meaningless. The error path through rcar_thermal_remove()
> already tolerates the empty list (it iterates with
> rcar_thermal_for_each_priv()).
> 
> This issue was found by static analysis; we do not have R-Car hardware,
> so this is compile-tested only.
> 
> Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> Reported-by: Li Ximo <lixicaicai@gmail.com>
> Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> ---
> v1: https://lore.kernel.org/r/20261026115018.3227372-1-lixicaicai@gmail.com
> v2: completely rework the fix per Niklas Söderlund's review: fail probe
> with -ENODEV when no sensors are probed instead of guarding
> suspend/resume.
> 
>  drivers/thermal/renesas/rcar_thermal.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
> index 9a9038671..6a1e977d8 100644
> --- a/drivers/thermal/renesas/rcar_thermal.c
> +++ b/drivers/thermal/renesas/rcar_thermal.c
> @@ -514,6 +514,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>  			enr_bits |= 3 << (i * 8);
>  	}
>  
> +	if (!i) {

While this works I think it's fragile as it depends on the loop variable 
of the last loop. If the loop is changed, or a new one added, this check 
can break. Why not make it robust and check if any sensors where added 
to the list containing sensors (common->head)?

> +		dev_err(dev, "no thermal sensor probed\n");
> +		ret = -ENODEV;
> +		goto error_unregister;
> +	}
> +
>  	if (common->base && enr_bits)
>  		rcar_thermal_common_write(common, ENR, enr_bits);
>  
> -- 
> 2.30.2

-- 
Kind Regards,
Niklas Söderlund
