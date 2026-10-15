Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF5D51C041
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073278; cv=pass; b=hD+s/roY3ZtUzJgtevirMK9sK5nSSuKuA8QGLyoRGmueOib/2CnsHd72uLPhBRU0t2JASPUK5nZM7zAbDjJPF6DyMAdYMRbXtJ5jMUJLNDAMMSNl01ymLpJbYH22NhzMQyCfGh4K4uIOEeIEHPvhKIqkTSJYNLIXPWPrZFd0Jo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073278; c=relaxed/simple;
	bh=ItHKc3HnkTEkz1Ak95cIQWYaLbvA42BxU4/kqbvpTsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jiqpg2cHstQ7I0yHrIHlpVSOiFjOJ1q6y1VL4yybYqbpW3/MNwAVdjpynHPSq2Fe+hJELjQRf0tuGQd7IIt2+K84GS9GM0t/gRUn0RzNny222qoOZV6fkk7XogPdD8NL+4cqtS+qSAqVC1OarkSMY193V4BY+NSYqSYUNB7U3lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=eSuKlJyv; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="eSuKlJyv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so3689210a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073274; cv=none;
        d=google.com; s=arc-20260327;
        b=nCJBO1jgsKK6p4cwXHMfZXPbuYRMoi+OzPGuoQCDSCzFoVW8NSImxdxuzGif9fdiZw
         7uB4/fxgiC1JwzYCy895Ys6dq1/PSOD/1xbIWDXsgbMQwnxShG3oOdA++062X8OiczBn
         u9qA1xlEizK+jspXR4cW90gjEhX4ytlhKrVIe8gxYqnlwbiQ2rPBl64iuy/WfrYuspnP
         inWaNKvsvZIT6SmimDtROK49T+laupixnuRZ690S8sei5dHklIXHnmgG19ZtuFBZ1ytw
         w9H6JPvt1xTMoWBgQ03r5BQwGh5ZTOectKfzFkIAG9NRgYHlGsN0e9K07xv+gx6Vgb/5
         fODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ItHKc3HnkTEkz1Ak95cIQWYaLbvA42BxU4/kqbvpTsc=;
        fh=az0TMtBspHJvC1k6HjCCpegJsnZl5zl59PeCp7QMVPk=;
        b=I5/WNCsvMJ0kUEAe5/2zo6InfofVMpT/Z2b25NWZCvl29EFRxh1r/gu/sCXgt8IPns
         fOn3vuZBj1utsrUg2CUBFKUg+tMC84WZG9gml8bb4d2r3Cm7Vi+H1K3nAJdm57ALQZ+j
         46mcx5jmMXBimlqoqIsprA0kbh6X18eQSP3MDgHIMgDNJhj/8sRv0pwxNI/2jHpCy9ly
         iuR0pLNIwKTPghhlX1ESiCzidwnSOG6RPyMyhMORNq3WrjWXlkCyPSFeL6pPpHS88QSb
         qZIvDujhqjRicrQxW1c6CTAPPyVa1M36TiRE27Ubg6EXLY26jGqVAAM0iSM2JN6uws14
         fcXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1792073274; x=1792678074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ItHKc3HnkTEkz1Ak95cIQWYaLbvA42BxU4/kqbvpTsc=;
        b=eSuKlJyvMcMSXfM3hOwrbGy7L+moEIicuyXMsjTuDju6yA4b6xaIAJKwFHW7mEniux
         7xONbf52AuRxKdKJvcAQwsfUta8IVS64FihDo0JRybsogo+DPO/ue4sKdu0RP30Z7jRU
         lzXEcmOLbzcf4AM2xPRmRnoci6vhY+Y7vFT64ZK9CcMkfk550kFRaCs4IGlXP4So2UH8
         xHPaiKaYyYRQIYvV+pHvGonqbDzozlpWURaiDN/ocx71j8ciaufM8cLeHhmbEWV4VRGL
         DTFvvZBly1QlpVTyhWoFhwho9wDj+7BmPwh5lx70wF4uZDR3FKd+ZGFyyLXEAwFwQ4QN
         aKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073274; x=1792678074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItHKc3HnkTEkz1Ak95cIQWYaLbvA42BxU4/kqbvpTsc=;
        b=RoU8IFhQwnvPFA/rjjPgaTj18jm8qfPCMZZWVCNVRePwyX6nuC53zaTN0zYw+JLGQ1
         biN1GOupIImLZxu5Y2wvAroeqU3/PJmz+hTUz+oqwBQA9iSCdTg+XQWG8A25yzwJGdFr
         RK9NgGCEllpm7PZAEZ3Xv5fluBrjtbj+uEx361ECm6mMTf3PvAw4jnao3LzNJS/r+8Li
         M3rHq8VoRwCunxV46wca83EGPSVQy7haARQmJUFYkNq3L3kRIiO3toTYn+NH7j0r1mzh
         DmU8PpJQT16PB77lwaKtjRcN6tKgB6o/ezhJJveu1Im4Cj/y/HtGf4l11xKhX0iFPgTA
         4VZQ==
X-Forwarded-Encrypted: i=1; AKwUvByH+1UVt89oeb7NxoSoiz94wAeJaVe/X0CtGfTO9y0uCmLO59gJ3n4QgnVrNWX4Sc2onevV4a5LPlUyUpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv5pvCOHAniLCVV28gJ5azniwrPm8tr5+UPL6ys/YJ3mfVu682
	d3IZqH4CTNbfGZVnvFzBUqtSPUGbUzrf0vnyaasDYXGJas7ypZBOqcjlCG1A6gB+nPAFse0FEs/
	pbU27PYHcF1WaP+0MVK71YHLle/5L/K5y5D6cR1+n7g==
X-Gm-Gg: AYBFou1cmyBXuoVEAw8AT4jEQQT5NKPCMxO5IYJzBBha2WayxmCL5McEvdNw80p5+R/
	tL3SbC4I3Mo9JcKRwRSHh+TCet+DsIajKf5d3vmikvFUgwV/8WFs+VeDzLWa0nnLe7rPtMPZnYY
	nDcOP6cw/bmyVf5fINpvxCnqbDhqBrcsw/KL3UGbcNLIAqXvXRne6cjXeRkZ57YvZwblWUOmSy8
	PBQPPFXAJXkkZM6r/z8W+dy3sqbUHZ4fycOfeVJ4RlwyZXPaREYRo5xH9RpZ3zpaOz5LB4KVlEs
	yEFUOIfwtvDb7PVC6HrEuO2lSoYnIPzDDMPivin30a1byYvD1QMdLlWC0tRKKGMhHuGFuOqmHfZ
	QB3qsAM3N
X-Received: by 2002:a17:907:2d88:b0:c2e:4373:521 with SMTP id
 a640c23a62f3a-c31aa0d2286mr1635346166b.46.1792073274619; Thu, 15 Oct 2026
 07:07:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904150304.49104-1-max.kellermann@ionos.com>
 <b8c135bf-927e-454e-8bca-cbdbae133d51@huawei.com> <CAKPOu+_Msno=mux+FUc-oV1-ywRFujJcnKS2HNv0sjtRVtUP3A@mail.gmail.com>
 <CAO8a2Sj2UbocxY+_MRdcH1TWht=UJT+ANWmzqLY9MQxZ0ujUpw@mail.gmail.com>
 <CAO8a2SiVWYSR6s=Z34QcfPVNVSLGk+YQQza4DDEt8_8+j37AHg@mail.gmail.com>
 <CAKPOu+9x_7WQmKhW==AmLoSzuPrUqeSV+JR69-TaovjEhuj6Ew@mail.gmail.com> <CAO8a2ShEjqyNA41ujmF5GfOM+YbJvXqCHKO9V++KBkJCXNOSUA@mail.gmail.com>
In-Reply-To: <CAO8a2ShEjqyNA41ujmF5GfOM+YbJvXqCHKO9V++KBkJCXNOSUA@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Thu, 15 Oct 2026 16:07:43 +0200
X-Gm-Features: AclHuK8oqOt_bo8LfOev4v7Ru6cCWNONf2R_xe0ALbyDnAjTbsaYA2fl8J-_3FU
Message-ID: <CAKPOu+_+oCzprewMeggY=32eEUt5ukTvhVMbEFGSh3Owa1zJhw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ceph: don't unregister an MDS session before
 removing its caps
To: Alex Markuze <amarkuze@redhat.com>
Cc: "chenyuxi (D)" <chenyuxi19@huawei.com>, ceph-devel@vger.kernel.org, idryomov@gmail.com, 
	linux-kernel@vger.kernel.org, xiubo.li@clyso.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 7:42=E2=80=AFPM Alex Markuze <amarkuze@redhat.com> =
wrote:
> > I see no rebase conflicts with linus/master nor ceph-client/for-linus.
> > What other recent changes would make resending necessary?
>
> Please use the ceph fork and the testing branch.
> Since the last merge with main Linux the testing branch has grown by
> upwards of 100 acked patches.

I just did that and got no rebase conflicts here either.
I still need to know why you want me to resend the same patches without cha=
nges.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
