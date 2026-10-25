Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945595;
	b=a1MKMe2Tpp1oMQ6dDCdFp45Ul+Y+zgzvTx4i6sltrOLGgnDXMBPCdwODwv+N5nWaquaO
	 URQjuvQhZegkFpftskbZYa1kdKXG17XsXZxnl+j/EaUsc/kku/izKd0aHE5maiCu4PUzZ
	 cyxyh1hJc1g2Ru/Ck9Ova4QgYo+WYbTUqyHUm9IyL38Ob1vCpm9K6OrPhiX/CJNhZUzVp
	 JtMjSMKJdkNI0KhZwysvYk/fsHnupWeJt1n7QlvhCQHkTqeDuLwZF732TFjXoGr0U1t5F
	 QfTJuUD5O5awHvVV2QbPV9tSJ+9Ai0WFO6XP8vEizd8klIY0sTPpixI6SWuDYgIzvhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945595;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=uqZQerqoJ7/MS4dU837WwyCsza8b4Vifg7wR9bgeeDI=;
	b=MWKujowouq13tEaVvByVZZQH8Pch8J6bM0W/HgS6C1ufVBJSHySzqyyLLgcwaCU2IZbP
	 pETf4gJ5qzf4bNNU0qCHo2kiZ86cS62dDQNcVNLkcTdsI0JXpGuVw/WyAQYn7uWvPfXla
	 r0qGNEPnVW61NqUtwxScAC8wv5jzrV2vXQE57gGBdRsX/Wd6rtlYnNMdgKC/4KT1RmOaA
	 06TOSumibVK8IvU4mxLIn4mF1OvkB6C9FFVRtaL4imAoFkI9WeYTbBOKCqJ79CNqsJdRm
	 uiCTvmU5wXWIjd7Ptiv0Ptn2w8ENEzaINs26kUOPIIkEk1Lii7WowHfdjJEWHkguIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=i0Np08np;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB30606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB30606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=i0Np08np
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792945592; x=1793204792;
	bh=uqZQerqoJ7/MS4dU837WwyCsza8b4Vifg7wR9bgeeDI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i0Np08npdQa7n46TZKvlmT0FyPg+jcOTLC/vyOMLNRJW8hOFqI4R3k0iIDNdr3x2Q
	 EcnFrejd793ffrEXLkq1SF4H66VbKnhvZmm2vZgFhqWvP0q3o4X5lvq2Tmee/som6s
	 mDixXn6xR/WMmn4H34pD5tmvnC8uxJWIhkeGGO1bgweWGvg8Aw4QpdCm2tGDYJTzQm
	 WyPqHiFBTgFizdAmlLnc9oY7rWG7s0zLDqZOWOEdnQ6AZJbygp8rfW7t26iKhxmgNw
	 VW3JYp3YTjvw0v9VMy9ECE/mGjsl3DsrXZc3uZ5JqL7EdoZh+lUYJXnrjOEfEbuIVN
	 FnLlaEA6QijAw==
Date: Sun, 25 Oct 2026 16:26:25 +0000
To: Fernando Rimoli <fernandorimoli11@gmail.com>, Hao Yao <hao.yao@intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Message-ID: <20261025162614.95385-1-lsa.uz@pm.me>
In-Reply-To: <20261025155048.42957-1-fernandorimoli11@gmail.com>
References: <20251208035122.2147678-1-hao.yao@intel.com> <20261025155048.42957-1-fernandorimoli11@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 24b7469bbd568c8aed6d0f1288c127ce1d6ee0e5
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
Content-Transfer-Encoding: quoted-printable

Hi Fernando, Hao,

On 25/10/2026 15:50, Fernando Rimoli wrote:
> I cannot tell from here whether the Alder Lake _DSM takes a different
> value for 24 MHz or only produces 19.2 MHz. If you know of a way to ask
> it, I can test it.

The Surface Pro 9 DSDT in linux-surface/acpidumps (surface_pro_9_intel,
a 2022 dump) suggests it takes 0. Its _DSM calls ICLK.CLKC with the
enable, which goes into bit 1, and then ICLK.CLKF with Arg3[2], which
does

=09CLKx =3D (CLKx & ~1) | Arg1

That is the Tiger Lake and Alder Lake layout in coreboot
(src/soc/intel/alderlake/acpi/camera_clock_ctl.asl), where bit 0 is
"0: 24MHz, 1: 19.2MHz". So 3 sets bit 0, which is 19.2 MHz, and bit 1,
the enable. On disable, CLKC clears bit 1 and CLKF sets it again, so
with v2 the clock would never be switched off either.

On the Surface Pro 11 (Lunar Lake), CLKF writes Arg1 & 3 to bits 1:0
and the enable is bit 2. That is the Meteor Lake layout, where 3 is
"24 IMG" and 0 and 2 are 19.2 MHz from other sources. It fits both
Hao's oscilloscope reading (0 and 2 do not change the clock) and 3
working on the Surface Pro 11.

Fernando, a run with 0 in place of 3 would tell, and your own DSDT
whether it still matches the dump. If it gives 59.14 fps at 396 MHz,
the value depends on the generation, and v3 would need to pick it per
platform.

Sergey

