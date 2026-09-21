Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BAF380FF3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018464; cv=pass; b=sXd/NI+x8rNg2T6WoFwJ9rWprGE0bxpOQtIUhodsRGBn7k7A6goCGT+aJrLww4QvWtNt/wyAae6sNYelEKthzDGsvO3Kfh9/km1qwjTiZqeg4FF+Is+27TBU0luD5I6G+jV7Z+N2E8c2CrWu/2sCl9BRMFCXTY1Wj2ydF/RRuKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018464; c=relaxed/simple;
	bh=qlFdAR0F/wCuIts0PKz0zOO+oD2tVvhCexRQzujbsd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0x3SgVtT5rayH+1UdgYeAknwIswOFT98agwPml4WZjn8ZoR7BeHRSPKwwBui3UGW6EBHO3xQnBcRWmFDvjojn6exGvrFr8CreV2XXh/5U9oTdOeVOk68lrgWKTJCC23gKksEfaOlmgWFxbCO926h6tXr+ls4ivUdumFtG1AwN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Old1K8kL; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Old1K8kL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d3b445a84fso31225ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790018461; cv=none;
        d=google.com; s=arc-20260327;
        b=kDXgeiLWLyeXkbgxKI6Jv/gp6listalOJ6ub0/CdT1QEmB0+yrexuQfkH8u5oUFrCf
         c8lBmBVRXp2VDt2ghy5sOI6eVTY+hBhr0+hzFR+nMqz1x14ixYQD+tXZ2d6A9OFO4NRl
         chiVnbgJxWD+cqeu232ZBShTbeBzACvbwJESJB5gRQ7lmmcxAM32N3iPgy4U5BOpZ8h/
         LvVzT0JTXlcK0mUa5gS0gz4wy3htrPfFAJfO4vVVsbX6GDf5tI9ynnVGYCM25rHgKXj6
         RDLNhooiHkVg8aSEawSae2qTK/6TYdzBVl2rgEL4mZT9zINZXU6MytQmsiw0vXYK/yjs
         7tVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MEszMFKCmw9FeOOlcidO7gC0SHQCAcCefilt7YkTj2g=;
        fh=XxS4RsM4610wfM20YaRv9hn0eepoE6DflaerBVgntyM=;
        b=dw85GaoVPRVBdPWdgxSIZZ2uBUyz1dR9aZKO4k8yRAu1BI/nkOCdI68847YDtFnmOr
         zGl5f086GbEP7H2dBQxqu583kSKSebzSwssmQaJNfuru/3JtjN38scCN6J4NvAxVf4Pc
         eliEavR1I13LG46Zrsbsdf8dP7nhUoYJcJqaOezT4gWiY3I7ztZYUUuYYx8p0+T8Yp6q
         NgvVv+0ZKPEoa7gMnyrpYQwGCrNPMYvdLcbr7ejQsp+Vw8sjXPtZcPkYFRvM+sxbZYe1
         NXuz9VNzGyR++FdGuhhW0ZT1WcGQD5UZkoh0ChPcfVohiwWHow0BkBALTEPm/HUEe3ia
         0kxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790018461; x=1790623261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MEszMFKCmw9FeOOlcidO7gC0SHQCAcCefilt7YkTj2g=;
        b=Old1K8kLo+/5sZfFxr1yO0b5CJop3DdWOVAx4746I2nslyAdNuiWbTaQeR0omwoiSG
         Zzdq78QuygBtKl2EqTnjPHSDMvlSUiaMYrFD1GTXi2776fM4gZN6IFwAPFqBhJTIKwwx
         LjgbgzLuv9Lmgv85zZhuniAd9okpEBN2dxyPuou+ftK3iTLp6OM768OM2/V+9aZSYW9X
         YzmUlCxYBFrpyfUmvxwcU7S7RyyIMuQBtL5cj8N6yypVhp8KTg0F9aPR2r9+hKVU8Iqp
         9lzRj0ogNKnAim1hY4KHi1x4JoAwPgXcYpV6QzshfWeyinGbLhTI7d9d4CNtfyd1+5EA
         JIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018461; x=1790623261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEszMFKCmw9FeOOlcidO7gC0SHQCAcCefilt7YkTj2g=;
        b=Cy04gENjBYVQpX96hn2Lxk5mg0pGkgIrOw/DTe2+8hKtsa2EpKLsK+CDmnaQzMMn+Y
         gPADI/Rhyu15o5SjSdcd0ztHKwtIVymgvmtf4n1yK3wOI9Yj0L08gO1y8nfIwv9JgS3e
         nBWo6VBhrK8hXUUtcjPZfNp3pCkn45DOl21kTXtcUwr4npiPGB+zZjF6aAhZF3jfocWX
         bKGdez4cnML9++EtI9icNbOTr4TUs0HusJOoTHaQWY75CGx1eHO3/TQ3kvOX43nldzz3
         LvUhP91yNu6Pn7lMv6bXjJfwQ1aBSX1SgiQgRN2w32GgBiN981HchcfqG7WMr4S4oX/A
         aFsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzghtfDU1SekByBRnIXO+zVCilx0s+lb/3VnTa6SAL6Yp9iV4TYlll8S/3TJT5KSKVBZApIsg7LZ+0Z2MA=@vger.kernel.org
X-Gm-Message-State: AFuF++kh/VOg2p5nQ0rKzn9QUFjuPinEDPUbp9ay+OYxtI0ThzVNgzal
	E6CUGjx48wDc9++IPuh7pw1EIX17aEKPo5/FD4f97XwU+eM71q2C6eNNSgRoGBqD9QW1xaB170q
	AXKmLTXUx4f/rw6rszxKZRomn1T567UApSEyYOg0Z
X-Gm-Gg: AYBFou1vAqKF2cgMTGEmLiy4Bffc+6ojgsvpGXZ5c59U6JiSM4zVa5ZmmnzXz31HUwQ
	VO2cOUkzqnICQNkt7ijBz/40FMWq0ttm4gej3bnKpsY2+QjK4E1sNvIJk42rIxM8jPMLlx5D2pH
	Me0K/bFJyXhneyUuaoNkpUQs1y8X7gdD0UMJNaTOkUv6SVh/Hc/hkaPMkK8Q6WtnT27H30Xlltl
	edLEaZyt4HNdAWcXQMENqHy9U6Uc/S2aVzgEGmiZJAYgbehGU4fS8OhE6982uM6spOW+Tx5cHns
	6atBlaQXio+nfV19PXurFWgG3AiF9RRIXc+2NBhTn/E11UzMQc2VxyeqRA7hjCP2RvhDtHKFFKJ
	MJwA7o0Yl05nI3AT5xTr6ZWviqGUMXh6buAJa+PkKRgOom5VYBbA=
X-Received: by 2002:a17:903:4b4b:b0:2c9:bd54:cf with SMTP id
 d9443c01a7336-2df5a44e80emr2158055ad.4.1790018460814; Mon, 21 Sep 2026
 12:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-pidfd-get-paths-v2-0-c59ea6a21b72@black-desk.cn> <20260831-pidfd-get-paths-v2-1-c59ea6a21b72@black-desk.cn>
In-Reply-To: <20260831-pidfd-get-paths-v2-1-c59ea6a21b72@black-desk.cn>
From: Jann Horn <jannh@google.com>
Date: Mon, 21 Sep 2026 21:20:24 +0200
X-Gm-Features: AcwNN1U76ul6KsowgCeLOYWUNK5UYTHsLK5_fZAtm1s6K_0yYBp22XKyN_fzxbs
Message-ID: <CAG48ez3vJrbt+qYh5b-PYxmr2txcg3DAKDRwmBwVzNhRB+8Ueg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] fs: Introduce task path helpers
To: me@black-desk.cn
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
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

On Mon, Aug 31, 2026 at 4:59=E2=80=AFAM Chen Linxuan via B4 Relay
<devnull+me.black-desk.cn@kernel.org> wrote:
> Introduce helpers that acquire a referenced struct path for a task's
> executable, root, and working directory. Reuse them for procfs task
> links and AppArmor executable-path handling instead of duplicating file
> and path reference handling at each call site.
[...]
> +/**
> + * get_task_exe_path - acquire a reference to the task's executable path
> + * @task: The task.
> + * @exe_path: The task's executable path.
> + *
> + * Returns 0 if the task has an executable path, or -ENOENT if it does n=
ot.
> + * The caller must release the path through path_put() on success.
> + */
> +int get_task_exe_path(struct task_struct *task, struct path *exe_path)
> +{
> +       struct file *exe_file =3D get_task_exe_file(task);
> +
> +       if (!exe_file)
> +               return -ENOENT;
> +
> +       *exe_path =3D exe_file->f_path;
> +       path_get(exe_path);
> +       fput(exe_file);
> +       return 0;
> +}
[...]
>  static const char *get_current_exe_path(char *buffer, int buffer_size)
>  {
> -       struct file *exe_file;
> -       struct path p;
> +       struct path p __free(path_put) =3D {};
>         const char *path_str;
>
> -       exe_file =3D get_task_exe_file(current);
> -       if (!exe_file)
> +       if (get_task_exe_path(current, &p))
>                 return ERR_PTR(-ENOENT);

This assumes that when get_task_exe_path() fails, it doesn't set
members of the path argument to non-NULL values. That should be noted
in a comment above get_task_exe_path().
