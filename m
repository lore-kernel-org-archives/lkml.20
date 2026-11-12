Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472816;
	b=3aLUnq7T7+jCLrrsjQ9uZppTnYRarTJhXVqFDnLeqLFqlb4+f/TI49IQPHOFwrTz2ilj
	 ZOHHYVXLfjPgDFdWPnC2j33aiCa5AM2JVNwNEp/9j7TKbKxGVTdrIa6rINzthM/7gvaK4
	 LChNUXHFs+XTzLetnOpM87lXKSPk54QZhwpbYZcK9qyHcFaDHEQTkgKH7aGHD2tTlWjwM
	 3g67/vRWuiI7PYKoKV4Iy6s7/khsoXhhqvrXNZMGglmtQ6Cbv4tWgU+ll6SJhNEpnOyw/
	 skUxigysbs1UCQvqpUzI0Hl4ED+B3D38RxAD/gJJHOa2D0h7ZhfFOx6SATdnSQJ8jZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
	b=cYfO51in3VMbawIJpj5vw4Mjd9jDn1Vvtchc2urqHbEf5kVG3DVy02wuztz1QvUPwCIa
	 6WuFPErqBMcN8ZriLllKAq0SAzi1aP1AIGUXYiEZHJ5yQIWyFu9N23yEhJjsnvKsCORXF
	 Bic4J8d+gbFB8Bqgy93iOgnhRSrfl8tCOi5cfHqiyISJBuCGSKXkyBsL/UkhnejqzT9+r
	 A3BlyXpRL6prTQR6I2XTilq02FhNTpxP6hG7P5GqHyAMaz0GS2xCYQjAolB3o0FshdpSd
	 Ju4NJW87iW0wKwLIWImR2TcQq/nf+WAe5yZsqpOu7i9En8y96wKtw02W2SB2k2xndpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA6lCI6s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B90606B380
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B90606B380
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA6lCI6s
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab30d04674so2094801fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472814; cv=none;
        d=google.com; s=arc-20260327;
        b=jKLLRJmzcogyGGoKe3KxVkCOPF9P1K+8SIfxtkvTo55JfPHE2FgcCfPjrmPoiITV39
         5D8f5eN53FD03xfq9x5nOCzfYgUNcFt1lXjv1nIkEBFZ1tHQ/bIYi/D/h6MEaf70uXUx
         yITMRM3l1pr0g9PEVrP74pPakjTAvgGZuq1ndt7uxqu6PX7BoQNSPg7tS+CAvidVzM/z
         HRZM1gVT9B1lx4fcIWxfxpLJ0phVYqI+BdtBBPL/oJqLhAkVlPPcWlIRvvgJ1t6vinUJ
         eNUdL9U8dCCusqzHk8LNnUBNboweHw4i27IN9rnue9WC2OT5I9JoDHmSW1JD7Y2rHZwv
         WZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        fh=t6lJnAiXhbMfKwxakepASIpcVTBycnC7e8l4E96sFp8=;
        b=VpgTZkQUzwo6xILYJGT9qYHxPo65AQ18zQ+dRFQ6GgCa11mTYa+mPUsy8BMFFntNSY
         kAAdjc6QODJCcSmV0DxdVSsAdDk1zakX2FvC1BPIElSYEaqFLbHepH5Xw6H3BfUGZ1Ub
         LJBrnqBHgx9ZBMYDQ2LcecHpJjBB6MmO5aA+TmFB1HaMNgXMCAxqiqSi4NJ+4xdOHW8N
         TpjoBhDGaHYSiEzRiSr9mLCUg6xhl5fY/Kw9fwUrVRjfXkLXLoPSVR7kJmv5zlFKKYoe
         bBrCa0MD3LGfxy6OVhJSJTgw6fgIK+buNmm2UhGa1jPiKjRFQiSStseG+niGhsLsEs/s
         +RLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472814; x=1795077614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        b=iA6lCI6shaa3+dIzCSrmsWPUPOwk0ok/6mrWjsdbK64wHrR+UqbXcpToprzxcTL7CH
         t/J5qapm1CtbdTMa3Ajj+WnXzY7XmkstHk6gyfQ/Wl6Yh5ZaKeqIjA2uEkjdfj8ita7c
         wuK2PqeUDZOGP0LoT5B/opDl2bT0gvb9fKStuCdbUBN4ZefPMfAq0ZrzjBLMq/wCJvBA
         OnNdAhpIB8r+5i9jv7XV3Wj42nGOasZnyS07GXqVm7/zyaLfaeJSIw68JAGojuvbesEN
         Lu9hbf9DuYexTp9DeBgD687tn4lw6Qj8rAHahNazrNc9L8tHnQq02FbwlSEvI8xcWCfR
         wg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472814; x=1795077614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        b=sAaPWg+GTazt0flFtQJ/ML6MEaC9VjRDvYCZR/Vg6hGuzTudH8H4Yk4oVv3gio+SdT
         cMROF8Akr3Myntx0jJpB16pn0tP+vDuJDXyT2Km2NyJpA7IelR+tojKoUAPnHRiUWBwJ
         utSP/NZiNkTjzDLRB0IO1p1qH4+/Dc2l1JlQIt+Qx9/+Klap5BmKOkuGTFgdqVnL0/B8
         1X1KK5VNQM+WUx4S76LNoWpaA1eFjpZXI31KKv8GvTnutVog2UEVvycoqWLvJALN3DjY
         U3wpg39Ndn7oDqeUXFkWsrLxIwGb5Fhvr3eFSag2cd3oWqVULJ/GLG654Jkrbvz0SFu0
         0wKA==
X-Forwarded-Encrypted: i=1; AL+hErFmkiMDC/iHNm9sNGi4GhUiLMDJN4ck9GmCJrBCAAGGrc9vsedYghcQy70kB/kFHqmP3GxzuSN1TI08aSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xuv+zzZzOJec6n2ShXEHm7eaUzWwkjDbRndtJgP+2nOVndfGC
	CokXaqdY+9dUa9NJHVe8YbVvIE75yO6nnOlkQ8Sni9iakEAuGFs4MiRh3yI6sGrLoynQPfnwQ5K
	ODErhNP6d1nbjP5UHQbtonwmAI5C1guI=
X-Gm-Gg: AYBFou3gzn2K7uTdE2PXc4GGX31oNVeZW8owins+wK3ZMeRH9pAZil/2kyXWD6eoxEw
	XKhkfsQGuI7eoAMAuYCvwsalyZsI9Uxe7XPV6qSuXRt1NCYa0vCLhJb8CwhugfzftOIrb4kIrYw
	cfOeS1EzcYkBbstiKhOzLXIh/HqRWG6bJjrpJgN7o0L0zFszm6yLLGXgyhe3LchIvungf7EV3/Y
	FuWx1EzZ87ehSxC6hSrAx5qIUTei/AK+EVvo5bZ7CIGxlqCq/L7bdTut89SP3HV9ufkqja1ba/s
	swarlLHxpob8Y5O7gG2B5axgKrcSQjtCeBl7w5XezQG1OnbXp2njK8LFGEwQFvEve15ER8AdV3W
	H5Ta1dGNlX3ZaWYeoVePvLxelNzXb2D19EwXBJ8Dw3ikpcmTu10W91naf9btYwb015Sk1ifY=
X-Received: by 2002:a05:6512:32ce:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c15d61a7d2mr1980194e87.3.1794472814061; Thu, 12 Nov 2026
 00:40:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
 <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com> <20261111121556.1871-1-tvlad744@gmail.com>
In-Reply-To: <20261111121556.1871-1-tvlad744@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:40:02 -0800
X-Gm-Features: AclHuK8Qkz3X25XXdy-9C9EEdeN42WIrLnKNtjHkZvDmYTXrW3Oj8Y0wgyVcNBI
Message-ID: <CAEy9hNXYymaNAkNbSY-hnjXhWGxSedSnmnoEFtLO7ad4zc5U3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Keep the host bus suspended, not torn
 down, across suspend-to-idle
To: Vlad <tvlad744@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vlad,

On Wed, Nov 11, 2026 at 02:15:56PM +0200, Vlad wrote:
> This is the third point of the Sashiko review seen on hardware:
> device_set_awake_path() does nothing for a domain without the flag,
> and the core is treated as kept although its power went away. I would
> expect 2/2 to bring this failure to SM8750 controllers with wakeup
> disabled too, unless [1] is applied.

Thanks for the data point from SM8750. I agree, and I have dropped
this patch.

Its replacement is an opt-in: the core keeps the host bus in
suspend-to-idle only when the glue sets keep_host_bus_in_s2idle, and
only the Rockchip glue sets it, for RK3588, whose PD_USB has
GENPD_FLAG_ACTIVE_WAKEUP. SM8750 and all other platforms stay as they
are. The RFC credits your report:

https://lore.kernel.org/r/20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmai=
l.com

Best regards,
Arun

On Wed, Nov 11, 2026 at 4:16=E2=80=AFAM Vlad <tvlad744@gmail.com> wrote:
>
> From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
>
> On Tue, Nov 10, 2026 at 07:16:44AM +0000, Arun Iyengar wrote:
> > Suspend-to-idle does not power anything down behind the drivers'
> > back, so there is no reason to end the power sessions there. Keep the
> > core, its PHYs and the suspended ports, as is already done for wakeup,
> > and mark the device as being on the awake path so that a power domain
> > with GENPD_FLAG_ACTIVE_WAKEUP stays on as well.
>
> A data point from a Qualcomm board where the first sentence does not
> hold. I have not run this series; what follows is the existing "kept
> for wakeup" path, which this patch extends to every suspend-to-idle.
>
> On SM8750 (OnePlus Pad 3, v7.3-rc5 plus board patches) the controller
> node is a wakeup source, so dwc3 keeps the core in host mode. The USB
> GDSCs are PWRSTS_OFF_ON in gcc-sm8750 and the qcom GDSC driver does not
> set GENPD_FLAG_ACTIVE_WAKEUP, so genpd powers them off in s2idle all
> the same. With a USB stick on the port the xHCI then comes back like
> this, in 3 of 3 cycles of 150 s:
>
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402, iova=3D0=
x669fd3200, fsynr=3D0x370011, cbfrsynra=3D0x40, cb=3D5
>   xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
>   xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint com=
mand
>   xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume d=
ead
>   xhci-hcd xhci-hcd.3.auto: HC died; cleaning up
>
> With the GDSCs in retention [1], as SM8650 and X1E80100 have them, the
> same 150 s cycle passed 5 of 5 times, and two shorter cycles of 25 s
> passed as well.
>
> This is the third point of the Sashiko review seen on hardware:
> device_set_awake_path() does nothing for a domain without the flag,
> and the core is treated as kept although its power went away. I would
> expect 2/2 to bring this failure to SM8750 controllers with wakeup
> disabled too, unless [1] is applied.
>
> [1] https://lore.kernel.org/all/20261110213346.1359-1-tvlad744@gmail.com/
