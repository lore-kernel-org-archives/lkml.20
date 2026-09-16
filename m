Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908414D6C31
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583537; cv=pass; b=BMraOZjnLhi/Te3oZlcataQjqBkBKHJHwNiLiOQTIMZYy+SuQSRh9Ea8cYEhQ3qVekUeKWuh3SEQA7xKZLVDuU8tp98aW8xuE0vmqbbezwalsn8tEmuMyPAgDQr68XMSRpJJ3l4TZc7ia/cLAlLerb5xn6Bl3Dg9zOqBdYXdvWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583537; c=relaxed/simple;
	bh=MlkmGTEOgKGE4phfBBPqWxp9/hOjpHqb2bxTI3f37rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nv8vfs6I52xGZvPeczVBYuzV8sFbhQrz96eo2dTNb4/jcIN7qsNQ27XBv6csbLypNf56dhNEmjMKl3g8nkstlcBqVgAQtxu2mQ2jLNzbvr4OIJHw7E+TggI5jI8PGDq7Eiyg/dqA7saGbc5Nq0krIBiwdu5quIc/mJK5q2nGlyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIySt+0V; arc=pass smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIySt+0V"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so7386166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789583505; cv=none;
        d=google.com; s=arc-20260327;
        b=SJSsHGl/o3xHZhBuQZTc7eD6JEPVs/O6gc5JCsseyF4vAJ3fNGYZHyiPPeOVDLCrI5
         DoQu39V+UdbddVYO92w6yAqK6pLTW5gdoblunT/Xiwo+zdYGXIOHj/B3to94PVdvqtLt
         DeExqHSe3sOo0lEVAzorHfnSBIcNmqNt7iml1/fuDT0a1KVdffrdZ/gP7w280QdbuMwj
         USAF4jrR8oEhVWKsCUqlpl8AlvkIX8S1cc1cClwTNk2LroqWmuo2t57rEhczjAXxt1AA
         n+JkwB0DzEkHLFn5qisA1D6gBHXgYtA41I0m4vQ6a/BG16k/Hth5sM8B/pGN25kJN67b
         n5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2N3q/7Juy2glVDKTIb/78eRKEUlwWWYByVLZXDb0dM=;
        fh=Q84q0KAgcp40HT1ZpgOrJ9xnHWjGJHLkVKs3hrLMo0U=;
        b=JpqzoU0s1q1dp6jSLfQcNOyjmfD5LOR9/12y3+5jgtUNj+uw+4nG09cVsDiKF9CneP
         brbHK8Nn8Sw9UjDo+Yxirmwp6ypx6tJlflvk2uFfxAb4abzraQ8zilKN7Vz7lYHvHOH9
         xVhp55W66GN+m6GknLjWVelXidIVkTGaZgIuk6Ds8390SsA7pdceFgnHfGetX2ia9ggS
         +Dgyio7motFyKZaFPL5seps1vDDRL5zaODYdGdz6Qvly7L7Kp6uvmPqYVCveimtlZTF/
         v8SdK7b6OgpeHwhM9MWqKaQIRbfoJGwr0YNzXyAKd2uPf9wRILB8Bsa2x6fScfbEHKMb
         ijhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789583505; x=1790188305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2N3q/7Juy2glVDKTIb/78eRKEUlwWWYByVLZXDb0dM=;
        b=SIySt+0VUjNfcqHk6oZyXDCHy67nKrwVRB+2th8R9olPcfWBta9s1SfZ1Ppq+wRgNI
         7uQJw0Aqlk52eoxPWZyvSCj8f8tN6u04+CXqmKhBxzKQILrK38fWig4j333wbyfyV4yp
         CMC31HR7o7+gxdYTveZM0CD0KWWUH+7wZafnuT7ZOBzawO2zpOVXXCkYtbL+vYlnJRvH
         ovEyOdIsY4g1Uelp0/QzuyJrp00svWB3pdKHIaIIh1fPg8/oEdvqRkY3J91VJBws1Oc1
         N2MSYgT7QW8i6efnSSefNpxyobRpAULoDPJR5tby3UHvQLioSPjbsjzuibmG3gqo4WrV
         ODnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583505; x=1790188305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2N3q/7Juy2glVDKTIb/78eRKEUlwWWYByVLZXDb0dM=;
        b=fXx83TaaEIt3srChkK2sELA3jndLE5Lah8wg4EsW5XmJxkTVMfpuB4HLD3p+g4Jusx
         wkE3Q2soTf1iUFB4LgvzkRz9KxC13KqdswbuoptNhWheAFynjghM/291LqfjoJXJxpJ8
         I+c5PPTwSmtkIGYQLIv5JLx74YEeZH1TVHHLNuuM5dhghqxPlUGSP/kRxSqb0JQDlJs8
         AegyhlgLMPXX7dPbIOegd7NCS0I/bODFQavdpAohtRYUcTmfNBtJAcD6Grj1BenbDeGA
         fkPoet8WAU1Da22O4F5oZDWTr6kJJUq9kWQ+GBn/iST7d8uxaEBibJf39xoVx5DH03pS
         wWaw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ//6dvdifcobY5Rfc7531nFXgItYi6JtSoXnQ1TKVAvYnwTnOT9UnIPezLL1d+4US8JJHeKKFMGQNHvU=@vger.kernel.org
X-Gm-Message-State: AFuF++nCr8217kjCO72b9ha9gaXU9WYVs5ehsEpk67GC1HVNta2EYPIA
	7ZpWB8LEluFqtrqxDtYO+Tqnu00onL3LdoMFa89WRQKtV+n2EWJzZhX0yEr+oftirn+tStA0ehV
	u4s+z/MEjAN13ItUxIiKrKA4DsoOw7Y8+gqcfcECA
X-Gm-Gg: AYBFou1zsIuz61DYDW/v9GjxHF49QiWgKC8GjVDIGy0Bs+4jvL4z+3c+zo+OBKMnqM9
	E6ZGI6oVulJ0+Zc/5JbtHTnplEsHhRT3eI3XpdtP+WKvGjL5fm06hT1eHszqaBsorILSwLLD4WO
	YtbCWxxNH93VUtsm3nGWWKzGGVaC11DIb9NKyJPjucrnK34gaNTG2tdt+vTnrVEWCg9brLZ1BuY
	HbiRVitKreTVN4St0XyvPU9Y7EktrkB82/BW7K9+j8TTh7UGM/CTM3ZJv429XjrKBce+hiXctbq
	0kSYRX1kv2Evwoo3zQxrJG2I7dyMGHpSa6hc9/dFDTD7WD2e7jewWIQOnhlXZG2bheE+/pZcPRr
	sYJakYQ5Jiz4=
X-Received: by 2002:a17:907:7287:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c29e5308ae2mr282051266b.37.1789583504840; Wed, 16 Sep 2026
 11:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com> <20260728221007.2098560-4-dmatlack@google.com>
 <e099cbaf-3185-4c39-ae36-7f0e074ebff7@linux.dev> <CALzav=eX0gVrbWCnYGwfqPHUkoVxqdr2nw3Tx6Aqze0XOcuwzA@mail.gmail.com>
 <2vxzcxud6ol3.fsf@kernel.org>
In-Reply-To: <2vxzcxud6ol3.fsf@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 16 Sep 2026 11:31:17 -0700
X-Gm-Features: AcwNN1Xd8nWTyJ5g1jf7rTHS0mmvfUGKUHwbATk6Q8e84nhTP92-8_DCKmvtasY
Message-ID: <CALzav=eBXsaZKNv1SNtuT9F6aX_2TS3u5kUtko5WMv2NWt3e+A@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:25=E2=80=AFAM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>
> On Wed, Sep 16 2026, David Matlack wrote:
>
> > On Tue, Sep 15, 2026 at 8:31=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.de=
v> wrote:
> >> =E5=9C=A8 2026/7/28 15:09, David Matlack =E5=86=99=E9=81=93:
> >
> >> > CONFIG_64BIT is now required to enable CONFIG_PCI_LIVEUPDATE so that=
 the
> >> > domain and bdf can be guaranteed to fit in an unsigned long and be u=
sed
> >> > as the xarray key.
> >
> >> > diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> >> > index 3781e2b5f095..8af20f558086 100644
> >> > --- a/drivers/pci/Kconfig
> >> > +++ b/drivers/pci/Kconfig
> >> > @@ -273,7 +273,7 @@ config VGA_ARB_MAX_GPUS
> >> >
> >> >   config PCI_LIVEUPDATE
> >> >       bool "PCI Live Update Support"
> >> > -     depends on PCI && LIVEUPDATE
> >> > +     depends on PCI && LIVEUPDATE && 64BIT
> >>
> >> One question about adding 64BIT to the dependency:
> >>
> >> As I understand it, enabling CONFIG_64BIT essentially means that we ar=
e
> >> building a 64-bit kernel, and a 32-bit architecture cannot normally
> >> enable CONFIG_64BIT.
> >>
> >> If that is the case, would depends on 64BIT be necessary here? Or is P=
CI
> >> Live Update already inherently restricted to 64-bit architectures by t=
he
> >> existing LIVEUPDATE/architecture configuration, so that this dependenc=
y
> >> would be redundant?
> >>
> >> If this problem has already discussed, I am very sorry about this.
> >
> > The necessity is that the PCI core needs to store more than 32-bits in
> > the unsigned long xarray key (see the snippet above). The dependency
> > on CONFIG_64BIT ensures that unsigned long is big enough. We could
> > probably remove the dependency but I would rather wait until someone
> > with a 32-bit build has a real use-case for using PCI_LIVEUPDATE
> > before putting any effort into it.
>
> KHO or live update themselves don't support 32-bit platforms and there
> are no plans to do so either. So I don't think you even need to have a
> dependency on 64BIT in PCI_LIVEUPDATE. Only 64 bit architectures define
> ARCH_SUPPORTS_KEXEC_HANDOVER, so PCI_LIVEUPDATE and others indirectly
> inherit the dependency.
>
> If you'd like to be extra safe, then probably you should add a
> dependency to 64BIT in KEXEC_HANDOVER directly. Though I think that can
> be a separate patch independent from this series.

It should be in both places then. PCI_LIVEUPDATE explicitly requires
64BIT for its own use of unsigned long, so it should have an explicit
dependency. If KEXEC_HANDOVER requires 64-bit for its own specific
purposes, then it should have an explicit Kconfig dependency as well.
That way if and when someone wants to add 32-bit support we know
exactly which configs need to add support.
