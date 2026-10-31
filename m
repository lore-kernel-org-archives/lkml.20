Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466432;
	b=X26DczCqAnaBh4dFMZH0ETWBbO9gCgk+twRSruZYDnpApicu28dTKgn0Ax+3WUpgyKAP
	 g6/ZXgC4dQGrLUDtRQS1H6nGS0ALoVTG2zvwZ41kKiRXozCQ+l4nSMrupE/XogbiWBFoJ
	 HxbPZTm4ANwdHYlQlPlBW8zGVazfaKpCC2i/nAqI2eTXdpYb+dmEZ5uNQfY+xAZ7BZT/5
	 pd3XfQryAETpTFDQbyO74SIkTQGLL0alGxGYjt076l3kIBmyC7nhMkW/ns74WppBZywJP
	 arUERJR2iKqduIHXofEZza/jvd7bhmEoX9aRcDCiQraG7g3VLXnLZ5p9S2biK4mu0+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
	b=tSJ3PnVFywxEU5ehI8GNnOt1o4dx9SRhsdpdFfKtkcNImxzKmS506Ok9dYibaQMFE/iu
	 0Zae6/tDMBmshPvym2rz6GiW5PuaQDfpVpgCWScLdGVMtzYns4nz48r2bYpbOjrEq+5KK
	 kNPSCNss8VVly9ZG0X3TuE3Gob8iK4tDG1xULFLe4X7cy6GEe0Jvl+x1/pmnLCZ+ASkfw
	 5QTz29DNIiShQlzLfJ26d4ibWGAzxiNi6WQKqp9NcfYaBj5KNJDLF2jct3GOVn5AmFPn+
	 QqcC3f0DnseQLHokemk26IYC8OANhyNTTBlTt2tU0POT8AkxpaSrQxQ4jxuFGwf7j1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vXIZK/vH";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EB6606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6EB6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXIZK/vH
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so948095a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466431; x=1794071231; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
        b=vXIZK/vH67BDbgcwM4Cb7hOXrAAAQ5hvncYeaLI3z0CprXTvfb0bHlhdAEOjnEFbCl
         kUa6hwsWyXZYiWpHlHfpW4332fM6P3EL0Vy8yzFjo7A2OO2EsiNRAAR51TOafHkLAg+4
         gfsSR5lmtLwMBuqd6Rs0FwvvZWaS9WdZWwN+gRl8GK50NlG2ESNM8BjH2CNvYAcXotXc
         1nXaMPS4oXjaDFBqYWkXU4bv9ZKK1gJHBhqD2CW/O6L9Nhg0H60yMPu9i+wM1eA8xjAd
         lb8zbaNI3El31j4+LPN8YXN9JcSza/Fc1mg4nPCdxwip24m9MHV4woYMACgRUD5GjChd
         Jcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466431; x=1794071231;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
        b=KYTEKGCjkEvT/yzAaypz57mg3Y6bOSZsICHjglQcFJBT0BdLLwZN4un95MUj0w9Q6a
         G5fLAhRaXXjPbuS2hts61gWYoTrq8N18VMFfNcZ5c69PmKxGNLGiZ4mx6v+mSxI+ODdL
         anJYBh0MDure/P4BCIA1l/gwFDw61InSNhJnd0GXKTpzPhU9arFEdHYvSTXTc7O9CDcl
         mcnufheML4JwqHH95QMAfR8c3SWsThReC9v0Rr7ZtCDHetX3pnf5MG2DdbDqJKd+wJhb
         PGFxR39fzUJmOl+2hbGgM+Znoc0RHT2VUB1XXEIenc9JcfNzHkI/x0SEkF58tmMA+Umz
         +w3A==
X-Forwarded-Encrypted: i=1; AKwUvBz0l7QilpfIYRxVR54E22/UwX0HXkXde3TozxGuR+UlNyezTWrRO2fp2QdR9C7agOOtgKIMfrQ6Bn1UTqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK40ko0PJ3pwsLpRa3K+hBWznMyp1i24K76ddiEaP+jw2oPlAnV
	5kRZjtKDAOW7qGte/kfY46iLn3HVccK5y/q0rDsWfqSxIDmHUjXznmo+
X-Gm-Gg: AYBFou09CJ48qvIGB0iPCxGF1f19L59vUmWvhsPB4dqzvw9Aoa/h8lWCKq/nXMr5L1J
	5w1/m+Kpo4XcTkDiuMmKybyZXU0hU5umXQ98Dmz+dpE54pQhfKqOq0alI3AgP04AS6fzDSPI2BB
	DrWl6Ai4i1Qizg/2lERd98mnqpXPt/QXQKDM2eg1jSCHQeA0BnpVHiC5Z1JGM/Urhas1Z1A9cPs
	8jHr0aDTMARs3HgHfVMkaYwkY8XPDnGC+nv3Wjp0Qfkvr20QkU8rQ00jt5vImT5SROlb+8ggQDE
	AB2EIAbk0GuL4GSVHI6KXSa82X2oVOIY9vqvpRlhiHvPHoMRV1gyCra8nmlTCwFSz/UEkgzgDhm
	6yLsPxxi4hcsnMGKklfH2cNXmf5DUWE5Rw5yScyAeu0bBChAZ1vxUVpAmT+6m6qNTySyDqwEVQY
	jd0UD09V0fCnk+pvYh7p5iFscjmGxXaEcg6etBX3uVl47RX2NGOFgiaTr93h4wBRQqMB2tH++lP
	8TFPTWVDBKZnjjZHpxVKo+CEO0Bjj8Q9WKw6fPy2chgbLUPNuM8aX3ZN0yAggD5eL14CbAlJNb8
	Ik0tYD9lAOH6m5uyQUep3UB5egg5MHwRsBTuGAbd1YlUov/5fAkBoBdzciz+2hIo4BIB/r6pNpO
	cQ2/FwxflWm/G4xzTg7aifR24ZTENSxeTaQ==
X-Received: by 2002:a17:90b:5145:b0:3ac:9706:772c with SMTP id 98e67ed59e1d1-3ae8984cefamr5029531a91.60.1793466430956;
        Sat, 31 Oct 2026 10:07:10 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm12221824a91.16.2026.10.31.10.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:07:10 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:07:09 +0000
Message-Id: <DMJ6SFP2GD3X.1AW7OEM6GPY4Z@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alan Maguire"
 <almagui@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hazem Mohamed
 Abuelfotoh" <abuehaze@amazon.com>, "Bjoern Doebel" <doebel@amazon.de>,
 "Martin Pohlack" <mpohlack@amazon.de>, <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next 10/13] bpf: defer kfunc and struct_ops
 registrations until first BTF use
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261031130959.23472-11-wanjay@amazon.com>
References: <20261031130959.23472-1-wanjay@amazon.com> <20261031130959.23472-11-wanjay@amazon.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 06:09 AM Jay Wang <wanjay@amazon.com> wrote:
> The first use can run out of memory, also only because its task is
> being killed: vmalloc() gives up then.  A round that fails with
> -ENOMEM, in the parse or in a replayed registration, is not published:
> the new BTF is dropped with whatever was applied to it, the queue stays
> as it is, and the next caller starts over (a struct_ops ->init() then
> runs again with the new BTF; the in-tree ones only look types up or
> store the BTF pointer, which nothing can use before the BTF is
> published).

can we do the first use from a work item ?
A kworker has no signals and is never an OOM victim.
Then -ENOMEM is as unlikely as in an initcall today, and an error can
be final, like without the option.
workqueue_init() runs before the first initcall, so it works at boot.
No need for the retry, for btf_unparse_kept_modules() in patch 11 and
for ->init() that runs twice.

Something like this (not even compile tested):

static void btf_vmlinux_first_use(struct work_struct *work)
{
	struct btf *btf;

	guard(mutex)(&btf_vmlinux_lock);
	if (btf_vmlinux)
		return;
	btf = btf_parse_vmlinux();
	if (IS_ERR(btf)) {
		btf_drop_all_deferred(PTR_ERR(btf));
	} else {
		btf_vmlinux_new = btf;
		WRITE_ONCE(btf_vmlinux_builder, current);
		btf_apply_deferred();
		WRITE_ONCE(btf_vmlinux_builder, NULL);
		btf_vmlinux_new = NULL;
	}
	smp_store_release(&btf_vmlinux, btf);
}

static DECLARE_WORK(btf_vmlinux_work, btf_vmlinux_first_use);

struct btf *bpf_get_btf_vmlinux(void)
{
	struct btf *btf = smp_load_acquire(&btf_vmlinux);

	if (btf || !IS_ENABLED(CONFIG_DEBUG_INFO_BTF))
		return btf;
	if (btf_vmlinux_building())
		return btf_vmlinux_new;
	queue_work(system_dfl_wq, &btf_vmlinux_work);
	flush_work(&btf_vmlinux_work);
	return smp_load_acquire(&btf_vmlinux);
}

The undo has a hole already.
bpf_io_init() and bm_bpf_init() don't only look types up. They register
kfuncs. And bpf_struct_ops_desc_init() turns every ->init() error into
-EINVAL:

  btf_apply_deferred()
    __register_bpf_struct_ops(&bpf_ring_ops)
      bpf_struct_ops_desc_init()
        bpf_io_init()
          register_btf_kfunc_id_set()
            btf_populate_kfunc_set()      krealloc() fails
              btf_free_kfunc_set_tab()    frees all vmlinux kfunc sets
            returns -ENOMEM
        returns -EINVAL
    pr_warn(), next entry

The BTF is published. The kfunc sets that were applied before this
entry are gone until reboot.
