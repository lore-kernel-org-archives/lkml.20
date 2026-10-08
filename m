Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7AB3BB12B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458353; cv=none; b=rUI5sjmao1+T5bdIoKEnlLTc++IDdrwji35pY9kUEGi+++nAvTsAlHOmdEidIMsXcSeevZ0grpnvsvM/F24HAriEQVm4jFOOOKe+Lk26YWS6lomQDk3ahvYPVvZNFJhJy7WHHsG7ZMa761F6PljeXRpzKZ3ZPlHdncNeXtHFiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458353; c=relaxed/simple;
	bh=2iWKgdjnY/WKT1NRrSPFsVEZgqb3q8rtw1j3YXKRPfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIgRef65KObjPvarfAny+fOW02A1HZZ1RUaaKVwgO0Uo9E0o1TijnTN/VfjyflWM2fYGgXwF0QTagKDFDSwAhNEOJLD2QVggfViTHHKf0sK/UGrOIr0N6fPCSihx3BVo/yh9XeDRsRtF1E8eJkVwMunOS2DMZt9DY0EaKoqDEAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBMzf+6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBMzf+6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6BA1F000FF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791458351;
	bh=NZcC7/xg5SS/eaNUvNNF7JTQ0EBiXnoG/PlgqRlweyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eBMzf+6EF3yoxA2GSItVqlvzFmLvbXr3/eiYJXN/LcbGanoG1kPTf4VZbze+iqZw3
	 bS+qdBnanUi2wF7hhQXyt8PjSa+cN5/ObykHyfNAgIXXifECFrrjYEHn13BHtOFZPm
	 GoLhtoSlZ8SZ0tbaFS+JWeKh3nQy/42TEmbdVo+zeJO6LlBed7dSlzxUXjUPnrHI8P
	 aO+SnsutNruivNAGpLBajaNXrAVLCk1bXb/hElYHPIEg/hdgOBhSjNoU5qZUNjW3SN
	 g3M1qkoZlVQtE4SVKGLMMf9YAIZFyXX77bcFzUuniM8C4ZtXasdL5n2p80I94F5A/O
	 vaeZYuq/KjKwA==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e441e14a1so400834885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:19:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzvRSDSV9lY7xPSnrmewQVtTUkD/CESfm2rSanhULfaQHqCb4uOhGSpgnX8sbcgw4SwLIRz7CFwHcpIb1c=@vger.kernel.org
X-Gm-Message-State: AFuF++mKg5c0lJJdQvAr3rokMpbIFG60sDB8346H6oxCEQxNYLuykJrk
	SDjlLMMibpSSMi8tHIUCWrc/2dN6BniZ9h8w3ZLNnePM29xXUeXk/8gphqDsEDyqePR0+XTgtA8
	vid2V+VxoIWGIDRIVaSgpXs6d2Q4PogM=
X-Received: by 2002:a05:620a:4709:b0:939:761c:4f59 with SMTP id
 af79cd13be357-93e9b76c78amr924707585a.16.1791458351308; Thu, 08 Oct 2026
 04:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008070928.113530-1-hui.zhu@linux.dev>
In-Reply-To: <20261008070928.113530-1-hui.zhu@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Thu, 8 Oct 2026 19:19:00 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wW=XXe6=1GucvA1pUSkhLCosJh+bc0-97cYGGWW=MtPw@mail.gmail.com>
X-Gm-Features: AclHuK9Y4gxfKhBzGtl0K9V-EYLUU5MKewRW9HUXdq9571fi07WGLf_34qgAkY8
Message-ID: <CAGsJ_4wW=XXe6=1GucvA1pUSkhLCosJh+bc0-97cYGGWW=MtPw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3] selftests/bpf: Add bpf_proactive_reclaim test
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, JP Kobryn <inwardvessel@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:10=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> bpf_proactive_reclaim() performs one bounded reclaim pass per call and,
> unlike a write to memory.reclaim, does not retry until the goal is
> reached.
>
> Charge 32 MiB of page cache to a cgroup, ask for all of it in one call,
> and check that the result is positive but well below the request: one
> pass is capped at MEMCG_CHARGE_BATCH pages, far short of 32 MiB on both
> 4K and 64K page kernels.
>
> The test deliberately covers only the kfunc itself. A full example of
> the intended asynchronous use, where a BPF program watches one cgroup's
> workingset refaults and reclaims another one from bpf_wq callbacks, is
> maintained out of tree at [1], released under GPLv2.
>
> Add CONFIG_MEMCG to the config fragment, without which mm/bpf_memcontrol.=
c
> is not built at all.
>
> [1] https://github.com/teawater/memcg-async-reclaim
>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
[...]

> +
> +       /*
> +        * Both candidate directories can be tmpfs (initramfs-based CI, f=
or
> +        * instance). That is an environment limitation, not a test failu=
re.
> +        */
> +       dir =3D workload_dir();
> +       if (!dir) {
> +               test__skip();
> +               return;
> +       }
> +
> +       snprintf(data_file, sizeof(data_file),
> +                "%s/memcg_proactive_reclaim_XXXXXX", dir);
> +       data_fd =3D mkstemp(data_file);

If we can't write to the directory, will `mkstemp()` fail?
Should we check `access(dir, W_OK)` first?

> +       if (!ASSERT_GE(data_fd, 0, "mkstemp"))
> +               return;
> +

Best Regards
Barry
