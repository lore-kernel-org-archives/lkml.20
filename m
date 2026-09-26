Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445003783D5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393582; cv=pass; b=VnVW+TuAv/omd3O1j0zf2s9Xl08NXLVH7xzeJjQOciEtfLRxcftt3B1ZluAADjiNuQF0OcwXyIIa88ZmXX4sJ5fIkupmJTvk/fyF2dxVXcB1Y2FU1trJZ0p4tpZ94XcMjfBaAIKX8Jz1Jkv2pcQnR6AmYxsMKuMD7lLZZqyIe8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393582; c=relaxed/simple;
	bh=Mrl9hnYjNzsvW5V/54263E3XvGLPbjPgQW7Qq+pl7+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twhNH3iaVZVexwq4/mCgPmZ2QpqbnGhtOTxIR0yho3yOQVaREt5zvNGgtclW0YGckqU1sqnkqqy7uh62mkD82ARXVl+kznhnQFI49a6F3j9PI8T+dEMlXWbe2BO5dhTJ7DgBGQViddA5lEsWAlkpuQTdR8o1jB3MFcMq3c5BgNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WVriEuJI; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WVriEuJI"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53328262efbso24511cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790393580; cv=none;
        d=google.com; s=arc-20260327;
        b=aQbEP0GOrCxJuGFYuzKdc2XMfGkEo9+Ke64yU3H/bLQ4mXAPLs3ug/XFmWO3fwbD5a
         HptZCIIqAVnjcoaks1Pd3BzllHNrFRdB9UuzcKsEg/VeduIV0CEizwUiF7t9AXdWBR5N
         mAuu1NfGkq16RMWsiy+pwqKIJ1dIRXj50SVVFb8SdH5FAFlX3g4ZDCTIleEgjjrST3+d
         13dC/FPiCVlPqtBXXAKigtma7rD8vp6kIO1QdtE0lkZJHK36d5AihjRaXmiQrQLN/Ni+
         +zbCX8KBqAuCx4oAho4cBV5zWYdyTLjAbSaMVTRhXUtBiQldrLgRLSj3hyzmFUSEiE/2
         fCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+uCSvMpSE+JPBUO8LTByUk9lpkLbBmHFzIVMWFzxgaw=;
        fh=/s5ElnPJM8e9vGkycDB79+Kbz5WMqhXwGWsWBG7VjS0=;
        b=l5WwNSlJrb3CiOwmBxeHYWD6Eqhqb1Diec8mm3P99VLEPNIpph/zABat7J6CwpXwc+
         XCb0gWP6cVwrZsK1S1mfRvp+I7m01KiYIFPt13sYdPQTBvwKZ3C9FUGKRRMgpBTPuAIE
         kUpkKHSMRtzhmJM6bQHhsbS04IbEC9uYVkJSEUfmjDX1R0ywdjRB/REaxa5RDziQzg+1
         xL2PEpWbjnBSAxS1RcTQuT0isIb8MpL67ORUg1aamsPcE2VXZ8nIGCjQbv0e/XyrfQxR
         fTTgnGyj9NLfqK5lXPxKoPrLyoUq7UUJO1Grl6g15GkmsAiB0JQZN9eaLxTLKknjP6M1
         Ksaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790393580; x=1790998380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+uCSvMpSE+JPBUO8LTByUk9lpkLbBmHFzIVMWFzxgaw=;
        b=WVriEuJItxd3dx61FWbAq2BFcTZ5g17EhX3ymbqaMvFMr0SU1/Qk9Z7qK0Qq1BNySw
         2P4AS3Gcx9lSPgWV+N7lWWhn4aBKfHRr1j9+oQQYQknOLL0t3LGSiLBQDI+0FmHEx7zF
         +XRIJ3fd5IysW/OVkjflA9lC7BBvFx09GyCXmkVcHQeKt1Np5jBA02TMV5KlJ54ys1TR
         ytXMVvjr1KV52Bxh8LxgQ6WoglKWgp65BdGo5ygO5PBG706a2esSlIj8Q8g+XlF+8N9B
         eV1RPc0FijG7WRsbQSOmV/ore9GvaNqn97DGD4qRUQ88hoobFl0/twideJJVFDX2hK9K
         kGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393580; x=1790998380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uCSvMpSE+JPBUO8LTByUk9lpkLbBmHFzIVMWFzxgaw=;
        b=XVVVfZgblKs4vT+FdxG6Mzt/bv5CsfxaG6xzNgCUD/vf/8DqOMNYFboWCNhkkIkfY/
         1QQF1zaDVNDfyGPqq+Wzm4otXxQaQ55C62bEiAzB+ZamDR9xa5L8hqcrMq7r8rgYMsWy
         WCVU/h9rdVSyLM1Nh99w91L+yJ0R5BwDe5fwkf/sL7EzdKVDmZBNgCTqQEKbis0xoSq7
         K5xr+ZCT2lK4tX0tBTCeti4nUBUDqkdfX8CZGhoBw+rnb5oNVnsl8a9sLvCH7/36hCAE
         YAbTb0MJe3Ns6ePP1ugJWHUogTiXbKKO3j7NQkmyjroP+cm8pKObeEI0rXMdEzV1+BuR
         wplw==
X-Forwarded-Encrypted: i=1; AKwUvBzrWHjxnV9vvlSNv8egNXlEeOSTLzc5rksSubgbDNBc0Km+kcuQLklmiVAAaHNTrDLJ9NeMa8Y8sDDN130=@vger.kernel.org
X-Gm-Message-State: AFuF++n/3XCpVzfL8on9A//jJ5NqCbgdWNiQolZ83gfvI+ZDb8Mrnp7g
	X+jkWlyvT+2ehgMls3x3cfQKb+5p64VIMvZPfGzEYEywqe9nmmSEJZHfDBzJpXTit/rcBukBmUj
	+Zt9xA17VuOGZ5v7ILQqJ1o7CYkYUZMKSXgGPIi8F
X-Gm-Gg: AYBFou16ZlAvkzJ0wCYFExhHE3jVw2kadtxIKURUtRELuytlYClHwoZg1c/OwoqURlE
	5jdDewSneThF3/Q4wn3hlycOz7mCWvOO+c0NiSvGvSRKQKWXpT/psyeY7wfe0pyFGD6m5BKPx7h
	3jWamWS42gXz3XoghudeUwE6uUPAAALgnNSxhI2fHTMYR8EI+UO4460eEYzK5idEK4UiBwos81J
	rNwf27pMneW+YbbFlQRHPi8M9anLRLeGgI4hUqGjNM/WyBXJ+3uTVmferuXXmwrZeDvcUBppxEe
	kroIo0zJ4JbuI+IDppsluH7eOc9ea6ZpzuBVTCH3YNDSU95FBAigAJM=
X-Received: by 2002:ac8:5c95:0:b0:532:eff9:ca08 with SMTP id
 d75a77b69052e-53320176517mr3678531cf.12.1790393579518; Fri, 25 Sep 2026
 20:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807071818.718751-1-irogers@google.com> <20260807111818.GN687043@noisy.programming.kicks-ass.net>
 <ao90ncOA2Ce8ezIc@google.com> <arc2CZ5SrPlI0hF_@google.com>
In-Reply-To: <arc2CZ5SrPlI0hF_@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 20:32:47 -0700
X-Gm-Features: AclHuK9Y-s7mwnYOc2bTtxVwmooo95aKKvfwHl6gj3vOPc0ZaRqs9Us7YYM1Bps
Message-ID: <CAP-5=fVbfU+eCqasH7U5366jgHzP-7+H5Lg_Vm5-C_-dt5ceKg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] perf/core, perf/tools: Add PERF_SAMPLE_BUILD_ID_OFFSET
 support
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Dmitrii Dolgov <9erthalion6@gmail.com>, Eric Biggers <ebiggers@kernel.org>, Zecheng Li <zli94@ncsu.edu>, 
	Gabriel Marin <gmx@google.com>, Tengda Wu <wutengda@huaweicloud.com>, 
	Derek Foreman <derek.foreman@collabora.com>, Tanushree Shah <tshah@linux.ibm.com>, 
	Ankur Arora <ankur.a.arora@oracle.com>, Aaron Tomlin <atomlin@atomlin.com>, tanze <tanze@kylinos.cn>, 
	Rui Qi <qirui.001@bytedance.com>, Howard Chu <howardchu95@gmail.com>, 
	Chuck Lever <cel@kernel.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Alessio Podda <aleph.pi.gh@gmail.com>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:03=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, Aug 26, 2026 at 04:19:57PM -0700, Namhyung Kim wrote:
> > Hello,
> >
> > On Fri, Aug 07, 2026 at 01:18:18PM +0200, Peter Zijlstra wrote:
> > > On Fri, Aug 07, 2026 at 12:18:10AM -0700, Ian Rogers wrote:
> > > > This patch series introduces PERF_SAMPLE_BUILD_ID_OFFSET to the
> > > > perf_event UAPI and implements full support across both the kernel
> > > > and perf tools.
> > > >
> > > > Background & Motivation:
> > > >
> > > > In order for perf to translate virtual addresses of samples into
> > > > symbols a file and offset within the file are needed. During event
> > > > synthesis perf will create mmap events to facilitate the translatio=
n
> > > > of a virtual address to a file and offset by modelling the address
> > > > space of a process. By directly recording in a sample the Build ID =
of
> > > > a file and the offset within it, no synthesis is necessary. The Bui=
ld
> > > > ID and offset as a pair are much larger than a virtual address, so
> > > > there is a trade-off between synthesis cost and extra size for
> > > > samples. These changes just facilitate Build ID and offset as a cho=
ice
> > > > for perf samples and the user can have the choice to use it when th=
ey
> > > > believe it is advantageous.
> > > >
> > > > In practice perf still needs to map a build ID to a file, so by
> > > > default this change keeps synthesis to allow this. It is expected a
> > > > user that knows their build IDs, say through debuginfod, will disab=
le
> > > > this option with say --synth=3Dno.
> > > >
> > > > The kernel support uses the existing build ID and offset support us=
ed
> > > > by BPF stack traces.
> > >
> > > That is still a giant stinking mess that needs to cleaned up.
> >
> > Then we can discuss how we want to handle that as well. :)
> >
> > I think this work would be useful on large systems with lots of tasks.
> > I've got reports it took too long on synthesis and timed out.  Also it'=
s
> > racy and easy to miss new tasks..
> >
> > So I think it's a good option to explore and maybe we can make default
> > once it turns out working great.  But I'm afraid it may need some kind
> > of optimization to handle multiple addresses like in callchains/LBRs.
>
> One more thought.
>
> Maybe it's not a good idea to traverse the VMA tree in NMI.  Can it use
> the deferred unwind framework to do that later?  We could extend it for
> non-callchain data like IP and BRANCH_STACKs for user space.

Thanks Namhyung! I will incorporate this in v2.

Ian

> Thanks,
> Namhyung
>
