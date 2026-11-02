Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793661875;
	b=WYT8BWuMmtstJY9CCLm6T1hDJUQV5z/55lWOGXktLPw53Zdg000XQJlNBEbAIHdohbkX
	 IemvNYL3n9TNsves0o6n7E9rhMCg10uIOD9Lt0UaSjAsgay4xGLUqHAoRiqX+8xRpoqcj
	 ztOqEGVjOW8dF1wFjHL0EQWBxFikd91XULH9ojaIIcR+xjiGe//uXYLeDN52m3smIWcEp
	 4LVBTvtPKYg5qdn0GgQiKgnDZ82HYLVMFDj0+NyuVOGZvbVn1X7IAZwZM1qgP/52ITp+g
	 fN7JIg+wIqhjKaKTLpdKDipDBCNLjgBDnS4Tnpcr/71zNknHqLlTN1UDgsTIaX5kdgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=clGd0kEztycgStZjRN35b8z63U5kKCgKQbE7kXLWxN8=;
	b=Tg6NMWJ+gY6fzWQa43ne23d8zVN3AGxrepdlNXXlHJNTfUHbY7Pa3KTDVCQMN01gx9Xc
	 JqzweO6iCDkBY4d35niJjXLUftRM+zHycyigOYNlbh7T5oLrw2LSItCnblDkB/fPYyJmX
	 lAHtiPciWsG8g/dS5DoyqrMY9f22XyDS7rfItSuyYayOOjGWN5wKfICE4InW6pU+0nADA
	 8D3nKLnHrQODc8CQcAX/uGtEE85lr8J9buIMSQkvrdznkLVJPW/yK7+HG6QXP1Nf26I+i
	 C630qrmQcm2H1gMbTiwkOIbzFmUAO6UTf8tPZAaDGxuZQmQm9Ov7S0p0X2yFx27hVNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=VoJsUXHV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0E606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C0E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=VoJsUXHV
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8c028eefeso5501355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:24:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793661875; cv=none;
        d=google.com; s=arc-20260327;
        b=bRhLrG7lOFXVoAvcVJnOcp/8oiJvZA6WXWKn4WHDk5VJq4URDzLIoDp55wsXMghoww
         Bv28RdzKbcAhLROZ92fesB9G3a9oAp9XScyRnkxmTV754l2D8v+dpjmlxdTsuCyQZEOr
         u3wy7bAGuFCDJd53bZHoser/a/A8KtRAVDwn/9oEyZMroFayGdYxAHSOzSLqp1dAcyEQ
         x9SKG6fyHVxkZW9iAtmkdH6pPTW3BW4y5WvnooSq1kzX7YuInZLlEp4LHa0zXVG7pm/8
         1/kHvt4WnU9eDlmzJPF9vsvsyGjSohTGo0hXqRyjFiaxrNNqCso8jal4LoLcIB8pv8xp
         QRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=clGd0kEztycgStZjRN35b8z63U5kKCgKQbE7kXLWxN8=;
        fh=0gWGxwlgzaJe/0If5lC9+7EDAW+MLGz5KBJ5j7Kef2U=;
        b=Grd5dQW/W3nQaR+AKD2mcENSV0Eh0fKLLDFQsumL+0IvUXVpgThRRWiphImFE8ZVsW
         pRIv8j6fZS6UNQ7at/p0MaPmUhjngdjckVl6jn/oGadUlM/rd/XfhffeDvGX0J1YfI2J
         oESp9twETSdgWcx/D4UdKVeZe2SpOLAKQWx8Xku8hFwMcXH4WYZ4ck+0iz7vSakLOfuA
         NrjpWePiQim8CpZ9n6UqQIbaqdj+p+WuM+9POhJR8qbnHK9Y9QB+qAAEwngdfBweCZU3
         y8chCGkNkwunenGeM7q4MaIBb0z3crjbjoGe+KTfmhdUkje4dCFtN/bl6yeVvjv6/mas
         MwXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1793661875; x=1794266675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clGd0kEztycgStZjRN35b8z63U5kKCgKQbE7kXLWxN8=;
        b=VoJsUXHVOh3WOnKnqX2qdJvPo165+E4Eodb/Vj3S1tPrqm5djyowm0rOKrH4UpL233
         FKOeVodvPNg+S9jR35oiMkZvKyABCT5VZ09dlAIj4OcN65bWsFBOk4BJJPGDhKYuo04L
         hFaX1JNFXqGbN9LNdJXjaZz19yFZJD4lGi7HWpdMgT/WSaaOtob9wnqgLfYGVEXU2yMf
         +q0a7dM8x/x+vJg/LsiF+bbdPWkselTJQ/u7EXaXAlPMN7argOMWw37k/PtMN041pynM
         SRrGQlfTU7kcwUmQdsjPkHdN4Y7WR+NhXfzpQ1oPlOiHj10Bnit2/P4KD+H+nwZuH7aC
         AKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661875; x=1794266675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clGd0kEztycgStZjRN35b8z63U5kKCgKQbE7kXLWxN8=;
        b=PAodp9lN0JvXZ0GD1WKgMlLHVmWq1lepoA5rqI70MqPazKIuoDfcqZfp7CsL9saoGr
         haYsVhfc0gN2TkCm/ulMvaF9St1HWJwI1YnnjCoBPR7BovlfdaEVxBPWNQ2jn157vo0Z
         tAF5cpq5PY4T56LJJhS3Uafz6KZQcGfDrXHUn2BjOhI6E4l9wH9rMBXkUv+FEOMivXeg
         x7wmv64A+0zZ1j54vfPR15JWGrEvO29QAtPB+nTaWyMYhCdC/jt6YqBxTqmwDFjLiIU/
         V/PUc1Cgx5L+RF72sLIRfc6koB8zm7gkdxuZCKo/KpATA5bAnlWq1LWYcI7E/ScMZc53
         y7zw==
X-Forwarded-Encrypted: i=1; AKwUvBxgPBLEPiC0GLGslvvoINYdOleyMmRGeoUoWBCPkA040o0cypvC+RdwHNXuug/EfaKG0b1YTRbjSIvZMx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hghrvbzSLJAHOb6hkSaBEOiwk2hneOM8DF2ZuRRwmUhrSdBYW
	ONy2/JXYqZasaSlDsZ2MVqbVOjdjUtLQkubXj+6t9XJf1pbNFciSI6tI12tF4RxUrKEl+xGQvPa
	5coWwj9RQ1fwAOU9RIDiBetMQVYglvXKLt/Sran15aQ==
X-Gm-Gg: AYBFou0fFOK750rL38nPWvFld8N0hEtzr5WWiJ1DF+7zZBv4MSVFiiDQA0jknWWlXIO
	+SePPk7iGFqCpVkrchTaoZGYIjZVrA4ybHhOROEz1lfX72D1XPn+4dZDS//knBFSAkpPxeV/JAk
	kKoxxojIesEB4gn5gYUdnHck5e9azGCeEI1DczHe97ZW0udeUIyEkNJfMUDmSx6fOwfdvVJJpJe
	qcdXgH1iA0qqO5DVRa+uUrjpKgtFJaLT5dzQUxPJOEhkbwTydnJqRlz8JmK47nByQ/OpJ+kGoHZ
	XHqd/6bhldPhCC4wDyC8jXyveUwfSSj9UcIwVF0kanNo6vzHy2PJQlUfa6lP+slBYpS3rfDOSBz
	2/Czb2vvbNMB410t3a8hrlPWDugMIsmBn48YSKX5alb05fRM4k0XKGzuxSi7U
X-Received: by 2002:a17:903:3804:b0:2e8:3cf2:49a0 with SMTP id
 d9443c01a7336-2eb36405287mr188158475ad.1.1793661874532; Mon, 02 Nov 2026
 15:24:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
In-Reply-To: <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Tue, 3 Nov 2026 01:24:37 +0200
X-Gm-Features: AclHuK8h_cYpK4lk7OO76ee8Kks2WVPwHiw9tfTN1WU_Lw9F0nS26YCUvD9J2rQ
Message-ID: <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 12:22=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Oct 25, 2026 at 04:02 AM Mike Bazov via B4 Relay <devnull+mikeba.=
sentinelone.com@kernel.org> wrote:
>
> > Is disabling preemption in __bpf_prog_enter_recur() on !PREEMPT_RT the
> > preferred fix for fentry/fexit, or would you prefer a different
> > mechanism for reconciling preemptible execution with prog->active and
> > the per-CPU private stack?
>
> No.
> We cannot disable preemption, since progs are not short
> with may_goto they can take 1/4 sec.
>
> Sounds like private stack is the culprit.
> Should we disable it?
>
> pw-bot: cr

I think disabling private stack alone won't stop the false drops by
itself: for fentry/fexit, bpf_prog_check_recur()
is always true even when priv_stack_ptr is NULL (as in the reproducer
and selftest where stack < 64B).

So when Task A is preempted on CPU 0, this_cpu_inc_return(*prog->active)
in __bpf_prog_enter_recur() stays 1 on CPU 0 and skips Task B even when
private stack is not used.

To fix fentry/fexit while keeping preemption enabled, we'll need to:
   1. Disable private stack for fentry/fexit (so each task uses its own
      kernel stack), and
   2. Check recursion in __bpf_prog_enter_recur() per-task rather than via
      the per-CPU prog->active counter (still blocking same-task recursion
      and IRQ/NMI re-entry on the same CPU, while allowing a preempting
      Task B to run).

Does that direction sound good to you for v2?

Regards, Mike
