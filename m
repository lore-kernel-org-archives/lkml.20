Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793881495;
	b=gua0GSc1gHI/g43YrGiuGcX20XALWO8uY9cyRbYiCsC4rZkCfFEcq3xLTh1UK5KqBJg8
	 bmPpCK1L8p7Y3tI41za5GQfbTi6CuUlioTuzBVWIhf4zKtO2dQrDHLZ1snzL/cfedJBmR
	 gOM7xHEPdDQY/96TrrWLK+WWWbH8fwMLLf5pEUFnPRaRsro/GpYl82ju6+Q7VxW6bnC28
	 DE+N8URDedwAsVllcoM0XrvX1AnxINKGJBM4dLiSnlIdzEg4VujpRrH3veFkm8mmFI85D
	 9kMmuIGUO7bw/mWsaDHn2N8od4ybYRxouQ0XcgGePkRaay6m/6aDpwejOu+FDxWd8pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
	b=G/T1qtDjxFZe+7l7gtPeXEoYPzOd7OpPgumrIg+uAqGGZd+hRTNP/1bWK3sMKXW7Z5F5
	 vcBuGwsFxXLTVPBqh0XrRVYpK8+etl0w03pGIbYBIuqGl8TKeJJ1sggmrsLjrMR4QMpjI
	 hC86TSl2qfdLbSRguOFfX0/syFWg71D3ol6S2Zw2ScuV0KoSQPLgmlGj5FTu1XF5xKrkG
	 2yN6E+4oGxzUUROeiFFWgLJNrw5eeXBGmpOWb3Y/U7gDDPLC93dYABKOl9UfKU+dBI6jK
	 HXVNjetvHFI7mbPwffB5z3pX4hEABr7nP/3LFaYozCG2FqPvzDav9ZR8lENaELEhnYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=kcBMmvpX;
	arc=fail smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AD606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5AD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=kcBMmvpX
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so773109a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:24:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881493; cv=none;
        d=google.com; s=arc-20260327;
        b=EE7MNriWBnimSqvWJSeJuPJJpHLVuzhqLh2WGuSDMBUeti/UNxHF/4Bj0TtjbSNNs0
         2Hv+DiWEeZQquJ5V5voDk3IFnGEe91TZXvMACtKE9h+vn/j5mpv2L3h/tWGC+mGKWmSo
         QfyQv1TLyvlZ28BDWh4Dk8BOIfRq2k98al7T0AzxIc8Nf9uVQwq9MwjzDZjvGbuTVZ06
         uOXqixO6iVZoBvtIGGACKmPwshNcWcIrD7G3OBtJH3Upw60eyqFSs6DkvHwuwVwvx/CX
         tQiqAncNnPlcvNd6PPeZPrEw2nExODe4Zk+gdRcPIGyqkv/uvF1iaj+zGbwBSTnd6nt1
         g8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        fh=8CkgRR73MQIz2aLvdpMRIDtZxdux3diubbjbPMfRC/A=;
        b=qVBam1YzqwD/QYwtbeQMJK9Y+hstP3WuxZVUsZ2xsjwy2BmvU156P3+FtIm0x44jtS
         TFM7lhDfJDarog8UAe4z53yZXVsyiFPDtMVChJ38oQyGccS/yOT7xfLW9IX7yZ9hRhiO
         yQu6Fk0JHmG24kwQWSr/6Z5TM1YGovoiJZInTfglWehdj7CJfhoC8grhWEPBOoP9rx+L
         IoF4h6Av8jEuzW/wUzk3nQx9+kIKx6piEQiYrJWs5ZL7/kG9lO1vxCJ5ZjsTQQO7oQvI
         sxLlzvcbhPE7S5JLR6NGaqd3TW6YRoRpnXVALID1Db/0CTU0Ge/EoXSYFDvPhqY5T6nr
         HbRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881493; x=1794486293; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        b=kcBMmvpXYv2CWWcYZ4Nq744oUcWjgh2I4EUGHa8dPAHmWxKBhzjwmkt9Omecb0hAzc
         ClsaOEubYRmaJAatC5fC4D9IHjJ1uhFO7Cce1aPtD+8RmgcPCDEvWckJL+R6ivDXfsuD
         RJtLn8e4sr59EZOrDAQX5lOmkVigUfATO6/o4gSrfEqCjvY5rrKOfVR2qOrXWO4fVmz7
         IJ6AnH23E4VNebOyOtuhl8mCo3AC/ETkEKr4UOaJqME4un78XRkPQbxOPXbbE0kgIUqe
         LAoIR6hVXczaAdGdRG1oOCZBoXm5pwZZvJgqFMA/XlaufVVhrixKhMHmstWrUpybBEv7
         VAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881493; x=1794486293;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwDskA9fWTX9sBCyIzGNiSQQNIOQGfJ8qP89spP3R4A=;
        b=J9v9uJ31OF3YuQ364XxKXaes1S3r1/her/n2wGXxi/yCO4Xi1plmvG3dzzrpAzk0Ib
         acFZWissS09/964UMcucYYqqVulmVM7pcBTLWe6fytKQRLbzCHOioGcvjmzXzW8rHn0V
         lsKjiPI8QtuQI1GwX59Tb1HoLMHGRvIncfJZ7dtvUfq7XE/fMa1QtX1cJTo2Be4gJHE5
         ir2kuEYC4bSvMaIeAeEN01YaqrXf/xNYfRZguuHuD5S/rCOBdwAYzho3aFKwgTdLQ/yz
         GdVI8+En5yLP1zI01hNfJH+zCYG++wmq9ntpoL4qfmP7tbxEFJRCrLGn55Z7Et4xWbJm
         U7GA==
X-Forwarded-Encrypted: i=1; AKwUvByU/sgrbuBGZnmAK2a0PLNHDxt+qBd6igN5ks7kFSAdKZoHB2W/5eK0JBVxoCFwuH8DYRSngAWc7nLknB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ooW/2ZO/5AgPwZQuhJ9ExodIUG9frLZgDTjA6UwbxEIjO2ULd
	cPpidp3UICQwjw0MLgaYsQcfDwh8E7o2vL35nv9dufSodIgd499HeX2u8AaNYWX6S4O+/4Fmgj+
	h7g/ufcHWvKOKccyOHAsj7+KmoU2WTpBJLAuL4Tj0Tw==
X-Gm-Gg: AYBFou1caMpT8YlE16hzUNk0T9vInLV28j4vY1561pcW2JLodhpeIwMey4FrMtgDPKm
	ktCeAE20xh9lR42/u4x+NWQRLoVG2GYbTmU9rrjcOSkhiz1FMyO4tSmAexDa8JNoZPXU8o2OnUu
	PrcNq9BJSBLJY1WWJZQNEyKVyZNmhUa6fdQggk1r/7osl49eo7/gRDyOO1JW+xq35T1tu0JLdDY
	57KgZPP0GUaoRMusZHXYO1SxMg3DiE0SkxTTnx6u9NmqSkFNLp59D2QhtgWZJ9hPGLd6WoAa6xe
	RcwyrdWZMkq5UyOsZCCEX44bYKfQoqIcixgLM49ngT/PusfhOk/FZjtCEGsOz5IzxG9BVoBTNin
	/XuD8R0OYFHR832NzCamLUP82goo50EhzKppO
X-Received: by 2002:a17:90b:5485:b0:3ad:c482:ae9a with SMTP id
 98e67ed59e1d1-3ae8957cc71mr15827995a91.1.1793881493387; Thu, 05 Nov 2026
 04:24:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-4-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-4-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:24:41 +0000
X-Gm-Features: AclHuK9ClbYY9N6f31xMjtm_H95iii7gcZZZTGs_rA5ccUrhMgtzVapBrsI3_h4
Message-ID: <CAPj87rOgPMc4_nvVj+aHK7qUEQBXCMa4OUHHC=GyYzr2Ls_Wag@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] drm/rockchip: vop2: Balance state on
 atomic_enable() error paths
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> vop2_crtc_atomic_enable() prepares vp->dclk and, for the first CRTC,
> calls vop2_enable(), incrementing the shared vop2->enable_count before
> programming VOP2 registers.  Two later failure points return early with
> only vop2_unlock(), leaking the dclk prepare, the enable_count
> increment, and the core clocks / PM runtime reference from
> vop2_enable().
>
> Since the disable path decrements enable_count unconditionally, the
> leaked increment skews the count, causing an underflow or premature
> shutdown of core clocks and PM runtime while another CRTC is active.
>
> Moreover, cleaning up on the enable error paths alone is insufficient.
> A CRTC whose atomic_enable() bailed is still committed as active, so
> vop2_crtc_atomic_disable() still runs its full teardown, releasing the
> same dclk prepare and enable_count a second time, thus underflowing both
> counts and, where vop2_enable() ran, touching VOP registers with core
> clocks gated.
>
> Fix this by reverting exactly what was set up on failure, and track the
> per-VP bring-up state so atomic_disable() skips teardown when
> atomic_enable() never completed.  Additionally, ensure any further
> hardware programming is also skipped within the affected RPM commit
> tail, i.e. in the callbacks gated by drm_atomic_helper_commit_planes():
> vop2_crtc_atomic_begin(), vop2_plane_atomic_update{update|disable}() and
> vop2_crtc_atomic_flush().

This one is:
Acked-by: Daniel Stone <daniels@collabora.com>

I don't think it's the world's most complete fix which covers every
corner case, but on the other hand, building out the tracking
infrastructure to do that, for cases which will almost never occur in
practice, is going to make the driver pretty unmaintainable. This is
pretty much as far as I think it makes sense to go.

Cheers,
Daniel
