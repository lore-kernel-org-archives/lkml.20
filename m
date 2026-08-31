Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410913A7820
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211389; cv=pass; b=Di2WNizwfaNSl8o8RtvgDWInITJ3tI6fWRn6KVdSWLiHYuLyV3CarO7lBNLy2mJdJrATDiV99l3CYgSTf2eeayoM/yfRZq043aS+PwJRwCjc/5HfMoKCEZPDVLAdDPbHy/5BdojjRbbVPRrAkI3pA/6IBiXME/RN5m09aBaa0TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211389; c=relaxed/simple;
	bh=+1ctpOnlda54PidlZ6bNmCPQ+W0TpdPhm/i6KN/wKa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwe24iFzvT8AeeuO/2N4pOLRnoWnv2e7OCykNU3WTPetsIKAVCdxk0bd7enFf1eLPFLXpLMumoHo1GSLjtLsbHDkflckFqumvyPmXYMLDWi25jTbdiq1HFlTh2bYnt0Pz3ghfvKRL5J2l11gclZk9vY6NIDRzQQLF9WzOSdLAgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Hg4iWkiR; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Hg4iWkiR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d91518a63fso1088645ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788211387; cv=none;
        d=google.com; s=arc-20260327;
        b=C/8ElKItQxDazqgCt8X0bXAExt9GaSy9NcI5in3rh8schCWinMAtU4Zay9Q8Pjy5TX
         8261GcKip4uB4BsafWvpIVa0JwAYbFCZbcYpmtvw33MCHSCz0CzoPd5G+zWQmDaeQMC7
         VBKUG9cp2qEgv5ybcpciXRXb5/JpFxflibljeyIQm3vjC3s22l4vRhDZ/SagrqzjG6Ep
         E9jElhLWvzcuP7LaRFnNXObxE4fr08cIbjNE1bvzizz0j6TarRP0T+1dCbo7au08FYjc
         PjeF9Brf0PaviInK0vgFDp4b5++H1prGKb7qg6SGtDxfJ0QkTcuuQo1hoRuFxdgJBB/i
         rCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFINHJ5jZ8ERlFnthoEvZPB9L54815EikMU7ng1wOz8=;
        fh=glbE97/cgKpwIJi7wJd5/49/o1h1CUlRnwAGzHmcOuc=;
        b=I9GciD6WwRsixinZ60eWiqHbuT53vKwzWMNo8F8ldxdKI3XbicEDQtHLQXONkMsewG
         87YpwSh9WTuXY06ArmjevZciP8Y3XSBqtfyUNUq/KSYAbA/ooXLWYaeJA8rFjEonMQkw
         lI2PTKnRwJBVcWooRvjLioPdpEZmgc9UcffzWy9tIvw3/uK9OGHMxOK7lpFjiIO/i4qo
         NVw1ms+8C66aXCXvmH1ol9+uh6Dw/HfPdiO99vD0LGUM9G6GcOrL6URLTUrvABUtb6gP
         tcp4wZpO6HuxC7U08GDiludKFYAFizd8QdLLBh2JwidoD7xTZGrK9i2IIPUa/lIGLUnj
         gL4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788211387; x=1788816187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TFINHJ5jZ8ERlFnthoEvZPB9L54815EikMU7ng1wOz8=;
        b=Hg4iWkiRhdIY0QnmPFpdDDHe7bhXyeMl98uRZihvaS06q1MXAaZFnAoaIgkx2NY8Zk
         MnLJneA+ImYjqm19LJuThUmwetBxKkPOSmTlT0pykqhl+YfAeB+5RjETqQLEdj6DZ1CV
         g+C7sS2dIfuBeeS8SVco2iPeOro23T6aNAuuCEA3BHxUxgLloJn2jDsdPB0kXpFgRN8L
         tjiUh5OlWjaBGMoJc0NadY4Qyw7D8r99FpgjO7kMUcG5/nD6xFE3JhmWzGlC9DdbZR1M
         PQzrDgaPLTZ45MGummuL6ffnkuGJEV4zjUGRCS5nnHn2JKGmLDQBEVQxxznWIk2v4/WE
         Pvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211387; x=1788816187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFINHJ5jZ8ERlFnthoEvZPB9L54815EikMU7ng1wOz8=;
        b=YzbzRl4MSplfXTOMYqPQPtUiSSAZgyTKNhL4iW5ustaRaNHpF2pNsM1RS8jgDZBTgg
         L0yepb6kPvdMzU8Fg92TZdfRu7QMJM/Rg1th7uVb3haWD+IDDORCf8nC9v0Wr0gFckTL
         RmSqszOvntw/rvW0K5e6TMATCpeRx+ZsLw06HRrKBcF5+5vxaNCYZc2etM/K1YrQij+c
         1CTpwAFMAl/hEuHSWoLZISDxR21nxrAn9Ymz7uVe+Zdn3G2dEJsPLUfzSF7ap8vjB5NM
         xtjn13jXY9BlKnVR9Je5gIbETphdv4eT/C10XG6q+dB40FGEmKVCjTyJ5dOpHY+gg/ax
         ne4w==
X-Forwarded-Encrypted: i=1; AKwUvByodzPnIaK2BlNVAlYrmCIHYz9/tJJW8hKdxdKW0iRw/yBLJjLd2J273a3TYEGzb7uoVwC++AELWkF2uo8=@vger.kernel.org
X-Gm-Message-State: AFuF++nkQCbigh2tjQCV6hHw1VUEJH1qXHCQEcP4m6MNX8oY0zDGwByx
	07fVQJ/Bmcc3Drh5kkqqsygxBde1cWZ3u32g/5bOwPmJyJpjBpuPaFO4TveK29qIANDX9aoCPat
	QYl72HqRa2+3RW00wVKe70wLvhcbRjNO8l6NsdNsa
X-Gm-Gg: AYBFou1LazO2T2aLK76Es0LEb68F5Fp2y1F5ZzMj5RQjfuOEXZZ92u3BhEFs6HlkQM+
	SG0fjgkYmWIBn9pl4Y+h28gqhf2FVyc+C7vuJaiHZcnTa/ijOfGyAhNFcslxqLz8b+FMTrFK7bl
	VN8xeJ4zTn4xyx2ytBirZJSYuTquhRNfxiG4G22bljlQB2e1MV+1nvFxY9vmoGPRef/1FB/WiU7
	ACNNzzCEdL0nSieHcF9L5KNuWjsDEPFxGorTAtTPeEtLKmTQqw/yUMzPoUXxNLndnS8u3qRPsKv
	1yiy8V82IKDFrE3eVVkIzF/FvIx7iwJUM/5ahV6rYaTg
X-Received: by 2002:a17:902:ebcb:b0:2c9:e846:a57e with SMTP id
 d9443c01a7336-2d74cfcdb1emr492271905ad.0.1788211387554; Mon, 31 Aug 2026
 14:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-cred-nonrcu-annotation-fix-v1-1-5fd149b2ab54@google.com> <2bdf79f45c5eb2ea66d59904418081c5@paul-moore.com>
In-Reply-To: <2bdf79f45c5eb2ea66d59904418081c5@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 31 Aug 2026 17:22:56 -0400
X-Gm-Features: AcwNN1UgSvn7xJ2VonI3rUNXxETiZFahKrkwjH9zjPk8v2KgPZyHugOYt0cGY20
Message-ID: <CAHC9VhTYYbmKVXzMrCv=sLi1c+6Wdvum+TmpGNPZysaNHDyTHQ@mail.gmail.com>
Subject: Re: [PATCH] cred: clarify that task_struct::cred is only for the
 current task
To: Jann Horn <jannh@google.com>, Serge Hallyn <sergeh@kernel.org>
Cc: Eric Paris <eparis@redhat.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, audit@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:41=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Aug  6, 2026 Jann Horn <jannh@google.com> wrote:
> >
> > The `cred` field in task_struct is currently marked as __rcu, but that'=
s
> > not true: It can point to credentials from access_override_creds(), whi=
ch
> > do not get freed with RCU delay.
> >
> > What actually protects task_struct::cred is that accessing it is only
> > permitted for the current task (except for setting up a child during fo=
rk()
> > or tearing down a dead process).
> > (There is currently code in Smack that violates this rule, but that's a=
 bug
> > and causes UAF, I have sent a separate fix for that.)
> >
> > Clarify this, remove the __rcu marker, and remove RCU helpers from all
> > accesses to this field.
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> > For context:
> > There have been at least two UAFs of struct cred that I'm aware of, bot=
h
> > caused by wrong use of task_struct::cred:
> >
> >  - https://git.kernel.org/linus/a3727a8bac0a9e77c70820655fd8715523ba3db=
7
> >  - https://lore.kernel.org/all/20260806-smack-uaf-fix-v1-1-26426d389a26=
@google.com/
> > ---
> >  include/linux/cred.h  | 17 +++++++++++------
> >  include/linux/sched.h |  8 ++++++--
> >  kernel/auditsc.c      |  5 +++--
> >  kernel/cred.c         |  2 +-
> >  security/lsm_init.c   |  2 +-
> >  5 files changed, 22 insertions(+), 12 deletions(-)
>
> This looks good to me, with one small nit below, but as we are at -rc7
> I think this is best kept until after the upcoming merge window so it
> has more than a few days in linux-next.  I'm going to merge this into
> lsm/dev-staging with the expectation of merging it into lsm/dev after
> the upcoming merge window closes.  If anyone wishes to object to this
> patch or add their own review/ACK/test tag before then, please do.

This is now in lsm/dev, thanks!

--=20
paul-moore.com
