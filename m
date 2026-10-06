Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B193812F0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323383; cv=none; b=VLHj8k21yEANNVJvOyxFt7DVQwJIAZl5y1w8RMJ5e9G6r+NNhOasH/cirI7yrg5+DNQIsayT+l5AAiNcOuP1UsLk8Ybs1t1tqAOQBVOSlfqs/xINg8yeEl7MH39V4SI0z64ESYTcQCafV6cF5751yJ5AQnkKZYgu+wZHMS8OUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323383; c=relaxed/simple;
	bh=M+ZrfpMpOAvEiG18evASm296Y9dE9aa72dNu8OVc2gU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZD7Syl1nVp2D5HAzloCWIYXqkD1UqY/8CA8415LFe8yn2N58F4MA6VmERJDeM6P8BZSTBzYyjB+nvCICekI7Zof4MgtmJQyTzS0aDtG12BareBgP6TkXfaHYz4zZJ2gAK+zguFoMItFjY+zj0/5yQ/8B4mNzqKZ/jxFYG9LHVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfuwGzHx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfuwGzHx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso7940045e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791323379; x=1791928179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cu+GVkCajxPYQmFp/AWJCNy8qQQm8s58jI6EnwyitRY=;
        b=MfuwGzHxkkIpAHvfAqWShKpF/VOy8g9eTMV/sRmKkSa7I4AafXkmiuKXO4QjBbhTjJ
         vfl1UDHlluQHE8aCWX8qB3wRp9avWDZ4FAf/QtRdgyoH2zTLok4mQg6lt/69Cjdp6mlU
         K9oDUr+Fmf9fNOVlq0nojXJ4won+xiww9p9r1qvqwkWFmKumnZ44VA9GxEpMEGUbn43R
         sCR4nBsGPVYemFtguzzzRkwvmb090ZTOZZ/kwc2cdMe6ElJp/Ihyycej7JmwJDmSapZ+
         QqVBjWZ+pQb9AKKimWybQICTyoPgBxR5Gv6JzpD9L7MMN9eZ8ZS3YiE54hWE1cU+Mq0V
         nD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791323379; x=1791928179;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cu+GVkCajxPYQmFp/AWJCNy8qQQm8s58jI6EnwyitRY=;
        b=IplEljbG2Rke7bHVZgFdETIXn9m48C8r0iVgIDavfSEPKrZP8lu9MUwJD/3h9oZyE6
         gT1pRkRQMOvIWd/pqSFgp0g+TfOSG+vKMmbDGnf0rc5fGwKijRZ2qDGi6cAVbgKEKsV2
         g0j7IUmbTg3evLr7tzmJXkAknNDdqPOX1X+P82DbpH8tefAnvQeR2+SspGgVVNwLwsVd
         eGgXpHFwg9Y+baIqbX63WT6+xL7ybpdt9U6bKHNh/flAEym0LcV3z6BCeLxpf0a7cZ0K
         SY5Pf7kdkONIvs+/SibPqEP0NZgElnhq58pGC8xTv3Nw4aT6W4xBot9KZz/9O/m6jB8h
         Vbyg==
X-Forwarded-Encrypted: i=1; AKwUvBxmSbNweD6lbd7MYI0NHinp5r4/paIMbwc82UM+l7fsyR/o3GZGmcFBnqUqefiRAcfKl6uGT6qKx2JTESo=@vger.kernel.org
X-Gm-Message-State: AFuF++kzAGhnCWdMduVvskjHKo3ryHkMjHBrRO9hp2gr/uHCDbJ/F371
	KgaJytFjhl+NH8YA/BxqqGpZPdGMwBuHCzEuBTHnhIG/DCI850crbifh
X-Gm-Gg: AYBFou1rxyZ3WEWnuX2ksP4Z/1EbY+FiPX0L96rBKd/cUv5TQSgW1FW7zNqqvEi8eQ9
	fsCtGma7RNamsDyOiPC9nYKbdG3hUQZhPhYE6VfBhyUJDOeeU0gvXhZBdxp1O4lsu3CBq445Meu
	8V3lvO1/tqjfhcoCasv7IlyVrEOg277BzA7sa0vzOL5cOsAUfNbDbfSrG/i+yeDy1a3rrZbHPF8
	0U6uE3iAIRbbdcr0aNXbE3Qm6fyu8Qntfy7apRslRQRUc29yg2I9WntYTJxnFpSNDHvzATxNCIz
	wh5OCh/cLr0eGr0zadGRuYCQhvqZwAOErSKOYPXSxu4tbGt3wti/SI8f0qI+oTOqb+Qm6ODi9Sz
	P7GDut3wxSPLnjGbmBtbS06J9WYD3eZsK+mHPP/lHYtIzyibSlFdPwx2dM/Em0392lHbsugttFH
	1CTpAU0xawpzKyBQqIhc3/DxWc8H+BCSAayupqYd/p2HkGBWhA4U5/7NvuzzL2Pn9/MW6KsSNcW
	4lt/ir1lg==
X-Received: by 2002:a05:600c:154c:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a18043b284mr2285345e9.9.1791323379475;
        Tue, 06 Oct 2026 14:49:39 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17a0fc2e4sm97768435e9.3.2026.10.06.14.49.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 06 Oct 2026 14:49:39 -0700 (PDT)
Date: Tue, 6 Oct 2026 23:49:35 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: IBM Power S822LC: pci 0021:0d:00.0: xHCI HW did not halt within
 32000 usec status = 0x0
Message-ID: <20261006234935.0c40c635.michal.pecio@gmail.com>
In-Reply-To: <eff5ca07-26a9-40bd-8668-6e6ed69fe587@molgen.mpg.de>
References: <fb68e15d-b8f2-42ac-aa65-0d9fedcfcdbd@molgen.mpg.de>
	<20260506193037.6de9e355.michal.pecio@gmail.com>
	<69fa1c3f-3ea9-42cb-a49a-7da39f72806e@molgen.mpg.de>
	<20260512012006.66aeb0c5.michal.pecio@gmail.com>
	<6106b5b9-17d2-48be-8215-3320f3d1d261@molgen.mpg.de>
	<20260512102233.290d3665.michal.pecio@gmail.com>
	<eff5ca07-26a9-40bd-8668-6e6ed69fe587@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2026 17:32:09 +0200, Paul Menzel wrote:
> As a further data point, adding `ppc_pci_reset_phbs` to the command line=
=20
> also gets xhci_hcd to initialize the TI xHCI host controller:
>=20
>      $ lspci -nn -s 0021:0d:00.0
>      0021:0d:00.0 USB controller [0c03]: Texas Instruments TUSB73x0=20
> SuperSpeed USB 3.0 xHCI Host Controller [104c:8241] (rev 02)
>=20
>=20
>      [   14.050249]   Issue PHB reset ...
>      [=E2=80=A6]
>      [   19.339822] ehci_hcd: block sizes: qh 144 qtd 96 itd 192 sitd 96
>      [   19.339919] ohci_hcd: block sizes: ed 112 td 96
>      [   19.340538] xhci_hcd 0021:0d:00.0: xHCI Host Controller

Hi Paul,

Are you still interested in this issue, or happy with your workaround?
Maybe both?

I have some updates:

We learned that the kernel does dodgy things with the FW handoff
protocol, particularly with TI chips. This may possibly matter if
FW is involved. I could supply patches to test this hypothesis.

A suspiciously similar case has been reported here:
https://lore.kernel.org/linux-usb/b43b9d21-4134-4e4c-89d8-f867207b125e@linu=
x.intel.com/T/

There is a new workaround: PCI device reset before kexec. Weird.

> No log `xHCI HW did not halt within 32000 usec status =3D 0x0` (or 0x10=20
> with the other patch). In `arch/powerpc/platforms/powernv/pci-ioda.c`,=20
> reading the comment in `pnv_pci_init_ioda_phb()` suggests, that PHB=20
> should be reset also in the kexec case:
>=20
>          /*
>           * If we're running in kdump kernel, the previous kernel never
>           * shutdown PCI devices correctly. We already got IODA table
>           * cleaned out. So we have to issue PHB reset to stop all PCI
>           * transactions from previous kernel. The ppc_pci_reset_phbs
>           * kernel parameter will force this reset too. Additionally,
>           * if the IODA reset above failed then use a bigger hammer.
>           * This can happen if we get a PHB fatal error in very early
>           * boot.
>           */
>          if (is_kdump_kernel() || pci_reset_phbs || rc) {
>                  pr_info("  Issue PHB reset ...\n");
>                  pnv_eeh_phb_reset(hose, EEH_RESET_FUNDAMENTAL);
>                  pnv_eeh_phb_reset(hose, EEH_RESET_DEACTIVATE);
>          }
>=20
> At least, I=E2=80=99d assume that kdump and kexec are similar, that both =
do not=20
> shut down PCI devices? (Commit 361f2a2a1536 (powrpc/powernv: Reset PHB=20
> in kdump kernel) from 2024 adds (some) the code above.)

Apparently, we try to shut down PCI devices on kexec, unless loading a
crash dump kernel on panic. So as I wrote in the new thread, we already
call xhci_halt() before kexec, the xHC should be halted, and for new
kernel xhci_halt() should be almost a no-op with guaranteed success.

It seems that we are failing to actually halt it, or something (FW?)
touches the chip during kexec, or something else is quite weird.

Regards,
Michal
