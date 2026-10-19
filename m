Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E424E5334
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412022; cv=pass; b=CICiTAXcc9BcFV41gDZiG1TYmC3/MMFLSsrA994yUen2XKScOwtW2xXdlUN2gdfM61nC3Pg+0cYUoGO95Qu9pFm70N7BG561zFCkKX7zIykmOmY+wuhMPHyhML+vx2/BMxoroR/GF0mncf+24dOJ79lXB12Agyuva/fTzDlNwBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412022; c=relaxed/simple;
	bh=CkSC6nkZ/6LRtvujh0vv7q/sTZx95CkT4AFxKDzhMbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fV4PMeL3bAcgu60NycEe0QmvVLOW76hqhCLH6jZ4pfTrxdVuzpMbHA/MHmZBQhan1VfHBKYxeW6vS4Y2urZFKmzMej8yOlVunlNAOAZzlDXpQ1wbDhF8WGIwd22SR9kHmZWohBVhQzD6X/iWIIMdFtgORlS2b0GMx2DchdI3FOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rKCn1TJD; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rKCn1TJD"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0d5ddafbcso15304067b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412020; cv=none;
        d=google.com; s=arc-20260327;
        b=qxwSvP+7yG4iUbAs0E92Ug7oeoHsIkq0bC/VZGnhADgMctgIJe2yu5zn1+F4UiuqJH
         HPi8EmjbLXiXHMY+C7Q7SN1ybSIou4TJJ2pBj+7xCDNfird6S+JDiX1rqpFLH4yqNASc
         xCWV7uuVX2y7Cp8VaJQBN7fJb9gcqJWsi2qHjn//ETXgyzhhieXCLLxnj7g0819ykfd2
         +oepvYq4nMeYHFTdBPbJ6t1Fl8Ar0whYXFRNviShLpjH4vTdZ8OxQJnyTtUP+YMWsHhh
         IHvjoCEoyKyAS1LuKp0gzBjTGOVKjIUwZopYezl64UKfw331i0YXG43+dt4E16pB8XMY
         Z1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IaMHOaCF9qKahgBmNzjExLM3+cMiS8xPZoJLsbFvUPM=;
        fh=Nb2gZNEUK0Zt1KQavr2b9sQq5zAybFTdfrn8CO6v4pA=;
        b=iC5VfE7Lsc/g9WU+hEeeoIY6nR+Wz7NTAcPUEvuLYy6yHQRKZO2BbOT+VIWtiPfMI+
         0jOHX9r7Q5NPL+FkK8/yKuOhXrDWQMCQrKgRwrTOfnth+Qet8IeBz91n+DPk8/ZqQty0
         fSSXBKYIj9GUscVXqdyQMp9kMo0SfIQI37dMbWeyvoAkT1F3F87+wpwXjfeD10W81Gpm
         trw+37hwQKDYx6P+QBxlv/jYaHTEkEoIWZ7U/o6bOsyQalk6C3Dy3OzcXFJ7TJtTI5Vy
         BSYK36X5xfNn7IH3GEKbm1emm9YN5WHHTPSt0FC2ALR33faY7mf+w0fdbLdJ1oQdCYdC
         MYbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792412020; x=1793016820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaMHOaCF9qKahgBmNzjExLM3+cMiS8xPZoJLsbFvUPM=;
        b=rKCn1TJDnPAzCCdzSvsCRQuHosV0uvaC1A4vcgCQxOiaJZOzR7HzUMj6dxqDJul4gE
         n+RgZCTd/QZYP7wsSGSTkxyQfmLUF5MOppokJrRS/DGneEAREjTwvZfjsa52x5CJK/Of
         CYmL09qN2fFnxJKSbkyH0jQxFF1/6qeIUhMGQFN2EhNF8RDvksRJckPMuVaRTsNH9khn
         +KApkDHAk1hKk4151H21FqM+uSEQ7pCYbor7O2FabkA56s4KBWvycF++tCzeb0va5ejA
         XZVMYtHLKcFH9+mfljkaswwwiUYL5GyPJR4NDEF5xt/DX5gwVbF1Ge7MG6n1k9D9QzTL
         NoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412020; x=1793016820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaMHOaCF9qKahgBmNzjExLM3+cMiS8xPZoJLsbFvUPM=;
        b=ABMPQzE4EvPluQvGZ5yMJYgkeYNThu2Eyxlgel63vvV9l0FAaoetuVHhVepS68Re96
         J4+fUhl+XrTVb2nJSsbCC/BxPNoOsVgA9y58IMjj7UUrUSs1JQA4NradBFtfY3k4mzmo
         3T4+SIuuL3Seuol7MjgrHLXLvlt9lVqEE5dI8hZz98kUPTUeuYqWNLZ4GzE/49aTgfxs
         ho+L3Yk+V/4aoPb26zL/AfwpfZLwOTwhtQBo8tlmmwusmrwovYEdzeE73BdFJjpfH9zI
         2rzNU4bTO/IFCdZYgKwr7ZZ1J775/QZ6GKS1AUnMBp7YL9+DlhDQ7m4NzaGa81ZPfOgh
         yiwA==
X-Forwarded-Encrypted: i=1; AKwUvBwAdxON65qEC3mxs7mmPv/Xvzn2+Dp3GNSimlpTGsX8kxivBCZxUEsl4xPbWu1RhaVZiJ7J3rgD54NWdfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7jOsIPdGwsjr1XfnuVaxXr7+N326XTLNJVZZyPXFFnQD0g1M7
	TOux2qiulXU/0Y7f8U5JGUyfFKztggDpBlF11aScT8maAFI7qjAXBcSmrzWRnvTo4Mbh2OW4VOb
	z04iSPrdUdIcwaCi24Fgecbw+A8d0ZctTv79CUyc=
X-Gm-Gg: AYBFou1F9vtL2n/Z+XfHAuormghw+uwhjxkbUGOORxIVb3CY5+Cg9zGuMRQFPQViSsG
	I70rTE/O1gj46kiXa7kWvtLYTj6eyYMw9i7pUqqwaZMzFQaCNfeTPnFyyf5eQGzxLSHQBFjuBkH
	LBMlXfu88uLIciFJOyPO4olsfKeAWLDB0xQ0zodo1AfdimmsMwwrL8N/HQebhQlKfiworeXx50O
	H2L9yHlk+0nDFRZKnMOPreJYViZ2QzK4KizVerrwvYM7IG/qiALTXWskaZ04cey4AtTFIY5rwWj
	6Opg7WMmDwuArSluNIREhqKyERvPuHT6Wg6TCxut3D7PlVu5YsdQB3XpxLOTY/ab2TQEk0lXCG0
	jzJHix/zegFUp+A==
X-Received: by 2002:a05:690c:4802:b0:8b0:a857:654f with SMTP id
 00721157ae682-8b0f222e1f1mr24697237b3.63.1792412019904; Mon, 19 Oct 2026
 05:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6ac99eb9.6b935c14.1905ce.7c50SMTPIN_ADDED_MISSING@mx.google.com>
 <CAMw=ZnTTUxO2ZCobEDTQUY7OZxmyJUQxg4DkhC9gTWXaDaK1dQ@mail.gmail.com> <20261013110237.GA836401@chenghao-pc>
In-Reply-To: <20261013110237.GA836401@chenghao-pc>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Mon, 19 Oct 2026 13:13:28 +0100
X-Gm-Features: AclHuK_bmEUQOsQIU6VRKds3I_yd9xZsuOO4tGVmB2Rnh13ICGRCJP9TMe8I_xk
Message-ID: <CAMw=ZnTksVT1wuQwAjzz_2tYSCvLSxeUBa3mYQvCFuKUtcydaA@mail.gmail.com>
Subject: Re: Question about obtaining LUO session FD for non-systemd-managed service
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: jianghaoran@kylinos.cn, avagin@gmail.com, linux-mm@kvack.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	systemd-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 at 12:02, Chenghao Duan <duanchenghao@kylinos.cn> wrote=
:
>
> On Sat, Oct 10, 2026 at 03:05:40PM +0200, Luca Boccassi wrote:
> > On Sat, 10 Oct 2026 at 04:11, Chenghao Duan <duanchenghao@kylinos.cn> w=
rote:
> > >
> > > Hi Luca,
> > >
> > > I watched your excellent presentation from the LPC conference in Prag=
ue.
> > >
> > > I have a question I=E2=80=99d like to consult with you.
> > >
> > > I am currently working on the `memfd_luo` feature in CRIU. My goal is=
 to
> > > leverage the LUO capability to store checkpoint images inside memfds.
> > > After a kexec reboot, the image data will be retrieved directly from
> > > memory instead of from disk.
> > >
> > > Here is my pull request on the CRIU GitHub repository:
> > > https://github.com/checkpoint-restore/criu/pull/3152
> > >
> > > In the PR discussion, avagin suggested using systemd as the CRIU daem=
on
> > > to centrally manage LUO sessions and access to `/dev/liveupdate`. I h=
ave
> > > watched your talk and read parts of the systemd source code.
> > >
> > > From my understanding, systemd currently provides a unit=E2=80=91base=
d solution
> > > where child processes can inherit LUO session file descriptors. Howev=
er,
> > > this approach requires the target service to run as a child of a syst=
emd
> > > unit. As far as I know, CRIU does not run as a systemd=E2=80=91manage=
d service.
> > >
> > > So my question is: for services such as CRIU that are **not systemd=
=E2=80=91managed
> > > child services**, how can they obtain LUO=E2=80=91session=E2=80=91rel=
ated file descriptors
> > > managed by systemd?
> > >
> > > Thank you very much for reading this email. My knowledge of systemd i=
s still
> > > limited, so please feel free to correct me if I have misunderstood an=
ything.
> > >
> > > Thanks & best regards,
> > > Chenghao Duan <duanchenghao@kylinos.cn>
> >
> > Hi,
> >
> > At some point up in the stack, everything runs as a systemd unit, so
> > it's only a question of figuring out in your setup how to pass the
> > FD(s) up and down the stack.
>
> Hi Luca,
>
> Thanks for your reply.
>
> The `LUOSession=3D` configuration only takes effect for services managed
> by the system manager. If I run the CRIU command from an SSH login shell
> as I am doing now, the environment belongs to a transient unit under the
> user manager. In this case, we cannot use `LUOSession=3D` to obtain the
> LUO session fd via systemd. Does this mean the process needs to open
> `/dev/liveupdate` by itself to create the session fd?
>
> Below is the attached service of the process found via `systemctl status`=
.
>
> [root@localhost criu]# ps -ef |grep criu
> root       57589    7729  0 18:25 pts/2    00:00:00 ./criu/criu dump -D .=
./test -t 52922 -j --memfd-images -v4
> root       57784    7571  0 18:27 pts/0    00:00:00 grep --color=3Dauto c=
riu
> [root@localhost criu]# systemctl status 57589
> =E2=97=8F session-5.scope - Session 5 of User root
>      Loaded: loaded (/run/systemd/transient/session-5.scope; transient)
>   Transient: yes
>      Active: active (running) since Tue 2026-10-13 10:03:55 CST; 8h ago
>       Tasks: 4
>      Memory: 148.9M (peak: 1.3G)
>         CPU: 47.000s
>      CGroup: /user.slice/user-0.slice/session-5.scope
>              =E2=94=9C=E2=94=80 7712 "sshd: root [priv]"
>              =E2=94=9C=E2=94=80 7724 "sshd: root@pts/2"
>              =E2=94=9C=E2=94=80 7729 -bash
>              =E2=94=94=E2=94=8057589 ./criu/criu dump -D ../test -t 52922=
 -j --memfd-images -v4
>
> I'm not sure whether my understanding is correct. Could you please
> provide your feedback?

That's a user unit, and as per the documentation LUOSession=3D is only
supported for system units. So yes you have to provide your program
with privileged access to the character device and create the session
yourself, and then stash it in the FD Store as normal.
