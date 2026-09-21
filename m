Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289DE360EE2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004832; cv=none; b=VyrEDXZkx+CG6K7RVwBKyOxoXr5ObsA6kAzrktYF13ichFP4+lEVtCsHEh2HLebWOn8uXGkdf95V5XImNflKWuthoaQeczodgI06ct2xavDkvFP9WrqSGt9Izndu8RDezAu0agG0jBAtfZgWwP3so0msk6L41FxsT9Z+qJmBSUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004832; c=relaxed/simple;
	bh=I7UesNNzihhfUM3T9kkjRfplteVqAEnYJpPI/ePgiEY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oa6plmwkmtPB6gN+eRTWwwcYOzHNbtL9W3vGG65TzBRsD8gTLycWpYrPa274Os1MRqJkyXy8Z80c4It9db2mGQfAHMdnh/XOvzD9x8/9fat+bYwwQnYYUvwGEv+ShcBf3nk18hQr/y+f/iBn1knQJ15dDoctQy6J02YUo0qyHc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz0t2q82; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz0t2q82"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so2473064f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004829; x=1790609629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATQztYCMyMu3k6DnS/zHcGXiDiuEanDgsZ8XIDNR40k=;
        b=Dz0t2q82wSX3pw4NUPNIMWFDFyaMLzrpHR3XlMeTROMDG6hkfv3lKtMy+t8UX4DCYZ
         Yre0uZY0ohhZB/m8uZy+7NKSld+RQl4WeeH3lKWxRJDlI0jTU9kTZYktWnVPoRcdO0tM
         O02PStEdyvZA/1ewe3YZi37vUbtncXVXn3bg/EPbqaWhOYHpbpwP8SIbHTRblKzE9q7l
         nGBRSfYcad+DgIL8MobJBaUsECApzuOnQ/nsRfROKkFu03Gms5lDbF3Tihr3PUiStNA7
         M0LzqB6uep7UWHhTP43YO6bWVcjxoa7FsoT+/mFMmL/xcKoHjtxanaXNqCzWNQDUnag3
         +Amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004829; x=1790609629;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATQztYCMyMu3k6DnS/zHcGXiDiuEanDgsZ8XIDNR40k=;
        b=q+cVLtTty8Ea/h4zMpJcedfMh3WB6wE+XOsUjTDxufK/YvcjRzXclO/EeqfeAm1ujy
         EmYhqgFpmsh9Yh5YplBR6rqQzlklG4n2wL3yax9fiD/N2jqKarIBEji0+DTVj7aeAr/l
         6V7clQ+Wl7TasfW2JY8q+0Ku9kVvVzEi+4UuQC/CDj95Bh5YhUF8I/VuQ6LHLdYIWLAS
         aNNPtw5mtDLZdoC55ScI8GVBCExhtu8Z+juXwzG/mnsDV9GlCSQ9AllHrDufCTNhMqHk
         PJEuRPwDoJIM7KLfZlPxPb+d5dnb3EAIFZTEtzRWB14Mp1LZj99+eFqlPClcknmNoOD0
         Ko9A==
X-Forwarded-Encrypted: i=1; AKwUvByWzItnQvZ6AaY5lESLFj33Pr/cuGUQWcNgu+bs9tz922vD557AErXCWb7JYC9J0DNjrIOQV9Xe5BvSC+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lkRjmUoW5JTkFBtFPaozmwc0rGfwv4X4yBjAOk7oyk1SkVQQI0
	SdPdLEui3ox5CWfUfSOpc6FQH198k3+aFOt/LiRgowH6awLp5k0+el1j
X-Gm-Gg: AYBFou2baB0bJFMqWmbJJ7lbI5WTucjpYGnLIxLOgM/AKtZblSWj36J6AY4ALWoI4WN
	7iNmdmvwQwRbQbjIpHDf2Up8rZ2as94sf5JSqeNy5X5fO0AWKYUni9RG1Oq+2A4XEOIrC6YnW4s
	Imp4hNS/i0MgsT9/TsaE17NENywxwOU9MGtugxhIwv2K698bnWes60UsK6bDvq10HFv71ykmjCr
	XWc0wAVcP2c8/MrbpmHSSYgjq2yHSbn+CHn2gnXnC4v4injzBcYYN/jiGwVUHW/BYt5mNxTkKHk
	6GKKDYEerJTcQDLqcTVqgQaDDIrPynzz54HuTKFXWvw1PU0yrx2X8eaUpPPtLOJdd6L5ETfPUD3
	f4TMnt5lpUCkpvGMyqDhU/ERt3NXlVCgGOV7xK8A3qa1P5Zat2BL4H2uisRooAGROIW0Dj3eO11
	QOifLZwvMyNGJrMEQWVC0bKLYMYMcSnvnKyOw7EfL0dOgcpsCRFuFZX/4TwUFZCJzMZU0I7BsZa
	DkueNMOZANb/nyTr+nINWdUYc071tb5Q/Tj
X-Received: by 2002:a05:6000:38f:b0:487:c48:5dae with SMTP id ffacd0b85a97d-4871e21d900mr14510363f8f.17.1790004829281;
        Mon, 21 Sep 2026 08:33:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm24137495f8f.12.2026.09.21.08.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:33:48 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:33:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mahanta Jambigi <mjambigi@linux.ibm.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-s390@vger.kernel.org, "D. Wythe"
 <alibuda@linux.alibaba.com>, Dust Li <dust.li@linux.alibaba.com>, Sidraya
 Jayagond <sidraya@linux.ibm.com>, Tony Lu <tonylu@linux.alibaba.com>, Wen
 Gu <guwen@linux.alibaba.com>, Alexandra Winter <wintera@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Hidayath Khan <hidayath@linux.ibm.com>
Subject: Re: [RFC] module: init-failure path can free a module with live
 try_module_get() users
Message-ID: <20260921163347.2630a6f4@pumpkin>
In-Reply-To: <2cd4adea-9b70-4951-be8b-40c1bcc7ecd6@linux.ibm.com>
References: <5dc1fe2b-289e-4786-b9e9-e181dda8d4e9@linux.ibm.com>
	<20260918142241.55a6630a@pumpkin>
	<2cd4adea-9b70-4951-be8b-40c1bcc7ecd6@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Sep 2026 20:04:10 +0530
Mahanta Jambigi <mjambigi@linux.ibm.com> wrote:

> On 18/09/26 6:52 pm, David Laight wrote:
> > On Mon, 24 Aug 2026 11:43:46 +0530
> > Mahanta Jambigi <mjambigi@linux.ibm.com> wrote:
> >  =20
> >> Hi Luis, Petr, Daniel, Sami, Aaron,
> >>
> >> I'm writing to ask about what looks like a generic module-init failure
> >> lifetime problem in the module loader. I ran into it while working on
> >> the SMC networking module (net/smc/), but after several patch
> >> iterations, it seems the root issue may belong in kernel/module/main.c
> >> rather than in SMC itself. I'd appreciate your guidance on whether this
> >> reading is correct, and if so, what fix direction would be preferred.
> >>
> >> THE ISSUE IN do_init_module()
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >>
> >> include/linux/module.h has a long-standing FIXME in module_is_live():
> >>
> >>     /* FIXME: It'd be nice to isolate modules during init, too, so they
> >>        aren't used before they (may) fail. But presently too much code
> >>        (IDE & SCSI) require entry into the module during init. */
> >>     static inline bool module_is_live(struct module *mod)
> >>     {
> >>         return mod->state !=3D MODULE_STATE_GOING;
> >>     }
> >>
> >> Because MODULE_STATE_COMING is not MODULE_STATE_GOING, try_module_get()
> >> can succeed once a module's __init is executing. If __init makes the
> >> module externally reachable partway through and then later fails, the
> >> failure path in do_init_module() appears to do: =20
> >=20
> > It is rather worse that that.
> > If sock_create() auto-loads a module (eg sctp) then nothing stops a sec=
ond
> > sock_create() entering the protocol code before the initialisation comp=
letes.
> > That can be hit by two separate applications, I hit it from an out of t=
ree
> > kernel module and avoided the problem by putting a mutex() around the
> > sock_create() call.
> >=20
> > It might help by letting try_module_get(THIS_MODULE) always succeed
> > while blocking other requests until initialisation completes.
> > The code making the call must own a reference (otherwise the code could
> > just disappear), and that reference stops the module being unloaded.
> > That would let the initialisation code grab extra references (eg for
> > a worker thread) without allowing other codes paths enter the
> > part-initialised driver. =20
>=20
> Thanks David =E2=80=94 you're right that the race is broader. This patch
> addresses only the UAF on the __init failure path: once we set
> MODULE_STATE_GOING and call synchronize_rcu(), new callers see GOING and
> fail; we then drain existing refs before free_module().
>=20
> The concurrent-init race you describe =E2=80=94 two callers entering
> MODULE_STATE_COMING simultaneously during a successful init =E2=80=94 is =
not
> addressed here and would require changes to try_module_get() itself, as
> you suggest. That is the long-standing FIXME in module_is_live() and is
> a separate, larger change.

I suspect it is also much more common.
Module load doesn't normally fail, but if you can persuade the system to
unload an unused module I'd expect a non-root user can hit the concurrent
init race.

David
