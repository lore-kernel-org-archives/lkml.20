Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480284;
	b=EfDknVwmqG1Y1Rk4PtvE6IZTRx3Q1ZvgoIyJ5JOfB7M1dkz1k0o63XCKAgTO3X3MLW8M
	 z7a/Hy0FY+nBsC7hO+5wbJjbI5/d6gYwA4fBevHOqA8YSJK43A8SU/iE2H3xDy0qc1h8A
	 mQFVdtVvEgli631zXeJx5wMrNkwzvMceP9yESZ0s06paBcZ6EZ3a4kjLRQrO0uXZFuVjN
	 98FKNlp6eIZpqdE+0buFe3yJleCZV58vRA3knw/i0ghw2eSdEiw/+NApTQvFo9wmav0+j
	 7AcKg/A6FkMiHp3u1ueRJlFsY+1AtSV+AKCAJcB2ehmSHb8RxSxM1SkjOBswAJIAHGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=Y/LYbbBt7trzTMNEroyzygNAvIrDGCzErGprATR8hIs=;
	b=xUnh6m4rDjgmoWsqyrqe8s2BdrvixGW+2Dz5gV9r0eaSXoLV6Ot477NGffXFjSMVRjsV
	 ysdx1ARKBpQJJL6RZasFfZKJkV4HcGE6l05jkxBvXX0T+1bvNpyGobGKmyk+XpUSvnQTW
	 F/jLEtbmlhoquuNicT9KVnBZaVNDiMbVjxjE2ddSxIdSFkEY/HtXPNuZ422VuTgpfVcfB
	 0pzVLObfRvuDn8mUpUTWnU34014UUwvOBV+wd3aXfhOXOd2pfMctP8aE3CQF6yib6hewa
	 Bo5p+yh4jfYt1g17Fm1jHJwz3Fkcxvj7RJaPb9/A3iiykRtTXj26W3yUojoqDsRXhxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIz5pZpn;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB691606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB691606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIz5pZpn
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06454116eso792154b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480283; x=1794085083; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y/LYbbBt7trzTMNEroyzygNAvIrDGCzErGprATR8hIs=;
        b=vIz5pZpn/CV/yT3JZ9+1Z8dTi8d7iNdhPVwu7OHZVUJIqYzO+tijbQDNdD4DTk6NDL
         Gje9LUAQUA2bhu3AtYBzjfgA+ADNZMmCw75yfHKfhu69QGj8bU74LyR4Rc6mDTEaZ5YE
         b77vZZqkQqCWM60tqV1LmKF7ixexHIaZDLyG9T6tKaxPpy8oHSZKQMCmPEqOP51FLPgG
         MT1VRA1zNe9Ww3FN8aLr7AgQ/ivfkQ/d7jYTqRuvitlh05Ebui+s6dpbGoEa8h/sT4G7
         o3LLNgX4g1GuuFV11VC3Rm8Dxd8h11rh1Pc/HKAxRcc+psyMI20jAACnaB06y8W9RyIJ
         7rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480283; x=1794085083;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/LYbbBt7trzTMNEroyzygNAvIrDGCzErGprATR8hIs=;
        b=KnomeHA7UiAOl959yM7BbbBuFMIuEcBRBVvz9LhwNHq2LR/ki83h0j8TBiwBwlvegu
         92tJHhbb+W42pfkJ4bTontL/iKinf8k1jKMqs6c49R7dLhDsK0VYRn6IhL1TVT6kEw4M
         xVcyN0kTx3fA3KeSWmkcil9pBWqpCWDjDTCt+7Cvt7zP5kBhmlkjBY7SYGD29YkvTQ/E
         WLOVs3niruEFmOJS5naDR3kynXyF8khN3TP31qJz/Rddey2fZ7gU7JCEt9G+xygYQ/yh
         k0pwyQ47ScNfA8Vo4A2lTJLt5BkEif9U2Ee30YuMyPQeyAjf/iA4zONKyhEIoxa8pk7b
         pwzA==
X-Forwarded-Encrypted: i=1; AKwUvByrBL/mDBEuVOwNr5lgi9mo2oq8/531UsB/f3DC0PxH6O9zUD7UQxZbXWDm+hUG8HjoLsQmqPMNQt7+/pA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqt0wmHw0SliqyC5PuIcRLKptPIlo9/BvTe4kkHUZfqg/188ln
	Xb3Fu9vpUITARP3+Yfy18ahh1fJGPjw0wiM6cV1JRAP2wshc5ykD70BT
X-Gm-Gg: AYBFou3dz1he0PbTcRA6rkyB5xhnzUUIkDa0n7Z0LjAnIecU5uP1KAbPAGz9jpB41xU
	9l+gO58y1tQ915+ZKfMKjXqBXrNLjk6CxnERHdPe3ghqVTU5C3XlAP/VQIf0Uedq/kAIk3R0WXy
	uVdwWL5cB0UBSLvWuLDLoApZvWDE7biWBT0Dmtmwkc+BztPqRTeR2mRfI//BKvZCDDz6bRJySmb
	pHif9RwU9wM+LlYRNWAfdYiAP8jxE9MOWMqAglcbHuyLrSM+TAiDXK1MSVJNdijdVyUO4NkDgfV
	QJf0Nbv1XgWRB9TyVlJmRoEcOZq8Lk3BJsk+sAUKj51+9iyo/xIyzjjV4W8q1gpKbKRgs/P3c91
	jKftZ9uT8jjLkfkrJSkDYys2ealYNYq5102h1khqy1ObR0KQIhg9+VCjZ2lNPIv7/s7nk3byYkX
	dJsWU+xqNmEk/LzeH6npbN9wpvJ2qH8Dsveb2Yb5wZ+EvTIb/VM8HuLPdokKRA7Tkis496CdjHH
	0KBY+bWkpJhxR6Yuc+oQ2WVDpuuJqzXNRwJxZwZvUvIB6GrXsDh40hBrRNXckWbCeTc18lWOU4k
	9jjB3/zZE8Zba1A0E3+6KPUXgItoOVeEfEiFqNG26YX469BAddT1aEKjhg3YcleEBRuBPZpJdLt
	zv1zOmvQpaEF02lye1baGUBGSLW3eYBha29s/5bNkzifEtGDNoQtEq9I=
X-Received: by 2002:a17:90b:4a85:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3ae897994c4mr4981300a91.50.1793480283148;
        Sat, 31 Oct 2026 13:58:03 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm13250949a91.7.2026.10.31.13.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 13:58:02 -0700 (PDT)
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
Date: Sat, 31 Oct 2026 20:58:02 +0000
Message-Id: <DMJBP7BG3GE8.1ZXVVR0YIM9OO@gmail.com>
To: "Chris Down" <chris@chrisdown.name>
Cc: "Nuoqi Gui" <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Mykyta Yatsenko" <yatsenko@meta.com>, "Shuah Khan"
 <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 0/2] bpf: Gate dynptr probe-read kfuncs like helpers
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260615-f01-07-dynptr-probe-read-cap-v1-0-e626cd61a381@mails.tsinghua.edu.cn> <DJ9QOWVIXFHR.1S8UL5H0USVCB@gmail.com> <auN_R9gCBqNwEkKV@chrisdown.name>
In-Reply-To: <auN_R9gCBqNwEkKV@chrisdown.name>

On Thu Oct 29, 2026 at 5:15 PM UTC, Chris Down wrote:
> Hey Alexei,
>
> Alexei Starovoitov writes:
>> It's fine as-is. Won't fix.
>
> Could you expand a bit on the lockdown side of this? I ran into the same=
=20
> discrepancy independently and was preparing fixes until I found this thre=
ad=20
> while looking for prior discussion.
>
> The CAP_PERFMON side is now covered by 81c975aae375 ("bpf: Require CAP_PE=
RFMON=20
> for kfuncs reading memory"), but the probe_read_kernel helpers still chec=
k=20
> LOCKDOWN_BPF_READ_KERNEL while the matching dynptr kfuncs don't. Is that=
=20
> intentional?

lockdown is a security circus. It was broken from day one. It never worked.
So all these 'ohh let's fix it' missing the point.
