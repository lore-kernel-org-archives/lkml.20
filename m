Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161D1E1DF0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789172471; cv=pass; b=nFT2ttY5zkuFr9B5/CLDoAiF1tnQq6JGlM9XRRQzzSneMYg9epIOa2L8IYGSYpThyNrzOH051DMX4yU8AsOBpxlwMPJQlx44zUIdj6doZxQ3iqAX6UdqAbzrx8uVNgrYWcya7bzCvzqzhn3hEXpFSxvvVODmZLU69lMJ226TudM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789172471; c=relaxed/simple;
	bh=yiO5TV0bwTKJtEwFyHk1KmMv4NJpSMLcyyEMsZ+nsFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0hEc2D0xotVzOvtVoGrQPkTnRoQMPriEoTOwmAooasClKUj1hP3yN7jKJ47dg2JIiMAJTbxjNtcVGv+xJh334xEuuidijMgo0Z0CjupwIVR5MYd0w7cPV0V9RhUIlP7+ab0Nsa4fnIzjlcCmwUHxoCYNxrIpu+8+HpfYU3nupo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZSf2oyg; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZSf2oyg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d715f4a587so20178015ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789172469; cv=none;
        d=google.com; s=arc-20260327;
        b=loQkPbhQ+kijYCU0Sc747vOhBhiAK2H4wZG3hUwPua1noxgXRoLfeMRXVqyIs/kyvF
         WqS7x+dMxu4pXChrN3r/MvZOM80Z/FHvFlmvBD65K5vZgvXDBBRJZhz5tS3ESRkxU8Pk
         T3GgpuYdMQSMB39Wfo+evXbMYvwX5zWAmdQJHWhn1MDSEHBlXd5SX9GC1cpf+JZFxpeh
         lRbKmscAtYCT4+CRsscHx3LfP1c7XVmflgnGRK7VBe/z4qJ/LZtHqN7j3rIj5nRIWPij
         UoR+5XLQhq/BTBgDiTjuukKizL4qewnb8AODc7A7oSZw9hEGI63LyZlZMbucDXrUfaWs
         bAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiO5TV0bwTKJtEwFyHk1KmMv4NJpSMLcyyEMsZ+nsFU=;
        fh=RaN5FZ2twRGpLQxOkH9ohInF56Ivt7xnO3PD4DDjxxU=;
        b=DjYhRXyQ33cHqYA/6b3RhmZAMCsMFmKaWEwS4Wlf1qPEXwmRruompwcwSRTTF+yih9
         6SGcFAjeLvMs6kxAMvMf9iEG9EUqPXOLToLVg1u0kbKTtaZBTt7hbLu3yggHPc2cjxw/
         iEPzOms9FKTN+6MphJ3uKxF9ufUnF0gNscBrZbEavo9/kSGA7uEgWUpolwoJysZdL2T7
         WYPM6XqfAU87LEXVO9blPGcWuq1lxMNB+anADCDiqhOiZwaPsW+YBEwcy0RC6daf8BEZ
         WNCh1p9VbubMhkP9syefk6sthjq/fNIbzdn3utSvnXNnxu4Jx8XGcP2AhjhW849iul3e
         n1qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789172469; x=1789777269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yiO5TV0bwTKJtEwFyHk1KmMv4NJpSMLcyyEMsZ+nsFU=;
        b=cZSf2oyg4vqiJK0oNy50rXu7Jdi3uqS8aZvYiQIlLc/qxPEWvjTVfufbD9OTukguL7
         qQ5LApi3yKUwLbId667EXHstaKGLILbkBz8ky0A6xOPmjteCMsQngj913YUJ+IJcqGk8
         rjyCbvfFV7UzhT9v8KoSDGxOnISMEpz564WVVnU43I2rksvOqmprMplcx/hkq1dKqCU+
         iJbS32sAvVCZ1kTFmbNAf3XEHmZkVauTMpJ6RJYxDqvdWldEhOS4rM21Fcy/o9xpXwtZ
         qtIx4BuESVdYTnw6mJB48hYWd/OODiE7u2gaVMtr0BYqa37236BKmiYfcTwcrQqCGar6
         8GDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789172469; x=1789777269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiO5TV0bwTKJtEwFyHk1KmMv4NJpSMLcyyEMsZ+nsFU=;
        b=GEiZMKK2IsDkl2ub64R0YtSxUpL3WWBfRB9ZFYlkHPGEERtG36ZG2XIyAL9CzYrGNr
         mmL8EJYWqugRvv1w2sqeQMKwfpym2hEX1Cf4Lsh3s0OcgTUJJOfUzC5Hu3wYOt3zT5iU
         gTE/+a0Ap2ZcyLhjiNWnjt3jWIPtrGbFAUr0a1+qDxG5+0e+/cU3MAXPrO48DoNTzE+h
         pITStYj/l8JuPd8zYS5gUfBYUXgngEoNvpRSU+WDeNSCgdKNTPe6rxd4Fz7zgVj6cDOQ
         tBg0ZxgN7qQX+xEbu5I8XYn9vdO94f4/K35y1mO6mg43i5e6VeJwwxIVLRLIV2dZpvvz
         u3qQ==
X-Forwarded-Encrypted: i=1; AKwUvByHUUF8a+puF5AXMJDlt9uoTQLCsfJ8NXAUupuaI90/vzfY5TozbBjhis5TVUXQJIJdbSqGh4HiW55tLzg=@vger.kernel.org
X-Gm-Message-State: AFuF++l3PS6quY125tkIG/Pno+ii1C/WWlgJazxJMRPYkJ3Wr9H52n4m
	4JF7a2ezBpDEDoa4xGhyoW9/1i5/EuaNcgJzFFY1G3PrTn8LIs4Kse/fyiOJN8tEKm6sSZi5YyM
	kCheT64dchmtyMYEXWSRPeOUoCWG+2oo=
X-Gm-Gg: AYBFou2FMFeLkiUfVDb3Mye+8kG/nC3j5T5omzG308DccfraXSKWw2hNgbb4J1igSkQ
	j/7Aua7dwihAmuDeEigzm/nC3+Hv/iJQT4XY/v5jxInr8Q9RMGPsZL7HhjQS+RvfQrL1agBMnwl
	XqY3X8MH5w+4Ki7zKTymnz/oJ5ozSeI4EQk/Qrs3zNWjllNfW67irc1vOdzKy9tI0YaB6K8X122
	Jbf9QIjKxoypmBBnw8tVhvgBwzOWLNceQ8/u0AXB/sJaSBFDs5YTb2hEP0+O+TaydYm/wujPabT
	Npr1Er/rlOw8OMUsN+nQAv2aeeY/XfgFrcUNZXAuS8Bz+0snCLccGAFJ2jiuqU+XPWiWtSx7Jdn
	rgTMQDOelfrMECrKjtANI6yKM/CebkBenXOVXLSg=
X-Received: by 2002:a17:902:cec3:b0:2db:5f00:ff52 with SMTP id
 d9443c01a7336-2dd2a45c363mr109249375ad.22.1789172469306; Fri, 11 Sep 2026
 17:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819122252.1782790-1-florent.revest@linux.dev>
 <DL27QZ6SEZKT.1CV2HAX4A3WI4@gmail.com> <CAADnVQLxi-R1KDUXJJjpq69SpV8UcNJVqBi7uicO=V0WhAvyQA@mail.gmail.com>
 <DL2S878KSOI5.1SZMLIAWMCNUJ@gmail.com> <DL3FIBQNP6AU.1HO08FMI292UX@linux.dev>
 <CAADnVQLMm43qJxuiHUuuh51wAL4kH0+fRoaM7YfbZEXT7LHn0A@mail.gmail.com>
 <DL4R2YXF9J8G.203VBANYFFSET@linux.dev> <CAADnVQJ+OJKmgaDM9B58g30M_-pkZgGmbDuvEWmrg8U_ZkxbSg@mail.gmail.com>
 <DL57W17T3VEC.1EJMWXYOB7JFU@linux.dev> <CAADnVQJLNW=FqPrWq7MX28iA_Qsw_N1mT923WrVkoqES1ZArjA@mail.gmail.com>
In-Reply-To: <CAADnVQJLNW=FqPrWq7MX28iA_Qsw_N1mT923WrVkoqES1ZArjA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 11 Sep 2026 17:20:57 -0700
X-Gm-Features: AcwNN1VKgqAgYGqyMG-DgnJAxbrComiDzG6Y23_NRHjcQt0zpiMmYJ15gSn1F6k
Message-ID: <CAADnVQJfvKmtD=jcOjaYaNAcfmujQm_oE7oNefTGiAAbTFj4Jg@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Keep progs alive until the trampoline image
 calling them is freed
To: Florent Revest <florent.revest@linux.dev>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	John Fastabend <john.fastabend@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jose Fernandez <jose.fernandez@linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 5:48=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Let's extend ip_after_call concept.
> Instead of using a single NOP after the call to skip fexit progs
> let's add NOPs in front of every invoke_bpf() including fentry and fmod_r=
et.
>
> Then on tramp destroy patch all nop-s to jmp epilogue.
>
> llm-s helped me realize that fentry has the same issue.
> fentry prog A can sleep
> while non-sleepable fentry prog B can detach and things will crash.

Florent,

are you planning to respin with the above fix or should I ask my clanker ?
