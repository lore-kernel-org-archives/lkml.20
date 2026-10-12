Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5723E832A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832421; cv=none; b=ffLIMwtBd8u91vV4hLerRCpzuVYOX/N9/gVCM/+EZH9W4sy6xR3HH4RQ2FiJQnRo6jwXukpNIt9gsY2GjYJ+jmLl2Uc1/iF1Gn03GFeqN06xojQ+TXQft8vgkY8JNIvi4Wt70OEj6385Tdfrt+CgXa8H1D+BAVaa2rHdyFFDMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832421; c=relaxed/simple;
	bh=+qmz+yBeXRlBRx+OdP1RU/IGoFJLfquctyGFdtp+Fp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZs6nxrZ2r9iCeUzVT61pW1vvnou+mb/Q5HKhH+rCBk/gcmKzfLQGj9SkO27sifk6aSa13ElosXhpuqvzfoud7PzL+NOYNaqxjHbndl7yN29epa+3Jwd1Jw2Fm1oH2GGxqhkrnHwkl9QnwwELBIX6l3c39Ka2A4xGcl/jPDZERo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjdhSnf4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjdhSnf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E2D1F008BE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832420;
	bh=Aps8kHLqi/8jFYidGtO0vryj1o6o4s/CXu0xm5bD3hI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OjdhSnf4FOwgU1/owe4/c9lkF6KZrXUW4MF9tPs6ZnU7YNaqeQ7iUEyCNrdu7UYtC
	 TVAf3qP2tsN6Fcm3vCBb7k0rwS6zSdcnFTWVbabTpgj/fMzWkFDhqrGpDSs+k48r36
	 hlSfVvF1nWgjvCnC0/Kso4niOkHHFQgGJek9KrgKaUOGFEiciJmQNA8wXSA3KLDZnT
	 MjbuSmXC/dlUrrWiubn/tMKkLmopAWm3CzrfF8UO/ieloGGEwsv+3CBwh9+PZSa7/3
	 JngoX6XjiYQdYsQj5yQhPVFUoQvkTMnk4ElaUriBMFPBlcycWno277oWC6wz7O6c+w
	 fC7CqIFZYN2HA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcbb82dbadso1560224e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBnetbKxcvG+3NT4sxvG+NBTcKvKJyF84P8Xf4Lp8zXVDdA3XD/ZzRKEtmHO41Yd/7eekLF9kr0pxt83I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI51J79WtgPppIIIyM5ynbAJRokjIoSQX/pJpxHfQMJYUeE8I0P
	IINvvmYi7oeakw+2TZGRcnRCVe+q5C1dDtVjFo+x9rTSHc5RPZephOpxMx3kFRrYyD2yJ6MSnQl
	haz7p1Lr4miYTS2KyXOKSjAfHv7VxJ9Q=
X-Received: by 2002:a05:6512:3042:b0:5b8:f125:f48 with SMTP id
 2adb3069b0e04-5bcde8e2d0cmr3421626e87.57.1791832418176; Mon, 12 Oct 2026
 12:13:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-8-suzuki.poulose@arm.com> <ar-PiBQGye4_hQa6@arm.com>
In-Reply-To: <ar-PiBQGye4_hQa6@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 12 Oct 2026 21:11:34 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gqSsA=tdKuQB1uExYas8F0BaxUm+eh8xaxxP6YAFB6cg@mail.gmail.com>
X-Gm-Features: AclHuK92lB5NiS5iBnplzk_ORuBnuUMmcADY6EqE6mt-4e6s6zZBLocPPGyqu5E
Message-ID: <CAJZ5v0gqSsA=tdKuQB1uExYas8F0BaxUm+eh8xaxxP6YAFB6cg@mail.gmail.com>
Subject: Re: [PATCH v22 07/10] kernel: hibernate: Add an arch hook for
 preventing hiberation
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, maz@kernel.org, will@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, 
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com, 
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 1:03=E2=80=AFPM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Fri, Oct 02, 2026 at 07:15:03AM +0100, Suzuki K Poulose wrote:
> > Add a hook to allow arch code disable hibernation. On arm64, with an RM=
M active,
> > there could be pages that are delegated to the "Realm" security state. =
Any
> > access to them are fatal (e.g., hibernate save image or restoring an im=
age to
> > a delegated page). pKVM host also has its restrictions on enabling hibe=
rnation.
> >
> > Add a weak arch hook to let the architectures have a say.
> >
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Len Brown <lenb@kernel.org>
> > Cc: Pavel Machek <pavel@kernel.org>
> > Cc: linux-pm@vger.kernel.org
> > Cc: Sudeep Holla <sudeep.holla@kernel.org>
> > Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> Nit: the subject prefix for kernel/power/ usually is
>
>         PM: hibernate: ....
>
> I can fix it locally, no need to respin (and probably the wrap the long
> lines in the commit log, we tend to keep them shorter).
>
> > ---
> >  include/linux/suspend.h  | 1 +
> >  kernel/power/hibernate.c | 8 +++++++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> > index b02876f1ae38a..a3815027773c5 100644
> > --- a/include/linux/suspend.h
> > +++ b/include/linux/suspend.h
> > @@ -401,6 +401,7 @@ int hibernate_quiet_exec(int (*func)(void *data), v=
oid *data);
> >  int hibernate_resume_nonboot_cpu_disable(void);
> >  int arch_hibernation_header_save(void *addr, unsigned int max_size);
> >  int arch_hibernation_header_restore(void *addr);
> > +bool arch_hibernation_available(void);
> >
> >  #else /* CONFIG_HIBERNATION */
> >  static inline void register_nosave_region(unsigned long b, unsigned lo=
ng e) {}
> > diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> > index d2479c69d71a4..9d9d53828542f 100644
> > --- a/kernel/power/hibernate.c
> > +++ b/kernel/power/hibernate.c
> > @@ -106,11 +106,17 @@ bool hibernation_in_progress(void)
> >       return !atomic_read(&hibernate_atomic);
> >  }
> >
> > +__weak bool arch_hibernation_available(void)
> > +{
> > +     return true;
> > +}
> > +
> >  bool hibernation_available(void)
> >  {
> >       return nohibernate =3D=3D 0 &&
> >               !security_locked_down(LOCKDOWN_HIBERNATION) &&
> > -             !secretmem_active() && !cxl_mem_active();
> > +             !secretmem_active() && !cxl_mem_active() &&
> > +             arch_hibernation_available();
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
> Raphael, any objection to this patch going in through the arm64 tree? It
> matches the style of other __weak functions in this file.

No objection, and feel free to add an ACK from me to this one.

Thanks!
