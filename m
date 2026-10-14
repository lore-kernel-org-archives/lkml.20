Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D074489881
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971448; cv=pass; b=SryBfPivhcPgN5O5n+0/sSthhhCDy/E+lH8MYrWkiGnQRzO0fjSKK4MWVVmhrFCMdvLkvnxebZTV/2qv6knS2ZzUYiS+NFR6F5Vkvp0NPjh1r2AzxnKfqRBDvJkhuII4nEqvU1BGqzquiix907+OMxssNnX9utLGlwV2PArI9gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971448; c=relaxed/simple;
	bh=JOFHPvWsRG3wmqBn8lmIc1oL/Mz/lZXZ2O+Zs1GbznQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5eR9Q4ZrTEXUNVsHKx5CRmn+n+7cIC1P4mMjh2j0xq8nnuSky4EY3U3eUih6xxe5sQ0y0YFqdDGvk5UnkQAoaudzBAprxqPLzFfQV/dZZ4Wx+uotNVhFTXMOyrY49ZCGLFIwBxTgPMdbnxHg5GP1RHxvgITUCfqEVA1b5f798Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=C5yncZu7; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="C5yncZu7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e5e090746so377552866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971445; cv=none;
        d=google.com; s=arc-20260327;
        b=BM9I8zBh7g/yydt94TTc8J03Pcy1PSJzST0YHgPzFksGRZHd0b4WJsTLruo4nXWdjM
         ///kB/O6LjLqmBIWIfJwJAmtzrcmzro38Tz3mGaWr7T6abK9Kkne91zC0CR/TQYskp1f
         jSoyZvJUHjR4pLiMA6gSL+v4hsCGWZevCxGbaxlLfxacWKgv08ub3Kq4Jdcb90ifj1Y8
         bc883kgBLHuzJ2JN+xpMZjrKOoM+VFdQ+2Gn0uSG3HBlECAzK5XeqKWVldm5fYNEZ7aY
         GoSs6ZpDjzyus7a5NtHeRn7YHdgSPbLgD31FiiHrS54hV6tdMAlm495ru5stiG3CQ17E
         GMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JOFHPvWsRG3wmqBn8lmIc1oL/Mz/lZXZ2O+Zs1GbznQ=;
        fh=bthgCe6Z/j4bHvr2veEXsF0v4aPYq4G/nvPBkzxmtwM=;
        b=p/QsL18TUMQq1V5ngULD8L8/QXaS0Q0Xq6ogiHyBNiP5Nm9AuIFslioRfz2+KQJcpZ
         MC7UsZa/XestwmZCMtlWxX0lYtjAGc5JkFAXF+0JOFuSIn9uuFecKPEWCuJvSHLLJ54I
         LNPH5MQz9Ihu2PxAKHkkig8YOovsNczWprzX37eTRcKUxQbsaUICZg8j/8ab5D9QJJqY
         ypj5K39ehZvuA2ODF1+UDBC7L5fou9eJ0CfyquGxb6izsYMor9bh0w0R7xVlERT0dHWP
         rOQNh2VYO/ZvPrcnm5Mg53Xih/zuE/JGzlR8knsCZRI/eTbkEJ8yuOM0WvTfNTtZ0n+V
         eP6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1791971445; x=1792576245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JOFHPvWsRG3wmqBn8lmIc1oL/Mz/lZXZ2O+Zs1GbznQ=;
        b=C5yncZu7xt5wUiP8Kxjx6LxG+nuszB0GoKnti3yItAyyWq5xGHrVBz4nJqj/Z50HHl
         7ZmdWa3H6F6SRt0IenFN8+0MkMIUpahpEV0C/LBjxnWDxVnXOyfbkGd0h10HWMiojJ7b
         Vmk/hPLAFvlajT5RSb3I7kSgQ7t3op8FMqhEOuj9L4rcdyLFvCE6Z/hn6zOVvNKpCy8L
         2V01FCBLW1MpqzCBQviNh9wefcqSnjpTWvxLJakfLxF8u5hPqx4Wpceqoy6vuO0XgoUT
         8YzI5O9umpjw42HMDBmZUQgTpcGhqpNnePnBrPePS4jpMSS8CDbbdkaPAaJ7L8Ekf0SQ
         9zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971445; x=1792576245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOFHPvWsRG3wmqBn8lmIc1oL/Mz/lZXZ2O+Zs1GbznQ=;
        b=uu8Yat3ioDynabTUFDT7scEc+I3mMtfieTA1RytwR8tXP1fWYDsFfn/pCaD1DlN0nc
         4IllSGmhL0HpwvR8bKce7/9ifK+odOoDk/n/Ahsz82PYg5zQgqtyLyd637p0xhRMLnZw
         lPMZB8ggWX2jE2dwn76qC2jiKqHibwMCAFa3rLHonP6oF8SsORvml1h4foPekuJsRhn+
         aDnAwtamhpBQ2hQg25fQgFBCVGHeFa5Euw5uTUWu42yk6BFLyAHBMFPLoy/yO4M3wTVk
         PW3aLalVFVYkriExjv6GbSP0MN6ZtBPoXcTZbimD6W2APJL0d6pU2BTCZt/t8uQmHZEE
         JN1A==
X-Forwarded-Encrypted: i=1; AKwUvBz0p+Xrh/qdeTaIX27yfudVP9b2z/gf8JOTS3icDmBsf9u8iRbC07psrFdmHB8LGjM9NjXuhmb2WPGacZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFYyInKXhiXnqkRJZdRaj/nG3mSvY2Eey80K+LC2nHu3aiuc4u
	XWoXUOx80WCZSeq2cSZlBhWRh+14l9ZVRh8RYFluH4OdOU1PsTk517aWLOpFQwdc+KgB58SiBNv
	D7K0t+prAEV0y12J2wEz7S+3kb9tD3A3XgxGys+h/Tg==
X-Gm-Gg: AYBFou1dowrtFlfu+5NvCMbgFi/I9HgsR5ixDHQVIrPk0dZfMrhzdCTKaIIFlV7sd8f
	psp2psBEMQxSnfuqFiqwU1BqhoNhFtFAD5XpDw16ePWDbw4gRxz/ug74OWXXC6nbdicDSZdWc6j
	ihpHQNX4yTcQlCG4+sU3KTDjkYjNNORXu+YFv/eS1ixr7hbXkzNzNl7CRSULHYgkXFCodpO2SXp
	aZKvqEKbuyPiE81HGxcCAW/5GORWX4OdH/+95rEIiHs0bxvNYVJon5pBgpI+Y3/bRYOjGL2V/ly
	q0avl4E63nz5jtNhYp9NAqWYMj/heQeOQIHb68IiEaUPa6oAdMMSivwG9V9kaAJ9zn9HpUEdfWe
	C+QGjD5d8
X-Received: by 2002:a17:907:a713:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c31a9a3404emr1486426166b.1.1791971445323; Wed, 14 Oct 2026
 02:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com> <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com>
In-Reply-To: <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 14 Oct 2026 11:50:32 +0200
X-Gm-Features: AclHuK9JVWGiWM8FmQyij5Uq_o4DbHcHp83pKj6XgJqn1gj8jANGfBFN5Ru_lJ0
Message-ID: <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ceph: don't unregister an MDS session before
 removing its caps
To: "chenyuxi (D)" <chenyuxi19@huawei.com>
Cc: amarkuze@redhat.com, ceph-devel@vger.kernel.org, idryomov@gmail.com, 
	linux-kernel@vger.kernel.org, xiubo.li@clyso.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:15=E2=80=AFAM chenyuxi (D) <chenyuxi19@huawei.co=
m> wrote:
> Do you have any plans to move this series forward?
[...]
> Is there anything still holding the series back that we could
> help with?

It was rejected by Alex Markuze, and he never replied to me after I
questioned the two reviews. That's what's holding this back.

As for my plans - I have more Ceph unpublished fixes in our internal
Linux kernel fork, but I'm not submitting them, see
https://lore.kernel.org/ceph-devel/CAKPOu+8SiwxT_44e63-EZ4T_4d-tGjwmk_Lx8i4=
KgZOL5JnMtQ@mail.gmail.com/
for why.
I just looked it up: the stack of Ceph patches in our fork has grown
to 67 patches. They were either rejected or ignored. One of the
rejected patches fixes a security vulnerability.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
