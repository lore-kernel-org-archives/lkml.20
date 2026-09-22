Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D352192D8A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057221; cv=none; b=YZ7JqKR4Xvyn0HKROTJ45ehlaBS/sD9ETl3HsoKXgDhoa0RFeGVkcOWFUichQP8T+lVXA7YCwd8Hx2pidEWKqYrx9TFiFCT4E/TqyBIKZSJiQEaQeTJg3ZwQjrP9U2G2zRbQIr/glBSISvcONOYR5JPTWPPjOiYEbv+ADe+CP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057221; c=relaxed/simple;
	bh=Q/oDrKjoLV0PJ7re9Qc+KtJR5UkROXgTJNC/Syw4ETE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYtep+sNBVCFyVmxawN0ACmLMPjJmWTplrrNqSda4X5ZNBmtLvQ81dxCDrvKtdQ4YRMEVMjgdPz0icy5KxBu90SHTIAEeAqZ1z95JBZm3stiRsEYV8Rfai2vElVd9krcr3gpODZy9tBDqQClzKFeruRTBtFdnXeqdcGuQOAzo/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso1153243a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057218; x=1790662018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zxmsk/EJ4w4QHvprrsLgwa7ofL6yH0BsSIWlOL221Nk=;
        b=y/rdZwMg1MkmsQN+KFQ31/NwA+6ApZSgiVnBOBSUJbUBcMIlHaqfT4oAWoCssjPG5r
         CMGxTk/zlZ4fnKsZZaGT08QBEA9q5Z2aXu2uaOAXC0XgXlA6mirkmJZ4hxMjDk9DQ1br
         yHA59V3Ix1tiCgHEq4CtTNpjIkkpkDz8Xh3U+JqkTWFAju9ZtixK/SB+DYFybIGtxatU
         NL+HNlenOYFhUi/KaSu3hKwVu3BMjYHp72L1015PFVCJ6zFDqs61VmPNZDqKVLqNnkVq
         iKlGFhy0DV7b7b72GreqzNvtwqDJk21ERZVEUjb059JhbVih7vgSLvvxVYqmrVRygbRW
         9+Fw==
X-Forwarded-Encrypted: i=1; AKwUvByLq6cdbQHL8r2DgVgnvjmf9g99WDV6fBvExsvdiKGIWNjal0ZLVQ8rPav1u2aZM3NsFoDwSJM0P6H2MFg=@vger.kernel.org
X-Gm-Message-State: AFuF++nkRN749GEcR3K8Ugmh2Po4jjrG8RuXp0pbvuihm2k0P1sas9Se
	RSVEOWVT4wGdcxhGn73uqYVFk5XdVOcui0UXe7WKyxPQVgU5Tq0VkaegN2WUZg9LiClhT1oB
X-Gm-Gg: AYBFou38oAD/b4r14sQXVg+1mBjFMHI5GSp0vkQ0E8Usbf3dKybk46qWi4asYYQs6nm
	crn5gPtxmy41cpV+VccHkYQiZ6RssYcbOCkAjnQE3Sg29z/5+rpk66lP4OW3/sLYB45rEqMy8OQ
	JjLK2unzzMCcmph+1iReWjxJqFWW2JKiTcXYCUe2Q0lq5lvuGNYxE/MV4xqHfV+4UXXPMME7d7a
	R+AGYXi1sU+pTu3+zYQ2ViSD+gS+sfnXgkDFFr6iNY+TRlUBb8IeDYuByhJ+TNW7oo/G2BOYgjb
	WNYLN6N6lYsHLxdzDT4f32DRwzo5NgsDaxXdMQbPBC+AQmKEmgM+p1KXoC4YD7s83xwUs2b6DQ9
	yIPZi9Hp7pe5fcg/p/v2MQaVf0yz/zrrdRs1FxVdXq2L89Xg/r920ZqXgW3g5/8Ltra99NHCjnL
	jWUweUCx5IfDQKGqF3jqrq88zxFcqhnnIrlznJ2CiLaVMeTDC5/nfgI7d2neHAvaINMorlk9abI
	Z9IeTwpjXOnFv2ZOPbC21YaUncyaKib7Eu0xgvW27WVr4/9I4T98L3Sc2pmIWk=
X-Received: by 2002:aa7:de03:0:b0:6a6:b2b9:7663 with SMTP id 4fb4d7f45d1cf-6aa9ff153b0mr1097573a12.16.1790057217548;
        Mon, 21 Sep 2026 23:06:57 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44f7aa0sm409946a12.16.2026.09.21.23.06.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:06:57 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d1so2658100a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzF9jhTR00pnccxHzjzCvm5Ybwk1VwqZpm6SM2kvuI1NCSALHTVA2uFn0vwSpUl93iM2S7sZkbOKdctpJo=@vger.kernel.org
X-Received: by 2002:a05:6512:220f:b0:5aa:62df:cd0f with SMTP id
 2adb3069b0e04-5b8d28f3a47mr500408e87.2.1790056745194; Mon, 21 Sep 2026
 22:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-pidfd-get-paths-v2-0-c59ea6a21b72@black-desk.cn>
 <20260831-pidfd-get-paths-v2-1-c59ea6a21b72@black-desk.cn> <CAG48ez3vJrbt+qYh5b-PYxmr2txcg3DAKDRwmBwVzNhRB+8Ueg@mail.gmail.com>
In-Reply-To: <CAG48ez3vJrbt+qYh5b-PYxmr2txcg3DAKDRwmBwVzNhRB+8Ueg@mail.gmail.com>
From: Chen Linxuan <me@black-desk.cn>
Date: Tue, 22 Sep 2026 13:58:53 +0800
X-Gmail-Original-Message-ID: <CAC1kPDMUT6pUarj-ohTGB9=5u=7osk+8bvyyAAjStsJN6Z3sEw@mail.gmail.com>
X-Gm-Features: AclHuK-ZUoiNUpNllD9s0TdWDgkEMFXuDsvm8kdoP44o6gMCMaHAEIjZzTqw_NM
Message-ID: <CAC1kPDMUT6pUarj-ohTGB9=5u=7osk+8bvyyAAjStsJN6Z3sEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fs: Introduce task path helpers
To: Jann Horn <jannh@google.com>
Cc: me@black-desk.cn, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
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

On Tue, Sep 22, 2026 at 3:21=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> On Mon, Aug 31, 2026 at 4:59=E2=80=AFAM Chen Linxuan via B4 Relay
> <devnull+me.black-desk.cn@kernel.org> wrote:
> > Introduce helpers that acquire a referenced struct path for a task's
> > executable, root, and working directory. Reuse them for procfs task
> > links and AppArmor executable-path handling instead of duplicating file
> > and path reference handling at each call site.
> [...]
> > +/**
> > + * get_task_exe_path - acquire a reference to the task's executable pa=
th
> > + * @task: The task.
> > + * @exe_path: The task's executable path.
> > + *
> > + * Returns 0 if the task has an executable path, or -ENOENT if it does=
 not.
> > + * The caller must release the path through path_put() on success.
> > + */
> > +int get_task_exe_path(struct task_struct *task, struct path *exe_path)
> > +{
> > +       struct file *exe_file =3D get_task_exe_file(task);
> > +
> > +       if (!exe_file)
> > +               return -ENOENT;
> > +
> > +       *exe_path =3D exe_file->f_path;
> > +       path_get(exe_path);
> > +       fput(exe_file);
> > +       return 0;
> > +}
> [...]
> >  static const char *get_current_exe_path(char *buffer, int buffer_size)
> >  {
> > -       struct file *exe_file;
> > -       struct path p;
> > +       struct path p __free(path_put) =3D {};
> >         const char *path_str;
> >
> > -       exe_file =3D get_task_exe_file(current);
> > -       if (!exe_file)
> > +       if (get_task_exe_path(current, &p))
> >                 return ERR_PTR(-ENOENT);
>
> This assumes that when get_task_exe_path() fails, it doesn't set
> members of the path argument to non-NULL values. That should be noted
> in a comment above get_task_exe_path().

Will be updated in V3.

>
