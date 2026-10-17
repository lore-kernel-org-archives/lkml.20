Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFFC3783BE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201294; cv=none; b=FOx5m8waF0T5NDDKk1TMyUMvNnRlHA4aXDYyK1NRXp6Ut0Oyefl6VcfYZVL5w9UEJab9/NKT1UEqf1evAYVgkwAqddZGfsTrWR4+VvrmvKIcJCt96sTdkb9Eo4FFOF4GIGVQEVvxgdBB11C/ND/0ybhrDBdQd5P8cbjlMkUTqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201294; c=relaxed/simple;
	bh=SJ3H0Y4897knyxt2qKcz8RPoXZ35/4HPpfjfIvJjpcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7nf1HcgTMw+qe+Hg+8pPZSJOHzBU/6Inxy7RmaF73PFmSAK3IQJdTyIdrqkALCQ8T6TbnhDceCMPTfCpUi+G2cAXemGjfgR2UqF1m6VOMndmMsAG3JEaecxUouMF+ubuxDWVhxm8TMKiySaVUKX0DrkLNS+1gh8PVG7euSH//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJACF1Sd; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJACF1Sd"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0cf2c0785so4126867b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201292; x=1792806092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOS+ZBBODn2ZAo/hVEDHsyHqOP2bTURk/CP3sWDEYqs=;
        b=bJACF1SdIpbNlmBWfrx+OQSv7Xa1thhKmm+daP5SDhPcOBa6w9giZSBc4AISsa8PIa
         1CeQ0BuTtcXsATycLdEjD0EuqUGdD1/LMLF4Zr03epGd+GzvWENlSNTqv7sZEabPuHmi
         VwMcju1dUgbLwwH4PzRriozQPFvfT1vU1u1eCdgxjqZhqNnQ+RjlEIdwQFyyo4SN3oMe
         v4HJMixrYXUYVdHNFY+fByW/pQieq3RzGVB6doc5pbZo7Lxt5axqIBf2ZTDMHa61pM9A
         3qzvcQdZv4gpLZaZj9nDcl9cK/K3oR3jpKMeWLIPfWghZHlAoYjGiFGxK+PSVdYKs3VZ
         Tvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201292; x=1792806092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOS+ZBBODn2ZAo/hVEDHsyHqOP2bTURk/CP3sWDEYqs=;
        b=PiUyACvYakp6PIuJ5lUQ/xHGbai3UbopTcT3udLtG4P79bE5QthKrTOr38+5o9lAxW
         p8VXVKH1QJCy3OHPwWbQSrQst3xBZC1Tr5XMxxWM4ZDyIfXrfQMFkt3tAdcE26q5sJ13
         eovwTl/p8ZwZ2RVKCBkY7sGS4ma/9o4MERu1kX8Blm/n9weq2OxQQ3YWuXBQZOpVrQ9F
         nEXsNyKz8AzAOsC+l4S62wsZFYvQCfc2G5HFEFPY1BVSsiP9KMRvdFjfusTbQlh1BeoA
         YHKmJHJG9OetjdqDtv4Re/M3r1qwe/Xo0W0zcUhnMe58lZL7k2JvLGnJTGnPRkPEWuAl
         Ulcg==
X-Forwarded-Encrypted: i=1; AKwUvBy3tHl2pX4Ulc4ZyIsbji6keIQ8bXx8QiSerrBUlJQnfLCr6MHYyXGaDfMX06gbiVVfK0SAIQ/m3XBbvnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVcS+FuN7MdAIcEK6Pc9gzpJHA3Eni053qKXNc172wXvS3kDPb
	0AVILEKOZv1znfOrM9knhu1HfsfOdaAw1C2CSCgNgrM8OV2DotEQ/AwW
X-Gm-Gg: AYBFou20WecOTFqWvKHMGgSU6ksEw3RFtvI2xkb5F8jZxLagRs8Eyc/v9XEt0vvl0Wc
	HbiQk1ksOHrupmETkgmqF7xwMRCwWY2TrG1mYLKUEQSpEV5nu33iyvPs59aK0ZdjBHxm3rrJt6B
	gYDLFv5WbEAILiaA/44VuPGrvlAb1VpmU1RDkUvrQy0WB6bxcCVjtQnvdq58gVjyScVEbs22dAR
	oGt7qGLjrh0JWWH2B4ZD8g+tQqx7GCxckcUIqJsW1UUyszSYv/YG+1TxQyHZJ5ABLSPcuNk1y3y
	XnL9AF78t039urK+GCx9Hcoi6ywMZHA+Sc44M5HbEvlp24baYdPoBMcJcF2r38at4aJYrXPlAyD
	eiYY/oRWARBF/13MH8YmpLSAH0wAbKYiwTud/R49HwSq9PdV8kXNqu0p2/Y1AWKlNiK5EHXV4hg
	vnshk/SI89UxrdHeV/X3AnEYDxvHfrlM3zfT3D9W7U9AdpmdxCHOFZRvR19m+rsrOwznA0rlEn
X-Received: by 2002:a05:690c:6d84:b0:8ab:41a5:63c with SMTP id 00721157ae682-8b0f2433bd5mr5404137b3.108.1792201291989;
        Fri, 16 Oct 2026 18:41:31 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:e60c:1742:d962:6aa4])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e4083esm1786175d50.9.2026.10.16.18.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:41:31 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:41:30 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, linux-fsdevel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Mateusz Guzik <mjguzik@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Tingmao Wang <m@maowtm.org>
Subject: Re: [PATCH bpf-next v1 00/11] fs: unified VFS ancestor walk for
 Landlock and BPF
Message-ID: <atLLcqIiYEw4HYo7@zenbox>
References: <20261013164800.2906577-1-utilityemal77@gmail.com>
 <DM6PICFFAU5Z.14KOZT5YJO7MA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PICFFAU5Z.14KOZT5YJO7MA@gmail.com>

On Sat, Oct 17, 2026 at 01:02:40AM +0000, Alexei Starovoitov wrote:
> On Tue, Oct 13, 2026 at 12:47 PM Justin Suess <utilityemal77@gmail.com> wrote:
> > The structure is unchanged from the RFC [2]: a stepwise engine private
> > to namei.c, a callback front-end for in-kernel callers (Landlock
> > is converted, fixing the follow_up() race Al reported, hence the
> > Fixes: tag on patch 3), and open-coded BPF iterators over the engine in
> > referenced and rcu flavors, with bpf_path_ancestors_legitimize()
> > escalating from the latter to the former mid-walk.  Patch 1 is carried
> > from Song's series.  See the RFC cover for the full background and API
> > listing.
> 
> Song's series stopped at
> "It is a conceptual dead-end to expose these two modes via separate APIs
> and leak this implementation detail into non-core code. It will not
> happen as far as I'm concerned."
> VFS_WALK_RCU, -ECHILD to the caller, two bpf iterators and the
> legitimize kfunc are that leak.
It's a leak alright!

The problem I run into is that the RCU walk and refwalk have different
contexts. Currently the KF_RCU_PROTECTED on
bpf_iter_path_ancestors_rcu_new and the KF_SLEEPABLE on
bpf_iter_path_ancestors_new

Unfortunately, if you wanted to make one set of iterator kfuncs for both
APIs you'd have to make the assumption that the inner loop
always runs under the non-sleepable KF_RCU_PROTECTED conditions, the
strictest of the two iteration modes. (KF_RCU_PROTECTED context is stricter subset
of KF_SLEEPABLE context)

So it would just be KF_RCU_PROTECTED regardless of whether it's RCU
walk or refwalk... so no sleepable dentry xattr kfuncs would be
possible.

There's nothing wrong with that (callers can break out of loop and do
sleepable work) but it is a tradeoff. And you couldn't carry the
acquired references to the paths outside the loop.

So I admittedly designed it as two APIs that leak the rcu/ref context,
but share the backend API. (the vfs_walk_* stuff)

Christian do you have any thoughts on this? I agree, as little
RCU/refwalk details should be exposed as possible.

> Landlock still passes flags == 0, so nothing in the kernel walks in
> rcu mode.
> Patches 1-3 fix a real race and don't need bpf.
> Send them to Christian, Al and Mickael on their own.
> 
Will do.

> > Verifier fixes propagating the RCU-ness to trusted fields can be done,
> > but it's best as a separate series where the idea can be examined more
> > closely.  Then marking the dentry as trusted will allow you to use the
> > dentry xattr kfuncs.  Nothing in this series strictly depends on having
> > a trusted dentry, nor will marking it trusted require changes in this
> > API.  See my follow up [4].
> 
> Then what can a prog do with a position?
Not a whole lot. bpf_path_d_path maybe.

> pos->dentry is untrusted now.
> Marking it trusted will require changes.
> d = pos->dentry is not linked to pos. It will stay trusted after
> bpf_path_put(pos).
> pos of the rcu iterator points into bpf stack.
> MEM_RCU propagation fixes neither.
> What next() should return depends on how the verifier tracks it.
> Let's do the verifier part first.
> 
I submitted two verifier fixes earlier here [1] one for the linking
the trusted field lifetime to the parent field and one for the MEM_RCU.

[1] https://lore.kernel.org/bpf/20261014173039.3666415-1-utilityemal77@gmail.com/

Justin
> pw-bot: cr
