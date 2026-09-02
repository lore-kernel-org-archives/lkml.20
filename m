Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9A3ACF02
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332046; cv=none; b=XbjHR43jVuho/nMdj1QUwYQRm/D4Ic9YzVJRATB3loo0Bt8bPl+LUXha2/iQUYPh4Vl/cKZLYSMciCijaxG0fo3l0HhQkjHD3S+QgjTnejqVvBZfHaRkazTERNE72Jmp7gT6dwugJB+l7/1brDv3eZhNICIYBjGL+YIYmzR5KxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332046; c=relaxed/simple;
	bh=ixlWqFuSFl+kXQc/tcrrAFQiec5rJ4PZr781QjNJjcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dxi1nF8yqPopqRczlb7L3qA7ii3bmpHsPMdwI7UOKExEpyLamao0e2CsT4uLHeNMkCZSvfExlZV0A/RQmyeRQgnXdFTaGd8JNmahPVvAMDCKbgZQssOcI3RKyshN5CdAYovNRYit/nnx4WkWYRsPj+J26pKir++kq2gJMjLjdWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4ab40d839so518669e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332033; x=1788936833;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtlpH4A/FsfIicKK/MMLWRSJhN08nYCVAAoP5yOKMSg=;
        b=GRBa5H32mSwg4iVVnVd+u8uoLpxOdBms1ln1ysRW19M7kuKDsKAOBnu0wNsvd3rZqR
         DmIyBAB9DQ8ZeXsCONGVAfqqVxDC3hHrjx3ArLJUXIGN8Vmn+hKBGeGv6xRWUJpdVZ4b
         BNGPT1Mb5JYZe/2hchOfimtC2tiFCV0cLfoQFqW8wwu2LbxTOYyxyMfe7cTrovNMTdSh
         ApsHPrZ6y52ds6l22M+kDIuE+NWTU+tUmKmSv5NUIMh8WylJXQbvOLZozKsH/5dZKYUl
         8mC+ToRXmkoNwH3gCM6urxKk0RVFMM9fW3uTaRBOhcTC7Dgf8kt9OsRMAC+ifHLKy8gG
         jQBA==
X-Forwarded-Encrypted: i=1; AKwUvBxyi3EKmZF752sfHTd13KCup25wMSlMdAbLogGTVDEV68tsx+h5f614+FsNJIHV8TMjo4EigWWd2Ou0nBs=@vger.kernel.org
X-Gm-Message-State: AFuF++kEBx0hCAPKorODihlVZtzloriHh8arCqJaekVKrkE6WVkCZQU+
	yiKEMvB1NBSK4W7tiRU2dTlBMrcJ7k+95noMQ/4BmieKRnci8hUPoQb2FMi60gPnrHvQ9Q==
X-Gm-Gg: AYBFou3AJK18xYyj03MQ8xY0fwDaoSThEXtnHbFn+EeCfF+6kxgstwpZlp0wkBVHwax
	AakK4sAgH36cuXvdbnGp5Ct2wmCEOlEi1i/VKsIRMonwcrcCCrBujSLhnyK0qv21vloj6bpHqHC
	s0Blh5q5yjSIS4mcqsztQSELIEksBQIzGZRnNVKchN4xTC4KP95/7fJESncYebzq/hXLbTQmnAg
	q1+6VTDGWy/IkIPsYcOtxBCfvgtE7UOhaj8otmSshWbezSREotLpFDG1cbvL0WUqEt33SGi9nTg
	R4T/ajk94reWU3Kk84tlZP33O0Igs51dICYsSeZFNcnGz/yYuVWByBFxUUAFYozGfbr8h2rgKJa
	LdcLimyShWAkp1IU9oXTQyVqn64fOZXtrDEFWo6Snm4PURhIXG545Qskfwu3vvQwsDjNLuDfyIk
	fGiFapIEV1GbqRmnHS5qDm9XBR0wKO2PhZxsteQ1L3sRnyVheeRgM8MkVMu0VBizUIH0+7f4Jp9
	As92xXYygnUDy2bI7khzmdcNhCfRBPWnUJAV5DNZxaxoYoi5ARz
X-Received: by 2002:a05:6512:3d20:b0:5b5:e53e:5710 with SMTP id 2adb3069b0e04-5b60831e808mr737319e87.2.1788332032633;
        Tue, 01 Sep 2026 23:53:52 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b1cd21sm368514e87.29.2026.09.01.23.53.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:53:52 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5e18f0439so587780e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:53:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxW2d3l2pHrOSuOT2uGRfUIVCQzFRiupORi3SywI2NyCybwKAII9QX3pVO9eEoPiDDOdDVlN0B4zF/m7vU=@vger.kernel.org
X-Received: by 2002:a05:6512:32c9:b0:5b5:e8af:a5f6 with SMTP id
 2adb3069b0e04-5b60831e880mr829854e87.3.1788331663502; Tue, 01 Sep 2026
 23:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-pidfd-get-paths-v2-0-c59ea6a21b72@black-desk.cn> <20260831-tauwetter-werkbank-dramen-b37eb4025283@brauner>
In-Reply-To: <20260831-tauwetter-werkbank-dramen-b37eb4025283@brauner>
From: Chen Linxuan <me@black-desk.cn>
Date: Wed, 2 Sep 2026 14:47:31 +0800
X-Gmail-Original-Message-ID: <CAC1kPDMK_D4nhyRmBHg6KC7SmmCkH73Xtc5DhXeJbSvf3LcqcQ@mail.gmail.com>
X-Gm-Features: AcwNN1WESqzlj5-w8dgp1OujQBVwB04y72AI-TKWGXGM1Ob33MtgcQyu2-BCfjY
Message-ID: <CAC1kPDMK_D4nhyRmBHg6KC7SmmCkH73Xtc5DhXeJbSvf3LcqcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pidfd: add task path ioctls
To: Christian Brauner <brauner@kernel.org>
Cc: Chen Linxuan <me@black-desk.cn>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
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
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:49=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On 2026-08-31 10:59 +0800, Chen Linxuan wrote:
> > Obtaining a target task's executable, working directory, or root
> > currently requires walking procfs symlinks such as /proc/<pid>/exe,
> > /proc/<pid>/cwd, and /proc/<pid>/root.  That makes the operation depend
> > on procfs being mounted and visible to the caller, even when it already
> > holds a pidfd for the target.
> >
> > This series adds PIDFD_GET_EXE, PIDFD_GET_CWD, and PIDFD_GET_ROOT. Each
> > ioctl takes no argument and returns a close-on-exec O_PATH file
> > descriptor referencing the corresponding task path.  The new ioctls use
> > the same ptrace permission check and nonzero-argument rejection as the
> > existing pidfd namespace ioctls.
> >
> > The target task is sampled while holding its exec_update_lock. This
> > keeps the access decision and the task-state read in the same exec
> > critical section, preventing a concurrent execve() from changing the
> > credentials or target state between the check and the use.
> >
> > The first patch factors out helpers for acquiring referenced task paths
> > and reuses them in procfs and AppArmor.  The second patch introduces
> > scoped cleanup for privileged pidfd task access and separates namespace
> > lookup from namespace fd creation.  The final patch uses these pieces t=
o
> > implement the three new ioctls.
> >
> > Signed-off-by: Chen Linxuan <me@black-desk.cn>
> > ---
>
> I really have difficulties forming an opinion on this. So this sounds
> very useful but it has implications.
>
> Right now, pidfd ioctls are available even in situations where the task
> in question would not be accessible via procfs, e.g., when procfs is
> mounted with "hidepid" options or similar. So this would expand the

One point regarding hidepid: for callers that can pass
PTRACE_MODE_READ_FSCREDS, hidepid does not provide an additional
restriction. With hidepid=3D1 or hidepid=3D2, has_pid_permissions() falls
back to ptrace_may_access(..., PTRACE_MODE_READ_FSCREDS), and
hidepid=3Dptraceable uses that check directly. In addition, the
/proc/<pid>/{exe,cwd,root} links independently perform the same
PTRACE_MODE_READ_FSCREDS check in call_proc_get_link(), regardless of
the hidepid mode.

So for these specific path lookups, hidepid does not block a caller who
would already pass the check used by the proposed pidfd ioctls.

> surface of operations you could potentially do.
>
> But again, I do think it is actually useful. Adding Jann.
>
>
