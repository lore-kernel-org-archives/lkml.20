Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792628394;
	b=ktlZgoBQSujSFC8kj8UgDhCOIDi42PXyYYpaMseRrBSdZ1r5g4VBgse+ag0nY4kEKsWs
	 xWqWLlwzsmshWktMimWWuChtWghCKz9QLTHsE/RNsSEE/BDoiZfoCz+dAsvjAovv4Y3ie
	 OnHZNbW/Plc32LLSKUH2IsuXWQWqZBCf130yeHsOPICnlx7ZM+cD6g27c9n/jLuXKdV+Z
	 qLMiR5MZGXbsuE8KOUfqg30a3LHqMlm9B+CITrpeNyaPpNLdBkQBLeagUZF5OpafRlC+O
	 w7C5u4QWAQMyYfFUOLthjyAYyLPBJdQqizhaZrzJPyXXKJnjEIZxlL9vgvbyxXjy1JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792628394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7LKanmub9UijD2PMm7UCSGFp6N4jqIqQ+Weyqyg9TkI=;
	b=vw6051ufmxxL579JRTOA/M7K9UThS3E+7ZlQHnn8+gg7Zg81DBHzOdVwLSTI9vUrvqnp
	 mNnBAc2SSUuhqNO0HFT/Pe+9ZMxUQuEoL03EpcT6CvAgecksIH4TjMzYzCMOjBiKnLTut
	 9ec8bFkFgUaffxZzwZRVZMGFqiJXM/nvB3DsTj/x+1K3folcN9ws7EDsP1F/QV4ED8WiL
	 g8R7gi8bizOxGuqZjLi6pSrjX3YWmYpNgwgxxuCbiNsHh2Ebsi5ucLYcTn4yE/WFpQYGC
	 q367d+hrr8UobIONyOf23ZqSclAbGfeQjhAj7b3OkNfcJwCquIuHrCJvKKSwZ3+aSFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V+lMSygD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251E6606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 251E6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V+lMSygD
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e63ee7b4cso148450285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792628393; cv=none;
        d=google.com; s=arc-20260327;
        b=R2rp2nFFm+fG7majNwwMNUsF2/lOcx8aRsac09WMl417eVFAhjnoLcbIlSa/c6SjC7
         4aM5LlAb35n9XoYQ8SraFSP2grxUI0hfm4xNFqsacqb6OK/jU9Ut+/P6W98PlPtMjiqB
         igjUrR7KxLYX2NRji4kgf9+cdcx+0wyZL6l5UZB8N13HjrWueeMqB/Z9v9TyW62A7qBw
         7gtF4/xFXtieW+qEyGu7WVoC4MRYi9nKP2FtKmSS7eCdbIYV0Q6VF1ooXV+SnmnCxTNt
         lS4ku4HlT0playRM+DkXYjeUTbmz2Uu4NHwuQry3FGqetr2QlflslRhNXAEDzTSSMD2z
         5nbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7LKanmub9UijD2PMm7UCSGFp6N4jqIqQ+Weyqyg9TkI=;
        fh=zXzrZ86W+RXkVzyn8lV9uMWIHVm6++dI0TzuPOvp8TM=;
        b=PUia0RirNe1YiXFlfnfT+V72aL0790IV86iK/ovkJUxV1nMi6u2/spCyN5rj6Am+hW
         lST+Ryka6bQeiFKh4KOwDq9vCqgklhH0UVv83BRl9P5xIVr0bBp1tB7ju29yz0YYyW33
         I8coqk2fdZaQv6586MPiuUIqOpl16TL8PdGSdVzi3IR2yatoR6yU4G9A5GY/PS6kynNx
         2BZ8Aaf8Ep83vSNihODqPWsYJ4RB2540XM0m3OEOViNEG+wGqZOmGzuqftoZfJZ7h9Zb
         aysB4VtcMNq3laeI8YZao+ROx9estTQQ1XJXJrX5lqWWEYK2MK0ayNRDQU1+I+CIs49x
         TKjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792628393; x=1793233193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7LKanmub9UijD2PMm7UCSGFp6N4jqIqQ+Weyqyg9TkI=;
        b=V+lMSygDkioU3le7sBUNHYOSh1pbU06Vegu4Z4f0kX6UdH1zb8BoAi3fVMAhcXHY8r
         +3fHz+b/HFHLPB+1JkaAJmQPNRsaXjdGq6gpExrtGJnrR/Ctn3ZguGmWZj2T4O8q+dpT
         n2Jp0sUKMh+ldq2AJNfcso8qvcewYN3I6UJ8RCr/vQVXM4dgoTbXqY1/zwCYNTG3DbJu
         w0Bn3GGB/ZeQXnwojf2jw7oUNT7UNKEmtnDHoxjj9iGbt2CUWzKw3zpKRo57Apk76967
         bcOi1Kfz1M6AnYOFAs/SpICEraAk19LsJ4nFeV83klqTSJczDQt8n+4KxJAC5TMagdyD
         0Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792628393; x=1793233193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LKanmub9UijD2PMm7UCSGFp6N4jqIqQ+Weyqyg9TkI=;
        b=aewxPQugT+Ljyc3sbOcAuZqjGrbZTrTe3F4CbHgnraYCF3LZa5d60irD0pKZr3sGM6
         YYD2jD0V79d5817RXhrTjSdNm6Z77P3vv4FzqBoJec6Mf0jyg7BVFxwFB+7KAqj9BOZZ
         S2PsSryiQMCLggnDQufxrXk7JQb25hQIVEJoE42rjMxdkfJcDR2WHoe1llvu/iCzxUco
         tmWflx0UMLfoKikInOPzRPwGMUjqBmICZnUETxzGe6dj7rKaMt3JyDnYgP6D3oed1+8t
         HYEYt/crxF87v5l98c2Z7yC8VFpPMFhF1lUD2OfJepzVroTK8/NhBBJ5uY1KicMWflQn
         b22g==
X-Forwarded-Encrypted: i=1; AKwUvBwujMqIe57YuDcP5hj1g8TMRCZlJTpYPBjOZrGoYXRvYq1Iei6MfHytoUZwNnuX0F4z4FwE4VEf5WVxTRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLpQ7FH0njh4JKIKPahkkiJ2YZwHy6iFRaoZ1AEUgelKAIEx2o
	DJF95EaPL/hg3jxLYhDlE4Ts/c9YuHknHeE2+f/nre/t3b2s8kHAOJCwK9EOFbyhsSN4mMNPrsE
	r0QLQ73c4zrwPBfO2SDbjwlDl6b2ytpA=
X-Gm-Gg: AYBFou0DLsSA77ejePakZ7FpCoSRNYEHd07IYlW8R1YkDJ5utUtQnVgurTKV8wMFVTT
	Y8if8SuQKz4mXnUyGDwyUHlnyf8VzbjWRcSlqmy388Gw+Z5wV5Tg6DO0m1ZQNQQ1ejqYy6Td6d/
	KJ0cKjkUBj+PfvsHnVP00KfE7wsJlz/ryqbwgi6Po02qiiLIHqdB+8Iw1XCO9Nzviv3d8rz/+NG
	2EyIi4MniyealuevNu98q+w6W0onhmCyKh9wodgxku4zHaYD+ArqXEpYcz89xUtT6CA2hAx1ePY
	XXrUGep2jPPqGe6/WnAdhDeY3XOK/nDYiKA49PckgdsgLyDaTLG9Cx7aBILEZoLgxlelUHoZYQO
	bnBQ7ZrLFwHODM4BvnuJbSOOU2zBBgg3x3VYr/zHdvA/4ZBAp78dbFMwsQmLImYjmQVA7uz6fj7
	MUFrhBi0Isl9JINEnDZvi/TTMFRLCSYtjFZfL5u9Xi1a/V+hxs
X-Received: by 2002:a05:620a:4505:b0:93f:1dbf:6cf9 with SMTP id
 af79cd13be357-93f57fb7c32mr727310985a.33.1792628392905; Wed, 21 Oct 2026
 17:19:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021075322.923-1-hdanton@sina.com> <20261022000822.938-1-hdanton@sina.com>
In-Reply-To: <20261022000822.938-1-hdanton@sina.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 22 Oct 2026 08:19:41 +0800
X-Gm-Features: AclHuK-8o9GQW_xs43Q0Qq_oZJaNk93VFne7SJrKQjUrSEZ5apBJRUVwrXnRIsU
Message-ID: <CAGsJ_4wMQteCGxQ7wxUKP2g96myo91ipF_zedFVVbxKdDrb=bA@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
To: Hillf Danton <hdanton@sina.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brian Geffon <bgeffon@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 8:12=E2=80=AFAM Hillf Danton <hdanton@sina.com> wro=
te:
>
> On Wed, 21 Oct 2026 15:53:21 +0800 Hillf Danton wrote:
> >On Wed, 21 Oct 2026 13:56:17 +0900 Sergey Senozhatsky wrote:
> >>On (26/10/21 12:23), Hillf Danton wrote:
> >>> On Wed, 21 Oct 2026 11:42:19 +0900 Sergey Senozhatsky wrote:
> >>> > Split struct zcomp_strm into separate compression (Write zcomp_cstr=
m)
> >>> > and decompression (Read zcomp_dstrm) streams, and split zcomp_ops
> >>> > context creation/destruction into create_cctx/destroy_cctx and
> >>> > optional create_dctx/destroy_dctx callbacks.
> >>> >
> >>> > This decouples Read (decompression) and Write (compression) paths s=
o
> >>> > they no longer contend on the same per-CPU stream mutex (Writer vs
> >>> > Reader priority inversion).  Currently, a (low priority) Writer tha=
t
> >>> > holds the stream mutex can be preempted by a (higher priority) Read=
er
> >>> > on the same CPU, which then blocks on that mutex until the Writer g=
ets
> >>> > to run again and releases it, which can take a long time when there
> >>> > are other runnable tasks on that CPU.
> >>> >
> >>> Given lock like mutex, priority inversion happens from Monday to Frid=
ay,
> >>> but I wonder if you are inventing some wheels in 2026 if proxy excuti=
on
> >>> works for you.
> >>
> >> Reader-Writer split is a foundation for further improvements (like
> >> singleton recompression stream and so on).
> >>
> > But that split is not needed at all if PE works, yes?
> >
> Because PE is good at handling complex priority hiarchy. In a simple case=
,
> task1(priority=3D1) is the owner of lock1 with two waiters, task2(priorit=
y=3D2)
> and task3(priority=3D3), while task3 is the owner of lock2 also with two =
waiters,
> task4(priority=3D5) and task5(priority=3D7).
>
> When the number of locks and tasks grows, I have increasing difficulty ev=
en
> describing the lock chain that you in combination with Brian are unable t=
o
> handle. That is why in general PE is prefered over whatever wheels you ca=
n create.
>

I still believe that reducing lock contention is the most correct way
to address  lock
contention.

Proxy execution and other priority-inheritance mechanisms can help in
some cases,
but they also have downsides. For example, allowing a low-priority
task to run at a
high priority can affect other tasks. When many tasks require proxy executi=
on or
priority inheritance, they still compete for the same resources.

So I'd vote for reducing lock contention as the first option. If that
turns out to be
impractical, we can consider priority inheritance.

Best Regards
Barry
