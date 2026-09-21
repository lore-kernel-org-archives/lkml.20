Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90C306B3B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.146
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958688; cv=pass; b=J3LpqEfFm9ZSf6X2TbGYZBFHH5kCYEv7iMbke4Uwd4qAzqixWLvV5o/SbggW7rRMeWSYgJ0wfutz1f7GLl1s9KR33ZKvdFyxUazOQEOccke4VUox/xVpU1E6el3K5tULLtvAt939GfqpW3CDk/WiGYN1gMz8JaRz4s9MPWD0nes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958688; c=relaxed/simple;
	bh=bvJeiEbXoWPFF06hCLDrPbaWPob0szAckAtK0XuiYME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSgOUAalw9X/CsaCo+XNnKu4lwYSPI7fEnHhvjbym9NkWvINzWtsYrxUyAWRNjIykVBEkZGh8f5ysTZLhxG4kYcJ9CYAw066KWzD35BIbZMZY3D6ktynxcm+UmcXtbBnQ0weeAQfxUGlXKTB/RUHh9zRZRA7JYMvYNYYXdgYuVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Cii1ic2f; arc=pass smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Cii1ic2f"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so15203665ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789958687; cv=none;
        d=google.com; s=arc-20260327;
        b=sQhXWAryClwd9WHCbp+upixr/B7NuhYDFAMqtB6aLhdSuz1OgdLDwDqJ0+1qwrnaj7
         bOOMY7AJw5qy/pVIeou/x+fSXAEgW1ZnFyD6BZRuoWrC0Uv6VICpnHlBihq5YbGChg5P
         uoDZV89I7a2sViL0Q52Kexv4NTqoNtqsPcLCpkordfENQCkkAFz9ltgU5PW94w88CDmU
         n17eQRtNwAjB6ehwaQb6Mn6S1aCkqo1v3kpI8GXzqaNyQCLj+T7pNooMj96oKVas/QKp
         VOnZr0BnPqOOi+z4gEMDTT30hdCJmRVTeS2imEJ9T83KqamyIDFD29i2gpUKE2TbeR58
         G5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Tev7/sptcmKn54rHbAqw+siNwCkqV/Wt6jvN5QgiB0=;
        fh=evMwSRjcxXVwVDX4SiExXrqbyiMTc3GaJWgivpRrl+Y=;
        b=XdnXisusARp09Qg29SdMSbzd6yKFDPAEL20wqUaajB2o0d83XjAY52tOhTJptGo1ap
         XxHDYUZ4UmHqfDerBOaXEO6hHqB+qhwQwcdeR76GFzisM3/0dqu+Doi7CQPbSP7L3iWj
         cLyIrx8XEykqMCp164Gf/mtvftxz6WWFBONfjChacD6o1eTL3cjQTbYq1quamaFhIfw6
         jPxW+sAJG7x2JXCJSG6mt9InSz0vLEns5AhYwfBX5a1e5e9pdSayYSPngEjky8KCJ+q6
         IqTfPK7GuicUOFh7GmzKa9Lbpqe6kn0uiITRivqMvdvIyLFKxMZpO7JYgA0JU9S04igy
         Av6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789958687; x=1790563487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tev7/sptcmKn54rHbAqw+siNwCkqV/Wt6jvN5QgiB0=;
        b=Cii1ic2f1/HniWBWYRJdEoBwduoNrwQ+QHomh5y50PUaeLteRWCKSNui98aYanv3JS
         Ry69fHwBNblqQzn3iSXB5NVCXBOW/TZGO+c/Pzi89tDYLOzy6+0/n+9edPm+HKINo9Zt
         OmEXoKLY7RBRUH1QYaFFeh5GxiQDy81jHNZOq/AGAz0oW5gOl5pE2an7zVMsVq6KW1Er
         w5gDeOFOURUvfjJaB0hXWdql/MtcQoyxajD/0JQJMLAMI0ucUF516q+ClKagjSkRQ7SC
         40p+WvFXxDMgPQtZtcvK0qt79cXRKB+lOzHXfV6yCnLv2knRT7wHCUEBaJmxXLr1MjTN
         bzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958687; x=1790563487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tev7/sptcmKn54rHbAqw+siNwCkqV/Wt6jvN5QgiB0=;
        b=hLBLlLVDLNIL8A1b76p0XxQv6ONg8U7yC8cazbqlcXkj/z6lz7lRmfZctByONubRJS
         bXBAl1fDEJ/5TDqQztdBTqJ7K/CNnWpKeQu1ugeuNa4cAOAADQp/FKg09mhkcLipCCEG
         OFU+FevburP91ppBhEjEOH05h7C6D1pyaplvtU1q/zfbwLzWEbVMsdxUJ3q4pDV9druW
         XmR6rGX/u39kmmq7O0CxMnHAPHEcL0to7mm5Go/TjwnRZeYqY4caoB0nSKMju/MLj3FB
         DEXYcoo3nBhQTOblCgiwSXgGLSTKU9HHiv5duHEo4d2NcBfqNFYdnstSfgLf4rLDm+QT
         Q8Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzKzknJbueJ/YVmCfY3D5qQ51u1M0MHP2FRaGqp3EnrqP5xlEO3vy7Fbr9CIrV9su0BZt95aHWveBbm40s=@vger.kernel.org
X-Gm-Message-State: AFuF++n8PjSjClIPI6A0QBMYzTLdzVR/B/zfVlfZdVqN0Wm14z+QSQ11
	cUhDeyRbjuru3oy56CMmg505liR8wfI32kk+UdidiFPQ2CPNZrffF4ySRjTl/w5ClqQjDbutdPE
	0PY/gJtvxIW5qa9fqWEyELknDxmdfcnJyRf4YtwyJ
X-Gm-Gg: AYBFou2zSLKqoWuGuYH2xDOnRYnllsDpt12l9OVx05oNGUX6HBAawu886BvkgQyUAGv
	Z3+NYpV0aS1GUUyGQuoazrqdqpDlU4R+jvw5Htu2AlqZRu9SEI47vGRKTWAf2YVAuACwE56NkjJ
	dBV9NDwfhXz9ycnCg6saXX8uxSpRkamGgRUZ2Y6lDy1tBtHpOsaFhcQWPfumCwMLk2tOb4YUY/R
	QqdwWq3tysaDeIfHhb4sKehPY5RM6YjlT9ZgMkTPHZa3fLfVw8dO0K+6cw4tXmNM4DON4dGy1u/
	8AoU/hie9yfqeurdXRGIJ6coDY1UKOLtJ32sm0D0Dg4z0bmnQ3rKgrJk4QZwXslXs38uCdkKNAQ
	kXOuARSQCLNACYFBtab8=
X-Received: by 2002:a17:902:ce0c:b0:2dd:ad73:c989 with SMTP id
 d9443c01a7336-2ddb1bc360emr136942245ad.33.1789958686614; Sun, 20 Sep 2026
 19:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHC9VhTM7emi9vxs+5Za8Hrc_e9dg7fZx+Z6BGUc4VQ1qhEAUA@mail.gmail.com>
 <DLD0VQ3D8CYC.3V5ZT8HDMY4IH@gmail.com> <aqTZdCz6JaoK16Fp@zenbox>
 <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com> <CAHC9VhS0JckwfomqLTUJkZZkDSgeRXYOjMmPQYErgYynQYqMKQ@mail.gmail.com>
 <CAADnVQJCJjy9Eiwn6-88c0iOk4LfgPU6KBv+w0JZdBzmXBMUCw@mail.gmail.com>
 <CAHC9VhTh446SkpPF-hUiLYOHipuurzkgju_nH9LsRGdERSAL1w@mail.gmail.com>
 <CAADnVQLZscKkCxvK5puuOE1aN8nW6PnaS+_dx_zBQjjP2T-DFg@mail.gmail.com>
 <20260915-laken-ferngeblieben-verflachen-bafe1f296b02@brauner>
 <CAHC9VhTC5YvALs5K76qDBP9bDRpZPc_V-U8DPZ8qhNsCsXyLnQ@mail.gmail.com> <20260916-vollrausch-tango-bagger-420300d403c7@brauner>
In-Reply-To: <20260916-vollrausch-tango-bagger-420300d403c7@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 20 Sep 2026 22:44:34 -0400
X-Gm-Features: AcwNN1XwWf1qiBIc7wIqlPXy7pUKTJ8jTM7dbiiGU__XYQo3ndI3fN_ernAyi1A
Message-ID: <CAHC9VhR9dBMptt2tQLjvkTjXsJd+uDGxOAoEGR6iMQkPWMFsAw@mail.gmail.com>
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

On Wed, Sep 16, 2026 at 4:48=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Tue, Sep 15, 2026 at 09:48:59AM -0400, Paul Moore wrote:
> > On Tue, Sep 15, 2026 at 9:00=E2=80=AFAM Christian Brauner <brauner@kern=
el.org> wrote:
> > > On Sun, Sep 13, 2026 at 07:24:14PM -0700, Alexei Starovoitov wrote:
> > > > On Sun, Sep 13, 2026 at 5:10=E2=80=AFPM Paul Moore <paul@paul-moore=
.com> wrote:
> > > > >
> > > > > On Sun, Sep 13, 2026 at 7:25=E2=80=AFPM Alexei Starovoitov
> > > > > <alexei.starovoitov@gmail.com> wrote:
> > > > > > On Sun, Sep 13, 2026 at 12:41=E2=80=AFPM Paul Moore <paul@paul-=
moore.com> wrote:
> > > > > > > On Sat, Sep 12, 2026 at 3:33=E2=80=AFPM Alexei Starovoitov
> > > > > > > <alexei.starovoitov@gmail.com> wrote:
> > > > > > > > On Fri Sep 11, 2026 at 10:26 PM PDT, Justin Suess wrote:
> > > > > > > > >
> > > > > > > > > If fs/, mm/, drivers/, net/, are permitted to have kfuncs=
, then why not
> > > > > > > > > security/? kfuncs.rst doesn't seem to forbid this.
> > > > > > > >
> > > > > > > > because fs, mm, net see the value in bpf. bpf helps these s=
ubsytems
> > > > > > > > to focus on their core technologies and moves policy decisi=
ons out of
> > > > > > > > kernel and into bpf.
> > > > > > > > while lsm people treat bpf as arch-enemy.
> > > > > > >
> > > > > > > It's amusing to read this when just this week we merged a pat=
chset
> > > > > > > into the LSM tree for the benefit of those writing BPF LSMs. =
 If you
> > > > > > > look at the discussion around patch 2/2 you will even see a r=
easonable
> > > > > > > exchange between Matt Bobrowski, a BPF LSM maintainer, and me=
 about
> > > > > > > the patch.  Alexei is obviously welcome to his own opinion, b=
ut I
> > > > > > > would encourage those reading this thread to look beyond his =
comments.
> > > > > > >
> > > > > > > https://lore.kernel.org/linux-security-module/20260904-lsm-mo=
unt-idmaps-v3-0-920a1963675d@amutable.com/
> > > > > >
> > > > > > And that's an example of unacceptable land grab by LSM folks
> > > > > > that I'm concerned about.
> > > > >
> > > > > I made sure that patchset was ACK'd or Reviewed-by'd a VFS mainta=
iner,
> > > > > a BPF LSM maintainer, and the Smack maintainer before merging (I
> > > > > covered the LSM and SELinux parts).  You might want to double che=
ck
> > > > > your definition of "land grab".
> > > >
> > > > You're still missing the point.
> > > > Christian could have landed it via vfs tree with your ack for secur=
ity/*.
> > > > You have no power over lsm hook changes within vfs.
> > >
> > > Which tbf is generally how I like to handle thing especially since we
> > > usually have a lot of changes. But I'm open to shared branches as wel=
l.
> > >
> > > So I think we naturally have to modify existing LSM hooks. But it's
> > > shared pain. Since we use BPF LSM heavily in systemd we generally hav=
e
> > > to absorb such growing pains as well.
> >
> > I have no problem with topic branches that various trees can pull, but
> > I do have an issue with the VFS tree merging patchsets that haven't
> > been properly ACK'd as well as the VFS tree creating topic branches
> > for patchsets that aren't primarily VFS changes.  See below:
> >
> > https://lore.kernel.org/linux-security-module/CAHC9VhTE82bRRSXSUuMOdrfo=
Mh=3DxOb5hDvqiKWzBKD1urab3hA@mail.gmail.com/
> >
> > Christian, if you want us to move forward with topic branches in the
> > LSM tree for LSM changes that touch fs/ code I'm happy to do that, but
> > I need an acknowledgement from you that the behaviors mentioned above
> > will be cleaned up in the future.
>
> This is another instance where one of your mails around how to organize
> process ends up reading like you're lecturing your peers. This is not
> just my impression btw. That impression is shared by other subsystem
> maintainers - including in your own.

If my comments came across as a lecture, you are likely hearing the
frustration of having to revisit a topic where my past requests for
some mutual understanding on process have been ignored or silently
discarded.  If you have been offended by the tone of my comments,
please understand that I have been offended by your actions.

> If another subsystems hooks into the vfs layer or filesystems that the
> vfs trees maintain then the default will always be that the vfs layer
> provides the shared tree to pull.

Regardless of how we got here, I think we can agree that we both want
to sort this out and find a way to work better moving forward, yes?

My request is the same as it ever was: please don't merge code for one
of the subsystems I am responsible for maintaining without an explicit
ACK or reviewed-by tag on the patch{set} you are merging.  As for who
merges what, and where, considering past history, I think it's
probably going to be difficult to find a single generic rule that will
make both of us happy.  Perhaps we can simply agree to have a
discussion about where the patches are merged when we are
ACK'ing/Review'ing them?  In other words, there would be no default
merging tree/branch, the default would be for us to discuss how best
to get the changes in Linus' tree on a per-patchset basis.

I'm sure you have your own thoughts, but I figured it would be helpful
to get something out here as a start.

--=20
paul-moore.com
