Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D042FCDB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022171; cv=pass; b=iv6S/rByEZJ+2/GU/fZ63MHIP2ZQIMIBq1oy9eEFH8f1ULWViINnHMLrg8SBWcVoa6SZY7B59unRnIKVyCXiYJTNDXPOCfZrt2u5LYAuSsBP1l/RelsA+52PcSYjYgwwHu5rkCx98GNeRR8bAM3qSgmikVT0FHCJ3NLBhKy9MEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022171; c=relaxed/simple;
	bh=5AoAm7kCydoLQsr+i6jrfa1JthOko596jNaE8bcwdh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/9jz6YVjsCdggChRCezG4hHihsKWJfem5hZy14ivhSmm7t8D/sRdqf/kmtjpZKmzHVWKfE9JWJKW56dwhgpSeDd0katxr5wAU/GLaXdNmOfxVppLzrWnZRxiSggy/fGGSzjJ35dlGfO6Rqnqdb3P7fa0qzIfQK95ea3UMMes9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZPUSklz; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZPUSklz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d8facae850so11155ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790022169; cv=none;
        d=google.com; s=arc-20260327;
        b=H4ep1rLjzO3iMlafRqv83YSWEJfBnyiK9TrWNCIc4L45Kx6ehowem/NBnD1fAon8R2
         bK2tTfV8VUqbqXIAKz0VNYWp1188qtHa1dAqY0Z9mA6J0eUha6uesx8/234M8iCjArQQ
         AFJ3TkeuO5E9vO/qcefB7Lvhde1AALd2UFtvmFAlv82g/KprQQz1udFumyysvBbbajcG
         k/gSUC0GGG7GsaovOrX3TOqR8d0EEVUqc/VL7B8H8UtAD98TOJ9n5IwTJaU/S7s31B/L
         mio87A/XoRdD04lM0RSPIIgauNDnHEpefn9AJrQeljqvauj8h15Dr+ttY292ceiQMRQ2
         2i2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZjuQxZbTYuwf9RVKp56gufP8tt1Juurh+o7CdzjxoY=;
        fh=sb+Vc0d+ttXLcjchzXqwD+6GjxjvijFq0SlXFfyRUN0=;
        b=X/jvv6EqziqRsLgj7tHKKuwX5uXbUgKoYm6nSXRzOGHYBImK16c2C8lbzafB4j/MNj
         Uy8gKSNEl+v0ws97mNjHcqGGKcIgFlgnR2AybJfkC1UE5n/ZKSwBYaXxyEgZR5Iw7SY2
         XfZW3Ir5Tiv626fm1vpfkQR2uzpaVdx1+3BH2diGaNX/SxhoC00uqKgyEGp0kmlchXFw
         Frix5tVtLBJ9fy+NTVymzZd5hPu5fzjzYHK29s8krWFv+rj9lge5JUlf/BVNOhMTuYoI
         jOD4WEGlPWUrMmKb0VZBUgfpwHUgsRA+4fdtIrhkOlERpp4t8gGKyNrZzrIWBS6A2kuX
         LvSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790022169; x=1790626969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZjuQxZbTYuwf9RVKp56gufP8tt1Juurh+o7CdzjxoY=;
        b=NZPUSklzX91cqloY9UWtg2FDsu0QfMamuJIYh37mCQ9uf8iUvDG0RLPZntzjk1dmtD
         j30Y3/Xf33ZxYFl6lIwIMluHu7nOiazNqy/dpeU9I8gUZtgdHC3CXbY6//v3bB87r+08
         grxj/3LDypylKj77WsDYjH5dtlSXr6AJWE24kb1caw3yYTfO0IQjz7vGOeCV1cSNR3E0
         JHrAj6AIC+7RYM+jMWLd0KQJ2JdAucmtx5xouyALxCr2ybiboglaHeksRYJhqo5wClAs
         UBu7Y6CRvu0ujbQHCqQIoHNsMpTGP6QF7M2O4Vjso6zCq4anfXZgyG2Wyn6sY/32aSCv
         m8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022169; x=1790626969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZjuQxZbTYuwf9RVKp56gufP8tt1Juurh+o7CdzjxoY=;
        b=moAjdKewnXd3NYN0N5LerwYUntR+nm1OrL//kSnKFUtb1n6283T95LslSauQT/OtcH
         mlycNWuSAGcGGeRm6FjVPAKBdPdE1prvZleiq59/9/3MfCos8Nz3+/0PF/FG+5k0wQ9r
         JKPiBJx6bMmNj0fehytOL5P1Al8RUqiVw5ra2Ygoe6gZQjGVxYbLuPBZiJjbC2V1NuU6
         raMjnqlFm4ZxcK/tZ51s9x7zS/E6UuBLqzzWCwBEziaa7HXAxj5cWlAz3KQAy5mBaOTL
         gxmYCKl3KnuG6kAKOaSBbL34s9sexNvM2jvF41Tsy2u33+gmp8hLkWZAh9wioqN3itlL
         /Msg==
X-Forwarded-Encrypted: i=1; AKwUvBx7NRH8mDo1Vi04B0XP5iM+VEPkf/k7h/6PfbUlXWsqqRoXZA9n0isA1MedDNcOx7E/Uo+OXgvBv39Kdys=@vger.kernel.org
X-Gm-Message-State: AFuF++lNDStiUmL9AZGSu56Q74gFt30ShjxGlWB2/NrTBxb72/I00Jlo
	OssXvUN6zbitJMXMJJcsujPd95zT45qvmUE2O/QOSQfmyZx+F/xw48bwIze0IPjazBAO/dzeEE1
	eZl2pXDFjD36Xl1b8Y9swdLpau4Zt5vT5d+KHqQ/d
X-Gm-Gg: AYBFou0jKrNg8eWmgxB2sDUFsq/6QJg2X3EVBCb8bp7p1VVeUYkZqe8JBKd3TJk6+j1
	c2uC3XcOg+YTEeE3SvMhRBMYX0BnE3CIurYNF6NSi4UgwK7WId6bipgHDnlnpl6S4/qtIkDBA96
	R+SYnb0RZrISZM7VceSUDrtpxJdJKdNjDdlIfKGeXOVYXaIqdGMlrCdpuys+8MCmM216tJvrfR7
	oJ1AFz2lYcmz9nG9HjG5OOJS3AesWjCXfBQXJU4/IKx6tkJihqXMBua4N4QWcF/5WBqkfC6tQbk
	/qKnHmMtRxrMV0Hjb/6K0dFgGkpWR4RLeNbjFr7ttc3/uVw+B11laseOdkAVds+y4uWa/dEPAxU
	61Olt3KFKxh1rsoFE7U9IxPH5mg1q5M6znkEXqIM+
X-Received: by 2002:a17:902:d98b:b0:2dd:280b:cdfc with SMTP id
 d9443c01a7336-2df5b83676fmr449455ad.17.1790022168357; Mon, 21 Sep 2026
 13:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-pidfd-get-paths-v2-0-c59ea6a21b72@black-desk.cn>
 <20260831-tauwetter-werkbank-dramen-b37eb4025283@brauner> <CAC1kPDMK_D4nhyRmBHg6KC7SmmCkH73Xtc5DhXeJbSvf3LcqcQ@mail.gmail.com>
In-Reply-To: <CAC1kPDMK_D4nhyRmBHg6KC7SmmCkH73Xtc5DhXeJbSvf3LcqcQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 21 Sep 2026 22:22:11 +0200
X-Gm-Features: AcwNN1UtR6M4RsRB1V4M9ZXr6hSPfcvgRf-Sf3BDBnWgXtSIC5rk0Yng7pQuhSw
Message-ID: <CAG48ez1T5-tUHVK_iHsgUtWa-inVdrZxA3E-ZCW0iENJvasKfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pidfd: add task path ioctls
To: Chen Linxuan <me@black-desk.cn>, Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Kees Cook <kees@kernel.org>, John Johansen <john.johansen@canonical.com>, 
	Georgia Garcia <georgia.garcia@canonical.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:47=E2=80=AFAM Chen Linxuan <me@black-desk.cn> wrot=
e:
> On Mon, Aug 31, 2026 at 4:49=E2=80=AFPM Christian Brauner <brauner@kernel=
.org> wrote:
> > On 2026-08-31 10:59 +0800, Chen Linxuan wrote:
> > > Obtaining a target task's executable, working directory, or root
> > > currently requires walking procfs symlinks such as /proc/<pid>/exe,
> > > /proc/<pid>/cwd, and /proc/<pid>/root.  That makes the operation depe=
nd
> > > on procfs being mounted and visible to the caller, even when it alrea=
dy
> > > holds a pidfd for the target.
> > >
> > > This series adds PIDFD_GET_EXE, PIDFD_GET_CWD, and PIDFD_GET_ROOT. Ea=
ch
> > > ioctl takes no argument and returns a close-on-exec O_PATH file
> > > descriptor referencing the corresponding task path.  The new ioctls u=
se
> > > the same ptrace permission check and nonzero-argument rejection as th=
e
> > > existing pidfd namespace ioctls.
> > >
> > > The target task is sampled while holding its exec_update_lock. This
> > > keeps the access decision and the task-state read in the same exec
> > > critical section, preventing a concurrent execve() from changing the
> > > credentials or target state between the check and the use.
> > >
> > > The first patch factors out helpers for acquiring referenced task pat=
hs
> > > and reuses them in procfs and AppArmor.  The second patch introduces
> > > scoped cleanup for privileged pidfd task access and separates namespa=
ce
> > > lookup from namespace fd creation.  The final patch uses these pieces=
 to
> > > implement the three new ioctls.
> > >
> > > Signed-off-by: Chen Linxuan <me@black-desk.cn>
> > > ---
> >
> > I really have difficulties forming an opinion on this. So this sounds
> > very useful but it has implications.
> >
> > Right now, pidfd ioctls are available even in situations where the task
> > in question would not be accessible via procfs, e.g., when procfs is
> > mounted with "hidepid" options or similar. So this would expand the
>
> One point regarding hidepid: for callers that can pass
> PTRACE_MODE_READ_FSCREDS, hidepid does not provide an additional
> restriction. With hidepid=3D1 or hidepid=3D2, has_pid_permissions() falls
> back to ptrace_may_access(..., PTRACE_MODE_READ_FSCREDS), and
> hidepid=3Dptraceable uses that check directly. In addition, the
> /proc/<pid>/{exe,cwd,root} links independently perform the same
> PTRACE_MODE_READ_FSCREDS check in call_proc_get_link(), regardless of
> the hidepid mode.
>
> So for these specific path lookups, hidepid does not block a caller who
> would already pass the check used by the proposed pidfd ioctls.

Agreed, I think with regards to hidepid there should be no issue here.

If I try to come up with scenarios in which this could introduce
additional danger, the main one I can think of would be: A task T1 is
running inside a pid namespace and has a unix domain socket connection
to a task T2 outside the namespace, with both running as the same
EUID; T1 sets SO_PASSPIDFD on its socket to obtain a pidfd pointing to
T2 on the next message sent by T2, then T1 uses that to get access to
the mount namespace of T2.

Christian, is there some mechanism that already protects against using
something like SO_PASSPIDFD to get a pidfd to a process in a parent
namespace?
Otherwise, should we add something like a "pid_vnr(pid) !=3D 0" check
either in these new operations or in SO_PASSPIDFD?
