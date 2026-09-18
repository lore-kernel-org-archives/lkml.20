Received: from mail-qv2-f11.google.com (mail-qv2-f11.google.com [74.125.230.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9143AA1BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711603; cv=pass; b=bnmXjHZcY80ThNeddxJdF9x0pi9I3TatIVk5AOXpPf8Y/ezBd3ukk+WI6OMtsKl3c3Jf21GYkJcm4tTaDDFdUlDFT5W3uaC2dK7HQFcszS7cqxdLqwMbuIOcqi03QeibG8VIp/IsniNShHLSql5E1jCIQoM3bLCTr9JQXhJalo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711603; c=relaxed/simple;
	bh=t1ip8CfFi9vuGKam9e+Xd7qhZK6WDwDolruZauKHlow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAXgh2sIbQLXFTKUURkhrWxzt2Unv4x08v3nAs9MN6PElD1CAx8w/ANwZwx34PyjM+Bm1Tz/93IGgPmRRWfMkBdqjlCspuqn/MiQjPn62a6dABp6YGRuzUAbG0aigYcxIGbSr132jDlJOoDSLI9O/BIJeQakp+zYIA9/H1wHC2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5lP+ROO; arc=pass smtp.client-ip=74.125.230.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5lP+ROO"
Received: by mail-qv2-f11.google.com with SMTP id 6a1803df08f44-91041f4a0dfso1278956d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789711600; cv=none;
        d=google.com; s=arc-20260327;
        b=Xq8Ku0FvD0gpE/i4ON1F3oLDRnhati1OvzE6dSbt2GjWFO6hVB+2y+gWL1wMF1WzG9
         Dql91jscu49Uww7O8ALeioDpyMCPrcOk9uAiR7EZ5daZ4EQrUDod/nMjPrnD3d0K46qQ
         DteEH4DPjRN3v6ZQB74OVtSC2taFuXEwTZNW+iFEJJZYmMnh0px+PBSlHgCxdl2s/rB+
         4EnFbl859GDlOLpq8ZTSzL1H5gCqqOoofvt/0HiFoMSYbbWlSIObWbPtXXhj6PwkfD3J
         CtRU4nVaOmlszNc9GLFzd8TfLu9mOYSLXbzILnWQfzLpnQVPEsdPhFO/HefzbpnXpP/B
         33AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1x0EChI+gJyyLvy8kTr3cIO2m+3bw6/l/GTas5ZCe1E=;
        fh=alsBxNDLA5ZFGAEa+n3kCZlRxl8NmjoNfOejKKh1HRo=;
        b=UvYu8bWjT/ROkJLsyzWF9J4PfHt2fsUl1lRFXvIggxidyBFTxjeti3CAIMipz1jhvK
         /Ebsa5XgaHnSB1YgTD9ZqycvOk7ISQxe1H2n7yPk0uLyIbooCd/tPZcx/wh3KABOgoAj
         zy6FfA7ocg7QwwVCQuTROwx0jowklxi/IbXvcER3tv/0em+aYK/UQJT/9Bx9igydhyIq
         oPsBglsC3ffgunPFRvCnwfwqr2mnBanVihE19ZdSq4Mr6rD/upTFn1jCLnCefoInAzZV
         MNy2tHB+qIMPCsOPHj2/Gcouk7fWpU5s1mXMMbZyZHlp1yEb4IrJv6CjLcuIM24jDhQ3
         6mCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789711600; x=1790316400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1x0EChI+gJyyLvy8kTr3cIO2m+3bw6/l/GTas5ZCe1E=;
        b=F5lP+ROOFEhEkhyhejk8K4pe0S+PlHmgDh2gZe0YXum4M/3/GQPj3PRJR19kojrdd4
         7GHoQpgciPhpW5VcZvUoFkZR41loNzgRA0t3C58Ehv6ZYZLPpnpvMaPqwa4FG9XW7A12
         L+DP8E1/C5dJWNaviio6Bi3fq/YuOVsdG6YVAC9zFh8WrtD9WVtTg5ksjVJcM0Q7CJJX
         vyfnT2lWDKwTd99GQfE8gCNDAv+UkAHuqvOaBcEe6lf2k/u3oGyPamJeM5ulSsmojVaS
         YGb1BFVDPPucVE9YXsexuGl0V4ykfQY+YE+roZPykl2tIaT7CgBoYgdds7iRaJFTdDRL
         yoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711600; x=1790316400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1x0EChI+gJyyLvy8kTr3cIO2m+3bw6/l/GTas5ZCe1E=;
        b=ecWja8T5mMLtr9HtWgjEy77dIFfEEcAs7xi6Vh95WMeIKNBz2ySdFXYPjsIKG4olgx
         ii2tAAyrIDRyMcpG59Jt7GNMTVs6wHJ1si0wPp08uqFcSz9sOsRwZ0QI9BTEpQidGCQJ
         vvUhdCX3680KwOcT5Z/gKEs5oUFv4xlKkQ4l4QRKgAjFKdF3LjE80BJ9bjMzeNpstYem
         wlSlVpWGV7zU/BxcCSb6n3ppyMkJNXpsVu8NGrXSOlnaZNTpEF3zFtYguSaHZu4VFcz5
         H+brAeL4vsuXUlS3uAc5c9A/wttweVWqCLroVGkNo8DYRzD4Ri6mR29Q6j8JRtSJopwe
         xWyA==
X-Forwarded-Encrypted: i=1; AKwUvBxMQRZqtvLBYWKeikuLMWieqtJBmwDT0ta6fvtTCS9VmgAXISjmcsSLGqrpJMT7E1WkwE96uof0LhofMsA=@vger.kernel.org
X-Gm-Message-State: AFuF++kR3QIndY3RJ5C8bIWlYoq+TErcvFIsfU44P9dyf998tUrcXe0j
	w5znRIrMQ+Kt6I0TnyaF8S9ih2+FYQEdO0bl02GG4dUZE7eP+Sob3hua6JGNOHpo8xFbwXkgLzL
	12UvrqbvwsOxmxHvN78X9vtskK/hFrr8=
X-Gm-Gg: AYBFou3W09/a9NvEM1Lh3wu3NC7JowpN3NuPmHLc+exWLw4Js9sY5LV2BFjO6Hr2fXt
	Vo028z/eMpsbr/qzy/crKgNnK24Mwp2PnL6HhgTTqhTEKnMIAkNaGv32fIcr4Hk2fK+htFgCWox
	WyAb8BP8b3f48YeUOXm7qB1kkFmXbdzEawjk2FUMAArD+EfEzPDtH4Y57Cuwlln5flSRKhJIFSX
	4L7YyAMS4NXtG4wlCwNqKgbKDtYaWP2rIMzTm5LC0y1o03TqHa0KQLHf0xXti/p/JzzFLKxJapB
	CZwL0wmrxFnUhwKM2KnApqV9V7HbruZinsAKrBJW80QfQE/NQqkOyEET
X-Received: by 2002:a0c:f80a:0:b0:912:517b:40e4 with SMTP id
 6a1803df08f44-91254c23e25mr17001336d6.43.1789711600506; Thu, 17 Sep 2026
 23:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFxp=AY2cVRQrZvB9WNnigbsobuw11NMG-cagHx0_V+ur2ToFw@mail.gmail.com>
 <e4054f5a-e60c-4253-bccf-d05cc7c615b7@nvidia.com>
In-Reply-To: <e4054f5a-e60c-4253-bccf-d05cc7c615b7@nvidia.com>
From: jiabin deng <dengjiabin2023@gmail.com>
Date: Fri, 18 Sep 2026 14:06:28 +0800
X-Gm-Features: AcwNN1WmPi8EXlHwAu7wu1rlDke4e_ZCXtICiqlZsZn4bp_rtke-3i1SLyRML6M
Message-ID: <CAFxp=AapgUYLUhipVjR8oM0fRDSLDX60AQf0UP8=U4M1ASqmOA@mail.gmail.com>
Subject: Re: mlx5e:zero-prefix corruption during TCP DMA-BUF RX - help requested
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, saeedm@nvidia.com, tariqt@nvidia.com, 
	mbloch@nvidia.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dragos,

Thank you for pointing us to this fix.

Our original test used Ubuntu kernel 7.0.0-30-generic, based on
v7.0.12, and did not include that change. We have now repeated the
test using Ubuntu's mainline build of Linux 7.2.6
(7.2.6-070206-generic), with its in-tree mlx5_core driver.

I checked the v7.2.6 source: it contains the small-frame guard from
commit e2466392a0b8496000e12181cb1ee1535eb0da25  In
mlx5e_handle_rx_cqe_mpwrq_shampo(), frames with
cqe_bcnt <=3D ETH_ZLEN + 2 * VLAN_HLEN set match =3D false and
flush =3D true [2].

The zero-filled corruption ending at the next 64-byte boundary in
GPU memory still reproduces with this kernel.

We kept the same sender and receiver data-checking logic, with
tcp-data-split on and rx-gro-hw on. One additional environment
change is that the NVIDIA GPU driver was updated from 595.71.05 to
595.91.07. The NIC firmware remains 32.43.2400 (MT_0000001117).

We repeated the same eight message sizes, from 32 KiB to 4 MiB,
with 50 iterations per size:

- All 400 iterations completed.
- 105 iterations passed; 295 contained corrupted data.
- 21,599 corrupted ranges were recorded, all zero-filled and
  ending at the next 64-byte boundary in GPU memory.
- For each size from 256 KiB through 4 MiB, all 50 iterations
  contained corruption.
- The full-message snapshots taken before and after
  cuFlushGPUDirectRDMAWrites() were identical in all iterations.

For example, in the first 32 KiB iteration, an 8-byte corrupted
range starts at offset 2147495416 bytes from the beginning of the
GPU buffer. This offset is 56 bytes into a 64-byte-aligned block,
so the eight zero bytes end exactly at the next 64-byte boundary.

These results come from the reproducer's runtime byte comparisons.

Could you suggest the next targeted checks or additional debug
information that would help narrow this down?

Thanks,
Jiabin Deng


On Tue, Sep 15, 2026 at 8:21=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> Hi Jiabin,
>
> On 15.09.26 03:49, jiabin deng wrote:
> > Hello mlx5e and networking maintainers,
> >
> > We are investigating reproducible data corruption: with SHAMPO enabled,
> > some TCP data is corrupted when received through mlx5e directly into
> > CUDA-exported GPU DMA-BUF memory.
> >
> > The full expected number of bytes is received, but the prefixes of some
> > payloads become zero. The corrupted ranges end exactly at the next
> > 64-byte boundary in GPU memory.
> >> [...]
> >
> > Each iteration uses a new TCP connection. Test connections do not run
> > concurrently.
> >
> > Observed results:
> >
> > We tested eight message sizes from 32 KiB to 4 MiB, with 50 iterations
> > per size:
> >
> > - 400 iterations completed.
> > - 354 iterations contained at least one corrupted range.
> > - 20,707 corrupted ranges were recorded.
> > - All recorded corrupted ranges were zero-filled prefixes ending
> >   at the next 64-byte boundary in GPU memory.
> > - Corruption was present in both snapshots, before and after the
> >   explicit GPUDirect write flush.
> >
> > A specific example:
> >
> > - Packet payload length: 1448 bytes.
> > - Offset of the first payload byte from the start of the GPU buffer:
> >   2149169912 bytes.
> > - This byte offset modulo 64 bytes is 56 bytes.
> > - First 8 bytes: zero.
> > - Remaining 1440 bytes: correct.
> >
> This sounds a bit like the ethernet padding issue that was recently
> fixed [1]. Did you have this patch when testing?
>
> >
> > [...]
> >
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit?id=3De2466392a0b8496000e12181cb1ee1535eb0da25
>
> Thanks,
> Dragos
