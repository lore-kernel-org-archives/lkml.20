Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793786984;
	b=pbqFr8WZGVZS9REa1YzZdlhJ6Novk6B/ZuUZVRJ9u/SakhNNorpSZ+A6zyjYlQaEf6Rf
	 +g6tbFJI1mWeFso5Ze9VqpP2X8xkX9ez1oIz9dxLzUqAeGDqJw5VAVSqr0JYookF6FyfE
	 1nx4pbbur3StO6TwEX6ZjY/s9KLcD4tt2cLnecRNuwr0fw8fudzWAorWVVGB6oOeaTmZq
	 vCn9L1C3DNB0Wd4bTCNmynEUB11KVLMHMOrngozk+6qph5PyICBssuaqd+OR/cWRkBQ7U
	 JCLqMPL+oO2oOeZ2hmnTCwIjfzNVQWzbf1njDiPHkLav1kidFqzheftDA7511vMORtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
	b=GQtRpo5Ja48N+g37vHnSO5hJ/5T3poMbEiw88VJp+C9jI8BfvnvhquNvzKA0vsSHdjl8
	 08t5uAcC+1FMrQFF4WR2YI8FHUXiEwx5HviY7jiFPaodHgoqYz3RHjDtfMNmSP8JawriW
	 FDop2GO6ociRHG7BBhTF8DqLlqVmQdxN/DJokjjDQEgVI8zI+EJLCGDJQColCFapnGZ3U
	 TmjJJzE8lXqPRJYrhR94++kXG8kphLpDMffsYYxVPFS8xrI8cmvczoYUaNVkr1dYs4Dsb
	 vg8mURBYZbJu01rffePKu8Wu3shdBgduDLJauZi6xCqfeMkEB2zmUPnqdKKmMcO85hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UcHCwjZk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D50606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D50606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UcHCwjZk
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e6eb77f0bso61147085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786977; cv=none;
        d=google.com; s=arc-20260327;
        b=mmC0sEzzWVBSO5aju/4HoWZ6csPw1PwBlosYlwlYkKVvlkGN21vCGT8lucZ4yM8TFv
         b08RMpT3SHCb2iJ17utOWjFSiVKrrsBsvsDnKqr+j1I2uVFsv6TnArCSMxq6R1VL1o94
         4WQczzVd9cUCPc1+MOp790EcPFwECsbQxNDoKbGkpfathzhbJ/zY1BSR9eNAZGF6BMM8
         HDexi229pekkMLftIMjNBGRqvfxZ4qVoCW+uJUOJr0ZV2x5pUbLyaibzvIs8ZNg8lT0O
         w+fXJTq761cQaYQfwj3sbKmK9y9Dx7qlvcXRjSwiFrfEsaqvM1qHVmh/97SlblJvS1oo
         GqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        fh=nTEgCRJoIh8qKNinYFjLM2lLbMGuqQbjuixM5mdTvRY=;
        b=HIAhvtv385BRFO+eP3PaQfkp24jyIU0GVO9GbYJSbczQAzICDtXZKcjIoDsrJjMTPx
         ojOaS675BNHR5ZoMG751g0Uu2USrY56XHRDjCP1jL/ncWOmq+BUwZzFfy/Kz7VoQwEhj
         Sqxs9qk2PcqQhQVhM43Ut258yn4VikGMMB+TZxqmDqI6xZ35UFXMsjYG9LGLFrDsEgwR
         ksSbhL/YZKePMJhSM/QkO9dEm+U+jleOJlimS/v3KFc7xmFsiRyhl3vYl+FGDm3rfOyd
         HIa2vZ9wVIBPPhsT83d5TK9ANjBYbdtLjmw9EQYPG48NX9iYcwpjWhhh+DMkPqUFvb40
         EkZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793786977; x=1794391777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        b=UcHCwjZkxJdU7FrRZcBt1CxKGPzG2AJoKdOEXy6bT0/6tI1dlsBE9UxkNQCTTl9iFg
         CzZsbKtm2Zhe8y6Iek5l+jWdVirGy65os5o0NtAw6vLC1uBwHyEz4DFZmAz9vXWKRjFA
         FyJ0geUDEQnCktWcgRKGpHC5iCBkdyErjWGE7xcafrhlinEyZSdvmGyMbMt14g/ishMR
         7aP+AcCLRYYxfJUen7AxTSj5XlIcIcy2Y4Oy1G37/F5M2NJirI03RNV9XL6KI1+WF1dP
         e/vZncP8FzVcOBM8lQiXqWisOGl+f+l9GXvsQbpEn30kZ99OtKtdpyJju075XZ2QyLUF
         sKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786977; x=1794391777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        b=eZi+gvCMofSc/HGsmKRFRskFlxFWMDqUuTqliT7E4B85k8035p9Jx4oBugPR5P+u9S
         R6sD0oHVQTD2+DDTehKRPBlx49pti/szenRIxW4rXqCVrnmVTJc6OmdLkY0jfy0U6IYH
         X5XPmyrvq4yaBzuvtn1fAxUWHaEzT3F5quNjvledJl1bc+JX1FtlZWRs5AumPTjjkZ2o
         Ac/pI1Wd7ZYFdg47SCWBJltddv5tgVpzp+sCtaM+U/lZj5FzEYuAg8zKcfidJvQguQin
         lPNnK0xcExnq4Ak/cBlZC8mjahVhpBOsnldqKGZAeRelbzwxNumX+zPGBK8/MI8AchHU
         AgPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV5lXK7kGl5O0wXfZyf+eTwRthd2Yfg0QWKMR6Dcun4o06sCEZYxvO10XlkKqZ2sXWQ9lJTYP4B6uDMXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yK/Kzj7aWh52xAqIIMRT3mb4UGqc64UECYuCq+MdBI62I0GPB
	Tatkue5v37RELIArEE4QVOgIMmEYt14WfZW3j4q/Z5PA7UNmELRh9Sg3DPjH7E94VV9TKtm8f3T
	tfnTDu7sYjCMvc10ukyAUFYX7diprkvhrdt6BaYuigw==
X-Gm-Gg: AYBFou0KQ0X47GMJvVMlCWOg6iD0QfTpFYszc4Vv9dOJvK49AKfgTiWLH4IbrVO+dRO
	RqSkbB8fFNa8qOf/QyEiwApptmQq9eGvfIwWa4bnPl4loeTWJbGaX401zTT29psB/SwqQYoHfPy
	YP0U3LaGW3JRemRGNXRKHrWtUubiZ7TnNFK9MoLxnTJWucscnddtficXutYN+0g9esWPTnS0Qgr
	cEHamLeG3gjFrtgSvxNt8iexMNsJ3iMng8guAHrwxvUEYK4vTpkARD0cumNTgBRu84rMrKVKf8s
	/J+A4A5JwgBfjfvaQxn6LDkU+IQNiU8IfNAXfk8yIc7nKd+bvkwrJK7ZtNOM8pRWHywAvw6PN/I
	p6LoA5EMMIfeuamTGBoX1QKHPj7f0y36ADInMJM7ci8IH0/iAj2fBmNOpr4+8vrAeLJq6PLkiZb
	VV/TCStrM9f7svpeM86ZI=
X-Received: by 2002:a05:620a:460b:b0:937:6de8:b40 with SMTP id
 af79cd13be357-944217194b4mr2663985585a.15.1793786977174; Wed, 04 Nov 2026
 02:09:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com>
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Nov 2026 11:09:25 +0100
X-Gm-Features: AclHuK8sSyrPUh77ae7umfCvxuLdQ-s4Z2b2nFvZD8O11RHz5Wmhve3hcOyzmnA
Message-ID: <CAPsqS2SOj-+VQxsFvMQ1Hqcep55J0yT++76QZ8or4a9kmF7Bdw@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org, 
	p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com, 
	royalnet026@gmail.com, abel.vesa@oss.qualcomm.com, 
	sebastian.reichel@collabora.com, sidong.yang@furiosa.ai, 
	u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com, 
	diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl, 
	jeff.hugo@oss.qualcomm.com, rfoss@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 9:31=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> wr=
ote:
>
> This adds the RK3576 NPU to accel/rocket.
>
> v15 is v14 rebased onto next-20261030. v14's 12/15 no longer applied
> there, because Sidong Yang's regcmd validation added two defines in the
> spot where 12/15 adds its own. Nothing else changed, and the tags carry
> over.
>
> Leonard Lausen has the series running on a NanoPi M5 and posted a board
> patch on top of it:
> https://lore.kernel.org/all/20261019090348.378183-2-leonard@lausen.nl/
>
> On Sashiko's two points about v14 9/15, I measured a CM5-IO. U-Boot
> hands over with the NPU domains on, and the power domain driver still
> probes. The NPU QoS is saved before its first power-on, so it is not
> zeroed. The domain whose QoS does get zeroed is the GPU, on mainline
> without this series, and that fix went out on its own:
> https://lore.kernel.org/all/20261101055633.101309-1-gahing@gahingwoo.com/
>
> 1/15 is the patch that carries Igor Paunovic's name. It is also part
> of his DVFS series, so whichever lands first, the other drops it.
>
> Ulf offered to take 7, 9 and 10. 1 to 5, 11 and 12 go through accel,
> and 13 to 15 through rockchip. 15/15 needs 9, 10 and 12 to 14 first.
> Without 9, 10 and 13, the ROCK 4D takes an SError at boot when the NPU
> domain powers on.
>
> Link to v14: https://lore.kernel.org/all/20260924102135.92217-1-gahing@ga=
hingwoo.com/

Hi,

Could you please add a GET_PARAM IOCTL to this series for userspace to
query the hardware version? I think I would return an enum that
matches the NPU DT compatibles one to one. Then userspace can have a
hardware database indexed by that value with sram, register map, etc.

Regards,

Tomeu

> Igor Paunovic (1):
>   accel/rocket: request the core clocks by name
>
> Jiaxing Hu (14):
>   accel/rocket: take the completion register writes under job_lock
>   accel/rocket: wait for a running IRQ handler before resetting a core
>   accel/rocket: let the core suspend after a reset
>   accel/rocket: factor the completion tail out of the IRQ handler
>   dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
>   dt-bindings: power: rockchip: allow resets in a power domain node
>   dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
>   pmdomain: rockchip: add optional per-domain power-on settle delay
>   pmdomain: rockchip: cycle an optional power-domain reset on power-on
>   accel/rocket: select the per-core clock and reset counts from match
>     data
>   accel/rocket: add RK3576 NPU (RKNN) support
>   arm64: dts: rockchip: add NPU core domain clocks and resets to rk3576
>   arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
>   arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
>
>  .../bindings/iommu/rockchip,iommu.yaml        |  28 ++++
>  .../npu/rockchip,rk3588-rknn-core.yaml        |  47 +++++-
>  .../power/rockchip,power-controller.yaml      |   8 +
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      |  22 +++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  86 +++++++++-
>  drivers/accel/rocket/rocket_core.c            |  32 +++-
>  drivers/accel/rocket/rocket_core.h            |  11 +-
>  drivers/accel/rocket/rocket_device.c          |   7 +-
>  drivers/accel/rocket/rocket_drv.c             |  42 ++++-
>  drivers/accel/rocket/rocket_drv.h             |   2 +
>  drivers/accel/rocket/rocket_job.c             | 157 +++++++++++++++---
>  drivers/pmdomain/rockchip/pm-domains.c        |  89 +++++++---
>  12 files changed, 467 insertions(+), 64 deletions(-)
>
>
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> --
> 2.43.0
>
