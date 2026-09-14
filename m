Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE76271456
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353118; cv=pass; b=W63XNwH5xniOiezI1pTjeIiesesEwKqUZbywvBUqWmyf3Dcfq0p/cDrX16vJUpjcLbvWs+/wkdU26+cvZjPS+xeoOvN6+mEHI2RN7ucIVKJmMHeRozAsj1tVwPPfZXU8IHtLGi7wW3jNhUEr+8hgt6ImNi4mL85Nxosmc09S5ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353118; c=relaxed/simple;
	bh=YQq5ED2h3MKUld2mTMcqT6jbF/0aSpOcGOmydQ0401s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0mDhZFpC0hslrnlTptK3FQbdbBGP6ih1LZuYNpByQUNWuDp8eUOe4+Y9KqUwceA/YfxFCDxQ6AlwRDdKzoj+juk0sBUHtKp6GrAgohz8lqKd3H0unV9qlSp6o0LzgH5/TVsdR5E0eTMuwF/qzoVdPU5cYIEiSy3g1BypiEAsuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR7RHqfO; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR7RHqfO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so1213531a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789353117; cv=none;
        d=google.com; s=arc-20260327;
        b=PkqCyFv43MPg5pj7Y64W1ucKzLo396LHYqxfDSIrhr4bQsdgpHoGh+RRT0F1TXUFvG
         iQDe03MqcBj27EjGV7ssdFBaqoxOQpWH2py5AScaLE4ko2iaPLgjCyQGKrKdyyA37pRW
         kSueSkLMnKWXLI8dgtfRshqnMG+h1RmatYDeQiIYqqSt0ZUzSRaHYDOsy45LRsUk/BrK
         7zlIQfCxUxAgrOIXdnW2xnLUdHyZWA83EJkeV2Od62WGCtwXO6KNadLLALtJj7Qnhr5W
         xWbBOf2tKuat8PWUMqfEyy+nRCIm9W00RUD4vhVm3Wf6XkVl6vsCMpWDgQzPyHmrCPfa
         AdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YQq5ED2h3MKUld2mTMcqT6jbF/0aSpOcGOmydQ0401s=;
        fh=3Y8vZUesXNF5HwSZAVXPtzuWwwrKQcQcq/T5fKz3vaA=;
        b=MKukFQOYjW7zRsA/3mv4HmSIVS63FxIOmWDjeBqWCo7uAeg9eZbaVYClDahDlmJTb/
         B1UJszrMg5WZ45KZ3NI6SULnzKwSXKj6FnF9G7pyGic7ZZD8K1Faib90WgnPxu5+1y+S
         eRBC3l+P+og0LIQ0HdNtHKXgRHUN5JmGWwtVMovBCMdurdalvYCWlaYVtRxXV3QrZ66H
         RUW9I9ar73e3xCcxOyiJKPskdh+DCvkrmPvbxBlyD8wDUx0sERf+fdukZtdUY+RaG2UI
         YLnaFs7/DRgC+bX+xyVzFeDW1fCxCrDlmKP7QeMn3uylMC4NMrjGqfgOOz6urLMQxSvc
         u3UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789353117; x=1789957917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQq5ED2h3MKUld2mTMcqT6jbF/0aSpOcGOmydQ0401s=;
        b=eR7RHqfOWHsBRsjzCCOY/b1NL2mC8XZ5If2LevX+KTQVQuIs68/9VWnmBQ8UIhmt1a
         gbJ30ZQxJsc9mQTqeIVowRxS+LhbSMkLWRWpIq5Ylq5/6b3yxdBX5fRm3wG5N/bNtVj0
         DQHIpnJUXG5YGh4Vy0xKONcf924sC99VK3R+ChgRhExrD+ETlxJmHWG2Hnm21fnD8FCa
         tLYm12i6cPc20VQaqSkfIMDBZcpCGx9o2ch4br/p+5kc3fvU+CjhAtvZAxKvtqBqJ8e6
         AOAY88rQGUSvzFn/bNpkro768xa2F6M6GTXzRslAontz9DMazVMzYceEQXFYZv8zyjI/
         /H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353117; x=1789957917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQq5ED2h3MKUld2mTMcqT6jbF/0aSpOcGOmydQ0401s=;
        b=Ag8Bdrd2KrPiWXuSMYRc8mFLCQveLnk5d3wx8nWOb0Sw4KU4rd1aRh598mBafzjQja
         BZ6Z+v/kCKlp+zhtx2YUlKPngUmzHXuFrdLDGxfVmHcs6NLpowyVTKg1LLjcUIhySFv2
         YInoRhzttZU0eWLjGJuDc8WWufr3RTDKw3WPZHbyQBOpIdMcXv4FE+2ewHLuHE3VTuZQ
         PQShS3CaM76KpGEqI6y5aM2DjUlNnLNJvIP/LLxCG25BhTQrocA/LNRMG3EUyDV4EfuO
         7vd5WNvsidh/UsiLivwgs3VQHAXRZiGrbmvNw3ft4EHPeO/iUSR5LyvHfosgwddntSp1
         2mfg==
X-Forwarded-Encrypted: i=1; AKwUvBw0euXapKFXkcBXXIVvz5CBmzb1ZYJFiF1+owYBW97iZGVjc4YPBimppidAj+4fJv9tA7HLQhD77PTPC74=@vger.kernel.org
X-Gm-Message-State: AFuF++m4wAJrlkn+4dbC4VvPLXIv9SpD+QJK/hEdpKQdqCE2SLMJgTUo
	rdYhwxm+gO0tBI/fMxRzAMKDedJC6ZgFL8W/qK9XA7Fj4KlkO0zJvzaYtFkE9dqFIY+H4+UpDnw
	J+2zy0z8ZYAQHCWwu/WLvMzGqgCJ0yLI=
X-Gm-Gg: AYBFou2kyDQRX5A/o7laaU/IVVWNHxAYjg4Tktkz/Zl//8n2LEckXXDdWDgylFRac3H
	X18iq7+Uj5PBH5spQf4gkVHH3CtJxwzqYmt7iSYi8NI90HurZnBuEfVULo7Vv8Y2ZOvCnTqcR8U
	0fc/xgP205VDDe9HTQySHfUHbEw41l2VAWPbpkx1Ff3+OE75dGg61YOqjBbwPO4XPXsx0AEVVPG
	Ry98n/1wgRdbwUz1XS0oRklMcp3vCUsDvWedwHK5yWWyNdbIiLFteVkX4BVoeEFsWSUE97fFmvn
	SW9kQtuDXf0a0jfYj5MukYQjOAnUuLLr5oN4zIb5rXi4PuymAkwKC3h41Mv2W5w6psE/rJqKXp9
	Y9+FASMkjOAOAHhJuxICJp0rQhz68P5ejLHu8OzE=
X-Received: by 2002:a17:90b:2c88:b0:398:d6e6:4671 with SMTP id
 98e67ed59e1d1-39dec0f990amr1390428a91.25.1789353116570; Sun, 13 Sep 2026
 19:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909193719.518517-1-utilityemal77@gmail.com>
 <20260909193719.518517-5-utilityemal77@gmail.com> <CAHC9VhQHZ+ngFdzKqmnzBh341CGEg-jexu+QYU8=1qXK=u-x-Q@mail.gmail.com>
 <aqHUw6k0Mf83CGFT@zenbox> <CAHC9VhTM7emi9vxs+5Za8Hrc_e9dg7fZx+Z6BGUc4VQ1qhEAUA@mail.gmail.com>
 <DLD0VQ3D8CYC.3V5ZT8HDMY4IH@gmail.com> <aqTZdCz6JaoK16Fp@zenbox>
 <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com> <aqcb2eXw61LaFaqY@zenbox>
In-Reply-To: <aqcb2eXw61LaFaqY@zenbox>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 13 Sep 2026 19:31:44 -0700
X-Gm-Features: AcwNN1WXBVEf_wzXbmqsfgloUj3Usk1t2ym6vBQneSX3XwH8eIEOpV46HQIyMkg
Message-ID: <CAADnVQ+v9_a8Q_YOvS9fmXG+-Ga0ADKrjGDDUCiFaipo2vUDmg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 04/15] lsm: Add the bpf_lsm_policy_release
 kfunc and policy object destructor
To: Justin Suess <utilityemal77@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <matt@bobrowski.net>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Kees Cook <kees@kernel.org>, Casey Schaufler <casey@schaufler-ca.com>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, Jan Kara <jack@suse.cz>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Tingmao Wang <m@maowtm.org>, 
	bpf <bpf@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 5:20=E2=80=AFPM Justin Suess <utilityemal77@gmail.c=
om> wrote:
>
> Sure, in some perfect world in the future where every verifier
> challenge is solved and BPF has feature parity with in-tree c on
> a 1:1 basis, you could implement something like SELinux, or Landlock
> in pure eBPF.

Try.. give it a shot? What is missing in the verifier?

> Why force every eBPF program that needs to make security
> decisions to reeinvent the wheel?

What specific reinvention are you talking about?

> BPF already calls into LSM through security hooks. This is no
> different than bpf_map_create hooks.

what? It doesn't. bpf progs avoid lsm hooks as a plague.
Not a single kfuncs calls into lsm directly.
It may call into security_*() by accident because
it calls some kernel mechanisms.

> Nothing about the way BPF works changes with this patchset.
> There's no verifier internal changes.

If the verifier is in the way of what you want to accomplish
then please improve it.
