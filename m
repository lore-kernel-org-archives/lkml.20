Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F33D7D82
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480154; cv=pass; b=NnnwH0+/vHy/6UjolGRadegIZgTX50o5KVUAXTN17YCD8Oih0i4ia7d3YaoQKaqh/qaGp27CsYik1615PdhRoAKv+VOcw0koGgMVxyY3E4UKxPAPHGX+KRMfB4IMCYlVeOIe1nHtka60hNVefnfq/eX7qtBMExmPSdiEsD48BRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480154; c=relaxed/simple;
	bh=p/bm6QL+GjFW9OLC8hTQZX5y3ubnpWDY/+48cQOWXNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxKmcou3u6LrAbIwSljsljKj847MkVU6m/DEuUSa/iWhB1BBRYlZ6EYvTYsRbSa0rwdJ5VLora5ijBB8ox5u2rCMMtcLKyVZ3CIhtFQLyXmLDHvgth+Su4x0FeYxAMQbmVX2yyWEWC6uqfjJtEXBQupr7RP/vUfQDkbQpzr4hK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=P8gab8/L; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="P8gab8/L"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed6d6eso25032435ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789480152; cv=none;
        d=google.com; s=arc-20260327;
        b=nL6eY2OTn/mrkhCv1+/qKOhUYSeTfuwhaf5zoWYsQYy0E7EvBx09xFq/2ag9cMVZj2
         FKpGp7DPRCd74gCXMPAQEhNjTIZL7X6E4yw9F913zszbRweSPWcHrYkQePOFxcgPBhz7
         6jod70U/48JKbOB8lzcckY+UuVAyjLIV6cS+1U5oOgURfDjyQcdOXJVzisUvEcwgn17F
         +KwF641oLmrRRexls5Ey1oP9xwiecyVtQA9SQ1hYls43ESmwSMbjhAikkTQ53YKrAGus
         zA8/eiuPaKTaHD5tbVbM60CAGW3pyrCLVo9BFql2xkhyZxRDARWceIrgP3OMYkix6bVb
         CNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfjv+aIw8i3wro2/p0OoyFtuhvMOB8Aw+vPjdiNRKoA=;
        fh=4MDmrNyJOZ4S58I5/sjDoeoerd4T9kijYI98c80K+1M=;
        b=eOKtkfkrd800RqTihjlUWlZl+AMFOg2IMZy6d1Va98+orGfiUA3G358yFM2wqnd+9E
         7CPPXtREh5Ip+RamQFpJwbMEaKpyTAW1f2/Jy5i3O9Nng4CUbyffJcqToKZdOpBPOMr/
         ZBHrvFHyf2U3nEjqzqte0Ne6a9rXvHs9UAMfksQbS3AQ0vNt/evT5OsSoDctfB2OcsHw
         9cLUDm9GoGl1iU0H34f0xsJCtbAYftemLwH/pw/lbTAU/cRND9sm1GLRtaB2F9fIPGam
         4xkOt7E+RPYGpBDcgL0WC+CsUO4ry3fp6LlryEOeLX9yeWT8QAAjoKd53ECfY1BykDSN
         gF1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789480152; x=1790084952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfjv+aIw8i3wro2/p0OoyFtuhvMOB8Aw+vPjdiNRKoA=;
        b=P8gab8/LIxgoWv5WSYZ5XmiPc+9KnG9ftFS75Y8XgxPwNC1XkS/5FRAWlui0rnoBUc
         e63ZkwUri4zh2ENbShABXQWBgMWgO2fNwa0TMU1ZgqfveC//mhcE2DQCLcw69Aop0Imf
         jkqPwNvyLWUVxNWhyj6x9Urzx5we+ovLN4i5AyZQQnuNrS4u9Ol+DWjPpBnPMTlObK2M
         TQ2Rq6SgS2AvjfZlo1TMhca++nRCaYSlbWyjrQRA/LLcCbfZEW50VrfMp8AH2LBD1kZE
         sHUSAgEjVrVimXorAwYZjd5EWGrLZgg6M8y0Ji0OxPOPIh9KwoaOL5PR1AfKau+QyS/k
         sE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789480152; x=1790084952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfjv+aIw8i3wro2/p0OoyFtuhvMOB8Aw+vPjdiNRKoA=;
        b=hw8JAAh+ObxcRsWTHuefCTjzTSZvyTRkaCVuiQcbxZ6Oy+vlE+fES1WtdxENdL8Eej
         xd3e9nzkDiCwTZk1UGy6fyN4WO0VcI8RKKWJVyKk5EhxPDj5XdDrhfFufU5EtRNRgQHO
         BqTSnK8n019hy6/YsX8xM98yMmzwkg0a3z61CEKJxgKTVHCvS2CRIlO02hhXMD40YNfj
         9SEH4Oi5Nb6qdGSW3RNwk8L29Wt1GY92cAX3xZeWBoAPasvAh3z0t/LDsf1v8f1fiirj
         8FEw1lip/XoPPSzZ44D+mxnig+X317JlunQ3QDMa4yD57e2UrhPD9uts9dwhG7xEatsw
         pYqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPgble8D9159qSywPj158DkUJaevJgKv1rfL4o33FRomHS/ycZNJUKEldAYEcKaWrDthqWSQrewYiPo/A=@vger.kernel.org
X-Gm-Message-State: AFuF++luKxXGkanZGskkT8gMAZvEBjB+AIFIFcT7SPBQO/dl6c0Aiqqo
	Hx+Qi1k7D1ZRnVehsEKuYmekF/o4Rx3vMKfee8jm6VFi6GL/cQcycKefeATMDJ4sKcDQmwrzKtG
	hwQ3ekAHvprcDyR1ETuzVnWnLyXGS8IewDS/NSeRK
X-Gm-Gg: AYBFou1GBArTaw/z1PDabXdhYgXPa+Izl4CjDkSuBov3K/yAbMPkv/YFKRadFw3y/yH
	snck0p5ZTM89M3Me9ff7pWe8/Q6ca5FBnLdlo93zQEo72g4Im7v9hlE4hdY6zDL/4kIwGcZvdUV
	ZBk0e6qIURs0cmUmxFb26Czp0W9Uc1Ae84KGMXGWDl6ZlteIRoN7AsubYq0eGv/MuskDXoL+FwH
	vsmW38v7MaQpyAOcStqWmj11BYj5Cw7o+vD+V+mj9M7oZIdm1v609WZLFW0WkDuulvgtMZMqPTV
	J97D6O1+b1FzkAJrWg2tkV22jJyqUbITvYKbXYNL5bsxpG5I1vCQXc4xtJI63WFYFXByqmFGI3C
	tDqGx1YcJdhw=
X-Received: by 2002:a17:902:e544:b0:2db:63cb:1b17 with SMTP id
 d9443c01a7336-2dd6c7a7986mr146446375ad.18.1789480151741; Tue, 15 Sep 2026
 06:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHC9VhQHZ+ngFdzKqmnzBh341CGEg-jexu+QYU8=1qXK=u-x-Q@mail.gmail.com>
 <aqHUw6k0Mf83CGFT@zenbox> <CAHC9VhTM7emi9vxs+5Za8Hrc_e9dg7fZx+Z6BGUc4VQ1qhEAUA@mail.gmail.com>
 <DLD0VQ3D8CYC.3V5ZT8HDMY4IH@gmail.com> <aqTZdCz6JaoK16Fp@zenbox>
 <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com> <CAHC9VhS0JckwfomqLTUJkZZkDSgeRXYOjMmPQYErgYynQYqMKQ@mail.gmail.com>
 <CAADnVQJCJjy9Eiwn6-88c0iOk4LfgPU6KBv+w0JZdBzmXBMUCw@mail.gmail.com>
 <CAHC9VhTh446SkpPF-hUiLYOHipuurzkgju_nH9LsRGdERSAL1w@mail.gmail.com>
 <CAADnVQLZscKkCxvK5puuOE1aN8nW6PnaS+_dx_zBQjjP2T-DFg@mail.gmail.com> <20260915-laken-ferngeblieben-verflachen-bafe1f296b02@brauner>
In-Reply-To: <20260915-laken-ferngeblieben-verflachen-bafe1f296b02@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 15 Sep 2026 09:48:59 -0400
X-Gm-Features: AcwNN1X1VBqKl5wb2opR2SZklPVGLAG3iamTS5-uRRzujO-KJnfUrMjsThqzpGQ
Message-ID: <CAHC9VhTC5YvALs5K76qDBP9bDRpZPc_V-U8DPZ8qhNsCsXyLnQ@mail.gmail.com>
Subject: Re: LSM boundaries. Was: [PATCH bpf-next v3 04/15] lsm: Add the
 bpf_lsm_policy_release kfunc and policy object destructor
To: Christian Brauner <brauner@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Justin Suess <utilityemal77@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <matt@bobrowski.net>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Kees Cook <kees@kernel.org>, 
	Casey Schaufler <casey@schaufler-ca.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Jan Kara <jack@suse.cz>, Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Eduard <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	Tingmao Wang <m@maowtm.org>, bpf <bpf@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:00=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Sun, Sep 13, 2026 at 07:24:14PM -0700, Alexei Starovoitov wrote:
> > On Sun, Sep 13, 2026 at 5:10=E2=80=AFPM Paul Moore <paul@paul-moore.com=
> wrote:
> > >
> > > On Sun, Sep 13, 2026 at 7:25=E2=80=AFPM Alexei Starovoitov
> > > <alexei.starovoitov@gmail.com> wrote:
> > > > On Sun, Sep 13, 2026 at 12:41=E2=80=AFPM Paul Moore <paul@paul-moor=
e.com> wrote:
> > > > > On Sat, Sep 12, 2026 at 3:33=E2=80=AFPM Alexei Starovoitov
> > > > > <alexei.starovoitov@gmail.com> wrote:
> > > > > > On Fri Sep 11, 2026 at 10:26 PM PDT, Justin Suess wrote:
> > > > > > >
> > > > > > > If fs/, mm/, drivers/, net/, are permitted to have kfuncs, th=
en why not
> > > > > > > security/? kfuncs.rst doesn't seem to forbid this.
> > > > > >
> > > > > > because fs, mm, net see the value in bpf. bpf helps these subsy=
tems
> > > > > > to focus on their core technologies and moves policy decisions =
out of
> > > > > > kernel and into bpf.
> > > > > > while lsm people treat bpf as arch-enemy.
> > > > >
> > > > > It's amusing to read this when just this week we merged a patchse=
t
> > > > > into the LSM tree for the benefit of those writing BPF LSMs.  If =
you
> > > > > look at the discussion around patch 2/2 you will even see a reaso=
nable
> > > > > exchange between Matt Bobrowski, a BPF LSM maintainer, and me abo=
ut
> > > > > the patch.  Alexei is obviously welcome to his own opinion, but I
> > > > > would encourage those reading this thread to look beyond his comm=
ents.
> > > > >
> > > > > https://lore.kernel.org/linux-security-module/20260904-lsm-mount-=
idmaps-v3-0-920a1963675d@amutable.com/
> > > >
> > > > And that's an example of unacceptable land grab by LSM folks
> > > > that I'm concerned about.
> > >
> > > I made sure that patchset was ACK'd or Reviewed-by'd a VFS maintainer=
,
> > > a BPF LSM maintainer, and the Smack maintainer before merging (I
> > > covered the LSM and SELinux parts).  You might want to double check
> > > your definition of "land grab".
> >
> > You're still missing the point.
> > Christian could have landed it via vfs tree with your ack for security/=
*.
> > You have no power over lsm hook changes within vfs.
>
> Which tbf is generally how I like to handle thing especially since we
> usually have a lot of changes. But I'm open to shared branches as well.
>
> So I think we naturally have to modify existing LSM hooks. But it's
> shared pain. Since we use BPF LSM heavily in systemd we generally have
> to absorb such growing pains as well.

I have no problem with topic branches that various trees can pull, but
I do have an issue with the VFS tree merging patchsets that haven't
been properly ACK'd as well as the VFS tree creating topic branches
for patchsets that aren't primarily VFS changes.  See below:

https://lore.kernel.org/linux-security-module/CAHC9VhTE82bRRSXSUuMOdrfoMh=
=3DxOb5hDvqiKWzBKD1urab3hA@mail.gmail.com/

Christian, if you want us to move forward with topic branches in the
LSM tree for LSM changes that touch fs/ code I'm happy to do that, but
I need an acknowledgement from you that the behaviors mentioned above
will be cleaned up in the future.

--=20
paul-moore.com
