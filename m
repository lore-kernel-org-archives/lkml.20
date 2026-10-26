Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793056946;
	b=NTneqSBnehpO+ks6L5ZamovBz52uDc02uzRuJHqewJ0BOn7NDVkRueBO1XpllRuM5aAA
	 y6zjnllxqTPShE37S5biI78OpLul1O/URZERjFEaOYjqE/0FESTrY0iye67cRtuSEOMTT
	 stHEpq6OJlD1dxATLrt3xjM+GezS8RwMANd/SYLbUVmDw1wMuNZh7sqhbVuMscc1+bj/7
	 enD92BNl0uI7AvjXjH5nAbdRkqtP1njdVRk/jMqkka3+ggiP8cDBurG0xVl2OfFE7BMq0
	 8tDg1tti8O5NNT7VkQOFxzFYv0i+IPxWLfvIRwjtCTzX8qbKBIDkAE1sJk1pQ2kRZPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sClihItsgegsMKKiMW0EDJ5IHIVhrTOtuDwhYJOOpz4=;
	b=VQY5zYo8ISWjNzp7N0bLAyg8dhvkLFuDGqN3e68lnEjPyFBK1OUymOmjxC1wg0OHdSFi
	 hGc/63SX8/o5O+xKidl8tBwEzHhZ0zSIfes0zFhr4xw16wqQP4HoJB0dzdzSDjIk/EEkE
	 N+vL5f18nWJlHvLmlN1mbdLiyJUWh8ef24uUwNker75uMSj8tWNl3h2NWc49KKu1A4+UH
	 ojT2xRfeGhcojWziw86FqfLZ4ZlTGIA752GbgTlPktnptnNOJ0ksYrjJeQORFFzEJ9n5q
	 6HmMTBNJMcK3FSrY3BjmP8rVN+s5sKUrwmMFNwxagiMUr5t0e0oR22YcswNQYdZumyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YU3BVGEa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92341606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92341606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YU3BVGEa
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab395abf79so31697587b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793056944; cv=none;
        d=google.com; s=arc-20260327;
        b=fNrZLg2Ds1dW0eoseeYEXSMt8fly1BKWsjpaS7DHBskOtMA+w2Tba7OI35lQj2gdG1
         cROdXdBcJiK9jdSgZuqLfwuVLrhyFOT8HFFlwB/od/B0tPxoiWtSuNw3mA8pgLcaVRhX
         vmYNTtJF07wfW7HEP5ZkjF33VIpD9l0VzeRqwWVxwjoznEa0M9++dnRZ0dH3QEqRlQFb
         izYc1i6bkoyC8/TAliUo78+ghhkJsPZ+ojjTLAxB03RuThvh0ycVngL8YoGU2H+ZgfKh
         /n3CAhhD0HtpwPE6ZdJmyihQtWJREVAJEbd4FtwhdXa9JspStf/DhnuuUai8xMqbr/b1
         jOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sClihItsgegsMKKiMW0EDJ5IHIVhrTOtuDwhYJOOpz4=;
        fh=OX3NqpxIr+FXpkjWDLfe6ihOMrRK9mWtFTUgUMur/lI=;
        b=YlVLD/6/4Eoasy0c2oicjurUTwLLVYHpM2b9VsDm4Ln9o0XyoBa0Lc/hSj0MyursIm
         ks73WjOkHaLRsnyDfCOEvlLips7LRhkiAvrf/0rtjt5f3dl4Jgl/Im715mqL6Ax2uWsL
         s1t3sef0QWpMQkYALWBUcdVcJrhEe105XEqQ92MmTlQN2thcG3TmUaOdrEkbwnMRmTsf
         EWYr7BlS0jYHs3a47f1H1w+MgBpw2jQxVADsqiHxtUpWaapMvHOv6CON5ymjszfEFIbM
         T9lmuE92V965yHFkdZwrgj/zx3VCIGTGJv2GscPITxIAW6eQMmQI5kCcwY7JBvI+T00x
         T1BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793056944; x=1793661744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sClihItsgegsMKKiMW0EDJ5IHIVhrTOtuDwhYJOOpz4=;
        b=YU3BVGEakRaTambkc/JM8t4cuit9Upk3+nblP/lP7+tAGp3dcWrpda1cMwFVt8IEA4
         e7B4oHgLn0OqBpLXHRdl2weOqnHve7/zLwUGVt3FXh2ZnrF+ZFsIoSIqjLlRHqPuCU5I
         lJOs2OSOmIuBnOcL5LUZU1A2La+FG9ouG0G2gFMZOiFsaBp/G+76exYZZLN9m2UAlyqv
         sv9SpBa1AkoFtCIAO4scVWXdenza78wrure7SToD/nfXJxb21q7W9z8yukF1ADxbQjZq
         6hmpBAGSMlCjq6t8KuWe7agDZJML75mZ3l0j4NO+DTbdoLQdyVo7csnKmqxmX+yMEf4N
         aXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793056944; x=1793661744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sClihItsgegsMKKiMW0EDJ5IHIVhrTOtuDwhYJOOpz4=;
        b=DezJnmJUXQNDJ0Sl0wlgzNdva131RK65mJYeO6hYt0h0splTwk0vu48bcImoa9F1pp
         l91nxrbOs3ZlH0C1VhS14KAS6EEsOU4yw6kgOPq6O+et22WFX+TtdDXMhydu97xDqKNL
         Uoa7vALM9wknSy+VzDl2dgmP7QToU9tCal8psFzcOuVtVxSevSe2yKd4yxgIkruxwbag
         znGXAS1fTay6EEWcC0UK2DrpeNdv1Fb7aujjQzm1NuzRgxK8uqyLk34HkLomt0TIzq0J
         P+nLokg4q4ixnSztA9fFoos4XVvp+KT8/ItvaDW/RfeHGuz0mjMCeUup0de0XLT0PZbz
         DL0A==
X-Forwarded-Encrypted: i=1; AKwUvByanjpAxlINYOd/3aD3Awzrpv7torCsxqJOzJbMyWJReYbPGC7siRhMzW7JIMBMGBfqhPL0FhC48vOKfRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm9Z0UfBva/sXSGxHSfa+oM9kw22TkcdxTVG1gPfnMnppk4rus
	eDM5FQu1UEre0d3OLE3JrTzqAWTnLAVqU1K6mJshcVg5SyBeFDLyaG416yf8o8LjIM8lNSNuGBG
	dMqbS6EmttoyT1haxe1NTjymN/7th/4A=
X-Gm-Gg: AYBFou0h7pgDZCW3SBtmeEkf6PDwunalOoDuD6lr6QYhnbLUAdC+Z/Lo2XKgMteb7gv
	jBVN5HSunxCR66kO+XEApmK3Vok6sIBW4oc2EhDxoaiPPex1qp1Zp5sze5ynxRfibf774MLdB4c
	+Usk5HogObxJSrhNNziBy8jzpA9h3ETOQ49XFXjRtnfQy9YgqVfaYHjwOPAVUfmFxqCLXc7Js+2
	m84BjfFi1iQJuVeMh6Z+dTGII+qBsxXNaoa3WvEm6vdZN9orEUzBuw/exdyTL2RUc+w+ijj2UUb
	Iki0N5gTlDlJrM0MR8JkDcXqM0r0ELx0NxPRvti8icgwdrOUIBj8TwGXQcDo7zOIuhP2w0M5TMO
	tt//gEwElndcRafQivPK7XmyZKbNw9DjFL0RvvuS/ptYeUh1MvR/Ja/Ivgc1HAFy+uvNTV/Eo
X-Received: by 2002:a05:690c:6603:b0:8a9:8021:5cd1 with SMTP id
 00721157ae682-8b1669e6465mr70712677b3.6.1793056944432; Mon, 26 Oct 2026
 16:22:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6ac99eb9.6b935c14.1905ce.7c50SMTPIN_ADDED_MISSING@mx.google.com>
 <CAMw=ZnTTUxO2ZCobEDTQUY7OZxmyJUQxg4DkhC9gTWXaDaK1dQ@mail.gmail.com>
 <20261013110237.GA836401@chenghao-pc> <CAMw=ZnTksVT1wuQwAjzz_2tYSCvLSxeUBa3mYQvCFuKUtcydaA@mail.gmail.com>
 <20261021103633.GA1324331@chenghao-pc>
In-Reply-To: <20261021103633.GA1324331@chenghao-pc>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Mon, 26 Oct 2026 23:22:13 +0000
X-Gm-Features: AclHuK-hwbYwy5ob9GAZTuHyNgSeoVljDHkkHHLA6n-8vBOmCS8V_bd2quxR25o
Message-ID: <CAMw=ZnRpDdqKDPbofeF=1U70Q0Ms0aniwA6OPF-paNZEb+k5bQ@mail.gmail.com>
Subject: Re: Question about obtaining LUO session FD for non-systemd-managed service
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: jianghaoran@kylinos.cn, avagin@gmail.com, linux-mm@kvack.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	systemd-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 at 11:36, Chenghao Duan <duanchenghao@kylinos.cn> wrote=
:
>
> On Mon, Oct 19, 2026 at 01:13:28PM +0100, Luca Boccassi wrote:
> > On Tue, 13 Oct 2026 at 12:02, Chenghao Duan <duanchenghao@kylinos.cn> w=
rote:
> > >
> > > On Sat, Oct 10, 2026 at 03:05:40PM +0200, Luca Boccassi wrote:
> > > > On Sat, 10 Oct 2026 at 04:11, Chenghao Duan <duanchenghao@kylinos.c=
n> wrote:
> > > > >
> > > > > Hi Luca,
> > > > >
> > > > > I watched your excellent presentation from the LPC conference in =
Prague.
> > > > >
> > > > > I have a question I=E2=80=99d like to consult with you.
> > > > >
> > > > > I am currently working on the `memfd_luo` feature in CRIU. My goa=
l is to
> > > > > leverage the LUO capability to store checkpoint images inside mem=
fds.
> > > > > After a kexec reboot, the image data will be retrieved directly f=
rom
> > > > > memory instead of from disk.
> > > > >
> > > > > Here is my pull request on the CRIU GitHub repository:
> > > > > https://github.com/checkpoint-restore/criu/pull/3152
> > > > >
> > > > > In the PR discussion, avagin suggested using systemd as the CRIU =
daemon
> > > > > to centrally manage LUO sessions and access to `/dev/liveupdate`.=
 I have
> > > > > watched your talk and read parts of the systemd source code.
> > > > >
> > > > > From my understanding, systemd currently provides a unit=E2=80=91=
based solution
> > > > > where child processes can inherit LUO session file descriptors. H=
owever,
> > > > > this approach requires the target service to run as a child of a =
systemd
> > > > > unit. As far as I know, CRIU does not run as a systemd=E2=80=91ma=
naged service.
> > > > >
> > > > > So my question is: for services such as CRIU that are **not syste=
md=E2=80=91managed
> > > > > child services**, how can they obtain LUO=E2=80=91session=E2=80=
=91related file descriptors
> > > > > managed by systemd?
> > > > >
> > > > > Thank you very much for reading this email. My knowledge of syste=
md is still
> > > > > limited, so please feel free to correct me if I have misunderstoo=
d anything.
> > > > >
> > > > > Thanks & best regards,
> > > > > Chenghao Duan <duanchenghao@kylinos.cn>
> > > >
> > > > Hi,
> > > >
> > > > At some point up in the stack, everything runs as a systemd unit, s=
o
> > > > it's only a question of figuring out in your setup how to pass the
> > > > FD(s) up and down the stack.
> > >
> > > Hi Luca,
> > >
> > > Thanks for your reply.
> > >
> > > The `LUOSession=3D` configuration only takes effect for services mana=
ged
> > > by the system manager. If I run the CRIU command from an SSH login sh=
ell
> > > as I am doing now, the environment belongs to a transient unit under =
the
> > > user manager. In this case, we cannot use `LUOSession=3D` to obtain t=
he
> > > LUO session fd via systemd. Does this mean the process needs to open
> > > `/dev/liveupdate` by itself to create the session fd?
> > >
> > > Below is the attached service of the process found via `systemctl sta=
tus`.
> > >
> > > [root@localhost criu]# ps -ef |grep criu
> > > root       57589    7729  0 18:25 pts/2    00:00:00 ./criu/criu dump =
-D ../test -t 52922 -j --memfd-images -v4
> > > root       57784    7571  0 18:27 pts/0    00:00:00 grep --color=3Dau=
to criu
> > > [root@localhost criu]# systemctl status 57589
> > > =E2=97=8F session-5.scope - Session 5 of User root
> > >      Loaded: loaded (/run/systemd/transient/session-5.scope; transien=
t)
> > >   Transient: yes
> > >      Active: active (running) since Tue 2026-10-13 10:03:55 CST; 8h a=
go
> > >       Tasks: 4
> > >      Memory: 148.9M (peak: 1.3G)
> > >         CPU: 47.000s
> > >      CGroup: /user.slice/user-0.slice/session-5.scope
> > >              =E2=94=9C=E2=94=80 7712 "sshd: root [priv]"
> > >              =E2=94=9C=E2=94=80 7724 "sshd: root@pts/2"
> > >              =E2=94=9C=E2=94=80 7729 -bash
> > >              =E2=94=94=E2=94=8057589 ./criu/criu dump -D ../test -t 5=
2922 -j --memfd-images -v4
> > >
> > > I'm not sure whether my understanding is correct. Could you please
> > > provide your feedback?
> >
> > That's a user unit, and as per the documentation LUOSession=3D is only
> > supported for system units. So yes you have to provide your program
> > with privileged access to the character device and create the session
> > yourself, and then stash it in the FD Store as normal.
> Hi Luca,
>
> Thanks for your clarification.
> I now have a rough idea for the implementation: CRIU will leverage the
> FD Store facility to deposit the memfd into systemd=E2=80=99s file descri=
ptor
> store. As FD Store is tied to a service unit, a criu.service is
> required. The unit file I intend to use is shown below:
>
> [Service]
> Type=3Doneshot
> RemainAfterExit=3Dyes
> FileDescriptorStoreMax=3D10
> FileDescriptorStorePreserve=3Dyes
> ExecStart=3Dcriu command
>
> Does this setup conform to the original design intent of systemd FD
> Store and LUO? Please feel free to point out any mistakes.

That looks about right. If it's a user unit, also remember to enable
fd store preservation on the user session via a drop-in, ie the
user@.service system unit
