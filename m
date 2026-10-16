Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5CB58E2AD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172619; cv=pass; b=HMISf1aoieuMfiEyXdCHCJP9G+8G2Hd4Pm/nL9MZsKfpt0Guv/7guUgri1tQeuPtfz4YWid42oJ5HWKzCtQv1T0ejixcjrQhGBFbIJdOgjeRNKtjA4covGSI/zupI7+a1O0Jgb1sCS1Xki3LNFljrF2r80r2NAHUm9afDuhYSZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172619; c=relaxed/simple;
	bh=0EhjdKV1b5MTPXRhnIbLjM5i+fX2eg+AYCTxHVULsyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPPqMgg7ifdh4dUNBok6cojpfp7aHWkitujvq+TuzGjVCcKhs7n/QOtlDhxXvKMNkMB1GPV2EKIA8yjTwfutiXgn7fdJpUU/qwoeWcSgu+DEqDBsfMp7SEY8fHEtQSKfwkWmMLrHS9PZH+un3eATHeXvBaehWrmjXKKtYBIpPT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elhgzl9O; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elhgzl9O"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20ce3c118aso51234466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792172616; cv=none;
        d=google.com; s=arc-20260327;
        b=l/r9OYSP37NaedCJq3U58WS9qXwDQbkNtkHBdu3YnJnOUIf9C1DMRZNSp+ms0bzFSM
         njR0g/SJMfY6NPC55YeIVuNvjQNaruZWAK0+aOh9FV/jWHLkJetLwugmt/3LYz90uN+p
         9Llhcww+eH3IgiHVyFgzaXRw5zl8UPmQFgtL/G8XYND02AtQMtvdhLxe2DklNIz8kqRr
         oJO4PGC3BpKbE3Zel7f1LUKVPQTus2uc+65pKWNI1T5hQ8pHpp3itQewRiFiRlsmVsRx
         4SHuwsSZXyxd5YgyazvmQ7UocKG6T/YiOBO7wLHr4+NUNfv90t+VwpyvipSrrzIhfp2z
         Yi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fpAVW1SblpQMy67RR1lVuwyBnAKE+/uI26KrxUu72XM=;
        fh=eYogbWYRVaryETFe6t5pkDebqy0IX1PlxDEd4Vi0/CA=;
        b=OxlkrwqtIM38c4y9P3pA5XVgrlZMoJCIFzdVCzgdtMGdMXN6vdUcsTto60xaaK0buq
         ynYlJ2znNXm2zS8ne0KOlvzX7ORnxDP8ocG/8Dnuv5r7bQCIRiw/xWjkowH0FJwSS+Pr
         ZuMnUWPjT7K82MK/Ticu/1yKdIftCYto++mh7X51/ElUenALdRo2or4W5332i1gTVEt2
         uJZO9KxkQQ4k6bzf9QicAKA1YGX0tVCC68qfz7iZjxKTj3oxqgypvGslj+1PuGPjeYA+
         Q8LAbEM4rhrTdOF2dtrsWDsAauVqegmsopDksyBYsWyA6aTpejMnGjaU7fJVKBH2uDlX
         NB+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172616; x=1792777416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fpAVW1SblpQMy67RR1lVuwyBnAKE+/uI26KrxUu72XM=;
        b=elhgzl9OxY9oG2NUuDix8lFWLALcek8uBzkMCfkptCTiSNX5eohJS2vThB8eASBtWM
         oZHSphPQMaaA7SQSQvAMSqAeKdrBW3HH1Wwo6qbhfkZ5941cF+7jxkNqLsqk9Nf/GMgZ
         n43S4fJJ5tsC9louaU2o2gDiH+4FZFQZRh2YVWBoqyRKbhMvCaOKvhWVMI823f5NTHop
         B91x9Hm/f6Dzo4CNAAjkhEofKXH6KKQQKgjB1s3dGrPopdbd+mh/P47pATjBCmKmGvVI
         V4ujmKXlWyu7VpB0PHi6eon7pfkw5+hSO+ey15d4g3IWCr1ghFZXK9gDAgzinJIMQPui
         R4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172616; x=1792777416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpAVW1SblpQMy67RR1lVuwyBnAKE+/uI26KrxUu72XM=;
        b=isSDoXvRlRIEvM3OzuEWzURBv4Iw6S4VYSRe4WUzcGT91x626lAht+8snlktAo7sMt
         2kGyDV80oM1crYCdkqEScBxbggSsWh7xoVgTYQs5cPeaOupM+ge3ZrStp9IokN8y67of
         5yMuLTpfT1weTZiNYVG+Hzu2EkHTIdgiVA4hfQTPs3Hz5a8KrV7PuiQuyLuekHN2HHAc
         /4+VPcb+Eyner3quh6zrz+yl698w8c5ROvM/GS5u3kRqexlDlRxu9tnjaJ1jn+WVAHa7
         ex3M3T2kE9M39JF618Xy5ViGA5Eo/xwoHkWMknWJWq9lDF4KNYGzoVZV1OT69BhyPuWL
         pKpA==
X-Forwarded-Encrypted: i=1; AKwUvBzeyyLEq7w7Y/Gp38N1+0E7n9xXcRGrlfZkDjTV0GnuNOrlSQ5mZpobpXOEUknH5ReZCyxI7fNR1MJtYhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjayzQc0up3dhmaVR6teX7qY2NLLbB1WR8sW5YE3TsvwKHEI66
	TC4m0+SwGkBRbr6Ci4K1h8yRuHunoHjOR0kkQfIGNNx/dPDS1uI7OhERcIDDM846X/lXMqqsKiU
	pc08JKqmRmwH0ru84p3Tn+of9FXtkhGY=
X-Gm-Gg: AYBFou15kVr22kWkZh4fzhAfXkGNN6nt+5OTZUerKlJzrMnMLRFKfPrj5hOO0oqaQCV
	tVFJrhGBrLOLchw5Gy5XLPAv9MXPES3DYUBjTjRaPbpdtf04DLW2Oqd9dO0v7ZiO3H9UCDZffM5
	W9UFFMazEHTkPLbhqN5zHYGNEUXpgFbWB2Ii6f5Y9cRNrSFy5J7YLxMs9d66li6LrWoepju8nRl
	Xx8jvxFOmUcf2xmh+MFQU3rrkRwhV7haPSs3/yCgf42w7AFo3QYsgt1YLLvossWScURz8/4zLqO
	ykLuayoyGy9XsfNChKMzgzUfzCqdH34AW6OaB/PYer6Mv6O1ikPL8ik=
X-Received: by 2002:a17:907:9803:b0:c2e:1b6b:8b19 with SMTP id
 a640c23a62f3a-c4021ede38fmr383746366b.23.1792172616105; Fri, 16 Oct 2026
 10:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016141208.2641974-1-e.velu@criteo.com> <atJXYHJa4jkUWJmP@kbusch-mbp>
 <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com> <atJeazM_rJ0uj3vt@kbusch-mbp>
In-Reply-To: <atJeazM_rJ0uj3vt@kbusch-mbp>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Fri, 16 Oct 2026 19:43:24 +0200
X-Gm-Features: AclHuK_U0OkI4Zz6kfXZ9_-ZxJ0-awH9-QelwgmwTfs4tO35QwQMZJ4E5Ywzi5A
Message-ID: <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
To: Keith Busch <kbusch@kernel.org>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de, 
	sagi@grimberg.me, linux-kernel@vger.kernel.org, 
	Erwan Velu <e.velu@criteo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok let me clarify this.

This disk is configured by default with VWC_PRESENT enabled, but the
Volatile Write Cache is disabled (NVME_FEAT_VWC_ENABLE=3D0), so the
device has a Volatile Write Cache, but it's disabled.
In that configuration, even though VWC_PRESENT is set to 1 and the
volatile cache is disabled, the kernel treats it as enabled and
switches to "write back" mode, causing tons of sync and bad
performance.

In this table, with my patch, I've enabled and disabled the volatile
write cache using nvme set-feature -f 6; this only affects
NVME_FEAT_VWC_ENABLE, and VWC_PRESENT is still reported as present.
If the volatile cache is enabled, write-back mode engages, resulting
in poor performance.
If the volatile cache is disabled, write-through mode engages with the
expected performance.

Note that in the current mainline state, my drive is _always_ in
write-back mode because NVME_FEAT_VWC_ENABLE isn't being considered,
resulting in horrible performance.
That's why this patch ensures the volatile write cache status (which
the kernel uses to decide which caching mode to engage) depends on
both VWC_PRESENT __and__ NVME_FEAT_VWC_ENABLE.

Hope that's make it more clear,
Erwan,

Le ven. 16 oct. 2026 =C3=A0 19:27, Keith Busch <kbusch@kernel.org> a =C3=A9=
crit :
>
> On Fri, Oct 16, 2026 at 07:15:20PM +0200, Erwan Velu wrote:
> > Le ven. 16 oct. 2026 =C3=A0 18:57, Keith Busch <kbusch@kernel.org> a =
=C3=A9crit :
> > >
> > > On Fri, Oct 16, 2026 at 04:12:08PM +0200, Erwan Velu wrote:
> > > >   job                   | cache   |   IOPS | fsync avg | flushes | =
 gain
> > > >   ----------------------+---------+--------+-----------+---------+-=
-----
> > > >   psync buffered, QD1   | back    |   3885 |   247.6us |  116552 |
> > > >                         | through |  48325 |    15.7us |       0 | =
x12.4
> > > >   ----------------------+---------+--------+-----------+---------+-=
-----
> > > >   io_uring direct, QD1  | back    |   3886 |   238.2us |  116593 |
> > > >                         | through |  41924 |     5.7us |       0 | =
x10.8
> > > >   ----------------------+---------+--------+-----------+---------+-=
-----
> > > >   io_uring direct, QD32 | back    |   5088 |  6173.5us |  117793 |
> > > >                         | through | 140196 |   107.0us |       0 | =
x27.6
> > > >
> > > > From NVMe 1.4c (sections 5.21.1.6 and 6.8) up to the NVMe Base
> > > > Specification 2.4 (sections 5.2.30.1.4 and 7.2), a Flush command ha=
s no
> > > > effect if the volatile write cache is not enabled.
> > >
> > > Yeah, the NVMe Flush operation should be a no-op in the device, so th=
e
> > > dramatic performance difference is a bit alarming. Surely the block
> > > stack's flush machinery is not the reason for the difference, right?
> > >
> > > If the device's flush handling is this bad when VWC is disabled, what
> > > happens when you have it enabled? Can you re-run the same test with t=
hat
> > > setting?
> > >
> > > I'm not necessarily against what you're proposing here, but your numb=
ers
> > > are unexpected.
> >
> > Maybe my table here isn't probably clear enough.
> > The numbers shown in the  "write back" mode were done with VWC enabled.
>
> But you said the table came from tests "with WCE cleared" in the VWC
> feature. ?
