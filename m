Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645AC3033CB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536558; cv=pass; b=JtRKgxCXSlFES5FlOkdCVEp8Ievp23lx2wG6q8Z0XPa50cg932GlxGB7sYvBMS6I/8IH/Rji9RW1tAfzviwvBXUFpg9ohIKerhpjpdnf4XgX9Am/FG2pQB1mkx85qPmPM+CpejCcjiBE2JZKeeGGUojgGJhR6aPCJ4x9bxP5sF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536558; c=relaxed/simple;
	bh=CXv4XcVzsFki/2eiawzhWx6Ex2lOhlOoQIZQNxAZHec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzpPkfpVgYxsKMppgB8NUfJhtriefOj6lxL1ucs9SABEul3n4sIA9jyv9UvmO+0f5PmAXEzhKTJwcGnZFn5Qb6WDJt2bKjshTUnxozDKk4zgbwLYWE1FGRFmNgZ4YgIlDlAm0+xdJdhuwrQkXCSvOMvyjuEeek/s3c1OQjbKlMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyN5NhzI; arc=pass smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyN5NhzI"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso423464a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789536557; cv=none;
        d=google.com; s=arc-20260327;
        b=gCbPdO0+ZqZk5qGMNg8kIsIw3wcgcoN1gbX0jv2yCcBhsMztm7ClZxsWaX9lHDiyGB
         cSS3IzMC1moHO5biITlxAvdIcIjXP2E8Nncogw7cQbtjY6Y7vNTEz3ULXMDyfZCiMzbh
         Ns/R6mBwmAutM6Zqf//NFah/z8m+inffOmKErI6zA1U5/gm8WxFMQ4vej7PpwYLt355a
         RgJcW1J3CBALHldD45cBCK40NZTZMmnVF+cxld5ZEoEU2URX3Ci7A9nsEQnGn0a3ojYO
         pawMi+8fXDHN1hg+wNlV1/5w5kWKY4uplgdjBKTnSUiunI+qbgjrWd+C6ThtakJ24Nr3
         lMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CXv4XcVzsFki/2eiawzhWx6Ex2lOhlOoQIZQNxAZHec=;
        fh=vCUrkwxz/5GAi8atT0H4X3ojG0szk+hhZdONqaUYJGw=;
        b=XnalWqSREmQyy1pjIhCB3HLbDBjwztJwQf2VW/y0JsLHBsIcE1x0BuOExzhtZuHax0
         P8RqnoXAfHK3e+qGMaMC6M+Ythux7VGZfSYfv5ncuLyUJucUzgZTSfVnPkGTHk6cnFQX
         /APjgSLltXPjE+ViX/Yx9x76WDzoX6UIEu5tm3fy5rKUMyopwpR/NrNlndahx2zdrfWy
         LHVEsdEU765tTuy9QhMr0ERLBkrFJenqiw2ry91KGo0jFSTZNemI5mWt+SnNd2TvWY9b
         Zh14ZsyWI3723RnY69ORV13mwBqGkEJNUVLIaaeWRGQug6i4sT5zzYBPnTVDMUIiIYpU
         HbKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789536557; x=1790141357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXv4XcVzsFki/2eiawzhWx6Ex2lOhlOoQIZQNxAZHec=;
        b=MyN5NhzITYCavQ1T64wVj6Hn4LpAWgTdVfgT0VkjwGx/hMhzPvVUaJ7/1fMyz4bkyS
         zNn+GhCv9F+TVFgUMDI4V1nb2nd4zkwEiMztVH9xTEBTTohCp/cdkbo8t/ANyIVO/w9y
         tDA8hRBf1spX3qbJf2dXvyLAReb0/KAIE8LX2ok2MCcUAft+USJn65aUkrFM4RPJlZR8
         Q0R2l11zH8ZEn1UwygfgsfUSrkn87CaiT7YemsRRZxUprAHty4YrPuDff+iCINr9+Otz
         VUJkifXIPao82fh1avU5D4RLCKV+O1gpD6NOUoaVJmylDtgSyE+UaboBKD10mM1QDAUC
         vmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536557; x=1790141357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXv4XcVzsFki/2eiawzhWx6Ex2lOhlOoQIZQNxAZHec=;
        b=MC/TwpMyB6o35rbjJLKfeIPuftrOC/oPkcLUxWgHwCyBmehdKIBxdVN/7mpyjZmlDu
         pY1p65r5zZgAIwYqGQNJxMbpNjz3RLltw+kO5FHkKS6jzHKvLydc8INucJPAkFO4mZbq
         6T2DKeSYCCcf+QMA8J8/LDAq7YaYSsQUJs2fJAyVK86LT5HaJoC8J64DJmnnPObv+YK6
         KS+CJyn3W/IytTzOIq9cnjjiiWA/7l8iD9XeXsGGBbnEpVCZ2jLUKTATiwUgV71cT6mR
         PVtKiYDQkbzmU5hoanTn/FriaKHBYxbwnL6a3pANjt6F2ajPdqQRR7h5lJRVQ7FGPteo
         gT0w==
X-Forwarded-Encrypted: i=1; AKwUvBygv+FXRhJHEPWNBF1RGcx2xJY6/aXvvzXl3Ni1rbdMLNNVz3ElnRxV/YJ35I9oEdsmxISE7Jsib4w1REM=@vger.kernel.org
X-Gm-Message-State: AFuF++nIr6q3POBH+CVlpf7xJeVVZ0IjzHeDEWz91N9xG+8V86mQK/Fz
	HRSwBQonaduEQ2GOdi4Rt49lzPAgatAghyM4RWtRXolbxkpwuS8oFYZAcIz0z70RKJTsp7Fg8B5
	UScFf1kH1yHLPX+1yhPNtJ32CDsQuT04=
X-Gm-Gg: AYBFou3vmwMSLttiTfzpYPzTIEJWz6cWXcIfxZYEnKoCFg8cMvyc/bdjIF6xiBWGvr/
	Hs2mNU++1iHpAYSaeo/MCLW7SzXO/CcrjxqQw0GJwxdwIqCbaHblyRrBhto3yedb43Yt/UVWvZg
	tRvGqu5QWdkXmuAI5d0R/tsfwwWHzOY4au6Ja77NINaeELAoy0XhWxvx7dodqd/0mx+hb7evGEB
	pt44JCHFMqFLqpei2WzkTIkIAUsLY05INKJY/msTF72VxbO5FZ8EeFlUEzoNtlRDIA9jaLr2hLY
	KqBzP69UVTqOlutqVdnKSnCJpv8VF2mYkangnUlSxHjm9xUBk4PJxB6yIJeoGdhC+hAkH9pLrNx
	sB7zeqqDSDzPL1OuAF70lhn9KJotnh5giZeTPPfU=
X-Received: by 2002:a05:6a20:7d9d:b0:3d3:adad:f172 with SMTP id
 adf61e73a8af0-3dd5f72bc69mr3018415637.20.1789536556549; Tue, 15 Sep 2026
 22:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912095924.866254-1-florent.revest@linux.dev>
 <20260912095924.866254-2-florent.revest@linux.dev> <DLDHKKLCOAVR.3PHQ832S121Q2@gmail.com>
 <DLG3Y32QQ9JU.3LNSYXLJIGH17@linux.dev>
In-Reply-To: <DLG3Y32QQ9JU.3LNSYXLJIGH17@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 15 Sep 2026 22:29:05 -0700
X-Gm-Features: AcwNN1VApFqHfiZtUBpFi7XpRtICUs_9AuNRI0X7lGIQvOJrfcWs4IpoTgHfoXA
Message-ID: <CAADnVQL=sW1-UOUbP_j98G2eY4MPzQd=HbP-7q5-sjqFQya=Rw@mail.gmail.com>
Subject: Re: [PATCH bpf v2 1/2] bpf: Skip detached progs in trampoline images
 that are still in use
To: Florent Revest <florent.revest@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Leon Hwang <leon.hwang@linux.dev>, Junseo Lim <zirajs7@gmail.com>, 
	Sechang Lim <rhkrqnwk98@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy <chleroy@kernel.org>, 
	Naveen N Rao <naveen@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Hengqi Chen <hengqi.chen@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:39=E2=80=AFAM Florent Revest
<florent.revest@linux.dev> wrote:
>
>
> Ah yeah, I tried to address that in the cover letter. Basically, if we pa=
tch
> all the nops, tasks running in the old image could skip some progs that a=
re
> still attached. For fexit, that's already what happens with ip_after_call=
 but
> for fmod_ret it would be new and this would cause for example an LSM prog=
's
> verdict to get skipped when another prog gets attached to the same hook. =
That's
> why I thought that patching only the detached prog's nop would be better =
and
> needed these extra pointers. But it's a bit of an edge case and I don't h=
ave a
> strong opinion on it.

Hmm. Not sure I agree with your reasoning.
fmod_ret progs are called _before_ orig_call.
So fentry+fmod_ret are in the same category.
Adding/removing a prog to the trampoline causes regeneration
of the trampoline.
So cpus may execute different numbers of progs already.
The race is inevitable.
With 'patch all nops in old tramp' approach the only
additional race is some of the fentry/fmod_ret progs
will get skipped in old tramp.

If the concern of a tiny window where old tramp is started
to be destroyed, then fentry prog is called and we patched
another fentry, but tramp will continue and execute orig_call,
then, yes, I see the issue, but it's a lot more subtle.
If I understood the concern correctly then let's add
another 'jump over the call' nop in addition to
'patch nops in front of all progs' and
let's patch 'jump over the call' _first_.
This way fentry/fmod_ret progs can never miss
execution of orig_call. They can be invoked "unncessarily".
They may execute though orig_call will not fire.
but that's an acceptable race. Better than not executing
fmod_ret while letting orig_call to go through.

This is still simpler implementation than link-list all all extra book keep=
ing.
