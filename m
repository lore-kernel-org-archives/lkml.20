Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792792041;
	b=V/KxeDAuoSzkvRMpF5pyPPD7dQUDMw+WRXq0tihrrsbvMVwMuBJNKBayfmgOGX0Rq+8Z
	 iWVTjBvql3gVG8hcQe4NmlVKK45ItHiDCXRvVwRIt2RrIyRNIUEqsRYYuYdyQ4hrK9J6v
	 XWdNNmPoF6u8ek+4bAFEv09s1BQB3c+RaesPPm9m43NJFQGmSLZjMhrD+GVRng19Ignxb
	 tIkqc3HF8TmkLDZJZKGhOlujyDMsQgNCWaiG8BtaNqxo8p29CA4Ry4p6XYXnnSeUbQk28
	 Q+BUtHuovmtTgRlqydZUIKwCoWTqra5qeu9RHrm8V5ffkpPKqGPVHPUICAZFwiLaNnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xPSo9ItcVa4fj2ri5oc6bVUN+cUX/ExSvpmY9Grzytk=;
	b=HDiBk/bw3MM1D+lntOWtrjQ0Zwj8fAWzb/kzOOcasvQcEzwmn3OBXRjm81FMKCyZebVP
	 rewHbUTt+YHvyJ5sd6GlEXy4ckquXBWvlM/I1hpLtrhDzszhlSWQ16remuvns2Di/Dz0a
	 GOpT/jbwdeWYRuIH5fNatjCMw0n4H+5eSgTHvj4Yykvf6hqu1GIT3CEt3yen5ws06ebmC
	 ELptxbB+KAV5Wm/P2rlEkmn4jv4IRMha64BazcJyWeZYKIDEQvxjjSGbIUGU3Nu7I64XV
	 IAmT/ss1cvPviXPlOAwx84mwQy2PN2hxDyX1byuMle5P5sOh4Ch0ipMDcbnViqE49Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLDmu77i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2207606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2207606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLDmu77i
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so794180a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792792040; cv=none;
        d=google.com; s=arc-20260327;
        b=j5aS6Gy+qRMXgR4XXnl2yL3n/TDk1nuP76dSUc1KiQflFNsvtCeIvKI/6aR/Gb2q58
         qM+W1zYBxISi3+sCVNAlpL6e/U4/D4e+ZeBSFkWQ4uBDK14SLFsuUvb1jvLtQ1KVjRqC
         Fz81wH+dztem/ujnytFjcCKWn/Fq/FiUP6YCeUouMSr9yQejEYaDl7w3XLaV2BP5Nmqw
         H6wj6Wga/CQDhnZ63M28PYwLGe51jAHOQQixVfyU9/6uSQSwpZDm8dtA2/c1KPQ+ghuN
         ION4iekfg6Fp1oEET05HkSOrzrB1UaVN5D+/D6DkN5p014sTTOxge+Q5iEFfrY+UeaUz
         g52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xPSo9ItcVa4fj2ri5oc6bVUN+cUX/ExSvpmY9Grzytk=;
        fh=kG3gg9QWdJ9DHVH8kIrAjbPJ4ASU8Ej96jOMTJj0vdo=;
        b=UV+JZpjzuuSkVwwbt8QSElTc7TcmQelSwfirbDN9kUdENZzxxhpJBE2GDvEmLGE7H0
         InZaPxhL9VM5x/ApSYxwGTTApmxMPbQIg9azbDpzVyE00LAV+/AJtyYl7qpPQ5qxRCoy
         MD1R6Aa4nt6lUEuaiRhbBrmyXy2Y+Tk1wG91Kx81JzWR5PNoc9Zc5GXMiXQdzxUQrSEJ
         3CYVytszt9tDC4tsFvjjiF8vQi6K7KdBSB3uFesCR0Ejj2v3glbPfvV0ix25iGIVT5xp
         D8/SPUEtBEpk3Nm+shR9pfgWBJLzbE6XLrjqYs2FGMqi6K20NgNE6o8SO96yoIQCbGvm
         wJoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792792040; x=1793396840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xPSo9ItcVa4fj2ri5oc6bVUN+cUX/ExSvpmY9Grzytk=;
        b=hLDmu77ierYiamVgBV5vcAPXLaG8aupRNyDiDX7DkFNKpzAxzPIc63o3dmGM4zJaa9
         4NGe3YwDiymWhnQ/OCBGllsswfzcFZye7tQgoEq0wKR8ICoXlpOSA+BkFePJ+1A4Qtfs
         5B9uWQyifczwR83ZzMfzQhkVojser9lK+7Vg1COy1KYe+paFJC2NeFMJ0Pwj/pPj/iD2
         gXyhQWok5F1Qlv02XKngGqq1rGnm/5QhU+mrMgvZNpLlK+CJNtiedln6Mz0k16xq27uZ
         SIpi3iMCyeGt/gxH2+Gr5wKnY0+0nxLC7O7+qOh1rB8DPqu6rw1b+PmW+IOO7JtIQdHd
         VdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792040; x=1793396840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPSo9ItcVa4fj2ri5oc6bVUN+cUX/ExSvpmY9Grzytk=;
        b=hIuLNnKcVHVmiJJk8daX4EjwpVRv8+kurGHzuZd5yl1w+6hTpZfLHpZW9wKb2hERHd
         uLb8GqmuuwlsWaIEeI8JWiDtjzZQXgRIYsVi/NJ09vcrpc/SpLSyK7JbFsCnAFIlsx9c
         FIIzcm5sMSOpyAnQ365pktJs9veTV+sFgLbDGrtSBZSo1TKjOAF0pb1Cc1bmIlkN0NMX
         eyEaqdEKzGea/XZgp0p4RMucI0WV874gzinFD/hshUj5I4oELwIaSNcxGh9UjlPDa11i
         o87b3Y+IqKf9MvdEKosjGjV/UbbaUoNNPheJTC+sjokjZPmChhq4hNHTFY8tMAsJLrm5
         lG2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6G/ND6xgwTHoC+T4+NJt3zp/7noPUwfcxXKTv5Fz4h/kFM1+gDM18pPuIqMqZy9+F4dwuR1l8ee5JVzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCiuYxYc0YGyKo4ryOF6AfdTXM7K1LT3WP3J2gC0Wq57BdAuIu
	u3hCkgATDGhrvDIh7gHYMDL0hL9kXbWWsdEHTb7QJhpe9GoWOCLno1zY60IhGqRsgloPI6p1bPG
	geVUyC4q+UQJG/S4JL66oo7PdD8axYboDMuVo
X-Gm-Gg: AYBFou3i7tNZD5QkhbXxqn/v+ctw5D2HGmWRdx61iS5FhgZ1N9qTljhrtnpu6eOIUfC
	i5TnC/KykpjXQpt3zlsEAX31CKJaKJ0yy4QEUUVX6qOgcrM33OrfSCOKqaGXE1PTeug1GylSDiz
	NdrhdIldjkbciOHyLY8ormtS02ltEzkE7/ik5fRxofQ9eE1ff5ZCZNPh0GuuUhzTqzrF9zqsXUj
	jND3NtYAMR9HrumkevjPf0h6iKyasMoZB3C2AXhFwQlioWUNEgTa7AW2ZgeQ1yUpjTjqPy+EWcY
	mu57UNGvXvdZFMoJgpLHn7tUXFQnDCwSyALjeYITs/kwM6cxfhylhBpdxIotBFk4ccg3f7iY7I7
	Jv5qtxtu+qrn/5ATjb++Tp8xmWpQ5Re5StJ1IV0Ei8W5hFsdHedfovsHiaxehR3uVHT35TcL9go
	Q+zLND4SbNh1q5DyElWNC2gV/Qdp9YmYd7jb88Q+8=
X-Received: by 2002:a17:90b:17c1:b0:3ac:8af9:4a77 with SMTP id
 98e67ed59e1d1-3adea8952f8mr420926a91.10.1792792040157; Fri, 23 Oct 2026
 14:47:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001072449.1377267-1-adi.sharma@zohomail.in> <1a168cbe0aa.30b7e048183449.4003649852775097641@zohomail.in>
In-Reply-To: <1a168cbe0aa.30b7e048183449.4003649852775097641@zohomail.in>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 23 Oct 2026 14:47:05 -0700
X-Gm-Features: AclHuK9klZKtZiNDzc9m6HVwMpKUt6CjANLrIawUWNF0dNjLjk5PlT3PLx4p-yQ
Message-ID: <CAEf4BzYveiSZg0qg5h=EPiMQacnSXwp=8O+x74FM=89qrHV4=g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/2] bpf: Fix bpf_send_signal_task() from
 kernel thread context
To: Aditya Sharma <adi.sharma@zohomail.in>
Cc: bpf <bpf@vger.kernel.org>, andrii <andrii@kernel.org>, ast <ast@kernel.org>, 
	daniel <daniel@iogearbox.net>, eddyz87 <eddyz87@gmail.com>, memxor <memxor@gmail.com>, 
	"martin.lau" <martin.lau@linux.dev>, song <song@kernel.org>, 
	"yonghong.song" <yonghong.song@linux.dev>, jolsa <jolsa@kernel.org>, emil <emil@etsalapatis.com>, 
	"ihor.solodrai" <ihor.solodrai@linux.dev>, kpsingh <kpsingh@kernel.org>, matt <matt@bobrowski.net>, 
	rostedt <rostedt@goodmis.org>, mhiramat <mhiramat@kernel.org>, 
	"mathieu.desnoyers" <mathieu.desnoyers@efficios.com>, shuah <shuah@kernel.org>, 
	puranjay <puranjay@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 5:46=E2=80=AFAM Aditya Sharma <adi.sharma@zohomail.=
in> wrote:
>
> Hi,
>
>
> Gentle ping on this series.
>
> Andrii - patch 1 now removes the nmi_uaccess_okay() check entirely, as
> suggested on v1. Is this what you had in mind, or should I change
> something?
>

Hi, yes, it looks good to me, sorry it fell off the radar. bpf-next is
closed right now so I can't apply this just yet, but I'll apply one we
can do that

> Thanks,
> Aditya
