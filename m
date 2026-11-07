Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794011228;
	b=0HjAL1I2jFCso06hv783+/VaUrjRUdy3WJOqk24+UQJ6xgzCgUFWgppqmJa3CiJPx4UU
	 ReGAj9wvuraRNvQNJtinvvP8rrwyTFJKkrPfyFjIll6XIzypLYWcRsPHzEpkGv7231bAR
	 MYVYeul0xDoyc//DnMiUhl6TnahYSfVR5evcQS/hbrImgdqQsuE+ZtgbP31q7/px3q7gm
	 oUie4hx2qovCiy4iQ0Xqc2W+eZ/mV+dwjkGDQ8nCdus8iVbZxbHl2VrRwDrnYzaBFNWUI
	 t8WHElKOsJMCBCIYFE5x6NlwvQznbpPBKOz6+3XkIh/x5SwvcCPAGYAkO441OozibGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RZD5CYxZCQnzKKT8r/YP482c/5NnxygRQruQyxqCszs=;
	b=bI74vo3okERd3qW/27Hs2bPwpFSM2cynDPBNRQ6bhllbHrXc4mhF2alViUf5yBc2kbAE
	 UMhw9yvam9m1arUuh9qFYUTFDaHz5McPd7vcu+rrVy/IvJvgH54FAUGJ71nY+MReKuV4f
	 Nf3voAWd4NZQZEM9//7CDavJHpnGM/fErSRV3LGFNc9P2IyCCzNhQb6/8Si7iYH2CF0RJ
	 52QyqXtu7PMfkA3BnIgZf4Qvs5gkc9zTMp0/gEiUUi6D9gqZTXvpBi8l6JV0BtZ1FvaTr
	 RC0FAbdFsiJX6b49AS54Lh/F9hn6b7Z57vLNVvt8vLPD1WnPnCSkhYbfFfXr3sRXj3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLwbD45A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8F606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC8F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLwbD45A
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-537548b811aso8259781cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794011226; cv=none;
        d=google.com; s=arc-20260327;
        b=FiHhAxvdRJZSVThbkrp77kgHXCDqsUKQVkGVXFg/u+XWk4WorUHYdsCQuKSvR87Ke3
         NE0zVo0JT+RqKdPfxSh27tI/Y+/DGR2pPeYN2/lduOQhN5YoLYvthACOdNtT3kQ7OZJn
         TxmReSXaicOKD/eU9n6MiJtT8eOOT1Dve0Pf0PhFzFKEnCbZ4Uuc8VYxVPtSXUS7PvTg
         +dFUSN1XQ3K2J5ih/0RvcFxtaIc6XOKzkl96fUtIh+n0eWtqJ6pAZfJJzypyOkdCdLPq
         5FiRjUpzS+QiNsplQYcqzhewFq7kB7cFDzgUMf2MqGX/CnTQe2rBxYK6+FbfWxiv3q36
         apiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RZD5CYxZCQnzKKT8r/YP482c/5NnxygRQruQyxqCszs=;
        fh=6GqIM22dSa739ZkGyKuxvOMsGo7OuTqmceCZ1fKkF/U=;
        b=H+sumgBmDOujz/HamTqQgL6hBb5lXYgYhEsZY9yKeAGLBowZzlGSrDsBP6B3TUJ657
         yS4BGTtCIUNhXGOMv06TMmFE7nslp+K7ShjeSRrair2RvtUPUkee3eHHIWQzFDCz0/kb
         MXN/Ug/w5uPpBl6sblXGaPVY2/b7KjDUGhRNxpX4mlSZTnYgnyhSTzQ6ZhqYzcvmXfAn
         IevKLxKKNA4HyQ2NDGydWbalf/BoS/XEgR5jdQY0dZTw+uq/2LzgeIRCjBtlZDJDPPlj
         6Qj47LmtF0vnvBSlmVTsjyI+X+pcU4f+2zE9uIX08Iqp0ivg7Dc1pgqgVMYo/k3u5Xhh
         q/2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794011226; x=1794616026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZD5CYxZCQnzKKT8r/YP482c/5NnxygRQruQyxqCszs=;
        b=YLwbD45ANWkJsPa8lMr4ObPhrZseKxRrILCWAyZEPYIwknkOvX+XJevY2w9osGdDl3
         GFlnsW6X6hQvgnw+CvXtYPOtHX+aJv/mpljSqhMFj+yGF12KdsZWls4+cZuCSfD5C2XD
         75xHYnDT/lTBsOFEgts5UktQ8MuTSAA0pfvzX7m6s8dmJCJnAslsl7Jzki2y75KN9GV9
         RqHUN0yYcDso17hRp4lcwMNtjLy7liFzqqe47lVeCXSGp+U7INsOGqlJ2UhsA5Tl7kbc
         I1X7cn1QYteVMpbVWLCzapBC7CcAqHpLmmaTWZgVRu3MTEz+v49qbj1sXeKBxWiec2bJ
         0cZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011226; x=1794616026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZD5CYxZCQnzKKT8r/YP482c/5NnxygRQruQyxqCszs=;
        b=supOubRol01MFJI/0rwIp2T1iVoV046qCDWSbTcqX2OidiGA3HWk4xcv7Sp6vqQITS
         z7+uR8iyfUKRujwY3dLZIYpkfke8YJgYRC6SIQ985U7N6rg306pTMZGV7agJeE0nOyLF
         sTEWIQvu2O9JQKLOH4d9Lpuk2Ca1MlnbdTv/h39g6nc4UyWyLxQSD4AmXswHcZCz36/d
         1dJwr45+a0GYY62PzDsDOn+FlGI8V3pLBzqmGp+17xJotC/Hl+M4kqkqdDQUc/bn2YMs
         KJcmQxpQorTJ0gBt6hOgQhCzODBxtCKwI6hhrvdWvxVYFEvE+7jAjjrMHIOPyrEhQoMY
         FUnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn6/j4NBxsw6SGbPcD6Kjiqx5GV42HB+ZOlc5g4oABcT1fdiT/XYmHPI/9jACvwM6vjzZEA7MF4RZxmxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QOCZSb0Br8imY3hil/KWjbIvcOvhpjBfBS2aRxLrnRmaa00C8
	euT7pLCHB2/5e3mPSFvAwsIuUbfOhWda9ULeWF9WIpPO+/469HJI376DqJJckyEB0Mig0jChdfe
	d1KeiSE1pVwM45hDTsVDEIPz1qCEoz0Q=
X-Gm-Gg: AYBFou1ndrrizI2dtr2ol/V0FFe0uYKnh6idnKze5H2xwKqbRYjjwKwQ4N6nYer2zFq
	LPcFCxC7+VwHG/QmWlbjkngPZIjVai+md9KynfIpb2jDlF8tsbTnBg0Gc2nsTe9pgJJwelx3L7I
	fxVta/gwgFKuRAmdDMx/3AYZmppK3a67QCUSQ6OIijvFtDuPMvouvN/IjhNzBxy1/DFE5WPNQa5
	GEluQ9HZFwTAABU1bcdAFPaaTo0NYTHLjiBUQ2J8DvxRuhfmB54MdfinFMv83yWiYwa1eTr7jx6
	v0IzA0UogIR6e+OQNoumWlJledZEUs1h4g19JnTKPCSk7c0cJ3etKq2r8N6Gl8R0kkdaFr/je9Q
	kR1t3d845U+Ej0aRM2Nj2IdJBPXTE+kWwLs/3aAnYAIlT0IgvkCKFEfM3stq0oQqXRBFlHYWBsu
	T8uuCwAN3CcEwrqpfSuhJI7KR6XKAeU8tDe+ZhDDatgNuOzg80/AfDcYA=
X-Received: by 2002:a05:622a:1790:b0:535:ed1:cdbb with SMTP id
 d75a77b69052e-54e10500292mr69586751cf.1.1794011226306; Fri, 06 Nov 2026
 16:27:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030193237.1440673-1-thepacketgeek@gmail.com> <au18AJ94dUsE5PaQ@google.com>
In-Reply-To: <au18AJ94dUsE5PaQ@google.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Fri, 6 Nov 2026 16:26:54 -0800
X-Gm-Features: AclHuK_6N4pFWbDGZNFsXaX8wHmLg6IQTzl-OftZZtLJdtmw1P5hJarvleMvIB0
Message-ID: <CADvopvYeG74khivCbBR=LsFNAuqDzn94Wg+LA4PwscsQue510A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] perf unwind: Don't load symbols when the caller
 doesn't need them
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:04=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hello,
>
> On Fri, Oct 30, 2026 at 12:32:32PM -0700, Matthew Wood wrote:
> > When perf only needs to know which DSOs a callchain passes through (as
> > build-id marking does at the end of 'perf record' and in 'perf inject
> > -b') it resolves the callchain without symbols. The DWARF unwinders
> > ignore that and look up the symbol of every frame anyway, which loads
> > and demangles the whole symbol table of each DSO they visit.
> >
> > On arm64 every frame pointer sample also gets a short DWARF
> > unwind to find the leaf function's caller; since v6.17 (commit
> > 29be60c93d2d, "perf build-id: Mark DSO in sample callchains") the end o=
f
> > 'perf record -a --call-graph fp' loads the symbols of every user binary
> > it sampled. On a 128-CPU arm64 host,
> >
> >   perf record -a -e cycles:u --call-graph fp -- sleep 2
> >
> > never finishes writing perf.data, with over 1GB of heap growth in 5
> > seconds.
> >
> > Skipping the symbol lookup isn't enough because loading the
> > symbols also finds two things the unwinders depend on: the DSO's
> > build-id, which libdw needs to fall back to the build-id cache, and any
> > separate debuginfo file, through dso__symsrc_filename(), which is how
> > both unwinders find a .debug_frame there.
> >
> >   1: add dso__load_symsrc(), which does the same search for debuginfo
> >      and the build-id as symbol loading, but doesn't read any symbols
> >   2: pass the symbols flag down to the unwinders and honour it, using
> >      dso__load_symsrc() when symbols aren't wanted, which also makes
> >      the arm64 leaf frame caller unwind skip symbols
>
> Please don't.  I've added dso__dbginfo_type() to handle debug files and
> that's the correct way to get the file.  Probably dso__debuginfo() would
> work for you.
>
> I was working on cleaning up this area, but sidetracked by other things.
> I hope to find time for it soon but you can go with the above helpers.
>
> Thanks,
> Namhyung
>

Hi Namhyung, thanks for the feedback. I'll look into those helpers and see =
about
using them instead.

Can you confirm if the premise of the issue I'm reporting and trying
to fix seems
valid? Would saving this unnecessary work of symbol lookup when they're
unused be part of your cleanup?

Regards,
Mat
