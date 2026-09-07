Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3FE44AB8A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777404; cv=none; b=btfRBT9w+0dQAfg1bZIuli9PHHUjQu/2vQTAVE97TOGMcJkJzU+zDrtI82kUo/SU/QQDUeTiIkSFk3qhp9aqdHwnR+66xAhFDnzWCgMfVpdOML59ZSdKL+69KFgm93HcQKFX1QlVZjsUNSZimxXir/UMoru0zvCG3H+hvTkkRpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777404; c=relaxed/simple;
	bh=knLSy+tAiOCBjiiSkaNUjr38e019JvyDKoSRtCD7jXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9CKy8K1QXgW9Z1CNkEYu0qWpcjxNuCr4fOEpEt2D60s2RW9K8spBsA9Hxin27kSofbfysITlhfy11X3I3x/IE5K2oMAeX682QVVMTb/kiYV0klURhzc/3NRkxPEUX6GQEOEgUgl+zivp7236/y4HNcI6VUfLOFekro/q6vj5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iyMOof7P; arc=none smtp.client-ip=91.218.175.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iyMOof7P"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=knLSy+tAiOCBjiiSkaNUjr38e019JvyDKoSRtCD7jXc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788777400; v=1; x=1789382200;
 b=iyMOof7Pvy6wg2VkzREjxcMYjNsEeclp7fWL22uIxKwu2ZHW7AR+dFw4Y65M96k7Rwpk7XTt
 x7kFoend80i3V3whXlAS5PGSJZSdHcDOT+ggdURcAhlMC4Qho1AgBJESi0h60NhJd6GEhUMkC9+
 2OgzQPm8u3JZEny1EpE5CpOU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3a07dd903fbf59a0;
	Mon, 07 Sep 2026 10:36:40 +0000
X-Mizu-Trace-ID: 3a07dd903fbf59a0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so7477e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaxNcIH+vdXzdryG6H2K/OwcRVJxwjob6Rp9LWW10aVDPMF1gggqxorn8r3z2M3AGnxL74KSyA4clbdkI=@vger.kernel.org
X-Gm-Message-State: AFuF++nTmxhyZmndnPFYyhd5eS6uSWNkLvJ+BnBIfOfNHZuaX6ZjZd4n
	4UO8ZwU+JQZCQBELExFtWGtT2sICVas/SLS1YuAQmOTJGFTLZEMN0iFM3PqGf4BO6QBpWV+RI6A
	xTHoY705OwzmYn4qJv3Mqzecz0ouOsYpwBkMCTgcE
X-Received: by 2002:a05:6512:114d:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b74d456083mr154509e87.11.1788777394103; Mon, 07 Sep 2026
 03:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103131.627392-1-fuad.tabba@linux.dev> <966b103e-dc9e-479a-ba6c-e8e6727e1bd7@arm.com>
In-Reply-To: <966b103e-dc9e-479a-ba6c-e8e6727e1bd7@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 11:35:57 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy6kbVHKpW+jLHfdpMr16+OrGaCRyt_xEpP_6aQwKv5Yg@mail.gmail.com>
X-Gm-Features: AcwNN1WVZ2rRbHW0_CvMjthG_1fXG-hc0avpc71bJuZRUt-gMT5OfwZEJAwht6A
Message-ID: <CA+EHjTy6kbVHKpW+jLHfdpMr16+OrGaCRyt_xEpP_6aQwKv5Yg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: mpam: Document when to set arm64.nompam
To: Ben Horgan <ben.horgan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>, 
	Bradley Morgan <brads@mainlining.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ben,

On Mon, 7 Sept 2026 at 10:44, Ben Horgan <ben.horgan@arm.com> wrote:
>
> Hi Fuad,
>
> On 04/09/2026 11:31, Fuad Tabba wrote:
> > arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> > finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> > firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> > left unwritten, at reset values that are UNKNOWN, and KVM still hides
> > MPAM from the guest but no longer enables the traps that stop a guest
> > from using it. KVM never saves or restores MPAM0_EL1 and MPAM1_EL1, so
> > what one guest writes reaches the next guest and the host. Nor can the
> > kernel make the EL2 writes unconditionally: they trap to EL3 on the
> > firmware the option exists for, and TRAPLOWER cannot be read below EL3.
> >
> > Say so in mpam.rst, and add the rule and a pointer to the
> > kernel-parameters entry.
> >
> > Suggested-by: Ben Horgan <ben.horgan@arm.com>
> > Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >
> > Notes:
> >     Changes since v1, the first three from Ben Horgan's review:
> >      - Put arm64.nompam under a new "Command line parameters" section.
> >      - Separate MPAM3_EL3.MPAMEN from TRAPLOWER, which v1 conflated.
> >      - Add that KVM does not save or restore MPAM0_EL1 and MPAM1_EL1.
> >      - Drop "No functional change intended." from the commit message.
> >
> >     Bradley Morgan's Reviewed-by on v1 is not carried over: both
> >     paragraphs, the section heading and the commit message changed.
> >
> >     v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
> >
> >  .../admin-guide/kernel-parameters.txt         |  3 ++-
> >  Documentation/arch/arm64/mpam.rst             | 25 +++++++++++++++++++
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 68647ff4bdd24..e6d543de3cde5 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -575,7 +575,8 @@ Kernel parameters
> >                       Set instructions support
> >
> >       arm64.nompam    [ARM64] Unconditionally disable Memory Partitioning And
> > -                     Monitoring support
> > +                     Monitoring support. Only for a machine that does not
> > +                     boot without it. See Documentation/arch/arm64/mpam.rst
> >
> >       arm64.nomte     [ARM64] Unconditionally disable Memory Tagging Extension
> >                       support
> > diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> > index 67fe515ed501c..e66b1359d1282 100644
> > --- a/Documentation/arch/arm64/mpam.rst
> > +++ b/Documentation/arch/arm64/mpam.rst
> > @@ -87,6 +87,31 @@ The supported features are:
> >    MBWU monitors can be exposed to the user after support for more monitoring
> >    scopes is added to resctrl.
> >
> > +Command line parameters
> > +=======================
> > +
> > +arm64.nompam
> > +------------
> > +Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
> > +it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
> > +CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
> > +the MPAM system registers from the lower exception levels to EL3.
> > +Firmware must clear it, or handle the trap and emulate MPAM as disabled.
> > +Where it does neither, the CPUs still advertise MPAM in the ID registers,
> > +the kernel's MPAM register accesses trap to EL3, and the boot fails.
> > +``arm64.nompam`` exists for that firmware: it makes the kernel treat the
> > +CPUs as not implementing MPAM, so no MPAM system register is accessed.
> > +Set it only on a machine that does not boot without it.
> > +
> > +It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
> > +the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
> > +unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
> > +guests but no longer enables the traps that stop a guest from using it,
> > +so a guest may be able to read and write MPAM0_EL1 and MPAM1_EL1. KVM
>
> As you are listing registers, MPAMSM_EL1 can go here too.

I can respin a V3 with this added.

> Generally, I think this documentation change looks good now but holding off on a tag for the moment
> in case anything comes up from your MPAM trapping change [1].
>
> [1] https://lore.kernel.org/linux-arm-kernel/20260903160819.831518-1-fuad.tabba@linux.dev/

The trapping respin doesn't reach the nompam path: the override skips
the finalise_el2_state writes whether they clear the traps or set
them, so nothing here needs changing.

Cheers,
/fuad

>
> Thanks,
>
> Ben
>
> > +does not save or restore them, so what one guest writes is still there
> > +when the next guest runs on that CPU, and when the host does. With MPAMEN
> > +set, EL0 and EL1 requests then carry that PARTID and PMG.
> > +
> >  Reporting Bugs
> >  ==============
> >  If you are not seeing the counters or controls you expect please share the
>
