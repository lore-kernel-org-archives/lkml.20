Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794934315;
	b=exWaL6C/gyCXZi076A2Ton2mhMCGUMwYv+xVTgpJrBbPJlbVMQo178FcKu1HfkysXJGd
	 LcZRSpYgJkMZcHDniz8ZfHahGgqpPV/UbrZIcJ9l8nklHXWDu/cULCiWc2sjwaJgrNRIJ
	 STD0Nzo3OEWRLDbvEvDtxR6XJBSqwJMzgMg7A7yt4TxNST4qUqgNI18eLYRgzCmRlYrGR
	 SQwKJLH6+THiRYKPyFMre8rNpARcWX1DPOrhCQYdnXPA5stmj3CQrnmSx8nK84sEbTNOW
	 6eNWHysEorkp7gk4LsCah9lnEUDCL7gwmaOgXKU6U1Jc9mMS80IwflTU7jsiaEegzZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7JRaWtwwi9S7Z5KFGKcQeTS6a+RchtYr83xPGWINYgo=;
	b=iqWN81xel+fKclv4JEE2Xv98hThR6ab3zWIsTAKmCs3JLfNQpyo1bNoMC/5/3eOcJRFB
	 fJ0Uyc1bej/u0r5svOOiAa0l8R6SGx2KF1DjO540MIr69WeTSpm+o3R+L/3Lzn/1fSVdR
	 VFGGJeIw1jK/j/ylkM8KP7LM6DXQGMp7FK0BTMixH8RLQL2wAkBgaNKOL+Kmh5yBWu8+E
	 rhtmcNC4b5aphWcM8AxUg8VpmkyrQ9YuJLCUD1o1pymwC0F6mdxtAIBNzxdvXH1QwVXbK
	 g775EBnY3rEGuDFbD/OlKKQpmJOCi8bRUKIRRv12dNZlpj9CWfUUoQfFZBao3RsumVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cG9HEID;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6721606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6721606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cG9HEID
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so558735e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794934313; cv=none;
        d=google.com; s=arc-20260327;
        b=BpmyFTTEl22UpNQCYBEkZoscxu/tYECeIiQt2haCFqImbK7ud5NrSPArxu/LyfzFIt
         EfLBGq+Zu7RyU1M3Fukay/TlzYIW/zg9Eg6qgXZFq4Exqw4ettzmTtlIUQWmSLD8OG2Y
         7YVFHWtaMdNuhgZAqmlpenW9aupaO5XrmQdifOZ6AWFrXJ47n6PSxoTdmpS4ECisispv
         qWKSmUEAIMUcetzzc5gwnwMIAktiiE8OvuZveChJIZ5NCP5SaNf1GVUcWpvmZTsx+VdC
         nSz8RIg3P3O0ksBgoZL45m5ctd2P18BDvgTeHwK5bStu/cixrb6+KvB+Y1LnqKt7X/mZ
         MPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7JRaWtwwi9S7Z5KFGKcQeTS6a+RchtYr83xPGWINYgo=;
        fh=KkinvIfmUIrSWtfurzrBIL+DkXiw+mCo0ngrdMF+gWw=;
        b=ShWw4FQ5wv2jk39u/iyC3Gm0RtkWFkFLmnNDhPLCHaSO7AgIPS9fJTykmjw0HlO2E8
         fVShMRGGLxq5XVdXJ5vFI/oDWtsl3Bw3Mee51ouXpLktWjy04RrSofGT9sxJNE00AHRk
         tvsGPw9klaKgm0I3yU/C7Aj1J4q0Kk/zgLHhZe0nj5p7TmUBRMQ0mAjJ+EXpV2xqxcpv
         ncQ+wIbwuMFH3LX5CZ4KEkHLUD5CM5WKiCQUKgbpmnxtRrH46OD8LxT72oyzfHT6JP/U
         U1+VmW1k98ajgdiUyv/OmcdwOmvFsx00d6Fj8ZiAITj4Q5XD7poy8z5KArSjjWDry8Iy
         kBQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934313; x=1795539113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7JRaWtwwi9S7Z5KFGKcQeTS6a+RchtYr83xPGWINYgo=;
        b=0cG9HEIDKPN1IRLjWvhck/vln6wEcHrnV5TJWeVj5j0UGAlYiT9dy4RQ4G83AKqrBO
         wfsqNqc0iqHE8NzVxg0qUKPI8/LOLteUkakQPojwzPDBrP2C3rLnPG9CT6GwlMZEYofq
         tcqpIIhzFLtMFED//3XgkKb66wWor2VcJ8LUpV75RqG0Saq1eJdRPJqb3tku52GJg+oi
         xkk85GAhMopSY6zJmS2QPb0i9y4L/erFssmbWusTmAx2d+sIDjCFIY3R2Rxrb0aAhMkD
         KpoRygRV23IzbzvfZBw0Gt3VetYHpCk+74d5nQybBylkvNjT5fcJqhmbGpbe2s7Tu5oK
         7UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934313; x=1795539113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JRaWtwwi9S7Z5KFGKcQeTS6a+RchtYr83xPGWINYgo=;
        b=X0c6MGaSqEe/kpd+6KD6WEQrr8dukxE38W7XquC8XTrbLnBJ+DZSJnuWZJRQQpLmk2
         O7pfT4j6sPlRmQKUkmp8s9cgQzlhB+vnXV7oeQpomXyV//vjiEKSYxwdqo/Eue6ur0T9
         skykfkPWCz0QBNJ7qUgbSHW7weRsdGNHSVs3ighnqeTZYI2Ee9icVL6UOHxNk9E8+F6T
         kHnyRzwh2NefwRblGC8J5ukXm2w064zV4CDZxzwq7bm6xogY1tnLbF1vF01vAsRn7f47
         RAQ7p99sz5UiFgFnMebQThRNomlHQlxP7iVmm1K4P3pySUNflNH4ES1+eTaAGmtdOqFl
         E+Pg==
X-Forwarded-Encrypted: i=1; AL+hErG+g79z7mOe3MjEcbpL9+GMZmA78GniSpTs3w+bk0XmVQiY4uN5tI7PWoJRxHdBE8hAunvWrVHz2mqbrwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SduNtmxq9F5cIzeeL4SoaPB38acx2dMxc962NyG1PXsF2UqWF
	7Mp4ZERe0cIQa0mZeFU5N0se9F2c3H6pgIN2Na6tF62TQmV4e/EfWo9NlcnEM9yPAviKIqJYCzI
	N9Mh/4IgsjbIzAMS/8S7b2sN238ANIau1CmWn
X-Gm-Gg: AYBFou2HAFShilhK5ZFSaM5Z7uqOqaQWzv1GyUEX0T7cwqgEOFole658kFVK3Uayud+
	VQdpphhBtJdHoqcg2+JhJBCH77vtmVXZXg7H2DeP8ehty3XofD4lTizs74JYa2JrDq6g4HC7Z2C
	hLm1hieAqwyxZ0ZvMIqD6I0S+Pfg4qKKJy7u40r6TiCBTtxJS+AnaROas78sLm/qZGzZrEG5Uu4
	QJh4tgrXXcBNVPxq2chF/sImA2pyKVQew7coTKsxc+6rk3hbTgXbscdYwZJMpTmicWNjlfUUeCU
	kwL52Pw/h6q7pp9EoqSN38PD7zrVA3offmzYVUL0tsVZyXkL2KDF4PfmnmOJnhrPpWV+wXF2XQ2
	s8X2/bmltZAvUpwyxc5cjjV8HHEnb97ruYqWav4vKlPiyM1snRrEHTM6Lb3DiKJAkBUWFA6oy/4
	L8E0BK+krqzTAo5R4kTLhcO3pl2x59clYfJg==
X-Received: by 2002:a05:600c:3e1a:b0:4a2:191f:7cbd with SMTP id
 5b1f17b1804b1-4bb55a3e31emr267364685e9.11.1794934312966; Tue, 17 Nov 2026
 08:51:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d85ece6e-27f9-4d9f-83af-4101bc76fef6@app.fastmail.com>
 <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com> <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
 <CAEf4BzZKmn6g0SK8OddjKFj_vAmZFvpZv32Hs_S+GHgT7VNfrg@mail.gmail.com>
 <9d6bdc31-e57c-4187-be78-29d82471f710@app.fastmail.com> <CAEf4Bzb+oYDqO20v4YbJ45wdtcGgJT3xVse822P+=oA7fpFAOA@mail.gmail.com>
 <CAHC9VhRcT3rmdpeadwi2avhwvr7aEZYStZ3bbEEx1hm=wtBGhQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRcT3rmdpeadwi2avhwvr7aEZYStZ3bbEEx1hm=wtBGhQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 17 Nov 2026 08:51:40 -0800
X-Gm-Features: Aa3M54rjJelQoMCxfJbdMIri9nRD0cwaH3YE08B27J2GSDu0HswQ_b0L7fMjvps
Message-ID: <CAEf4BzZ120age2-M-a_TJ07xohb7-s=xn3e1W_-V0kopnATq6A@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Paul Moore <paul@paul-moore.com>
Cc: roblabla <linux@roblab.la>, Daan De Meyer <daan@amutable.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:41=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Thu, Nov 12, 2026 at 6:00=E2=80=AFPM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> > On Mon, Nov 9, 2026 at 7:08=E2=80=AFAM roblabla <linux@roblab.la> wrote=
:
> > >
> > > Hi,
> > >
> > > Thanks for the replies!
> > >
> > > > LSMs that need to provide a stable API must provide an abstraction
> > > > layer between the LSM hook callbacks and their stable API.  The LSM
> > > > framework is not responsible for the stability of individual LSM AP=
Is.
> > >
> > > Understood, that lines up with my expectations. I think the biggest
> > > thing here would not necessarily be stability guarantees, but rather =
to
> > > make sure that the eBPFs fail to load when the compatibility is broke=
n.
> > > But that's probably a problem for the eBPF side, and not LSM, I assum=
e.
> > >
> > > > So, in short, would it be possible to send a follow up to Daan's
> > > > commit and move `struct mnt_idmap *idmap` to the end of LSM argumen=
t
> > > > list?
> > >
> > > If this is possible, that'd be nice so that we avoid this breakage in
> > > the short term, since the change isn't in a released kernel yet.
> >
> > can you please send a patch proposing that and we can continue
> > discussion there? please cc me so I can follow along
>
> Considering the original patch was submitted, reviewed, and merged
> with the BPF LSM being the only user (none of the existing in-tree
> LSMs use the idmap parameter at present), I'm a little surprised this
> wasn't brought up earlier.

Yeah, unfortunately this was missed. Not sure it's surprising that it
wasn't detected immediately, though, because unlikely someone tested
an unreleased kernel in production. Luckily, this was still detected
early enough before the final release and this gives us a chance to
fix a mistake.

>
> Beyond that, from a style perspective, I think I prefer the idmap at
> the front of the parameter list in most (all?) of the hooks where it
> was added.  I'm not interested in moving it at this point in time.

So on one hand we have a real user pain which is easily fixable
without burdening kernel and LSM subsystem in particular, right? On
the other hand there is a minor issue of argument ordering with
mnt_idmap preferably as a first argument. I get the preference, but I
think fixing an unnecessary (but easily fixable!) user pain should
come first, don't you agree?

Can you please reconsider?

>
> --
> paul-moore.com
