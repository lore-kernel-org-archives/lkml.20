Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F164A239E9B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791125022; cv=pass; b=WOKl9MHDkSJb2cwhffI2Jx0SmOA3A4Fx1MwrEhn87CUKNtrIaEBG4XXm41JQhsNwEqmiAQueG1sM2zH8pK8j/I0WSsw4fRVUc1XXUqLy4fAcfpujh9JOv1DVYPFr9TciXUx8ceNUs2m5bflRw7hZ5tklmObRaJ6nv24kJpwGj7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791125022; c=relaxed/simple;
	bh=/0GCEHSBrx/oLdC8mUVBcqc/kgOvtpuBhykRXWdVcfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExDf1R9cPaumH29j/LLgvgmn7im9CQda7X5tFDQ+5UL+b5HHT4g1VkasZSwNkT0AtuJ8Zx/+f87pEM/8Hq1FGhsdHdsezXfLrgTG+3Tw2DQM83ELqIKXdYqcYd+1eN8qULg55dUW/yG26CJr2SSgpbcOoZOyQav4E/YFt7r98yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGX3BroM; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGX3BroM"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b2f02so76099fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791125018; cv=none;
        d=google.com; s=arc-20260327;
        b=Rqd2GAMQKwn33g6D7SGcTb0Rd1sEcYJIY6ZLkN3WZdaP/D0n5kx+lqTdVsfeYGBGzq
         ZduO0gLW8mO1lNN65wLTUl1iyDq/21oZ/Ns50cEcYAeAvZJfWLeTPkLp5YBmB7YFCLPj
         d6PgzkhHPAP1tSzO9lU2eUTy5A1GWnQC+0Zr+m4gerlWOuHVRk7lgHyvluchpqZt5Wk6
         9pW61fin1ZqQRm0ygxh4Xj0fN6JuMFuKDGiSLmkOh0cro96tc2pFPcRwPXMptYrwJo1g
         Vnm5gLAP/JSxFYLwh5bH/zqRDYhVJwt85bQ48Qm/+4/uWV+6QnHNNqEXntkfV0DzNLUX
         S18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vO8DVUB8eovbQ61VNyC+4aG7Y+QXZ4ZRiFqL2N54is4=;
        fh=22HSEoRMspQQMaQgIhkP27yridnSWFWqFj5TqZOsurY=;
        b=GnenDFiJMm7U45dt6t+QPa1KnxBMc2idwq/iMV6WKrp7ah6p/OLjXszofsBX/+TTB/
         4dzSTAW7YO3hFt/d1fKxro41Fk5LFxU5toR7IScnhBH8lYOACWBuBqNBPm5OdTDlxURp
         Gnt/kURKVwTWAEdOZ1htVy5DSoDHPK3e9e8Nr3Gzt38JDijdiglOd2ue10p4tnhKk5+g
         XTzq+LXZM7ZyJh5xhN+Pp9Fl2zmP680AsT2AImyQbpCqZeKlN43FmdTjvsz+9f1vQozE
         qGRpHE1l9QYcK+SVxwqqqY/l8OwWTqHtn13ZmCw/YY9Z516Dz0paVcVniPvluAL0CadY
         lvtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791125018; x=1791729818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vO8DVUB8eovbQ61VNyC+4aG7Y+QXZ4ZRiFqL2N54is4=;
        b=bGX3BroMnb50jILaRJL5ntkV6RDPw4sMXASYHCOQqcIAVHro3uvKYBjpW1kL98kIoI
         uwwfuHfQgpLtHltYg4KnNeO5jR4sTpyv5t3t81gOXF9FsBSIYW4WxfEd2Tdd6E+dnTbn
         bG86+6VL8nensop5INUb3Kh/+1E8kB8Pp90UjzujuE4x8i+chKEwzbiBsAG47GNFChQ1
         8k9lyPCVZxg5PD4mVMPoIyG3TE559WdFfYxWxSvXgFxeSt76V611aKgF2xw5iwI2IsC2
         isGucZmmzTWpeUYuYrrG+RloFyZnImhbAI0v/IaaWkkD50LMENFyk6nzZ+KzzcW+ifpm
         5BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791125018; x=1791729818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vO8DVUB8eovbQ61VNyC+4aG7Y+QXZ4ZRiFqL2N54is4=;
        b=vZJo1j3dG3FgWUO2L3Y9pPmIT/rhM239BGELVPsqJ34bopj4FHun6w6uROWVhCRaqB
         /f7/th3zpXCysCI7FyYyxbC9W3Zm7lL+v7YVGv8eFhTPAizTgC+poLSwjn76rHxPtBrD
         CHND41BQJAgYN+p5ik8BzJ563Bb65R4G4de/KSpaiF2F8gT5thCRq76PxKI+8xiNx1gf
         wcRyxt68WpXOx/P4R5Cji2zrXag9FSL2JpAwUNTi4dahG4HlISI33jx9bPpaeeJPQWFk
         oucgFeqCr3XpFs3Nz8/T3NPh3E618ebWFEgd6xZnbIOE8RejNtB6A1ShnMXnY4ixZkYI
         IJvw==
X-Forwarded-Encrypted: i=1; AKwUvBzBclTPQGmY//+JRzGw01A/XzUXyciUlm6pRnZEXL5fyaOTRGrpGVyeZB3W85Ph0KOMWypsDC7k085cRYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpVMrKThwM6M/j9N3zKbyd1S8G03EDrypn6W5qgV+tqp8zaTts
	5h/qVA+yeGR49pAwR2aEf+XZyDRsJGG7CGXSwL8ijRmDFQHj/3mgmzVMiUhdRAhs0abdUawJ9Dj
	WeWvEPVFd9+bSkckAHqwAqa+tYkPWy64=
X-Gm-Gg: AYBFou0cBgh2uTon1Cmzf02y2vpbO0EE6yHMPlcdGcliiAhzOw10u6S/BOOATCuoNlK
	0cF7bzTHFshRHyeKeyD4d/gZkKrk+S0KBenbR9fXsRLKE/kbo+dULo2UfW4rBGgEtMdio5MU6kY
	2DgFdPdtjDTgt0YUsW8mipJ6eFyZ1IVcT3q1DhJBAzAasbxgxtgIgPmm9DEfz0a+rAXXazCUA5B
	OYdyS2TpoU8+eEI1gm0Pd4qRtSzYuNc5YQ7SPcI/v+kyhx8xD691OICIoyUHC6JUcVvuhAwcesA
	93LLdmq/AwvZX707CGec0bZGvjCtKYcHQdCY4sF40CV+ao8Qkil9EtW4muRjuZMuz7k=
X-Received: by 2002:a05:6870:8dcc:b0:46a:c673:a16c with SMTP id
 586e51a60fabf-49e15c87e4amr5548021fac.5.1791125017831; Sun, 04 Oct 2026
 07:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928203445.72318-1-singhpra@juniper.net> <20260929074312.v3jT8uel@linutronix.de>
 <59d5452c-42b1-4784-a593-5e549a2a0f12@app.fastmail.com> <20260929151401.doOQX7D0@linutronix.de>
 <20260930013500.10273-1-singhpra@juniper.net> <20260930063217.eWGJ_JpZ@linutronix.de>
 <20261001012011.30525-1-singhpra@juniper.net> <4491d728-64f6-4ab1-aae2-22bce34a9b18@app.fastmail.com>
In-Reply-To: <4491d728-64f6-4ab1-aae2-22bce34a9b18@app.fastmail.com>
From: MaeeFilho FL <joaoanandalima@gmail.com>
Date: Sun, 4 Oct 2026 11:43:25 -0300
X-Gm-Features: AclHuK_mS1OrVdBt38iL83F6utRDrvJx_X_IRFzdoYUx1B03kcKmjAW9oBdsM3E
Message-ID: <CAFA5sMdHPz-H1EOw3y4RFjHMO9_ZmyV45SwvqF7wh8E4spKujg@mail.gmail.com>
Subject: Re: [PATCH v4] efivarfs: add nostatfs mount option to skip QueryVariableInfo()
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Prashant Singh <singhpra@juniper.net>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Jeremy Kerr <jk@ozlabs.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Steve McIntyre <93sam@debian.org>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prashant, Ard, Sebastian,

Regarding the concurrent update validation on efivarfs_reconfigure() and th=
e
KCSAN annotations discussed for the benign data race:

The implementation of data_race() directly wrapping the assignment of the
nostatfs flag inside the reconfiguration path is clean and highly efficient
for low-level standalone execution boundaries:

    data_race(sfi->mount_opts.nostatfs =3D new_sfi->mount_opts.nostatfs);

Since the reads inside efivarfs_statfs() and efivarfs_show_options() stay p=
lain,
this approach perfectly satisfies runtime instrumentation checks without ad=
ding
dead memory barriers or locking overhead to unprivileged statfs(2)/df routi=
nes.

Furthermore, preventing the global CPU stall caused by the SMM rendezvous d=
uring
QueryVariableInfo() on real-time environments (CONFIG_PREEMPT_RT) by defaul=
ting
to nostatfs is a major architectural improvement for deterministic scheduli=
ng.

For the final v5 patch spin, keeping the commit log focused on the preempti=
on
disabled context and dropping the verbose raw strace outputs as suggested
makes the patch documentation extremely tight and industrial grade.

Acked-by: dev12124 (Jo=C3=A3o Guilherme da Silva Freitas Lima)
<joaoanandalima@gmail.com>

Em dom., 4 de out. de 2026 =C3=A0s 04:59, Ard Biesheuvel <ardb@kernel.org> =
escreveu:
>
>
> On Thu, 1 Oct 2026, at 03:20, Prashant Singh wrote:
> > Thanks Ard and Sebastian for the comments.
> >
> ...
> >>AFAICT, that would potentially leave KCSAN instrumentation on the reboo=
t
> >>path, which might trigger and interfere with the reboot. So instead,
> >>I'd like to put this in efi_reboot_required if we can. If it is needed
> >>in more places to address an actual KCSAN splat, I don't mind. If it is
> >>just to make Sashiko happy, then we shouldn't bother.
> >
> > Could you please clarify what you mean by efi_reboot_required here? nos=
tatfs
> > is only read in efivarfs_statfs(), efivarfs_show_options() and
> > efivarfs_init_fs_context(), none of which run on the reboot path, so I'=
m
> > not sure how it would apply.
> >
>
> Apologies, I managed to completely confuse myself here. Forget what I sai=
d
> here, please :-)
>
> > On the annotation itself: an internal review flagged a potential KCSAN
> > data race rather than an observed splat -- statfs() can run concurrentl=
y
> > with a remount updating the flag, so it is a genuine (benign) concurren=
t
> > access. I ran concurrent statfs/remount loops on separate CPUs under
> > KCSAN and didn't trigger a report in a bounded run, which could be
> > expected given KCSAN samples accesses, so it doesn't disprove the race.
> > Since KCSAN only needs one side of the pair marked, data_race() on the
> > write covers both readers and the reads stay plain. I'm happy to drop i=
t
> > entirely if you'd prefer to keep the benign race unannotated.
> >
>
> No, let's keep it as you suggest.
>
> >>Please keep this description _here_ where you have it. Once this is
> >>merged, you could send another patch, extending the documentation with
> >>the statfs option (I think the workqueue change is in).
> >
> > Sure -- I'll keep it in Documentation/filesystems/efivarfs.rst for now
> > and send a follow-up extending Documentation/core-api/real-time/hardwar=
e.rst
> > once this is merged.
> >
> >>You still have the problem that someone reading the variable leads to
> >>the same problem but this requires a privileged user. And if I am not
> >>mistaken, someone sent patches to have efi-runtime runtime disabled/
> >>enabled.
> >
> > Agreed -- the variable-read path is the same, but needs a privileged
> > user unlike the unprivileged statfs()/df trigger.
> >
>
> Indeed - this is only about anyone with read permissions on the mount
> point being able to trigger this. And looking at your results, the
> rate limit we added recently might be a bit too permissive as well.
>
