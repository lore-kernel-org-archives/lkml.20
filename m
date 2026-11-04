Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758873;
	b=f9zR/v8kPzYV3ZSj55rJ7DDaVsLjsKsFo39D8AJAfR6AHfWRJtM0BCsNuhu/LextlNB/
	 VV3sIQdaCbpodp6LYEsE2cAvMbh2XQ/THlMUy2WRHaN3eDAho+fQyYzRhpYk72x/O+BJR
	 E/HDUM3g3eum1CmACj9KtA39f+38cf/LA4Ow/3AXmgsK3VGaycmaAGDJ5qXo5T9/M2H3w
	 I4mi74okinZUeALjSoJAjeZHQcaAidiFpOKhexK9ypeQMxe/W12VsB+shIahpmvGWy13F
	 g5dTKs8WOE7veAsZOZZDUUD/m2N1k4262HgFRVSu5KFJGa63fb8jtHJ9L+HlzleuVMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=3kL9nPKcOeNL1nqkLRFVJC2yAbsuis72ch1sU7/sTFE=;
	b=IPMhAbzl+dZ8Djr6r++1qlY6mcZybEFoq7ARxc+0ul8nlNCH70cnC8Onz3Q5PYyvx9Uy
	 zDOoGlHVJO5x0ReG8xK2CcHqGiA4w4fAud7FE8PxAaxAw4KTMDmWUX6kKB2rC6Zgy38oX
	 lwWbpHKB9Su0lm7llMuonePogL8btFtH6Rrd/ZuZ3/9JhfjfQab0gf4+opGHl5vAOnp2n
	 U6aF1ZBnpe7rsVdNiGBYagSbLkRu/pB+KccKRDD085DGShGw7Nh+IUaOpFxKTb89TQRdk
	 9fjrDFllFOh5je9K+giHoL0XP1noAqxIO3FG+bkxfQUfex2Jd/ujIhcki2VYrl1Tt9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufKTEGLW;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EDE606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EDE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufKTEGLW
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so176995b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758873; x=1794363673; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kL9nPKcOeNL1nqkLRFVJC2yAbsuis72ch1sU7/sTFE=;
        b=ufKTEGLWP6UzLiCvOprUKER8FGsbqdunjCzIauuX5gywzqqPVl+M04XmyTRhrXyYRY
         OLHdnvsB2Q3L2/l4WIvSgLWPqGq3jbQBp8VKXEuSKCkxD0svr0yCR4LmWr7yryrJc2bB
         YeBWHIeqqmDfWaK1aYk2NE/L/4cR3rj5zLhms+3FPKYh3/Ja/uvm0m3HxJeF28j0WRDj
         DGp9zVTDFdSq2pixbJ67BHxlrsa3M6as7tc/hgtMq2JeTR3ApTTvZjRj3zCN8OhiobmG
         4Yev4utAiH/WQ44huAkHJDNInnMcXRlSSj98SGnMtvV+DWBAYiyFj1/qP2Mu+J97hzkx
         Jdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758873; x=1794363673;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kL9nPKcOeNL1nqkLRFVJC2yAbsuis72ch1sU7/sTFE=;
        b=GNjWW6xA+T7dRMSj/Kb2GlDCS7JOsaXKjJ2CNP4oFcjZUC++2jOBAn8d6t627CmLVA
         ZYh0YrQFWftEE/rGMvyUqvek7Xla84QnjlyYVZrQwXkVDHtBXrMSGGhOoIQyjeEyNc1Z
         mSVQY1tGeYHtkcxCntRn79oOyl9UiCpjAB3BKNVB09YFBpS9Mfm5iRQp6Up9DXMP83ll
         dwqZTmeP2fVDfEsrNRJ7JSLpXpuVw1WwD/RI0pUJ4bAi/OmB38JihOCu1R96YfBaF7ta
         l9xiovPPEKeKM/icDlKbbSbXHe7/F1LFBZi2U1gh4Xqf0zRwwcE1sL+bn/1ZW46z93g4
         RqzQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5zgN9EfUQyU4Id3Hk38JMe/Ghs/pFn4E2beP2pjsnhUImXxzB9ar2A8W3AQwuYaqeTLqTBJH/YtOOMS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rkhm6ziPb++lQD5vd+EDQBg1XimWvPa40Rq3/ISYqjrWovqrq
	bleYvOmtw2bVqL2X5nPUlDX2CuqfynXrlfYIuYdsIFBrl7a8LorXZNvi
X-Gm-Gg: AYBFou2mD1NueojrTQPTW8VL80egk1tgI4Af2scfGUy1XmJj61v72Eg2HWBNJux/3gX
	Jewo9ztkLxje76u+EiMBhwvd4OjD8hYSDZ5p53IYPNGC2xqDhdOhWLN34PfTIfVi5V/3ql8DBon
	6fvxlPpLVigeVD2xqHWVsbVgfhcwxLM0A/2Wmso4lHSSjPEV0eZ15w0bODP5zwaf3+6mvxVwdnu
	8gxN8HQUPHRKYgcgVDp+lSdslzj/N1mZ5lq9tX/V7BeLUOwkQhtid/EV9hJfbIa8zVmKj6M0PXN
	v0KrIGJehEuYFMx/K+q3Ny45TVdnnFoV+jRoWcGOCWcTUycmBwWbEKN/NB5UJwhZK67im/Xwk2z
	H6wU4rtODIgrZysdDTm74KUImlcM48UkEj5xRrjzZJpEaMzlBEiEsxa2FLXAoacpZCjtgxigg/9
	X4DWjIBnbNSkORQ4my4XPouQiVmLAudGu9TDtDo8s5T922pu7lzSdl2YQTGr3tUBK3noDKEfJ94
	sKhDLKNsLN3TNbChRXsNKLrTtH89/HxrWQyFq/smTYc84+CSUouy4+cnwnpQD30ItNvsr/LkG1C
	2ViPu391NBa9VeCngC7IhnjQiORKYZVC/+JltMooiNU2zMXCUx44DEqsB4XhbhiuW4fWMZVSLSX
	I7YGsdRv29ZqYADPkCcYdtHlHiI1+CBelgXA=
X-Received: by 2002:a05:6a00:230b:b0:89f:6989:cb9b with SMTP id d2e1a72fcca58-8a9beb6284emr11317502b3a.27.1793758872638;
        Tue, 03 Nov 2026 18:21:12 -0800 (PST)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b470b7esm233999b3a.32.2026.11.03.18.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:21:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 02:21:11 +0000
Message-Id: <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com>
To: "JP Kobryn" <jp.kobryn@linux.dev>, <mikeba@sentinelone.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption cause false
 recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
In-Reply-To: <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>

On Tue Nov 3, 2026 at 11:46 PM UTC, JP Kobryn wrote:
> On 10/30/26 3:22 PM, Alexei Starovoitov wrote:
>> On Sun, Oct 25, 2026 at 04:02 AM Mike Bazov via B4 Relay <devnull+mikeba=
.sentinelone.com@kernel.org> wrote:
>>=20
>>> Is disabling preemption in __bpf_prog_enter_recur() on !PREEMPT_RT the
>>> preferred fix for fentry/fexit, or would you prefer a different
>>> mechanism for reconciling preemptible execution with prog->active and
>>> the per-CPU private stack?
>>=20
>> No.
>> We cannot disable preemption, since progs are not short
>> with may_goto they can take 1/4 sec.
>
>
> Seeing this issue as well. This patch opts in ALL non-sleepable programs
> with trampolines. Alexei, would your thoughts be the same if there was
> an opt-in approach, like a libbpf annotation "fentry.nonpreempt", for
> select programs? A patch like this could then check if
> program->nonpreempt is set.

I don't think it's a good idea. Try bpf_preemt_disable(), as I mentioned
in the other reply.
