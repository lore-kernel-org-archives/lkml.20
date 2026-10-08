Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A049890E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465226; cv=none; b=STdmeRrpNXTjaw3DcouvrtymphkLbClGK4AN5/V8ceNTpvd7tCNHlK0i1ScwLypHkPnVFyz+7sN7/YZ+UEVvP6HghH1yFZbnqO+SHvaXN1hHgY7xAjC048KwEOumSAAN/IsFZjGLKf5ghC9EZ9BWADOUN1jVJ95e2wzB/x+QWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465226; c=relaxed/simple;
	bh=7qtI5gtgg8HMBmacX6qKEDXcXJKwtRBJ+yKlbMqIu+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtnhoqorOu2eocQ85mq+fuFdHCeXIWBkwvj5ZcJafRcB/T+2u+wxXx9NWsangaPF2KbeTd5Q3cqzmiIWVilVc7wEziqkbtE8y6h285uVyOL033SGHUIDJDiXexkyB4FTZSp7U3k+n4LEME89bCkoA+7uv3ZFwGGBK+RhhY1LGuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=D1SCMzeS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="D1SCMzeS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so22378965e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791465223; x=1792070023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
        b=D1SCMzeSC+3lNkcoGtnd5MZUOxDZCN3wuNj/aDJI/4LcSRRqrhAqs/Hi9CUNMcqHFF
         scv7iSSgs0pq4DXVtxK1HcP+TX2UMEUKqgjygaUCO4jjwffdRYQ35mFnULVYKtlpTSr2
         NHsGPcZZ4Ck5RTw+UneynMefAFGqW4jY2LdZvX3S5iBQvtZZpf3hZOieucAkZf24jP9V
         NxADxxZhMnMZ1FL/SL8HTUDY6ROMGb323/c7WVSmvIz551S/ndHuV25o7mDAi9hg1ccq
         PKvBQP/BYKJM244I8ccBCcDKG4NhIg676rJptZyeAXQKxlYl94D2DZjm9gOjO6SQD5pl
         U8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465223; x=1792070023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
        b=Wwzpf38zqND0/gc9VFFUVXAv+C39QtimhOOuTa2L4tjgGRq+tLntuEunV1IF4+no2x
         htSeoJ1poXNHk9xf5qGfhfMuqkXyGYu6a7aq9t8UZEmXguBzsN/2nfIjo8sFe+0/oHSy
         ydMkDmWzihwzSYGLw5gaSlbwPV6MVOY3dICyB08iPcE9VyL+FOD8rQUFKb1CATByPADh
         hH4BLHYm8tsYEVpBPKIbJ6CHJyyvg578jeSRK9o6uUVVu6UM63I7ypgVpyZ4KqUnmYNJ
         XUvBqZQszMB6TyC266vI8S/b6CT+vHisdEW1KNS7z3tFaPZzeNKHNV6fXS9nWV+PxJw9
         tYMw==
X-Forwarded-Encrypted: i=1; AKwUvBxI3J0XMrlWa1jpuCFOXK8ZT8d0tTIb0hYuuUe8Ep/WuGwrpuZJSSrrIimxIcaQYSGy9l5JTNQ5P76YAuo=@vger.kernel.org
X-Gm-Message-State: AFuF++nX/GZF4WR00cruIWtLKXEP9O+9Mfy8+PZxrXNcTt2gGhtn02gk
	cuum1ynv5fPGkwuOcyK41twiykIRRUxAsnL/uc3KfqbFwj5YGVgXv040wMFSXmAnmsU=
X-Gm-Gg: AYBFou1YszFxHlj/5UP3M3GrjKgJLZRcuRkEHU79gfw5pgyOTz7w0pU3UTbCRWZVfVL
	xiQA4Qbh2Iz9VFqxmjvd8eHkx0Z/ik+KJ3KC5yzqvvaYuaKhB2o4JAgyFKo+7ghHZRWYclqJH+b
	UqTihmM0AvDLQfQ6ydY4FBTqqy2LirP2OUgLrQYswWda12QXvvR+Sv3tLcfH6qdxwHvLbbnDKAH
	KnSm2JCMGVMZc5ok2TxqraZfbEitld+8xRs8CH3ZDHuZyAI7RN+dCDKurEKYKSQv7lXGHCA55il
	5d5qIhvej9m8cNRvEX3ymqkCYnDBupIgt2a77lxwqwQzwBawrOVhAL/O+AzOFoFjfSBz9RjTNob
	eWSrlYPmCgAnk8aRJ52wiAF7eEO5TqHlROV2hTO9aKYUE0X8W5/zyqe8T9WZQ2rCt94bOI4y/cu
	TCdfN7G48f50wmhIM7OmqXZ/aMJ2quMnVO+zYTX8zQdQlRbYikc8Tk0685DBnm5GYP+YTv7I7Yu
	N6lbzLDVg==
X-Received: by 2002:a05:600c:19c7:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a180648d69mr101498205e9.24.1791465222920;
        Thu, 08 Oct 2026 06:13:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([185.194.184.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm221404825e9.2.2026.10.08.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:13:41 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:13:38 -0400
From: Gregory Price <gourry@gourry.net>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Dmitry Vyukov <dvyukov@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v5 05/11] kernel/api: add API specification for sys_open
Message-ID: <aseWPV6ZRQM3JOMN@gourry-fedora-PF4VCD3F>
References: <20261008084956.2911790-1-sashal@kernel.org>
 <20261008084956.2911790-6-sashal@kernel.org>
 <aseRXi7hMWBBc0tB@hallyn.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseRXi7hMWBBc0tB@hallyn.com>

On Thu, Oct 08, 2026 at 07:49:34AM -0500, Serge E. Hallyn wrote:
> On Thu, Oct 08, 2026 at 04:49:45AM -0400, Sasha Levin wrote:
> > Add KAPI-annotated kerneldoc for the sys_open system call in fs/open.c.
> > 
> > The specification documents parameter constraints (pathname, flags
> > bitmask, permission mode), 24 error conditions, locking requirements,
> > side effects, required capabilities, and usage examples.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> I know Kees and Jonathan and others asked for exactly this.  But one
> downside to this is it makes just paging through fs/open.c a lot more
> painful.  Maybe it's worth it.  Maybe "noone will ever do that again" bc
> that's why we have ai and tools.  But a) that's how I've historically
> done a lot of code research, b) IMO something like a manpages section 2
> under Documentation/ would be a great place for this, and c) we can also
> use tools to always sync these, or even show/edit in a single view when
> you want  ('kdocedit fs/open.c').
>

In many, many other projects i've worked on, these docs are placed in
the header as opposed to the .c file, but I understand there is some
pain that comes with ifdef.

Keeping it in the header ties the definition to exactly the location
external users import to find the function - so it makes sense.

But separating the contracts from the code guarantees they'll go stale,
so I don't think shoving it in Documentation/ does anyone any good.

~Gregory
