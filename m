Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792880658;
	b=gP8KOZ589x6mUMFus8I/fN91349AZHBFON3D3nuP+xFLJXtE+VRAA2aKm2TQ2S/8J8rF
	 0I7yFg32F4XqbBczPj4FZtvWIjvZX9oplnRrZ3v3B8rGqvL4AmGKsFU9a3TTVKJWHZ/es
	 KMk+QdGi0j4mK1W7hxbH1U0TyeN0pRGp6Xnam8yuvKozT6CO0bUSjDoBcADGF4NvFfSoS
	 AMAZa+/9pzJ/9TRXJPs8zNFxjTu4oO9D6sO5ldvrX2ZULBHhPYvTJzJJvlrOYtEbJqPTN
	 982aAiZw9ixBCaHpWeJsWgQdQKnq6UMFS2n2dp2dkzr0Sgs16wAEW8QN9FQ3OcoKNaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792880658;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZO95lvl9Nqr2fnKfjhNvY3odHppkPAvE0sy9YV0MAyE=;
	b=CIyQhF2pn7x0IxsYAQ/oolLzvyW4FONYb10QxxnS7zV2V+1UHJfvslu5FD6U3XNR1gwz
	 16xwpNvus7Q99FvqI9Tn+whYz8Ey1ogUC3nbW5bLZLR590DLryc6oeymF01dkS9Uu1HTa
	 anudjKxbf96th6fdQ0TJdAc+s85l7/8yUSHspfBr+F3vU6yLaR0x/YymGrQRTWoebM5Bk
	 j/HPxXy+qTNHuG0QHLL5sb+9NNVUcjw2bkYryvVMnnKJlVpPSSZ9STSD2+xRz/AVtO8UO
	 hywTdYN8trha+dFFA67kurC91GpZ4pCzMRwFpDqEOu2g/5hRjVLKTmq6j0Ja9T8YMUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DcwlgpnI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A1606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DcwlgpnI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9351F01825
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792880657;
	bh=ZO95lvl9Nqr2fnKfjhNvY3odHppkPAvE0sy9YV0MAyE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DcwlgpnI8DL+2mapwB28c0Uuo/uZkOQbIkpHc/v1SllyC8AnQiHsey8hJ4aUWdbT4
	 prMadH1kOhGswoIzNgX1P+u7U3KoTwqUBcWHh2XYWZ5bxDbPXCFaxmk+P2urzWr1Rm
	 tN/5ED+hsmoVE+0QG0XA0UDNI4BCf1ZefiXFb5Qd5/jU4/xxPiEDB4jLllmx0hbm3K
	 EN3bqey/NcRl3d0IV+S3TGGgleI5BqCIn+v74y01Z2wbeUWXGv7IvSemJyMiXrTytO
	 jmFrvEKOiSx/o2gKOwmTm2S066vyIZyZSIob0mQDj8qkp6Et+Vy3xhiiFLqwSXFeD6
	 V70By5SJLar2w==
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91befbcad6dso33795856d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwfI+M+q1QlEX/Lc0lRXu77+uABMEVDS8rtSivyh5PYilvekDUb8zkVA6atcXg2ZHmXLcbVS6L0RS8qSqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk4YYDhxbOAU+CqoOCPhPXyD/Ad/McpZJXWG9bLV847vMgwbK4
	CZ0Yo0+XZFb0Yl1oUyc40fHn+ZWz7xzgvaaWzuUNDLOyjyyJPnmzcf6+PofyYZBOrmQpNfCRaJr
	E18Io2EcrM1nAlzGKHdYSMGxq8LY9uqU=
X-Received: by 2002:a05:620a:2616:b0:93e:c06a:7313 with SMTP id
 af79cd13be357-940ef914186mr385330485a.13.1792880657009; Sat, 24 Oct 2026
 15:24:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019034426.2354049-1-ridong.chen@linux.dev> <20261019042308.2372396-2-ridong.chen@linux.dev>
In-Reply-To: <20261019042308.2372396-2-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Sun, 25 Oct 2026 06:24:06 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z7u_PtSkjm+kH7JX_ZZDLSnGr1teHq6By0ovgB23O8_w@mail.gmail.com>
X-Gm-Features: AclHuK9i0KBXAHQuNAppLi1kJlXPAo77Un_nGJoXjbM4tmAAAAcT3v5pEG65SEY
Message-ID: <CAGsJ_4z7u_PtSkjm+kH7JX_ZZDLSnGr1teHq6By0ovgB23O8_w@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] mm/vmscan: pass scan_control to mm_vmscan_balance_pgdat_end
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Dave Chinner <david@fromorbit.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, bpf@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:24=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev=
> wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> balance_pgdat() passes sc.order and sc.nr_reclaimed to
> mm_vmscan_balance_pgdat_end as bare arguments. Pass the enclosing
> struct scan_control instead and read the fields out in TP_fast_assign,
> consistent with the other reclaim tracepoints. highest_zoneidx stays a
> separate argument: it is a balance_pgdat() parameter, and
> sc.reclaim_idx may differ from it by the time the end event fires.
>
> No functional change. The tracefs event format (TP_STRUCT__entry and
> TP_printk) is unchanged, so tracefs-based consumers are unaffected.
> BPF programs attached via raw_tp/tp_btf see the new TP_PROTO and need
> to be adjusted; tracepoints are not a stable ABI (see
> Documentation/bpf/bpf_design_QA.rst).
>
> Assisted-by: LLM
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>

Could we combine patches 4=E2=80=937 into a single patch? The changes
seem a bit too scattered across separate patches.

Best Regards
Barry
