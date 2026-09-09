Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF13149505C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941209; cv=pass; b=LaDkewY8hARjrRMNv7Wqizp9Htcw5vPo425zd/8Ws162KpJocuL6D9oUmG/bfvFFylMcmH/8SD+kxv/9J2Ydtr8ZwQ6iX4P+MHei27aN2xZbd1rpWAeKB87fLmfTNigrFBR3KPUa0ZbjJtKZHiR5hj2nCoULv9JelUaBYFzMjx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941209; c=relaxed/simple;
	bh=jccdgTKoA1IteJFwmLOO4A5mlgna+9dFOZN51O/IvCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiPHjKn1ASKVZ1f1WGlL4pfoIVCfzqsPla1TmhlILzGEjAA0nLkaA7mXCaoqOKi/2s3EdMtvPF+Y3FlrFC3fUG1RNMwk3JmpJdvsp9ys54p3/uxp+nMiSx2KagfXUUy1d0+efTflYDUwO20+VlLVZ//dWWr9VQblfwVXj9/zWuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nLfVhODn; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nLfVhODn"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca07so64425ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788941207; cv=none;
        d=google.com; s=arc-20260327;
        b=L4qlLm6CrAEg1EsfuW5WRuFhr86kmIciNyGnIFROgc05UMQSt6NgR43Y8sltje4Ue3
         ry4PmBOieWC0xCx6VOUWwAHtNDNiNaG5KKQ440D3PJgz15fkP1mqFz7fixY/eHfccKLT
         rFYnqn9VdUkV9j3NbWCPrKdH/lXe3o2QEiD6jONOkOq8tz/i82NzpvhHfGny8en3qRtg
         76Bo7M0spfmEW5zsLKj6arHW/xKGu4tWYh30tjs2jw2RS11z8hxwOmDhcBke+HEilia/
         /JcPVVNeByLCQDeO136ewJUDOc6Agb2/Pva32Uac30j4hDJX+iI8l8P1Emlb7/AXJx+w
         tiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h5a67p9bBINgQ7LBbBcS4dRSdhOilWoAw3aEd1cEzKg=;
        fh=drYK7WvLoHOWMnMEAcs9CRLFvfqzftQshew+guGMgb8=;
        b=Wxifqo8sSZfjoijLkwqyKhJUq76ywTv15TqHOnRsqjHadHScFr1aOlM8Zt+QnHR5CV
         xiwabgrggzTYzqxkdsXmIJ5eXnYTZfslle3qfzCut7DZrMlrkOA6RVSBxUCo9Jr7ZwLK
         nW3YPkZo+3SVCuDtoUAzIfFj7cOqZuMpxqVOgLKYIcsvoUAqEazozNpBSULL0riDShBq
         FQtBe/8Ifi4PJC7eNAsnQ9DuF2FCVkYtvEcNnTttQmubWMhb6kT4udQrM5B1My1mA2kr
         /g0v6KAkxFIQXQXph17+mx2+EPgtS65MRbgcN9IrZT4IN31dFHAC9Mf+LCTWUjF/MHoH
         bGoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788941207; x=1789546007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5a67p9bBINgQ7LBbBcS4dRSdhOilWoAw3aEd1cEzKg=;
        b=nLfVhODnCewsw683wfqdRs3QFOa9A7Fo9Xq7tnXPQg4zv1U7SWdx2/brrB12nXfA3W
         gSQW56ByLyLmKop0tdSRbSxsZsareM/xrgLBxHdtCLFkrGr/+LZrKcnicZCwFPs14gsu
         swB+qMuFgABEmplZulTR3lmOC4ag6GEV7kWepKC4ABJWkcNxMnW8dz2gSyMsLcnpqTDN
         aCYT2hre0vGl21hOyYufoV5QONPypEW7Oz37qlYfBbePFtX8tktBXVadyQYJP4IAJc26
         u0EPrgbpRVE2UDgm8piU+kmdgCWoSBudUiwAMzRleCwa+bbQ20CbGH5EWvjMi9pI/hAB
         PtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941207; x=1789546007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5a67p9bBINgQ7LBbBcS4dRSdhOilWoAw3aEd1cEzKg=;
        b=oi/CCXixpbDjVskTF0b+JfeYlOCgcnYip9ZRTKIJBmTPzxbb04fs/9fcgZxtsQbVmc
         YDWT6n1QD+denWhVfdk49tZVmpOw2kEu0o7WbRIyNb9VZe6444HdjRULWuyiqoSIxklq
         rWufVqNxcAiYw/ujskqZONeIZN+7BiHiYEO5vPzfWLMqQl7p8CtRgvDjuSWKPvvOy5HG
         WvqxF6ByLvnfo4/IhN5tirn56Lu17S1ry3LQYHNRQ74+OjWjzydbDyC1OeU+FP/PVs75
         eS7Y/tZwtVMIF7hpb39n2G3/s8ZfH0abBKo7/rcdLRnWFD25mLHLEOkiKAOYynmsSE0v
         LBmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO4Wexkicui0q3ZhhZrLOAFZ8Rz8fyh2f0O5ZzQa0KmuWk4W8WxWoLoS/OpxHzuux/iF/7Qf5cbYwLiAY=@vger.kernel.org
X-Gm-Message-State: AFuF++mzkRKVnc9ESeH1ohm+wqgNE5PMIYq2Pegun0PL7NNVC673El+E
	gEyczORLpBJblSIfR5rtvqYzS5piKG0OHZuxdq69jTXtulF7RViT7SQyp4Jx4qvTbGRBifWiLb8
	udedsPqN03vItWj5m/zTp7+9t75Jj3LPyP3tlILAo
X-Gm-Gg: AYBFou2BJItw4JQpHrKCiFvXJwS05d63Kj/+HpwLJ52cWwg8b4wMuH+7ORbqEht/OWm
	lwnpK++KCb50tPpbxjYyUEa6xJy9Gzk3i2JrESJOjefXbq3oHdoAAxzmSnDYBvWNO37QXiGGt5W
	+0m9i80fjo7VDMkQ2iKDw0xJODg39TCA0NO9xWxN/CVtd0/H5Ysyu7ndVRjcdxbXlSygrH8kjLc
	SlTMW574ld9Cv+clySALtmOYhCrGhWPzTWSktb0M0iqOcRlQqIlgyUPCbYqDeAKNKMq2Pk+YSRx
	mfASBBhg+eNeYiq+K4ezKc9KhELmVsrhWovOhr4KqgoavPYVZLwuWA3PwA==
X-Received: by 2002:a17:902:d988:b0:2b9:e831:5e5c with SMTP id
 d9443c01a7336-2dbddb1f4f4mr5306795ad.4.1788941206507; Wed, 09 Sep 2026
 01:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <878q5f5tlt.ffs@fw13> <aqD7FDvDhiEF_u0N@infradead.org>
In-Reply-To: <aqD7FDvDhiEF_u0N@infradead.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 9 Sep 2026 10:06:10 +0200
X-Gm-Features: AcwNN1VkP_hnkhu1BhimxJBNF_bxxxh-Y07PAXa53bzMuSECve8p-f-Z8Pr0vg8
Message-ID: <CAMOZA0Lt99A1H45Hp0Snq4aSEw-Xr_Mh4xA--Cx0Qh_6vsQvOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Global Software Interrupt Moderation (GSIM)
To: Christoph Hellwig <hch@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Fengnan Chang <changfengnan@bytedance.com>, 
	Marc Zyngier <maz@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, netdev@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Guzebing <guzebing@bytedance.com>, 
	Keith Busch <kbusch@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:25=E2=80=AFAM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> On Sat, Sep 05, 2026 at 10:30:22PM +0200, Thomas Gleixner wrote:
> > > it appears that GSIM is only effective in scenarios where multi disks=
 at very high
> > > IOPS; in some cases, there was a noticeable performance regression.
> > > If there=E2=80=99s something wrong with my configuration, please corr=
ect me.
> >
> > So we have a NVME specific mechanism to tackle the same problem and a
> > more generic version which is subsystem "independent".
>
> I'm not sure they tackle the entirely same problem, although they are
> very related.

There is overlap but it is accidental.
The difference between the two mechanism is the following:

- GSIM addresses hardware limitations (SoCs that create huge PCIe
  backpressure on each MSIx interrupt, eventually reducing the available
  bandwidth too much, regardless of how many CPUs can process interrupts).
  The goal here is to throttle the total MSIx rate, blocking them at
  the source (PCIe device) rather than later in the interrupt controller.

- the NVME mechanism (and NAPI) aim to amortize interrupt processing
  overhead. It does so by recreating some fine grained single-source
  interrupt moderation (something that NICs do in hardware, but NVME
  does not, with 100us being way too coarse for modern SSDs) and an
  adaptive scheme to adjust the delay and decide when to kick in.

I think there is a reason for both.

GSIM because it is more general and addresses an issue the others cannot ha=
ndle
the subsystem-specific scheme because they can be more efficient
(eg they can hook into existing helpers like the threaded irq handler,
call directly the handler without going through the full irq chain,
use more targeted heuristics to decide when to kick in).

cheers
luigi
