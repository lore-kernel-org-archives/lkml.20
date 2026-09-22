Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6395616C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092521; cv=pass; b=SrEti0EgOHdsWpuZ7x6OCviS+oEQp42KSveEbA48LUXF5TexPHZ1BKuYXCdRnHnRQjLR2oLG7QmyK5zOylSQ4hdS+kWfNpAZEUYU1i1DOBoYX835W/mSJ0OawoogjKl8KG/faQmJl/pAGEKMJep6BsPTMijiTqLiQT8+yXLK9L4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092521; c=relaxed/simple;
	bh=opZivKpqxky+OBoIil6sQOCGi1HNiA6ALJhYrvblBOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UP0gJGqPRF4nTgoRGPKG4C5YJ2u5j6JdM3ttjoVXhV0f02CORzDupp+iZ7b2Hi/p77oyFwF8GscfvIg/n3K4rvjZt541M/sES49CBBAMPEAmqhqAiJ2lwSxGbMIFvyx7GJiq10iv9PK2QCya7Ly5mEL6F9aU4PGLqRjdgdyx5YE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=StlhYVTS; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="StlhYVTS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d3b445a84fso112355ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790092519; cv=none;
        d=google.com; s=arc-20260327;
        b=M45Fdcfr754I+LmJvz9IkavLyiCLfGB1FsaTfvKnYcuFtxQ562pXiUwcnqgrvgN4Gw
         /LRWTPELfBYNxFvcvLs78VkPWXCgwpQ5fc5VQjxQDznP22ABYrjsMNPDeRzlooGGqHmg
         a7wcvZxEtGKLOYOVkeO2c/zN/yh/9eGZgaLFDjomiK0nrLFV0PpgouTifNgCVeqGg7Kt
         VrXb/Iy/009sAuME6rjt5bCpkFHDJtBKIpVg8D9yIsKdqYmWDafcBIg0QGBULgdEvYZe
         C2tILQxMb1mSgQyYo54jTSl63f49yh/YjXvx1MxsNTLOfMT6LjoaB1W++Vr7RgHIy4oR
         BBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3CnAMf3rYfISbFoQbxUQPDoCBSAVsRITBKeQGlh3KBk=;
        fh=Pt1n98oUtyrBLx1KnXT+XZLsiCrGfTXSjlYo4GNItw0=;
        b=UVJsZ7l+69iYmYQVH7HbUfvvayV1XjQtZzFK/rtldjdzW+oVYCbjePE1sC2Fc74lB9
         WSLkQEJetF0VO1rZN4jvoXrAfrs/+HMxZoV/cSSUz08hk0DvCpXTHnwRptjD+yvcfPMo
         vqG5spfQadecy0Y/Tt0MEmQt09RJj1Pi6srORU1H7RDAz/BJNM1OGcmbP7t816Bn7hmG
         i5VotvpgXX6Bsz7pLB3qBZaNrvrLiVKpgmAgci2A87LTpwXUR/BfFopFzWvG+4s1x+gD
         Aq+bwf9kQCPoBZvcMK4dYLATIX0wu/RPX7ezPpWCB7bdBEhEqhMpzdYRatjv3m61eP85
         avaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790092519; x=1790697319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3CnAMf3rYfISbFoQbxUQPDoCBSAVsRITBKeQGlh3KBk=;
        b=StlhYVTSJXoufwzvC3o4b9hX4HvKUirvkZAYXzfc/R7vpVlKBT1+ORKtzv/tvuCACV
         o67fmMslcM2uqN3f+pX15yf1dF2UxA2x0kQMcqq9kw5zFf+cGycVbRC7hQ/P0GglnBUK
         Tf3mt7n6W86h7ax53GfBP5qiDSDNxUJUjKm4gAY1AwTjBUXxEMnsoVVvGLa94dER49S8
         qF+pbJpErk/IEM4wIarJq2gs+yyToIzmtTg0utzxjxzMUwonhVdbdrG0OcFX6DImKNj9
         iGhUZ2WYOQ/piDq8q92zjL2LOo1LgAV8bKRJnX3Qc79W0VPpnctLM8pCc1D2HhNWS66D
         hT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092519; x=1790697319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CnAMf3rYfISbFoQbxUQPDoCBSAVsRITBKeQGlh3KBk=;
        b=sgMi03u1XO3YBCC8dZ9gMz/OXrAg623iD8utKZu2YC8InbhZM/pFQYVA7NN/QZq7xX
         yhHxLFpz0txWusiUgAnwphzomYzT0f4ZR9tTpHJ91lNL4UgkjzTRTy3fCIUiL0U/umAh
         j+8MuxEVWA4JcMV2nWGzDyVRcQTvWG+rf1rn69e9o+UhftjNyKbHo9qCBj5wtii5nSMM
         hw+8kzqchSNLSZXtN+8JKChRPN9I0CJ7oW2t+qtz8Lk+cwPhIsqUrNqDx/Irh3ms9FRQ
         nMcLNGkC9mZ9okpNFDKYor8YYOjR06bofauj07pSua8Csgp1IpEjGuLRcfx+Zb7GtTjb
         oKVA==
X-Forwarded-Encrypted: i=1; AKwUvBwk+OkCShkBix2RBqfmmATR72ojGdUUMR33WMZeAsY7uqEIbRHDOK0gVaSFH6PBXjMTeia4sy+cdJDWDeA=@vger.kernel.org
X-Gm-Message-State: AFuF++kFeYJ4A+3Ou/iDjACF/g4D72LjBBeP1sCzeH/ozs3Z8rym0+ty
	r5xJ5s9OiNHKP1THfq45UWoEdhZV3AlKi98XssSaRKXMfkcNU5pp5nZ760bDnsUwuTxBveYceW3
	ZJKDEory9VYk5n7PnhYyKvSrQr7MkXm/DAiyTB2Gd
X-Gm-Gg: AYBFou3ChirV1C3e1TfuRiY0IkJObppsAakRxUjrCN9IkE64Lc6otGyluQnwUT5PMIO
	HYxopcphWNA9IU9g6UgPlcGl4ncU2MnuOcPyjO+Ovw9kPpkruHmlVC3pNZLbg2qoqr9D60KZW5u
	R79Dm489mAeiXiiChUdKpHgMR3CxwHg/5as4CFsy9sG6imXDXG/iKjFsAgPHrhRc7uow1GQmZn+
	Jck1Wo4D2c76YOxJ5NXT7tf2KLclHgihzpgtkrmmOMOy6BmNieNchvFmthAJM07v8vqACB2SKOJ
	C9Pfj4XEmCGvLZ4WvG0JAJBu4Jl0kh7dj57LdF50JVt3qBM2GAugSVe7WuwjR4h2tBKCxfDMtMB
	VsPUS483DohHY5riMBcPPzSLMHT2ayW2PNm04O+HZ8A==
X-Received: by 2002:a17:902:fda3:b0:2dd:b837:48b8 with SMTP id
 d9443c01a7336-2df6649017bmr1392335ad.14.1790092518734; Tue, 22 Sep 2026
 08:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-pidfd-get-paths-v2-0-c59ea6a21b72@black-desk.cn>
 <20260831-tauwetter-werkbank-dramen-b37eb4025283@brauner> <CAC1kPDMK_D4nhyRmBHg6KC7SmmCkH73Xtc5DhXeJbSvf3LcqcQ@mail.gmail.com>
 <CAG48ez1T5-tUHVK_iHsgUtWa-inVdrZxA3E-ZCW0iENJvasKfg@mail.gmail.com> <CAC1kPDNamG4BpfsX0mn9E-Y+ujGTLe-oU63kJFOjxW6bDmSLnQ@mail.gmail.com>
In-Reply-To: <CAC1kPDNamG4BpfsX0mn9E-Y+ujGTLe-oU63kJFOjxW6bDmSLnQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 22 Sep 2026 17:54:41 +0200
X-Gm-Features: AcwNN1Uevf7qvaoQ92TUBe1sUrMlhIbUuw3ph8s-vQAhL_GIcCXy5aT7MdRHJGg
Message-ID: <CAG48ez0+kYEdLm305xY7HsXgfXxeqFGYQB3N4UY7ppoyQ4t=9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pidfd: add task path ioctls
To: Chen Linxuan <me@black-desk.cn>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
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

On Tue, Sep 22, 2026 at 8:08=E2=80=AFAM Chen Linxuan <me@black-desk.cn> wro=
te:
> On Tue, Sep 22, 2026 at 4:22=E2=80=AFAM Jann Horn <jannh@google.com> wrot=
e:
> > On Wed, Sep 2, 2026 at 8:47=E2=80=AFAM Chen Linxuan <me@black-desk.cn> =
wrote:
> > > On Mon, Aug 31, 2026 at 4:49=E2=80=AFPM Christian Brauner <brauner@ke=
rnel.org> wrote:
> > > > On 2026-08-31 10:59 +0800, Chen Linxuan wrote:
> > > > > Obtaining a target task's executable, working directory, or root
> > > > > currently requires walking procfs symlinks such as /proc/<pid>/ex=
e,
> > > > > /proc/<pid>/cwd, and /proc/<pid>/root.  That makes the operation =
depend
> > > > > on procfs being mounted and visible to the caller, even when it a=
lready
> > > > > holds a pidfd for the target.
> > > > >
> > > > > This series adds PIDFD_GET_EXE, PIDFD_GET_CWD, and PIDFD_GET_ROOT=
. Each
> > > > > ioctl takes no argument and returns a close-on-exec O_PATH file
> > > > > descriptor referencing the corresponding task path.  The new ioct=
ls use
> > > > > the same ptrace permission check and nonzero-argument rejection a=
s the
> > > > > existing pidfd namespace ioctls.
> > > > >
> > > > > The target task is sampled while holding its exec_update_lock. Th=
is
> > > > > keeps the access decision and the task-state read in the same exe=
c
> > > > > critical section, preventing a concurrent execve() from changing =
the
> > > > > credentials or target state between the check and the use.
> > > > >
> > > > > The first patch factors out helpers for acquiring referenced task=
 paths
> > > > > and reuses them in procfs and AppArmor.  The second patch introdu=
ces
> > > > > scoped cleanup for privileged pidfd task access and separates nam=
espace
> > > > > lookup from namespace fd creation.  The final patch uses these pi=
eces to
> > > > > implement the three new ioctls.
> > > > >
> > > > > Signed-off-by: Chen Linxuan <me@black-desk.cn>
> > > > > ---
> > > >
> > > > I really have difficulties forming an opinion on this. So this soun=
ds
> > > > very useful but it has implications.
> > > >
> > > > Right now, pidfd ioctls are available even in situations where the =
task
> > > > in question would not be accessible via procfs, e.g., when procfs i=
s
> > > > mounted with "hidepid" options or similar. So this would expand the
> > >
> > > One point regarding hidepid: for callers that can pass
> > > PTRACE_MODE_READ_FSCREDS, hidepid does not provide an additional
> > > restriction. With hidepid=3D1 or hidepid=3D2, has_pid_permissions() f=
alls
> > > back to ptrace_may_access(..., PTRACE_MODE_READ_FSCREDS), and
> > > hidepid=3Dptraceable uses that check directly. In addition, the
> > > /proc/<pid>/{exe,cwd,root} links independently perform the same
> > > PTRACE_MODE_READ_FSCREDS check in call_proc_get_link(), regardless of
> > > the hidepid mode.
> > >
> > > So for these specific path lookups, hidepid does not block a caller w=
ho
> > > would already pass the check used by the proposed pidfd ioctls.
> >
> > Agreed, I think with regards to hidepid there should be no issue here.
> >
> > If I try to come up with scenarios in which this could introduce
> > additional danger, the main one I can think of would be: A task T1 is
> > running inside a pid namespace and has a unix domain socket connection
> > to a task T2 outside the namespace, with both running as the same
> > EUID; T1 sets SO_PASSPIDFD on its socket to obtain a pidfd pointing to
>
> Does SO_PEERPIDFD matter too?

Yeah, I think that would have equivalent impact.
